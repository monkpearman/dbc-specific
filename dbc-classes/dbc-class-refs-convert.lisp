;;; :FILE-CREATED <Timestamp: #{2011-01-06T13:37:33-05:00Z}#{11014} - by MON>
;;; :FILE ../dbc-classes/dbc-class-refs-convert.lisp
;;; ==============================



(in-package #:dbc)

(defclass parsed-ref (parsed-class)   
  ()
  (:documentation "class for parsed dbc xml refs."))


;; :NOTE Accessor functions should match the REF-<SLOT>-MAKER names of
;; `*xml-refs-match-table*' as generated with `dbc:make-ref-lookup-table'.
;;
;; THIS IS THE LIST OF SLOTS for `*xml-refs-match-list*'
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

;; 


;;; ==============================
;;; :TODO methods  

;; `dbc-convert-1-0-x-field' 
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
;; (defun dbc-split-ref-multi-naf (naf-multi-ref)
;; 
;; split on "&"
;; :REF-FIELDS artist, author, people, brand, 


;;; ==============================
;; :FIELD "ref"
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
;; :FIELD "price"
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



;;; ==============================
;;; TEXT-DESCRIPTORS
;;; ==============================

;;; ==============================
;; :FIELD "title"
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
;;  "x"
;;
;; - What to do about "Translation"? 
;;   Used to indicate that the field needs a translation but that it may be missing.
;;
;; - How often were these used to hold translation data, b/c they weren't always
;;  
;; - `mon:string-trim-whitespace' these. 

;;; ==============================
;; :FIELD "desc_fr"
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Couverture couleur illustrée"
;;  "x"
;;
;; - Strip "x"
;
;; - Replace the 0 default with T/NIL
;;   Use `dbc-convert-1-0-x-field'

;;; ==============================
;; :FIELD "desc_en"
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
;; - Note, above wrapped for clarity.
;;
;; - Remove all occurences of "rare!"


;;; ==============================
;; :FIELD "translation"
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
;;   Use `dbc-convert-1-0-x-field'
;;
;; - Looks like this might be a boolean 

;;; ==============================
;; :FIELD "related_doc"
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
;;   Use `dbc-convert-1-0-x-field'


;;; ==============================
;; :FIELD "histo_fr"
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "x"
;;
;; - Strip "x"
;; - Replace the 0 default with T/NIL
;;   Use `dbc-convert-1-0-x-field'

;;; ==============================
;; :FIELD "histo_en"
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
;; - Replace the 0 default with T/NIL
;;   Use `dbc-convert-1-0-x-field'

;;; ==============================
;; :FIELD "text_quote"
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "text_quote"
;;
;; - May contain "text_quote", remove/ignor it.
;;
;; - Is this is actually used?

;;; ==============================
;; :FIELD "notes"
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; - Is this used?


;;; ==============================
;;; DATE-VOLUME-ISSUE
;;; ==============================

;;; ==============================
;; :FIELD "Plate_number"
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "x"
;;
;; - Strip "x"
;; - Replace the 0 default with T/NIL
;;   Use `dbc-convert-1-0-x-field'

;;; ==============================
;; :FIELD "volume"
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
;; :FIELD "edition"
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
;; :FIELD "issue"
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
;;
;; - Strip "9999"

;;; ==============================
;; :FIELD "page"
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
;; :FIELD "date"
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "date" 
;;   "0"
;;
;; - May contain "date" remove/ignore it.
;;
;; - Replace the 0 default with T/NIL
;;   Use `dbc-convert-1-0-x-field'


;;; ==============================
;; :FIELD "year_year"
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
;; "1755 - 1787"  :SEE `ref` 7476
;;
;; - Replace the 0 default with T/NIL
;;   Use `dbc-convert-1-0-x-field'
;;

;;; ==============================
;; :FIELD "year"
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
;;  "1832-1837"              ;; Should this have been in year_year? See `ref` 8652
;;  "0"
;;  "December, ,1946"
;;
;; - And/or maybe `string-split-on-chars' 
;; 
;; (remove-if #'(lambda (x) (eql (length x) 0)) 
;;	      (mon::string-split-on-chars "December , 10 , 1910" " ,"))
;;
;; - Frob with `local-time'?




;;; ==============================
;;; NAF-RELATED
;;; ==============================

;;; ==============================
;; :FIELD "artist"
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
;;
;; - split on "&"
;; 

;;; ==============================
;; :FIELD "author"
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
;; :FIELD "book"
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Gil Blas Illustre"
;;
;; - This will field will have a class-instance if it is non-nil

;;; ==============================
;; :FIELD "composer"
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;

;;; ==============================
;; :FIELD "brand"
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
;;   Use `dbc-convert-1-0-x-field'
;;
;; - This field will have a class-instance if it is non-nil

;;; ==============================
;; :FIELD "people"
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
;;   Use `dbc-convert-1-0-x-field'
;;
;; - This field will have a class-instance if it is non-nil


;;; ==============================
;;; NAF-ENTITIES-W/OUT-UUID
;;; ==============================

;;; ==============================
;; :FIELD "publisher"
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;

;;; ==============================
;; :FIELD "publish_location"
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  " London" 
;;
;; - `mon:string-trim-whitespace' these.


;;; ==============================
;; :FIELD "latin_name"
;;
;;         :TYPE "varchar(192)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "Cathartes Atratus | Cathartes Aura (Linnaeus)"
;;  "x"
;;
;; - Split on "|"
;;
;; - Strip "x"
;;
;; - Replace the 0 default with T/NIL
;;   Use `dbc-convert-1-0-x-field'


;;; ==============================
;;; THEME-RELATED
;;; ==============================

;; The themes should be dedicated class instances.

;;; ==============================
;; :FIELD "theme"
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

;;; ==============================
;; :FIELD "theme2"
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Portraits"
;;

;;; ==============================
;; :FIELD "theme3"
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


;;; ==============================
;;; CONDITION-DESCRIPTORS
;;; ==============================

;;; ==============================
;; :FIELD "technique"
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
;; :FIELD "paper"
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Antique Wove Paper"
;;
;; - This field has a naf UUID and is (at least currently) a relatively small set.
;;

;;; ==============================
;; :FIELD "condition"
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "[8] Archival Conservation and Mounted on Linen. light age staining."
;;  "[9] "
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
;;
;; - Separate out the `[<N>]` values when present.
;; - Convert "[<N>+]" to "N.5"
;;
;; -- Split the string on whitespace, Should capitalize first word, and concatenate the result
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

;;; ==============================
;; :FIELD "w"
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
;; :FIELD "h"
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
;; :FIELD "color"
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

;;; ==============================
;; :FIELD "onlinen"
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
;;   Use `dbc-convert-1-0-x-field'
;;

;;; ==============================
;; :FIELD "weight"
;;
;;         :TYPE "tinyint(4)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "1"
;;
;; - Convert these values to somthing more meaningful?



;;; ==============================
;; CATEG-RELATED 
;;; ==============================

;;; ==============================
;; :FIELD "bct"
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
;; :FIELD "categ"
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Books and Publications"
;;
;; - These are effectively classes and should be treated as such. By creating an
;;   instance of the deepest most categ we will automatically inherit from the
;;   class precedence heirarchy. And, we can then get multiple-inheritance!
;;
;; - In the sub-categs there is a "1" to indicate max depth.


;;; ==============================
;; :FIELD "c1"
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
;; :FIELD "c2"
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
;; :FIELD "c3"
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
;; :FIELD "c4"
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
;; :FIELD "c5"
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
;; :FIELD "c6"
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
;; :FIELD "categ_doc"
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
;;   Use `dbc-convert-1-0-x-field'
;;
;; - Is this ever used?

;;; ==============================
;; :FIELD "c1_doc"
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
;;   Use `dbc-convert-1-0-x-field'
;;
;; - Is this ever used?

;;; ==============================
;; :FIELD "c2_doc"
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
;;   Use `dbc-convert-1-0-x-field'
;;
;; - Is this ever used? Yes, at least once :SEE `ref` 9644


;;; ==============================
;; :FIELD "c3_doc"
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
;;   Use `dbc-convert-1-0-x-field'
;;
;; - Is this ever used?


 
;;; ==============================
;;; METADATA-AND-SEO
;;; ==============================

;;; ==============================
;; :FIELD "uri"
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
;;

;;; ==============================
;; :FIELD "seo_title"
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
;; "  -  No Signature &amp; , Original Print -1929 - 1930 -  FROM NOUVEAUTES PAPIERS PEINTS"
;;
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
;; - What to do about trailing "| DerbyCityPrints.com"?
;; 
;; - These can probably be safely `string-lef-trimmed'
;;
;; - What fucking mess... 

;;; ==============================
;; :FIELD "description_seo"
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "air, plane, airplane, Biplane, aircraft, expo, center, blimp, dirigible,"
;;
;; - `dbc-split-comma-field' works so long as we can be sure that there are
;;   never free commas as used as an SEO descriptor:
;;
;;  (dbc-split-comma-field
;;   "air, plane, airplane, Biplane,, aircraft, expo, center, blimp, dirigible,")


;;; ==============================
;; :FIELD "keywords"
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
;; - Note, above examples wrapped for clarity, should genrally appears as one longline.
;;
;; - May contain  chars e.g. #\Return  and #\Tab these are effectively delimiters
;;
;; - Split on chars: "|" "," #\Tab #\Return #\&
;;
;; - Split on words: "Unknown", "Unsigned", "No Signature", "Anonymous" "Translation"
;;
;; - Maybe can split on years "<YYYY>"
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
;; :FIELD "keywords_type"
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "keywords_type"
;;
;; - May contain "keywords_type", remove/ignore it.
;; 
;; - Was this actually used?
;;

;;; ==============================
;; :FIELD "keywords_seo"
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;



;;; ==============================
;;; EBAY-RELATED
;;; ==============================
;;; :NOTE The ebay stuff Should be subclassed. It was never used but does have utility.

;;; ==============================
;; :FIELD "ebay_final"
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
;;   Use `dbc-convert-1-0-x-field'
;;
;; - Should maybe be a float as like 'ebay_price" but not used anyways... (floatp 0) => nil

;;; ==============================
;; :FIELD "ebay_price"
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
;;   Use `dbc-convert-1-0-x-field'
;; 
;; - Shold we convert these 0 values to 0.0, e.g:
;;   (floatp 0.0) => T
;;   (floatp 0) => nil
;;

;;; ==============================
;; :FIELD "ebay_title"
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
;; :FIELD "ebay_id"
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
;; - Replace the 0 default with T/NIL
;;   Use `dbc-convert-1-0-x-field'


;;; ==============================
;;; STATUS-RELATED
;;; ==============================


;;; ==============================
;; :FIELD "nbre"
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; - This doesn't appear to ever have been used

;;; ==============================
;; :FIELD "online"
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
;; :FIELD "bar_code"
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
;;
;;  - May contain "bar_code" remove/ignore it
;;
;; - Replace the 0 default with T/NIL
;;   Use `dbc-convert-1-0-x-field'


;;; ==============================
;; :FIELD "user_name"
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
;; :FIELD "done"
;;
;;         :TYPE "tinyint(4)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  1
;;
;; - Replace the 0 default with T/NIL
;;   Use `dbc-convert-1-0-x-field'
;; - Verify that this is always 1 | 0

;;; ==============================
;; :FIELD "job_name"
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
;; - May contain "job_name", remove/ignor it.
;;
;; - Replace the 0 default with T/NIL
;;   Use `dbc-convert-1-0-x-field'

;;; ==============================
;; :FIELD "date_edit"
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
;;  "2009-01-27 22:00:31"
;; 
;; - Use local-time
;; - Convert "0000-00-00 00:00:00" to nil
;; - :SEE edit_history below

;;; ==============================
;; :FIELD "edit_history"
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
;; :FIELD "locked"
;;
;;         :TYPE "tinyint(4)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; - This field can prob. be ignored.

;;; ==============================
;; :FIELD "av_repro"
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
;;   Use `dbc-convert-1-0-x-field'
;; 
;; - Pretty sure this was _never_ used. 

;;; ==============================
;; :FIELD "seller"
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
;;; EOF
