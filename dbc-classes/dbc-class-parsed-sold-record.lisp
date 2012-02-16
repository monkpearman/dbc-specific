;;; :FILE-CREATED <Timestamp: #{2012-02-16T12:37:25-05:00Z}#{12074} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/dbc-classes/dbc-class-parsed-sold-record.lisp
;;; ==============================

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

;; (defclass parsed-sold-record (parsed-class)
;;  (()))

;; (make-parsed-class-field-slot-accessor-mapping 
;;  'parsed-sold-record
;;  '((<MATCH-STRING> . <TRANSFORM>)
;;    (<MATCH-STRING> . <TRANSFORM>)
;;    ))

;;; ==============================
;; :FIELD "ref" :TRANSFORM
;;
;;         :TYPE "smallint(6)"
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
;; :FIELD "order_id" :TRANSFORM
;;
;;         :TYPE "varchar(100)"
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
;; :FIELD "id" :TRANSFORM
;;
;;         :TYPE "int(10) unsigned"
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
;; :FIELD "sold_where" :TRANSFORM
;;
;;         :TYPE "tinyint(3) unsigned"
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
;; :FIELD "month_sold" :TRANSFORM
;;
;;         :TYPE "varchar(45)"
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
;; :FIELD "day_sold" :TRANSFORM
;;
;;         :TYPE "varchar(45)"
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
;; :FIELD "year_sold" :TRANSFORM
;;
;;         :TYPE "varchar(45)"
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
;; :FIELD "sold_price" :TRANSFORM
;;
;;         :TYPE "int(10) unsigned"
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
;; :FIELD "notes" :TRANSFORM
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
;; `sold_refs`
;; <field Field="ref" Type="smallint(6)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="order_id" Type="varchar(100)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="id" Type="int(10) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
;; <field Field="sold_where" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="month_sold" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="day_sold" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="year_sold" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="sold_price" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="notes" Type="text" Null="NO" Key="" Extra="" />

;;; ==============================
;;; EOF
