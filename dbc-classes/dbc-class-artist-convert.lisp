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

;;; ==============================
;; + name="online"
;;;  Type="tinyint(3) unsigned"
;;         1

;;; ==============================
;; + name="bio"
;;   Type="int(10) unsigned"
;;         213
;;   - xrefs to documentation

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
;;   - Should get split on " | " then `string-trim-whitespace'd per split
;;     -- May appear with " | " at end of string.
;;
;;   - Should identify these as well:
;;     -- (pseudonym)
;;     -- (Pseudonym)
;;     -- (Psedonym of) ??
;;
;;   - Maybe autogenerate variant forms with permutation function.
;; 
;;  (mapcar #'(lambda (x) (string-trim " " x)) (split-string-on-chars "Poinçon de la Blanchardière, Pierre | " "|"))
;;  
;; use naf-split-used-fors
;;    (mapcar #'(lambda (x) (string-trim " " x)) (split-string-on-chars "Poinçon de la Blanchardière, Pierre | " "|"))


  

;;; ==============================
;; + name="gender"
;;;  Type="varchar(255)"
;;         Male | Female | ?

;;; ==============================
;; + name="display"
;;   Type="varchar(255)"
;;         Chalon (Louis)
;;   -Artists display name


;;; ==============================
;; + name="nationality"
;;   Type="varchar(255)"
;;         French
;;   - Artists Nationality
;;   - This should get normalized to an ISO?

;;; ==============================
;; + name=lifespan 
;;   Type="varchar(100)"
;;         1866-?
;;   - should check for and normalice values of type:
;;   -- NNNN-NNNN 
;;   -- NNNN-?
;;   -- ?-NNNN
;;   -- 1889-[?]

;;; ==============================
;; + name="date_born"
;;   Type="varchar(255)"
;;   - Can appear w/ null value
;;   - 

;;; ==============================
;; + name="date_died"
;;   Type="varchar(255)"
;;   - Can appear w/ null value

;;; ==============================
;; + name="birth_location"
;;   Type="varchar(255)"
;;   - May be empty

;;; ==============================
;; + name="death_location"
;;   Type="varchar(255)"
;;         0


;;; ==============================
;; + name="role"
;;   Type="varchar(255)"
;;         Painter, Illustrator.
;;   - Split on commas.  Be careful about trailing period `.' 
;;   - Normalize known roles.
;;
;;   <field name="role">Designer, Caricaturist, illustrator.</field>
;;  :ROLE ("Designer" "Caricaturist" "Illustrator")
 

;;; ==============================
;; + name="LOC_control"
;;   Type="varchar(15)"
;;         83227261

;;; ==============================
;; + name="ULAN_control"
;;   Type="varchar(15)"
;;         500007646
;;   - May appear as `0'


;;; ==============================
;; + name="appeared_in"
;;   Type="text"

;;; ==============================
;; + name="ads_for"
;;   Type="text"

;;; ==============================
;; + name="found_in"
;;   Type="text"
;;         Boccaccio, G. The Decameron of Giovanni Boccaccio, 1923?

;;; ==============================
;; + name="auction_records"

;;; ==============================
;; + name="also_author"
;;   Type="tinyint(3) unsigned"
;;         0
;; This is currently either 1/0 these should be converted to t/nil
;;

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
;;
;;   should be normalized where name=date_edt is the canonical form.
;;   - this should be frobbed for further parsing with features of `local-time'

;;; ==============================
;; + name="user_name" xsi:nil="true"
;;   Type="varchar(32)"

;;; ==============================
;; + name="naf_creator" xsi:nil="true"
;;   Type="varchar(32)"

;;; ==============================
;; + name="cancel_num"
;;;  Type="int(10) unsigned"
;;         0

;;; ==============================
;; + name="special_note"
;;   Type="text"

;;; ==============================
;;; EOF
