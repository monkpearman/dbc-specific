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
(defclass parsed-inventory-sales-sold-in-store-record (parsed-class)
  ((ignorable-sold-in-store-id-number
    :initarg :ignorable-sold-in-store-id-number
    :accessor ignorable-sold-in-store-id-number
    :documentation ":ORIGINAL-FIELD \"id\"")
   (price-sold-in-store
    :initarg :price-sold-in-store
    :accessor price-sold-in-store
    :documentation ":ORIGINAL-FIELD \"price\"")
   ( ;; control-id-indexed-inventory-record
    inventory-number
    :initarg :inventory-number
    :accessor inventory-number
    :documentation ":ORIGINAL-FIELD \"ref\"")
   (description-inventory-sold-in-store-comment
    :initarg :description-inventory-sold-in-store-comment
    :accessor description-inventory-sold-in-store-comment
    :documentation ":ORIGINAL-FIELD \"comment\"")
   (sold-in-store-date
    :initarg :sold-in-store-date
    :accessor sold-in-store-date
    :documentation ":ORIGINAL-FIELD \"date\""))
  (:documentation 
   #.(format nil
             "Class for parsed dbc xml `sold_in_store` table.~%~@
:EXAMPLE ~%
 \(mon:class-slot-list  'parsed-inventory-sales-order-record\)~%~@
:NOTE the accessor `inventory-number' should be used as value for the
KEY-ACCESSOR keyword of `load-sax-parsed-xml-file-to-parsed-class-hash'.~%
:SEE-ALSO `set-parsed-inventory-sales-sold-in-store-record-slot-value', ~
`parsed-inventory-sales-sold-in-store-record-xml-dump-file-and-hash'.")))


(make-parsed-class-field-slot-accessor-mapping
 'parsed-inventory-sales-sold-in-store-record
 '(("id"       . ignorable-sold-in-store-id-number)
   ("price"    . price-sold-in-store)
   ("ref"      . inventory-number)
   ("comment"  . description-inventory-sold-in-store-comment)
   ("date"     . sold-in-store-date)))

;; `parsed-inventory-sales-sold-in-store-record-xml-dump-file-and-hash'
;; (parsed-inventory-sales-sold-in-store-record-xml-dump-file-and-hash)
(def-parsed-class-record-xml-dump-file-and-hash
    :parsed-class parsed-inventory-sales-sold-in-store-record
  :default-key-accessor inventory-number
  :default-input-pathname-name "sold-in-store-xml"
  :default-output-pathname-sub-directory (list "parsed-xml-inventory-sales-sold-in-store-record")
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-name "sold-in-store-records")


;;; ==============================
;; :FIELD "id" :TRANSFORM ignorable-sold-in-store-id-number
;;
;;         :TYPE "mediumint(8) unsigned"
;;         :NULL-P "NO"
;;         :KEY "PRI"
;;         :EXTRA "auto_increment"
;;
;; :EXAMPLE-VALUES 
;;
;; - originally the primary key, but we've verified that each inventory-number is unique.

;;; ==============================
;; :FIELD "price" :TRANSFORM price-sold-in-store
;;
;;         :TYPE "mediumint(9)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0 | positive-integer
;;
;; - never contains floating points. 
;; price-ask, price-sold-ebay, 
;;

;;; ==============================
;; :FIELD "ref" :TRANSFORM inventory-number
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
;; - control-id-indexed-inventory-record
;; - Effectively a primary key, all field values are unique and we commented out
;;   the sole record with a non-sensical ref number (it was "0")

;;; ==============================
;; :FIELD "comment" :TRANSFORM description-inventory-sold-in-store-comment
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  sold with 8723
;;  sold with 298
;;  Bought with China map and Misc 067
;;
;; - empty or a comment regarding the sale.
;; - description-inventory-condition

;;; ==============================
;; :FIELD "date" :TRANSFORM sold-in-store-date
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "--"         ; replaced by "0000-00-00 00:00:00"
;;  "01-27-2005" ; replaced by "2005-01-27 00:00:00"
;;  
;;
;; - Note the date format MM-DD-YYYY was not congruent with our preferred form
;;   and the "--" was not commentable XML b/c the token "--" can't occur inside a comment.
;; payment-authorization-manual-verification-date 

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
