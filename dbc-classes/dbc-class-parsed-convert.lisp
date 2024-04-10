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

(deftype control-id-indexed-number-for-zero-padded-string-integer-range ()
  '(integer 1 99999))

(deftype control-id-indexed-number-for-zero-padded-string-integer-string-length ()
  '(integer 1 6))

;; (control-id-indexed-number-for-zero-padded-string-integer-range-validate 0)

(defun control-id-indexed-number-for-zero-padded-string-integer-range-validate (maybe-valid-integer)
  (assert (typep maybe-valid-integer 'control-id-indexed-number-for-zero-padded-string-integer-range)
          (maybe-valid-integer)
          ":FUNCTION `control-id-indexed-number-for-zero-padded-string-integer-range-validate' --~% ~
            Arg MAYBE-VALID-INTEGER not of type (integer 1 99999)~% got: ~S~% type: ~S~%"
          maybe-valid-integer (type-of maybe-valid-integer))
  maybe-valid-integer)

(defun control-id-indexed-number-for-zero-padded-string-integer-string-length-validate (maybe-valid-string)
  (assert (typep (length maybe-valid-string) 'control-id-indexed-number-for-zero-padded-string-integer-string-length)
          (maybe-valid-string)
          ":FUNCTION `control-id-indexed-number-for-zero-padded-string-integer-string-length-validate' --~% ~
          Arg MAYBE-VALID-STRING with STRING-LENGTH not of type '(integer 1 6)~% got: ~S~% length: ~S~%"
          maybe-valid-string (length maybe-valid-string))
  maybe-valid-string)

(defgeneric control-id-indexed-number-zero-padded-string (integer-or-string))

(defmethod control-id-indexed-number-zero-padded-string ((integer-or-string null))
  (error ":METHOD `control-id-indexed-number-zero-padded-string' -- arg INTEGER-OR-STRING must not be null"))

(defmethod control-id-indexed-number-zero-padded-string ((integer-or-string list))
  (error ":METHOD `control-id-indexed-number-zero-padded-string' -- arg INTEGER-OR-STRING must not be a list"))

(defmethod control-id-indexed-number-zero-padded-string ((integer-or-string symbol))
  (error ":METHOD `control-id-indexed-number-zero-padded-string' -- arg INTEGER-OR-STRING must not be a symbol"))

;; :NOTE In lieu of a previous type assertion '(integer 0 99999) this was allowed:
;;  (control-id-indexed-number-zero-padded-string 0) => "000000"
;; However, this was prob. an oversight as there don't seem to be any valid
;; cases were we want to allow 0 as a valid control id and we now required.
;; We've verfied that changing the assertion to '(integer 1 99999) should not
;; affect the control-id-entity-num-<FOO> slot-values for any of the following
;; classes:
;; parsed-author-record control-id-entity-num-author does not contain "0"
;; parsed-artist-record control-id-entity-num-artist does not contain "0"
;; parsed-person-record control-id-entity-num-person does not contain "0"
;; parsed-theme-record control-id-theme-entity-num does not contain "0"
;; parsed-brand-record control-id-entity-num-brand does not contain "0"
;; parsed-technique-record control-id-entity-num-technique does not contain "0"
;; parsed-publication-record control-id-entity-num-publication does not contain "0"
;;                            control-id-doc-num-publication does (although this isn't a primary key.)
(defmethod control-id-indexed-number-zero-padded-string ((integer-or-string integer))
  ;; (assert (typep integer-or-string '(integer 0 99999)))
  ;;
  ;; (assert (typep integer-or-string 'control-id-indexed-number-for-zero-padded-string-integer-range) nil)
  ;; (format nil "~V,'0d" 6 integer-or-string)
  (format nil "~V,'0d" 6
          (control-id-indexed-number-for-zero-padded-string-integer-range-validate integer-or-string)))

(defmethod control-id-indexed-number-zero-padded-string ((integer-or-string string))
  (let* ((validated-string (control-id-indexed-number-for-zero-padded-string-integer-string-length-validate integer-or-string))
         (len (length validated-string)))
    (assert (every-digit-char-p integer-or-string) nil
            ":METHOD `control-id-indexed-number-zero-padded-string'~% ~
             arg INTEGER-OR-STRING did not satisfy `every-digit-char-p'~% got: ~S~%"
            ;;integer-or-string)
            validated-string)
    (assert (%not-every-char-zero-p integer-or-string) nil
            ":METHOD `control-id-indexed-number-zero-padded-string'~% ~
             arg INTEGER-OR-STRING with every character `cl:char=' #\\0~% got: ~S~%"
            ;;integer-or-string)
            validated-string)
    (ecase len
      (6
       (assert (char= (char validated-string 0) #\0) nil
               ":METHOD `control-id-indexed-number-zero-padded-string'~% ~
                arg INTEGER-OR-STRING with length 6 but char at index 0 not `cl:char=' #\\0~% got: ~S~%"
               validated-string)
       validated-string)
      (1
       (let ((new (make-array 6 :element-type 'character :initial-element #\0)))
         (setf (aref new 5) (char validated-string 0))
         new))
      ((2 3 4 5)
       (loop
         with new = (make-array 6 :element-type 'character :initial-element #\0)
         for chars across validated-string
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
;; (parsed-class-parse-table 'parsed-inventory-sales-order-record)
;;
;; :NOTE We could default HASH-TABLE to use `parsed-class-parse-table' e.g.:
;;  (hash-table (parsed-class-parse-table parsed-class))
;; However, if we do so we need a good condition handler/restart that lets us
;; choose whether we want to overwrite the existing hash-table.
;;
(defun load-sax-parsed-xml-file-to-parsed-class-hash (&key parsed-class
                                                           input-file
                                                           hash-table ; (parsed-class-parse-table parsed-class)
                                                           key-accessor
                                                           slot-dispatch-function)
  (with-open-file (fl input-file
                      :direction :input
                      :element-type 'character
                      :external-format :UTF-8)
    (loop
      for x = (read fl nil 'EOF)
      until (eql x 'EOF)
      do (and x ;; paranoia in case for some reason x was the empty list.
              (loop
                with obj = (make-instance parsed-class)
                for (field . val) in x
                do (funcall slot-dispatch-function field val obj)
                finally (setf (gethash (funcall key-accessor obj) hash-table) obj)))
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

(defun %write-sax-parsed-slots-to-file-dumping-header (object &key stream
                                                                   slot-for-file-name
                                                                   slot-for-file-name-value)
  (format stream ";;; :CLASS `~A' :~A ~A ~%;;; :FILE-CREATED  ~A~%~%"
          (string-downcase (class-name (class-of object)))
          slot-for-file-name
          slot-for-file-name-value
          (mon:timestamp-for-file)))

;;
;;; :FILE-CREATED <Timestamp: #{2012-03-02T11:55:04-05:00Z}#{12095} - by MON>
;; (mon:timestamp)
;; "<Timestamp: #{2012-03-02T11:56:02+05:00Z} - by MON>"
;;  #P"/mnt/RMT-PILOT-SHR/Ohio-State-auction-2012-February/lot-images-unsorted/IMG_0046.JPG")
;;

;; (write-sax-parsed-slots-to-file (gethash "12393" *tt--parse-table*)
;;                                 ;;:prefix-for-file-name "bubba"
;;                                 ;; :slot-for-file-name 'naf-entity-artist-coref ;warns and bails
;;                                 :slot-for-file-name 'inventory-number
;;                                 :slot-for-file-name-zero-padded t
;;                                 :output-directory (sub-path *xml-output-dir*))
;;
;; `write-sax-parsed-inventory-record-hash-to-zero-padded-directory'
;; Following example is a one off version `write-sax-parsed-inventory-record-hash-to-zero-padded-directory'
;; The example writes slot values of one inventory record in the
;; parsed-class-parse-table for class parsed-inventory-record if its
;; :IMAGE-DIRECTORY-PATHNAME is non-nil (parsed-class-parse-table
;; 'parsed-inventory-record)
;;
;; (let* ((current-object (%get-inventory-record "12413"))
;;        (with-image-directory
;;            (and current-object (image-directory-pathname current-object)))
;;        (full-directory-pathname
;;          (and with-image-directory
;;               (merge-pathnames with-image-directory *dbc-base-item-number-image-pathname*))))
;;   (when (and full-directory-pathname (probe-file full-directory-pathname))
;;     (write-sax-parsed-slots-to-file current-object
;;                                     :slot-for-file-name 'inventory-number
;;                                     :prefix-for-file-name ""
;;                                     :suffix-for-file-name ""
;;                                     :slot-for-file-name-zero-padded t
;;                                     :output-directory full-directory-pathname
;;                                     :if-exists-rename t
;;                                     :directory-exists-check nil)))
;;
(defun write-sax-parsed-slots-to-file (object &key slot-for-file-name
                                                   prefix-for-file-name
                                                   suffix-for-file-name
                                                   (print-unbound nil)
                                                   (slot-for-file-name-zero-padded nil)
                                                   (pathname-type "lisp")
                                                   output-directory
                                                   (directory-exists-check t)
                                                   (if-exists-rename t)
                                                   (pre-padded-format-control nil))
  (declare  (type parsed-class object) ;;(parsed-class object)
            (type (and symbol (mon::not-null)) slot-for-file-name)
            (type (or string null) prefix-for-file-name suffix-for-file-name)
            (mon:pathname-or-namestring output-directory)
            (boolean directory-exists-check print-unbound if-exists-rename))
  (when directory-exists-check
    (unless
        ;; (osicat:directory-exists-p output-directory)
        (equal (pathname output-directory)
               (make-pathname :directory (pathname-directory (probe-file output-directory))))
      (error ":FUNCTION `write-sax-parsed-slots-to-file' -- arg OUTPUT-DIRECTORY does not designate a valid directory~% got: ~S~%"
             output-directory)))
  (let* ((warning "Something wrong with arg OBJECT, declining to dump slot values to file")
         (slot-value-if
           (or (and (slot-exists-p object slot-for-file-name) ;; 'inventory-number
                    (slot-boundp   object slot-for-file-name)
                    (slot-value    object slot-for-file-name))
               (progn
                 (warn                  ;error
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
                        (warn           ;error
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
                          (warn         ;error
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
    (when (and if-exists-rename
               slot-value-to-file-name
               (probe-file slot-value-to-file-name))
      (rename-file slot-value-to-file-name
                   (concatenate 'string (pathname-name slot-value-to-file-name)
                                (mon:file-write-date-timestring slot-value-to-file-name
                                                                :timestring-format "_BAK-~4,'0d-~2,'0d-~2,'0dT~2,'0d-~2,'0d-~2,'0d"))))
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

;; (write-parsed-class-parse-table-to-file :parsed-class 'parsed-inventory-record :output-sub-directory "parsed-inventory-record")
;; (write-parsed-class-parse-table-to-file :parsed-class 'parsed-inventory-record :hash-table *tt-hash* :output-sub-directory "parsed-inventory-record")
;;
;;  :output-file (merge-pathnames (make-pathname
;;                                 :directory '(:relative "parsed-xml-inventory-records")
;;                                 :name (mon:timestamp-for-file-with :prefix "inventory-record-table-dump" :universal-time t)
;;                                 :name (mon:timestamp-for-file-with :prefix "inventory-record-table-dump")
;;                                 :type "lisp")
;;                                (sub-path *xml-output-dir*)))
(defun write-parsed-class-parse-table-to-file (&key parsed-class
                                                    hash-table
                                                    output-sub-directory
                                                    (base-output-directory
                                                     (merge-pathnames
                                                      (make-pathname :directory '(:relative "parsed-class-table-dumps"))
                                                      (dbc::sub-path dbc::*xml-output-dir*)))
                                                    (pathname-type "pctd"))
  (declare (symbol parsed-class)
           (type (or null hash-table) hash-table)
           (type (or string (and list (not null))) output-sub-directory)
           (mon:pathname-or-namestring base-output-directory))
  (let* ((frmt-cntl (print-sax-parsed-slots-padding-format-control (make-instance parsed-class)))
         (class-string-name (string-downcase (class-name (find-class parsed-class))))
         (parsed-hash
           (or (and hash-table
                    (if (zerop (hash-table-count hash-table))
                        (return-from write-parsed-class-parse-table-to-file (values nil hash-table))
                        (or (and (loop
                                   for vals being the hash-values in hash-table
                                   always (eql (type-of  vals) parsed-class))
                                 (setf class-string-name (concatenate 'string "non-default-table-" class-string-name))
                                 hash-table)
                            (error ":FUNCTION `write-parsed-class-parse-table-to-file' -- arg hash-table contains value which is not a ~A"
                                   class-string-name))))
               (parsed-class-parse-table parsed-class)))
         (output-file
           (if (zerop (hash-table-count parsed-hash))
               (return-from write-parsed-class-parse-table-to-file (values nil hash-table))
               (make-parsed-class-output-file-ensuring-pathname
                :pathname-base-directory base-output-directory
                :pathname-sub-directory `(,@(alexandria::ensure-list output-sub-directory))
                :pathname-name class-string-name
                :pathname-name-dated-p t
                ;:pathname-type "lisp"))))
                :pathname-type pathname-type))))
    (when output-file
      (with-open-file (fl output-file
                          :direction :output
                          :if-exists :supersede
                          :if-does-not-exist :create
                          :element-type 'character
                          :external-format :UTF-8)
        (format fl ";;; :CLASS `~A'~%;;; :FILE-CREATED ~A~%~%"
                class-string-name
                (local-time:format-timestring nil (local-time:now)))
        (loop
          for obj being the hash-values of parsed-hash ;(parsed-class-parse-table parsed-class)
          do
             (print-sax-parsed-slots obj :stream fl :print-unbound nil :pre-padded-format-control frmt-cntl)
             (write-char #\Newline fl)
             (write-char #\Newline fl))
        output-file))))

;; `write-parsed-inventory-record-parse-table-to-file'
;; (macroexpand-1
;;  '(def-parsed-class-write-parse-table-to-file
;;    :parsed-class parsed-inventory-record
;;    :default-output-pathname-sub-directory "parsed-inventory-record"
;;    :default-output-pathname-base-directory (merge-pathnames
;;                                             (make-pathname :directory '(:relative "parsed-class-table-dumps"))
;;                                             (sub-path *xml-output-dir*))
;;    :default-pathname-type "pctd"))
(defmacro def-parsed-class-write-parse-table-to-file (&key parsed-class
                                                           default-output-pathname-sub-directory
                                                           (default-output-pathname-base-directory
                                                            (merge-pathnames
                                                             (make-pathname :directory '(:relative "parsed-class-table-dumps"))
                                                             (dbc::sub-path dbc::*xml-output-dir*)))
                                                           (default-pathname-type "pctd"))

  (let ((generated-name (alexandria:format-symbol (find-package "DBC")
                                                  "~:@(WRITE-~A-PARSE-TABLE-TO-FILE~)"
                                                  parsed-class)))
    `(defun ,generated-name (&key hash-table
                                  (output-sub-directory ,default-output-pathname-sub-directory)
                                  (base-output-directory ,default-output-pathname-base-directory)
                                  (pathname-type ,default-pathname-type))
       (declare (type (or null hash-table) hash-table)
                (type (or string (and list (not null))) output-sub-directory)
                (mon:pathname-or-namestring base-output-directory)
                (string pathname-type))
       (write-parsed-class-parse-table-to-file :parsed-class ',parsed-class
                                               :hash-table hash-table
                                               :output-sub-directory  output-sub-directory
                                               :base-output-directory base-output-directory
                                               :pathname-type pathname-type))))

;;; :TODO Currently this can corrupt an existing hash-table when loading a
;;; poorly formed "pctd" file e.g. if the is a missing paren or unclosed string.
;;;  to unwind to a cached value of :hash-table <TABLE> in the event of a bad file read.
(defun load-parsed-class-default-file-to-hash-table (&key parsed-class
                                                          input-file
                                                          hash-table ; (parsed-class-parse-table parsed-class)
                                                          key-accessor
                                                          (load-verbose nil))
  (declare (boolean load-verbose))
  (with-open-file (fl input-file
                      :direction :input
                      :element-type 'character
                      :external-format :UTF-8)
    ;; (let ((new-hash (make-hash-table :test (hash-table-test hash-table)
    ;;                                  :size (hash-table-size hash-table))))
    ;;   (loop
    ;;     for key being the hash-keys in hash-table using (hash-value val)
    ;;     do (setf (gethash key new-hash) val))
    ;;   (unwind-protect
    ;;        (loop
    ;;          for x = (read fl nil 'EOF)
    ;;          until (eql x 'EOF)
    ;;          do (let ((obj (and x ;; paranoia in case x was the empty list.
    ;;                             (apply #'make-instance parsed-class x))))
    ;;               (and obj
    ;;                    (setf (gethash (funcall key-accessor obj) hash-table) obj)))
    ;;          finally (return (values hash-table (hash-table-count hash-table))))
    ;; The setf here fails why?
    ;;     (values (setf hash-table new-hash)
    ;;                    (format nil ":FUNCTION `load-parsed-class-default-file-to-hash-table' errored when reading INPUT-FILE: ~
    ;;                                    ~A~% reverting to original value of HASH-TABLE with all key/val pairs unchanged"
    ;;                              input-file))))))
    (loop
      for x = (read fl nil 'EOF)
      until (eql x 'EOF)
      do (let ((obj (and x ;; paranoia in case x was the empty list.
                         (apply #'make-instance parsed-class x))))
           (and load-verbose
                (print obj))
           (and obj
                (setf (gethash (funcall key-accessor obj) hash-table) obj)))
      finally (return (values hash-table (hash-table-count hash-table))))))


;;; ==============================
;;; :TODO Currently this can corrupt an existing hash-table when loading a
;;; poorly formed "pctd" file e.g. if the is a missing paren or unclosed string.
;;; We should fix `load-parsed-class-default-file-to-hash-table' to unwind to a cached value of :hash-table <TABLE>.
;;
;; (macroexpand-1
;;       '(def-parsed-class-load-default-parsed-file-to-hash
;;         :parsed-class parsed-inventory-record
;;         :default-key-accessor inventory-number
;;         :default-input-pathname-sub-directory "parsed-inventory-record"
;;         :default-input-pathname-base-directory (default-input-pathname-base-directory
;;                                                 (merge-pathnames
;;                                                  (make-pathname :directory '(:relative "parsed-class-table-dumps"))
;;                                                  (dbc::sub-path dbc::*xml-output-dir*)))
;;         :default-pathname-type "pctd"))
(defmacro def-parsed-class-load-default-parsed-file-to-hash (&key parsed-class
                                                                  default-key-accessor
                                                                  ;; default-hash-table
                                                                  default-input-pathname-sub-directory
                                                                  (default-input-pathname-base-directory
                                                                   (merge-pathnames
                                                                    (make-pathname :directory '(:relative "parsed-class-table-dumps"))
                                                                    (dbc::sub-path dbc::*xml-output-dir*)))
                                                                  (default-pathname-type "pctd"))

  (let ((generated-name (alexandria:format-symbol (find-package "DBC")
                                                  "~:@(LOAD-~A-DEFAULT-FILE-TO-PARSE-TABLE~)"
                                                  parsed-class)))
    `(let ((parsed-class-wild-pathname-pattern
             ;; regex matching pathname-names with the format "<parsed-class>-YYYY-MM-DDTHHSSMM"
             (cl-ppcre:create-scanner
              (format nil "^~(~A~)-2[0-9]{3}?-[0-9]{2}?-[0-9]{2}?T[0-9]{6}?$" ',parsed-class))))
       (defun ,generated-name (&key (key-accessor ',default-key-accessor)
                                    (clear-existing-table nil)
                                    (load-verbose nil)
                                    (input-sub-directory ,default-input-pathname-sub-directory)
                                    (base-input-directory ,default-input-pathname-base-directory)
                                    (input-pathname-type ,default-pathname-type))
         (declare (boolean clear-existing-table))
         (let* ((maybe-wild-pathname
                  (merge-pathnames (make-pathname :name :wild
                                                  :type input-pathname-type)
                                   (or (probe-file (merge-pathnames
                                                    (make-pathname :directory `(:relative ,@(alexandria::ensure-list input-sub-directory)))
                                                    base-input-directory))
                                       (error ":FUNCTION `~S'~% -- did not find suitable directory containing parsed-table-dump-file"
                                              ',generated-name))))
                (maybe-find-wilds
                  (directory maybe-wild-pathname))
                ;; (parsed-class-wild-pathname-pattern
                ;;   ;; regex matching pathname-names with the format "<parsed-class>-YYYY-MM-DDTHHSSMM"
                ;;   (format nil "^~(~A~)-2[0-9]{3}?-[0-9]{2}?-[0-9]{2}?T[0-9]{6}?$" ',parsed-class))
                (most-recent-parse-file
                  (or (and maybe-find-wilds
                           (car (sort
                                 (delete-if-not #'(lambda (x) (cl-ppcre:scan parsed-class-wild-pathname-pattern x))
                                                maybe-find-wilds
                                                :key #'pathname-name)
                                 #'string>
                                 :key #'pathname-name)))
                      (error ":FUNCTION `~S'~% -- did not find suitable parsed file beneath directory:~% ~S"
                             ',generated-name
                             (pathname (directory-namestring maybe-wild-pathname))))))
           (when most-recent-parse-file
             (let ((table (parsed-class-parse-table ',parsed-class)))
               (and clear-existing-table (clrhash table))
               (load-parsed-class-default-file-to-hash-table :parsed-class ',parsed-class
                                                             :input-file most-recent-parse-file
                                                             :hash-table table
                                                             :key-accessor key-accessor
                                                             :load-verbose load-verbose))))))))

;; (print-sax-parsed-slots object :stream fl :print-unbound print-unbound :pre-padded-format-control calculate-padding)

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
;; :NOTE The functionality is now available with the methods `parsed-class-parse-table'.
;;
(defun write-sax-parsed-class-hash-to-files (hash-table &key parsed-class
                                                             slot-for-file-name
                                                             (slot-for-file-name-zero-padded nil)
                                                             prefix-for-file-name
                                                             (pathname-type "lisp")
                                                             output-directory
                                                             (if-exists-rename t))
  (declare (type hash-table hash-table)
           (type (and symbol (mon::not-null)) slot-for-file-name parsed-class)
           (type (or string null) prefix-for-file-name)
           (type boolean if-exists-rename))
  (unless
      ;; (osicat:directory-exists-p output-directory)
      (equal (pathname output-directory)
             (make-pathname :directory (pathname-directory (probe-file output-directory))))
    (error "arg OUTPUT-DIRECTORY does not designate a valid directory~% got: ~S~%"
           output-directory))
  (let ((calculate-padding (print-sax-parsed-slots-padding-format-control (make-instance parsed-class)))
        (file-namestrings (make-array (hash-table-count hash-table) :fill-pointer 0)))
    (flet ((hash-file-writer (k v)
             (declare (ignore k)
                      (type parsed-class v))
             (vector-push-extend
              (file-namestring
               (write-sax-parsed-slots-to-file v
                                               :slot-for-file-name slot-for-file-name
                                               :slot-for-file-name-zero-padded slot-for-file-name-zero-padded
                                               :prefix-for-file-name prefix-for-file-name
                                               :pathname-type pathname-type
                                               :output-directory output-directory
                                               :directory-exists-check nil
                                               :if-exists-rename if-exists-rename
                                               :pre-padded-format-control calculate-padding))
              file-namestrings)))
      (maphash #'hash-file-writer hash-table))
    (coerce file-namestrings 'list)))

;; (funcall #'(lambda (&key (x 1) (y (+ x 1))) y)) => 3
;; (funcall #'(lambda (&key (y (+ x 1)) (x 1)) y) :y 8) => 8
;; (funcall #'(lambda (&key (y (+ x 1)) (x 1)) y)) => error
;; (funcall #'(lambda (&key y (x 1) &aux (y (+ (or y 0) x 2))) y)) => 3
;; (funcall #'(lambda (&key y (x 1) &aux (y (+ (or y 0) x 2))) y) :y 4) => 7
;; (funcall #'(lambda (&key (y nil y-supplied-p) (x 1) &aux (y (if (and y y-supplied-p)
;;                                                                 y
;;                                                                 (+ (or y 0) x 2)))) y) :y 4) => 4
;;
;; :NOTE At this point call this a sax related function is a complete
;; misnomer... we're no longer really using the early raw sax parses _AT ALL_.
;; IOW the name of this function really sux and I have alot of trouble
;; remembering its name and/or that it exists!
;; The only reason we keep it like this is for congruence with other associated
;; functions an for Slime symbol name completion.
;; maybe consider an alias `write-parsed-inventory-record-parse-table-to-files'
;;
;; Following writes a <0NNNNN>.lisp file containing the value of each item
;; record in default parsed-inventory-record hash-table to a subdir beneath
;; *dbc-base-item-number-image-pathname*:
;; (write-parsed-inventory-record-parse-table-to-files (parsed-class-parse-table 'parsed-inventory-record))
(defun write-parsed-inventory-record-parse-table-to-files (hash-table
                                                           &key (base-output-directory *dbc-base-item-number-image-pathname*)
                                                                (checking-sold t)
                                                                (pathname-type "lisp")
                                                                (if-exists-rename t))
  (declare (type hash-table hash-table)
           (mon:pathname-or-namestring base-output-directory)
           ((or null string) pathname-type)
           (type boolean if-exists-rename))
  (write-sax-parsed-inventory-record-hash-to-zero-padded-directory hash-table
                                                                   :base-output-directory base-output-directory
                                                                   :checking-sold checking-sold
                                                                   :pathname-type pathname-type
                                                                   :if-exists-rename if-exists-rename))
;;
;; If we make HASH-TABLE a keyword we can default to (parsed-class-parse-table 'parsed-inventory-record)
(defun write-sax-parsed-inventory-record-hash-to-zero-padded-directory (hash-table
                                                                        &key (base-output-directory *dbc-base-item-number-image-pathname*)
                                                                             (checking-sold t)
                                                                             (pathname-type "lisp")
                                                                             (if-exists-rename t))
  (declare (type hash-table hash-table)
           (mon:pathname-or-namestring base-output-directory)
           ((or null string) pathname-type)
           (type boolean if-exists-rename))
  (unless
      ;; (osicat:directory-exists-p base-output-directory)
      (equal (pathname base-output-directory)
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
                        ;; (osicat:directory-exists-p padded-sold-directory)
                        (probe-file padded-sold-directory))
                   (setf padded-directory padded-sold-directory)
                   (ensure-directories-exist padded-directory))
               (vector-push-extend
                (write-sax-parsed-slots-to-file v
                                                :slot-for-file-name 'inventory-number
                                                :slot-for-file-name-zero-padded t
                                                :prefix-for-file-name ""
                                                :if-exists-rename if-exists-rename
                                                :pathname-type pathname-type
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


;;
;; :TODO (While the following might better handled in our persistence layer, we
;; don't have one yet and even where we do it prob. won't try to account for any
;; early stuff we do with subclasses of class `parsed-class' apply to esp. wrt
;; `update-instance-for-redefined-class' b/c at the parsed-class layer we
;; manually account for and maintain orthogonal relationship between the slots
;; of a parsed-class and its accessors...)
;;
;; For callers of `load-sax-parsed-xml-file-to-parsed-class-hash' which use it's
;; return value to SET-PARSED-CLASS-PARSE-TABLE (e.g. the automagically defined
;; functions returned by macro`def-parsed-class-record-xml-dump-file-and-hash')
;; we need a way to detect when a parsed-class has an existing populated
;; hash-table and if so when SET-PARSED-CLASS-PARSE-TABLE is non-nil it is a
;; keyword indicating to only populate with new instances of PARSED-CLASS with
;; new slot-values if the value has changed. A key dereferences instances of
;; PARSED-CLASS in the associated parsed-class-parse-table.
;;
;; Following enumerate the keywords identifying possible actions we might take:
;;
;; :SET-PARSED-CLASS-PARSE-TABLE nil - return a new hash-table the keys of which
;; derefernce to instances of PARSED-CLASS.
;;
;; :SET-PARSED-CLASS-PARSE-TABLE :PARSED-CLASS-SLOT-VALUES-UNCONDITIONAL-UPDATE
;; - unconditionally set newly parsed slot/slot-value pairs for each existing or
;; new instance without checking for differences.
;;
;; :SET-PARSED-CLASS-PARSE-TABLE :PARSED-CLASS-SLOT-VALUES-USE-EXISTING - If an
;; existing instance exists for any slot/slot-value pair if differences exist
;; between the newly parsed instance and the existing instance keep the
;; existing-instance slot-value. If there is no existing instance add the new
;; instance to the parsed-class-parse-table.
;;
;; :SET-PARSED-CLASS-PARSE-TABLE :PARSED-CLASS-SLOT-VALUES-USE-NEW - If an
;; existing instance exists for any slot/slot-value pair if differences exist
;; between the newly parsed instance and the existing instance set the
;; existing-instance slot-value to the newly parsed value.  If there is no
;; existing instance add the new instance to the table.
;;
;; Regardless the basic form is to do something like this:
;;
;; (loop
;;    with parsed-accessor = (accessors-of-parsed-class '<PARSED-CLASS>)
;;    with changed = ()
;;    for new-key being the hash-keys in <NEW-HASH> using (hash-value new-object-with-values)
;;    for existing-key being the hash-keys in <OLD-HASH> using (hash-value existing-object-with-values)
;;    if existing-object-with-values
;;    do (loop
;;          for accessor in parsed-accessor
;;          for new-value = (funcall accessor new-object-with-values)
;;          for existing-value = (funcall accessor existing-object-with-values)
;;          unless (equalp new-value existing-value)
;;          do (setf (slot-value existing-object-with-values accessor) new-value) and
;;          do (push (slot-value existing-object-with-values accessor) changed))
;;    finally (return changed))
;;
;; Following is a working example using the template above:
;;
;; (defparameter *tt--hash*
;;   (load-sax-parsed-xml-file-to-parsed-class-hash :parsed-class 'parsed-inventory-sales-sold-in-store-record
;;                                                  :hash-table (make-hash-table :test #'equal)
;;                                                  :input-file (merge-pathnames (make-pathname :directory '(:relative "parsed-xml-inventory-sales-sold-in-store-record")
;;                                                                                              :name "sold-in-store-records-2012-02-20"
;;                                                                                              :type "lisp")
;;                                                                               (sub-path *xml-output-dir*))
;;                                                  :key-accessor 'inventory-number
;;                                                  :slot-dispatch-function 'set-parsed-inventory-sales-sold-in-store-record-slot-value))
;; (loop
;;    with parsed-accessor = (accessors-of-parsed-class 'parsed-inventory-sales-sold-in-store-record)
;;    with changed = ()
;;    for new-key being the hash-keys in *tt--hash* using (hash-value new-object-with-values)
;;    for existing-key being the hash-keys in (parsed-class-parse-table 'parsed-inventory-sales-sold-in-store-record) using (hash-value existing-object-with-values)
;;    if existing-object-with-values
;;    do (loop
;;          for accessor in parsed-accessor
;;          for new-value = (funcall accessor new-object-with-values)
;;          for existing-value = (funcall accessor existing-object-with-values)
;;          unless (equalp new-value existing-value)
;;          do (setf (slot-value existing-object-with-values accessor) new-value) and
;;          do (push (slot-value existing-object-with-values accessor) changed))
;;     finally (return changed))
;;
;; (equal "ABC" "abc")
;; (equal (cons "a" nil) (list "a"))
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
  ;; (let* ((generated-name (%parsed-class-dumper-format-and-intern-symbol parsed-class))
  ;; :NOTE PARSED-CLASS' `parsed-class-slot-dispatch-function' may need to
  ;; be evaluated at macroexpansion time.
  ;; (dispatch-fun   (parsed-class-slot-dispatch-function parsed-class)))
  ;;)
  (let ((generated-name (alexandria:format-symbol (find-package "DBC")
                                                  "~:@(~A-XML-DUMP-FILE-AND-HASH~)"
                                                  parsed-class))
        );; (dispatch-fun (parsed-class-slot-dispatch-function parsed-class)))
    `(defun ,generated-name (&key (input-file (make-pathname
                                               :directory (pathname-directory (sub-path *xml-input-dir*))
                                               :name ,default-input-pathname-name))
                                  (output-pathname-sub-directory ,default-output-pathname-sub-directory)
                                  (output-pathname-base-directory ,default-output-pathname-base-directory)
                                  (output-pathname-name ,default-output-pathname-name)
                                  (output-pathname-dated-p t)
                                  (output-pathname-type "lisp")
                                  (set-parsed-class-parse-table t))
       (let* ((parsed-xml-file
                (multiple-value-list
                 (write-sax-parsed-xml-to-file
                  :input-file input-file
                  :output-file (make-parsed-class-output-file-ensuring-pathname
                                :pathname-sub-directory output-pathname-sub-directory
                                :pathname-base-directory output-pathname-base-directory
                                :pathname-name output-pathname-name
                                :pathname-name-dated-p output-pathname-dated-p
                                :pathname-type output-pathname-type))))
              (parsed-hash  (make-hash-table :test 'equal :size (mon:prime-or-next-greatest (caddr parsed-xml-file)))))
         ;; (loaded-hash
         ;; (multiple-value-list
         (let ((dispatch-fun (parsed-class-slot-dispatch-function ',parsed-class)))
           (load-sax-parsed-xml-file-to-parsed-class-hash
            :parsed-class ',parsed-class
            :input-file (cadr parsed-xml-file)
            :hash-table  parsed-hash
            :key-accessor  (function ,default-key-accessor)
            ;; e.g. class specific function as defined by macro `def-set-parsed-class-record-slot-value'
            ;; :slot-dispatch-function (function ,(parsed-class-slot-dispatch-function parsed-class)))
            :slot-dispatch-function dispatch-fun))
         (values
          (if set-parsed-class-parse-table
              ;; (setf (gethash ',parsed-class *parsed-class-parse-table*) parsed-hash)
              (setf (parsed-class-parse-table ',parsed-class) parsed-hash)
              parsed-hash)
          (cadr  parsed-xml-file)
          (caddr parsed-xml-file))))))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
