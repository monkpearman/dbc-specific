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

(defgeneric control-id-indexed-number-zero-padded-string (integer-or-string))

;; :EXAMPLE
;; (control-id-indexed-number-zero-padded-string nil)
(defmethod control-id-indexed-number-zero-padded-string ((integer-or-string null))
  (error ":METHOD `control-id-indexed-number-zero-padded-string' -- arg INTEGER-OR-STRING must not be null"))

;; :EXAMPLE
;; (control-id-indexed-number-zero-padded-string (list nil))
(defmethod control-id-indexed-number-zero-padded-string ((integer-or-string list))
  (error ":METHOD `control-id-indexed-number-zero-padded-string' -- arg INTEGER-OR-STRING must not be a list"))

;; :EXAMPLE
;; (control-id-indexed-number-zero-padded-string 'foo)
;; (control-id-indexed-number-zero-padded-string t)
(defmethod control-id-indexed-number-zero-padded-string ((integer-or-string symbol))
  (error ":METHOD `control-id-indexed-number-zero-padded-string' -- arg INTEGER-OR-STRING must not be a symbol"))

;; :EXAMPLE
;;  (control-id-indexed-number-zero-padded-string 1)
;;  (control-id-indexed-number-zero-padded-string 42)
;;  (control-id-indexed-number-zero-padded-string 111)
;;  (control-id-indexed-number-zero-padded-string 1111)
;;  (control-id-indexed-number-zero-padded-string 99999)
;; Following fail successfully:
;;  (control-id-indexed-number-zero-padded-string -1)
;;  (control-id-indexed-number-zero-padded-string 100000)
(defmethod control-id-indexed-number-zero-padded-string ((integer-or-string integer))
  (assert (typep integer-or-string '(integer 0 99999)))
  (format nil "~V,'0d" 6 integer-or-string))

;; :EXAMPLE
;; (control-id-indexed-number-zero-padded-string "99999")
;; (control-id-indexed-number-zero-padded-string "010000")
;; (control-id-indexed-number-zero-padded-string "10000")
;; (control-id-indexed-number-zero-padded-string "1")
;; (control-id-indexed-number-zero-padded-string "12")
;; (control-id-indexed-number-zero-padded-string "123")
;; (control-id-indexed-number-zero-padded-string "1234")
;; (control-id-indexed-number-zero-padded-string "12345")
;; Following fail successfully:
;; (control-id-indexed-number-zero-padded-string "100000")
;; (control-id-indexed-number-zero-padded-string "0")
;; (control-id-indexed-number-zero-padded-string "00")
;; (control-id-indexed-number-zero-padded-string "000")
;; (control-id-indexed-number-zero-padded-string "0000")
;; (control-id-indexed-number-zero-padded-string "00000")
;; (control-id-indexed-number-zero-padded-string "000000")
;; (control-id-indexed-number-zero-padded-string "")
(defmethod control-id-indexed-number-zero-padded-string ((integer-or-string string))
  (let ((len (length integer-or-string)))
    (assert (typep len '(integer 1 6)) nil 
            ":METHOD `control-id-indexed-number-zero-padded-string'~% ~
             arg INTEGER-OR-STRING with length not of type '(integer 1 6)~% got: ~S~% length: ~S~%" 
            integer-or-string len)
    (assert (every-digit-char-p integer-or-string) nil
            ":METHOD `control-id-indexed-number-zero-padded-string'~% ~
             arg INTEGER-OR-STRING did not satisfy `every-digit-char-p'~% got: ~S~%" 
            integer-or-string)
    (assert (%not-every-char-zero-p integer-or-string) nil
            ":METHOD `control-id-indexed-number-zero-padded-string'~% ~
             arg INTEGER-OR-STRING with every character `cl:char=' #\\0~% got: ~S~%" 
            integer-or-string)
    (ecase len
      (6 
       (assert (char= (char integer-or-string 0) #\0) nil
               ":METHOD `control-id-indexed-number-zero-padded-string'~% ~
                  arg INTEGER-OR-STRING with length 6 but char at index 0 not `cl:char=' #\\0~% got: ~S~%" 
               integer-or-string)
       integer-or-string)
      (1 
       (let ((new (make-array 6 :element-type 'character :initial-element #\0)))
         (setf (aref new 5) (char integer-or-string 0))
         new))
      ((2 3 4 5)
       (loop 
          with new =  (make-array 6 :element-type 'character :initial-element #\0)
          for chars across integer-or-string
          for idx from (- 6 len)  below 6
          do (setf (aref new idx) chars)
          finally (return new))))))





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

;; :EXAMPLE
;; (dbc::%print-sax-parsed-slots-calculate-padding-for-format-control-using-plist-keys '())
;; (dbc::%print-sax-parsed-slots-calculate-padding-for-format-control-using-plist-keys '() :value-column-overage 19)
;; (let ((plist (list :FOO-BAR "" :BARBAR-BAZ "0" :BAZ-BAR "0")))
;;   (dbc::%print-sax-parsed-slots-calculate-padding-for-format-control-using-plist-keys plist))
(defun %print-sax-parsed-slots-calculate-padding-for-format-control-using-plist-keys (plist &key (value-column-overage 4))
  (declare ;; (optimize speed)
   ((unsigned-byte 4) value-column-overage)
   ((or null cons) plist))
  (let ((check-empty (or (mon:plist-keys plist)
                         value-column-overage)))
    (etypecase check-empty
      ((unsigned-byte 4) check-empty)
      (cons (labels ((get-key-length (x)
                       (declare ((or string keyword symbol) x))
                       (length (string x))))
              (+ (reduce #'max 
                         (map 'list #'get-key-length check-empty))
                 value-column-overage))))))

(defun %print-sax-parsed-slots-calculate-padding-for-format-control (object &key (value-column-overage 4))
  (declare ((unsigned-byte 4) value-column-overage))
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
  (declare ((unsigned-byte 4) value-column-overage))
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
                                                   suffix-for-file-name
                                                   (print-unbound nil)
                                                   (slot-for-file-name-zero-padded nil)
                                                   (pathname-type "lisp")
                                                   output-directory 
                                                   (directory-exists-check t)
                                                   (pre-padded-format-control nil))
  (declare  (parsed-class object)
            (type (and symbol (mon::not-null)) slot-for-file-name)
            (type (or string null) prefix-for-file-name suffix-for-file-name)
            (mon:pathname-or-namestring output-directory)
            (boolean directory-exists-check print-unbound))
  (when directory-exists-check
    (unless (equal (pathname output-directory)
                   (make-pathname :directory (pathname-directory (probe-file output-directory))))
      (error ":FUNCTION `write-sax-parsed-slots-to-file' -- arg OUTPUT-DIRECTORY does not designate a valid directory~% got: ~S~%"
             output-directory)))
  (let* ((warning "Something wrong with arg OBJECT, declining to dump slot values to file")
         (slot-value-if 
          (or (and (slot-exists-p object slot-for-file-name) ;; 'inventory-number
                   (slot-boundp   object slot-for-file-name)
                   (slot-value    object slot-for-file-name))
              (progn
                (warn                   ;error 
                 "~%:FUNCTION `write-sax-parsed-slots-to-file'~% ~
                  arg SLOT-FOR-FILE-NAME either non-existent, slot-unbound, null, ~
                  or not properly package qualified with \"DBC\" ~% slot: ~S~% object: ~S~%"
                 slot-for-file-name object)
                (warn "~%~A~%" warning)
                (return-from write-sax-parsed-slots-to-file (values nil warning)))))
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
                       (warn "~%~A~%" warning)
                       (return-from write-sax-parsed-slots-to-file (values nil warning))))
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
                         (warn "~%~A~%" warning)
                         ;; (return-from write-sax-parsed-slots-to-file)))
                         (return-from write-sax-parsed-slots-to-file (values nil warning))))
                     (make-string (- 6 validate-length) :initial-element #\0))))))
         (slot-value-to-file-name 
          (and slot-value-if-stringp
               (merge-pathnames (make-pathname :name (concatenate 'string 
                                                                  (or prefix-for-file-name
                                                                      (string-downcase slot-for-file-name))
                                                                  ;;  When a string is provided it should contain a trailing #\- if one is wanted.
                                                                  (and (not prefix-for-file-name) "-")
                                                                  maybe-zero-pad
                                                                  slot-value-if-stringp
                                                                  suffix-for-file-name)
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
          (print-sax-parsed-slots object :stream fl :print-unbound print-unbound :pre-padded-format-control calculate-padding)
          (write-char #\Newline fl)
          slot-value-to-file-name)
        (progn
          (warn "~%Something wrong with arg OBJECT, declining to dump to file~%")
          nil))))

;; :NOTE Now that we can dereference PARSED-CLASS as a key in `*parsed-class-parse-table*'
;;  we can access the HASH-TABLE assocociated with PARSED-CLASS directly e.g.:
;;
;;   (gethash 'parsed-inventory-record *parsed-class-parse-table*)
;;   (gethash 'parsed-inventory-sales-order-record *parsed-class-parse-table*)
;;
;; However, to utilize this feature we will need to implment an early check
;; which bails/errors if the key is not present, e.g.:
;;
;;  (gethash 'parsed-foo-does-not-exist *parsed-class-parse-table*)
;;
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
  (let ((calculate-padding (print-sax-parsed-slots-padding-format-control (make-instance parsed-class)))
        (file-namestrings (make-array (hash-table-count hash-table) :fill-pointer 0)))
    (flet ((hash-file-writer (k v)
             (declare (ignore k) 
                      (parsed-class v))
             (vector-push-extend
              (file-namestring
               (write-sax-parsed-slots-to-file v
                                               :slot-for-file-name slot-for-file-name
                                               :slot-for-file-name-zero-padded slot-for-file-name-zero-padded
                                               :prefix-for-file-name prefix-for-file-name
                                               :pathname-type pathname-type
                                               :output-directory output-directory
                                               :directory-exists-check nil
                                               :pre-padded-format-control calculate-padding))
              file-namestrings)))
      (maphash #'hash-file-writer hash-table))
    (coerce file-namestrings 'list)))

(defun write-sax-parsed-inventory-record-hash-to-zero-padded-directory (hash-table &key
                                                                        (base-output-directory *dbc-base-item-number-image-pathname*)
                                                                        (checking-sold t)
                                                                        (pathname-type "lisp"))
  (declare (type hash-table hash-table)
           (mon:pathname-or-namestring base-output-directory)
           ((or null string) pathname-type))
  (unless (equal (pathname base-output-directory)
                 (make-pathname :directory (pathname-directory (probe-file base-output-directory))))
    (error "arg BASE-OUTPUT-DIRECTORY does not designate a valid directory~% got: ~S~%"
           base-output-directory))
  (let ((calculate-padding (print-sax-parsed-slots-padding-format-control (make-instance 'parsed-inventory-record)))
        (vec (make-array (hash-table-count hash-table) :fill-pointer 0)))
    (flet ((hash-padded-record-writer (k v)
             ;; #'(lambda (k v)
             (declare (string k) 
                      (parsed-class v))
             (let* ((padded-prefix (make-string (- 6 (length k)) :initial-element #\0)) ;; (format nil "~V,,,'0@A" (- 6 (length key)) #\0))
                    (padded-directory-name (concatenate 'string padded-prefix k))
                    (padded-sold-directory-name (when checking-sold 
                                                  (concatenate 'string padded-directory-name "_SOLD")))
                    (padded-directory (merge-pathnames (make-pathname :directory `(:relative ,padded-directory-name))
                                                       base-output-directory))
                    (padded-sold-directory
                     (when padded-sold-directory-name
                       (merge-pathnames (make-pathname :directory `(:relative ,padded-sold-directory-name))
                                        base-output-directory))))
               (if (and padded-sold-directory
                        (probe-file padded-sold-directory))
                   (setf padded-directory padded-sold-directory)
                   (ensure-directories-exist padded-directory))
               (vector-push-extend 
                (write-sax-parsed-slots-to-file v 
                                                :slot-for-file-name 'inventory-number 
                                                :slot-for-file-name-zero-padded t
                                                :prefix-for-file-name ""
                                                :output-directory padded-directory
                                                :directory-exists-check nil
                                                :pre-padded-format-control calculate-padding)
                vec))))
      (maphash #'hash-padded-record-writer hash-table))
    vec))

(eval-when (:compile-toplevel :load-toplevel :execute)

(defun %parsed-class-dumper-format-and-intern-symbol (parsed-class)
  (alexandria:format-symbol (find-package "DBC")
                            "~:@(~A-XML-DUMP-FILE-AND-HASH~)"
                            parsed-class))
) ;; close eval-when

;; :NOTE documented in dbc-specific/dbc-docs.lisp
(defmacro def-parsed-class-record-xml-dump-file-and-hash (&key parsed-class
                                                          default-key-accessor
                                                          default-input-pathname-name
                                                          default-output-pathname-base-directory
                                                          default-output-pathname-sub-directory
                                                          default-output-pathname-name
                                                          ;; (output-pathname-dated-p t)
                                                          ;; (output-pathname-type "lisp")
                                                          ;; (set-parsed-class-parse-table t)
                                                          )
  ;; let* to ensure `%parsed-class-dumper-format-and-intern-symbol' evaluated at macroexpansion time.
  (let* ((generated-name (%parsed-class-dumper-format-and-intern-symbol parsed-class))
        ;; :NOTE PARSED-CLASS' `parsed-class-slot-dispatch-function' may need to
        ;; be evaluated at macroexpansion time.
        ;; (dispatch-fun   (parsed-class-slot-dispatch-function parsed-class)))
        )
    `(defun ,generated-name (&key (input-file (make-pathname 
                                               :directory (pathname-directory (sub-path *xml-input-dir*)) 
                                               :name ,default-input-pathname-name))
                             (output-pathname-sub-directory ,default-output-pathname-sub-directory)
                             (output-pathname-base-directory ,default-output-pathname-base-directory)
                             (output-pathname-name ,default-output-pathname-name)
                             (output-pathname-dated-p t)
                             (output-pathname-type "lisp")
                             (set-inventory-record-table t))
       (let* ((parsed-xml-file
               (multiple-value-list
                (write-sax-parsed-xml-to-file
                 :input-file input-file
                 :output-file (make-default-sax-parsed-xml-output-pathname
                               :pathname-sub-directory output-pathname-sub-directory
                               :pathname-base-directory output-pathname-base-directory
                               :pathname-name output-pathname-name
                               :pathname-name-dated-p output-pathname-dated-p
                               :pathname-type output-pathname-type))))
              (parsed-hash  (make-hash-table :test 'equal :size (mon:prime-or-next-greatest (caddr parsed-xml-file)))))
         ;;(loaded-hash  
         ;;(multiple-value-list 
         (load-sax-parsed-xml-file-to-parsed-class-hash
                 :parsed-class ',parsed-class
                 :input-file (cadr parsed-xml-file)
                 :hash-table  parsed-hash
                 :key-accessor  (function ,default-key-accessor)
                 ;; e.g. #'set-parsed-inventory-record-slot-value
                 :slot-dispatch-function (function ,(parsed-class-slot-dispatch-function parsed-class)))
          (values 
           (if set-inventory-record-table
               (setf (gethash ',parsed-class *parsed-class-parse-table*) parsed-hash)
               parsed-hash)
           (cadr  parsed-xml-file)
           (caddr parsed-xml-file))))))

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
