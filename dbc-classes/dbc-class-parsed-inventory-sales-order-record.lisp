;;; :FILE-CREATED <Timestamp: #{2012-02-16T10:43:14-05:00Z}#{12074} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-inventory-sales-order-record.lisp
;;; ==============================

#|
 `base-inventory-sales-order-record' `parsed-inventory-sales-sold-record' `*control-id-inventory-sales-order-namespace*'.
 `base-inventory-sales-sold-record' `parsed-inventory-sales-sold-record' `*control-id-inventory-sales-order-namespace*'.
 `base-inventory-sales-sold-in-store-record' `parsed-inventory-sales-sold-in-store-record' `*control-id-inventory-sales-sold-in-store-namespace*'.

These contents of these XML files correspond to the following derbycityprints SQL tables:
 "orders-xml"         ; `orders`
 "sold-in-store-xml"  ; `sold_refs`
 "sold-refs-xml")     ; `sold_in_store`

 (loop 
    with base-dir = (sub-path *xml-input-dir*)
    for sold-xml-pathnames in (list "orders-xml" "sold-in-store-xml" "sold-refs-xml")
    collect (merge-pathnames (make-pathname :name sold-xml-pathnames) base-dir))


 :ELISP
 (progn (search-forward-regexp "^\\( (\\)\\(\".*\"\\)\\( +\\)\\(.*\\)\\()\\)" nil t)
        (replace-match "(\\4\n:initarg :\\4\n:accessor \\4\n:documentation \":ORIGINAL-FIELD \\2\")"))

 (<SLOT>
     :initarg :<SLOT-INIT>
     :accessor <SLOT-ACCESSOR>
     :documentation ":ORIGINAL-FIELD \"<ORIGINAL-STRING>\"")

;; #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01/orders-xml"
;; parsed-inventory-sales-order-record

;; (or (and (functionp ,default-key-accessor) ,default-key-accessor)
;;     (and (fboundp ,default-key-accessor)
;;          (function ,default-key-accessor))
;;     (error ":F"()))
;; (fdefinition (find-method #'inventory-number nil '(parsed-inventory-record)))

|#

(in-package #:dbc)




(defclass parsed-inventory-sales-order-record (parsed-class)
  (;; control-id-indexed-inventory-sales-order-record
   (order-number 
    :initarg :order-number
    :accessor order-number
    :documentation ":ORIGINAL-FIELD \"order_number\".")

   (customer-email
    :initarg :customer-email
    :accessor customer-email
    :documentation ":ORIGINAL-FIELD \"customer_email\".")

   (payment-type
    :initarg :payment-type
    :accessor payment-type
    :documentation ":ORIGINAL-FIELD \"payment_type\".")

   (ignorable-shipping-weight-combined
    :initarg :ignorable-shipping-weight-combined
    :accessor ignorable-shipping-weight-combined
    :documentation ":ORIGINAL-FIELD \"weight\".")

   (payment-price-total
    :initarg :payment-price-total
    :accessor payment-price-total
    :documentation ":ORIGINAL-FIELD \"total\".")

   (payment-authorization-pnref
    :initarg :payment-authorization-pnref
    :accessor payment-authorization-pnref
    :documentation ":ORIGINAL-FIELD \"PNREF\".")

   (payment-authorization-result
    :initarg :payment-authorization-result
    :accessor payment-authorization-result
    :documentation ":ORIGINAL-FIELD \"RESULT\".")

   (payment-authorization-respmsg
    :initarg :payment-authorization-respmsg
    :accessor payment-authorization-respmsg
    :documentation ":ORIGINAL-FIELD \"RESPMSG\".")

   (payment-authorization-authcode
    :initarg :payment-authorization-authcode
    :accessor payment-authorization-authcode
    :documentation ":ORIGINAL-FIELD \"AUTHCODE\".")

   (payment-authorization-prefpsmsg
    :initarg :payment-authorization-prefpsmsg
    :accessor payment-authorization-prefpsmsg
    :documentation ":ORIGINAL-FIELD \"PREFPSMSG\".")

   (payment-authorization-postfpsmsg
    :initarg :payment-authorization-postfpsmsg
    :accessor payment-authorization-postfpsmsg
    :documentation ":ORIGINAL-FIELD \"POSTFPSMSG\".")

   (payment-authorization-iavs
    :initarg :payment-authorization-iavs
    :accessor payment-authorization-iavs
    :documentation ":ORIGINAL-FIELD \"IAVS\".")

   (payment-authorization-ip
    :initarg :payment-authorization-ip
    :accessor payment-authorization-ip
    :documentation ":ORIGINAL-FIELD \"IP\".")

   (customer-card-name
    :initarg :customer-card-name
    :accessor customer-card-name
    :documentation ":ORIGINAL-FIELD \"card_name\".")

   (record-status-payment
    :initarg :record-status-payment
    :accessor record-status-payment
    :documentation ":ORIGINAL-FIELD \"status\".")

   ;; :SEE shipping-price-actual
   (shipping-price-ask
    :initarg :shipping-price-ask
    :accessor shipping-price-ask
    :documentation ":ORIGINAL-FIELD \"amount_1\".")
 
   (payment-price-taxable
    :initarg :payment-price-taxable
    :accessor payment-price-taxable
    :documentation ":ORIGINAL-FIELD \"sale_tax\"")

   ;; ignorable
   (ignorable-shipping-tracking-number
    :initarg :ignorable-shipping-tracking-number
    :accessor ignorable-shipping-tracking-number
    :documentation ":ORIGINAL-FIELD \"track_number\".")
 
   (shipping-date
    :initarg :shipping-date
    :accessor shipping-date
    :documentation ":ORIGINAL-FIELD \"date_shipped\".")

   (ignorable-order-id-number
    :initarg :ignorable-order-id-number
    :accessor ignorable-order-id-number
    :documentation ":ORIGINAL-FIELD \"id\".")

   (order-date
    :initarg :order-date
    :accessor order-date
    :documentation ":ORIGINAL-FIELD \"order_date\".")

   (payment-money-order-received
    :initarg :payment-money-order-received
    :accessor payment-money-order-received
    :documentation ":ORIGINAL-FIELD \"mo_received\".")

   (payment-money-order-received-date
    :initarg :payment-money-order-received-date
    :accessor payment-money-order-received-date
    :documentation ":ORIGINAL-FIELD \"mo_received_date\".")

   (payment-check-received
    :initarg :payment-check-received
    :accessor payment-check-received
    :documentation ":ORIGINAL-FIELD \"check_received\".")

   (payment-check-received-date
    :initarg :payment-check-received-date
    :accessor payment-check-received-date
    :documentation ":ORIGINAL-FIELD \"check_received_date\"")

   (payment-money-order-cleared-date
    :initarg :payment-money-order-cleared-date
    :accessor payment-money-order-cleared-date
    :documentation ":ORIGINAL-FIELD \"mo_cleared_date\"")

   (payment-check-cleared-date
    :initarg :payment-check-cleared-date
    :accessor payment-check-cleared-date
    :documentation ":ORIGINAL-FIELD \"check_cleared_date\".")

   (payment-check-cleared
    :initarg :payment-check-cleared
    :accessor payment-check-cleared
    :documentation ":ORIGINAL-FIELD \"check_cleared\".")

   (payment-money-order-cleared
    :initarg :payment-money-order-cleared
    :accessor payment-money-order-cleared
    :documentation ":ORIGINAL-FIELD \"mo_cleared\".")

   (payment-authorization-xml-data
    :initarg :payment-authorization-xml-data
    :accessor payment-authorization-xml-data
    :documentation ":ORIGINAL-FIELD \"xml_data\"")

   (customer-ship-to-first-name
    :initarg :customer-ship-to-first-name
    :accessor customer-ship-to-first-name
    :documentation ":ORIGINAL-FIELD \"ship_firstname\".")

   (customer-ship-to-last-name
    :initarg :customer-ship-to-last-name
    :accessor customer-ship-to-last-name
    :documentation ":ORIGINAL-FIELD \"ship_last_name\".")

   (customer-ship-to-company
    :initarg :customer-ship-to-company
    :accessor customer-ship-to-company
    :documentation ":ORIGINAL-FIELD \"ship_company\".")

   (customer-ship-to-address-1
    :initarg :customer-ship-to-address-1
    :accessor customer-ship-to-address-1
    :documentation ":ORIGINAL-FIELD \"ship_adress1\".")

   (customer-ship-to-address-2
    :initarg :customer-ship-to-address-2
    :accessor customer-ship-to-address-2
    :documentation ":ORIGINAL-FIELD \"ship_adress2\".")

   (customer-ship-to-city
    :initarg :customer-ship-to-city
    :accessor customer-ship-to-city
    :documentation ":ORIGINAL-FIELD \"ship_city\".")

   (customer-ship-to-country
    :initarg :customer-ship-to-country
    :accessor customer-ship-to-country
    :documentation ":ORIGINAL-FIELD \"ship_country\".")

   (customer-ship-to-state
    :initarg :customer-ship-to-state
    :accessor customer-ship-to-state
    :documentation ":ORIGINAL-FIELD \"ship_state\".")

   (customer-ship-to-phone-number-1
    :initarg :customer-ship-to-phone-number-1
    :accessor customer-ship-to-phone-number-1
    :documentation ":ORIGINAL-FIELD \"ship_phone1\".")

   (customer-ship-to-phone-number-2
    :initarg :customer-ship-to-phone-number-2
    :accessor customer-ship-to-phone-number-2
    :documentation ":ORIGINAL-FIELD \"ship_phone2\".")

   (customer-bill-to-first-name
    :initarg :customer-bill-to-first-name
    :accessor customer-bill-to-first-name
    :documentation ":ORIGINAL-FIELD \"bill_first_name\".")

   (customer-bill-to-last-name
    :initarg :customer-bill-to-last-name
    :accessor customer-bill-to-last-name
    :documentation ":ORIGINAL-FIELD \"bill_lastname\".")

   (customer-bill-to-company
    :initarg :customer-bill-to-company
    :accessor customer-bill-to-company
    :documentation ":ORIGINAL-FIELD \"bill_company\".")

   (customer-bill-to-address-1
    :initarg :customer-bill-to-address-1
    :accessor customer-bill-to-address-1
    :documentation ":ORIGINAL-FIELD \"bill_adress1\".")

   (customer-bill-to-address-2
    :initarg :customer-bill-to-address-2
    :accessor customer-bill-to-address-2
    :documentation ":ORIGINAL-FIELD \"bill_adress2\".")

   (customer-bill-to-city
    :initarg :customer-bill-to-city
    :accessor customer-bill-to-city
    :documentation ":ORIGINAL-FIELD \"bill_city\".")

   (customer-bill-to-country
    :initarg :customer-bill-to-country
    :accessor customer-bill-to-country
    :documentation ":ORIGINAL-FIELD \"bill_country\".")

   (customer-bill-to-state
    :initarg :customer-bill-to-state
    :accessor customer-bill-to-state
    :documentation ":ORIGINAL-FIELD \"bill_state\".")

   (customer-bill-to-phone-number-1
    :initarg :customer-bill-to-phone-number-1
    :accessor customer-bill-to-phone-number-1
    :documentation ":ORIGINAL-FIELD \"bill_phone1\".")

   (customer-bill-to-phone-number-2
    :initarg :customer-bill-to-phone-number-2
    :accessor customer-bill-to-phone-number-2
    :documentation ":ORIGINAL-FIELD \"bill_phone2\".")

   (customer-ship-to-zip
    :initarg :customer-ship-to-zip
    :accessor customer-ship-to-zip
    :documentation ":ORIGINAL-FIELD \"ship_zip\".")

   (customer-bill-to-zip
    :initarg :customer-bill-to-zip
    :accessor customer-bill-to-zip
    :documentation ":ORIGINAL-FIELD \"bill_zip\".")

   ;; AFAICT either 0 | 2
   (record-status-payment-verification
    :initarg :record-status-payment-verification
    :accessor record-status-payment-verification
    :documentation ":ORIGINAL-FIELD \"cb_status\".")
   
   (payment-authorization-manual-verification-date
    :initarg :payment-authorization-manual-verification-date
    :accessor payment-authorization-manual-verification-date
    :documentation ":ORIGINAL-FIELD \"date_auth\".")

   (payment-authorization-manual-void-date
    :initarg :payment-authorization-manual-void-date
    :accessor payment-authorization-manual-void-date
    :documentation ":ORIGINAL-FIELD \"date_void\".")

   ;; Shares generic
   (edit-by
    :initarg :edit-by
    :accessor edit-by
    :documentation ":ORIGINAL-FIELD \"who_did_cb\".")

   (payment-authorization-manual-verifcation-desicription
    :initarg :payment-authorization-manual-verifcation-desicription
    :accessor payment-authorization-manual-verifcation-desicription
    :documentation ":ORIGINAL-FIELD \"why_cb\".")

   ;; not sure if this is correct or not   
   (payment-authorization-manual-verification-ip
    :initarg :payment-authorization-manual-verification-ip
    :accessor payment-authorization-manual-verification-ip
    :documentation ":ORIGINAL-FIELD \"action_ip\".")

   ;; ignorable
   (shipping-weight-combined-ounces
    :initarg :shipping-weight-combined-ounces
    :accessor shipping-weight-combined-ounces
    :documentation ":ORIGINAL-FIELD \"ounces\".")

   ;; ignorable
   (shipping-weight-combined-pounds
    :initarg :shipping-weight-combined-pounds
    :accessor shipping-weight-combined-pounds
    :documentation ":ORIGINAL-FIELD \"pounds\".")

   ;; ingorable always empty
   (ignorable-usps-data
    :initarg ignorable-usps-data
    :accessor ignorable-usps-data 
    :documentation ":ORIGINAL-FIELD \"postal_service\"." )

   ;; ignorable always 0
   (shipping-price-actual
    :initarg shipping-price-actual
    :accessor shipping-price-actual
    :documentation ":ORIGINAL-FIELD \"actual_shipcost\".")

   (ignorable-payment-archived
    :initarg ignorable-payment-archived
    :accessor ignorable-payment-archived
    :documentation ":ORIGINAL-FIELD \"archived\".")
   )
  (:documentation 
   #.(format nil
             "Class for parsed dbc xml `orders` table.~%~@
:EXAMPLE ~%
 \(mon:class-slot-list  'parsed-inventory-sales-order-record\)~%~@
:NOTE the accessor `order-number' should be used as value for the
KEY-ACCESSOR keyword of `load-sax-parsed-xml-file-to-parsed-class-hash'.~%")))

;; parsed-inventory-sales-order-record
(make-parsed-class-field-slot-accessor-mapping 
 'parsed-inventory-sales-order-record
 '(("order_number"        . order-number)
   ("customer_email"      . customer-email)
   ("payment_type"        . payment-type)
   ("weight"              . ignorable-shipping-weight-combined)
   ("total"               . payment-price-total)
   ("PNREF"               . payment-authorization-pnref)
   ("RESULT"              . payment-authorization-result)
   ("RESPMSG"             . payment-authorization-respmsg)
   ("AUTHCODE"            . payment-authorization-authcode)
   ("PREFPSMSG"           . payment-authorization-prefpsmsg)
   ("POSTFPSMSG"          . payment-authorization-postfpsmsg)
   ("IAVS"                . payment-authorization-iavs)
   ("IP"                  . payment-authorization-ip)
   ("card_name"           . customer-card-name)
   ("status"              . record-status-payment)
   ("amount_1"            . shipping-price-ask)
   ("sale_tax"            . payment-price-taxable)
   ("track_number"        . ignorable-shipping-tracking-number)
   ("date_shipped"        . shipping-date)
   ("id"                  . ignorable-order-id-number)
   ("order_date"          . order-date)
   ("mo_received"         . payment-money-order-received)
   ("mo_received_date"    . payment-money-order-received-date)
   ("check_received"      . payment-check-received)
   ("check_received_date" . payment-check-received-date)
   ("mo_cleared_date"     . payment-money-order-cleared-date)
   ("check_cleared_date"  . payment-check-cleared-date)
   ("check_cleared"       . payment-check-cleared)
   ("mo_cleared"          . payment-money-order-cleared)
   ("xml_data"            . payment-authorization-xml-data)
   ("ship_firstname"      . customer-ship-to-first-name)
   ("ship_last_name"      . customer-ship-to-last-name)
   ("ship_company"        . customer-ship-to-company)
   ("ship_adress1"        . customer-ship-to-address-1)
   ("ship_adress2"        . customer-ship-to-address-2)
   ("ship_city"           . customer-ship-to-city)
   ("ship_country"        . customer-ship-to-country)
   ("ship_state"          . customer-ship-to-state)
   ("ship_phone1"         . customer-ship-to-phone-number-1)
   ("ship_phone2"         . customer-ship-to-phone-number-2)
   ("bill_first_name"     . customer-bill-to-first-name)
   ("bill_lastname"       . customer-bill-to-last-name)
   ("bill_company"        . customer-bill-to-company)
   ("bill_adress1"        . customer-bill-to-address-1)
   ("bill_adress2"        . customer-bill-to-address-2)
   ("bill_city"           . customer-bill-to-city)
   ("bill_country"        . customer-bill-to-country)
   ("bill_state"          . customer-bill-to-state)
   ("bill_phone1"         . customer-bill-to-phone-number-1)
   ("bill_phone2"         . customer-bill-to-phone-number-2)
   ("ship_zip"            . customer-ship-to-zip)
   ("bill_zip"            . customer-bill-to-zip)
   ("cb_status"           . record-status-payment-verification) ;; record-status-active
   ("date_auth"           . payment-authorization-manual-verification-date)
   ("date_void"           . payment-authorization-manual-void-date)
   ("who_did_cb"          . edit-by) ;;  
   ("why_cb"              . payment-authorization-manual-verifcation-desicription) ;; description-inventory-condition
   ("action_ip"           . payment-authorization-manual-verification-ip) ;; not sure if this is correct or not
   ("ounces"              . shipping-weight-combined-ounces) ;; ignorable
   ("pounds"              . shipping-weight-combined-pounds) ;; ignorable
   ("postal_service"      . ignorable-usps-data) ;; ingorable always empty
   ("actual_shipcost"     . shipping-price-actual) ;; ignorable always 0
   ("archived"            . ignorable-payment-archived)
   ))


;; (def-parsed-class-record-xml-dump-file-and-hash 
;;     parsed-inventory-sales-order-record
;;     order-number
;;   "orders-xml"
;;   (list "parsed-xml-inventory-sales-order-records")
;;   (sub-path *xml-output-dir*)
;;   "order-records")
;;
;; Defines the function `parsed-inventory-sales-order-record-xml-dump-file-and-hash'
;; :EXAMPLE
;; (parsed-inventory-sales-order-record-xml-dump-file-and-hash)
;; => #<HASH-TABLE :TEST EQUAL :COUNT 80 {E3B1731}>
;;    #P"../dbc-specific/xml-class-dump-dir/parsed-xml-inventory-sales-order-records/order-records-2012-02-16.lisp"
;;
;; `parsed-inventory-sales-order-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash 
    :parsed-class parsed-inventory-sales-order-record
  :default-key-accessor order-number
  :default-input-pathname-name "orders-xml"
  :default-output-pathname-sub-directory (list "parsed-xml-inventory-sales-order-records")
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-name "order-records")

;; (write-sax-parsed-xml-to-file :input-file (make-pathname :directory (pathname-directory (sub-path *xml-input-dir*))
;;                                                          :name "orders-xml")
;;                               :output-file (make-default-sax-parsed-xml-output-pathname 
;;                                             :pathname-sub-directory (list "parsed-xml-inventory-sales-order-records")
;;                                             :pathname-base-directory (sub-path *xml-output-dir*)
;;                                             :pathname-name "order-records"
;;                                             :pathname-name-dated-p t
;;                                             :pathname-type "lisp"))
;;
;; (let ((parsed-xml-file
;;        '(T #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/xml-class-dump-dir/parsed-xml-inventory-sales-order-records/order-records-2012-02-16.lisp"))
;;       (parsed-hash (make-hash-table :test 'equal))
;;       (set-inventory-record-table nil))
;;   (load-sax-parsed-xml-file-to-parsed-class-hash 
;;    :parsed-class 'parsed-inventory-sales-order-record
;;    :input-file (cadr parsed-xml-file)
;;    :hash-table parsed-hash
;;    :key-accessor #'order-number
;;    :slot-dispatch-function #'set-parsed-inventory-sales-order-record-slot-value)
;;   (values
;;    (if set-inventory-record-table
;;        (setf (gethash
;;               'parsed-inventory-sales-order-record
;;               *parsed-class-parse-table*)
;;              parsed-hash)
;;        parsed-hash)
;;    (cadr parsed-xml-file)))


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
;; - a dotted quad 
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
;;  +33 474851673
;;  0031-10-4041111
;;  +33389556525
;;  01 30 57 42 70
;;  717-334-5120
;;  (786) 4641888
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
;; as above if present else emtpy
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
;;  0000-00-00 00:00:00
;;  2007-10-30 18:12:28
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
;;  82.126.187.138
;;  68.18.93.248
;;  74.130.96.12
;;  81.57.10.195
;; 
;; - Empty or a a dotted quad
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
