;;; :FILE-CREATED <Timestamp: #{2011-10-10T23:44:25-04:00Z}#{11411} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-person-record.lisp
;;; ==============================

;;; dump-people_infos-xml


(in-package #:dbc)
;; *package*

(defclass parsed-person-record (parsed-naf-entity)
  ((control-id-doc-num-person
    :initarg :control-id-doc-num-person
    :accessor control-id-doc-num-person
    :documentation ":ORIGINAL-FIELD \"bio\"")

   (control-id-entity-num-person
    :initarg :control-id-entity-num-person
    :accessor control-id-entity-num-person
    :documentation ":ORIGINAL-FIELD \"id\"")

   (control-id-display-person
    :initarg :control-id-display-person
    :accessor control-id-display-person
    :documentation ":ORIGINAL-FIELD \"display\"")

   (naf-entity-person-display-name-coref
    :initarg :naf-entity-person-display-name-coref
    :accessor naf-entity-person-display-name-coref
    :documentation ":ORIGINAL-FIELD \"used_for\"")

   ;; field name is case-sensitive
   (control-id-authority-0
    :initarg :control-id-authority-0
    :accessor control-id-authority-0
    :documentation ":ORIGINAL-FIELD \"LOC_control\"")

   (location-nationality
    :initarg :location-nationality
    :accessor location-nationality
    :documentation ":ORIGINAL-FIELD \"nationality\"")

   (lifespan-date
    :initarg :lifespan-date
    :accessor lifespan-date
    :documentation ":ORIGINAL-FIELD \"lifespan\"")
   
   (location-birth
    :initarg :location-birth
    :accessor location-birth
    :documentation ":ORIGINAL-FIELD \"birth_location\"")

   (location-death
    :initarg :location-death
    :accessor location-death
    :documentation ":ORIGINAL-FIELD \"death_location\"")
   
   (naf-entity-gender-type
    :initarg :naf-entity-gender-type
    :accessor naf-entity-gender-type
    :documentation ":ORIGINAL-FIELD \"gender\"")

   (naf-entity-role-appearance-coref
    :initarg :naf-entity-role-appearance-coref
    :accessor naf-entity-role-appearance-coref
    :documentation ":ORIGINAL-FIELD \"role\"")

   (naf-entity-artist-coref
    :initarg :naf-entity-artist-coref
    :accessor naf-entity-artist-coref
    :documentation ":ORIGINAL-FIELD \"also_artist\"")

   (naf-entity-author-coref
    :initarg :naf-entity-author-coref
    :accessor naf-entity-author-coref
    :documentation ":ORIGINAL-FIELD \"also_author\"")

   (description-person-note-general
    :initarg :description-person-note-general
    :accessor description-person-note-general
    :documentation ":ORIGINAL-FIELD \"notes\"")

   (record-status-active
    :initarg :record-status-active
    :accessor record-status-active
    :documentation ":ORIGINAL-FIELD \"online\"")

   (image-default-id
    :initarg :image-default-id
    :accessor image-default-id
    :documentation ":ORIGINAL-FIELD \"default_pic\"")

   (image-default-xref
    :initarg :image-default-xref
    :accessor image-default-xref
    :documentation ":ORIGINAL-FIELD \"print_default_pic\"")

   (edit-date-origin
    :initarg :edit-date-origin
    :accessor edit-date-origin
    :documentation ":ORIGINAL-FIELD \"date_edit\"")

   (edit-by
    :initarg :edit-by
    :accessor edit-by
    :documentation ":ORIGINAL-FIELD \"user_name\"")

   (edit-by-creator
    :initarg :edit-by-creator
    :accessor edit-by-creator
    :documentation ":ORIGINAL-FIELD \"naf_creator\"")

   (edit-date
    :initarg :edit-date
    :accessor edit-date
    :documentation ":ORIGINAL-FIELD \"date_edt\"")
   )
  (:documentation #.(format nil
"
:NOTE the accessor `control-id-entity-num-person' should be used as value for the
KEY-ACCESSOR keyword of `load-sax-parsed-xml-file-to-parsed-class-hash'.~%
:SEE-ALSO `<XREF>'.~%▶▶▶")))

(make-parsed-class-field-slot-accessor-mapping 
 'parsed-person-record
 '(("bio"               . control-id-doc-num-person)
   ("id"                . control-id-entity-num-person)
   ("display"           . control-id-display-person)
   ("nationality"       . location-nationality)
   ("lifespan"          . lifespan-date)
   ("LOC_control"       . control-id-authority-0)
   ("birth_location"    . location-birth)
   ("death_location"    . location-death)
   ("role"              . naf-entity-role-appearance-coref)
   ("gender"            . naf-entity-gender-type)
   ("date_edit"         . edit-date-origin)
   ("notes"             . description-person-note-general)
   ("used_for"          . naf-entity-person-display-name-coref)
   ("default_pic"       . image-default-id )
   ("print_default_pic" . image-default-xref)
   ("also_artist"       . naf-entity-artist-coref )
   ("also_author"       . naf-entity-author-coref)
   ("user_name"         . edit-by)
   ("naf_creator"       . edit-by-creator)
   ("online"            . record-status-active)
   ("date_edt"          . edit-date)))

;; :NOTE fields appearing in class `parsed-artist-record' but not in class `parsed-person-record'
;; ("date_born"         . birth-date)
;; ("date_died"         . death-date)
;; ("ULAN_control"      . control-id-authority-1)
;; ("appeared_in"       . naf-entity-publication-coref)
;; ("ads_for"           . naf-entity-brand-coref)
;; ("auction_records"   . description-<FOO>-note-sale-appearance)
;; ("cancel_num"        . ignorable-cancel-num)
;; ("special_note"      . ignorable-special-note)

;; :NOTE `set-parsed-inventory-record-slot-value' is defined in loadtime-bind.lisp
;; (def-set-parsed-class-record-slot-value 
;;      set-parsed-person-record-slot-value
;;      parsed-person-record)
;;
;;; *parsed-class-field-slot-accessor-mapping-table*
;;
;; (defun set-parsed-person-record-slot-value (field-string field-value object)
;;   (values
;;    (string-case:string-case (field-string)
;;      ("bio" (setf (control-id-doc-num-person object) field-value))
;;      ("id" (setf (control-id-entity-num-person object) field-value))
;;      ("display" (setf (control-id-display-person object) field-value))
;;      ("nationality" (setf (location-nationality object) field-value))
;;      ("lifespan" (setf (lifespan-date object) field-value))
;;      ("loc_control" (setf (control-id-authority-0 object) field-value))
;;      ("birth_location" (setf (location-birth object) field-value))
;;      ("death_location" (setf (location-death object) field-value))
;;      ("role" (setf (naf-entity-role-appearance-coref object) field-value))
;;      ("gender" (setf (naf-entity-gender-type object) field-value))
;;      ("date_edit" (setf (edit-date-origin object) field-value))
;;      ("notes" (setf (description-person-note-general object) field-value))
;;      ("used_for"
;;       (setf (naf-entity-person-display-name-coref object) field-value))
;;      ("default_pic" (setf (image-default-id object) field-value))
;;      ("print_default_pic" (setf (image-default-xref object) field-value))
;;      ("also_artist" (setf (naf-entity-artist-coref object) field-value))
;;      ("also_author" (setf (naf-entity-author-coref object) field-value))
;;      ("user_name" (setf (edit-by object) field-value))
;;      ("naf_creator" (setf (edit-by-creator object) field-value))
;;      ("online" (setf (record-status-active object) field-value))
;;      ("date_edt" (setf (edit-date object) field-value)))
;;    object))

;;; ==============================

;; (length '("bio" "id" "display" "nationality" "lifespan" "LOC_control" "birth_location"
;;           "death_location" "role" "gender" "date_edit" "notes" "used_for" "default_pic"
;;           "print_default_pic" "also_artist" "also_author" "user_name" "naf_creator"
;;           "online" "date_edt"))
;; => 21


;;; ==============================
;; :FIELD "bio" :TRANSFORM
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
;; :FIELD "nationality" :TRANSFORM
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
;; :FIELD "lifespan" :TRANSFORM
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
;; :FIELD "LOC_control" :TRANSFORM
;;
;;         :TYPE "varchar(15)"
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
;; :FIELD "birth_location" :TRANSFORM
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
;; :FIELD "death_location" :TRANSFORM
;;
;;         :TYPE "varchar(255)"
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
;; :FIELD "role" :TRANSFORM
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
;; :FIELD "gender" :TRANSFORM
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
;; :FIELD "notes" :TRANSFORM
;;
;;         :TYPE "text"
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
;; :FIELD "default_pic" :TRANSFORM
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
;; :FIELD "print_default_pic" :TRANSFORM
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
;; :FIELD "also_artist" :TRANSFORM
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
;; :FIELD "also_author" :TRANSFORM
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
;; :FIELD "user_name" :TRANSFORM
;;
;;         :TYPE "varchar(32)"
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
;; :FIELD "naf_creator" :TRANSFORM
;;
;;         :TYPE "varchar(32)"
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

<table_structure name="people_infos">
<field Field="bio" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
<field Field="id" Type="int(4) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
<field Field="display" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="nationality" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="lifespan" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
<field Field="LOC_control" Type="varchar(15)" Null="YES" Key="" Extra="" />
<field Field="birth_location" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="death_location" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
<field Field="role" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="gender" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="date_edit" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="notes" Type="text" Null="YES" Key="" Extra="" />
<field Field="used_for" Type="text" Null="NO" Key="" Extra="" />
<field Field="default_pic" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
<field Field="print_default_pic" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
<field Field="also_artist" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
<field Field="also_author" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
<field Field="user_name" Type="varchar(32)" Null="YES" Key="" Extra="" />
<field Field="naf_creator" Type="varchar(32)" Null="YES" Key="" Extra="" />
<field Field="online" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
<field Field="date_edt" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />

<key Table="people_infos" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="id" Collation="A" Cardinality="132" Null="" Index_type="BTREE" Comment="" />

<options Name="people_infos" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="132" Avg_row_length="1495" Data_length="197452" Max_data_length="281474976710655" Index_length="4096" Data_free="0" Auto_increment="148" Create_time="2009-12-08 00:23:22" Update_time="2009-12-08 00:23:22" Collation="latin1_swedish_ci" Create_options="" Comment="" />
</table_structure>

|#

;;; ==============================
;;; EOF
