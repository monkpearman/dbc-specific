;;; :FILE-CREATED <Timestamp: #{2011-09-27T11:25:10-04:00Z}#{11392} - by MON>
;;; :FILE dbc-classes/dbc-class-themes-convert.lisp
;;; ==============================


(merge-pathname
 (make-pathname :directory `(:relative ,*xml-output-dir*)
                :name "sax-themes-test"
                :type "lisp")
 (system-path *system-path*))

(in-package #:dbc)

;; "id"                 :TRANSFORM "control-id-entity-num-theme"
;; "theme"              :TRANSFORM "control-id-display-theme"
;; "active"             :TRANSFORM "theme-active"
;; "display_pic"        :TRANSFORM "image-default-xref"
;; "related_pic_num"    :TRANSFORM "image-xrefs" ? 
;; "date_edit"          :TRANSFORM "edit-date"
;; "subdivision_number" :TRANSFORM
;; "range"              :TRANSFORM
;; "RT"                 :TRANSFORM
;; "BT"                 :TRANSFORM
;; "US"                 :TRANSFORM
;; "UF"                 :TRANSFORM
;; "NT"                 :TRANSFORM

;;; ==============================
;; :FIELD "id" :TRANSFORM
;;
;;         :TYPE "smallint(5) unsigned"
;;         :NULL-P "NO"
;;         :KEY "PRI"
;;         :EXTRA "auto_increment"
;;
;; :EXAMPLE-VALUES 
;;   "13504"
;;
;; - An unique integer identifying a theme.
;;   We may need to retain the existing value because it appears in the db.
;;   But, we also need to generate a more robust UUID for these as well
;;   Also, it is likely that most of these values should be corroborated with
;;   their LOC control-numbers.
;;
;;  :NOTE This integer shares a coreference with values from the `thems_fr` table!

;;; ==============================
;; :FIELD "theme" :TRANSFORM  "control-id-display-theme"
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Marble quarrying"
;;  "Marines (Military personnel)"
;;  "Mechanics (Persons)"
;;  "Merchants' exchanges"
;;  "Public affairs radio programs"
;;
;; "Cosmetics "
;; "Clothing "
;;
;; - First character of first word capitalized.
;;   First character of first word in parenthetical qualifer capitalized.
;;   If additional words are present is it always the case that they are not capitalized?
;;
;; - AFAICT these were only the "main theme" we never were able to create a
;;   graphs for MT,BT,RT,NT,UF,USE relations.
;;
;; :NOTE There may be a value in `translation` field of table `themes_fr` which
;;      corresponds with this, and we need to identify _how_ we want to handle
;;      display in multiple languages.
;;
;; :NOTE There are themes appearing in both the `refs` and `themes` tables with
;; character entity references as "&amp;". Likely these will need to be replaced
;; with "&" because they cause our SAX parser to not catch anything after
;; "&amp;" so for example:
;;   "Cosmetics &amp; soap" becomes "Cosmetics "
;;   "Clothing &amp; dress" becomes "Clothing " 
;; 
;; `themes` <field name="theme">Cosmetics &amp; soap</field>
;; `refs`   <field name="theme2">Cosmetics &amp; soap</field>
;;
;; `themes` <field name="theme">Clothing &amp; dress</field>
;; `refs`   <field name="theme2">Clothing &amp; dress</field>


;;; ==============================
;; :FIELD "active" :TRANSFORM
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "0" | "1" 
;; 
;; - "0" indicates inactive 
;;   "1" indicates active
;;    When "0" value of `related_pic_num` and `display_pic` will also be "0" and  value of `date_edit` will be "0000-00-00 00:00:00"
;;    When "1" value of `related_pic_num` and `display_pic` should contain item references.

;;; ==============================
;; :FIELD "related_pic_num" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "0"             ; 0 without any trailing #\|
;; "1747|1877|"    ; 
;; "10249|"
;;
;; -
;;  When not "0" has the format:
;;  "<ITEM-REF>|"* 
;;  Where the last char should always be #\|
;;  When not "0" value of field `display_pic` should be present as a member and `active` should "1".
;;  When "0" value of `display_pic` and `active` should also be "0" and value of `date_edit` will be "0000-00-00 00:00:00"

;;; ==============================
;; :FIELD "display_pic" :TRANSFORM
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;  "10249"
;;
;; - "0" if unassigned, else corresponds with an item-number
;;    When "0" value of `active` and `display_pic` will also be "0" value of `date_edit` will be "0000-00-00 00:00:00"
;;    When not "0" value is also present in `related_pic_num`


;;; ==============================
;; :FIELD "date_edit" :TRANSFORM "edit-date"
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "CURRENT_TIMESTAMP"
;;         :EXTRA "on update CURRENT_TIMESTAMP"
;;
;; :EXAMPLE-VALUES 
;;  "2008-09-20 22:33:51"
;;  "0000-00-00 00:00:00"
;;
;; - When present this value indicates the last time the db was updated with relation data.
;;   When value is "0000-00-00 00:00:00" the `active`, `display_pic`, `related_pic_num` should be "0"

;;; ==============================
;; :FIELD "subdivision_number" :TRANSFORM
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "166"
;;  "826"
;; - Used as a numeric index for the subdivisions of all themes in conjunction with the "range" field.
;;  can effectively be ignored.

;;; ==============================
;; :FIELD "range" :TRANSFORM
;;
;;         :TYPE "varchar(45)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Age-Alg"
;;  "Bra-Bug"
;;   null
;;
;; - Used to indicate the beginning theme for a particluar alphabetic range.
;;   Mostly useless to us now - can be ignored



;;; ==============================
;; :FIELD "RT" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - Never used.
;;   This is the "related-theme" slot
;;

;;; ==============================
;; :FIELD "BT" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - Never used.
;;   This is the "broader-theme" slot.
;;

;;; ==============================
;; :FIELD "US" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - Never used.
;;   This is the "USE" slot.
;;

;;; ==============================
;; :FIELD "UF" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - Never used.
;;   This is the "USED-FOR" slot.
;;

;;; ==============================
;; :FIELD "NT" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - Never Used.
;;   This is the "narrower-theme" slot.



;;; ==============================
;; :FILE notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01/dump-themes-xml
;;
;; <database name="derbycityprints"> 
;; <table_structure name="themes"> 
;; <field Field="id" Type="smallint(5) unsigned" Null="NO" Key="PRI" Extra="auto_increment" /> 
;; <field Field="theme" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" /> 
;; <field Field="active" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" /> 
;; <field Field="RT" Type="text" Null="NO" Key="" Extra="" /> 
;; <field Field="BT" Type="text" Null="NO" Key="" Extra="" /> 
;; <field Field="US" Type="text" Null="NO" Key="" Extra="" /> 
;; <field Field="UF" Type="text" Null="NO" Key="" Extra="" /> 
;; <field Field="NT" Type="text" Null="NO" Key="" Extra="" /> 
;; <field Field="related_pic_num" Type="text" Null="NO" Key="" Extra="" /> 
;; <field Field="display_pic" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" /> 
;; <field Field="subdivision_number" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" /> 
;; <field Field="range" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" /> 
;; <field Field="date_edit" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" /> 
;; <key Table="themes" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="id" Collation="A" Cardinality="6907" Null="" Index_type="BTREE" Comment="" /> 
;; <options Name="themes" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="6907" Avg_row_length="54" Data_length="375340" Max_data_length="281474976710655" Index_length="68608" Data_free="0" Auto_increment="13863" Create_time="2009-12-08 00:23:37" Update_time="2009-12-08 00:23:37" Collation="latin1_swedish_ci" Create_options="" Comment="" /> 
;; </table_structure> 
;; <table_data name="themes"> 
;;
;;; ==============================
;; <field name="id">6921</field>
;; <field name="theme">4-H clubs</field>
;; <field name="active">0</field>
;; <field name="RT"></field>
;; <field name="BT"></field>
;; <field name="US"></field>
;; <field name="UF"></field>
;; <field name="NT"></field>
;; <field name="related_pic_num">0</field>
;; <field name="display_pic">0</field>
;; <field name="subdivision_number">2</field>
;; <field name="range"></field>
;; <field name="date_edit">0000-00-00 00:00:00</field>

;;; ==============================
;;; EOF
