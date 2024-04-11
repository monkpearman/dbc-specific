;;; :FILE-CREATED <Timestamp: #{2011-10-05T23:57:24-04:00Z}#{11403} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parse-convert-late.lisp
;;; ==============================

;; :NOTE This file not currently used as forms in :FILE dbc-specific/loadtime-bind.lisp are sufficient.


(in-package #:dbc)

;; (%expand-parsed-class-record-setf-slot-value-forms parsed-inventory-record *parsed-class-field-slot-accessor-mapping-table*)
;; (defmacro %expand-parsed-class-record-setf-slot-value-forms (class table)
;;   `(%parsed-class-record-setf-slot-value-forms ',class  ,table))

;; (def-set-parsed-class-record-slot-value
;;     set-parsed-inventory-record-slot-value ; FUN-NAME
;;     parsed-inventory-record                ; PARSED-CLASS 
;;   )

(def-set-parsed-class-record-slot-value 
    set-parsed-inventory-record-slot-value
    parsed-inventory-record)

;;; ==============================
;;; EOF
