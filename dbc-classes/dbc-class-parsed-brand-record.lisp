;;; :FILE-CREATED <Timestamp: #{2011-10-11T00:18:31-04:00Z}#{11412} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-brand-record.lisp
;;; ==============================


(in-package #:dbc)
;; *package*

(defclass parsed-brand-record (parsed-naf-entity)
  ((control-id-doc-num-brand
    :initarg :control-id-doc-num-brand
    :accessor control-id-doc-num-brand
    :documentation ":ORIGINAL-FIELD \"doc\"")

   (control-id-entity-num-brand
    :initarg :control-id-entity-num-brand
    :accessor control-id-entity-num-brand
    :documentation ":ORIGINAL-FIELD \"id\"")

   (control-id-display-brand
    :initarg :control-id-display-brand
    :accessor control-id-display-brand
    :documentation ":ORIGINAL-FIELD \"display\"")

   (naf-entity-brand-display-name-coref
    :initarg :naf-entity-brand-display-name-coref
    :accessor naf-entity-brand-display-name-coref
    :documentation ":ORIGINAL-FIELD \"used_for\"")

   ;; :NOTE This symbol-name sucks.
   (product-coref
    :initarg :product-coref
    :accessor product-coref
    :documentation ":ORIGINAL-FIELD \"products\"")

   ;; location-nationality
   (location-nation
    :initarg :location-nation
    :accessor location-nation
    :documentation ":ORIGINAL-FIELD \"country\"")

   ;; birth-date
   (founded-date
    :initarg :founded-date
    :accessor founded-date
    :documentation ":ORIGINAL-FIELD \"date_founded\"")

   ;; naf-entity-person-coref
   (naf-entity-person-founder-coref
    :initarg :naf-entity-person-founder-coref
    :accessor naf-entity-person-founder-coref
    :documentation ":ORIGINAL-FIELD \"founded_by\"")

   (naf-entity-brand-slogan
    :initarg :naf-entity-brand-slogan
    :accessor naf-entity-brand-slogan
    :documentation ":ORIGINAL-FIELD \"slogans\"")

   (control-id-db-0
    :initarg :control-id-db-0
    :accessor control-id-db-0
    :documentation ":ORIGINAL-FIELD \"LOC_control\"")

   (naf-entity-artist-coref
    :initarg :naf-entity-artist-coref
    :accessor naf-entity-artist-coref
    :documentation ":ORIGINAL-FIELD \"artists_assoc\"")

   (naf-entity-publication-coref
    :initarg :naf-entity-publication-coref
    :accessor naf-entity-publication-coref
    :documentation ":ORIGINAL-FIELD \"appeared_in\"")

   (description-brand-note-general
    :initarg :description-brand-note-general
    :accessor description-brand-note-general
    :documentation ":ORIGINAL-FIELD \"notes\"")

   (image-default-xref
    :initarg :image-default-xref
    :accessor image-default-xref
    :documentation ":ORIGINAL-FIELD \"print_default_pic\"")

   (image-default-id
    :initarg :image-default-id
    :accessor image-default-id
    :documentation ":ORIGINAL-FIELD \"default_pic\"")

   (record-status-active
    :initarg :record-status-active
    :accessor record-status-active
    :documentation ":ORIGINAL-FIELD \"online\"")

   (edit-by
    :initarg :edit-by
    :accessor edit-by
    :documentation ":ORIGINAL-FIELD \"user_name\"")

   (edit-by-creator
    :initarg :edit-by-creator
    :accessor edit-by-creator
    :documentation ":ORIGINAL-FIELD \"naf_creator\"")

   (edit-date-origin
    :initarg :edit-date-origin
    :accessor edit-date-origin
    :documentation ":ORIGINAL-FIELD \"date_edit\"")

   (edit-date
    :initarg :edit-date
    :accessor edit-date
    :documentation ":ORIGINAL-FIELD \"date_edt\""))

  (:documentation
   #.(format nil
             "
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")))

(make-parsed-class-field-slot-accessor-mapping 
 'parsed-brand-record
 '(("doc"                . control-id-doc-num-brand)
   ("id"                 . control-id-entity-num-brand)
   ("display"            . control-id-display-brand)
   ("used_for"           . naf-entity-brand-display-name-coref)
   ("products"           . product-coref)
   ("country"            . location-nation)
   ("date_founded"       . founded-date)
   ("founded_by"         . naf-entity-person-founder-coref)
   ("slogans"            . naf-entity-brand-slogan)
   ("LOC_control"        . control-id-db-0)
   ("artists_assoc"      . naf-entity-artist-coref)
   ("appeared_in"        . naf-entity-publication-coref)
   ("notes"              . description-brand-note-general)
   ("print_default_pic"  . image-default-xref)
   ("default_pic"        . image-default-id)
   ("online"             . record-status-active)
   ("user_name"          . edit-by)
   ("naf_creator"        . edit-by-creator)
   ("date_edit"          . edit-date-origin)
   ("date_edt"           . edit-date)
   ))


;; :NOTE `set-parsed-inventory-record-slot-value' is defined in loadtime-bind.lisp
;; (def-set-parsed-class-record-slot-value 
;;      set-parsed-brand-record-slot-value
;;      parsed-brand-record)
;;
;;; *big-parsed-class-field-slot-accessor-mapping-table*

;;; ==============================
;;
;; (length '("doc" "id" "display" "used_for" "products" "country" "date_founded" "founded_by"
;;           "slogans" "LOC_control" "artists_assoc" "appeared_in" "notes"
;;           "print_default_pic" "default_pic" "online" "user_name" "naf_creator" "date_edit"
;;           "date_edt"))
;;  => 20

;;; ==============================
;; :FIELD "doc" :TRANSFORM
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
;; :FIELD "id" :TRANSFORM
;;
;;         :TYPE "int(4) unsigned"
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
;; :FIELD "display" :TRANSFORM
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
;; :FIELD "products" :TRANSFORM
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
;; :FIELD "country" :TRANSFORM
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
;; :FIELD "date_founded" :TRANSFORM
;;
;;         :TYPE "varchar(255)"
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
;; :FIELD "founded_by" :TRANSFORM
;;
;;         :TYPE "varchar(255)"
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
;; :FIELD "date_edit" :TRANSFORM
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
;; :FIELD "print_default_pic" :TRANSFORM
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
;; :FIELD "slogans" :TRANSFORM
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
;; :FIELD "used_for" :TRANSFORM
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
;; :FIELD "LOC_control" :TRANSFORM
;;
;;         :TYPE "varchar(15)"
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
;; :FIELD "user_name" :TRANSFORM
;;
;;         :TYPE "varchar(32)"
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
;; :FIELD "naf_creator" :TRANSFORM
;;
;;         :TYPE "varchar(32)"
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
;; :FIELD "artists_assoc" :TRANSFORM
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
;; :FIELD "appeared_in" :TRANSFORM
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
;; :FIELD "default_pic" :TRANSFORM
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
;; :FIELD "online" :TRANSFORM
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
;; :FIELD "date_edt" :TRANSFORM
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "CURRENT_TIMESTAMP"
;;         :EXTRA "on update CURRENT_TIMESTAMP"
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

#|
<table_structure name="brand_infos">
<field Field="doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
<field Field="id" Type="int(4) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
<field Field="display" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="products" Type="text" Null="NO" Key="" Extra="" />
<field Field="country" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="date_founded" Type="varchar(255)" Null="YES" Key="" Extra="" />
<field Field="founded_by" Type="varchar(255)" Null="YES" Key="" Extra="" />
<field Field="notes" Type="text" Null="NO" Key="" Extra="" />
<field Field="date_edit" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="print_default_pic" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
<field Field="slogans" Type="text" Null="NO" Key="" Extra="" />
<field Field="used_for" Type="text" Null="NO" Key="" Extra="" />
<field Field="LOC_control" Type="varchar(15)" Null="NO" Key="" Default="" Extra="" />
<field Field="user_name" Type="varchar(32)" Null="NO" Key="" Default="" Extra="" />
<field Field="naf_creator" Type="varchar(32)" Null="NO" Key="" Default="" Extra="" />
<field Field="artists_assoc" Type="text" Null="NO" Key="" Extra="" />
<field Field="appeared_in" Type="text" Null="NO" Key="" Extra="" />
<field Field="default_pic" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="online" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
<field Field="date_edt" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />

<key Table="brand_infos" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="id" Collation="A" Cardinality="660" Null="" Index_type="BTREE" Comment="" />

<options Name="brand_infos" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="660" Avg_row_length="2082" Data_length="1374776" Max_data_length="281474976710655" Index_length="9216" Data_free="0" Auto_increment="673" Create_time="2009-12-08 00:23:19" Update_time="2009-12-08 00:23:19" Collation="latin1_swedish_ci" Create_options="" Comment="" />

</table_structure>
|#

;;; ==============================
;;; EOF
