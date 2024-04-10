;;; :FILE-CREATED <Timestamp: #{2011-10-11T16:33:32-04:00Z}#{11412} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-documentation-record.lisp
;;; ==============================

#|

|#

;; following defined in loadtime-bind.lisp
;; `set-parsed-documentation-record-slot-value'
;; `parsed-documentation-record-xml-dump-file-and-hash'
;; `write-parsed-documentation-record-parse-table-to-file'
;; `load-parsed-documentation-record-default-file-to-parse-table'
;; `write-parsed-doc-record-parse-table-to-csv-file'

(in-package #:dbc)

(defclass parsed-documentation-record (parsed-class)
  ( 
   (;; reference to the id of the sub-doc of meta-doc e.g. doc 0001, 0002, 0003 are each a sub-docs of meta-doc 9999
    ;; -- this is the tables primary key
    control-id-documentation-record-document-page-id
    :initarg :control-id-documentation-record-document-page-id
    :accessor control-id-documentation-record-document-page-id
    :documentation ":ORIGINAL-FIELD \"id\"")


   (;; reference to the id of the meta-doc -- multiple documents share this key
    ;; and are effectively aggregated beneath it as a single document.
    ;; this was a fucking _BAD_ design!
    control-id-documentation-record-document-id
    :initarg :control-id-documentation-record-document-id
    :accessor control-id-documentation-record-document-id
    :documentation ":ORIGINAL-FIELD \"doc_id\"")

   (naf-entity-artist-coref
    :initarg :naf-entity-artist-coref
    :accessor naf-entity-artist-coref
    :documentation ":ORIGINAL-FIELD \"artist\"")

   (naf-entity-author-coref
    :initarg :naf-entity-author-coref
    :accessor naf-entity-author-coref
    :documentation ":ORIGINAL-FIELD \"author\"")

   (naf-entity-person-coref
    :initarg :naf-entity-person-coref
    :accessor naf-entity-person-coref
    :documentation ":ORIGINAL-FIELD \"people\"")

   (naf-entity-brand-coref
    :initarg :naf-entity-brand-coref
    :accessor naf-entity-brand-coref
    :documentation ":ORIGINAL-FIELD \"brand\"")

   (naf-entity-publication-coref
    :initarg :naf-entity-publication-coref
    :accessor naf-entity-publication-coref
    :documentation ":ORIGINAL-FIELD \"book\"")

   (media-entity-technique-coref
    :initarg :media-entity-technique-coref
    :accessor media-entity-technique-coref
    :documentation ":ORIGINAL-FIELD \"technique\"")

   (media-entity-paper-coref
    :initarg :media-entity-paper-coref
    :accessor media-entity-paper-coref
    :documentation ":ORIGINAL-FIELD \"paper\"")

   ( ;; | replaced 382 self references. IGNORABLE 
    ignorable-documentation-site-doc
    :initarg :ignorable-documentation-site-doc
    :accessor ignorable-documentation-site-doc
    :documentation ":ORIGINAL-FIELD \"sitedoc\"")

   (;; | replaced 20 self references: <field name="general">general</field> IGNORABLE 
    ignorable-documentation-general
    :initarg :ignorable-documentation-general
    :accessor ignorable-documentation-general
    :documentation ":ORIGINAL-FIELD \"general\"")

   ( ;; contains inlied href'd xrefs to entities -- likely out of date. useless
    ignorable-documentation-content-english
    :initarg :ignorable-documentation-content-english
    :accessor ignorable-documentation-content-english
    :documentation ":ORIGINAL-FIELD \"content_en\"")

   ( ;;  <field name="content_fr">general</field> (search-forward-regexp "content_fr\">[^<]" nil t)
    ;; (search-forward-regexp "content_fr\">" nil t)
    ignorable-documentation-content-french
    :initarg :ignorable-documentation-content-french
    :accessor ignorable-documentation-content-french
    :documentation ":ORIGINAL-FIELD \"content_fr\"")

   (;; The title for the meta-document
    ;; :DESCRIPTION-DOCUMENTATION-DOCUMENT-TITLE            "0" ; occurs 8 times
    description-documentation-document-title
    :initarg :description-documentation-document-title
    :accessor description-documentation-document-title
    :documentation ":ORIGINAL-FIELD \"title_en\"")

   (
    ;; the only documents which have a doc_title value are the bofa docs 
    ;; 34 255 256 259 260 261 262
    ;; 2178 are empty
    ;; (search-forward-regexp "doc_title\">[^<]" nil t) 
    ignorable-documentation-title
    :initarg :ignorable-documentation-title
    :accessor ignorable-documentation-title
    :documentation ":ORIGINAL-FIELD \"doc_title\"")

   ( ;; contains actual content.
    documentation-content
    :initarg :documentation-content
    :accessor documentation-content
    :documentation ":ORIGINAL-FIELD \"doc_raw_en\"")

   ( ;; en | fr
    documentation-language-type
    :initarg :documentation-language-type
    :accessor documentation-language-type
    :documentation ":ORIGINAL-FIELD \"lang\"")

   ( 
    ;; :DOCUMENTATION-PAGE-COUNT-INDEX "0" ; indicates a deleted document? happens 9 times
    ;; now exists as an integer value
    ;; pg N of N
    documentation-page-count-index
    :initarg :documentation-page-count-index
    :accessor documentation-page-count-index
    :documentation ":ORIGINAL-FIELD \"page\"")

   (;; when present, is a subtitle corresponding to pg N of N 
    description-documentation-page-title
    :initarg :description-documentation-page-title
    :accessor description-documentation-page-title
    :documentation ":ORIGINAL-FIELD \"page_title\"")

   (ignorable-documentation-content-link
    :initarg :ignorable-documentation-content-link
    :accessor ignorable-documentation-content-link
    :documentation ":ORIGINAL-FIELD \"content_link\"")

   (category-entity-0-coref
    :initarg :category-entity-0-coref
    :accessor category-entity-0-coref
    :documentation ":ORIGINAL-FIELD \"categ\"")

   (category-entity-1-coref
    :initarg :category-entity-1-coref
    :accessor category-entity-1-coref
    :documentation ":ORIGINAL-FIELD \"c1\"")

   (category-entity-2-coref
    :initarg :category-entity-2-coref
    :accessor category-entity-2-coref
    :documentation ":ORIGINAL-FIELD \"c2\"")
 
   (category-entity-3-coref
    :initarg :category-entity-3-coref
    :accessor category-entity-3-coref
    :documentation ":ORIGINAL-FIELD \"c3\"")

   (category-entity-4-coref
    :initarg :category-entity-4-coref
    :accessor category-entity-4-coref
    :documentation ":ORIGINAL-FIELD \"c4\"")

   (category-entity-5-coref
    :initarg :category-entity-5-coref
    :accessor category-entity-5-coref
    :documentation ":ORIGINAL-FIELD \"c5\"")

   (category-entity-6-coref
    :initarg :category-entity-6-coref
    :accessor category-entity-6-coref
    :documentation ":ORIGINAL-FIELD \"c6\"")
   
   ;; "__IGNORED-1"
   (category-entity-precedence-list
   :initarg :category-entity-precedence-list
   :accessor category-entity-precedence-list
   :documentation "Not present in original table, but corresponds to what we have for the same slot with class `parsed-inventory-record'.")

   (;; keyword either :stan | :constance
    edit-by-creator
    :initarg :edit-by-creator
    :accessor edit-by-creator
    :documentation ":ORIGINAL-FIELD \"user\"")

   (;; 1 | 0 | null
    record-status-active
    :initarg :record-status-active
    :accessor record-status-active
    :documentation ":ORIGINAL-FIELD \"on_line\"")

   ( ;; ignorable
    edit-timestamp-origin
    :initarg :edit-timestamp-origin
    :accessor edit-timestamp-origin
    :documentation ":ORIGINAL-FIELD \"date_edit\"")

   ( ;; the good one
    edit-timestamp
    :initarg :edit-timestamp
    :accessor edit-timestamp
    :documentation ":ORIGINAL-FIELD \"date_edt\"")
   )
  )


;; base-documentation-record
(make-parsed-class-field-slot-accessor-mapping 
 'parsed-documentation-record
 '(
   ("doc_id"       . control-id-documentation-record-document-id)
   ("id"           . control-id-documentation-record-document-page-id) 
   ("artist"       . naf-entity-artist-coref)
   ("author"       . naf-entity-author-coref)
   ("people"       . naf-entity-person-coref)
   ("brand"        . naf-entity-brand-coref)
   ("book"         . naf-entity-publication-coref)
   ("technique"    . media-entity-technique-coref)
   ("paper"        . media-entity-paper-coref)
   ("sitedoc"      . ignorable-documentation-site-doc)
   ("general"      . ignorable-documentation-general)
   ("content_en"   . ignorable-documentation-content-english)
   ("content_fr"   . ignorable-documentation-content-french)
   ("title_en"     . description-documentation-document-title)
   ("doc_title"    . ignorable-documentation-title)
   ("doc_raw_en"   . documentation-content)
   ("lang"         . documentation-language-type)
   ("page"         . documentation-page-count-index)
   ("page_title"   . description-documentation-page-title)
   ("content_link" . ignorable-documentation-content-link)
   ("categ"        . category-entity-0-coref)
   ("c1"           . category-entity-1-coref)
   ("c2"           . category-entity-2-coref) 
   ("c3"           . category-entity-3-coref)
   ("c4"           . category-entity-4-coref)
   ("c5"           . category-entity-5-coref)
   ("c6"           . category-entity-6-coref)
   ("user"         . edit-by-creator)
   ("on_line"      . record-status-active)
   ("date_edit"    . edit-timestamp-origin)
   ("date_edt"     . edit-timestamp)
   ("__IGNORED-1"  . category-entity-precedence-list)
   ))

;; (make-instance 'parsed-documentation-record)
;; (accessor-to-field-table 'parsed-documentation-record)
;; (field-to-accessor-table 'parsed-documentation-record)
;; (accessors-of-parsed-class 'parsed-documentation-record)
;; (fields-of-parsed-class 'parsed-documentation-record)
;; (initargs-of-parsed-class 'parsed-documentation-record)

;; :NOTE `set-parsed-documentation-record-slot-value' is defined in loadtime-bind.lisp
;; (def-set-parsed-class-record-slot-value 
;;      set-parsed-doc-record-slot-value
;;      parsed-documentation-record)
;;
;;; *parsed-class-field-slot-accessor-mapping-table*




;; (search-forward-regexp "sitedoc\">[^<]+" nil t)
;; (while (search-forward-regexp ".*<field name=\"c5\"></field>" nil t) (replace-match ""))
;; (while (search-forward-regexp "^$" nil t) 
;;   (unless (or (eobp) (eq (point-max) (1+ (point)))) (delete-char 1)))

;; (while (search-forward-regexp ".*<field name=\"c5\"></field>" nil t) (progn (beginning-of-line 1) ))(delete-char -1)

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
;; :FIELD "general" :TRANSFORM ignorable-documentation-general
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
;; 2185 matches for "[[:blank:]]+<field name=\"general\">" in buffer: dump-docs-xml -- all empty

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
;; ;; en | fr
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
;;  <field name="page">0</field>
;;  <field name="page">19</field>
;;
;; - 2185 non-null values always an integer in the range [0,19]
;;    9 with value 0  @ field `id`: 357, 358, 360, 361, 362, 364, 366, 367, 368, 369
;;    1 with value 19
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
;;  <field name="page_title">Part 2</field>
;;  <field name="page_title">Nous venons de fonder un journal - L\\\'Escaramouche</field>
;;  <field name="page_title">Part 13 - Comparison of Line Engraving with Nature.</field>
;;
;; - 1185 non-null values
;;   Some of these have mostly useless values like "part 1" "part 13"

;;; ==============================
;; :FIELD "content_link" :TRANSFORM ignorable-documentation-content-link
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
;; 2185 matches for "[[:blank:]]+<field name=\"content_link\">" in buffer: dump-docs-xml -- all empty
;; (search-forward-regexp "content_link\">[^<]+" nil t)
;; (search-forward-regexp "content_link\"> +" nil t)
;; (search-forward-regexp "[[:blank:]]+content_link\">" nil t)


;;; ==============================
;; :FIELD "categ" :TRANSFORM category-entity-0-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; 
;; <field name="categ">Documentation</field>
;; <field name="categ">Site Documentation</field>
;;
;; - one of two possible values "Documentation" | "Site Documentation"
;;

;;; ==============================
;; :FIELD "c1" :TRANSFORM category-entity-1-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - 2185 non-null occurences
;;

;;; ==============================
;; :FIELD "c2" :TRANSFORM category-entity-2-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - :NOTE replaced 91 occurences of "Planographic and ProcessTechniques" -> "Planographic and Process Techniques"
;; - 2140 occurences each non-null occurence is a site documentation related entry


;;; ==============================
;; :FIELD "c3" :TRANSFORM category-entity-31-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - 1700 occurences - each non-null occurence is a site documentation related entry
;;

;;; ==============================
;; :FIELD "c4" :TRANSFORM category-entity-4-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; <field name="c4">Advertising and Graphics</field>
;; <field name="c4">Books and Publications</field>
;; <field name="c4">Architecture and Design</field>
;; <field name="c4">Geography</field>
;; <field name="c4">Historical Life and Scenes</field>
;; <field name="c4">Natural History</field>
;;
;; - 6 product category references listed above the remainder are either empty or refernce site documentation
;;

;;; ==============================
;; :FIELD "c5" :TRANSFORM category-entity-5-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; <field name="c5">Airplane and Air Travel</field>
;; <field name="c5">Anthropology</field>
;; <field name="c5">Antique (Pre 1890)</field>
;; <field name="c5">Antiquity and Archeology</field>
;; <field name="c5">Automobiles</field>
;; <field name="c5">Botany</field>
;; <field name="c5">Conchology</field>
;; <field name="c5">Contemporary (1946-Present)</field>
;; <field name="c5">Entomology</field>
;; <field name="c5">Ephemera</field>
;; <field name="c5">Events Festival and Expositions</field>
;; <field name="c5">Fashion and Apparel</field>
;; <field name="c5">Fine Press and Ltd Edition</field>
;; <field name="c5">Food Related Items</field>
;; <field name="c5">Furniture and Appliances</field>
;; <field name="c5">Herpetology</field>
;; <field name="c5">Ichthyology</field>
;; <field name="c5">Industry</field>
;; <field name="c5">Journals and Publications</field>
;; <field name="c5">Landscapes</field>
;; <field name="c5">Liquor and Beverage</field>
;; <field name="c5">Mammalogy</field>
;; <field name="c5">Maps and Cartography</field>
;; <field name="c5">Military</field>
;; <field name="c5">Modern (1890-1945)</field>
;; <field name="c5">Mycology</field>
;; <field name="c5">Naval and Nautical</field>
;; <field name="c5">Ornithology</field>
;; <field name="c5">Sporting and Hunt Scenes</field>
;; <field name="c5">Sports</field>
;; <field name="c5">Surveys</field>
;; <field name="c5">Travel and Destinations</field>
;; <field name="c5">Travel</field>
;; <field name="c5">Utilities and Infrastructure</field>
;;
;; - 161 occurences 
;;   34 are the product categories listed above, remaining 127 are for site documentation related entries.
;;   NOTE there will be duplicate entries because of the way sub-doc/meta-doc are structured.

;;; ==============================
;; :FIELD "c6" :TRANSFORM category-entity-6-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; <field name="c6">Parts and Supplys</field>
;; <field name="c6">Gasoline and Oil</field>
;; <field name="c6">Auto Manufacturers</field>
;; <field name="c6">Airplane Parts</field>
;; <field name="c6">Airlines</field>
;; <field name="c6">Hotels and Locale</field>
;; <field name="c6">Alcohol and Spirits</field>
;; <field name="c6">Publications Announcements</field>
;; <field name="c6">Accessories</field>
;; <field name="c6">Boutiques and Shops</field>
;; <field name="c6">Sheet Music</field>
;; <field name="c6">Labels</field>
;; <field name="c6">Restaurant Menus</field>
;; <field name="c6">Artist Hub Details</field>
;; <field name="c6">Author Hub Details</field>
;; <field name="c6">Publication Hub Details</field>
;; <field name="c6">Portrait Hub Details</field>
;; <field name="c6">Brand Hub Details</field>
;; <field name="c6">Technique Hub Details</field>
;; <field name="c6">Emailing your Wishlist</field>
;; <field name="c6">Load a previously saved Compare Group</field>
;; <field name="c6">Delete a Compare Group</field>
;; <field name="c6">Rail</field>
;; <field name="c6">Cruise Lines</field>
;;
;; - 24 occurences
;;

;;; ==============================
;; :FIELD "user" :TRANSFORM edit-by-creator
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;  <field name="user">stan</field>
;;  <field name="user">constance</field>

;; 
;; - 498 non-null entries, all either: stan | constance
;;    

;;; ==============================
;; :FIELD "on_line" :TRANSFORM record-status-active
;;
;;         :TYPE "smallint(5) unsigned"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  <field name="on_line">0</field>
;;  <field name="on_line">1</field>
;; - either 0 | 1 | null 
;; no clue what the values actually indicate
;;

;;; ==============================
;; :FIELD "date_edit" :TRANSFORM  edit-timestamp-origin
;;
;;         :TYPE "varchar(50)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;  <field name="date_edit">2006-04-3</field>
;;  <field name="date_edit">2009-3-27</field>
;;
;; - 320 null values 1865 non-null
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
;;  <field name="date_edt">0000-00-00 00:00:00</field>
;;  <field name="date_edt">2006-04-03 04:00:00</field>
;;
;; - 318 with values 0000-00-00 00:00:00 1867 with time-value
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
