;;; :FILE-CREATED <Timestamp: #{2011-01-07T13:22:46-05:00Z}#{11015} - by MON>
;;; :FILE ../dbc-classes/dbc-class-parse-convert.lisp
;;; ==============================


(in-package #:dbc)
;; *package*

;;; ==============================
;; :EXAMPLE
;; (def-set-parsed-class-record-slot-value
;;     set-parsed-inventory-record-slot-value              ; FUN-NAME
;;     parsed-inventory-record                             ; PARSED-CLASS 
;;   *big-parsed-class-field-slot-accessor-mapping-table*) ; GLOBAL-HASH-TABLE-VAR
;;
;; :TODO incorporate original fundoc of `set-parsed-inventory-record-slot-value' with new macro.
;;
;; (fundoc 'set-parsed-inventory-record-slot-value
;; "Map orginal sql tables FIELD-STRING name to OBJECT's CLOS slot equivalent setting its slot-value to FIELD-VALUE.~%~@
;; Return as if by `cl:values':~%
;;  - nth-value 0 is the setf'd FIELD-VALUE as set with slot accessor corresponding to FIELD-STRING.
;;  - nth-value 1 is OBJECT~%~@
;; For use with `load-sax-parsed-xml-file-to-parsed-class-hash' after reading in
;; XML files parsed with `write-sax-parsed-xml-refs-file'.~%~@
;; OJBECT is an instance of class `parsed-inventory-record'.~%~@
;; Original FIELD-STRING is the car of the the consed key/value pairs in one of the alists 
;; written to an output file by `write-sax-parsed-xml-refs-file' FIELD VALUE is
;; the corresponding cdr of the consed key/value pair.~%~@
;; The slot documentation of the class `parsed-inventory-record' provides indication of the
;; mapping from the original field name to our new slot name.~%~@
;; :EXAMPLE
;;  (set-parsed-inventory-record-slot-value "ref" "13000" (make-instance 'parsed-inventory-record))
;;
;; :SEE-ALSO `<XREF>'.~%▶▶▶")
;; 
;; :NOTE The setf of the accessor ensures we always populate the slot-value with nil
;; so as to avoid errors when slot is not `slot-boundp'.
;; 
;; :TODO Currently these accessor methods are defined automagically at class creation.
;; We need to unify common routines and symbol-names to appropriate generic
;; functions and where the behavior is generalized across all class specialize
;; them on the class `parsed-class'.
;;
(defmacro def-set-parsed-class-record-slot-value (fun-name parsed-class) ; global-hash-table-var)
  ;; (let ((body-forms (%expand-parsed-class-record-setf-slot-value-forms parsed-class global-hash-table-var)))
  ;; (%expand-parsed-class-record-setf-slot-value-forms parsed-class global-hash-table-var)  
  (let ((body-forms (%parsed-class-record-setf-slot-value-forms parsed-class)))
    `(defun ,fun-name (field-string field-value object)
       (values 
        (string-case:string-case (field-string)
          ,@body-forms)
          object))))

;; :NOTE Arg HASH-TABLE will always be `*big-parsed-class-field-slot-accessor-mapping-table*'
;; But, lets not hardwire a global variable just in case!
;; :EXAMPLE
;; (%parsed-class-record-setf-slot-value-forms 'parsed-inventory-record *big-parsed-class-field-slot-accessor-mapping-table*)
(defun %parsed-class-record-setf-slot-value-forms (parsed-class-lookup); hash-table)
    ;; :NOTE This version with explicit call to HASH-TABLE and with backquoted template.
    ;; (let ((setf-forms ()))
    ;;   (maphash #'(lambda (k v) (push `(,k (setf (,v object) field-value)) setf-forms ))
    ;;            (field-to-accessor-table (gethash parsed-class-lookup *big-parsed-class-field-slot-accessor-mapping-table*)))
    ;;   (setf setf-forms (nreverse setf-forms))))
    (let ((setf-forms ()))  
      (maphash #'(lambda (k v)
                   (push (list k (list (quote setf) (list v (quote object)) (quote field-value))) setf-forms))
               (field-to-accessor-table (gethash parsed-class-lookup 
                                                 *big-parsed-class-field-slot-accessor-mapping-table*)))
                                                 ;; hash-table)))
      (setf setf-forms (nreverse setf-forms))))


;;; ==============================
;;; :CLASSES
;;; ==============================

(defgeneric field-to-accessor-table (object)
  (:documentation "Return a hash-table mapping field-names to slot-accessor for object.~%"))

(defgeneric accessor-to-field-table (object)
  (:documentation "Return a hash-table mapping field-names to slot-accessor for object.~%"))

(defgeneric parsed-class-mapped (object)
  (:documentation 
   "Return a symbol naming the class mapped by the hash-tables of slots:~%~% ~
accessor-to-field-table and field-to-accessor-table."))

(defclass parsed-class-field-slot-accessor-mapping (base-dbc)
  ((parsed-class-mapped
    :reader parsed-class-mapped)
   (field-to-accessor-table
    :reader field-to-accessor-table)
   (accessor-to-field-table
    :reader accessor-to-field-table))
  (:documentation 
   #.(format nil
             "Object for holding a mappings of field-names with slot-accessors.~%~@
slot parsed-class-mapped is symbol designating the parse-class whose slots are
mapped by hash-tables in slots accessor-to-field-table and
slot-accessor-field-name-table.~%~@
Slot field-to-accessor-table is a hash-table mapping from:~%~% ~
  field-name (a string) to slot-accessor \(a symbol)
Its `cl:hash-table-test' is `cl:equal'.~%~@
Slot accessor-to-field-table is a hash-table with an inverse mapping from:~%~% ~
 symbol to field-name~%~
Its `cl:hash-table-test' is `cl:eql'.~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")))

;; Return an instance of class `parsed-class-field-slot-accessor-mapping'.~%~@
;; Arg PARSED-CLASS-MAPPED is a symbol designating a class which subclasses `parsed-class'.
;; Arg FIELD-TO-ACCESSOR-ALIST is an alist used to map the hash-tables of slots
;; field-to-accessor-table and accessor-to-field-table.
;; The car of each elt of FIELD-TO-ACCESSOR-ALIST is a string designating a field-name.
;; The cdr is a symbol designating an slot-accessor of class PARSED-CLASS-MAPPED.~%~@
;; :EXAMPLE
;; (let ((example-object (make-parsed-class-field-slot-accessor-mapping
;;                        'parsed-naf-entity
;;                        '(("categ" . category-entity-0-coref)))))
;;   (values
;;    (gethash
;;     (gethash "categ" (field-to-accessor-table example-object))
;;     (accessor-to-field-table example-object))
;;    (gethash
;;     (gethash 'category-entity-0-coref (accessor-to-field-table example-object))
;;     (field-to-accessor-table example-object))
;;    (parsed-class-mapped example-object)))
;;
;; :NOTE As above, the are GLOBAL-HASH-TABLE-VAR will always be `*big-parsed-class-field-slot-accessor-mapping-table*'
(defun make-parsed-class-field-slot-accessor-mapping (parsed-class-mapped field-to-accessor-alist); global-hash-table-var)
  (unless (and (not (typep parsed-class-mapped 'boolean))
               (subtypep (find-class parsed-class-mapped) (find-class 'parsed-class)))
    (error "Arg PARSED-CLASS-MAPPED not a valid subtype of class `parsed-class'"))
  (let* ((mapping            (make-instance 'parsed-class-field-slot-accessor-mapping))
         (table-length-maybe (mon:prime-or-next-greatest  (length field-to-accessor-alist)))         
         (table-size         (if (> table-length-maybe sb-impl::+min-hash-table-size+)
                                 table-length-maybe
                                 sb-impl::+min-hash-table-size+))
         (f2a-table  (setf (slot-value mapping 'field-to-accessor-table)
                           (make-hash-table :test #'equal :size table-size)))
         (a2f-table  (setf (slot-value mapping 'accessor-to-field-table)
                           (make-hash-table :size table-size))))
    (dolist (pair field-to-accessor-alist (mon:hash-invert-key-val f2a-table a2f-table))
      (setf (gethash (car pair) f2a-table) (cdr pair)))
    ;; Bind slot-value of parsed-class-mapped last. No reason binding it earler
    ;; as the hash-mapping stuff above might error.
    ;; If PARSED-CLASS-MAPPED is already in our big global table we remove it as
    ;; it may non longer be current.
    (remhash (setf (slot-value mapping 'parsed-class-mapped) parsed-class-mapped)
             *big-parsed-class-field-slot-accessor-mapping-table*)
    ;;(setf (gethash parsed-class-mapped global-hash-table-var) mapping)))
    (setf (gethash parsed-class-mapped *big-parsed-class-field-slot-accessor-mapping-table*) mapping)))


;; (defun print-parsed-class-field-slot-accessor-mapping (object stream)
;;   (format stream "~%:PARSED-CLASS-MAPPED     ~S ~S~%:FIELD-TO-ACCESSOR-TABLE ~S~%:ACCESSOR-TO-FIELD-TABLE ~S~%"
;;           (slot-value object 'parsed-class-mapped)
;;           (find-class (slot-value object 'parsed-class-mapped))
;;           (field-to-accessor-table object)
;;           (accessor-to-field-table object)))
;;
(defmethod print-object ((object parsed-class-field-slot-accessor-mapping) stream)
  ;;(remove-method  #'print-object (find-method #'print-object nil '(parsed-class-field-slot-accessor-mapping t)))
  (print-unreadable-object (object stream) ; :type t) 
    (format stream "HASH-MAPPED-CLASS ~S" (slot-value object 'parsed-class-mapped))))

;; :NOTE This is the base class from wich other converted dbc-classes inherit.
;;       The intent is that this class should allow auxillary :before :after :around
;;       methods to act on the primary-methods of `parsed-class' inheritors.
;;       IOW, this your basic mixin base class :)
(defclass parsed-class (base-dbc)
  ;; :NOTE Which other slots accessors and generics should this class establish?
  ()
  (:documentation "Base dbc parsed class."))

;; (remove-method #'parsed-class-mapped (find-method #'parsed-class-mapped nil '(parsed-class)))
(defmethod parsed-class-mapped ((object parsed-class))
  ;; (let* ((objects-class  (class-of object))
  ;;        (subclass-check (or (subtypep objects-class (find-class 'parsed-class))
  ;;                            (error "OBJECT must be a subclass `parsed-class'"))))
  ;;   (and subclass-check 
  ;;        (setf subclass-check (class-name subclass-check)))
  ;;   (gethash subclass-check *big-parsed-class-field-slot-accessor-mapping-table*)
  ;;   )
  (let* ((the-class-parsed-class (find-class 'parsed-class))
         (objects-class  (class-of object))
         (subclass-check (or (and (not (eq the-class-parsed-class objects-class))
                                  (subtypep objects-class (find-class 'parsed-class))
                                  (class-name objects-class))
                             (error "OBJECT must be a subclass `parsed-class' and not an instance of `parsed-class'"))))
    (gethash subclass-check *big-parsed-class-field-slot-accessor-mapping-table*)))

(defmethod accessor-to-field-table ((object parsed-class))
  (accessor-to-field-table (parsed-class-mapped object)))

(defmethod field-to-accessor-table ((object parsed-class))
  (field-to-accessor-table (parsed-class-mapped object)))

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
;; `record-status-active'        -> `record-status-active'
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

;; Return a format-control string for printing the slots of OBJECT with
;; padding adjusted according to the longest symbol-name of its slots.
;; Helper function for use with:
;; `print-sax-parsed-slots'
;; `write-sax-parsed-slots-to-file', 
;; `write-sax-parsed-class-hash-to-files'
;; :EXAMPLE
;;  (print-sax-parsed-slots-padding-format-control (make-instance 'parsed-inventory-record))
(defun print-sax-parsed-slots-padding-format-control (object)
  (format nil "~~&(~~{~~{:~~~D:A~~S~~}~~^~~%~~})" 
          (+ (reduce #'max 
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
    (format stream calculate-padding 
            (loop 
               with unbound = (when print-unbound "#<UNBOUND>")
               for slot-chk in (mon:class-slot-list object)
               for x = (slot-boundp object slot-chk)
               if x
               nconc (list (list slot-chk (slot-value object slot-chk))) into rtn 
               else  
               nconc (list (list slot-chk unbound)) into rtn
               finally (return rtn)))))

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
