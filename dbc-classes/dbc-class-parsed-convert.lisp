;;; :FILE-CREATED <Timestamp: #{2011-01-07T13:22:46-05:00Z}#{11015} - by MON>
;;; :FILE ../dbc-classes/dbc-class-parsed-convert.lisp
;;; ==============================



;;; ==============================
;;; Interface for the xml->parse-class->hash-table->file conversion
;;; ==============================


(in-package #:dbc)
;; *package*

;; :NOTE for use with examples defined in 
;; :FILE dbc-specific/dbc-classes/dbc-class-parse-EXAMPLE.lisp
(defun %ensure-dated-parsed-directory (&key directory-prefix)
  (declare (type mon:string-not-empty directory-prefix))
  (ensure-directories-exist
   (merge-pathnames 
    (make-pathname :directory `(:relative ,(sub-name *xml-output-dir*) 
                                          ,(format nil "~A-~A"
                                                   (string-trim #(#\- #\space) directory-prefix)
                                                   (mon:time-string-yyyy-mm-dd))))
    (system-path *system-path*))))

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
;;
;; :NOTE documented in dbc-specific/dbc-docs.lisp
(defun load-sax-parsed-xml-file-to-parsed-class-hash (&key parsed-class
                                                           input-file
                                                           hash-table
                                                           key-accessor
                                                           slot-dispatch-function)
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

(defun %print-sax-parsed-slots-calculate-padding-for-format-control (object &key (value-column-overage 4))
  (declare (overage (unsigned-byte 4)))
  (+ (reduce #'max 
             (map 'list #'(lambda (x) (length (string x)))
                  ;; :NOTE could prob. use this as well:
                  ;; (accessors-of-parsed-class object)
                  (mon:class-slot-list object))) 
     value-column-overage))

;; (let ((object 'parsed-inventory-record))
;;   (list (+ (reduce #'max (map 'list #'(lambda (x) (length (string x))) (mon:class-slot-list (find-class object)))) 4)
;;         (+ (reduce #'max (map 'list #'(lambda (x) (length (string x))) (accessors-of-parsed-class object))) 4)))


;; :NOTE documented in dbc-specific/dbc-docs.lisp
(defun print-sax-parsed-slots-padding-format-control (object &key (value-column-overage 4))
  (format nil "~~&(~~{~~{:~~~D:A~~S~~}~~^~~%~~})" 
          ;; (+ (reduce #'max 
          ;;            (map 'list #'(lambda (x) (length (string x)))
          ;;                 (mon:class-slot-list object)))
          ;;    value-column-overage)
          (%print-sax-parsed-slots-calculate-padding-for-format-control 
           object 
           :value-column-overage value-column-overage)))

;; :NOTE documented in dbc-specific/dbc-docs.lisp
(defun print-sax-parsed-slots (object &key stream
                                           (print-unbound t)
                                           (pre-padded-format-control nil))
  (declare (type parsed-class object)
           (type (or string null) pre-padded-format-control)
           (type boolean print-unbound))
  (let ((calculate-padding (if pre-padded-format-control
                               pre-padded-format-control
                               (print-sax-parsed-slots-padding-format-control object))))
    (format stream calculate-padding 
            (loop 
               with unbound = (when print-unbound "#<UNBOUND>") ;(if print-unbound "#<UNBOUND>" "; #<UNBOUND>")
               for slot-chk in (mon:class-slot-list object)
               for x = (slot-boundp object slot-chk)
               if x
               nconc (list (list slot-chk (slot-value object slot-chk))) into rtn 
               else  
               nconc (list (list slot-chk unbound)) into rtn
               finally (return rtn)))))

(defun %write-sax-parsed-slots-to-file-dumping-header (object &key
                                                       stream
                                                       slot-for-file-name
                                                       slot-for-file-name-value)
  (format stream ";;; :CLASS `~A' :~A ~A ~%;;; :FILE-CREATED  ~A~%~%"
          (string-downcase (class-name (class-of object)))
          slot-for-file-name
          slot-for-file-name-value
          (mon:timestamp-for-file)))

;; (write-sax-parsed-slots-to-file (gethash "12393" *tt--parse-table*)
;;                                 ;;:prefix-for-file-name "bubba"
;;                                 ;; :slot-for-file-name 'naf-entity-artist-coref ;warns and bails
;;                                 :slot-for-file-name 'inventory-number
;;                                 :slot-for-file-name-zero-padded t
;;                                 :output-directory (sub-path *xml-output-dir*))
;;
;; :NOTE documented in dbc-specific/dbc-docs.lisp
(defun write-sax-parsed-slots-to-file (object &key slot-for-file-name 
                                                   prefix-for-file-name
                                                   (slot-for-file-name-zero-padded nil)
                                                   (pathname-type "lisp")
                                                   output-directory 
                                                   (directory-exists-check t)
                                                   (pre-padded-format-control nil))
  (declare  (parsed-class object)
            (type (and symbol (mon::not-null)) slot-for-file-name)
            (type (or string null) prefix-for-file-name)
            (mon:pathname-or-namestring output-directory)
            (boolean directory-exists-check))
  (when directory-exists-check
    (unless (equal (pathname output-directory)
                   (make-pathname :directory (pathname-directory (probe-file output-directory))))
      (error ":FUNCTION `write-sax-parsed-slots-to-file' -- arg OUTPUT-DIRECTORY does not designate a valid directory~% got: ~S~%"
             output-directory)))
  (let* ((slot-value-if 
          (or (and (slot-exists-p object slot-for-file-name) ;; 'item-number
                   (slot-boundp   object slot-for-file-name)
                   (slot-value    object slot-for-file-name))
              (progn
                (warn                   ;error 
                 "~%:FUNCTION `write-sax-parsed-slots-to-file'~% ~
                  arg SLOT-FOR-FILE-NAME either non-existent slot-unbound or null~% slot:~S~% object: ~S~%"
                 slot-for-file-name object)
                (warn "~%Something wrong with arg OBJECT, declining to dump to file~%")
                (return-from write-sax-parsed-slots-to-file))))
         (slot-value-if-stringp 
          (or (and slot-value-if
                   (stringp slot-value-if)                                         
                   slot-value-if)
              (and slot-value-if 
                   (format nil "~S" slot-value-if))))
         (maybe-zero-pad
          (and slot-value-if-stringp
               (when slot-for-file-name-zero-padded
                 (let ((validate-length (length slot-value-if-stringp)))
                   (unless (< validate-length 6)
                     (progn
                       (warn            ;error 
                        "~%:FUNCTION `write-sax-parsed-slots-to-file'~% ~
                              With arg SLOT-FOR-FILE-NAME-ZERO-PADDED non-nil found slot-value with length less than 6~% ~
                             slot: ~S~% slot-value: ~S~% length: ~S~% object: ~S~%"
                        slot-for-file-name slot-value-if validate-length object)
                       (warn "~%Something wrong with arg OBJECT, declining to dump to file~%")
                       (return-from write-sax-parsed-slots-to-file)))
                   (multiple-value-bind (parseable parse-length) (parse-integer slot-value-if-stringp :junk-allowed t)
                     (unless (and parseable 
                                  (typep parseable 'unsigned-byte) 
                                  (eql parse-length validate-length))
                       (progn
                         (warn          ;error 
                          "~%:FUNCTION `write-sax-parsed-slots-to-file'~% ~
                         With arg SLOT-FOR-FILE-NAME-ZERO-PADDED non-nil, unable to coerce via~% ~
                         CL:PARSE-INTEGER a valid positive number representation from slot-value of~% ~
                         slot: ~S~% slot-value: ~S~% object: ~S~%" 
                          slot-for-file-name slot-value-if object)
                         (warn "~%Something wrong with arg OBJECT, declining to dump to file~%")
                         (return-from write-sax-parsed-slots-to-file)))
                     (make-string (- 6 validate-length) :initial-element #\0))))))
         (slot-value-to-file-name 
          (and slot-value-if-stringp
               (merge-pathnames (make-pathname :name (concatenate 'string 
                                                                  (or prefix-for-file-name
                                                                      (string-downcase slot-for-file-name))
                                                                  (and (not prefix-for-file-name) "-")
                                                                  maybe-zero-pad
                                                                  slot-value-if-stringp)
                                               :type pathname-type)
                                output-directory)))
         (calculate-padding 
          (and slot-value-to-file-name
               (if pre-padded-format-control
                   pre-padded-format-control
                   (print-sax-parsed-slots-padding-format-control object)))))
    (if slot-value-to-file-name
        (with-open-file (fl slot-value-to-file-name
                            :direction :output 
                            :if-does-not-exist :create
                            :if-exists :supersede
                            :external-format :UTF-8)
          (%write-sax-parsed-slots-to-file-dumping-header
           object
           :stream fl 
           :slot-for-file-name slot-for-file-name 
           :slot-for-file-name-value slot-value-if-stringp)
          (print-sax-parsed-slots object :stream fl :print-unbound nil :pre-padded-format-control calculate-padding)
          (write-char #\Newline fl)
          slot-value-to-file-name)
        (progn
          (warn "~%Something wrong with arg OBJECT, declining to dump to file~%")
          nil))))

;; :NOTE documented in dbc-specific/dbc-docs.lisp
(defun write-sax-parsed-class-hash-to-files (hash-table &key parsed-class
                                                             slot-for-file-name
                                                             (slot-for-file-name-zero-padded nil)
                                                             prefix-for-file-name
                                                             (pathname-type "lisp")
                                                             output-directory)
                                             
  (declare (type hash-table hash-table)
           (type (and symbol (mon::not-null)) slot-for-file-name parsed-class)
           (type (or string null) prefix-for-file-name))
  (unless (equal (pathname output-directory)
                 (make-pathname :directory (pathname-directory (probe-file output-directory))))
    (error "arg OUTPUT-DIRECTORY does not designate a valid directory~% got: ~S~%"
           output-directory))
  (let ((calculate-padding (print-sax-parsed-slots-padding-format-control (make-instance parsed-class))))
    (maphash #'(lambda (k v)
                 (declare (ignore k) 
                          (parsed-class v))
                 (write-sax-parsed-slots-to-file v 
                                                 :slot-for-file-name slot-for-file-name 
                                                 :slot-for-file-name-zero-padded slot-for-file-name-zero-padded
                                                 :prefix-for-file-name prefix-for-file-name
                                                 :output-directory output-directory
                                                 :directory-exists-check nil
                                                 :pre-padded-format-control calculate-padding))
             hash-table)))

(defun write-sax-parsed-inventory-record-hash-to-zero-padded-directory (hash-table &key
                                                                        (base-output-directory *dbc-base-item-number-image-pathname*)
                                                                        (pathname-type "lisp"))
  (declare (type hash-table hash-table)
           (mon:pathname-or-namestring base-output-directory)
           ((or null string) pathname-type))
  (unless (equal (pathname base-output-directory)
                 (make-pathname :directory (pathname-directory (probe-file base-output-directory))))
    (error "arg BASE-OUTPUT-DIRECTORY does not designate a valid directory~% got: ~S~%"
           base-output-directory))
  (let ((calculate-padding (print-sax-parsed-slots-padding-format-control (make-instance 'parsed-inventory-record))))
    (maphash #'(lambda (k v)
                 (declare (string k) 
                          (parsed-class v))

                 (let* ((padded-prefix (make-string (- 6 (length k)) :initial-element #\0)) ;; (format nil "~V,,,'0@A" (- 6 (length key)) #\0))
                        (padded-directory-name (concatenate 'string padded-prefix k))
                        (padded-directory (merge-pathnames (make-pathname :directory `(:relative ,padded-directory-name))
                                                           base-output-directory)))
                   (ensure-directories-exist padded-directory)
                   (write-sax-parsed-slots-to-file v 
                                                   :slot-for-file-name 'inventory-number 
                                                   :slot-for-file-name-zero-padded t
                                                   :prefix-for-file-name ""
                                                   :output-directory padded-directory
                                                   :directory-exists-check nil
                                                   :pre-padded-format-control calculate-padding)))
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
