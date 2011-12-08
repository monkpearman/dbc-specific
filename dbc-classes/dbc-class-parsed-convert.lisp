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

;; :NOTE documented in dbc-specific/dbc-docs.lisp
(defun write-sax-parsed-slots-to-file (object &key slot-for-file-name 
                                                   prefix-for-file-name
                                                   (pathname-type "lisp")
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
                                        slot-value-if)
                                   (and slot-value-if 
                                        (format nil "~S" slot-value-if))))
        (slot-value-to-file-name (and slot-value-if-stringp
                                      (merge-pathnames 
                                       (make-pathname :name (concatenate 'string 
                                                                         (or prefix-for-file-name
                                                                             (string slot-for-file-name))
                                                                         "-"
                                                                         slot-value-if-stringp)
                                                      :type pathname-type)
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
          ;; :WAS
          ;; (format fl ";;; :CLASS `~A' ~A ~A ~%;;; :FILE-CREATED  ~A~%~%"
          ;;         (string-downcase (class-name (class-of object)))
          ;;         slot-for-file-name
          ;;         slot-value-if-stringp
          ;;         (mon:timestamp-for-file))
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
                                                             prefix-for-file-name
                                                             (pathname-type "lisp")
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
