;;; :FILE-CREATED <Timestamp: #{2011-05-05T16:52:12-04:00Z}#{11184} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-publication-record.lisp
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


(defclass parsed-publication-record (parsed-naf-entity)
  ((control-id-doc-num-publication
    :initarg :control-id-doc-num-publication
    :accessor control-id-doc-num-publication
    :documentation ":ORIGINAL-FIELD \"bio\"")

   (control-id-entity-num-publication
    :initarg :control-id-entity-num-publication
    :accessor control-id-entity-num-publication
    :documentation ":ORIGINAL-FIELD \"id\"")

   (control-id-display-publication
    :initarg :control-id-display-publication
    :accessor control-id-display-publication
    :documentation ":ORIGINAL-FIELD \"display\"")

   (control-id-display-publication-full
    :initarg :control-id-display-publication-full
    :accessor control-id-display-publication-full
    :documentation ":ORIGINAL-FIELD \"book_real\"")

   (naf-entity-author-coref
    :initarg :naf-entity-author-coref
    :accessor naf-entity-author-coref
    :documentation ":ORIGINAL-FIELD \"author\"")

   (naf-entity-artist-coref
    :initarg :naf-entity-artist-coref
    :accessor naf-entity-artist-coref
    :documentation ":ORIGINAL-FIELD \"illustrator\"")

   (publication-date
    :initarg :publication-date
    :accessor publication-date
    :documentation ":ORIGINAL-FIELD \"date_pub\"")

   (publication-location
    :initarg :publication-location
    :accessor publication-location
    :documentation ":ORIGINAL-FIELD \"loc_pub\"")

   (publication-volumes
    :initarg :publication-volumes
    :accessor publication-volumes
    :documentation ":ORIGINAL-FIELD \"volumes\"")

   (publication-pages
    :initarg :publication-pages
    :accessor publication-pages
    :documentation ":ORIGINAL-FIELD \"pages\"")

   (publication-illustrations
    :initarg :publication-illustrations
    :accessor publication-illustrations
    :documentation ":ORIGINAL-FIELD \"illustrations\"")

   (ignorable-publication-subjects
    :initarg :ignorable-publication-subjects
    :accessor ignorable-publication-subjects
    :documentation ":ORIGINAL-FIELD \"subjects\"")

   (control-id-db-0
    :initarg :control-id-db-0
    :accessor control-id-db-0
    :documentation ":ORIGINAL-FIELD \"lc_class\"")

   ;; :NOTE case-sensitive
   (control-id-db-1
    :initarg :control-id-db-1
    :accessor control-id-db-1
    :documentation ":ORIGINAL-FIELD \"ULAN_control\"")

   (description-publication-note-content
    :initarg :description-publication-note-content
    :accessor description-publication-note-content
    :documentation ":ORIGINAL-FIELD \"content\"")

   (description-publication-note-general
    :initarg :description-publication-note-general
    :accessor description-publication-note-general
    :documentation ":ORIGINAL-FIELD \"notes\"")

   (description-publication-note-special
    :initarg :description-publication-note-special
    :accessor description-publication-note-special
    :documentation ":ORIGINAL-FIELD \"special_note\"")

   (description-publication-note-sale-appearance
    :initarg :description-publication-note-sale-appearance
    :accessor description-publication-note-sale-appearance
    :documentation ":ORIGINAL-FIELD \"auction_records\"")

   (image-default-id
    :initarg :image-default-id
    :accessor image-default-id
    :documentation ":ORIGINAL-FIELD \"default_pic\"")

   (image-default-xref
    :initarg :image-default-xref
    :accessor image-default-xref
    :documentation ":ORIGINAL-FIELD \"print_default_pic\"")

   (record-status-active
    :initarg :record-status-active
    :accessor record-status-active
    :documentation ":ORIGINAL-FIELD \"online\"")

   (edit-date-origin
    :initarg :edit-date-origin
    :accessor edit-date-origin
    :documentation ":ORIGINAL-FIELD \"date_edit\"")

   (edit-date
    :initarg :edit-date
    :accessor edit-date
    :documentation ":ORIGINAL-FIELD \"date_edt\"")


   (edit-by
    :initarg :edit-by
    :accessor edit-by
    :documentation ":ORIGINAL-FIELD \"user_name\"")

   (edit-by-creator
    :initarg :edit-by-creator
    :accessor edit-by-creator
    :documentation ":ORIGINAL-FIELD \"naf_creator\"")
   )
  (:documentation
   #.(format nil
             "Class for parsed dbc XML `publication-_infos` table.~%~@
:EXAMPLE~%
 \(mon:class-slot-list  'parsed-publication-record\)~%~@
:SEE-ALSO `set-parsed-publication-record-slot-value', `load-sax-parsed-xml-file-to-parsed-class-hash',
`write-sax-parsed-xml-refs-file', `set-parse-ref-slot-value', `parsed-inventory-record'.~%▶▶▶")))

(make-parsed-class-field-slot-accessor-mapping 
 'parsed-publication-record
 '(("bio"                . control-id-doc-num-publication)
   ("id"                 . control-id-entity-num-publication)
   ("display"            . control-id-display-publication)
   ("book_real"          . control-id-display-publication-full)
   ("author"             . naf-entity-author-coref)
   ("illustrator"        . naf-entity-artist-coref)
   ("date_pub"           . publication-date)
   ("loc_pub"            . publication-location)
   ("volumes"            . publication-volumes)
   ("pages"              . publication-pages)
   ("illustrations"      . publication-illustrations)
   ("subjects"           . ignorable-publication-subjects)
   ("lc_class"           . control-id-db-0)
   ("ULAN_control"       . control-id-db-1)
   ("content"            . description-publication-note-content)
   ("notes"              . description-publication-note-general)
   ("special_note"       . description-publication-note-special)
   ("auction_records"    . description-publication-note-sale-appearance)
   ("default_pic"        . image-default-id)
   ("print_default_pic"  . image-default-xref)
   ("online"             . record-status-active)
   ("date_edit"          . edit-date-origin)
   ("date_edt"           . edit-date)
   ("user_name"          . edit-by)
   ("naf_creator"        . edit-by-creator)))


;; :NOTE `set-parsed-inventory-record-slot-value' is defined in loadtime-bind.lisp
;; (def-set-parsed-class-record-slot-value 
;;     set-parsed-publication-record-slot-value
;;     parsed-publication-record)
;;
;;; *big-parsed-class-field-slot-accessor-mapping-table*
;;
;; :NOTE Depreated use the macro'd version generated with `def-set-parsed-class-record-slot-value' instead. 
;; (defun set-parsed-publication-record-slot-value
;;        (field-string field-value object)
;;   (values
;;    (string-case:string-case (field-string)
;;      ("bio" (setf (control-id-doc-num-publication object) field-value))
;;      ("id" (setf (control-id-entity-num-publication object) field-value))
;;      ("display" (setf (control-id-display-publication object) field-value))
;;      ("book_real"
;;       (setf (control-id-display-publication-full object) field-value))
;;      ("author" (setf (naf-entity-author-coref object) field-value))
;;      ("illustrator" (setf (naf-entity-artist-coref object) field-value))
;;      ("date_pub" (setf (publication-date object) field-value))
;;      ("loc_pub" (setf (publication-location object) field-value))
;;      ("volumes" (setf (publication-volumes object) field-value))
;;      ("pages" (setf (publication-pages object) field-value))
;;      ("illustrations" (setf (publication-illustrations object) field-value))
;;      ("subjects" (setf (ignorable-publication-subjects object) field-value))
;;      ("lc_class" (setf (control-id-db-0 object) field-value))
;;      ("ULAN_control" (setf (control-id-db-1 object) field-value))
;;      ("content"
;;       (setf (description-publication-note-content object) field-value))
;;      ("notes" (setf (description-publication-note-general object) field-value))
;;      ("special_note"
;;       (setf (description-publication-note-special object) field-value))
;;      ("auction_records"
;;       (setf (description-publication-note-sale-appearance object) field-value))
;;      ("default_pic" (setf (image-default-id object) field-value))
;;      ("print_default_pic" (setf (image-default-xref object) field-value))
;;      ("online" (setf (record-status-active object) field-value))
;;      ("date_edit" (setf (edit-date-origin object) field-value))
;;      ("date_edt" (setf (edit-date object) field-value))
;;      ("user_name" (setf (edit-by object) field-value))
;;      ("naf_creator" (setf (edit-by-creator object) field-value)))
;;    object))


;;; ==============================
;;  <FIELD>               <TRANSFORM>
;;                        ;; 
;; "bio"                  ;; "control-id-doc-num-publication"
;; "id"                   ;; "control-id-entity-num-publication"
;; "display"              ;; "control-id-display-publication"
;;
;; "book_real"            ;; "control-id-display-publication-full"
;;
;; "author"               ;; "naf-entity-author-coref"
;; "illustrator"          ;; "naf-entity-artist-coref"
;;
;; "date_pub"             ;; "publication-date"
;; "loc_pub"              ;; "publication-location" ;; location-entity
;; "volumes"              ;; "publication-volumes"
;; "pages"                ;; "publication-pages"    ;; :NOTE we really need a slot publication-plates
;; "illustrations"        ;; "publication-illustrations"
;; "subjects"             ;; "ignorable-publication-subjects" ;; IGNORABLE, but verify that this is so
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
;; "online"               ;; "record-status-active"
;; "date_edit"            ;; "edit-date-origin"
;; "date_edt"             ;; "edit-date"
;;
;; "user_name"            ;; "edit-by"
;; "naf_creator"          ;; "edit-by-creator"
;;


;;
;;; ==============================

;;; ==============================
;; :FIELD "bio" :TRANSFORM control-id-doc-num-publication
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
;; :FIELD "id" :TRANSFORM control-id-entity-num-publication
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
;; :FIELD "display" :TRANSFORM control-id-display-publication
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
;; :FIELD "book_real" :TRANSFORM control-id-display-publication-full
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
;; :FIELD "author" :TRANSFORM naf-entity-author-coref
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
;; :FIELD "illustrator" :TRANSFORM naf-entity-artist-coref
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
;; :FIELD "date_pub" :TRANSFORM publication-date
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
;; :FIELD "loc_pub" :TRANSFORM publication-location
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
;; :FIELD "volumes" :TRANSFORM publication-volumes
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
;; - :NOTE item-refs had:
;;   "volume"           ;; "publication-volume"
;; - It really sucks that one is plural an the other isn't... Should we bite the bullet and normalize??? Yes. 2011-10-04
;;
;; - (field-convert-1-0-x-empty-known nil *xml-publication-match-table*)

;;; ==============================
;; :FIELD "pages" :TRANSFORM publication-pages
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
;; :FIELD "illustrations" :TRANSFORM publication-illustrations
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  120
;;
;; - We really a slot `publication-plates'!!!
;; A plates count is different from the count `publication-pages' and also
;; different from the count of `publication-illustrations...'
;;

;;; ==============================
;; :FIELD "special_note" :TRANSFORM description-publication-note-general
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
;; :FIELD "subjects" :TRANSFORM ignorable-publication-subjects
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; -appears unused, verify that thsi is so.
;;
;; (search-forward-regexp "field name=\"subjects\">\\(^</field>\\)" nil t)
;; (search-forward-regexp "name=\"subjects\">[^<]")
;; (search-forward-regexp "name=\"subjects\">")
;; (search-forward-regexp "name=\"pages\">[^<0x].*<" nil t)
;; (search-forward-regexp "name=\"pages\">[^<].*</field" nil t)

;;; ==============================
;; :FIELD "ULAN_control" :TRANSFORM control-id-db-1
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
;; :FIELD "content" :TRANSFORM description-publication-note-content
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
;; :FIELD "auction_records" :TRANSFORM description-publication-note-sale-appearance
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
;; :FIELD "user_name" :TRANSFORM edit-by
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
;; :FIELD "naf_creator" :TRANSFORM edit-by-creator
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
;; :FIELD "print_default_pic" :TRANSFORM image-default-xref
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
;; :FIELD "online" :TRANSFORM record-status-active
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
;; :FIELD "date_edit" :TRANSFORM edit-date-origin
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
;; :FIELD "date_edt" :TRANSFORM edit-date
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
