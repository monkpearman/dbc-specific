;;; :FILE-CREATED <Timestamp: #{2012-02-16T10:43:14-05:00Z}#{12074} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-inventory-sales-order-record.lisp
;;; ==============================

;; dbc-class-parsed-inventory-record.lisp

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
;; (defclass parsed-inventory-sales-order-record (parsed-class)
;;  (()))


;; control-id-

(make-parsed-class-field-slot-accessor-mapping 
 'parsed-inventory-sales-order-record
 '(("order_number"        . control-id-indexed-order-record)
   ("customer_email"      . )
   ("payment_type"        . )
   ("weight"              . )
   ("total"               . )
   ("PNREF"               . )
   ("RESULT"              . )
   ("RESPMSG"             . )
   ("AUTHCODE"            . )
   ("PREFPSMSG"           . )
   ("POSTFPSMSG"          . )
   ("IAVS"                . )
   ("IP"                  . )
   ("card_name"           . )
   ("status"              . )
   ("amount_1"            . )
   ("sale_tax"            . )
   ("track_number"        . )
   ("date_shipped"        . shipped-date)
   ("id"                  . ignorable-id-number)
   ("order_date"          . order-date)
   ("mo_received"         . money-order-received)
   ("mo_received_date"    . money-order-received-date)
   ("check_received"      . check-received)
   ("check_received_date" . check-received-date)
   ("mo_cleared_date"     . money-order-cleared-date)
   ("check_cleared_date"  . check-cleared-date)
   ("check_cleared"       . check-cleared)
   ("mo_cleared"          . money-order-cleared)
   ("xml_data"            . response-xml-data)
   ("ship_firstname"      . ship-to-first-name)
   ("ship_last_name"      . ship-to-last-name)
   ("ship_company"        . ship-to-company)
   ("ship_adress1"        . ship-to-address-1)
   ("ship_adress2"        . ship-to-address-2)
   ("ship_city"           . ship-to-city)
   ("ship_country"        . ship-to-country)
   ("ship_state"          . ship-to-state)
   ("ship_phone1"         . ship-to-phone-number-1)
   ("ship_phone2"         . ship-to-phone-number-2)
   ("bill_first_name"     . bill-to-first-name)
   ("bill_lastname"       . bill-to-last-name)
   ("bill_company"        . bill-to-company)
   ("bill_adress1"        . bill-to-address-1)
   ("bill_adress2"        . bill-to-address-2)
   ("bill_city"           . bill-to-city)
   ("bill_country"        . bill-to-country)
   ("bill_state"          . bill-to-state)
   ("bill_phone1"         . bill-to-phone-number-1)
   ("bill_phone2"         . bill-to-phone-number-2)
   ("ship_zip"            . ship-to-zip)
   ("bill_zip"            . bill-to-zip)
   ("cb_status"           . )
   ("date_auth"           . authorized-date)
   ("date_void"           . voided-date)
   ("who_did_cb"          . )
   ("why_cb"              . )
   ("action_ip"           . )
   ("ounces"              . )
   ("pounds"              . )
   ("postal_service"      . )
   ("actual_shipcost"     . )
   ("archived"            . )
   ))






;;; ==============================
;; :FIELD "order_number" :TRANSFORM
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  3210ureb311430
;;
;; -
;;

;;; ==============================
;; :FIELD "customer_email" :TRANSFORM
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  customer@some-domain.com
;;
;; -
;;

;;; ==============================
;; :FIELD "payment_type" :TRANSFORM
;;
;;         :TYPE "tinyint(4)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  1 | 3
;; 
;;
;; - No clue what these were supposed to indicate and it appears that 0 and 2 are never used.
;; 
;; (search-forward-regexp "name=\"payment_type\"\>[^0]+\</field\>" nil t)
;;

;;; ==============================
;; :FIELD "weight" :TRANSFORM
;;
;;         :TYPE "int(11)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0
;;
;; - always 0
;; (search-forward-regexp "name=\"weight\"\>[^0]+\</field\>" nil t)

;;; ==============================
;; :FIELD "total" :TRANSFORM
;;
;;         :TYPE "float"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  5.85
;;  38.5
;;  100
;;
;; - a floating point number
;;

;;; ==============================
;; :FIELD "PNREF" :TRANSFORM
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - :NOTE case is important when using `make-parsed-class-field-slot-accessor-mapping'
;;

;;; ==============================
;; :FIELD "RESULT" :TRANSFORM
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - :NOTE case is important when using `make-parsed-class-field-slot-accessor-mapping'
;;

;;; ==============================
;; :FIELD "RESPMSG" :TRANSFORM
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - case is important when using `make-parsed-class-field-slot-accessor-mapping'
;;

;;; ==============================
;; :FIELD "AUTHCODE" :TRANSFORM
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - case is important when using `make-parsed-class-field-slot-accessor-mapping'
;;

;;; ==============================
;; :FIELD "PREFPSMSG" :TRANSFORM
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - case is important when using `make-parsed-class-field-slot-accessor-mapping'
;;

;;; ==============================
;; :FIELD "POSTFPSMSG" :TRANSFORM
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - case is important when using `make-parsed-class-field-slot-accessor-mapping'
;;

;;; ==============================
;; :FIELD "IAVS" :TRANSFORM
;;
;;         :TYPE "varchar(50)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - case is important when using `make-parsed-class-field-slot-accessor-mapping'
;;

;;; ==============================
;; :FIELD "IP" :TRANSFORM
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - case is important when using `make-parsed-class-field-slot-accessor-mapping'
;;

;;; ==============================
;; :FIELD "card_name" :TRANSFORM
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "status" :TRANSFORM
;;
;;         :TYPE "tinyint(4)"
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
;; :FIELD "amount_1" :TRANSFORM
;;
;;         :TYPE "float"
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
;; :FIELD "sale_tax" :TRANSFORM
;;
;;         :TYPE "float"
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
;; :FIELD "track_number" :TRANSFORM
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
;; 
;;; ==============================
;; :FIELD "date_shipped" :TRANSFORM shipped-date
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0000-00-00 00:00:00"
;;         :EXTRA "on update CURRENT_TIMESTAMP"
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
;; :FIELD "order_date" :TRANSFORM
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0000-00-00 00:00:00"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "mo_received" :TRANSFORM
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
;; :FIELD "mo_received_date" :TRANSFORM
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0000-00-00 00:00:00"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "check_received" :TRANSFORM
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
;; :FIELD "check_received_date" :TRANSFORM
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0000-00-00 00:00:00"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "mo_cleared_date" :TRANSFORM
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0000-00-00 00:00:00"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "check_cleared_date" :TRANSFORM
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0000-00-00 00:00:00"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "check_cleared" :TRANSFORM
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
;; :FIELD "mo_cleared" :TRANSFORM
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
;; :FIELD "xml_data" :TRANSFORM
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
;; :FIELD "ship_firstname" :TRANSFORM
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
;; :FIELD "ship_last_name" :TRANSFORM
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
;; :FIELD "ship_company" :TRANSFORM
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
;; :FIELD "ship_adress1" :TRANSFORM
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
;; :FIELD "ship_adress2" :TRANSFORM
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
;; :FIELD "ship_city" :TRANSFORM
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
;; :FIELD "ship_country" :TRANSFORM
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
;; :FIELD "ship_state" :TRANSFORM
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
;; :FIELD "ship_phone1" :TRANSFORM
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
;; :FIELD "ship_phone2" :TRANSFORM
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
;; :FIELD "bill_first_name" :TRANSFORM
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
;; :FIELD "bill_lastname" :TRANSFORM
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
;; :FIELD "bill_company" :TRANSFORM
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
;; :FIELD "bill_adress1" :TRANSFORM
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
;; :FIELD "bill_adress2" :TRANSFORM
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
;; :FIELD "bill_city" :TRANSFORM
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
;; :FIELD "bill_country" :TRANSFORM
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
;; :FIELD "bill_state" :TRANSFORM
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
;; :FIELD "bill_phone1" :TRANSFORM
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
;; :FIELD "bill_phone2" :TRANSFORM
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
;; :FIELD "ship_zip" :TRANSFORM
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
;; :FIELD "bill_zip" :TRANSFORM
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
;; :FIELD "cb_status" :TRANSFORM
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
;; :FIELD "date_auth" :TRANSFORM
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0000-00-00 00:00:00"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "date_void" :TRANSFORM
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0000-00-00 00:00:00"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "who_did_cb" :TRANSFORM
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
;; :FIELD "why_cb" :TRANSFORM
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
;; :FIELD "action_ip" :TRANSFORM
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
;; :FIELD "ounces" :TRANSFORM
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
;; :FIELD "pounds" :TRANSFORM
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
;; :FIELD "postal_service" :TRANSFORM
;;
;;         :TYPE "varchar(100)"
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
;; :FIELD "actual_shipcost" :TRANSFORM
;;
;;         :TYPE "float"
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
;; :FIELD "archived" :TRANSFORM
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
;;
;; `orders` table
;;
;; <field Field="order_number" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="customer_email" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="payment_type" Type="tinyint(4)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="weight" Type="int(11)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="total" Type="float" Null="YES" Key="" Extra="" />
;; <field Field="PNREF" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="RESULT" Type="varchar(100)" Null="YES" Key="" Extra="" />
;; <field Field="RESPMSG" Type="varchar(100)" Null="YES" Key="" Extra="" />
;; <field Field="AUTHCODE" Type="varchar(100)" Null="YES" Key="" Extra="" />
;; <field Field="PREFPSMSG" Type="varchar(255)" Null="YES" Key="" Extra="" />
;; <field Field="POSTFPSMSG" Type="varchar(255)" Null="YES" Key="" Extra="" />
;; <field Field="IAVS" Type="varchar(50)" Null="YES" Key="" Extra="" />
;; <field Field="IP" Type="varchar(100)" Null="YES" Key="" Extra="" />
;; <field Field="card_name" Type="varchar(100)" Null="YES" Key="" Extra="" />
;; <field Field="status" Type="tinyint(4)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="amount_1" Type="float" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="sale_tax" Type="float" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="track_number" Type="varchar(100)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="date_shipped" Type="timestamp" Null="NO" Key="" Default="0000-00-00 00:00:00" Extra="on update CURRENT_TIMESTAMP" />
;; <field Field="id" Type="int(10) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
;; <field Field="order_date" Type="timestamp" Null="NO" Key="" Default="0000-00-00 00:00:00" Extra="" />
;; <field Field="mo_received" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="mo_received_date" Type="timestamp" Null="NO" Key="" Default="0000-00-00 00:00:00" Extra="" />
;; <field Field="check_received" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="check_received_date" Type="timestamp" Null="NO" Key="" Default="0000-00-00 00:00:00" Extra="" />
;; <field Field="mo_cleared_date" Type="timestamp" Null="NO" Key="" Default="0000-00-00 00:00:00" Extra="" />
;; <field Field="check_cleared_date" Type="timestamp" Null="NO" Key="" Default="0000-00-00 00:00:00" Extra="" />
;; <field Field="check_cleared" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="mo_cleared" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="xml_data" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="ship_firstname" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ship_last_name" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ship_company" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ship_adress1" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ship_adress2" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ship_city" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ship_country" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ship_state" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ship_phone1" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ship_phone2" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bill_first_name" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bill_lastname" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bill_company" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bill_adress1" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bill_adress2" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bill_city" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bill_country" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bill_state" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bill_phone1" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bill_phone2" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ship_zip" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bill_zip" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="cb_status" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="date_auth" Type="timestamp" Null="NO" Key="" Default="0000-00-00 00:00:00" Extra="" />
;; <field Field="date_void" Type="timestamp" Null="NO" Key="" Default="0000-00-00 00:00:00" Extra="" />
;; <field Field="who_did_cb" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="why_cb" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="action_ip" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ounces" Type="mediumint(8) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="pounds" Type="mediumint(8) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="postal_service" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="actual_shipcost" Type="float" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="archived" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />





;;; ==============================
;;; EOF
