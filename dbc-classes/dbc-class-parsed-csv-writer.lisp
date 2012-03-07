;;; :FILE-CREATED <Timestamp: #{2012-03-07T11:06:01-05:00Z}#{12103} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-csv-writer.lisp
;;; ==============================

;; writers for dumping contents of a parsed-class-parse-table to a csv file.
;;
;; csv-parser:*field-separator*
;; csv-parser:*quote-character*

(in-package #:dbc)



;; in its final form this should be `write-parsed-class-parse-table-to-csv-file'
(defun parsed-inventory-record-write-parse-table-to-csv-file (&key parsed-class 
                                                                   prefix-for-file-name
                                                                   output-sub-directory
                                                                   (base-output-directory (dbc::sub-path dbc::*xml-output-dir*))
                                                                   ;; list of slots of class to omit from the csv
                                                                   filtering-slot-list
                                                                   ;; whether slots written to csv header are :upcase or :downcase
                                                                   (slot-header-case :downcase)
                                                                   )
;;
;; (osicat:directory-exists-p base-output-directory)
;; (osicat:directory-exists-p (merge-pathnames (make-pathname :directory `(:relative ,output-sub-directory)) base-output-directory))
 (let ((parse-table (dbc::parsed-class-parse-table parsed-class))) ;;'dbc::parsed-inventory-record)
   ;; (slot-header-initargs  (reverse (initargs-of-parsed-class parsed-class)))
   ;; (slots-matching-header (accessors-of-parsed-class parsed-class))

   (unless (zerop (hash-table-count parse-table))
     (with-open-file 
         (c (merge-pathnames 
             (make-pathname :directory '(:relative "parsed-xml-inventory-records")
                            :name (mon:timestamp-for-file-with :prefix "inventory-record-csv")
                            :type "csv")
             (dbc::sub-path dbc::*xml-output-dir*))
            :direction :output
            :if-exists :supersede
            :if-does-not-exist :create
            :element-type 'character
            :external-format :utf-8)
       (loop 
         initially (format c "~{~(~S~)~^,~}~%"  (reverse (initargs-of-parsed-class parsed-class)) ;;'dbc::parsed-inventory-record)))
                           ;; with slot-list = (dbc::accessors-of-parsed-class 'dbc::parsed-inventory-record)
                           for accessors =  (accessors-of-parsed-class parsed-class) ;; 'dbc::parsed-inventory-record)
                           for object being the hash-values in (dbc::parsed-class-parse-table 'dbc::parsed-inventory-record)
                           do (loop 
                                ;; initially (format c "~{~(~S~)~^,~}~%"  (dbc::initargs-of-parsed-class 'dbc::parsed-inventory-record))  
                                ;; with object = (gethash "9699" (dbc::parsed-class-parse-table 'dbc::parsed-inventory-record))
                                ;; with unbound = NIL ;(when print-unbound "#<UNBOUND>") ;(if print-unbound "#<UNBOUND>" "; #<UNBOUND>")
                                for slot-chk in accessors ;;in slot-list ;; (mon:class-slot-list object)
                                for x = (and (slot-boundp object slot-chk) (slot-value object slot-chk))
                                collect x into rtn
                                finally  (csv-parser:write-csv-line c (nreverse rtn)))))
       )))

(accessors-of-parsed-class 'parsed-inventory-record)
(initargs-of-parsed-class 'parsed-inventory-record)
(find-symbol (symbol-name :EDIT-HISTORY))

;;; ==============================
;;; EOF
