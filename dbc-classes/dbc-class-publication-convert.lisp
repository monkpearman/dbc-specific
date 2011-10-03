;;; :FILE-CREATED <Timestamp: #{2011-05-05T16:52:12-04:00Z}#{11184} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-publication-convert.lisp
;;; ==============================

;;; ==============================
;;;
;; (let ((cnt 0)) (while (search-forward-regexp " xsi:nil=\"true\" />" nil t) (replace-match "></field>") (incf cnt)) cnt) => 333
;;
;; (let ((cnt 0)) (while (search-forward-regexp " </field>" nil t) (incf cnt)) cnt) => 107
;;
;; (let ((cnt 0)) (while (search-forward-regexp " </field>" nil t) (replace-match "</field>") (incf cnt)) cnt) => 106
;;
;;; :SEE :FILE dump-book_infos-xml
;;; M-x `mon-cln-control-M' => removed 14960 occurences
;; 
;; :TODO Add slot "photographer-appearance"
;;       Add slot "publication-dimensions"
;; We intend to end with a class hierarchy as follows:
;;
;; base-dbc
;; - base-entity
;; --- base-naf-entity
;; ---- naf-entity-publication
;; ----- naf-entity-publication-book
;; ----- naf-entity-publication-subscribed
;; ----- naf-entity-publication-atlas
;; ----- naf-entity-publication-periodical
;; ----- naf-entity-publication-catalog
;; ----- naf-entity-publication-pamphlet
;;
;;; ==============================

;;; ==============================
(in-package #:dbc)
;; *package*



;;; ==============================
;;  <FIELD>               <TRANSFORM>
;;                        ;; 
;; "bio"                  ;; "control-id-doc-num-publication"
;; "id"                   ;; "control-id-entity-num-publication"
;; "display"              ;; "control-id-display-publication"
;;
;; "book_real"            ;; "control-id-display-publication-full"
;;
;; "author"               ;; "author-entity-appearance"
;; "illustrator"          ;; "artist-entity-appearance"
;;
;; "date_pub"             ;; "publication-date"
;; "loc_pub"              ;; "publication-location" ;; location-entity
;; "volumes"              ;; "publication-volumes"
;; "pages"                ;; "publication-pages"
;; "illustrations"        ;; "publication-illustrations"
;; "subjects"             ;; "publication-subjects"
;;
;; "lc_class"             ;; "control-id-db-0" ;; LOC
;; "ULAN_control"         ;; "control-id-db-1" ;; ULAN
;;
;; "content"              ;; "description-publication-note-content"
;; "notes"                ;; "description-publication-note-general"
;; "special_note"         ;; "description-publication-note-special"
;; "auction_records"      ;; "description-publication-note-sale-appearance"
;;
;; "default_pic"          ;; "image-default-id"
;; "print_default_pic"    ;; "image-default-xref"
;;
;; "online"               ;; "naf-active"
;; "date_edit"            ;; "edit-date-origin"
;; "date_edt"             ;; "edit-date"
;;
;; "user_name"            ;; "edit-by"
;; "naf_creator"          ;; "edit-by-creator"
;;


;;
;;; ==============================

;;; ==============================
;; :FIELD "bio" :TRANSFORM "control-id-doc-num-publication"
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
;; :FIELD "id" :TRANSFORM "control-id-entity-num-publication"
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
;; :FIELD "display" :TRANSFORM "control-id-display-publication"
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
;; :FIELD "book_real" :TRANSFORM "control-id-display-publication-full"
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "The Octopus | Wisconsin Octopus | The Wisconsin Octopus"
;;  "The Holy Land, Syria, Idumea, Arabia, Egypt & Nubia"
;;
;; - B/c old books have long names...
;; - (split-used-fors "The Holy Land, Syria, Idumea, Arabia, Egypt & Nubia")

;;; ==============================
;; :FIELD "author" :TRANSFORM "author-appearance"
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
;; :FIELD "illustrator" :TRANSFORM "artist-appearance"
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "Roberts (David) |
;; Brockedon (William)"
;;
;; -
;; (split-piped-field-if (field-convert-1-0-x (field-convert-verify-string 8)))
;; (split-piped-field-if (field-convert-1-0-x (field-convert-verify-string nil)))
;; (split-piped-field-if (field-convert-1-0-x (field-convert-verify-string "x")))

;;; ==============================
;; :FIELD "date_pub" :TRANSFORM "publication-date"
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "December 17, 1892 - Present"
;;  "1774 - 1846"
;; 
;; - :NOTE item-refs has:
;;   "year"             ;; publication-date        ;; For congruence with birth-date death-date 
;;   "year_year"        ;; publication-date-range

;;; ==============================
;; :FIELD "loc_pub" :TRANSFORM "publication-location"
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Conde Nast - New York, Paris, Milan, London, Berlin, Moscow"
;;
;; - :NOTE for congruence with birth-location death-location
;;

;;; ==============================
;; :FIELD "volumes" :TRANSFORM "publication-volumes"
;;
;;         :TYPE "varchar(64)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  13
;;  0
;; 
;; - :NOTE item-refs has:
;;   "volume"           ;; "publication-volume"
;;
;; - (field-convert-1-0-x-empty-known nil *xml-publication-match-table*)

;;; ==============================
;; :FIELD "pages" :TRANSFORM "publication-pages"
;;
;;         :TYPE "varchar(32)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  8-16
;;  0
;;
;; - (field-convert-1-0-x-empty-known nil *xml-publication-match-table*)
;;
;; - :NOTE item-refs has:
;;   "volume"           ;; "publication-pages"

;;; ==============================
;; :FIELD "illustrations" :TRANSFORM "publication-illustrations"
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  120
;;
;; -
;;

;;; ==============================
;; :FIELD "special_note" :TRANSFORM "description-publication-note-general"
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
;; :FIELD "subjects" :TRANSFORM "publication-subjects"
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -appears unuses 
;;
;; (search-forward-regexp "field name=\"subjects\">\\(^</field>\\)" nil t)
;; (search-forward-regexp "name=\"subjects\">[^<]")
;; (search-forward-regexp "name=\"subjects\">")
;; (search-forward-regexp "name=\"pages\">[^<0x].*<" nil t)
;; (search-forward-regexp "name=\"pages\">[^<].*</field" nil t)

;;; ==============================
;; :FIELD "ULAN_control" :TRANSFORM "control-id-db-1"
;;
;;         :TYPE "varchar(20)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  37420630
;;  0
;; 
;; -
;;

;;; ==============================
;; :FIELD "lc_class" :TRANSFORM control-id-db-0
;;
;;         :TYPE "varchar(20)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  FRBNF34429834
;;  0
;;
;; -
;;
;; 
;;; ==============================
;; :FIELD "content" :TRANSFORM "description-publication-note-content"
;;
;;         :TYPE "text"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "French Periodical | Weekly French Serial Publications"
;;  "Fashion | Fashion Design | Fashion Illustrations | Sewing Patterns | Fashion Photography | Couture | Clothing Designers"
;; "Fashion Publication, like Gazette du Bon Ton"
;;
;; - (split-piped-field-if (field-convert-1-0-x-empty "x")))
;; 

;;; ==============================
;; :FIELD "notes" :TRANSFORM "publication-description-note-general"
;;
;;         :TYPE "text"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Always be on the lookout for the Maine Maps w/ Railroad lines."
;;
;; -
;;

;;; ==============================
;; :FIELD "auction_records" :TRANSFORM "description-publication-note-sale-appearance"
;;
;;         :TYPE "text"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  Unremarkable Issue $10 {...}
;;  Wolf, F. J. - cover February 1938 vol 38 no. 2  {...}
;;
;; - (search-forward-regexp "auction_records\">[^<]" nil t)
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
;; <field name="user_name">stan</field>
;;
;; -
;; (search-forward-regexp " name=\"user_name\"\>[^<]" nil t)

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
;; :FIELD "default_pic" :TRANSFORM
;;
;;         :TYPE "varchar(10)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  1.jpg
;;  5.jpg
;; 
;; - may occur empty
;;
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
;; :FIELD "online" :TRANSFORM "naf-active"
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

;;; ==============================

#|

 <database name="derbycityprints">
 	<table_structure name="book_infos">
 		<field Field="bio" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
 		<field Field="id" Type="int(4) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
 		<field Field="book_real" Type="text" Null="NO" Key="" Extra="" />
 		<field Field="author" Type="text" Null="NO" Key="" Extra="" />
 		<field Field="illustrator" Type="text" Null="NO" Key="" Extra="" />
 		<field Field="date_pub" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
 		<field Field="loc_pub" Type="varchar(255)" Null="YES" Key="" Default="0" Extra="" />
 		<field Field="volumes" Type="varchar(64)" Null="NO" Key="" Default="0" Extra="" />
 		<field Field="pages" Type="varchar(32)" Null="NO" Key="" Default="0" Extra="" />
 		<field Field="illustrations" Type="text" Null="NO" Key="" Extra="" />
 		<field Field="special_note" Type="text" Null="NO" Key="" Extra="" />
 		<field Field="subjects" Type="text" Null="NO" Key="" Extra="" />
 		<field Field="date_edit" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
 		<field Field="ULAN_control" Type="varchar(20)" Null="YES" Key="" Extra="" />
 		<field Field="lc_class" Type="varchar(20)" Null="YES" Key="" Extra="" />
 		<field Field="content" Type="text" Null="YES" Key="" Extra="" />
 		<field Field="notes" Type="text" Null="YES" Key="" Extra="" />
 		<field Field="auction_records" Type="text" Null="YES" Key="" Extra="" />
 		<field Field="user_name" Type="varchar(32)" Null="YES" Key="" Extra="" />
 		<field Field="naf_creator" Type="varchar(32)" Null="YES" Key="" Extra="" />
 		<field Field="default_pic" Type="varchar(10)" Null="NO" Key="" Default="" Extra="" />
 		<field Field="print_default_pic" Type="varchar(10)" Null="NO" Key="" Default="" Extra="" />
 		<field Field="display" Type="text" Null="NO" Key="" Extra="" />
 		<field Field="online" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
 		<field Field="date_edt" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />
 		<key Table="book_infos" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="id" Collation="A" Cardinality="179" Null="" Index_type="BTREE" Comment="" />
 		<options Name="book_infos" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="179" Avg_row_length="4835" Data_length="865520" Max_data_length="281474976710655" Index_length="4096" Data_free="0" Auto_increment="206" Create_time="2009-12-08 00:23:18" Update_time="2009-12-08 00:23:19" Collation="latin1_swedish_ci" Create_options="" Comment="" />
 	</table_structure>
 	<table_data name="book_infos">

|#

;;; ==============================
;;; EOF
