;;; :FILE-CREATED <Timestamp: #{2010-03-18T13:13:57-04:00Z}#{10114} - by MON>
;;; :FILE /home/sp/stan-workspace/HG-Repos/mon-notes-HG/CL-repo-HG/CL-MON-CODE/dbc-specific/cl-dbc-classes-2010-03-18.lisp
;;; ==============================

;;; ==============================
;; :NOTE Stas Boukarev's `tracking` and `storage` projects.
;;
;; Storage provides a persistent backend with some SBCL specific enhancements
;; for fast read/write.
;;
;; Tracking provides a number of class definitions for commonly tracked objects:
;; people, books, movies, music, etc.
;;
;; :SEE (URL `https://github.com/stassats/tracking'), (URL `https://github.com/stassats/tracking.git')
;; :SEE (URL `https://github.com/stassats/storage'), (URL `git://github.com/stassats/storage.git')
;;
;; :NOTE Epigraph provides a convenient grapher with a simplier API than Gary King's cl-graph
;;
;; :NOTE 

;; (remove-overlays (region-beginning) (region-end) 'face  'slime-highlight-edits-face)
;; slime-highlight-edits-mode

(in-package #:cl-user)

;;; :PACKAGES-TO-REQUIRE

;; (require 'lisp-on-lines)
;; (require 'rucksack)
;; (require 'ucw)
;; (asdf-install:install 'manardb)
;; (asdf:operate 'asdf:load-op 'manardb)

(defpackage #:dbc-classes
  (:use #:cl 
	;; #:asdf
	;; #:cl-ppcre
	;; #:ucw
	;; #:rucksack
	;; #:lisp-on-lines
	))

(in-package :dbc-classes)
;;; (list-all-packages)
;;;  *package*



;;; ==============================
;;; :DBC-CLASS-SERIALIZATION
;;; `export-rucksack', `import-rucksack'


;;; ==============================
;;; :LIST-OF-META-CLASSES-TO-INHERIT-FROM

;; 
;; standard-rucksack <- rucksack::standard-class
;; manarddb         (:metaclass manardb:mm-metaclass)

;; (dbc-persistent-class ()
;; (:metaclass persistent-class))

;; (dbc-layered-class () ;; LOL or ContextL
;; (:metaclass ))

;; (dbc-component-class () ;; UCW
;; () )

;;; mixin-inheritor
;; dbc-class (dbc-persistent-class)
;; () )


;;; ==============================
;; :SKETCH-LIST-OF-CLASSES-TO-CREATE

;;; :NOTE Class UID's are best generated with a timestamp using CL's UTC with
;;; the appropriate granularity. :SEE `internal-time-units-per-second'

;;; ==============================
;; dbc-item (dbc-class)

;; :DBC-ITEM-INHERITORS
;;      doc-item  (dbc-doc)
;;      img-item  (dbc-img)
;;              thb-item  (img-thb)
;;              big-item  (img-big)
;;              zm-item   (img-zm)
;;              hdr-item  (img-hdr)
;;              flsh-item (img-flsh)
;;              frm-item  (img-frm)

;;     item-ebay


;;; ==============================
;; doc-dbc (dbc-class)

;; :DOC-DBC-SLOTS
;; doc-title 
;; doc-id
;; doc-subtitle
;; doc-xrefs

;;        doc-item  (dbc-doc)
;;        doc-site  (dbc-doc)
;;        doc-theme (dbc-doc)
;;
;;        doc-naf   (dbc-doc)
;;               doc-term     (doc-naf)
;;               doc-category (doc-naf)


;;; ==============================
;; dbc-naf (dbc-class)
;;        img-naf (dbc-img)
;;               thb-naf    (img-thb)
;;               big-naf    (img-big)
;;               header-naf (img-hdr)  ;; :NOTE This is new.
;;
;;    doc-naf (doc-dbc)

;; :DBC-NAF-SUBCLASSES
;;
;; :NOTE Some of these should have a :directory slot b/c we can be reasonably
;;       certain that they have .naf files
;;
;;    naf-entity ;; :NOTE, conceptually all of these are type-of entity.
;;    naf-person (dbc-naf)
;;    naf-artist (dbc-naf) ;; Or, is this a subtype-of naf-person?
;;    naf-author (dbc-naf) ;; Or, is this a subtype-of naf-person?
;;    naf-brand  (dbc-naf)
;;    naf-book   (dbc-naf)
;;    naf-sport  (dbc-naf)
;;    naf-league (dbc-naf) ;; Or, is this a subtype-of naf-brand?  
;;    naf-team   (dbc-naf) ;; Or, is this a subtype-of naf-brand?
;;    naf-player (dbc-naf) ;; Or, is this a subtype-of naf-person?
;;
;;    naf-term (dbc-naf)
;;            doc-term     (doc-naf)
;;            naf-technique
;;            naf-medium

;;; :NOTE Add the following:

;; naf-location  (dbc-naf) ;; :NOTE KML also geo-facets on tgm-concept
;; naf-publisher (dbc-naf)
;; naf-printer   (dbc-naf)
;; naf-category  (dbc-naf)  
;;               doc-category (doc-naf)
;; naf-taxonomy  (dbc-naf) ;; :NOTE e.g. Linean Name


;;; ==============================
;; dbc-theme (dbc-class)

;;  :SEE :FILE dbc-specific/dbc-classes/mon-tgm.lisp
;;  

;;        img-theme
;;                 thb-theme (img-thb)
;;                 hdr-theme (img-hdr)
;;
;;        doc-theme (dbc-doc)


;;; ==============================
;; dbc-category (dbc-class)
;;         doc-category
;;         naf-category
;;         img-category
;;                     thb-category  (img-thb)
;;                     hdr-category  (img-hdr)
;;                     flsh-categoyr (img-flsh)
;;         
;;
;; :NOTE Decide on img-magick from Franz or Edi's cl-gd. 
;;       Also, remember Zach's VECTO and and SKIPPY, etc.
;;
;;; item-category 
;; Should contain a list of xrefs for all items that claim to
;; be of a category. But, how to propogate through the inheritance??
;;
;; IOW, if the depth-most category is:
;;
;;  categ "Advertising and Graphics"
;;   - c1 "Posters"
;;   -- c2 "Travel and Destination"
;;   --- c3 "Rail Posters"
;;   ---- c4 "London Underground"
;;
;; Thats alot of instances. I guess the answer is a rucksack index.


;;; ==============================
;; dbc-img (dbc-class)
;;
;; :DBC-IMG-SLOTS
;; img-type-path ;; i.e. naf images go to /some/path/naf/<some-naf-instance>/some.jpg
;; img-dir       ;; i.e. <IMG-TYPE-PATH>/<SOME-INSTANCE>/
;; img-frmt      {jpg|png|gif|tiff|bmp|nef}
;; img-rot8      ;; {BOOLEAN [:horizontal|:vertical]} ;; :NOTE img-dim-x & img-dim-y should be conditional on img-rot8.
;; img-dim-x     {:type postive-integer}
;; img-dim-y     {:type postive-integer}
;; img-size      {:type integer :display [:MB|:KB]}
;; img-wmrk      ;; i.e. image should/not be contextually watermarked. pdf reformatting, big nafs, etc.
;; img-tstmp     {:type timestamp}

;; :NOTE following are mixins
;;      img-thb  (dbc-img)
;;      img-big  (dbc-img)
;;      img-hdr  (dbc-img)
;;      img-flsh (dbc-img)
;;      img-zm   (dbc-img)
;;      img-frm  (dbc-img)
;;      img-exif (dbc-img) ;; :NOTE Can inherit or used this to deterime slot values above. 
;;                         ;; :NOTE Also, that exif date/time stamps are mutable whereas a img-tstmp isn't
;;      img-gif  (dbc-img)
;;      img-ico  (dbc-img)
;;      img-site (dbc-img)
;;              site-gif (img-gif)
;;              site-ico (img-ico)
;;              site-thb (img-thb)
;;
;;      img-item (dbc-img)
;;              thb-item  (img-thb)
;;              big-item  (img-big)
;;              zm-item   (img-zm)
;;              hdr-item  (img-hdr)
;;              flsh-item (img-flsh)
;;              frm-item  (img-frm)
;;
;; img-naf (dbc-img)
;;        thb-naf (img-thb)
;;        big-naf (img-big)
;;        hdr-naf (img-hdr) ;; :NOTE This is new.
;;
;; img-category
;;             thb-category (img-thb)
;;             hdr-category (img-hdr)
;;             flsh-category (img-flsh)
;;
;; img-theme
;;            thb-theme  (img-thb)
;;            hdr-theme  (img-hdr)
;;            flsh-theme (img-flsh)

;;; ==============================
;;; :METHODS-TO-IMPLEMENT

;; :SLOT-XREFS

dbc-xref-rmv-in-slot
dbc-xref-add-to-slot
;; according to the slot xrefing scheme we need to have methods to add/rmv/verify xrefs

;; :IMAGES
dbc-img-rsz {img-thb img-big img-hdr img-flsh img-zm img-frm}

dbc-img-verify-rotation

dbc-img-watermark

dbc-img-rmv-metadata ;; exif metadata removal
dbc-img-get-metadata ;; exif metadata getter
dbc-img-put-metadata ;; exif metadata setter


;;; ==============================
;; <table_structure name="refs">
;; 		<field Field="ref" Type="mediumint(8) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
;; 		<field Field="bar_code" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="title" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="Plate_number" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="price" Type="int(10)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="desc_fr" Type="text" Null="NO" Key="" Extra="" />
;; 		<field Field="desc_en" Type="text" Null="NO" Key="" Extra="" />
;; 		<field Field="condition" Type="text" Null="NO" Key="" Extra="" />
;; 		<field Field="histo_fr" Type="text" Null="NO" Key="" Extra="" />
;; 		<field Field="histo_en" Type="mediumint(9)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="categ" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="c1" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="c2" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="c3" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="c4" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="theme" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="keywords" Type="text" Null="NO" Key="MUL" Extra="" />
;; 		<field Field="issue" Type="varchar(5)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="year" Type="varchar(100)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="artist" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="author" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="book" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="publisher" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="publish_location" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="w" Type="float unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="h" Type="float unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="technique" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="paper" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="color" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="onlinen" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="av_repro" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="latin_name" Type="varchar(192)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="nbre" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="online" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="seller" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="people" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="related_doc" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="brand" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="translation" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="date" Type="varchar(100)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="user_name" Type="varchar(100)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="done" Type="tinyint(4)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="job_name" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="locked" Type="tinyint(4)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="keywords_type" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="text_quote" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="theme3" Type="varchar(255)" Null="YES" Key="" Extra="" />
;; 		<field Field="theme2" Type="varchar(255)" Null="YES" Key="" Extra="" />
;; 		<field Field="c6" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="weight" Type="tinyint(4)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="c5" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="composer" Type="varchar(255)" Null="YES" Key="" Extra="" />
;; 		<field Field="uri" Type="varchar(255)" Null="YES" Key="" Default="0" Extra="" />
;; 		<field Field="year_year" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="notes" Type="text" Null="NO" Key="" Extra="" />
;; 		<field Field="volume" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="edition" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="page" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="bct" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="categ_doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="c1_doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="c2_doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="c3_doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="ebay_final" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="ebay_price" Type="float unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="ebay_title" Type="varchar(55)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="ebay_id" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="seo_title" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="description_seo" Type="text" Null="NO" Key="" Extra="" />
;; 		<field Field="keywords_seo" Type="text" Null="NO" Key="" Extra="" />
;; 		<field Field="date_edit" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />
;; 		<field Field="edit_history" Type="text" Null="NO" Key="" Extra="" />
;; 		<key Table="refs" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="ref" Collation="A" Cardinality="8969" Null="" Index_type="BTREE" Comment="" />
;; 		<key Table="refs" Non_unique="1" Key_name="keywords" Seq_in_index="1" Column_name="keywords" Cardinality="1" Null="" Index_type="FULLTEXT" Comment="" />
;; 		<options Name="refs" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="8969" Avg_row_length="939" Data_length="8427580" Max_data_length="281474976710655" Index_length="2570240" Data_free="0" Auto_increment="12418" Create_time="2009-12-08 00:23:22" Update_time="2009-12-08 00:23:23" Check_time="2009-12-08 00:23:24" Collation="latin1_swedish_ci" Create_options="" Comment="" />
;; 	</table_structure>

;; <table_structure name="artist_infos">
;; 		<field Field="bio" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="id" Type="int(4) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
;; 		<field Field="display" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="nationality" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="role" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="lifespan" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="date_born" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="date_died" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="birth_location" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="death_location" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="LOC_control" Type="varchar(15)" Null="YES" Key="" Default="0" Extra="" />
;; 		<field Field="used_for" Type="text" Null="NO" Key="" Extra="" />
;; 		<field Field="found_in" Type="text" Null="NO" Key="" Extra="" />
;; 		<field Field="appeared_in" Type="text" Null="NO" Key="MUL" Extra="" />
;; 		<field Field="ads_for" Type="text" Null="NO" Key="" Extra="" />
;; 		<field Field="auction_records" Type="text" Null="NO" Key="" Extra="" />
;; 		<field Field="cancel_num" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="special_note" Type="text" Null="NO" Key="" Extra="" />
;; 		<field Field="gender" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="date_edit" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="ULAN_control" Type="varchar(15)" Null="YES" Key="" Extra="" />
;; 		<field Field="default_pic" Type="varchar(10)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="print_default_pic" Type="varchar(10)" Null="NO" Key="" Default="" Extra="" />
;; 		<field Field="also_author" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="also_people" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="user_name" Type="varchar(32)" Null="YES" Key="" Extra="" />
;; 		<field Field="naf_creator" Type="varchar(32)" Null="YES" Key="" Extra="" />
;; 		<field Field="online" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; 		<field Field="date_edt" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />
;; 		<key Table="artist_infos" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="id" Collation="A" Cardinality="1288" Null="" Index_type="BTREE" Comment="" />
;; 		<key Table="artist_infos" Non_unique="1" Key_name="appeared_in" Seq_in_index="1" Column_name="appeared_in" Cardinality="1" Null="" Index_type="FULLTEXT" Comment="" />
;; 		<key Table="artist_infos" Non_unique="1" Key_name="appeared_in" Seq_in_index="2" Column_name="ads_for" Cardinality="1" Null="" Index_type="FULLTEXT" Comment="" />
;; 		<options Name="artist_infos" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="1288" Avg_row_length="2146" Data_length="2764632" Max_data_length="281474976710655" Index_length="37888" Data_free="0" Auto_increment="1472" Create_time="2009-12-08 00:23:18" Update_time="2009-12-08 00:23:18" Check_time="2009-12-08 00:23:18" Collation="latin1_swedish_ci" Create_options="" Comment="" />
;; 	</table_structure>
;; 	<table_data name="artist_infos">


;;; ==============================

;;; CSV-DATA
;; 2986,"","L'inconsciente esthere","",10,"","","[4+] moderate age staining.","",0,"Books and Publications","Journals and Publications","French","Le Rire","1","Pregnant women","Books and Publications Journals and Publications French Le Rire 1   L'inconsciente esthere Fabiano (Fabien)   Le Rire  Pregnant women Couples Passageways October, 29, 1910 pseudonyme de Coup de Fréjac Jules    Felix Juven","404","October, 29, 1910","Fabiano (Fabien)","","Le Rire","Felix Juven","Paris",9,12,"Chromotypograph","Machine Age - Wood Pulp",1,0,0,"",0,3,"","",0,"",0,"20040812135634","constance",1,"laura_lerire",0,"","0","Passageways","Couples","",1,"","","Journals_and_Publications_Fabiano_Le_Rire_Pregnant_women_Passageways_image-2986.htm",1910,"","","","","",0,0,0,0,0,0,"","0","  -  Fabiano (Fabien), Original Print -October, 29, 1910 - FABIANO  FROM LE RIRE","","","2004-08-12 13:56:34",""


;;; ==============================
;; CLOCC-cllib/card.lisp

;; :ECCLESIASTICAL-TITLES
;; Abbess Abbot Ablak Anax Archbishop Archdeacon Ayatollah Blessed Bishop
;; Bodhisattva Brother Buddha Cantor Cardinal Catholicos Chaplain Deacon Dean
;; Demiurge Elder Father Friar Imam Mahdi Messiah Minister Monsignor Mother
;; Superior Mullah Nath Pastor Patriarch Pope Primate Prophet Rabbi Rebbe Reverend
;; Rosh HaYeshiva Saint Saoshyant Sister Ter[disambiguation needed] Tirthankar
;; Vardapet Venerable

;; :HEREDITARTY-TITLES 
;; "Duke" "Duchess" "Archduke" "Archduchess" "Grand Duke" "Grand Duchess" "Earl"
;; "Count" "Countess"
;; "Emperor" "Empress" "King Queen" "Prince" "Princess" "Tsar" "Tzar"
;;  "Baron" "Baroness"

;; :HONORARY-TITLE
;; "Marquis" "Marquess" "Marquise" "Marchioness"


;; PREFIX
(defcustom *name-apellations* list 
  ;; "Madam" "Lady" "Dame" 
  ;; "Mstr." "Mister"
  '("Mr."
    "Mrs." "Mrs" ;; Mrs <- UK
    "Ms." "Miss" 
    "Dr" "Dr." 
    "Professor" "Prof.")
  "The list of recognizable apellations.
e.g. titles prefexing a name")

;; SUFFIX

(defcustom *name-apellations-suffix* list
  '("Jr." "Junior" 
    "Sr." "Senior"
    "Ph.D."
    "M.D."
    "Esq.") ;; "Esquire" )
  "The list of recognizable apellations.
e.g. titles suffixing a name form.")

(defclass name ()
  ((first
    :type simple-string 
    :initarg :first
    :accessor name-first
    :documentation "The first name")
   (middle
    :type simple-string 
    :initarg :middle
    :accessor name-middle
    :documentation "The middle initial or middle-name")
   (last
    :type simple-string 
    :initarg :last 
    :accessor name-last
    :documentation "The last name")
   (prefix
    :type simple-string 
    :initarg :prefix 
    :accessor name-prefix
    :documentation "the prefix (like `PhD')")
   (suffix 
    :type simple-string 
    :initarg :suffix 
    :accessor name-suffix
    :documentation "the suffix (like `VII')")
   (pseudo 
    :type cons 
    :initarg :pseudo
    :accessor name-pseudo
    :documentation "A list of psuedoymns, aliases, akas etc."))
  (:documentation "The name - with bells and whistles."))

;; :INSTALLED TO mon-system/class-utils.lisp :WAS `slot-val'
;; (defun slot-value-or (obj slot &optional default)
;;   (or (when (slot-boundp obj slot)
;; 	(slot-value obj slot))
;;       default))

(defun name-print-as-pretty (nm out)
  (declare (type name nm) (stream out))
  (format out "~@[~a ~]~@[~a ~]~@[~a ~]~@[~a~]~@[, ~a~]"
          (slot-value-or nm 'prefix) 
	  (slot-value-or nm 'first) 
	  (slot-value-or nm 'middle)
          (slot-value-or nm 'last)
	  (slot-value-or nm 'suffix)
	  ;; (slot-value-or nm 'pseudo)
	  ;; (slot-value-or nm 'created)
	  ;; (slot-value-or nm 'timestamp)
	  ))

;;; ==============================
;;; Would be nice to also use thes slots:

;; (created :type     (integer 0) 
;; 	 :initarg  created 
;; 	 :accessor name-created
;; 	 :documentation "The creation time, in seconds since the epoch.")

;; (timestamp :type     (integer 0) 
;; 	   :initarg  timestamp 
;; 	   :accessor name-timestamp
;; 	   :documentation "The last modification time.")



(defun dttm->string (dttm &key (format :long) (tz 0) (dst nil dst-p))
  "Print the date/time as returned by `encode-universal-time'.
DTTM is the universal time (GMT).
FORMAT is passed to DATE-FORMATTER.
TZ is the time zone in which the time is printed, NIL means local.
DST is Daylight Saving Time indicator."
  (declare (type (integer 0) dttm))
  (multiple-value-bind (se mi ho da mo ye dd dst1 tz1)
      (decode-universal-time dttm tz)
    (date-formatter format se mi ho da mo ye dd (if dst-p dst dst1) tz1)))

;; `time-zone-to-string', `+week-days+' <- chronos.lisp
;; date-formatter :LONG -> 
 (format nil "~a ~a ~a ~a" 
	 (format nil "~d-~2,'0d-~2,'0d" ye mo da) ;; (date2string ye mo da) 
	 (aref +week-days+ dd)
	 ;; (time2string ho mi se)
	 (if (integerp se)
	     (format nil "~2,'0d:~2,'0d:~2,'0d" ho mi se)
	     (multiple-value-bind (s u) (floor se) ; assume se>0
	       (format nil "~2,'0d:~2,'0d:~2,'0d~4f" ho mi s u)))
	 (time-zone-to-string tz dst))

;; (defun date2string (ye mo da) 
;;   (format nil "~d-~2,'0d-~2,'0d" ye mo da))
;;
;; (defun time2string (ho mi se)
;;   (if (integerp se)
;;       (format nil "~2,'0d:~2,'0d:~2,'0d" ho mi se)
;;       (multiple-value-bind (s u) (floor se) ; assume se>0
;;         (format nil "~2,'0d:~2,'0d:~2,'0d~4f" ho mi s u))))

  

;;; ==============================





;;; ==============================
;;; EOF
