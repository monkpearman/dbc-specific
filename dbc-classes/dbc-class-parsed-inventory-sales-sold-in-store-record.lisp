;;; :FILE-CREATED <Timestamp: #{2012-02-16T12:31:29-05:00Z}#{12074} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-inventory-sold-in-store-record.lisp
;;; ==============================

;; `base-inventory-sales-order-record' `parsed-inventory-sales-sold-record' `*control-id-inventory-sales-order-namespace*'.
;; `base-inventory-sales-sold-record' `parsed-inventory-sales-sold-record' `*control-id-inventory-sales-order-namespace*'.
;; `base-inventory-sales-sold-in-store-record' `parsed-inventory-sales-sold-in-store-record' `*control-id-inventory-sales-sold-in-store-namespace*'.

#|
These contents of these XML files correspond to the following derbycityprints SQL tables:
 "orders-xml"         ; `orders`
 "sold-in-store-xml"  ; `sold_refs`
 "sold-refs-xml")     ; `sold_in_store`
 (loop 
    with base-dir = (sub-path *xml-input-dir*)
    for sold-xml-pathnames in (list "orders-xml" "sold-in-store-xml" "sold-refs-xml")
    collect (merge-pathnames (make-pathname :name sold-xml-pathnames) base-dir))

|#

(in-package #:dbc)

;; (<SLOT>
;;     :initarg :<SLOT-INIT>
;;     :accessor <SLOT-ACCESSOR>
;;     :documentation ":ORIGINAL-FIELD \"<ORIGINAL-STRING>\"")
;; 
;; (defclass parsed-inventory-sales-sold-in-store-record (parsed-class)
;;  (()))

;; (make-parsed-class-field-slot-accessor-mapping 
;;  'parsed-inventory-sales-sold-in-store-record
;;  '((<MATCH-STRING> . <TRANSFORM>)
;;    (<MATCH-STRING> . <TRANSFORM>)
;;    )))


;;; ==============================
;; :FIELD "id" :TRANSFORM
;;
;;         :TYPE "mediumint(8) unsigned"
;;         :NULL-P "NO"
;;         :KEY "PRI"
;;         :EXTRA "auto_increment"
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "price" :TRANSFORM
;;
;;         :TYPE "mediumint(9)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "ref" :TRANSFORM
;;
;;         :TYPE "mediumint(8) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "comment" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "date" :TRANSFORM
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;
;;; ==============================
;; `sold_in_store`
;;
;; <field Field="id" Type="mediumint(8) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
;; <field Field="price" Type="mediumint(9)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="ref" Type="mediumint(8) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="comment" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="date" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />

;;; ==============================
;;; EOF
