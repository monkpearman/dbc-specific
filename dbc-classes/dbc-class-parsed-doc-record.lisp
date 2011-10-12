;;; :FILE-CREATED <Timestamp: #{2011-10-11T16:33:32-04:00Z}#{11412} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/dbc-classes/dbc-class-parsed-doc-record.lisp
;;; ==============================


(in-package #:dbc)

(defclass parsed-doc-record (parsed-class)
  ()
  )

;; base-documentation-record
(make-parsed-class-field-slot-accessor-mapping 
 'parsed-doc-record
 '(
   ("doc_id"       . control-id-documentation-record-num) ;; reference to the id of the meta-doc
   ("id"           . control-id-documentation-record-sub-num) ;; reference to the id of the sub-doc of meta-doc
   ("artist"       . naf-entity-artist-coref) ;; | one of the following fields is populated: 
   ("author"       . naf-entity-author-coref) ;; | artist, author, brand, book, technique, paper, sitedoc, gneral
   ("people"       . naf-entity-people-coref) ;; |
   ("brand"        . naf-entity-author-coref) ;; |
   ("book"         . naf-entity-publication-coref) ;; | 
   ("technique"    . media-entity-technique-coref) ;; | 
   ("paper"        . ) ;; |
   ("sitedoc"      . ) ;; | replaced 382 self references. IGNORABLE 
   ("general"      . ) ;; | replaced 20 self references: <field name="general">general</field> IGNORABLE 
   ("content_en"   . ) ;; contains inlied href'd xrefs to entities -- likely out of date. useless
   ("content_fr"   . ) ;;  <field name="content_fr">general</field> (search-forward-regexp "content_fr\">[^<]" nil t)
   ("title_en"     . ) ;; The title for the meta-document
   ("doc_title"    . )
   ("doc_raw_en"   . ) ;; contains actual content.
   ("lang"         . ) ;; en | fr
   ("page"         . ) ;; pg N of N
   ("page_title"   . ) ;; when present, is a subtitle corresponding to pg N of N
   ("content_link" . )
   ("categ"        . ) ;; category-0
   ("c1"           . ) ;;
   ("c2"           . ) 
   ("c3"           . )
   ("c4"           . )
   ("c5"           . )
   ("c6"           . )
   ("user"         . edit-by-creator) ;; stan | constance 
   ("on_line"      . record-status-active) ;; 1 | 0 | null
   ("date_edit"    . edit-date-origin) ;; 
   ("date_edt"     . edit-date) ;; the good one
   ))

;; (search-forward-regexp "sitedoc\">[^<]+" nil t)



;; :NOTE `set-parsed-inventory-record-slot-value' is defined in loadtime-bind.lisp
;; (def-set-parsed-class-record-slot-value 
;;      set-parsed-doc-record-slot-value
;;      parsed-doc-record)
;;
;;; *big-parsed-class-field-slot-accessor-mapping-table*

;;; ==============================

;; (length '("id" "doc_id" "artist" "author" "people" "brand" "book" "technique" "paper"
;;           "sitedoc" "general" "content_en" "content_fr" "title_en" "doc_title"
;;           "doc_raw_en" "lang" "page" "page_title" "content_link" "categ" "c1" "c2" "c3"
;;           "c4" "c5" "c6" "user" "on_line" "date_edit" "date_edt"))
;; => 31



;;; ==============================
;; :FIELD "id" :TRANSFORM
;;
;;         :TYPE "smallint(5) unsigned"
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
;; :FIELD "doc_id" :TRANSFORM
;;
;;         :TYPE "int(11)"
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
;; :FIELD "artist" :TRANSFORM
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
;; :FIELD "author" :TRANSFORM
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
;; :FIELD "people" :TRANSFORM
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
;; :FIELD "brand" :TRANSFORM
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
;; :FIELD "book" :TRANSFORM
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
;; :FIELD "technique" :TRANSFORM
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;   Wood Engraving
;;   Pochoir
;;  
;; -
;; 

;;; ==============================
;; :FIELD "paper" :TRANSFORM
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
;; :FIELD "general" :TRANSFORM
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
;; :FIELD "sitedoc" :TRANSFORM
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
;; :FIELD "content_en" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "YES"
;;         :KEY "MUL"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "content_fr" :TRANSFORM
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
;; :FIELD "title_en" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY "MUL"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "doc_title" :TRANSFORM
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
;; :FIELD "doc_raw_en" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY "MUL"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -
;;

;;; ==============================
;; :FIELD "lang" :TRANSFORM
;;
;;         :TYPE "char(2)"
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
;; :FIELD "page" :TRANSFORM
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
;; :FIELD "page_title" :TRANSFORM
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
;; :FIELD "content_link" :TRANSFORM
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
;; :FIELD "categ" :TRANSFORM
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
;; :FIELD "c1" :TRANSFORM
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
;; :FIELD "c2" :TRANSFORM
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
;; :NOTE replaced 91 occurences of "Planographic and ProcessTechniques" -> "Planographic and Process Techniques"

;;; ==============================
;; :FIELD "c3" :TRANSFORM
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
;; :FIELD "c4" :TRANSFORM
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
;; :FIELD "c5" :TRANSFORM
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
;; :FIELD "c6" :TRANSFORM
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
;; :FIELD "user" :TRANSFORM
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
;; :FIELD "on_line" :TRANSFORM
;;
;;         :TYPE "smallint(5) unsigned"
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
;; :FIELD "date_edit" :TRANSFORM
;;
;;         :TYPE "varchar(50)"
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


#|
<table_structure name="docs">
<field Field="brand" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="people" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="date_edit" Type="varchar(50)" Null="NO" Key="" Default="" Extra="" />
<field Field="c5" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="author" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="id" Type="smallint(5) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
<field Field="content_en" Type="text" Null="YES" Key="MUL" Extra="" />
<field Field="content_fr" Type="text" Null="YES" Key="" Extra="" />
<field Field="book" Type="text" Null="YES" Key="" Extra="" />
<field Field="artist" Type="varchar(255)" Null="YES" Key="" Extra="" />
<field Field="technique" Type="varchar(255)" Null="YES" Key="" Extra="" />
<field Field="categ" Type="varchar(255)" Null="YES" Key="" Extra="" />
<field Field="c1" Type="varchar(255)" Null="YES" Key="" Extra="" />
<field Field="on_line" Type="smallint(5) unsigned" Null="YES" Key="" Extra="" />
<field Field="title_en" Type="text" Null="NO" Key="MUL" Extra="" />
<field Field="c2" Type="varchar(255)" Null="YES" Key="" Extra="" />
<field Field="c3" Type="varchar(255)" Null="YES" Key="" Extra="" />
<field Field="c4" Type="varchar(255)" Null="YES" Key="" Extra="" />
<field Field="doc_title" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="doc_raw_en" Type="text" Null="NO" Key="MUL" Extra="" />
<field Field="lang" Type="char(2)" Null="NO" Key="" Default="" Extra="" />
<field Field="page" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
<field Field="page_title" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="user" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="doc_id" Type="int(11)" Null="NO" Key="" Default="0" Extra="" />
<field Field="content_link" Type="text" Null="NO" Key="" Extra="" />
<field Field="sitedoc" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
<field Field="c6" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="paper" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="general" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
<field Field="date_edt" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />

<key Table="docs" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="id" Collation="A" Cardinality="2185" Null="" Index_type="BTREE" Comment="" />

<key Table="docs" Non_unique="1" Key_name="content_en" Seq_in_index="1" Column_name="content_en" Cardinality="1" Null="YES" Index_type="FULLTEXT" Comment="" />

<key Table="docs" Non_unique="1" Key_name="title_en" Seq_in_index="1" Column_name="title_en" Cardinality="1" Null="" Index_type="FULLTEXT" Comment="" />

<key Table="docs" Non_unique="1" Key_name="doc_raw_en" Seq_in_index="1" Column_name="doc_raw_en" Cardinality="1" Null="" Index_type="FULLTEXT" Comment="" />

<options Name="docs" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="2185" Avg_row_length="4325" Data_length="9452088" Max_data_length="281474976710655" Index_length="7248896" Data_free="0" Auto_increment="2463" Create_time="2009-12-08 00:23:19" Update_time="2009-12-08 00:23:19" Check_time="2009-12-08 00:23:22" Collation="latin1_swedish_ci" Create_options="" Comment="" />

</table_structure>

|#
;;; ==============================
;;; EOF
