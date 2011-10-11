;;; :FILE-CREATED <Timestamp: #{2011-10-11T00:18:31-04:00Z}#{11412} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-brand-record.lisp
;;; ==============================


(in-package #:dbc)
;; *package*

(defclass parsed-brand-record (parsed-naf-entity)
  ()
  )

(make-parsed-class-field-slot-accessor-mapping 
 'parsed-brand-record
 '(
   ))

;; :NOTE `set-parsed-inventory-record-slot-value' is defined in loadtime-bind.lisp
;; (def-set-parsed-class-record-slot-value 
;;      set-parsed-brand-record-slot-value
;;      parsed-brand-record)
;;
;;; *big-parsed-class-field-slot-accessor-mapping-table*

;;; ==============================
;;; EOF
