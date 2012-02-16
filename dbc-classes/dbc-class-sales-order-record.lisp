;;; :FILE-CREATED <Timestamp: #{2012-02-16T14:28:04-05:00Z}#{12074} - by MON>
;;; :FILE /dbc-specific/dbc-classes/dbc-class-sales-order-record.lisp
;;; ==============================

;; base-record (base-dbc)
;; base-sales-order-record (base-record)
;; base-order-record (base-sales-order-record)
;; base-sold-record (base-sales-order-record)
;; base-sold-record-in-store (base-sales-order-record)

(in-package #:dbc)

(defclass base-sales-order-record (base-record)
  ()
  ;; parsed-order-record, parsed-sold-record-in-store, parsed-sold-record
  (:documentation ":NOTE The inverse corollary to the class `base-record' is the class `base-entity'."))

(defclass base-order-record (base-sales-order-record)
  ()
  ;; parsed-order-record
  (:documentation "For use with slot contents of `parsed-order-record'.
:NOTE The inverse corollary to the class `base-record' is the class `base-entity'."))

(defclass base-sold-record (base-sales-order-record)
  ()
  ;; parsed-order-record
  (:documentation "For use with slot contents of `parsed-sold-record'.
:NOTE The inverse corollary to the class `base-record' is the class `base-entity'."))

(defclass base-sold-record-in-store (base-sales-order-record)
  ()
  ;; parsed-order-record
  (:documentation "For use with slot contents of `parsed-sold-record-in-store'.
:NOTE The inverse corollary to the class `base-record' is the class `base-entity'."))


;;; ==============================
;;; EOF
