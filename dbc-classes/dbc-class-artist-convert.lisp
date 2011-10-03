;;; :FILE-CREATED <Timestamp: #{2011-01-04T16:36:51-05:00Z}#{11012} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-artist.lisp
;;; ==============================


;;; ==============================
;;; Clean these up first with emacs regexp: 
;;;  (while (search-forward-regexp " xsi:nil=\"true\" />" nil t) (replace-match "></field>"))
;;;
;;; ==============================


(in-package #:dbc)

(defclass artist-parse (parsed-class)
  ())


;;; ==============================
;;; :TODO methods  

;;; ==============================
;; + Fields that need 0/1 to be converted to t/nil:
;;    name="online"
;;    name="also_author"
;;    name="also_people"

;;; ==============================
;; + Fields which need 0 ignored:
;;    name="ULAN_control"
;;    name="death_location"
;;    name="bio"
;;    name="cancel_num"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'

;;; ==============================

;; #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01/dump-artist-infos-xml"

;; (defparameter *tt--parse-artist-table* (make-hash-table :test 'equal))

;; (write-sax-parsed-xml-to-file
;;  :input-file  #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01/dump-artist-infos-xml"
;;  ;; (merge-pathnames (make-pathname :name "dump-refs-DUMPING")
;;  ;;                  (sub-path *xml-input-dir*))
;;  :output-file 
;;  (merge-pathnames 
;;   (make-pathname :directory `(:relative ,(sub-name *xml-output-dir*))
;;                  :name (concatenate 'string "sax-artist-test-" (mon:time-string-yyyy-mm-dd))
;;                  :type "lisp")
;;   (system-path *system-path*)))

;; from parse
;; (length
;;  '("bio" "id" "display" "nationality" "role" "lifespan" "date_born" "date_died"
;;    "birth_location" "death_location" "LOC_control" "used_for" "found_in"
;;    "appeared_in" "ads_for" "auction_records" "cancel_num" "special_note" "gender"
;;    "date_edit" "ULAN_control" "default_pic" "print_default_pic" "also_author"
;;    "also_people" "user_name" "naf_creator" "online" "date_edt"))
;=> 29

;; from list below:
;; (length '("bio" "id" "display" "used_for" "role" "gender" "lifespan" "date_born"
;; "date_died" "birth_location" "death_location" "nationality" "LOC_control"
;; "ULAN_control" "also_author" "also_people" "appeared_in" "ads_for" "found_in"
;; "auction_records" "default_pic" "print_default_pic" "online" "user_name"
;; "naf_creator"))
;; => 25

;;; ==============================
;; :NOTE All of these initial entity specific slot namespaces should be
;; transformed to their superclass slot equivalent once parsing is finished. 
;; e.g. "control-id-doc-num-artist"    -> "control-id-doc-uuid"
;; e.g. "control-id-entity-num-artist" -> "control-id-entity-uuid"
;;
;;
;; <FIELD>           <TRANSFORM>
;;
;; "bio"               ;; "control-id-doc-num-artist"
;; "id"                ;; "control-id-entity-num-artist"
;; "display"           ;; "control-id-display-artist"
;;
;; "used_for"          ;; "naf-entity-display-name-coref"
;; "role"              ;; "naf-entity-role-appearance"
;;
;; "gender"            ;; "naf-entity-gender-type"
;; "lifespan"          ;; "lifespan-date"
;; "date_born"         ;; "birth-date"
;; "date_died"         ;; "death-date"
;; "birth_location"    ;; "location-birth"
;; "death_location"    ;; "location-death"
;; "nationality"       ;; "location-nationality"
;;
;; "LOC_control"       ;; "control-id-db-0" ;; LOC
;; "ULAN_control"      ;; "control-id-db-1" ;; ULAN
;;
;; "also_author"       ;; "naf-entity-author-coref"
;; "also_people"       ;; "naf-entity-person-coref"
;;
;;
;; "appeared_in"       ;; "publication-entity-appearance"
;; "ads_for"           ;; "brand-entity-appearance"
;;
;; "found_in"          ;; "description-artist-note-general"
;; "auction_records"   ;; "description-artist-note-sale-appearance"
;;
;; "default_pic"       ;; "image-default-id"
;; "print_default_pic" ;; "image-default-xref"
;;
;; "online"            ;; "naf-active"
;; "user_name"         ;; "edit-by"
;; "naf_creator"       ;; "edit-by-creator"
;;
;; "date_edit"         ;; "edit-date-origin" ;; date_edt is the good one
;; "date_edt"          ;; "edit-date"
;;
;; "cancel_num"        ;; "ignorable-cancel-num"
;; "special_note"      ;; "ignorable-special-note"

;;; ==============================

;;; ==============================
;;  :FIELD "bio" :TRANSFORM "control-id-doc-num-artist"
;;  :TYPE "int(10) unsigned"
;;
;; :EXAMPLE-VALUES 
;;  213
;;  0
;;
;; - May appear as `0' 
;; - xrefs to documentation
;; - ignore `0' values

;;; ==============================
;;  :FIELD "id" :TRANSFORM  "control-id-entity-num-artist"
;;  :TYPE "int(4) unsigned"
;;  :KEY "PRI" 
;;  :EXTRA "auto_increment"
;;
;; :EXAMPLE-VALUES 
;;  10
;;  1458
;;
;;   - UUID integer. We need to retain the existing value because it appears in
;;    .naf files and potentially in the db as well, But, we also need to
;;    generate a more robust UUID for these as well


;;; ==============================
;;  :FIELD "name" :TRANSFORM "control-id-display-artist"
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;  "Benito (Eduardo Garcia)"
;;
;; - This is the artists display name. There is tension here because it is
;;   occasionally desirable that this name be allowed to change and/or merge
;;   with some other entity. We need to figure out how we intend to handle class
;;   instance names relative to this field and whether/how it is used in
;;   conjunction with its UUID. 
;;   One possibility is to `sxhash' it. sxhash is guaranteed to be persistent
;;   across sessions for a given implementation.
;;   If so do we include the parens and hash the entire string e.g.:
;;
;;    (sxhash "Benito (Eduardo Garcia)") => 242373724
;;    
;;   Or, instead hash each of the names, e.g.:
;;
;;    (loop 
;;       :for nm in (delete-if #'mon::string-empty-p (mon::string-split-on-chars "Benito (Eduardo Garcia)" " ()"))
;;       :collecting (cons nm (sxhash nm)) into nm-pairs
;;       :finally (return (nreverse nm-pairs)))
;;      
;;      => (("Garcia" . 125539870) ("Eduardo" . 378089051) ("Benito" . 90343236))
;;
;; However, the problem here is that `sxhash' will return the same value will
;; not return from a 32bit (sxhash "string") differ from a 64bit (sxhash
;; "string") where each is built from identical sources...
;;
;; - Should get extracted, rotated, etc.?  
;; 
     

;;; ==============================
;;  :FIELD "used_for" :TRANSFORM "naf-entity-display-name-coref"
;;  :TYPE "text"
;;
;; :EXAMPLE-VALUES 
;;  "Louis Chalon | Chalon, Louis"
;;
;;   - May appear with " | " at end of string.
;;
;;   - Split on " | " then `string-trim-whitespace'd per split.
;;     Use `split-used-fors' to do this, the function is written.
;;
;;   - Should identify these as well:
;;     -- (pseudonym)
;;     -- (Pseudonym)
;;     -- (Psedonym of) ??
;;     This requires first identifying which is the normalized form of the above
;;     strings and normalizing to them.
;;
;;   - Maybe autogenerate variant forms with permutation function.
;;   - Maybe apply an additional transformation where we split each element into a list of the form:
;;     (("Louis Chalon" ("Louis" "Chalon"))
;;      ("Chalon, "Louis" ("Chalon" "Louis"))
;;      ("Apsuedo Name (pseudonym)" ("Apsuedo" "Name" "(pseudonym)")))

;;; ==============================
;; :FIELD "role" :TRANSFORM
;; :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;         "Painter, Illustrator."
;;
;;   - Split on commas.  Be careful about trailing period `.' 
;;     Use `split-roles' function is written.
;;     :SEE-ALSO `split-comma-field'
;;
;;  - Normalize known roles.
;;
;;  - Ideally we would transform as:
;;   <field name="role">Designer, Caricaturist, illustrator.</field>
;;  :ROLE ("Designer" "Caricaturist" "Illustrator")

;;; ==============================
;;  :FIELD "gender" :TRANSFORM
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;  "Male" | "Female" | ?
;;
;; - 

;;; ==============================
;;  :FIELD "lifespan" :TRANSFORM "lifespan-date"
;;  :TYPE "varchar(100)"
;;
;; :EXAMPLE-VALUES 
;;
;;         "1866-?"
;;         "1889-[?]"    
;;         "1864-[19??]"
;;         "1848-1934"
;;         "-1866"
;;         "1866-"
;;         "Active 1940s-60s"
;;
;;   - Check for and normalize values of type:
;;      NNNN-NNNN 
;;      NNNN-?
;;      ?-NNNN
;;      -NNNN
;;      NNNN-
;; 
;;     -  Call a follow up function when both car/cdr of
;;       `split-lifespan' are each "NNNN" and normalize these to integer
;;       values. This will allow numeric lifespan range functions, e.g. 
;;        (- <DEATH> <BIRTH>) 
;;       Or, queries of type: "Find all artists born between 1850 and 1900"
;;       The latter is important for any indexing scheme using btrees (i.e. Rucksack)
;;     - Use `split-lifespan'/`split-lifespan-string-int-pairs' functions are written. 
;;       :Note does not check replace for `#\[' `#\]' for frob strings of type "[?+]".

;;; ==============================
;;  :FIELD "date_born" :TRANSFORM "birth-date"
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;
;;   - Can appear w/ null value
;;
;;   - Try to parse out "<MONTH> <DAY>, <YEAR>"?
;;

;;; ==============================
;;  :FIELD "date_died" :TRANSFORM "death-date"
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;
;;   - Can appear w/ null value
;;
;;   - Try to parse out "<MONTH> <DAY>, <YEAR>"?

;;; ==============================
;;  :FIELD "birth_location" :TRANSFORM "location-birth"
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;   "Prestinone, Val Vigezz - Italy"
;;   "Reims, France"
;;
;;  - May be empty
;;
;; - Try to parse out "<CITY> <STATE> <COUNTRY>"?
;;
;; - Co-refs with `dbc:naf-entity-location'

;;; ==============================
;;  :FIELD "death_location" :TRANSFORM "location-death"
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;
;; - When this is `0' ignore it.
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Co-refs with `dbc:naf-entity-location'

;;; ==============================
;;  :FIELD "nationality" :TRANSFORM "location-nationality"
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;         "French"
;;
;;   - Artists Nationality
;;
;;   - This should get normalized to an ISO? 
;;     If so, what to do about case like "Argentinian"?
;;
;;  - co-refs `dbc:naf-entity-location'

;;; ==============================
;;  :FIELD "LOC_control" :TRANSFORM "control-id-db-0"
;; :TYPE "varchar(15)"
;;
;; :EXAMPLE-VALUES 
;;  "83227261"
;;  "2001022515"
;;  "nb2007017414"
;;  "n 83043434"
;;
;;  - May appear as `n 83043434`, `nb2007017414`
;;
;;  - Maybe use `split-loc-pre'? 
;;    It isn't clear if this is desirable b/c "n 83043434" may actually be the
;;    canonical control number...
;; 

;;; ==============================
;; :FIELD "ULAN_control" :TRANSFORM "control-id-db-1"
;; :TYPE "varchar(15)"
;;
;; :EXAMPLE-VALUES 
;;  500007646
;;  0
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Should we try to verify the "type" of control number. YES! 2011-05-05
;;   If so, this requires identifying a ULAN type control versus some other type
;;   of value which may include OCLC, BNF, etc.

;;; ==============================
;;  :FIELD "also_author"  :TRANSFORM "naf-entity-author-coref"
;; :TYPE "tinyint(3) unsigned"
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;
;; - This is currently either 1/0 these should be converted to t/nil
;;   Replace the 0 default with T/NIL Use `field-convert-1-0-x'
;;   
;; - (search-forward-regexp "also_author">1)


;;; ==============================
;;  :FIELD "also_people"  :TRANSFORM "naf-entity-person-coref"
;; :TYPE "tinyint(3) unsigned"
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Co-refs with `dbc:naf-entity-person'

;;; ==============================
;; :FIELD "appeared_in" :TRANSFORM "publication-entity-appearance"
;; :TYPE "text"
;;
;; :EXAMPLE-VALUES 
;;
;; "Le Rire | Le Sourire | Femina | La Rampe | Printed Salesmanship |
;;  L'Illustration | Assiette au Beurre | La Baionnette | Cri de Paris |
;;  Fantasio | Comoedia Illustre"
;;
;;  - May appear empty as "appeared_in"><"
;; 
;;  - (search-forward-regexp "name=\"appeared_in\">[^<]")
;;
;;  - (search-forward-regexp "name=\"appeared_in\"><") 
;;
;;  - Use `split-appeared-in' or adapted variant.
;;   (split-appeared-in (format nil "Le Rire | Le Sourire |~% Femina | La Rampe "))
;;
;; - Co-refs with `dbc:naf-entity-publication'

;;; ==============================
;; :FIELD "ads_for"  :TRANSFORM "brand-entity-appearance"
;; :TYPE "text"
;;
;; :EXAMPLE-VALUES 
;;  "Panagra, early 1960's"
;; 
;; - elts will likely co-ref with `dbc:naf-entity-brand'
;;
;; - Likely xrefs with a subclass of `dbc:base-category-entity'

;;; ==============================
;; :FIELD "found_in"  :TRANSFORM ;; "description-artist-note-general"
;; :TYPE "text"
;;
;; :EXAMPLE-VALUES 
;;
;;     "Boccaccio, G. The Decameron of Giovanni Boccaccio, 1923?"
;;
;;   - Split into separate records on "\n---\n" "\n----\n"
;;   -- URLS splitter: (URL `<....>')
;;                      @http://catalogue.bnf.fr/ark:/12148/cb12201408w/PUBLIC
;;
;;   -- Timestamp splitter:  #{2009-09-17T11:52:42-04:00Z}#{09384}
;;
;; 

;;; ==============================
;; :FIELD "auction_records" :TRANSFORM "description-artist-note-sale-appearance"
;;
;; :EXAMPLE-VALUES 
;;
;; - Some of these (e.g. Benezit refs) will contain xrefs to a subclass of
;;   `dbc:base-location-entity'
;;


;;; ==============================
;;  :FIELD "online"  :TRANSFORM "naf-active"
;;  :TYPE "tinyint(3) unsigned"
;;
;; :EXAMPLE-VALUES 
;;  1 | 0
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;; 

;;; ==============================
;;  :FIELD "default_pic" :TRANSFORM "image-default-id"
;; 
;; :EXAMPLE-VALUES 
;;         1.jpg
;;   <field name="default_pic">1.jpg</field>
;; - May appear as empty field
;; - :SEE the image-xref class slots:
;;    image-path-for-instance-type,  image-path-for-type, image-type
;;   :FILE dbc-classes/dbc-class-image.lisp
;;
;; - Also, appears in techniques_infos table
;;
;; (pathname-type "name.jpg")
;; (pathname-type "name.jpg")
;; (pathname-name "name.jpg")
;; (pathname-directory "name.jpg")
;; (pathnamep (namestring #P"name.jpg")

;;; ==============================
;;  :FIELD "print_default_pic" :TRANSFORM "image-default-xref"
;;
;; :EXAMPLE-VALUES 
;;  2033
;;  4064
;;
;;   - Should this be normalized to an integer as well?
;;     It would certainly make the storage cost lower, but it might also prevent
;;     hinder indexed queries by item-ref/image objects identity.
;;
;;   - This should eventually get xref'd with a grapher (i.e. epigraph)
;;     according to UUID relations
;;
;;   - :SEE the image-xref class notes in :FILE dbc-classes/dbc-class-image.lisp

;;; ==============================
;;  :FIELD date_edt & name=date_edit 
;;
;; :FIELD "date_edit"  :TRANSFORM edit-date-origin
;; :TYPE "varchar(255)" 
;;
;; :EXAMPLE-VALUES 
;;  "2008-08-3"
;;
;; :FIELD "date_edt"  :TRANSFORM edit-date
;; :TYPE "timestamp"
;;
;; :EXAMPLE-VALUES 
;;  "2008-08-03 04:00:00"
;;  "0000-00-00 00:00:00"
;;
;;   - Replace these: "0000-00-00 00:00:00" with nil
;;
;;   - Should be normalized where name=date_edt is the canonical form.
;;
;;   - Should be frobbed for further parsing with features of `local-time'?
;;     If so, use a generalized timestamp splitter which also recognizes
;;     #{2009-09-17T11:52:42-04:00Z}#{09384}

;;; ==============================
;;  :FIELD "user_name" :TRANSFORM "edit-by"
;;  :TYPE "varchar(32)"
;;
;; :EXAMPLE-VALUES
;;  xsi:nil="true"
;;
;; -

;;; ==============================
;;  :FIELD "naf_creator" :TRANSFORM "edit-by-creator"
;;  :TYPE "varchar(32)"
;;
;; :EXAMPLE-VALUES
;;  "constance" | "stan"
;;  xsi:nil="true"
;;
;;   - Are these the only possible valuse? 
;;     What to do with them?


;;; ==============================
;; :FIELD "cancel_num" :TRANSFORM "ignorable-cancel-num"
;; :TYPE "int(10) unsigned"
;;
;; :EXAMPLE-VALUES
;;  0
;; 92117000
;;
;; (search-forward-regexp "cancel_num\">[^<0x].*<" nil t)
;; (let ((cnt 0)) (while (search-forward-regexp "cancel_num\">[^<0x].*<" nil t) (incf cnt)) cnt) => 3
;;
;; - It isn't clear if this was ever used.
;; - IGNORABLE

;;; ==============================
;;  :FIELD "special_note" :TRANSFORM "ignorable-special-note"
;;  :TYPE "text"
;;
;; :EXAMPLE-VALUES
;;
;; (let ((cnt 0)) (while (search-forward-regexp "name=\"special_note\">[^<]" nil t) (incf cnt)) cnt) => 6
;;
;; - It isn't clear if this was ever used.
;; - IGNORABLE


;;; ==============================
;; :ARTIST-INFOS
;; <table_structure name="artist_infos">
;; <field Field="bio" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="id" Type="int(4) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
;; <field Field="display" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="nationality" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="role" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="lifespan" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="date_born" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="date_died" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="birth_location" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="death_location" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="LOC_control" Type="varchar(15)" Null="YES" Key="" Default="0" Extra="" />
;; <field Field="used_for" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="found_in" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="appeared_in" Type="text" Null="NO" Key="MUL" Extra="" />
;; <field Field="ads_for" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="auction_records" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="cancel_num" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="special_note" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="gender" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="date_edit" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ULAN_control" Type="varchar(15)" Null="YES" Key="" Extra="" />
;; <field Field="default_pic" Type="varchar(10)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="print_default_pic" Type="varchar(10)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="also_author" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="also_people" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="user_name" Type="varchar(32)" Null="YES" Key="" Extra="" />
;; <field Field="naf_creator" Type="varchar(32)" Null="YES" Key="" Extra="" />
;; <field Field="online" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="date_edt" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />
;;
;;; ==============================


;;; ==============================
;;; EOF
