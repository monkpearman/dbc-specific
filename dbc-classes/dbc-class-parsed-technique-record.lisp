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
;; :NOTE following from dbc-specific/notes-versioned/dbc-xml-categs-as-lisp/xml-files/doc.xml
;; <c1 name="Printing Techniques">
;; <c2 name="Glossary of Printing and Printmaking Terminology"/>
;; <c2 name="Relief Techniques">
;; <c3>Woodblock</c3>
;; <c3>Wood Engraving</c3>
;; <c3>Linocut</c3>
;; <c3>Mezzotint</c3>
;; </c2>
;;
;; <c2 name="Intaglio Techniques">
;; <c3 name="Line Engraving - Metal">
;; <c4>Copper Engraving</c4>
;; <c4>Steel Engraving</c4></c3>
;; <c3 name="Etching">
;; <c4 name="Etching - Mechanical">
;; <c5>Dry Point</c5>
;; <c5>Stipple - Crayon Manner</c5>
;; </c4>
;; <c4 name="Etching - Chemical">
;; <c5>Aquatint</c5>
;; <c5>Etching - Hard Ground</c5>
;; <c5>Etching - Soft Ground</c5>
;; </c4>
;; </c3>
;; </c2>
;;
;; <c2 name="Photomechanical Techniques">
;; <c3>Halftone gravure</c3>
;; <c3>Relief Halftone</c3>
;; <c3>Line Block</c3>
;; <c3>Chromotypograph</c3>
;; </c2>
;;
;; <c2 name ="Planographic and Process Techniques">
;;
;; <c3 name="Lithography">
;; <c4>Offset</c4>
;; <c4>Zincograph</c4>
;; <c4>Stone Lithograph</c4>
;; <c4>Collotype</c4>
;; </c3>
;;
;; <c3 name="Silkscreen - Serigraph"></c3>
;; <c3 name="Pochoir"></c3>
;; </c2>
;; </c1>

;;; ==============================

(in-package #:dbc)
;; *package*

;; media-entity-technique
(defclass parsed-technique-record (parsed-class)
  ((conrtol-id-entity-num-technique
    :initarg :conrtol-id-entity-num-technique
    :accessor conrtol-id-entity-num-technique
    :documentation ":ORIGINAL-FIELD \"id\"")

   (conrtol-id-display-technique
    :initarg :conrtol-id-display-technique
    :accessor conrtol-id-display-technique
    :documentation ":ORIGINAL-FIELD \"display\"")

   (technique-entity-display-name-coref 
    :initarg :technique-entity-display-name-coref
    :accessor technique-entity-display-name-coref
    :documentation ":ORIGINAL-FIELD \"used_for\"")

   (technique-entity-parent-type
    :initarg :technique-entity-parent-type
    :accessor technique-entity-parent-type 
    :documentation ":ORIGINAL-FIELD \"technique_family\"")
   
   (technique-entity-type-coref
    :initarg :technique-entity-type-coref
    :accessor technique-entity-type-coref
    :documentation ":ORIGINAL-FIELD \"variation_of\"")

   (description-media-entity-technique-note
    :initarg :description-technique-notes
    :accessor description-media-entity-technique-note
    :documentation ":ORIGINAL-FIELD \"notes\"")

   (image-default-id 
    :initarg :image-default-id 
    :accessor image-default-id 
    :documentation ":ORIGINAL-FIELD \"default_pic\"")
   
   ;; this is the good one
   (edit-date 
    :initarg :edit-date
    :accessor edit-date
    :documentation ":ORIGINAL-FIELD \"date_edt\"")
   
   ;; IGNORABLE assuming date_edt is present and corresponds
   (edit-date-origin
    :initarg :edit-date-origin
    :accessor edit-date-origin
    :documentation ":ORIGINAL-FIELD \"date_edit\"")
       
   ;; IGNORABLE always 0
   (record-status-active
    :initarg :record-status-active 
    :accessor record-status-active
    :documentation ":ORIGINAL-FIELD \"online\"")

   ;; IGNORABLE always empty
   (edit-by 
    :initarg :edit-by 
    :accessor edit-by 
    :documentation ":ORIGINAL-FIELD \"user_name\"")
 
   ;; IGNORABLE always empty
   (edit-by-creator 
    :initarg :edit-by-creator 
    :accessor edit-by-creator 
    :documentation ":ORIGINAL-FIELD \"naf_creator\"")
   )
  (:documentation
   #.(format nil
             "Class for parsed dbc XML `technique_infos` table.~%~@
:EXAMPLE~%
 \(mon:class-slot-list  'parsed-technique-record\)~%~@
:SEE-ALSO `media-entity-technique',
`load-sax-parsed-xml-file-to-parsed-class-hash',
`write-sax-parsed-xml-refs-file', `set-parse-ref-slot-value'.~%▶▶▶")))

(make-parsed-class-field-slot-accessor-mapping 
 'parsed-technique-record
 '(("id"                . conrtol-id-entity-num-technique)
   ("display"           . conrtol-id-display-technique)
   ("used_for"          . technique-entity-display-name-coref)
   ("technique_family"  . technique-entity-parent-type)
   ("variation_of"      . technique-entity-type-coref)
   ("notes"             . description-media-entity-technique-note)
   ("default_pic"       . image-default-id)
   ("date_edt"          . edit-date)
   ("date_edit"         . edit-date-origin)
   ("online"            . record-status-active)
   ("user_name"         . edit-by)
   ("naf_creator"       . edit-by-creator)))


;; :NOTE `set-parsed-technique-record-slot-value' is defined in loadtime-bind.lisp
;; (def-set-parsed-class-record-slot-value 
;;     set-parsed-technique-record-slot-value
;;     parsed-technique-record)
;;
;;; *big-parsed-class-field-slot-accessor-mapping-table*

;; :NOTE Depreated use the macro'd version generated with `def-set-parsed-class-record-slot-value' instead.
;; (defun set-parsed-technique-record-slot-value (field-string field-value object)
;;   (values
;;    (string-case:string-case (field-string)
;;      ("id" (setf (conrtol-id-entity-num-technique object) field-value))
;;      ("display" (setf (conrtol-id-display-technique object) field-value))
;;      ("used_for"
;;       (setf (technique-entity-display-name-coref object) field-value))
;;      ("technique_family"
;;       (setf (technique-entity-parent-type object) field-value))
;;      ("variation_of" (setf (technique-entity-type-coref object) field-value))
;;      ("notes"
;;       (setf (description-media-entity-technique-note object) field-value))
;;      ("default_pic" (setf (image-default-id object) field-value))
;;      ("date_edt" (setf (edit-date object) field-value))
;;      ("date_edit" (setf (edit-date-origin object) field-value))
;;      ("online" (setf (record-status-active object) field-value))
;;      ("user_name" (setf (edit-by object) field-value))
;;      ("naf_creator" (setf (edit-by-creator object) field-value)))
;;    object))

                     
#|                   
                     
:SLOT-LIST           
 eql length 12       
                     
 ("id" "display" "used_for" "technique_family" "variation_of"
  "date_edit" "user_name" "naf_creator" "notes" "default_pic" "online" "date_edt")

 <FIELD>              <TRANSFORM>
 "id"                ;; conrtol-id-entity-num-technique
 "display"           ;; conrtol-id-display-technique
 "used_for"          ;; technique-entity-display-name-core
 "technique_family"  ;; technique-entity-parent-type
 "variation_of"      ;; technique-entity-type-coref
 "notes"             ;; description-technique-notes
 "default_pic"       ;; image-default-id
 "date_edt"          ;; edit-date              ;; this is the good one
 "date_edit"         ;; edit-date-origin       ;; IGNORABLE assuming date_edt is present and corresponds
 "online"            ;; record-status-active   ;; IGNORABLE always 0
 "user_name"         ;; edit-by                ;; IGNORABLE always empty  
 "naf_creator"       ;; edit-by-creator        ;; IGNORABLE always empty


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
;;  9
;;
;; -
;;

;;; ==============================
;; :FIELD "display" :TRANSFORM conrtol-id-display-technique
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  Printing Techniques
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
;;  Litho | lithographie
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
;;  Planographic and Process Techniques
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
;;  Lithography
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
