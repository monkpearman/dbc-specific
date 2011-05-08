;;; :FILE-CREATED <Timestamp: #{2011-01-06T13:37:33-05:00Z}#{11014} - by MON>
;;; :FILE ../dbc-classes/dbc-class-refs-convert.lisp
;;; ==============================



(in-package #:dbc)
;; *package*


(defparameter *parsed-ref-field-name-slot-transform* (make-hash-table :test 'equal))

(vardoc '*parsed-ref-field-name-slot-transform*
        "Hashtable of field-name/transform pairs.~%~@
To be populated with `dbc:preprocess-slot-transform' prior to constructing the
slots for the class `parsed-ref'.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

;;; ==============================
(defun make-ref-maker-sym-name (ref-parse-field)
  ;; (make-ref-maker-sym-name "ref") => "REF-PARSED-REF"
  (and (mon:string-not-null-or-empty-p ref-parse-field)
       (make-parsed-class-slot-init-accessor-name "parsed-ref" ref-parse-field)))

;; (caddr (make-ref-maker-sym-name "artist"))
;; (make-parsed-class-slot-init-accessor-name  "parsed-ref" "ref")
;; (nth 0 (make-parsed-class-slot-init-accessor-name "dbc-ref" "keywords_type") "PFX"))
;; (nth 2 (make-parsed-class-slot-init-accessor-name "parsed-ref" "keywords_type"))

(defun make-ref-maker-symbol (sym-name)
  ;; (make-ref-maker-symbol "ref")
  ;; (symbolp (make-ref-maker-symbol "ref"))
  (let ((mk-sym (make-ref-maker-sym-name sym-name)))
    (and mk-sym (read-from-string (nth 2 (make-ref-maker-sym-name sym-name))))))

(defun make-ref-lookup-table (ref-list)
  ;; (make-ref-lookup-table (list "ref" "price" "year" "artist" "condition"))
  (let ((ref-hash (make-hash-table :test 'equal)))
    (loop
       :for ref :in ref-list
       :collecting (cons ref (make-ref-maker-symbol ref)) :into tbl
       :finally (loop
                   :for (key . val) :in tbl
                   :do (setf (gethash key ref-hash) val)))
    ref-hash))


;;; ==============================
(defclass parsed-ref (parsed-class)
  ()
  (:documentation "Class for parsed dbc xml refs."))

;; :initform *parsed-ref-class-name* :allocation 

;; (mon:find-class-name-as-string 'parsed-ref "DBC")
;; "PARSED-REF", PARSED-REF, PARSED-REF, :EXTERNAL
;;; ==============================



;;; ==============================
;; :NOTE Exisiting functions written for cleaning
;; `field-name-underscore-to-dash'
;; `field-string-cons'
;; `field-cln-x'
;; `split-used-fors'
;; `split-appeared-in'
;; `split-roles'
;; `split-loc-pre'
;; `split-lifespan'
;; `split-lifespan-string-int-pairs'
;; `split-comma-field'
;; `field-convert-1-0-x'
;; `format-entity-role'
;; `field-convert-empty-string-nil'
;;; ==============================


;;; ==============================
;; :NOTE Accessor functions should match the REF-<SLOT>-MAKER names of
;; `*xml-refs-match-table*' as generated with `dbc:make-ref-lookup-table'.
;;
;; THIS IS THE LIST OF SLOTS for `*xml-refs-match-list*':
;;
;; (eql (length *xml-refs-match-list*) 72) => t
;;
;; ("ref" "bar_code" "title" "Plate_number" "price" "desc_fr" "desc_en" "condition"
;;  "histo_fr" "histo_en" "categ" "c1" "c2" "c3" "c4" "theme" "keywords" "issue"
;;  "year" "artist" "author" "book" "publisher" "publish_location" "w" "h"
;;  "technique" "paper" "color" "onlinen" "av_repro" "latin_name" "nbre" "online"
;;  "seller" "people" "related_doc" "brand" "translation" "date" "user_name" "done"
;;  "job_name" "locked" "keywords_type" "text_quote" "theme3" "theme2" "c6" "weight"
;;  "c5" "composer" "uri" "year_year" "notes" "volume" "edition" "page" "bct"
;;  "categ_doc" "c1_doc" "c2_doc" "c3_doc" "ebay_final" "ebay_price" "ebay_title"
;;  "ebay_id" "seo_title" "description_seo" "keywords_seo" "date_edit"
;;  "edit_history")


;;; ==============================
;; :TODO `make-parsed-class-slot-init-accessor-name'
;;  - Separete the slot init-arg frobbing into a dedicated function
;;  - change optional arg PREFIX-INITARG-W should be a keyword PREFIX-INIT- W
;;  - add additional keyword SFX-INIT-W
;;  - add additional keyword TRANSFORM (or NORMALIZE ???) when non-nil should
;;    rename from PARSED-FIELD to TRANSFORM
;; - Return value should have teh format:
;;    <SLOT>  <TRANSFORM>  |  (<INIT> {INIT-PFX | INIT-SFX} )  <ACCESSOR>
;;
;; :SEE make-parsed-class-slot-accessor-name etc.
;;
;; --
;;  Current signature is:
;;   (make-parsed-class-slot-init-accessor-name named-class parsed-field &optional prefix-initarg-w)
;;
;; Current return values have the format:
;;  <SLOT>  ( <INIT-PFX> <FIELD-NAME> ) <ACCESSOR>
;;
;; Current return values are:
;;  (make-parsed-class-slot-init-accessor-name "parsed-ref"  "artist"  "p")
;;   => ("ARTIST" "P-ARTIST" "PARSED-REF-ARTIST")
;;
;;  (make-parsed-class-slot-init-accessor-name "parsed-ref" "keywords_type")
;;  => ("KEYWORDS-TYPE" "KEYWORDS-TYPE" "PARSED-REF-KEYWORDS-TYPE")
;;  
;;

;;; ==============================
;;
;;
;; (make-parsed-class-slot-init-accessor-name "parsed-ref" "keywords_type" "init")
;;    <SLOT>  <TRANSFORM>  |  (<INIT> {INIT-PFX | INIT-SFX})  <ACCESSOR>  
;; '(
;;
;;  "ref"              ;; item-number
;;
;;  "title"            ;; description-title
;;  "desc_fr"          ;; description-french     ;; description-class
;;  "desc_en"          ;; description-english    ;; description-class
;;  "histo_fr"         ;; ignorable-history-french
;;  "histo_en"         ;; ignorable-history-english
;;  "text_quote"       ;; description-quote
;;  "translation"      ;; description-translation
;;
;;  "people"           ;; person-entity-coref
;;  "brand"            ;; brand-entity-coref
;;  "composer"         ;; composer-entity-coref
;;  "artist"           ;; artist-entity-coref
;;  "author"           ;; author-entity-coref
;;  "latin_name"       ;; taxon-entity-coref  ;; linnaean-entity-coref???
;;
;;
;;  "book"             ;; "publication-entity-coref"
;;  "publisher"        ;; "publication-publisher"
;;  "publish_location" ;; "publication-location"   ;; For congruence with birth-location death-location
;;  "volume"           ;; "publication-volume"
;;  "edition"          ;; "publication-edition"
;;  "page"             ;; "publication-page"
;;  "Plate_number"     ;; "publication-plate"
;;  "issue"            ;; "publication-issue"
;;
;;  :NOTE `parsed-artist' class has "appeared_in" -> "publication-appeared-in"
;;
;; It isn't totally clear yet that these are neccesarrily publication related fields:
;;  "year"             ;; publication-date        ;; For congruence with birth-date death-date 
;;  "year_year"        ;; publication-date-range  ;;
;;
;;  "categ"            ;; category-0
;;  "c1"               ;; category-1
;;  "c2"               ;; category-2
;;  "c3"               ;; category-3
;;  "c4"               ;; category-4
;;  "c6"               ;; category-6
;;  "c5"               ;; category-5
;;  "bct"              ;; category-precedence-list
;;
;;  "categ_doc"        ;; documentation-category-0
;;  "c1_doc"           ;; documentation-category-1
;;  "c2_doc"           ;; documentation-category-2
;;  "c3_doc"           ;; documentation-category-3
;;
;;  "theme"            ;; theme-0
;;  "theme2"           ;; theme-1
;;  "theme3"           ;; theme-2
;;
;;  "keywords"         ;;
;;
;;  "condition"        ;; description-condition  ;; description-class
;;  "onlinen"          ;; media-mount
;;  "technique"        ;; media-technique
;;  "paper"            ;; media-paper
;;  "color"            ;; media-color
;;  "w"                ;; unit-width
;;  "h"                ;; unit-height
;;  "price"            ;; price-ask
;;                     ;; The "-ask" suffix is for congruence with "price-ebay"
;;                     ;; :NOTE Need price-paid, price-sold,
;;
;;  "nbre"             ;; ignorable-number    ;; probably empty
;;
;;  "seller"           ;; item-seller
;;  "bar_code"         ;; item-bar-code
;;  "weight"           ;; unit-weight
;;  "user_name"        ;; edit-by-creator
;;  "done"             ;; job-complete
;;  "job_name"         ;; job-id
;;  "locked"           ;; job-locked   ;; IGNORABLE
;;  "online"           ;; item-active
;;
;;  "uri"              ;; item-uri

;;  "notes"            ;; ignorable-notes
;;  "keywords_type"    ;; ignorable-keywords-type
;;  "av_repro"         ;; item-can-repro ;; IGNORABLE

;;
;;  "related_doc"      ;; documentation-related
;;
;;
;;  "ebay_final"       ;; price-sold-ebay
;;  "ebay_price"       ;; price-ask-ebay
;;  "ebay_title"       ;; title-ebay
;;  "ebay_id"          ;; id-ebay ??? uuid-ebay
;;  "seo_title"        ;; title-seo
;;  "description_seo"  ;; description-seo
;;  "keywords_seo"     ;; keywords-seo
;;
;;  "date"             ;; edit-date-origin  ;; IGNORABLE assuming date_edit is present and corresponds 
;;  "date_edit"        ;; edit-date
;;  "edit_history      ;; edit-history
;;  ")
;;


;;; ==============================
;;; :TODO methods  

;; `field-convert-1-0-x' 
;; brand, people, latin_name,
;; date, year
;; Plate_number, issue, 
;; title
;; 
;; desc_en, desc_fr, histo_en, histo_en,
;; related_doc, 
;; categ, c1, c2, c3, c4, c5, c6      ;; These may contain "1" to indicate depth. 
;; categ_doc, c1_doc, c2_doc, c3_doc 
;; ebay_id, ebay_price, ebay_final, ;; (maybe the latter are floats)
;; 
;; done, color, job_name
;; 
;; :ARTIST-NAF-FIELDS
;; also_people, also_author 

;;; ==============================
;; 
;; (defun split-ref-multi-naf (naf-multi-ref)
;; 
;; split on "&"
;; :REF-FIELDS artist, author, people, brand, 


;;; ==============================
;; :FIELD "ref" :TRANSFORM item-number
;;
;;         :TYPE "mediumint(8) unsigned"
;;         :NULL-P "NO"
;;         :KEY "PRI"
;;         :EXTRA "auto_increment"
;;
;; :EXAMPLE-VALUES 
;;  2767
;;  12000
;;
;; - This should be a UUID

;;; ==============================
;; :FIELD "price" :TRANSFORM "price-ask"
;;
;;         :TYPE "int(10)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  150
;;
;; :NOTE The "-ask" suffix is for congruence with "price-ebay"
;; :TODO Need "price-paid", "price-sold"
;; This would imply that price is a class e.g. "price-class" 

;; (defclass price-class (base-dbc)
;; (price-paid :initarg :price-paid 


;;; ==============================
;;; TEXT-DESCRIPTORS
;;; ==============================

;;; ==============================
;; :FIELD "title" :TRANSFORM description-title :CLASS description-class
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Translation"
;;  "Eve.- Voyons, Adam..."
;;  "A Sa Toilette..."
;;  " Whinchat"
;; " Hermés Accessories"
;;  "x"
;;
;; - What to do about "Translation"? 
;;   Used to indicate that the field needs a translation but that it may be missing.
;;
;; - How often were these used to hold translation data, b/c they weren't always
;;  
;; - `mon:string-trim-whitespace' these. 
;;
;; - `field-convert-1-0-x' 
;; 

;;; ==============================
;; :FIELD "desc_fr" :TRANSFORM description-english  :CLASS description-class
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Couverture couleur illustrée"
;;  "x"
;;  "0"
;;
;;   Use `field-convert-1-0-x'

;;; ==============================
;; :FIELD "desc_en" :TRANSFORM description-french  :CLASS description-class
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; "An original ad, featuring all the varying models tested in early aviation,
;;  including the Wright Brothers plane, it is more than 95 years old."
;; 
;; "Cover Page From Le Sourire. rare!"
;;
;; "&lt;br&gt;&lt;br&gt"
;;
;; "&quot;The Arabians called it the 'Column of Columns'... 88 ft tall and 8 ft
;; in Diameter...&quot; it was located in Alexandria Egypt. Vol VI No. 39."
;;
;; - Note, above wrapped for clarity.
;;
;; - Remove all occurences of "rare!"
;;
;; - Remove "&lt;br&gt"
;; - Remove "&quot;"

;;; ==============================
;; :FIELD "translation" :TRANSFORM description-translation
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "0" "1"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Looks like this might be a boolean 

;;; ==============================
;; :FIELD "related_doc" :TRANSFORM documentation-related
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'


;;; ==============================
;; :FIELD "histo_fr" :TRANSFORM ignorable-history-french
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "x"
;;  histo_fr
;; (search-forward-regexp "<field name=\"histo_fr\">[[:graph:]]+<" nil t)
;;
;; - Strip "x"
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'

;; (search-forward-regexp "histo_fr\">[^<0x].*<" nil t)

;; 90796533

;;; ==============================
;; :FIELD "histo_en" :TRANSFORM ignorable-history-english
;;                              
;;         :TYPE "mediumint(9)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;
;; (search-forward-regexp "<field name=\"histo_en\">[[:graph:]]+<" nil t)
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'

;;; ==============================
;; :FIELD "text_quote" :TRANSFORM description-quote
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "text_quote"
;;  "4617 "
;; - May contain "text_quote", remove/ignore it.
;;
;; - Is this is actually used? Yes,  see ref 4617

;;; ==============================
;; :FIELD "notes" :TRANSFORM 
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "è %EF%BF%BD - Crèches (Nativity scenes)" 
;; "Générale_et_Particulière<"
;;
;; - Is this used? Yes, twice see `ref` 3126, 424
;; 
;; (search-forward-regexp "notes\">[^<0].*<" nil t)

;;; ==============================
;;; DATE-VOLUME-ISSUE
;;; ==============================

;;; ==============================
;; :FIELD "Plate_number" :TRANSFORM publication-plate
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "x"
;;  "51"
;;  " 35"
;;  " 13"
;;
;; - Strip "x" 
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;; :NOTE stripping X may not be possible if this is "PLATE X" the Roman numeral!
;;
;; - `mon:string-trim-whitespace'

;;; ==============================
;; :FIELD "volume" :TRANSFORM publication-volume
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

;;; ==============================
;; :FIELD "edition" :TRANSFORM publication-edition
;;
;;         :TYPE "varchar(45)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "First Octavo"
;;

;;; ==============================
;; :FIELD "issue" :TRANSFORM publication-issue
;;
;;         :TYPE "varchar(5)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "9999"
;;  "280"
;;  "20"
;;  "0"
;;
;; - Strip "9999"
;; - Use `field-convert-1-0-x'

;;; ==============================
;; :FIELD "page" :TRANSFORM publication-page
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

;;; ==============================
;; :FIELD "date" :TRANSFORM edit-date-origin
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "date" 
;;  "0"
;;
;; - Following appears to be the _original_ edit-date field. 
;;    AFAICT all occurences are circa 2004 e.g.
;;   occurence for entire file:
;;   "20040811125434" 
;;
;; This field is ignorable assuming value of "date_edit" is present and corresponds.
;;
;; (search-forward-regexp "date\">[^<0].*<" nil t)
;; 
;; - May contain "date" remove/ignore it.
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'


;;; ==============================
;; :FIELD "year_year" :TRANSFORM publication-date-range
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;  "1828"
;;  "1755 - 1787"  :SEE `ref` 7476
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;

;;; ==============================
;; :FIELD "year" :TRANSFORM publication-date-year
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "December, 19, 1896"
;;  "December , 10 , 1910"
;;  "January , 6 , 1900"
;;  "October, 4, 1930"
;;  "0 , 0 , 1820"
;;  "0 , 0 , 1900"
;;  "0 , 0 , 1896"
;;  "1832-1837"               ;; Should this have been in year_year? See `ref` 8652
;;  "1749-1783"               ;; ref 427 has year_year as 1749
;;  "1837-1839"               ;; ref 399,400 year_year as 1837
;;  "1717 - 1725"             ;; ref 9311 year is 1717 ;; replaced 20 times
;;  "0"
;;  "December, ,1946"
;;  ",,1810"                 ;; 7496 
;;
;; - And/or maybe `string-split-on-chars' 
;; 
;; (remove-if #'(lambda (x) (eql (length x) 0)) 
;;	      (mon::string-split-on-chars "December , 10 , 1910" " ,"))
;;
;; - Frob with `local-time'?
;;
;; - Use `field-convert-1-0-x'
;;
;; (search-forward-regexp "year\">[[:digit:]]\\{4,4\\}-[[:digit:]]\\{4,4\\}<" nil t)
;; (search-forward-regexp "ref\">[[:digit:]]\\{4,4\\}<" nil t)


;;; ==============================
;;; NAF-RELATED
;;; ==============================

;;; ==============================
;; :FIELD "artist" :TRANSFORM artist-entity-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "Audubon (John James) &amp; Audubon (John Woodhouse) &amp; Havell (Robert, Jr.)"
;; "Steinlen (Theophile Alexandre)"
;; " Mourgue (Pierre)"
;;
;; - split on "&"
;;
;; - Use `mon:string-trim-whitespace'


;;; ==============================
;; :FIELD "author" :TRANSFORM  author-entity-coref
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "MacGillivray (William) &amp; Audubon (John James)"
;; "Puech (Lucien)"
;;
;; - split on "&"
;;
;; - This field will have a class-instance if it is non-nil

;;; ==============================
;; :FIELD "book" :TRANSFORM  publication-entity-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Gil Blas Illustre"
;;  "Unknown"
;;
;; - This will field will have a class-instance if it is non-nil
;; 

;;; ==============================
;; :FIELD "composer" :TRANSFORM composer-entity-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; <field name="composer" xsi:nil="true" />
;;
;; (count-matches "field name=\"composer\" xsi:nil=\"true\"") => 727
;; 
;;; ==============================
;; :FIELD "brand" :TRANSFORM brand-entity-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "x"
;;  "Maxim\'s"
;;  "Fly-Tox"
;;
;; - Strip "x" 
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - This field will have a class-instance if it is non-nil

;;; ==============================
;; :FIELD "people" :TRANSFORM person-entity-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "x"
;; 
;; - Strip "x"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - This field will have a class-instance if it is non-nil


;;; ==============================
;;; NAF-ENTITIES-W/OUT-UUID
;;; ==============================

;;; ==============================
;; :FIELD "publisher" :TRANSFORM publication-publisher
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; " Wallace"
;; "John T. Bowen,  J.J. Audubon, and  J.B. Chevalier"
;; "x"
;;
;; - Use `field-convert-1-0-x'
;; - Use `mon:string-trim-whitespace'
;;
;; (field-convert-1-0-x (mon:string-trim-whitespace "x"))

;;; ==============================
;; :FIELD "publish_location" :TRANSFORM location-published
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  " Weimar"
;;  " London" 
;;  " France"
;;  "Paris, 15 Rue de la Parcheminerie"
;;  "34 North Front Street, Philadelphia and 77 William Street, New York"
;; 
;; - `mon:string-trim-whitespace' these.


;;; ==============================
;; :FIELD "latin_name" :TRANSFORM taxon-entity-coref
;;
;;         :TYPE "varchar(192)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "Passerina ciris (Linnaeus, 1758) | Fringilla Emberiza (Ciris)"
;; "Cathartes Atratus | Cathartes Aura (Linnaeus)"
;; "Tachycineta Thalassina (Swainson) | Hirundo Malassinus | Tachycineta thalassina"
;; "Asclepias tuberosa | Spizella pallida (Swainson, 1832) | Emberiza pallida (Swainson &amp; Richardson)"
;;
;;  "x"
;;
;; - Split on "|"
;;
;; - Strip "x"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'


;;; ==============================
;;; THEME-RELATED
;;; ==============================

;; The themes should be dedicated class instances.

;;; ==============================
;; :FIELD "theme" :TRANSFORM theme-0
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Artists' models"
;;  "Eating &amp; drinking"        -> "Eating and drinking"
;;  "Patterns (Design elements)"
;;
;; - Replace "&amp;" -> "and"

;;; ==============================
;; :FIELD "theme2" :TRANSFORM theme-1
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Portraits"
;;
;; <field name="theme2" xsi:nil="true" />
;; (count-matches "<field name=\"theme2\" xsi:nil=\"true\" />") => 353
;; 
;; - Replace "&amp;" -> "and"

;;; ==============================
;; :FIELD "theme3" :TRANSFORM theme-2
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Walking"
;;  "Relations between the sexes"
;;
;; <field name="theme3" xsi:nil="true" />
;; (count-matches "<field name=\"theme3\" xsi:nil=\"true\" />") => 347
;;
;; - Replace "&amp;" -> "and"


;;; ==============================
;;; CONDITION-DESCRIPTORS
;;; ==============================

;;; ==============================
;; :FIELD "technique" :TRANSFORM media-technique
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "Stone Lithograph"
;;
;; - This field has a naf UUID and is (at least currently) a relatively small set.
;;

;;; ==============================
;; :FIELD "paper" :TRANSFORM media-paper
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Antique Wove Paper"
;;  "Machine pressed" 
;;
;; - This field has a naf UUID and is (at least currently) a relatively small set.
;;

;;; ==============================
;; :FIELD "condition" :TRANSFORM description-condition
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "[8] Archival Conservation and Mounted on Linen. light age staining."
;;  "[9] "
;;  " [9]"
;;  "[8]"
;;  "[9 ] Strong print and plate marks. Beautiful hand coloring"
;;  "[4 ] moderate age staining in top margin, light age staining in other margins."
;;  "[6] very light age toning in margins."
;;  "[5] very light age staining."
;;  "[6]  light age toning."
;;  "[8]  Very light offsetting."
;;  "(8.5) Light age toning, stronger at edges. Light crease damage. Please see Zoom In for details."
;;  "[8+] One small fox mark shown in image. Strong print marks and beaitiful handcoloring."
;;  "[8+] Professional archival conservation. Very light offsetting. [Typical]."
;;  "[8+]  Very light offsetting."
;;  "[7 ] Light age toning. Very light offsetting."
;; "[9]Age toning, Strong plate mark. Please see Zoom In for details."
;;
;;
;;
;;
;; - Separate out the `[<N>]` values when present.
;;
;; - Convert "[<N>+]" to "N.5"
;;
;; -- Split the string on whitespace, Should capitalize first word, and concatenate the result
;; 
;; -- Return (8 . "Condition String here")
;; 
;; - But, really these should be a separated into dedicated slots:
;;   :condition-value <N>
;;   :condition-desc "<STRING>"
;;
;; - Moreso, it should instead be a class that way we can add alternate condition representations, i.e.:
;;   :damage
;;   :damage-location
;;   :damage-description
;;   :damage-type
;;
;; - string-left-trim
;;
;; - remove trailing period 
;; (string-right-trim "#\." <FIELD>)
;;

;;; ==============================
;; :FIELD "w" :TRANSFORM unit-width
;;
;;         :TYPE "float unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  9  
;;  6.5
;;
;; - This is the width field 
;;
;; - Use `mon:number-to-string' or `parse-integer'

;;; ==============================
;; :FIELD "h" :TRANSFORM unit-height
;;
;;         :TYPE "float unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  12 
;;  13.75
;;
;; - This is the "height" field 
;;
;; - Use `mon:number-to-string' or `parse-integer'

;;; ==============================
;; :FIELD "color"  :TRANSFORM media-color
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
;; :NOTE This has never really been correct. The value is ternary not binary.
;; In the current binary configuration the following 
;; TRUE indicates a non greyscale image.
;; FALSE indicates a greyscale or monochromatic image.
;; Better, would be to indicate as follows:
;; - polychromatic-multi  -- a polychromatic multi-colored imaged
;; - polychromatic-grey   -- a polychromatic grayscale (greyscale) image
;; - monochromatic-binary -- a binary image black and white
;; These would map as:
;;  0 - black and white
;;  1 - greyscale
;;  2 - color 

;;; ==============================
;; :FIELD "onlinen" :TRANSFORM media-mount
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;   1 | 0 
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;

;;; ==============================
;; :FIELD "weight" :TRANSFORM unit-weight
;;
;;         :TYPE "tinyint(4)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "1" 
;;  "0"
;;
;; - These integers are 
;; - Convert these values to somthing more meaningful?



;;; ==============================
;; CATEG-RELATED 
;;; ==============================

;;; ==============================
;; :FIELD "bct" :TRANSFORM category-precedence-list
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0
;;  "bct" <-- WTF! 
;; "Sports Mem, Cards &amp; Fan Shop &gt; Cards &gt; Baseball-MLB &gt; Rookies (Pre-1950)"
;; 
;; - Replace the 0 default with NIL
;;
;; - Not sure how much this was used. It is effectively a class-precedence list.
;;
;; - (search-forward-regexp "bct\">[^<0].*<" nil t)


;;; ==============================
;; :FIELD "categ" :TRANSFORM category-0
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Books and Publications"
;;  "0"
;;
;; - It is never the case that the `categ` field is empty.
;;   e.g. there are no matches for the following search:
;;    (search-forward-regexp "<field name=\"categ\"></field>" nil t)
;; 
;; - These are effectively classes and should be treated as such. By creating an
;;   instance of the deepest most categ we will automatically inherit from the
;;   class precedence heirarchy. And, we can then get multiple-inheritance!
;;
;; - In the sub-categs it appears that "1" is used to to indicate max depth. 
;;   BUT there are Le Rire issues that use the item number for the "c6" see for
;;   example the ~4600 range of items e.g. 4607
;;    - When such occurs the following fields  all refer to the item number:
;;       `job_name` `keywords_type` `text_quote` and `c6` (sometimes)
;;    Additionally, the `locked` and `done` fields have the value 127
;;
;; (search-forward-regexp "<field name=\"categ\"></field>" nil t)

;;    Additionally, the `locked` and `done` fields have the value 127


;;; ==============================
;; :FIELD "c1" :TRANSFORM :TRANSFORM category-1
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

;;; ==============================
;; :FIELD "c2" :TRANSFORM category-2
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

;;; ==============================
;; :FIELD "c3" :TRANSFORM category-3
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

;;; ==============================
;; :FIELD "c4" :TRANSFORM category-4
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

;;; ==============================
;; :FIELD "c5" :TRANSFORM category-5
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

;;; ==============================
;; :FIELD "c6" :TRANSFORM category-6
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  1
;;  4622
;; - The "1" value _may_ be used to indicate depth in the class tree 

;;; ==============================
;; :FIELD "categ_doc" :TRANSFORM documentation-category-0
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Is this ever used? Yep once, see ref 8941
;;
;; - (search-forward-regexp "categ_doc\">[^<0].*<" nil t)

;;; ==============================
;; :FIELD "c1_doc" :TRANSFORM documentation-category-1
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Is this ever used? No.

;;; ==============================
;; :FIELD "c2_doc" :TRANSFORM documentation-category-2
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "1040"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Is this ever used? Yes, at least once :SEE `ref` 8942


;;; ==============================
;; :FIELD "c3_doc" :TRANSFORM documentation-category-3
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Is this ever used? NO


 
;;; ==============================
;;; METADATA-AND-SEO
;;; ==============================

;;; ==============================
;; :FIELD "uri" :TRANSFORM item-uri
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Journals_and_Publications_Guillaume_Le_Rire_Clothing___dress_Money_image-3219.htm"
;;  "Journals-and-Publications_No-Signature_La-Vie-Au-Grand-Air_Airships_Airplanes-print-10566.htm"
;;  "Modern__(1890_-_1945)_No_Signature_Nouveautes_Papiers_Peints_Wallpapers_Interior_decoration_image-11834.htm"
;;
;; - Clean up the `___` underscores, generally these are `_&_` and shoud prob. be converted to `_and_`
;;
;; - Remove occurences of "_No-Signature_", "Unknown", "No_Signature" 
;;
;; - Remove the ".htm" extension we can always add it back in as needed.
;;

;;; ==============================
;; :FIELD "seo_title" :TRANSFORM title-seo
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "  -  Guillaume (Albert), Original Print -March, 9, 1907 - GUILLAUME  FROM LE RIRE"
;;
;;  "An Original early ad for Continental tires. Featuring models of early
;;   airplanes - La Vie au Grand Air Noel December 10, 1910 | DerbyCityPrints.com"
;;
;;  "Alken (Henry), Original Print - ,,1820 - ALKEN  FROM SPORTING SCRAP BOOK"
;;  "Alken (Henry), Original Print -September, 1, 1821 - ALKEN  FROM"
;;
;;  "x, Original Print -January , 18 , 1908 - X FROM LE SOURIRE"
;;
;; "Huard (Charles), Original Print - - HUARD  FROM LE SOURIRE"
;;
;; "  -  No Signature &amp; , Original Print -1929 - 1930 -  FROM NOUVEAUTES PAPIERS PEINTS"
;;
;; "Alfredo Bouret - Original Boucheron Advert - linen backed Print - circa 1952
;;  - FROM PLAISIR DE FRANCE"
;;
;; "  -  , Original Print -0 -  FROM"
;;
;; - Note, above wrapped for clarity.
;;
;; - Fix dates with "-<DATE>" e.g. "-February , 2 , 1901"
;;   Maybe these can be inferred and/or extracted? 
;;
;; - Remove superfluous whitespace 
;;
;; - Fix this shit: "- ,,"
;;
;; - Remove leading " - "
;;
;; - Replace " - - " -> " - "
;;
;; - Replace " Original Print -<MONTH>" ->  "Original Print - <MONTH>"
;;
;; - Remove "x,"
;;
;; - Remove "&amp;"
;;
;; - What to do about trailing "| DerbyCityPrints.com"?
;; 
;; - These can probably be safely `string-lef-trimmed'
;;
;; - What fucking mess... 

;;; ==============================
;; :FIELD "description_seo" :TRANSFORM description-seo :CLASS description-class
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "air, plane, airplane, Biplane, aircraft, expo, center, blimp, dirigible,"
;;
;; - `split-comma-field' works so long as we can be sure that there are
;;   never free commas as used as an SEO descriptor:
;;
;;  (split-comma-field
;;   "air, plane, airplane, Biplane,, aircraft, expo, center, blimp, dirigible,")


;;; ==============================
;; :FIELD "keywords" :TRANSFORM 
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY "MUL"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; "Books and Publications, Journals and Publications, French, Airships, Petit
;;  Journal pour Rire, Air shows, , Airplanes, , La Vie Au Grand Air Revue
;;  illustrée de tous les sports | Le Sport Photographique | Le Sport
;;  Photographie | Le Sport Francais | Les Sports a L'Exposition | Tres Sport |
;;  La Vie a La Campagne, Anonymous | Unknown | Unsigned |, Rubber | Tires |
;;  Automobile Parts | Brake systems | Automotive safety and communications
;;  systems, , , No Signature"
;;
;; "Natural History Ornithology Audubon Birds of America 1st Royal 8vo Edition
;;  Red-Headed Turkey Vulture Audubon (John James) &amp; Audubon (John Woodhouse)
;;  &amp; Havell (Robert, Jr.) MacGillivray (William) &amp; Audubon (John James)
;;  Birds of America - Royal Octavo Vultures Birds Turkey 1840 Cathartes Atratus |
;;  Cathartes Aura (Linnaeus) John T. Bowen, J.J. Audubon, and J.B. Chevalier"
;;
;; "Natural History Ornithology Bree Birds of Europe 2nd Edition x Red Breasted
;;  Flycatcher Fawcett (Benjamin) Bree (Charles Robert) x History of The Birds of
;;  Europe, Not Observed In The British Isles.  Birds 1875 x George Bell and
;;  Sons"
;;
;; "Natural History Ornithology Gould Birds of Europe 1st Edition x Tree Pipit Gould
;;  (John) &amp; Gould (Elizabeth) Gould (John) x Birds of Europe Birds Scientific
;;  illustrations Tree limbs 1832 1833 1834 1835 1836 1837 Anthus Arboreus R. and
;;  J.E. Taylor"
;;
;; "1 1 1 1 1 x Parfums Lanvin Aljanvic x Lanvin x Natural History Street
;; vendors Flowers Sidewalks 1948 x x"
;;
;; - Note, above examples wrapped for clarity, should genrally appears as one longline.
;;
;; - May contain  chars e.g. #\Return  and #\Tab these are effectively delimiters
;;
;; - Split on chars: "|" "," #\Tab #\Return #\&
;;
;; - Split on words: "Unknown", "Unsigned", "No Signature", "Anonymous" "Translation" "&amp;"
;;
;; - Maybe can split on years "<YYYY>" - If so we should replace with "circa <YYYY>"
;;
;; - Replace occurencs of: " - Pseudonym" -> " (pseudonym)" 
;;   Or, maybe try to catch all of them:  "Pseudonym" -> "(pseudonym)"
;;
;; - But, we shoud/could also use " x " as a delimiter b/c  it must be.
;;
;; - Remove duplicates 
;;    (remove-duplicates <SEQ> :test #'string-equal) 
;;
;; - Remove dups should catch all but the last:  " x "
;;
;; - Remove occurences of "x" "1" "0" "..." "---" 
;;   Note, we can't always safely remove "1" (and possibly also "0") where the
;;   string contains "free" date strings formatted as: "December, 1, 1894"
;;   b/c, where this was previously split on commas we might potentially have subseqs of
;;   a list which contains: (... "December" "1" "1894" ...) and the "1" in this position is 
;;   contextually relevant information which should not be elided. 
;;   Possible solutions, query the existing 
;;   
;;
;;   (defun dbc-remove-unwanted-strings (string-bag seq)
;;    delete-if #'(lambda (x)
;;
;; - This sucks because some don't have delimiters in them as they were constructed programatically. 
;;   The best we might be able to do is to split on "|" as even NAF names may have commas in them.
;;  
;;; 

;;; ==============================
;; :FIELD "keywords_type" :TRANSFORM 
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "keywords_type"
;; "4603"
;; - May contain "keywords_type", remove/ignore it.
;; 
;; - Was this actually used? Nope.
;;
;; (search-forward-regexp "keywords_type\">[^<0].*<" nil t)

;;; ==============================
;; :FIELD "keywords_seo" :TRANSFORM 
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "Catulle Mendes, Caricature, Top Hats, Overcoats, bugeyes, facial hair, Smile, portrait, Likeness,"
;; "Hummingbird, twig, branch, tail,yellow, gold, feathers, dove grey, green, throat, beak,"
;; 
;; (split-comma-field  (string-right-trim "," <FIELD>))
;; 
;; (search-forward-regexp "keywords_seo\">[^<0].*<" nil t)
;;
;; may be empty.                                        


;;; ==============================
;;; EBAY-RELATED
;;; ==============================
;;; :NOTE The ebay stuff Should be subclassed. It was never used but does have utility.

;;; ==============================
;; :FIELD "ebay_final" :TRANSFORM 
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Should maybe be a float as like 'ebay_price" but not used anyways... (floatp 0) => nil

;;; ==============================
;; :FIELD "ebay_price" :TRANSFORM 
;;
;;         :TYPE "float unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;; 
;; - Shold we convert these 0 values to 0.0, e.g:
;;   (floatp 0.0) => T
;;   (floatp 0) => nil
;;

;;; ==============================
;; :FIELD "ebay_title" :TRANSFORM 
;;
;;         :TYPE "varchar(55)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;

;;; ==============================
;; :FIELD "ebay_id" :TRANSFORM "id-ebay"
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "ebay_id"
;; "140115400523" ;; one occurence
;;
;; (search-backward-regexp "ebay_id\">[^<0].*<" nil t)
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'


;;; ==============================
;;; STATUS-RELATED
;;; ==============================


;;; ==============================
;; :FIELD "nbre" :TRANSFORM ignorable-number
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; (search-forward-regexp "<field name=\"nbre\">\\(^0\\)</field>")
;;
;; - This doesn't appear to ever have been used


;;; ==============================
;; :FIELD "online" :TRANSFORM item-active
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0 | 1 | 2 | 3
;;
;;  - These values correspond to:
;;
;;    not-online, sold, duplicate, and online
;;   
;;   Unofortunately I'm having trouble remember which is which
;;
;; - `online` and `onlinen` are far to similiarly named


;;; ==============================
;; :FIELD "bar_code" :TRANSFORM item-bar-code
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "x"
;;  "bar_code"
;;  "Bree2nd-117"
;;  "AudBirds-006"
;;
;; - May contain "bar_code" remove/ignore it
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'


;;; ==============================
;; :FIELD "user_name" :TRANSFORM edit-by-creator
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  constance
;;

;;; ==============================
;; :FIELD "done" :TRANSFORM job-done
;;
;;         :TYPE "tinyint(4)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  1
;;  127
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Verify that this is always 1 | 0. Its not see ref 4603 with value 127 and corresponding locked value 127
;; (search-forward-regexp "name=\"done\">127</field>" nil t)
;; (search-forward-regexp "name=\"locked\">127</field>" nil t)


;;; ==============================
;; :FIELD "job_name" :TRANSFORM job-id
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "laura_lerire"
;;  "job_name"
;;  "Bree2nd"
;;  "CuvierBrd318-386"
;;  "0"
;;
;; - May contain "job_name", remove/ignore it.
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'

;;; ==============================
;; :FIELD "date_edit" :TRANSFORM edit-date 
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "CURRENT_TIMESTAMP"
;;         :EXTRA "on update CURRENT_TIMESTAMP"
;;
;; :EXAMPLE-VALUES 
;;  "2004-08-11 15:50:25"
;;  "0000-00-00 00:00:00"
;;  "0000-00-00 00:00:00"
;;  "2009-01-27 22:00:31"
;; 
;; - Use local-time
;;
;; - Convert "0000-00-00 00:00:00" to nil
;;
;; - :SEE edit_history below
;; (string= "0000-00-00 00:00:00")


;;; ==============================
;; :FIELD "edit_history" :TRANSFORM edit-history
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "constance-January 27, 2009|constance-January 27, 2009|"
;;
;;  - split on "|" 
;;    - then split on "-" 
;;    -- ?(look for user name occurences and capitalize/normalize)?
;;    --- then parse the date
;;    ---- if (>= (length <VAL>) 2)
;;         Check for multiple occurences and reduce on the count field
;;
;;    * In the last branch, the idea is that often we make multiple edits on a
;;      single day, rather than record each edit it would be better to just
;;      count the times an edit occured.
;;
;;  Return values should have the form:
;;
;; (unwritten-date-edit-fun "constance-January 27, 2009|constance-January 27, 2009|")
;; => ((:DATE (2009 01 27) :USER "constance" :COUNT 2)
;;
;; (unwritten-date-edit-fun "stan-May 6, 2008|constance-April 27, 2009|constance-April 27, 2009|stan-March-4-2010")
;; => ((:DATE (2008 05 06) :USER "stan" :COUNT 1)
;;     (:DATE (2009 04 27) :USER "constance" :COUNT 2)
;;     (:DATE (2010 03 04) :USER "stan" :COUNT 1))
;;
;;  Which is the better format `:DATE` key/val pair at head or `:USER key/val pair?
;;
;;  Or, maybe it would be better to store these as instances on the edit_history
;;  slot with instance having the above ref'd key/val pairs? Going forward, this
;;  would allow attaching additional data w/re what was edited e.g. we could
;;  present diffs for those slots we wished to track...
;;
;;  Also, in some cases where we have the "date_edit" field we should be able to
;;  xref the most recent edit with the most recent entry on the "edit_history"
;;  string. Should we provide more details w/re the timestamp for :COUNT e.g.: 
;;    (:count 1 (2009-01-27-22:00:31))
;;    (:count 2 (2009-01-27-22:00:31 2010-03-27-21:00:31))


;;; ==============================
;;; POTENTIALLY-IGNORABLE
;;; ==============================

;;; ==============================
;; :FIELD "locked" :TRANSFORM job-locked
;;
;;         :TYPE "tinyint(4)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "0"
;;
;; - This field can prob. be ignored.
;;
;; - use `field-convert-1-0-x'

;;; ==============================
;; :FIELD "av_repro" :TRANSFORM item-can-repro
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
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;; 
;; - Pretty sure this was _never_ used. 
;;
;; - Can effictively be ignored.

;;; ==============================
;; :FIELD "seller" :TRANSFORM item-seller
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "lapp"
;;
;; - This never had any utility. But it could if we considered it as consigments or some such.



;;; ==============================
;; :REFS-INFOS
;;
;; :NOTE Use `mon-dbc-xml-parse-clean-fields' to clean these fields
;; :FILEdbc-specific/notes-versioned/dbc-xml-parse-notes/xml-table-fields-parse-regexps-2011-01-06

;; <table_structure name="refs">
;; <field Field="ref" Type="mediumint(8) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
;; <field Field="bar_code" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="title" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="Plate_number" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="price" Type="int(10)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="desc_fr" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="desc_en" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="condition" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="histo_fr" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="histo_en" Type="mediumint(9)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="categ" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c1" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c2" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c3" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c4" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="theme" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="keywords" Type="text" Null="NO" Key="MUL" Extra="" />
;; <field Field="issue" Type="varchar(5)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="year" Type="varchar(100)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="artist" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="author" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="book" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="publisher" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="publish_location" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="w" Type="float unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="h" Type="float unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="technique" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="paper" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="color" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="onlinen" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="av_repro" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="latin_name" Type="varchar(192)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="nbre" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="online" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="seller" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="people" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="related_doc" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="brand" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="translation" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="date" Type="varchar(100)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="user_name" Type="varchar(100)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="done" Type="tinyint(4)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="job_name" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="locked" Type="tinyint(4)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="keywords_type" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="text_quote" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="theme3" Type="varchar(255)" Null="YES" Key="" Extra="" />
;; <field Field="theme2" Type="varchar(255)" Null="YES" Key="" Extra="" />
;; <field Field="c6" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="weight" Type="tinyint(4)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c5" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="composer" Type="varchar(255)" Null="YES" Key="" Extra="" />
;; <field Field="uri" Type="varchar(255)" Null="YES" Key="" Default="0" Extra="" />
;; <field Field="year_year" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="notes" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="volume" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="edition" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="page" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bct" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="categ_doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c1_doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c2_doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c3_doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="ebay_final" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="ebay_price" Type="float unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="ebay_title" Type="varchar(55)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ebay_id" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="seo_title" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="description_seo" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="keywords_seo" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="date_edit" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />
;; <field Field="edit_history" Type="text" Null="NO" Key="" Extra="" />

;; <key Table="refs" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="ref" Collation="A" Cardinality="8969" Null="" Index_type="BTREE" Comment="" />

;; <key Table="refs" Non_unique="1" Key_name="keywords" Seq_in_index="1" Column_name="keywords" Cardinality="1" Null="" Index_type="FULLTEXT" Comment="" />

;; <options Name="refs" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="8969" Avg_row_length="939" Data_length="8427580" Max_data_length="281474976710655" Index_length="2570240" Data_free="0" Auto_increment="12418" Create_time="2009-12-08 00:23:22" Update_time="2009-12-08 00:23:23" Check_time="2009-12-08 00:23:24" Collation="latin1_swedish_ci" Create_options="" Comment="" />

;; </table_structure>
;; <table_data name="refs">
;;; ==============================

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
