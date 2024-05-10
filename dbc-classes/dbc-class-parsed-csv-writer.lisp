;;; :FILE-CREATED <Timestamp: #{2012-03-07T11:06:01-05:00Z}#{12103} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-csv-writer.lisp
;;; ==============================

;; Writers for dumping contents of a parsed-class-parse-table to a csv file.
;;
;; csv-parser:*field-separator*
;; csv-parser:*quote-character*

;; CSV-PARSER:WRITE-CSV-LINE
;; MON:STRING-NOT-NULL-EMPTY-OR-ALL-WHITESPACE
;; MON:STRING-LENGTH
;; ALEXANDRIA::ENSURE-LIST



(in-package #:dbc)

(defun parsed-class-csv-clean-prefix-for-file-name (prefix-for-file-name)
  (declare (MON:STRING-NOT-NULL-EMPTY-OR-ALL-WHITESPACE prefix-for-file-name))
  (let ((cln-prefix-for-file-name
          (string-trim `(#\_ #\- ,@MON:*WHITESPACE-CHARS*)
                       (MON:STRING-REPLACE-ALL prefix-for-file-name "CSV" "" :test #'char-equal))))
    (if (zerop (MON:STRING-LENGTH cln-prefix-for-file-name))
        (error ":FUNCTION `parsed-class-csv-clean-prefix-for-file-name' -- arg PREFIX-FOR-FILE-NAME ~
                 is the empty string after cleaning~% got: ~S" prefix-for-file-name)
        (concatenate 'string cln-prefix-for-file-name "-CSV"))))

(defun write-parsed-class-parse-table-to-csv-file (&key parsed-class
                                                        prefix-for-file-name
                                                        output-sub-directory
                                                        (base-output-directory (sub-path *parsed-class-table-csv-output-dir*))
                                                        filtering-slot-list
                                                        (slot-header-case :downcase))
  (declare (MON:STRING-NOT-NULL-EMPTY-OR-ALL-WHITESPACE prefix-for-file-name)
           (type (or string (and list (not null))) output-sub-directory)
           (MON:PATHNAME-OR-NAMESTRING base-output-directory)
           (list filtering-slot-list)
           (type (or (eql :downcase) (eql :upcase)) slot-header-case))
  ;; (osicat:directory-exists-p base-output-directory)
  ;; (osicat:directory-exists-p (merge-pathnames (make-pathname :directory `(:relative ,output-sub-directory)) base-output-directory))
  (let* ((parse-table (dbc::parsed-class-parse-table parsed-class)) ;;'dbc::parsed-inventory-record)
         (output-file
           (unless (zerop (hash-table-count parse-table))
             (make-parsed-class-output-file-ensuring-pathname
              :pathname-base-directory base-output-directory
              :pathname-sub-directory `(,@(ALEXANDRIA::ENSURE-LIST output-sub-directory))
              :pathname-name (parsed-class-csv-clean-prefix-for-file-name prefix-for-file-name)
              :pathname-name-dated-p t
              :pathname-type "csv"))))
    (when output-file
      (let* ((slot-header-initargs  (initargs-of-parsed-class  parsed-class))
             (slots-matching-header (accessors-of-parsed-class parsed-class))
             (key-slot-list         (and filtering-slot-list (pairlis slots-matching-header slot-header-initargs))))
        (when key-slot-list
          (flet ((match-and-remove (x)
                   (let ((slot-and-init-lookup (assoc x key-slot-list)))
                     (and slot-and-init-lookup
                          (member (car slot-and-init-lookup) slots-matching-header)
                          (setf slots-matching-header (delete (car slot-and-init-lookup) slots-matching-header))
                          (setf slot-header-initargs (delete (cdr slot-and-init-lookup) slot-header-initargs))))))
            (map nil #'match-and-remove filtering-slot-list)))
        (and
         slots-matching-header
         slot-header-initargs
         (with-open-file (c output-file
                            :direction :output
                            :if-exists :supersede
                            :if-does-not-exist :create
                            :element-type 'character
                            :external-format :utf-8)
           (loop
             initially (format c (if (eql slot-header-case :upcase)
                                     "~{~:@(~S~)~^,~}~%"
                                     "~{~(~S~)~^,~}~%")
                               (reverse slot-header-initargs))
             for object being the hash-values in parse-table
             do (loop
                  for slot-chk in slots-matching-header
                  for x = (and (slot-boundp object slot-chk) (slot-value object slot-chk))
                  collect x into rtn
                  finally  (CSV-PARSER:WRITE-CSV-LINE c (nreverse rtn))))
           output-file))))))

;; `write-parsed-inventory-record-parse-table-to-csv-file'
(defmacro def-parsed-class-write-csv-file  (&key parsed-class
                                             default-prefix-for-file-name
                                             default-output-pathname-sub-directory
                                             (default-output-pathname-base-directory (sub-path *parsed-class-table-csv-output-dir*))
                                             (default-slot-header-case :downcase))
  ;; let* to ensure `%parsed-class-dumper-format-and-intern-symbol' evaluated at macroexpansion time.
  ;; (let* ((generated-name (%parsed-class-dumper-format-and-intern-symbol parsed-class))
  ;; :NOTE PARSED-CLASS' `parsed-class-slot-dispatch-function' may need to
  ;; be evaluated at macroexpansion time.
  ;; (dispatch-fun   (parsed-class-slot-dispatch-function parsed-class)))
  ;;)
  (let ((generated-name (alexandria:format-symbol (find-package "DBC")
                                                  "~:@(WRITE-~A-PARSE-TABLE-TO-CSV-FILE~)"
                                                  parsed-class)))
    `(defun ,generated-name (&key (prefix-for-file-name ,default-prefix-for-file-name)
                                  (output-sub-directory ,default-output-pathname-sub-directory)
                                  (base-output-directory ,default-output-pathname-base-directory)
                                  filtering-slot-list
                                  (slot-header-case ,default-slot-header-case))
       (write-parsed-class-parse-table-to-csv-file :parsed-class ',parsed-class
                                                   :prefix-for-file-name  prefix-for-file-name
                                                   :output-sub-directory  output-sub-directory
                                                   :base-output-directory base-output-directory
                                                   :filtering-slot-list   filtering-slot-list
                                                   :slot-header-case      slot-header-case))))


;;; ==============================
;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
