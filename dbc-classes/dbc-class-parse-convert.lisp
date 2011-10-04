;;; :FILE-CREATED <Timestamp: #{2011-01-07T13:22:46-05:00Z}#{11015} - by MON>
;;; :FILE ../dbc-classes/dbc-class-parse-convert.lisp
;;; ==============================


(in-package #:dbc)
;; *package*


;;; ==============================
;;; :CLASSES
;;; ==============================

;; :NOTE This is the base class from wich other converted dbc-classes inherit.
;;      The intent is that this class should allow auxillary :before :after :around
;;      methods to act on the primary-methods of `parsed-class' inheritors.
;;      IOW, this your basic mixin base class :)

(defclass parsed-class (base-dbc)
  ;; :NOTE Which other slots accessors and generics should this class establish?
  ()
  (:documentation "Base dbc parsed class."))

(defclass parsed-naf-entity (parsed-class)
  ()
  (:documentation #.(format nil "Base class for parsing naf-entity records.~%~@
:SEE-ALSO `parsed-artist-record', `parsed-author-record',~%~
`parsed-person-record', `parsed-brand-record', `parsed-publication-record'.~%▶▶▶")))

;; :NOTE Superclass `parsed-naf-entity' needs following generics specialized on it.
;; As they common to multiple naf-entity sub-classes:
;;  `parsed-artist-record' `parsed-author-record' `parsed-person-record'
;;  `parsed-brand-record' `parsed-publication-record'
;;
;;  GENERIC                        ->    CLASS-SLOT
;;  ---------------------------------------------------------------------------- 
;; `naf-entity-display-name-coref' -> `naf-entity-artist-display-name-coref'

;; `naf-entity-gender-type'       -> `naf-entity-gender-type'
;; `lifespan-date' -> `lifespan-date'
;; `birth-date' -> `birth-date'
;; `death-date' -> `death-date'
;; `location-birth' -> `location-birth'
;; `location-death' -> 
;; `location-nationality' -> 
;; `control-id-db-0' -> `control-id-db-0'
;; `control-id-db-1' -> `control-id-db-1'
;; `naf-entity-author-coref'      -> `naf-entity-author-coref'
;; `naf-entity-person-coref'      -> `naf-entity-author-coref'
;; `naf-entity-publication-coref' -> `naf-entity-publication-coref'
;; `naf-entity-brand-coref'       -> `naf-entity-brand-coref'
;; `image-default-id'
;; `image-default-xref'
;; `naf-entity-active'
;; `edit-by'
;; `edit-by-creator'
;; `edit-date-origin'
;; `edit-date'

;; description-artist-note-general
;; description-artist-note-sale-appearance
;; `base-description-entity-internal'



;; 
;; 
;; 

;; control-id-display-artist, control-id-display-publication
;; control-id-doc-num-artist, control-id-doc-num-publication
;; control-id-entity-num-publication, 

;; naf-entity-role-appearance-coref


;;; ==============================
;;; :FUNCTIONS
;;; ==============================

(defvar *regexp-whitespace-chars*
  #.(format nil "[~{~C~}]" mon:*whitespace-chars*))

;; (deftype preprocess-simple-string (&optional size)
;;   ;; (typep "string" '(preprocess-simple-string 6))
;;   ;; (typep "string" 'preprocess-simple-string)
;;   (let ((sz (list (or size '*))))
;;     `(simple-array character ,sz)))

(defun preprocess-whitespace (field-name)
  (declare (type simple-string field-name))
  (cl-ppcre:regex-replace-all (the (simple-array character (9)) *regexp-whitespace-chars*)  field-name ""))

(declaim (inline preprocess-leading-trailing-dashes))
(defun preprocess-leading-trailing-dashes (field-name)
  (declare (type simple-string field-name)
           (optimize speed))
  ;;(mon:string-replace-all  field-name  "_" "" )
  (string-trim "_- " field-name))

(declaim (inline preprocess-underscore-to-dash))
(defun preprocess-underscore-to-dash (field-name)
  (declare (type simple-string field-name)
           (optimize speed))
  (setf field-name (preprocess-leading-trailing-dashes field-name))
  (nsubstitute #\- #\_ field-name))

;; (string= (preprocess-underscore-to-dash "Lots_of_underscores_") "Lots-of-underscores")

(declaim (inline preprocess-string-case))
(defun preprocess-string-case (field-name)
  (declare (type simple-string field-name)
           (optimize speed))
  ;; :NOTE using `cl:nstring-upcase', call after something that returns a copy of string.
  (nstring-upcase field-name))

(defun make-parsed-name-preprocess (field-name &key prefix-w suffix-w)
  (declare (type string field-name)
           ((or null string)  prefix-w suffix-w)
           (inline preprocess-underscore-to-dash
                   preprocess-leading-trailing-dashes
                   preprocess-string-case))
  (let ( ;; CL:COPY-SEQ so we're sure we don't destructively modidfy eslewhere.
        (rslt (copy-seq field-name))
        (pfx  (and prefix-w 
                   (mon:string-not-empty-p prefix-w )
                   (concatenate 'string (make-parsed-name-preprocess prefix-w) "-")))
        (sfx  (and suffix-w 
                   (mon:string-not-empty-p suffix-w)
                   (concatenate 'string "-" (make-parsed-name-preprocess suffix-w)))))
    (declare (type simple-string field-name))
    (setf rslt (preprocess-whitespace rslt))
    (setf rslt (preprocess-underscore-to-dash rslt))
    (setf rslt (preprocess-leading-trailing-dashes rslt))
    (setf rslt (preprocess-string-case rslt))
    (setf rslt (concatenate 'string pfx rslt sfx))))

;; (defun preprocess-slot-to-defclass-slot () (...) )
(defun preprocess-slot-transform (field-name field-name-transform-table &key prefix-w suffix-w)
  (declare (string field-name))
  (let* ((chk-is-hash (mon:hash-or-symbol-p field-name-transform-table))
         (chk-hash (ecase (hash-table-test chk-is-hash)
                     (equal chk-is-hash)))
         (get-transform (gethash field-name (the hash-table chk-hash))))
    (declare (hash-table chk-hash))
    (or (and get-transform 
             (or (and (string= get-transform
                               (make-parsed-name-preprocess field-name :prefix-w prefix-w :suffix-w suffix-w))
                      get-transform)
                 (setf get-transform (make-parsed-name-preprocess field-name :prefix-w prefix-w :suffix-w suffix-w)))
             (setf (gethash field-name chk-hash) get-transform))
        (setf (gethash field-name chk-hash) 
              (make-parsed-name-preprocess field-name :prefix-w prefix-w :suffix-w suffix-w)))))

;;; ==============================
;; :SOURCE quicklisp/quicklisp/dist.lisp :WAS `config-file-initargs'
;; Modeled after `config-file-initargs' but use functions frome mon: package instead of quicklisp centric ones.
;; Useful for reading in key value pairs from file by line use `mon:make-keyword-sanely'
;; (defun read-key-val-args-from-file (file)
;;   (let ((key-val-prs '())) 
;;     (for-each-line (line file)
;;       (unless (ignorable-line line)
;;         (destructure-line (key-word val)
;;             line
;;           (let ((keyword (initarg-keyword (string-right-trim ":" key-word))))
;;             (push value key-val-pr)
;;             (push keyword key-val-pr)))))
;;     key-val-prs))

;;; ==============================
;; alexandria:symbolicate alexandria:format-symbol alexandria:make-keyword
(defun make-parsed-class-slot-init-accessor-name (named-class parsed-field &optional prefix-initarg-w)
  ;; (make-parsed-class-slot-init-accessor-name "parsed-fef" "keyword_type" "INIT")
  ;;  => ("KEYWORD-TYPE" "INIT-KEYWORD-TYPE" "PARSED-FEF-KEYWORD-TYPE")
  ;;     ( <SLOT>         <INIT>              <ACCESSOR> )
  (declare (string named-class parsed-field)
           ((or null string) prefix-initarg-w))
  (let* ((slot     (field-name-underscore-to-dash parsed-field))
         (init
          (or (and (stringp prefix-initarg-w)
                   (concatenate 'string (string-upcase prefix-initarg-w) "-" slot))
              slot))
         (access   (format nil "~A-~A" (string-upcase named-class) slot)))
    (list slot init access)))


;; (make-parsed-class-slot-init-accessor-name "parsed-class" "ref" )

;; (               <TRANSFORM> 
;; ( <FIELD-NAME>  <RENAME-TO>  (<INITP> <INIT-PFX>) )

;; These need to something more generalized versions:
;; `make-ref-maker-sym-name' ->  `make-parsed-sym-slot-name'
;; `make-ref-maker-symbol'   ->  `make-parse-slot-symbol'    ;; using `alexandria:symbolicate'/`alexandria:make-keyword'
;; `make-ref-lookup-table'   ->  `make-parsed-lookup-table'

;; (defun make-parsed-sym-slot-name (slot-string-name)
;; (alexandria:symbolicate 
;; (alexandria:symbolicate  (sb-int:sane-package)

;; (alexandria:symbolicate  "make-parsed-class-slot-init-accessor-name" 
;; (mon::find-package*
;; (mon:where-is-local "make-parsed-class-slot-init-accessor-name")

;;; (unintern 'is-bubba)
;; (read-from-string "is-bubba")
;; (mon:where-is-local "is-bubba")


;;; ==============================
;; :TODO Use alexandria:symbolicate alexandria:format-symbol alexandria:make-keyword alexandria:symbolicate
;;  to process return value of make-parsed-class-slot-init-accessor-name at loadtime to generate 
;;  <slot> :initarg <ACCESSOR> 
;; symbols for <CLASS> in <PACKAGE> 
;; Define classe _AFTER_ pushing the return  values onto a hashtable.
;;
;; :NOTE Use `mon:string-case' for this.


;;; ==============================
;;; Interface for the xml->parse-class->hash-table->file conversion
;;; ==============================

;;; ==============================
;; :NOTE `load-sax-parsed-xml-file-to-parsed-class-hash' now has parameter
;; KEY-ACCESSOR which was orignally named PRIMARY-KEY-FUN and provided a
;; somewhat different interface which allowed passing an anonymous function
;; instead of a slot-accessor e.g.:
;;  (load-sax-parsed-xml-file-to-parsed-class-hash <PARSED-CLASS> 
;;                                                 <INPUT-FILE> 
;;                                                 <HASH-TABLE>
;;                                                #'(lambda (x) (cdr (assoc "ref" x :test 'string=))))
;; We've kept the orignal as commented as the alternative semantics may be prove useful in the future.
;;
;; (defun load-sax-parsed-xml-file-to-parsed-class-hash (parsed-class input-file hash-table primary-key-fun) 
;;   (with-open-file (fl input-file :direction :input :element-type 'character :external-format :UTF-8)
;;     (loop
;;        for x = (read fl nil 'EOF)
;;        until (eql x 'EOF)
;;        do (loop 
;;              with obj = (make-instance parsed-class)
;;              for (field . val) in x
;;              for ref = (funcall primary-key-fun x) ;; (cdr (assoc "ref" x :test 'string=))
;;              do (set-parsed-inventory-record-slot-value field val obj)
;;              finally (setf (gethash ref hash-table) obj))
;;        finally (return (values hash-table (hash-table-count hash-table))))))
;;
(defun load-sax-parsed-xml-file-to-parsed-class-hash (&key parsed-class input-file hash-table key-accessor slot-dispatch-function)
  ;; Arg PARSED-CLASS a symbol designating the class we are parsing.
  ;; Arg INPUT-FILE the file containing field/value consed pairs.
  ;; Arg HASH-TABLE the hash-table to insert the class object to. 
  ;; Its `cl:hash-table-test' should be appropriate for use with the type of
  ;; return value of KEY-ACCESSOR, e.g. if KEY-ACCESSOR returns a string the
  ;; `cl:hash-table-test' should be `cl:equal' or `cl:equalp'. whereas if
  ;; KEY-ACCESSOR returns a symbol then `cl:eql' will suffice.
  ;; Arg KEY-ACCESSOR names an accessor function which returns the primary key for the parsed table
  ;; it return value will becomes a hash-table KEY associating PARSED-CLASS in HASH-TABLE.
  ;; As such, it should return always return a non-null value. If not the results are undefined.
  ;; Arg SLOT-DISPATCH-FUNCTION is a function utilizing
  ;; `string-case:string-case' to map strings to an appropriate accesor
  ;; e.g. `set-parsed-artist-record-slot-value', `set-parsed-inventory-record-slot-value', etc.
  ;; :EXAMPLE
  ;; (defparameter *tt--parse-table* (make-hash-table :test 'equal))
  ;; (let ((parsed-sax-file (merge-pathnames 
  ;;                         (make-pathname :directory `(:relative ,(sub-name *xml-output-dir*))
  ;;                                        :name (concatenate 'string "sax-refs-test-" (mon:time-string-yyyy-mm-dd))
  ;;                                        :type "lisp")
  ;;                         (system-path *system-path*))))
  ;;   (write-sax-parsed-xml-to-file
  ;;    :input-file  (merge-pathnames (make-pathname :name "dump-refs-DUMPING")
  ;;                                  (sub-path *xml-input-dir*))
  ;;    :output-file parsed-sax-file)
  ;;   (load-sax-parsed-xml-file-to-parsed-class-hash :parsed-class 'parsed-inventory-record  
  ;;                                                  :input-file parsed-sax-file
  ;;                                                  :hash-table  *tt--parse-table*
  ;;                                                  :key-accessor  #'item-number
  ;;                                                  :slot-dispatch-function #'set-parse-ref-slot-value))
  ;;                        
  ;; ;; => #<HASH-TABLE  ... >, 8969
  ;; (clrhash *tt--parse-table*)
  ;; :NOTE For use with output of `write-sax-parsed-xml-refs-file'.
  ;; `write-sax-parsed-xml-refs-file'
  ;; :SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-slots',
  ;; `write-sax-parsed-slots-to-file', `write-sax-parsed-class-hash-to-files'.~%▶▶▶")
  (with-open-file (fl input-file
                      :direction :input 
                      :element-type 'character
                      :external-format :UTF-8)
    (loop
       for x = (read fl nil 'EOF)
       until (eql x 'EOF)
       do (loop 
             with obj = (make-instance parsed-class)
             for (field . val) in x
             do (funcall slot-dispatch-function field val obj)
             finally (setf (gethash (funcall key-accessor obj) hash-table) obj))
       finally (return (values hash-table (hash-table-count hash-table))))))

(defun print-sax-parsed-slots-padding-format-control (object)
  ;; Return a format-control string for printing the slots of OBJECT with
  ;; padding adjusted according to the longest symbol-name of its slots.
  ;; Helper function for use with:
  ;; `print-sax-parsed-slots'
  ;; `write-sax-parsed-slots-to-file', 
  ;; `write-sax-parsed-class-hash-to-files'
  ;; (print-sax-parsed-slots-padding-format-control (make-instance 'parsed-inventory-record))
  (format nil "~~&(~~{~~{:~~~D:A~~S~~}~~^~~%~~})" 
          (+ 
           (reduce #'max 
                   (map 'list #'(lambda (x) (length (string x)))
                        (mon:class-slot-list object)))
           4)))

;; :NOTE There is nothing preventing us from making this the generalized
;; interface for printing sax parsed slots it is not specific to the class
;; `parsed-inventory-record'.
;;
;; (fundoc 'print-sax-parsed-slots
;; Keyword PRINT-UNBOUND is a boolean.
;; When t (the default) and a slot of OJBECT's is not `cl:slot-boundp' print its slot-value as "#<UNBOUND>".
;; When null and OJBECT's a slot is not `cl:slot-boundp' print its slot-value as NIL. 
;; The later is useful when serializing an object to a file b/c the de-serialzed
;; OBJECT will have its slot :initarg intialized to nil which is what we've done elswhere for this class
;; :SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-slots',
;; `write-sax-parsed-slots-to-file', `write-sax-parsed-class-hash-to-files'.~%▶▶▶")
(defun print-sax-parsed-slots (object &key stream (print-unbound t) (pre-padded-format-control nil))
  (declare (type parsed-class object)
           (type (or string null) pre-padded-format-control)
           (type boolean print-unbound))
  (let ((calculate-padding (if pre-padded-format-control
                               pre-padded-format-control
                               (print-sax-parsed-slots-padding-format-control object))))
    (format stream calculate-padding ;; "~&(~{~{:~26:A~S~}~^~%~})"
            (loop 
               with unbound = (when print-unbound "#<UNBOUND>")
               for slot-chk in (mon:class-slot-list object)
               for x = (slot-boundp object slot-chk)
               if x
               nconc (list (list slot-chk (slot-value object slot-chk))) into rtn 
               else  
               nconc (list (list slot-chk unbound)) into rtn
               finally ;;(format stream "~&(~{~{:~26:A~S~}~^~%~})" rtn)))
               (return rtn)))))



;; (fundoc 'write-sax-parsed-slots-to-file
;; Write a list of the slot/value pairs of OBJECT to a file in OUTPUT-DIRECTORY.
;; Each slot/value pair is written in such a way that the list may be read and
;; passed to `cl:make-instance' to re-instantiate the instance.
;; Arg SLOT-FOR-FILE-NAME is a symbol, e.g. 'item-number, 'control-id-entity-num-artist, etc.
;; If it satisfies `cl:slot-exists-p', `cl:slot-boundp' and `cl:slot-value' its
;; value is used as the suffix for a file name, if not an error is signaled.
;; Arg PREFIX-FOR-FILE-NAME is a string, e.g. "item-number", "artist-enity-num", etc.
;; It is combined with `cl:slot-value' of SLOT-FOR-FILE-NAME when makeing a pathname to write OBJECT to. 
;; When a string is provided it should not contain a trailing #\-.
;; If PREFIX-FOR-FILE-NAME is null the `cl:string' representation of SLOT-FOR-FILE-NAME is used instead.
;; :EXAMPLE
;; (write-sax-parsed-slots-to-file 
;;  *tt--item* 'item-number \"item-number\"
;;  :output-directory (merge-pathnames #P"individual-parse-refs-2011-10-01/" (sub-path *xml-output-dir*)))
;; :SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-slots',
;; `write-sax-parsed-slots-to-file', `write-sax-parsed-class-hash-to-files'.~%▶▶▶")
(defun write-sax-parsed-slots-to-file (object &key slot-for-file-name 
                                                   prefix-for-file-name
                                                   output-directory 
                                                   (directory-exists-check t)
                                                   (pre-padded-format-control nil))
  (declare  (parsed-class object)
            (type (and symbol (mon::not-null)) slot-for-file-name)
            (type (or mon:string-not-empty null) prefix-for-file-name)
            (boolean directory-exists-check))
  (when directory-exists-check
   (unless (equal output-directory
                  (make-pathname :directory (pathname-directory (probe-file output-directory))))
     (error "arg OUTPUT-DIRECTORY does not designate a valid directory~% got: ~S~%"
            output-directory)))
  (let* ((slot-value-if (and (slot-exists-p object slot-for-file-name) ;; 'item-number
                            (slot-boundp   object slot-for-file-name)
                            (slot-value    object slot-for-file-name)))
        (slot-value-if-stringp (or (and slot-value-if
                                        (stringp slot-value-if)
                                        slot-value-if)))
        (slot-value-to-file-name (and slot-value-if-stringp
                                      (merge-pathnames 
                                       (make-pathname :name (concatenate 'string 
                                                                         (or prefix-for-file-name
                                                                             (string slot-for-file-name))
                                                                         "-"
                                                                         slot-value-if-stringp))
                                       output-directory)))
        (calculate-padding (if pre-padded-format-control
                               pre-padded-format-control
                               (print-sax-parsed-slots-padding-format-control object))))
    (if slot-value-to-file-name
        (with-open-file (fl slot-value-to-file-name
                            :direction :output 
                            :if-does-not-exist :create
                            :if-exists :supersede
                            :external-format :UTF-8)
          (format nil ";;; :CLASS `~A'' ~A ~A ~%;;; :FILE-CREATED  ~A~%"
                  (string-downcase (class-name (class-of object)))
                  slot-for-file-name
                  slot-value-if-stringp
                  (mon:timestamp-for-file))
          (print-sax-parsed-slots object :stream fl :print-unbound nil :pre-padded-format-control calculate-padding)
          slot-value-to-file-name)
        (progn
          (warn "~%Something wrong with arg OBJECT, declining to dump to file~%")
          nil))))

;; (fundoc 'write-sax-parsed-class-hash-to-files
;; :EXAMPLE
;; (write-sax-parsed-class-hash-to-files 
;;  <HASH-TABLE> :parse-class <PARSED-CLASS> :slot-for-file-name 'item-number :prefix-for-file-name "item-number"
;;  :output-directory (merge-pathnames #P"individual-parse-refs-2011-10-01/" (sub-path *xml-output-dir*)))
;; :SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-slots',
;; `write-sax-parsed-slots-to-file', `write-sax-parsed-class-hash-to-files'.~%▶▶▶")
(defun write-sax-parsed-class-hash-to-files (hash-table &key parsed-class
                                                             slot-for-file-name
                                                             prefix-for-file-name
                                                             output-directory)
  (declare (type hash-table hash-table)
           (type (and symbol (mon::not-null)) slot-for-file-name parsed-class)
           (type (or mon:string-not-empty null) prefix-for-file-name))
  (unless (equal output-directory
                 (make-pathname :directory (pathname-directory (probe-file output-directory))))
    (error "arg OUTPUT-DIRECTORY does not designate a valid directory~% got: ~S~%"
           output-directory))
  (let ((calculate-padding (print-sax-parsed-slots-padding-format-control (make-instance parsed-class))))
    (maphash #'(lambda (k v)
                 (declare (ignore k) 
                          (parsed-class v))
                 (write-sax-parsed-slots-to-file v 
                                                 :slot-for-file-name slot-for-file-name 
                                                 :prefix-for-file-name prefix-for-file-name
                                                 :output-directory output-directory
                                                 :directory-exists-check nil
                                                 :pre-padded-format-control calculate-padding))
             hash-table)))

;; Next we need to map the hash-table values and for each object and each slot
;; of object clean up the crap in the fields.
;;
;; One way to do this is to build mapping functions that dump all instances
;; slot-values for a particular slot to a hast-table and then inspect these
;; manually.


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
