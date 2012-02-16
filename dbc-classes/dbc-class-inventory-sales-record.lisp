;;; :FILE-CREATED <Timestamp: #{2012-02-16T14:28:04-05:00Z}#{12074} - by MON>
;;; :FILE /dbc-specific/dbc-classes/dbc-class-sales-order-record.lisp
;;; ==============================

;; *control-id-inventory-sales-order-namespace*
;; *control-id-inventory-sales-sold-namespace*
;; *control-id-inventory-sales-sold-in-store-namespace*

;; base-record (base-dbc)
;; base-inventory-sales-record (base-record)
;; base-inventory-sales-order-record (base-inventory-sales-record)
;; base-inventory-sales-sold-record (base-inventory-sales-record)
;; base-inventory-sales-sold-in-store-record (base-inventory-sales-record)

;; `base-inventory-sales-order-record' `parsed-inventory-sales-sold-record' `*control-id-inventory-sales-order-namespace*'.
;; `base-inventory-sales-sold-record' `parsed-inventory-sales-sold-record' `*control-id-inventory-sales-order-namespace*'.
;; `base-inventory-sales-sold-in-store-record' `parsed-inventory-sales-sold-in-store-record' `*control-id-inventory-sales-sold-in-store-namespace*'.

(in-package #:dbc)

(defclass base-inventory-sales-record (base-record)
  ()
  (:documentation ":NOTE The inverse corollary to the class `base-record' is the class `base-entity'."))

(defclass base-inventory-sales-order-record (base-inventory-sales-record)
  ()
  (:documentation "For use with slot contents of `parsed-inventory-sales-sold-record' and `*control-id-inventory-sales-order-namespace*'.
:NOTE The inverse corollary to the class `base-record' is the class `base-entity'."))

(defclass base-inventory-sales-sold-record (base-inventory-sales-record)
  ()
  (:documentation "For use with slot contents of `parsed-inventory-sales-sold-record' and `*control-id-inventory-sales-sold-namespace*'.
:NOTE The inverse corollary to the class `base-record' is the class `base-entity'."))

(defclass base-inventory-sales-sold-in-store-record (base-inventory-sales-record)
  ()
  (:documentation "For use with slot contents of `parsed-inventory-sales-sold-in-store-record' and `*control-id-inventory-sales-sold-in-store-namespace*'.
:NOTE The inverse corollary to the class `base-record' is the class `base-entity'."))



;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
