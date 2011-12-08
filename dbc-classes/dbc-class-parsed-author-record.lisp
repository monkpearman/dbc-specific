;;; :FILE-CREATED <Timestamp: #{2011-10-11T00:18:31-04:00Z}#{11412} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-author-record.lisp
;;; ==============================

;; dump-author_infos-xml



(in-package #:dbc)
;; *package*

(defclass parsed-author-record (parsed-naf-entity)
  ((control-id-doc-num-author
    :initarg :control-id-doc-num-author
    :accessor control-id-doc-num-author
    :documentation ":ORIGINAL-FIELD \"bio\"")

   (control-id-entity-num-author
    :initarg :control-id-entity-num-author
    :accessor control-id-entity-num-author
    :documentation ":ORIGINAL-FIELD \"id\"")

   (control-id-display-author
    :initarg :control-id-display-author
    :accessor control-id-display-author
    :documentation ":ORIGINAL-FIELD \"display\"")

   (naf-entity-author-display-name-coref
    :initarg :naf-entity-author-display-name-coref
    :accessor naf-entity-author-display-name-coref
    :documentation ":ORIGINAL-FIELD \"used_for\"")

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

   (control-id-authority-0
    :initarg :control-id-authority-0
    :accessor control-id-authority-0
    :documentation ":ORIGINAL-FIELD \"LOC_control\"")

   (control-id-authority-1
    :initarg :control-id-authority-1
    :accessor control-id-authority-1
    :documentation ":ORIGINAL-FIELD \"other_control\"")

   (naf-entity-publication-coref
    :initarg :naf-entity-publication-coref
    :accessor naf-entity-publication-coref
    :documentation ":ORIGINAL-FIELD \"books_assoc\"")

   (naf-entity-artist-coref
    :initarg :naf-entity-artist-coref
    :accessor naf-entity-artist-coref
    :documentation ":ORIGINAL-FIELD \"also_artist\"")

   (naf-entity-person-coref
    :initarg :naf-entity-person-coref
    :accessor naf-entity-person-coref
    :documentation ":ORIGINAL-FIELD \"also_people\"")

   (description-author-note-general
    :initarg :description-author-note-general
    :accessor description-author-note-general
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

   (edit-date
    :initarg :edit-date
    :accessor edit-date
    :documentation ":ORIGINAL-FIELD \"date_edt\"")

   (edit-date-origin
    :initarg :edit-date-origin
    :accessor edit-date-origin
    :documentation ":ORIGINAL-FIELD \"date_edit\""))
  (:documentation
   #.(format nil
             "
:NOTE the accessor `control-id-entity-num-author' should be used as value for the
KEY-ACCESSOR keyword of `load-sax-parsed-xml-file-to-parsed-class-hash'.~%
:SEE-ALSO `<XREF>'.~%▶▶▶")))

(make-parsed-class-field-slot-accessor-mapping 
 'parsed-author-record
 '(("bio"               . control-id-doc-num-author)
   ("id"                . control-id-entity-num-author)
   ("display"           . control-id-display-author)
   ("nationality"       . location-nationality)
   ("lifespan"          . lifespan-date)
   ("LOC_control"       . control-id-authority-0)
   ("other_control"     . control-id-authority-1)
   ("used_for"          . naf-entity-author-display-name-coref)
   ("birth_location"    . location-birth)
   ("death_location"    . location-death)
   ("books_assoc"       . naf-entity-publication-coref)
   ("gender"            . naf-entity-gender-type)
   ("date_edit"         . edit-date-origin)
   ("notes"             . description-author-note-general)
   ("print_default_pic" . image-default-xref)
   ("default_pic"       . image-default-id)
   ("also_artist"       . naf-entity-artist-coref)
   ("also_people"       . naf-entity-person-coref)
   ("user_name"         . edit-by)
   ("naf_creator"       . edit-by-creator)
   ("online"            . record-status-active)
   ("date_edt"          . edit-date)))

;; :NOTE `set-parsed-inventory-record-slot-value' is defined in loadtime-bind.lisp
;; (def-set-parsed-class-record-slot-value 
;;      set-parsed-author-record-slot-value
;;      parsed-author-record)
;;
;;; *parsed-class-field-slot-accessor-mapping-table*


;; (length '("bio" "id" "display" "nationality" "lifespan" "LOC_control" "other_control"
;;           "used_for" "birth_location" "death_location" "books_assoc" "gender" "date_edit"
;;           "notes" "print_default_pic" "default_pic" "also_artist" "also_people"
;;           "user_name" "naf_creator" "online" "date_edt"))
;; => 22


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
;; :FIELD "books_assoc" :TRANSFORM
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
;; :FIELD "other_control" :TRANSFORM
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
;; :FIELD "print_default_pic" :TRANSFORM
;;
;;         :TYPE "varchar(10)"
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
;; :FIELD "default_pic" :TRANSFORM
;;
;;         :TYPE "varchar(10)"
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
;; :FIELD "also_people" :TRANSFORM
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
<table_structure name="author_infos">
<field Field="bio" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
<field Field="id" Type="int(4) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
<field Field="display" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="nationality" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="lifespan" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
<field Field="LOC_control" Type="varchar(15)" Null="YES" Key="" Extra="" />
<field Field="used_for" Type="text" Null="NO" Key="" Extra="" />
<field Field="birth_location" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="death_location" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
<field Field="books_assoc" Type="text" Null="NO" Key="" Extra="" />
<field Field="gender" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="date_edit" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="other_control" Type="varchar(100)" Null="YES" Key="" Extra="" />
<field Field="notes" Type="text" Null="YES" Key="" Extra="" />
<field Field="print_default_pic" Type="varchar(10)" Null="NO" Key="" Default="" Extra="" />
<field Field="default_pic" Type="varchar(10)" Null="NO" Key="" Default="" Extra="" />
<field Field="also_artist" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
<field Field="also_people" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
<field Field="user_name" Type="varchar(32)" Null="YES" Key="" Extra="" />
<field Field="naf_creator" Type="varchar(32)" Null="YES" Key="" Extra="" />
<field Field="online" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
<field Field="date_edt" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />

<key Table="author_infos" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="id" Collation="A" Cardinality="471" Null="" Index_type="BTREE" Comment="" />
<options Name="author_infos" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="471" Avg_row_length="589" Data_length="277796" Max_data_length="281474976710655" Index_length="9216" Data_free="0" Auto_increment="507" Create_time="2009-12-08 00:23:18" Update_time="2009-12-08 00:23:18" Collation="latin1_swedish_ci" Create_options="" Comment="" />
	</table_structure>
|#

;;; ==============================
;;; EOF
