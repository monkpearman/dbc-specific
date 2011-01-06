;;; :FILE-CREATED <Timestamp: #{2011-01-04T16:36:51-05:00Z}#{11012} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/dbc-classes/dbc-class-artist.lisp
;;; ==============================


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
;;; ==============================


(in-package #:dbc)

;; (defclass parse-artist-info ()
;;   ())



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

;;; ==============================
;; + name="online"
;;;  Type="tinyint(3) unsigned"
;;         1 | 0
;; 

;;; ==============================
;; + name="bio"
;;   Type="int(10) unsigned"
;;         213
;;   - may appear as `0' 
;;   - xrefs to documentation
;;   - ignore `0' values


;;; ==============================
;; + name="id"
;;   Type="int(4) unsigned"
;;         10
;;   - uid integer

;;; ==============================
;; + name="name" ;; display
;;   Type="varchar(255)"
;;         Benito (Eduardo Garcia)
;;   - Should get extracted?  

;;; ==============================
;; + name=used_for 
;;   Type="text"
;;         Louis Chalon | Chalon, Louis
;;
;;   - May appear with " | " at end of string.
;;
;;   - Split on " | " then `string-trim-whitespace'd per split.
;;     Use `dbc:dbc-split-used-fors' to do this, the function is written.
;;
;;   - Should identify these as well:
;;     -- (pseudonym)
;;     -- (Pseudonym)
;;     -- (Psedonym of) ??
;;
;;   - Maybe autogenerate variant forms with permutation function.

;;; ==============================
;; + name="gender"
;;;  Type="varchar(255)"
;;         Male | Female | ?

;;; ==============================
;; + name="display"
;;   Type="varchar(255)"
;;         Chalon (Louis)
;;
;;   - Artists display name


;;; ==============================
;; + name="nationality"
;;   Type="varchar(255)"
;;         French
;;
;;   - Artists Nationality
;;
;;   - This should get normalized to an ISO? 
;;     If so, what to do about case like "Argentinian"?


;;; ==============================
;; + name=lifespan 
;;   Type="varchar(100)"
;;         1866-?
;;         1889-[?]    
;;         1864-[19??]
;;         1848-1934
;;         -1866
;;         1866-
;;
;;   - Check for and normalize values of type:
;;      NNNN-NNNN 
;;      NNNN-?
;;      ?-NNNN
;;      -NNNN
;;      NNNN-
;; 
;;     Use `dbc-split-lifespan' function is written. 
;;     :Note does not check for or frob strings of type "[.*+]".
;; 
;;     - Should call a follow up function when both car/cdr of
;;       `dbc-split-lifespan' are each "NNNN" and normalize these to integer
;;       values. This will allow numeric lifespan range functions, e.g. 
;;        (- <DEATH> <BIRTH>) 
;;       Or, queries of type: "Find all artists born between 1850 and 1900"
;;       The latter is important for any indexing scheme using btrees (i.e. Rucksack)


;;; ==============================
;; + name="date_born"
;;   Type="varchar(255)"
;;
;;   - Can appear w/ null value
;;   - Try to parse out "<MONTH> <DAY>, <YEAR>"?
;;

;;; ==============================
;; + name="date_died"
;;   Type="varchar(255)"
;;
;;   - Can appear w/ null value
;;
;;   - Try to parse out "<MONTH> <DAY>, <YEAR>"?

;;; ==============================
;; + name="birth_location"
;;   Type="varchar(255)"
;;        Prestinone, Val Vigezz - Italy
;;
;;   - May be empty
;;
;;   - Try to parse out "<CITY> <STATE> <COUNTRY>"?


;;; ==============================
;; + name="death_location"
;;   Type="varchar(255)"
;;         0
;;
;;   - When this is `0' ignore it.

;;; ==============================
;; + name="role"
;;   Type="varchar(255)"
;;         Painter, Illustrator.
;;
;;   - Split on commas.  Be careful about trailing period `.' 
;;     Use `dbc-split-roles' function is written.
;;
;;   - Normalize known roles.
;;
;;   <field name="role">Designer, Caricaturist, illustrator.</field>
;;  :ROLE ("Designer" "Caricaturist" "Illustrator")
 

;;; ==============================
;; + name="LOC_control"
;;   Type="varchar(15)"
;;         83227261
;;         2001022515
;;         nb2007017414
;;         n 83043434
;;
;;   - May appear as `n 83043434`, `nb2007017414`
;;
;;   - Maybe use `dbc:dbc-split-loc-pre'? 
;;     It isn't clear if this is desirable b/c "n 83043434" may actually be the
;;     canonical control number...
;; 

;;; ==============================
;; + name="ULAN_control"
;;   Type="varchar(15)"
;;         500007646
;;
;;   - May appear as `0' in which case ignore
;; 

;;; ==============================
;; + name="appeared_in"
;;   Type="text"
;;        Le Rire | Le Sourire | Femina | La Rampe | Printed Salesmanship |
;;        L'Illustration | Assiette au Beurre | La Baionnette | Cri de Paris |
;;        Fantasio | Comoedia Illustre
;;  - May appear empty as "appeared_in"><"
;; 
;;  - (search-forward-regexp "name=\"appeared_in\">[^<]")
;;  - (search-forward-regexp "name=\"appeared_in\"><") 
;;
;;  - Use `dbc-split-appeared-in' or adapted variant.

(mapcar #'mon:string-trim-whitespace
	(dbc-split-used-fors
	 "Le Rire | Le Sourire | Femina | La Rampe | Printed Salesmanship |")
	L'Illustration | Assiette au Beurre | La Baionnette | Cri de Paris | Fantasio |
 Comoedia Illustre "))

(dbc-split-appeared-in "Le Rire | Le Sourire |~% Femina | La Rampe ")


;;; ==============================
;; + name="ads_for"
;;   Type="text"

;;; ==============================
;; + name="found_in"
;;   Type="text"
;;         Boccaccio, G. The Decameron of Giovanni Boccaccio, 1923?
;;   - Split into separate records on "\n---\n" "\n----\n"
;;   -- URLS splitter: (URL `<....>')
;;                      @http://catalogue.bnf.fr/ark:/12148/cb12201408w/PUBLIC
;;
;;   -- Timestamp splitter:  #{2009-09-17T11:52:42-04:00Z}#{09384}
;;

;;; ==============================
;; + name="auction_records"

;;; ==============================
;; + name="also_author"
;;   Type="tinyint(3) unsigned"
;;         0
;; This is currently either 1/0 these should be converted to t/nil
;; "also_author">1


;;; ==============================
;; + name="also_people"
;;   Type="tinyint(3) unsigned"
;;         0
;; This is currently either 1/0 these should be converted to t/nil
;;

;;; ==============================
;; + name="default_pic"
;;         1.jpg

;;; ==============================
;; + name="print_default_pic"
;;         2033
;;
;;   - Should this be normalized to an integer as well?
;;     It would certainly make the storage cost lower, but it might also prevent
;;     hinder indexed queries by item-ref/image objects identity.
;;     
;;
;;   - This should eventually get xref'd with a grapher (i.e. epigraph)
;;   

;;; ==============================
;; + name=date_edt & name=date_edit 
;;
;; + name="date_edit"
;;   Type="varchar(255)"
;;         2008-08-3
;;
;; + name="date_edt"
;;   Type="timestamp"
;;         2008-08-03 04:00:00

;;   - Replace these: "0000-00-00 00:00:00" with nil
;;
;;   - Should be normalized where name=date_edt is the canonical form.
;;
;;   - Should be frobbed for further parsing with features of `local-time'?
;;   - If so, use a generalized timestamp splitter which also recognizes
;;     #{2009-09-17T11:52:42-04:00Z}#{09384}

;;; ==============================
;; + name="user_name" xsi:nil="true"
;;   Type="varchar(32)"

;;; ==============================
;; + name="naf_creator" xsi:nil="true"
;;   Type="varchar(32)"
;;        constance | stan
;;
;;   - Are these the only possible valuse? 
;;     What to do with them?

;;; ==============================
;; + name="cancel_num"
;;;  Type="int(10) unsigned"
;;         0
;;
;;   - It isn't clear if this was ever used.

;;; ==============================
;; + name="special_note"
;;   Type="text"
;;
;;   - It isn't clear if this was ever used.

;;; ==============================
;;; EOF
