;;; :FILE-CREATED <Timestamp: #{2011-05-05T14:01:28-04:00Z}#{11184} - by MON>
;;; :FILE dbc-specific/dbc-class-techniques-convert.lisp
;;; ==============================

;;; ==============================
;;; :NOTE Transforms for :FILE dump-technique_infos-xml
;;; Clean these up first with emacs regexp: 
;;;  (while (search-forward-regexp " xsi:nil=\"true\" />" nil t) (replace-match "></field>"))
;;;
;;; :NOTE This entire table is essentially a "class-heirarchy" with record
;;;        entitled "Printing Techniques" as the root of the tree.
;;;
;;; ==============================

(in-package #:dbc)
;; *package*

;; base-entity 
;; - base-media-entity 
;; -- media-technique-entity 

(defclass media-technique-entity (base-media-entity)
  ())
;;
(defclass technique-parse (parsed-class)
  ())

#|

:SLOT-LIST
 eql length 12

 ("id" "display" "used_for" "technique_family" "variation_of"
  "date_edit" "user_name" "naf_creator" "notes" "default_pic" "online" "date_edt")

 <FIELD>              <TRANSFORM>
 "id"                ;; conrtol-id-entity-num-technique
 "display"           ;; conrtol-id-entity-display-technique
 "used_for"          ;; technique-entity-display-name-core
 "technique_family"  ;; technique-entity-parent-type
 "variation_of"      ;; technique-entity-type-coref
 "notes"             ;; description-technique-notes
 "default_pic"       ;; image-default-id
 "date_edt"          ;; edit-date         ;; this is the good one
 "date_edit"         ;; edit-date-origin  ;; IGNORABLE assuming date_edt is present and corresponds
 "online"            ;; technique-active  ;; IGNORABLE always 0
 "user_name"         ;; edit-by           ;; IGNORABLE always empty  
 "naf_creator"       ;; edit-by-creator   ;; IGNORABLE always empty



;;; ==============================

		<field name="id">35</field>
		<field name="display">Etching - Mechanical</field>
		<field name="used_for"></field>
		<field name="technique_family">Intaglio Techniques</field>
		<field name="variation_of">Etching</field>
		<field name="date_edit">2006-10-2</field>
		<field name="user_name"></field>
		<field name="naf_creator"></field>
		<field name="notes"></field>
		<field name="default_pic"></field>
		<field name="online">0</field>
		<field name="date_edt">2006-10-02 04:00:00</field>

 ;;; ==============================


;;; ==============================
;; :FIELD "id" :TRANSFORM conrtol-id-entity-num-technique
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
;; :FIELD "display" :TRANSFORM conrtol-id-entity-display-technique
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
;; :FIELD "used_for" :TRANSFORM technique-entity-display-name-coref
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
;; :FIELD "technique_family" :TRANSFORM technique-entity-parent-type
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
;; :FIELD "variation_of" :TRANSFORM technique-entity-type-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  Etching - Mechanical
;;  Line Engraving
;;
;;  :TODO id 36 has variation_of value: "Intaglio (mechanical)" that is wrong b/c there
;;   is no other entity with this name and the only other like entity is denoted
;;   as "Etching - Mechanical".
;;   id 17 has a `display` vlaue "Etching Chemical" that is not congruent with "Etching - Mechanical"
;; 
;; - This (usually) indicates that the technique has a  subclass-of/subtype-of relation
;;   and is an indication of the extent with which SQL/rdbms are not well suited
;;   to our heirarchical data-structuring needs. We need to refactor this for CLOS.






;;; ==============================
;; :FIELD "notes" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Category Placeholder for:
;;   + Relief Techniques
;;   - Woodblock
;;   - Wood Engraving
;;   - Linocut
;;   - Mezzotint"
;;
;;
;;
;; - May carries the "class-hierarchy" of sub techniques. 
;; - Also holds notes helping to disambiguate similar techniques
;;

;;; ==============================
;; :FIELD "default_pic" :TRANSFORM image-default-id
;;
;;         :TYPE "varchar(45)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  1.jpg
;;
;; - may appear as empty field
;; - Picture identifying the characteristics of the technique.
;; - Also, appears in artis-infos table
;;

;;; ==============================
;; :FIELD "date_edt" :TRANSFORM edit-date
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "CURRENT_TIMESTAMP"
;;         :EXTRA "on update CURRENT_TIMESTAMP"
;;
;; :EXAMPLE-VALUES 
;;  2006-10-05 04:00:00
;;
;; -
;; - The "date_edt" field is the canonical form and preferred over "date_edit"
;;   which is effectively ignorable assuming date_edt is present and corresponds
;;

;;; ==============================
;; :FIELD "date_edit" :TRANSFORM edit-date-origin
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  2006-10-5
;;
;; - The "date_edt" field is the canonical form.
;;   This value is IGNORABLE assuming date_edt is present and corresponds

;;; ==============================
;; :FIELD "user_name" :TRANSFORM edit-by  ;; IGNORABLE always empty  
;;
;;         :TYPE "varchar(32)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - IGNORABLE always empty
;;

;;; ==============================
;; :FIELD "naf_creator" :TRANSFORM edit-by-creator ;; IGNRORABLE always empty
;;
;;         :TYPE "varchar(32)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - IGNORABLE always empty

;;; ==============================
;; :FIELD "online" :TRANSFORM technique-active  ;; IGNORABLE always 0 
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0
;;
;; - IGNORABLE always 0 
;; 
;;

;;; ==============================

 <table_structure name="technique_infos">
 <field Field="id" Type="int(4) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
 <field Field="display" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
 <field Field="used_for" Type="text" Null="NO" Key="" Extra="" />
 <field Field="technique_family" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
 <field Field="variation_of" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
 <field Field="date_edit" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
 <field Field="user_name" Type="varchar(32)" Null="YES" Key="" Extra="" />
 <field Field="naf_creator" Type="varchar(32)" Null="YES" Key="" Extra="" />
 <field Field="notes" Type="text" Null="YES" Key="" Extra="" />
 <field Field="default_pic" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
 <field Field="online" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
 <field Field="date_edt" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />
 <key Table="technique_infos" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="id" Collation="A" Cardinality="31" Null="" Index_type="BTREE" Comment="" />
 <options Name="technique_infos" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="31" Avg_row_length="198" Data_length="6160" Max_data_length="281474976710655" Index_length="2048" Data_free="0" Auto_increment="40" Create_time="2009-12-08 00:23:37" Update_time="2009-12-08 00:23:37" Collation="latin1_swedish_ci" Create_options="" Comment="" />
 </table_structure>

|#

;;; ==============================
;;; EOF
