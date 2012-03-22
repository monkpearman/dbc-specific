;;; :FILE-CREATED <Timestamp: #{2012-03-16T15:46:51-04:00Z}#{12115} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-translation-for-inventory-record.lisp
;;; ==============================

;; note fixed items 4845, 4843, and 4810 by hand
;; 4802 4793 4791 4785 4772 4771 4770 4769 4768 4766

;; these are translation records for the gil blas stuff
;; field ref corresponds with inventory-number of class `parsed-inventory-record'
;; See the file dump-translations-xml for details. It contains 3807 records 2129
;; have their extra or translation-append-for-record field with a 1 value

(in-package #:dbc)

;; inventory-number
(defclass parsed-translation-for-inventory-record (parsed-class)
  ((inventory-number
    :initarg :inventory-number
    :accessor inventory-number
    :documentation ":ORIGINAL-FIELD \"ref\"")

   (;; description-inventory-french
    translation-french 
    :initarg :translation-french
    :accessor translation-french
    :documentation ":ORIGINAL-FIELD \"fr\"")

   (ignorable-translation-year
    :initarg :ignorable-translation-year
    :accessor ignorable-translation-year
    :documentation ":ORIGINAL-FIELD \"year\"")

   (naf-entity-artist-coref
    :initarg :naf-entity-artist-coref
    :accessor naf-entity-artist-coref
    :documentation ":ORIGINAL-FIELD \"artist\"")

   (;; description-inventory-title and maybe description-inventory-english
    translation-english
    :initarg :translation-english
    :accessor translation-english
    :documentation ":ORIGINAL-FIELD \"en\"")

   (ignorable-translation-issue
    :initarg :ignorable-translation-issue
    :accessor ignorable-translation-issue
    :documentation ":ORIGINAL-FIELD \"issue\"")

   (naf-entity-author-coref
    :initarg :naf-entity-author-coref
    :accessor naf-entity-author-coref
    :documentation ":ORIGINAL-FIELD \"writer\"")

   (naf-entity-composer-coref
    :initarg :naf-entity-composer-coref
    :accessor naf-entity-composer-coref
    :documentation ":ORIGINAL-FIELD \"composer\"")
 
   (translation-append-for-record
    :initarg :translation-append-for-record
    :accessor translation-append-for-record
    :documentation ":ORIGINAL-FIELD \"extra\"")

   (edit-timestamp
    :initarg :edit-timestamp
    :accessor edit-timestamp
    :documentation ":ORIGINAL-FIELD \"date\""))
  (:documentation "Instances of this class correlate some longstanding translations
for the Gil Blas inventory with their corresponding a `parsed-inventory-record'."))

(make-parsed-class-field-slot-accessor-mapping 
 'parsed-translation-for-inventory-record
 '(("ref"      . inventory-number)
   ("fr"       . translation-french)
   ("year"     . ignorable-translation-year)
   ("artist"   . naf-entity-artist-coref)
   ("en"       . translation-english)
   ("issue"    . ignorable-translation-issue)
   ("writer"   . naf-entity-author-coref)
   ("composer" . naf-entity-composer-coref) 
   ("extra"    . translation-append-for-record)
   ("date"     . edit-timestamp)))

;; (defparameter *tt--translation-record-xref-table*

;; (write-parsed-translation-for-inventory-record-parse-table-to-file  

;; following will write all objects with `translation-append-for-record' slot
;; value equal "1" to non-default parsed-class-table-dumps file
;; (loop 
;;   with hash = (make-hash-table :test #'equal)
;;   for obj being the hash-value in (parsed-class-parse-table 'parsed-translation-for-inventory-record)
;;   ;; when (equal (translation-append-for-record obj) "1") count obj ; => 2126
;;   do (and (equal (translation-append-for-record obj) "1")
;;           (setf (gethash (inventory-number obj) hash) obj))
;;   finally (return (write-parsed-translation-for-inventory-record-parse-table-to-file :hash-table hash)))


;;; ==============================
;; :FIELD "ref" :TRANSFORM
;;
;;         :TYPE "smallint(6)"
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
;; :FIELD "fr" :TRANSFORM
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
;; :FIELD "year" :TRANSFORM
;;
;;         :TYPE "smallint(5) unsigned"
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
;; :FIELD "en" :TRANSFORM
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
;; :FIELD "issue" :TRANSFORM
;;
;;         :TYPE "smallint(5) unsigned"
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
;; :FIELD "writer" :TRANSFORM
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
;; :FIELD "composer" :TRANSFORM
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
;; :FIELD "extra" :TRANSFORM
;;
;;         :TYPE "tinyint(4)"
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
;; :FIELD "date" :TRANSFORM
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

;; <table_structure name="translations">
;;   <field Field="ref" Type="smallint(6)" Null="NO" Key="PRI" Extra="auto_increment" />
;;   <field Field="fr" Type="text" Null="NO" Key="" Extra="" />
;;   <field Field="year" Type="smallint(5) unsigned" Null="NO" Key="" Default="0" Extra="" />
;;   <field Field="artist" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;;   <field Field="en" Type="text" Null="NO" Key="" Extra="" />
;;   <field Field="issue" Type="smallint(5) unsigned" Null="NO" Key="" Default="0" Extra="" />
;;   <field Field="writer" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;;   <field Field="composer" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;;   <field Field="extra" Type="tinyint(4)" Null="NO" Key="" Default="0" Extra="" />
;;   <field Field="date" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />
;;   <key Table="translations" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="ref" Collation="A" Cardinality="3805" Null="" Index_type="BTREE" Comment="" />
;;   <options Name="translations" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="3805" Avg_row_length="89" Data_length="340084" Max_data_length="281474976710655" Index_length="33792" Data_free="0" Auto_increment="5294" Create_time="2009-12-08 00:23:37" Update_time="2009-12-08 00:23:37" Collation="latin1_swedish_ci" Create_options="" Comment="" />
;; </table_structure>

;;; ==============================
;;; EOF
