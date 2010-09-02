;;; ==============================
;;; <Timestamp: Sunday July 05, 2009 @ 05:38.54 AM - by Stan>
;;; Regexps for lispification and notes in:
;;; ../naf-mode/notes/xml-parsing/tgm-lispification-regexps-notes-7-5-09
;;; ==============================

;;; ==============================
;;; file originally parsed from the xml with:
;; (prin1 (xml-parse-file
;;         "/home/sp/stan-workspace/lisp/local-emacs/emacs-load-files/naf-mode/notes/xml-parsing/tgm1x_m_l2")
;;        (current-buffer))
;;; ==============================

;;;THIS FILE ONLY CONTAINS part 1/4 - find the rest on laptop and resend


;(
(while
(search-forward-regexp "country or state")
(replace-match  ":COUNTRY or :STATE"))

;;; ==============================
((THESAURUS

(CONCEPT
(NON-DESCRIPTOR "1970s")
(USE "Nineteen seventies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000001")
(TNR "tgm000001"))


(CONCEPT
(NON-DESCRIPTOR "3-in-1 pictures")
(USE "Three-in-one pictures")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000001")
(FCNlctgm "lctgm000002")
(TNR "tgm000002"))


(CONCEPT
(NON-DESCRIPTOR "3-legged racing")
(USE "Three-legged racing")
(FUN "FormerlyFCN TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000003")
(TNR "tgm000003"))


(CONCEPT
(DESCRIPTOR "4-H clubs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Four-H clubs")
(BT "Clubs")
(BT "Youth organizations")
(RT "Children")
(RT "Farmers' groups")
(CN ":DOUBLE-INDEX ORGANIZATIONS' FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000004")
(TNR "tgm000004"))


(CONCEPT
(NON-DESCRIPTOR "70s")
(USE "Nineteen seventies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000005")
(TNR "tgm000005"))


(CONCEPT
(DESCRIPTOR "A la poupée prints")
(SN "Color prints made by simultaneously inking separate areas of the same plate or block with different colors, before printing.")
(UF "Poupée prints")
(BT "Prints")
(RT "Intaglio prints")
(RT "Relief prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000002")
(FCNlctgm "lctgm000006")
(TNR "tgm000006"))


(CONCEPT
(DESCRIPTOR "A trois crayons drawings")
(SN "Chalk drawings in three colors, usually red, white, and black.")
(UF "Three chalk drawings")
(UF "Trois crayons drawings")
(BT "Chalk drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000003")
(FCNlctgm "lctgm000007")
(TNR "tgm000007"))


(CONCEPT
(NON-DESCRIPTOR "Äac prints")
(USE "Photochrom prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000004")
(FCNlctgm "lctgm000008")
(TNR "tgm000008"))


(CONCEPT
(NON-DESCRIPTOR "Abaca")
(USE "Manila hemp")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000009")
(TNR "tgm000009"))


(CONCEPT
(DESCRIPTOR "Abacus")
(BT "Equipment")
(RT "Mathematics")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000010")
(TNR "tgm000010"))


(CONCEPT
(DESCRIPTOR "Abandoned buildings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For vacant, possibly dilapidated buildings.  :SEARCH-SUBDIVISION RUINS for the remains of structures.")
(UF "Deserted buildings")
(UF "Vacant buildings")
(BT "Buildings")
(NT "Abandoned farms")
(RT "Building deterioration")
(RT "Ghost towns")
(RT "Ruins")
(CN "Used in a note under ARCHAEOLOGICAL SITES and RUINS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000011")
(TNR "tgm000011"))


(CONCEPT
(DESCRIPTOR "Abandoned children")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Deserted children")
(UF "Exposed children")
(BT "Children")
(RT "Abused children")
(RT "Orphans")
(RT "Street children")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000012")
(TNR "tgm000012"))


(CONCEPT
(DESCRIPTOR "Abandoned farms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Abandoned buildings")
(BT "Farms")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000013")
(TNR "tgm000013"))


(CONCEPT
(DESCRIPTOR "Abandoned mines")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Mining")
(RT "Ruins")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000014")
(TNR "tgm000014"))


(CONCEPT
(NON-DESCRIPTOR "Abandoned towns")
(USE "Ghost towns")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000015")
(TNR "tgm000015"))


(CONCEPT
(DESCRIPTOR "Abandoned vehicles")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vehicles")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012036"))


(CONCEPT
(DESCRIPTOR "Abbeys")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Religious facilities")
(RT "Convents")
(RT "Monasteries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000016")
(TNR "tgm000016"))


(CONCEPT
(DESCRIPTOR "Abdication")
(CN "Used only as a subdivision with :NAMES-OF :NAMED-PERSON [Appendix B].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm000017")
(TNR "tgm000017"))


(CONCEPT
(NON-DESCRIPTOR "Abductions")
(USE "Kidnappings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000018")
(TNR "tgm000018"))


(CONCEPT
(DESCRIPTOR "Ablution fountains")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Fountains, Ablution")
(BT "Religious architectural elements")
(RT "Bathing")
(RT "Fountains")
(RT "Rites & ceremonies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000019")
(TNR "tgm000019"))


(CONCEPT
(NON-DESCRIPTOR "Abnormalities")
(USE "Birth defects")
(USE "Human curiosities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000020")
(TNR "tgm000020"))


(CONCEPT
(DESCRIPTOR "Abolition movement")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of the abolition of slavery in general.")
(UF "Anti-slavery movement")
(UF "Free soil movement")
(BT "Protest movements")
(NT "Underground railroad system")
(RT "Abolitionists")
(RT "Civil rights")
(RT "Slavery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000021")
(TNR "tgm000021"))


(CONCEPT
(DESCRIPTOR "Abolitionists")
(SN ":SEARCH-SUBDIVISION ABOLITION MOVEMENT for the subject of abolitionism in general and the activities of abolitionists.")
(BT "People associated with politics & government")
(RT "Abolition movement")
(RT "Activists")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000022")
(TNR "tgm000022"))


(CONCEPT
(NON-DESCRIPTOR "A-bombs")
(USE "Atomic bombs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000694")
(TNR "tgm000693"))


(CONCEPT
(NON-DESCRIPTOR "Aborigines")
(USE "Indigenous peoples")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000023")
(TNR "tgm000023"))


(CONCEPT
(DESCRIPTOR "Abortions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Terminations of pregnancy")
(BT "Birth control")
(BT "Surgery")
(RT "Pregnancy")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000024")
(TNR "tgm000024"))


(CONCEPT
(NON-DESCRIPTOR "Abrasive wheels")
(USE "Grinding wheels")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000025")
(TNR "tgm000025"))


(CONCEPT
(NON-DESCRIPTOR "Absence from work")
(USE "Absenteeism (Labor)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000026")
(TNR "tgm000026"))


(CONCEPT
(DESCRIPTOR "Absent mindedness")
(BT "Mental states")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000027")
(TNR "tgm000027"))


(CONCEPT
(DESCRIPTOR "Absenteeism (Labor)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Absence from work")
(UF "Work, Absence from")
(BT "Employee-employer relations")
(RT "Employment")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000028")
(TNR "tgm000028"))


(CONCEPT
(NON-DESCRIPTOR "Absenteeism (School)")
(USE "School attendance")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000029")
(TNR "tgm000029"))


(CONCEPT
(NON-DESCRIPTOR "Abstinence")
(USE "Temperance")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000030")
(TNR "tgm000030"))


(CONCEPT
(DESCRIPTOR "Abstract drawings")
(BT "Abstract works")
(BT "Drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000005")
(FCNlctgm "lctgm000031")
(TNR "tgm000031"))


(CONCEPT
(DESCRIPTOR "Abstract paintings")
(BT "Abstract works")
(BT "Paintings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000006")
(FCNlctgm "lctgm000032")
(TNR "tgm000032"))


(CONCEPT
 (DESCRIPTOR "Abstract photographs")
(BT "Abstract works")
(BT "Photographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000007")
(FCNlctgm "lctgm000033")
(TNR "tgm000033"))


(CONCEPT
(DESCRIPTOR "Abstract prints")
(BT "Abstract works")
(BT "Prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000008")
(FCNlctgm "lctgm000034")
(TNR "tgm000034"))


(CONCEPT
(DESCRIPTOR "Abstract sculpture")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Sculpture, Abstract")
(BT "Sculpture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000035")
(TNR "tgm000035"))


(CONCEPT
(DESCRIPTOR "Abstract works")
(SN "Images in which the depiction of real objects has been subordinated orentirely discarded; especially non-representational images, stressing formal
relationships of line, color, and shape.")
(NT "Abstract drawings")
(NT "Abstract paintings")
(NT "Abstract photographs")
(NT "Abstract prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000009")
(FCNlctgm "lctgm000036")
(TNR "tgm000036"))


(CONCEPT
(DESCRIPTOR "Abused children")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Battered children")
(UF "Child abuse victims")
(UF "Maltreated persons")
(UF "Victims of abuse")
(BT "Children")
(BT "Victims")
(RT "Abandoned children")
(RT "Child prostitution")
(RT "Child trafficking")
(RT "Crimes")
(RT "Violence")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000037")
(TNR "tgm000037"))


(CONCEPT
(DESCRIPTOR "Abused women")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Battered women")
(UF "Maltreated persons")
(UF "Victims of abuse")
(UF "Wife abuse victims")
(BT "Victims")
(BT "Women")
(RT "Crimes")
(RT "Family violence")
(RT "Violence")
(RT "Women's shelters")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000038")
(TNR "tgm000038"))


(CONCEPT
(NON-DESCRIPTOR "Abused women's shelters")
(USE "Women's shelters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000039")
(TNR "tgm000039"))


(CONCEPT
(DESCRIPTOR "Abutments")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Masses, usually of masonry, that support and receive the thrust of arches, vaults, or trusses.")
(UF "Butments")
(BT "Site elements")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000040")
(TNR "tgm000040"))


(CONCEPT
(DESCRIPTOR "Abyss")
(SN "A bottomless pit or wide gulf.")
(BT "Concepts")
(RT "Disasters")
(RT "Falling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000041")
(TNR "tgm000041"))


(CONCEPT
(DESCRIPTOR "Acacias")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Plants")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012037"))


(CONCEPT
(NON-DESCRIPTOR "Academic processions")
(USE "Graduation ceremonies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000042")
(TNR "tgm000042"))


(CONCEPT
(DESCRIPTOR "Acanthi")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Sculptured ornamentations (as in a Corinthian capital) representing or suggesting the leaves of the acanthus.")
(BT "Architectural decorations & ornaments")
(RT "Corinthian order")
(RT "Leaves")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000043")
(TNR "tgm000043"))


(CONCEPT
(NON-DESCRIPTOR "Accelerators, Particle")
(USE "Particle accelerators")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000044")
(TNR "tgm000044"))


(CONCEPT
(NON-DESCRIPTOR "Accessories")
(USE "Clothing & dress")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000045")
(TNR "tgm000045"))


(CONCEPT
(DESCRIPTOR "Accidents")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes the event and any resulting damage.")
(UF "Collisions")
(UF "Damage to property")
(UF "Property damage")
(UF "Wrecks")
(BT "Events")
(NT "Aircraft accidents")
(NT "Hunting accidents")
(NT "Marine accidents")
(NT "Mine accidents")
(NT "Railroad accidents")
(NT "Traffic accidents")
(RT "Automobile breakdowns")
(RT "Clumsiness")
(RT "Crash tests")
(RT "Danger")
(RT "Disasters")
(RT "Electrocutions")
(RT "Insurance")
(RT "Rescue work")
(RT "Safety")
(RT "Spontaneous shrines")
(RT "Wounds & injuries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000046")
(TNR "tgm000046"))


(CONCEPT
(DESCRIPTOR "Accordions")
(SN "Includes the activity of playing accordions.")
(BT "Keyboard instruments")
(BT "Wind instruments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000047")
(TNR "tgm000047"))


(CONCEPT
(DESCRIPTOR "Accounting")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Business & finance")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012038"))


(CONCEPT
(DESCRIPTOR "Acculturation")
(UF "Assimilation")
(BT "Behavior")
(RT "Cultural relations")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012041"))


(CONCEPT
(NON-DESCRIPTOR "Accusing")
(USE "Blaming")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000048")
(TNR "tgm000048"))


(CONCEPT
(NON-DESCRIPTOR "Aces (Fighter pilots)")
(USE "Fighter pilots")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000049")
(TNR "tgm000049"))


(CONCEPT
(DESCRIPTOR "Acetate negatives")
(SN "Acetate safety films were first introduced in the early 1900s.  Various types include diacetate and triacetate and are often difficult to distinguish from one another.")
(UF "Cellulose acetate negatives")
(UF "Cellulose diacetate negatives")
(UF "Cellulose triacetate negatives")
(UF "Diacetate negatives")
(UF "Triacetate negatives")
(BT "Safety film negatives")
(HN "Changed 6/94. Formerly, ACETATE NEGATIVES may have been indexed as CELLULOSE DIACETATE NEGATIVES or as CELLULOSE TRIACETATE NEGATIVES.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000010")
(FCNlctgm "lctgm000050")
(TNR "tgm000050"))


(CONCEPT
(NON-DESCRIPTOR "Aches")
(USE "Pain")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000051")
(TNR "tgm000051"))


(CONCEPT
(NON-DESCRIPTOR "Acid (Drug)")
(USE "LSD (Drug)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000052")
(TNR "tgm000052"))


(CONCEPT
(DESCRIPTOR "Acolytes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Altar boys")
(UF "Altar servers")
(BT "Children")
(BT "People associated with religion")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000053")
(TNR "tgm000053"))


(CONCEPT
(DESCRIPTOR "Acorn decorations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Architectural decorations & ornaments")
(RT "Acorns")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000054")
(TNR "tgm000054"))


(CONCEPT
(DESCRIPTOR "Acorns")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Nuts")
(RT "Acorn decorations")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012035"))


(CONCEPT
(DESCRIPTOR "Acoustical engineering")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of acoustical engineering in general and the activities of acoustical engineers.")
(BT "Engineering")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000055")
(TNR "tgm000055"))


(CONCEPT
(NON-DESCRIPTOR "Acqueducts")
(USE "Aqueducts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000056")
(TNR "tgm000056"))


(CONCEPT
(NON-DESCRIPTOR "Acquired immune deficiency syndrome")
(USE "AIDS (Disease)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000057")
(TNR "tgm000057"))


(CONCEPT
(NON-DESCRIPTOR "Acquisition of territory")
(USE "Annexations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000058")
(TNR "tgm000058"))


(CONCEPT
(DESCRIPTOR "Acrobatics")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Entertainment")
(RT "Acrobats")
(RT "Aerialists")
(RT "Circus performers")
(RT "Circuses & shows")
(RT "Contorting")
(RT "Gymnastics")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000059")
(TNR "tgm000059"))


(CONCEPT
(DESCRIPTOR "Acrobats")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Individuals who engage in acts of physical agility for entertainment purposes.")
(BT "Entertainers")
(NT "Contortionists")
(RT "Acrobatics")
(RT "Aerialists")
(RT "Circus performers")
(RT "Circuses & shows")
(RT "Gymnasts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000060")
(TNR "tgm000060"))


(CONCEPT
(DESCRIPTOR "Acrylic paintings")
(BT "Polymer paintings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000011")
(FCNlctgm "lctgm000061")
(TNR "tgm000061"))


(CONCEPT
(DESCRIPTOR "Action & adventure dramas")
(SN "For images representing dramatic productions or scenes (theatrical, film, radio, or television) which consist of swordplay, fighting, or other forms of combat.  Can also include activities that involve danger and risk.")
(BT "Literature")
(RT "Campaigns & battles")
(RT "Danger")
(RT "Motion pictures")
(RT "Radio broadcasting")
(RT "Television programs")
(RT "Theatrical productions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000063")
(TNR "tgm000063"))


(CONCEPT
(NON-DESCRIPTOR "Action comics")
(USE "Adventure comics")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000012")
(FCNlctgm "lctgm000062")
(TNR "tgm000062"))


(CONCEPT
(DESCRIPTOR "Actions & defenses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Defense (Law)")
(UF "Lawsuits")
(UF "Litigation")
(UF "Suits (Law)")
(BT "Judicial proceedings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000064")
(TNR "tgm000064"))


(CONCEPT
(DESCRIPTOR "Activists")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Demonstrators")
(UF "Militants")
(UF "Political activists")
(UF "Protesters")
(BT "People associated with politics & government")
(NT "Counterrevolutionaries")
(NT "Draft resisters")
(NT "Pickets")
(NT "Rebels")
(NT "Revolutionaries")
(NT "Suffragists")
(RT "Abolitionists")
(RT "Civil disobedience")
(RT "Civil rights leaders")
(RT "Demonstrations")
(RT "Dissenters")
(RT "Guerrillas")
(RT "Left-wing extremists")
(RT "Lobbying")
(RT "Pacifists")
(RT "Petitions")
(RT "Political organizations")
(RT "Political participation")
(RT "Political prisoners")
(RT "Protest movements")
(RT "Rebellions")
(RT "Right-wing extremists")
(RT "Terrorism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000065")
(TNR "tgm000065"))


(CONCEPT
(DESCRIPTOR "Activities")
(GEO-FACET ":COUNTRY :STATE :CITY")
(NT "Arrivals & departures")
(NT "Assistance")
(NT "Automation")
(NT "Babysitting")
(NT "Bodily functions")
(NT "Bundling (Packing)")
(NT "Business & finance")
(NT "Camping")
(NT "Child rearing")
(NT "Clamming")
(NT "Communication")
(NT "Conducting")
(NT "Contorting")
(NT "Covert operations")
(NT "Crimes")
(NT "Day care")
(NT "Delivering")
(NT "Digging")
(NT "Disciplines")
(NT "Discovery & exploration")
(NT "Diving")
(NT "Drum majoring")
(NT "Eavesdropping")
(NT "Emigration & immigration")
(NT "Entertainment")
(NT "Events")
(NT "Examinations")
(NT "Falling")
(NT "Feeding")
(NT "Fighting")
(NT "Fire fighting")
(NT "Fire prevention")
(NT "Fishing")
(NT "Floating")
(NT "Flood control")
(NT "Foraging")
(NT "Fords (Stream crossings)")
(NT "Forecasting")
(NT "Foster home care")
(NT "Fuelwood gathering")
(NT "Fund raising")
(NT "Hand clapping")
(NT "Harvesting")
(NT "Health care")
(NT "Herding")
(NT "Hiding")
(NT "Holding hands")
(NT "Household moving")
(NT "Hunting")
(NT "Hurrying")
(NT "Hypnotism")
(NT "Industrialization")
(NT "Inspections")
(NT "Internal migration")
(NT "Investigation")
(NT "Kicking")
(NT "Knocking")
(NT "Law & legal affairs")
(NT "Leadership")
(NT "Leering")
(NT "Locomotion")
(NT "Manners & customs")
(NT "Military training")
(NT "Milking")
(NT "Mooring")
(NT "Motion picture production & direction")
(NT "Moving of structures")
(NT "Mowing")
(NT "Occupations")
(NT "Oystering")
(NT "Parachuting")
(NT "Parking")
(NT "Philanthropy")
(NT "Physical fitness")
(NT "Pinsetting")
(NT "Plowing")
(NT "Politics & government")
(NT "Posing")
(NT "Posting signs & notices")
(NT "Prayer")
(NT "Prisoner exchanges")
(NT "Processes & techniques")
(NT "Public service")
(NT "Pulling")
(NT "Punishment & torture")
(NT "Railroad switching")
(NT "Raising hands")
(NT "Raking (Sweeping)")
(NT "Reading")
(NT "Recording & registration")
(NT "Recreation")
(NT "Recruiting & enlistment")
(NT "Remodeling")
(NT "Research")
(NT "Riding")
(NT "Roping")
(NT "Sailing")
(NT "Salvage")
(NT "Scavenging")
(NT "Searching")
(NT "Seduction")
(NT "Self-defense")
(NT "Sex")
(NT "Sheep shearing")
(NT "Shoe shining")
(NT "Shooting")
(NT "Shucking")
(NT "Sitting")
(NT "Skating")
(NT "Skiing")
(NT "Slaughtering")
(NT "Smiling")
(NT "Speeding")
(NT "Sports")
(NT "Sports officiating")
(NT "Spying")
(NT "Standing")
(NT "Stoning")
(NT "Strangling")
(NT "Strategic planning")
(NT "Studying")
(NT "Surveillance")
(NT "Teaching")
(NT "Throwing")
(NT "Transportation")
(NT "Travel")
(NT "Undressing")
(NT "Vigilance")
(NT "Violence")
(NT "War destruction & pillage")
(NT "Warmongering")
(NT "Water use")
(NT "Weather control")
(NT "Weight lifting")
(NT "Weight loss")
(NT "Woodcutting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000066")
(TNR "tgm000066"))


(CONCEPT
(DESCRIPTOR "Actors")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "For male actors alone or groups of male and female actors. Search also under subdivision --PERFORMANCES :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B].")
(UF "Movie stars")
(BT "Entertainers")
(NT "Child actors")
(RT "Actresses")
(RT "Auditions")
(RT "Men")
(RT "Motion picture industry")
(RT "Opera singers")
(RT "Television industry")
(RT "Theatrical productions")
(CN "Used in a note under COSTUMES and ACTRESSES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000067")
(TNR "tgm000067"))


(CONCEPT
(DESCRIPTOR "Actresses")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE")
(SN "For female actresses.  For groups of males and females use ACTORS.  :SEARCH-SUBDIVISION --PERFORMANCES :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B].")
(UF "Movie stars")
(BT "Entertainers")
(BT "Women")
(RT "Actors")
(RT "Auditions")
(RT "Motion picture industry")
(RT "Opera singers")
(RT "Television industry")
(RT "Theatrical productions")
(CN "Used in a note under COSTUMES and ACTORS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000068")
(TNR "tgm000068"))


(CONCEPT
(DESCRIPTOR "Acupuncture")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Health care")
(NT "Acupuncture anesthesia")
(RT "Pain")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000069")
(TNR "tgm000069"))


(CONCEPT
(DESCRIPTOR "Acupuncture anesthesia")
(BT "Acupuncture")
(BT "Anesthesia")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000070")
(TNR "tgm000070"))


(CONCEPT
(NON-DESCRIPTOR "Adages")
(USE "Proverbs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000071")
(TNR "tgm000071"))


(CONCEPT
(NON-DESCRIPTOR "Adaptive reuse")
(USE "Recycled structures")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000072")
(TNR "tgm000072"))


(CONCEPT
(NON-DESCRIPTOR "Addiction to alcohol")
(USE "Alcoholism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000073")
(TNR "tgm000073"))


(CONCEPT
(NON-DESCRIPTOR "Addiction to drugs")
(USE "Drug abuse")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000074")
(TNR "tgm000074"))


(CONCEPT
(NON-DESCRIPTOR "Addiction to tobacco")
(USE "Tobacco habit")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000075")
(TNR "tgm000075"))


(CONCEPT
(NON-DESCRIPTOR "Adding machine industry")
(USE "Calculator industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000076")
(TNR "tgm000076"))


(CONCEPT
(NON-DESCRIPTOR "Adding machines")
(USE "Calculators")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000077")
(TNR "tgm000077"))


(CONCEPT
(NON-DESCRIPTOR "Addresses")
(USE "Public speaking")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000078")
(TNR "tgm000078"))


(CONCEPT
(NON-DESCRIPTOR "Adherence")
(USE "Allegiance")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000079")
(TNR "tgm000079"))


(CONCEPT
(NON-DESCRIPTOR "Adhesives")
(USE "Glue")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000080")
(TNR "tgm000080"))


(CONCEPT
(NON-DESCRIPTOR "Adieus")
(USE "Farewells")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000081")
(TNR "tgm000081"))


(CONCEPT
(NON-DESCRIPTOR "Adiposity")
(USE "Obesity")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000082")
(TNR "tgm000082"))


(CONCEPT
(DESCRIPTOR "Adits")
(SN "A nearly horizontal passage from the surface in a mine.")
(BT "Passageways")
(RT "Mining")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000083")
(TNR "tgm000083"))


(CONCEPT
(DESCRIPTOR "Administrative agencies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Agencies, Administrative")
(UF "Executive departments")
(UF "Federal agencies")
(UF "Government agencies")
(UF "Regulatory agencies")
(BT "Organizations")
(RT "Civil service")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000084")
(TNR "tgm000084"))


(CONCEPT
(DESCRIPTOR "Admirals")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Military officers")
(RT "Ship captains")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000085")
(TNR "tgm000085"))


(CONCEPT
(DESCRIPTOR "Adobe buildings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Buildings distinguished by material")
(NT "Adobe houses")
(RT "Pueblos")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000086")
(TNR "tgm000086"))


(CONCEPT
(DESCRIPTOR "Adobe houses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Adobe buildings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000087")
(TNR "tgm000087"))


(CONCEPT
(NON-DESCRIPTOR "Adolescent pregnancy")
(USE "Teenage pregnancy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000088")
(TNR "tgm000088"))


(CONCEPT
(NON-DESCRIPTOR "Adolescents")
(USE "Teenagers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000089")
(TNR "tgm000089"))


(CONCEPT
(DESCRIPTOR "Adoption")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Judicial proceedings")
(RT "Children")
(RT "Families")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000090")
(TNR "tgm000090"))


(CONCEPT
(DESCRIPTOR "Adoration")
(SN "Profound veneration, devotion, or love whether in a spiritual or non-spiritual context.")
(UF "Worship")
(BT "Mental states")
(RT "Rites & ceremonies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000091")
(TNR "tgm000091"))


(CONCEPT
(NON-DESCRIPTOR "Ads")
(USE "Advertisements")
(USE "Advertising")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000013")
(FCNlctgm "lctgm000092")
(TNR "tgm000092"))


(CONCEPT
(NON-DESCRIPTOR "Adult care")
(USE "Day care")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000093")
(TNR "tgm000093"))


(CONCEPT
(DESCRIPTOR "Adult education")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Education")
(NT "Chautauquas")
(CN ":DOUBLE-INDEX EDUCATIONAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000094")
(TNR "tgm000094"))


(CONCEPT
(DESCRIPTOR "Adultery")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Extra-marital sex")
(UF "Infidelity, Marital")
(UF "Marital infidelity")
(BT "Interpersonal relations")
(RT "Lust")
(RT "Marriage")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000096")
(TNR "tgm000095"))


(CONCEPT
(DESCRIPTOR "Adults")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(NT "Older people")
(NT "Young adults")
(HN "Before 1/2005, images may have been indexed under CHILDREN & ADULTS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000097")
(TNR "tgm000096"))


(CONCEPT
(DESCRIPTOR "Adventure comics")
(SN "Comics featuring heroes and heroines involved in action-packed, danger-filled stories. Examples include Flash Gordon, Superman, and Tarzan.")
(UF "Action comics")
(BT "Comics")
(RT "Comic books")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000014")
(FCNlctgm "lctgm000098")
(TNR "tgm000097"))


(CONCEPT
(DESCRIPTOR "Advertisements")
(SN "Public notices of the availability of goods or services through purchase or other means.")
(UF "Ads")
(BT "Ephemera")
(NT "Advertising cards")
(NT "Direct mail")
(NT "Display cards")
(NT "Promotional materials")
(RT "Cameos (Stamps)")
(RT "Fashion photographs")
(RT "Fashion prints")
(RT "Premiums")
(RT "Publicity photographs")
(CN "Also index under BROADSIDES, HANDBILLS, POSTERS, or other appropriate form.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000015")
(FCNlctgm "lctgm000099")
(TNR "tgm000098"))


(CONCEPT
(DESCRIPTOR "Advertising")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the general activity of advertising (calling attention to something, usually by announcement).")
(UF "Ads")
(BT "Communication")
(NT "False advertising")
(NT "Merchandise displays")
(NT "Television advertising")
(RT "Advertising agencies")
(RT "Logos")
(RT "Posting signs & notices")
(RT "Publicity")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000100")
(TNR "tgm000099"))


(CONCEPT
(DESCRIPTOR "Advertising agencies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Service industry facilities")
(RT "Advertising")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000101")
(TNR "tgm000100"))


(CONCEPT
(DESCRIPTOR "Advertising cards")
(SN "Cards issued to promote goods or services.  May have been distributed by merchants or enclosed as premiums with such products as bread, cigarettes, and coffee.  Usually, cards bear seller or product name and a pictorial representation of the service or product.  Picture may also be unrelated to the product.")
(UF "Insert cards")
(UF "Tradecards")
(UF "Trading cards")
(BT "Advertisements")
(BT "Cards")
(NT "Sailing cards")
(NT "Stock cards")
(NT "Trade cards")
(RT "Business cards")
(RT "Collecting cards")
(RT "Sports cards")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000016")
(FCNlctgm "lctgm000102")
(TNR "tgm000101"))


(CONCEPT
(NON-DESCRIPTOR "Advertising mail")
(USE "Direct mail")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000017")
(FCNlctgm "lctgm000103")
(TNR "tgm000102"))


(CONCEPT
(DESCRIPTOR "Advice")
(BT "Interpersonal relations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000104")
(TNR "tgm000103"))


(CONCEPT
(DESCRIPTOR "Aerial bombings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images of military bombardment by bombs dropped from the air.  :SEARCH-SUBDIVISION BOMBARDMENT for sustained military attacks on cities, military positions, and other places with bombs, shells, rockets, or other explosive missiles.   :SEARCH-SUBDIVISION BOMBINGS for the use of explosive devices for the purposes of political terrorism, protest, etc.  :SEARCH-SUBDIVISION ORDNANCE TESTING for test bombs.")
(BT "Air warfare")
(RT "Air raid drills")
(RT "Air raid shelters")
(RT "Air raid warning systems")
(RT "Bombardment")
(RT "Bombings")
(RT "War blackouts")
(CN "Used in a note under AIR WARFARE, BOMBINGS, and BOMBARDMENT.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000105")
(TNR "tgm000104"))


(CONCEPT
(NON-DESCRIPTOR "Aerial dusting in agriculture")
(USE "Crop dusting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000106")
(TNR "tgm000105"))


(CONCEPT
(NON-DESCRIPTOR "Aerial passenger lift bridges")
(USE "Transporter bridges")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000107")
(TNR "tgm000106"))


(CONCEPT
(DESCRIPTOR "Aerial photographs")
(SN "Photographs taken from an air-borne vehicle within the earth's atmosphere, such as an airplane, balloon, or kite; from a camera strapped to a bird; or by a person, such as a parachutist, in flight.  Use SPACE PHOTOGRAPHS for images taken from beyond the earth's atmosphere.")
(BT "Aerial views")
(BT "Photographs")
(RT "Space photographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000018")
(FCNlctgm "lctgm000108")
(TNR "tgm000107"))


(CONCEPT
(NON-DESCRIPTOR "Aerial spraying in agriculture")
(USE "Crop dusting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000109")
(TNR "tgm000108"))


(CONCEPT
(NON-DESCRIPTOR "Aerial tankers")
(USE "Airtankers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000110")
(TNR "tgm000109"))


(CONCEPT
(DESCRIPTOR "Aerial tramways")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Suspended railroads")
(UF "Tramways")
(BT "Cable railroads")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000111")
(TNR "tgm000110"))


(CONCEPT
(DESCRIPTOR "Aerial views")
(SN "Views from a high vantage point.")
(UF "Air views")
(UF "Balloon views")
(UF "Views, Aerial")
(BT "Views")
(NT "Aerial photographs")
(RT "Bird's-eye views")
(RT "Panoramic views")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000019")
(FCNlctgm "lctgm000112")
(TNR "tgm000111"))


(CONCEPT
(NON-DESCRIPTOR "Aerial warfare")
(USE "Air warfare")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000113")
(TNR "tgm000112"))


(CONCEPT
(DESCRIPTOR "Aerialists")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "High wire performers")
(UF "Tightrope performers")
(UF "Trapeze artists")
(BT "Entertainers")
(RT "Acrobatics")
(RT "Acrobats")
(RT "Circus performers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000114")
(TNR "tgm000113"))


(CONCEPT
(NON-DESCRIPTOR "Aerobatics")
(USE "Stunt flying")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000115")
(TNR "tgm000114"))


(CONCEPT
(NON-DESCRIPTOR "Aeronautical accidents")
(USE "Aircraft accidents")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000116")
(TNR "tgm000115"))


(CONCEPT
(DESCRIPTOR "Aeronautics")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Science, art, or practice of aircraft operation and/or aerial navigation.")
(UF "Aviation")
(BT "Science")
(NT "Air refueling")
(NT "Air traffic control")
(NT "Balloon ascensions")
(NT "Naval aviation")
(NT "Spin (Aerodynamics)")
(RT "Air shows")
(RT "Aircraft")
(RT "Aviation mechanics (Science)")
(RT "Flight crews")
(RT "Flight testing")
(RT "Flight training")
(RT "Flights around the world")
(RT "Navigation")
(RT "Space flight")
(RT "Stunt flying")
(RT "Wind tunnels")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000117")
(TNR "tgm000116"))


(CONCEPT
(NON-DESCRIPTOR "Aerostats")
(USE "Airships")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000118")
(TNR "tgm000117"))


(CONCEPT
(DESCRIPTOR "Aesthetics")
(SN "A branch of philosophy concerned with the nature of beauty or art.")
(BT "Philosophy")
(NT "Beauty")
(NT "Ugliness")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000119")
(TNR "tgm000118"))


(CONCEPT
(NON-DESCRIPTOR "Affection")
(USE "Friendship")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000120")
(TNR "tgm000119"))


(CONCEPT
(NON-DESCRIPTOR "Affective states")
(USE "Mental states")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000121")
(TNR "tgm000120"))


(CONCEPT
(DESCRIPTOR "Affidavits")
(SN "Sworn statement in writing made especially under oath or on affirmation before an authorized magistrate or officer.")
(BT "Law & legal affairs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000122")
(TNR "tgm000121"))


(CONCEPT
(NON-DESCRIPTOR "Affluent people")
(USE "Rich people")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000123")
(TNR "tgm000122"))


(CONCEPT
(DESCRIPTOR "A-frame buildings")
(SN "A building typically having triangular front and rear walls and a roof reaching to the ground.")
(BT "Buildings distinguished by form")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm00069")
(TNR "tgm000694"))


(CONCEPT
(DESCRIPTOR "African violets")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Flowers")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012034"))


(CONCEPT
(NON-DESCRIPTOR "Afterlife")
(USE "Heaven")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000124")
(TNR "tgm000123"))


(CONCEPT
(DESCRIPTOR "Afternoon")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Time")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000125")
(TNR "tgm000124"))


(CONCEPT
(DESCRIPTOR "Agave plantations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Plantations")
(RT "Agaves")
(CN ":DOUBLE-INDEX HARVESTING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000126")
(TNR "tgm000125"))


(CONCEPT
(DESCRIPTOR "Agaves")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Century plants")
(UF "Magueys")
(UF "Sisal plants")
(BT "Plants")
(NT "Henequen (Plant)")
(NT "Yucca")
(RT "Agave plantations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000127")
(TNR "tgm000126"))


(CONCEPT
(NON-DESCRIPTOR "Aged persons")
(USE "Older people")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000128")
(TNR "tgm000127"))


(CONCEPT
(NON-DESCRIPTOR "Agencies")
(USE "Organizations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000129")
(TNR "tgm000128"))


(CONCEPT
(NON-DESCRIPTOR "Agencies, Administrative")
(USE "Administrative agencies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000130")
(TNR "tgm000129"))


(CONCEPT
(NON-DESCRIPTOR "Agents")
(USE "Press agents")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000131")
(TNR "tgm000130"))


(CONCEPT
(DESCRIPTOR "Agents provocateurs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "An agent employed to induce or incite a suspected person or group to commit an incriminating act.")
(BT "Spies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000132")
(TNR "tgm000131"))


(CONCEPT
(NON-DESCRIPTOR "Agents, Indian")
(USE "Indian agents")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000133")
(TNR "tgm000132"))


(CONCEPT
(NON-DESCRIPTOR "Agfacolor transparencies")
(USE "Dye coupler transparencies")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000020")
(FCNlctgm "lctgm000134")
(TNR "tgm000133"))


(CONCEPT
(DESCRIPTOR "Aggression")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Behavior")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012033"))


(CONCEPT
(DESCRIPTOR "Aging")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Life cycle")
(RT "Older people")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000135")
(TNR "tgm000134"))


(CONCEPT
(NON-DESCRIPTOR "Agony")
(USE "Distress")
(USE "Pain")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000136")
(TNR "tgm000135"))


(CONCEPT
(NON-DESCRIPTOR "Agrarian reform")
(USE "Land reform")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000137")
(TNR "tgm000136"))


(CONCEPT
(NON-DESCRIPTOR "Agreements")
(USE "Contracts")
(USE "Treaties")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000138")
(TNR "tgm000137"))


(CONCEPT
(NON-DESCRIPTOR "Agricultural assistance, Economic")
(USE "Farm relief")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000139")
(TNR "tgm000138"))


(CONCEPT
(NON-DESCRIPTOR "Agricultural assistance, International")
(USE "International agricultural assistance")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000140")
(TNR "tgm000139"))


(CONCEPT
(NON-DESCRIPTOR "Agricultural buildings")
(USE "Agricultural facilities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000141")
(TNR "tgm000140"))


(CONCEPT
(NON-DESCRIPTOR "Agricultural equipment")
(USE "Agricultural machinery & implements")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000142")
(TNR "tgm000141"))


(CONCEPT
(DESCRIPTOR "Agricultural exhibits")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For displays of agricultural products and technology in the context of an exhibition.")
(BT "Exhibitions")
(RT "Agriculture")
(RT "Fairs")
(RT "Farm produce")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000143")
(TNR "tgm000142"))


(CONCEPT
(DESCRIPTOR "Agricultural facilities")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Agricultural buildings")
(UF "Farm buildings")
(BT "Facilities")
(NT "Animal housing")
(NT "Barns")
(NT "Barnyards")
(NT "Corrals")
(NT "Farms")
(NT "Food storage buildings")
(NT "Horticultural buildings")
(NT "Pig houses")
(NT "Ranches")
(NT "Stockyards")
(RT "Agriculture")
(HN "Changed 1/1993 from AGRICULTURAL BUILDINGS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000144")
(TNR "tgm000143"))


(CONCEPT
(NON-DESCRIPTOR "Agricultural groups")
(USE "Farmers' groups")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000145")
(TNR "tgm000144"))


(CONCEPT
(DESCRIPTOR "Agricultural laborers")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Farm workers")
(UF "Farmworkers")
(UF "Field laborers")
(BT "Laborers")
(NT "Cotton pickers")
(NT "Fruit pickers")
(NT "Migrant agricultural laborers")
(RT "Agricultural laborers' unions")
(RT "Farmers")
(RT "Peasants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000146")
(TNR "tgm000145"))


(CONCEPT
(DESCRIPTOR "Agricultural laborers' unions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Labor unions")
(RT "Agricultural laborers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000147")
(TNR "tgm000146"))


(CONCEPT
(DESCRIPTOR "Agricultural machinery & implements")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Agricultural equipment")
(UF "Farm equipment")
(UF "Farm machinery")
(BT "Equipment")
(BT "Machinery")
(NT "Harvesting machinery")
(NT "Pitchforks")
(NT "Plows")
(NT "Scythes")
(RT "Traction engines")
(RT "Tractors")
(HN "Changed 11/1992; formerly two separate terms: AGRICULTURAL MACHINERY and AGRICULTURAL EQUIPMENT.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000148")
(TNR "tgm000147"))


(CONCEPT
(DESCRIPTOR "Agricultural price supports")
(GEO-FACET ":COUNTRY :STATE")
(UF "Farm price supports")
(BT "Economic policy")
(BT "Farm relief")
(RT "Price regulation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000149")
(TNR "tgm000148"))


(CONCEPT
(DESCRIPTOR "Agricultural productivity")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Efficiency, Agricultural")
(UF "Productivity, Agricultural")
(BT "Economic & social conditions")
(RT "Agriculture")
(RT "Farm produce")
(RT "Farm relief")
(RT "International agricultural assistance")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000150")
(TNR "tgm000149"))


(CONCEPT
(NON-DESCRIPTOR "Agricultural products")
(USE "Farm produce")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000151")
(TNR "tgm000150"))


(CONCEPT
(NON-DESCRIPTOR "Agricultural societies")
(USE "Farmers' groups")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000152")
(TNR "tgm000151"))


(CONCEPT
(DESCRIPTOR "Agriculture")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the production of plants and animals for purposes of human consumption in some form.")
(BT "Science")
(NT "Animal husbandry")
(NT "Bee culture")
(NT "Farming")
(NT "Horticulture")
(RT "Agricultural exhibits")
(RT "Agricultural facilities")
(RT "Agricultural productivity")
(RT "Biological pest control")
(RT "Farm produce")
(RT "Food industry")
(RT "Forestry")
(RT "Irrigation")
(RT "Livestock")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000153")
(TNR "tgm000152"))


(CONCEPT
(NON-DESCRIPTOR "Ague")
(USE "Malaria")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000154")
(TNR "tgm000153"))


(CONCEPT
(NON-DESCRIPTOR "Aid (Relief)")
(USE "Assistance")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000155")
(TNR "tgm000154"))


(CONCEPT
(DESCRIPTOR "AIDS (Disease)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Acquired immune deficiency syndrome")
(BT "Communicable diseases")
(RT "Kaposi's sarcoma")
(RT "Sexually transmitted diseases")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000156")
(TNR "tgm000155"))


(CONCEPT
(NON-DESCRIPTOR "Ailments")
(USE "Diseases")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000157")
(TNR "tgm000156"))


(CONCEPT
(DESCRIPTOR "Air")
(BT "Natural phenomena")
(CN "For allegorical images of air.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000158")
(TNR "tgm000157"))


(CONCEPT
(NON-DESCRIPTOR "Air aces")
(USE "Fighter pilots")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000159")
(TNR "tgm000158"))


(CONCEPT
(DESCRIPTOR "Air bases")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Bases of operations for military aircraft.")
(UF "Air stations, Military")
(BT "Military facilities")
(RT "Air forces")
(RT "Airports")
(RT "Military air pilots")
(RT "Military air shows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000160")
(TNR "tgm000159"))


(CONCEPT
(DESCRIPTOR "Air compressors")
(UF "Compressors, Air")
(BT "Machinery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000161")
(TNR "tgm000160"))


(CONCEPT
(DESCRIPTOR "Air conditioners")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Appliances")
(RT "Air conditioning industry")
(RT "HVAC systems")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000162")
(TNR "tgm000161"))


(CONCEPT
(DESCRIPTOR "Air conditioning industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Heating & ventilation industry")
(RT "Air conditioners")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000163")
(TNR "tgm000162"))


(CONCEPT
(NON-DESCRIPTOR "Air conditioning, heating, & ventilating drawings")
(USE "HVAC drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000021")
(FCNlctgm "lctgm000164")
(TNR "tgm000163"))


(CONCEPT
(NON-DESCRIPTOR "Air crews")
(USE "Flight crews")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000165")
(TNR "tgm000164"))


(CONCEPT
(DESCRIPTOR "Air forces")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Military organizations")
(RT "Air bases")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000166")
(TNR "tgm000165"))


(CONCEPT
(NON-DESCRIPTOR "Air line industry")
(USE "Airline industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000167")
(TNR "tgm000166"))


(CONCEPT
(NON-DESCRIPTOR "Air lines")
(USE "Airline industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000168")
(TNR "tgm000167"))


(CONCEPT
(DESCRIPTOR "Air mail service")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Airmail service")
(BT "Postal service")
(RT "Airplanes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000169")
(TNR "tgm000168"))


(CONCEPT
(DESCRIPTOR "Air operations")
(CN "Used only as a subdivision with :NAMES-OF :NAME-OF-WAR [Appendix C].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm000170")
(TNR "tgm000169"))


(CONCEPT
(DESCRIPTOR "Air pilots")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Airline pilots")
(UF "Aviators")
(UF "Pilots (Aeronautics)")
(BT "People associated with transportation")
(NT "Balloonists")
(NT "Bush pilots")
(NT "Military air pilots")
(NT "Test pilots")
(RT "Aircraft")
(RT "Airline industry strikes")
(RT "Astronauts")
(RT "Flight crews")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000171")
(TNR "tgm000170"))


(CONCEPT
(DESCRIPTOR "Air pollution")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Pollution")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000172")
(TNR "tgm000171"))


(CONCEPT
(DESCRIPTOR "Air pumps")
(BT "Pumps")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000173")
(TNR "tgm000172"))


(CONCEPT
(DESCRIPTOR "Air raid drills")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Civil defense")
(RT "Aerial bombings")
(RT "Air raid shelters")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000174")
(TNR "tgm000173"))


(CONCEPT
(DESCRIPTOR "Air raid shelters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bomb shelters")
(BT "Shelters")
(RT "Aerial bombings")
(RT "Air raid drills")
(RT "Air raid warning systems")
(RT "Bombproof construction")
(RT "Civil defense")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000175")
(TNR "tgm000174"))


(CONCEPT
(DESCRIPTOR "Air raid warning systems")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Civil defense")
(RT "Aerial bombings")
(RT "Air raid shelters")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000176")
(TNR "tgm000175"))


(CONCEPT
(DESCRIPTOR "Air refueling")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Aeronautics")
(RT "Airtankers")
(RT "Fuel")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000177")
(TNR "tgm000176"))


(CONCEPT
(NON-DESCRIPTOR "Air rescue service")
(USE "Search & rescue operations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000178")
(TNR "tgm000177"))


(CONCEPT
(NON-DESCRIPTOR "Air ships")
(USE "Airships")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000179")
(TNR "tgm000178"))


(CONCEPT
(DESCRIPTOR "Air shows")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Airshows")
(BT "Entertainment")
(NT "Military air shows")
(RT "Aeronautics")
(RT "Aircraft")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000180")
(TNR "tgm000179"))


(CONCEPT
(NON-DESCRIPTOR "Air stations, Military")
(USE "Air bases")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000181")
(TNR "tgm000180"))


(CONCEPT
(NON-DESCRIPTOR "Air tattoos")
(USE "Military air shows")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000182")
(TNR "tgm000181"))


(CONCEPT
(DESCRIPTOR "Air traffic control")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Aeronautics")
(RT "Aircraft accidents")
(RT "Navigation")
(RT "Safety")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000183")
(TNR "tgm000182"))


(CONCEPT
(DESCRIPTOR "Air travel")
(BT "Travel")
(NT "Flights around the world")
(NT "Transcontinental flights")
(RT "Aircraft")
(RT "Airports")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000184")
(TNR "tgm000183"))


(CONCEPT
(NON-DESCRIPTOR "Air views")
(USE "Aerial views")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000022")
(FCNlctgm "lctgm000185")
(TNR "tgm000184"))


(CONCEPT
(DESCRIPTOR "Air warfare")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes all aspects of aerial combat. :SEARCH-SUBDIVISION AERIAL BOMBINGS for images that focus on military bombardment by bombs dropped from the air.  :SEARCH-SUBDIVISION --AIR OPERATIONS :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(UF "Aerial warfare")
(BT "Warfare")
(NT "Aerial bombings")
(RT "Aircraft accidents")
(RT "Aircraft carriers")
(RT "Antiaircraft missiles")
(RT "Bombers")
(RT "Campaigns & battles")
(RT "Fighter pilots")
(RT "Fighter planes")
(RT "Naval aviation")
(CN "Prefer the subdivision.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000186")
(TNR "tgm000185"))


(CONCEPT
(DESCRIPTOR "Airbrush works")
(RT "Paintings")
(RT "Photographs")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000023")
(FCNlctgm "lctgm000187")
(TNR "tgm000186"))


(CONCEPT
(DESCRIPTOR "Aircraft")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Vehicles")
(NT "Airplanes")
(NT "Airships")
(NT "Autogiros")
(NT "Balloons (Aircraft)")
(NT "Helicopters")
(NT "Nuclear aircraft")
(NT "Ornithopters")
(NT "Presidential aircraft")
(NT "Space vehicles")
(NT "U-2 (Reconnaissance aircraft)")
(RT "Aeronautics")
(RT "Air pilots")
(RT "Air shows")
(RT "Air travel")
(RT "Aircraft accidents")
(RT "Aircraft carriers")
(RT "Airports")
(RT "Flight crews")
(RT "Flight simulators")
(RT "Flight testing")
(RT "Hangars")
(RT "Kites (Toys)")
(RT "Mooring")
(RT "Navigation")
(RT "Rockets")
(RT "Unidentified flying objects")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000188")
(TNR "tgm000187"))


(CONCEPT
(DESCRIPTOR "Aircraft accidents")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Aeronautical accidents")
(UF "Airplane crashes")
(BT "Accidents")
(NT "Ballooning accidents")
(RT "Air traffic control")
(RT "Air warfare")
(RT "Aircraft")
(HN "Changed 11/1993 from AERONAUTICAL ACCIDENTS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000189")
(TNR "tgm000188"))


(CONCEPT
(DESCRIPTOR "Aircraft carriers")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Airplane carriers")
(UF "Carriers (Warships)")
(UF "Carriers, Aircraft")
(BT "Warships")
(RT "Air warfare")
(RT "Aircraft")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000190")
(TNR "tgm000189"))


(CONCEPT
(NON-DESCRIPTOR "Aircraft crews")
(USE "Flight crews")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000191")
(TNR "tgm000190"))


(CONCEPT
(DESCRIPTOR "Aircraft industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Transportation industry")
(NT "Airplane industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000192")
(TNR "tgm000191"))


(CONCEPT
(NON-DESCRIPTOR "Aircraft testing")
(USE "Flight testing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000193")
(TNR "tgm000192"))


(CONCEPT
(NON-DESCRIPTOR "Air-cushioned vehicles")
(USE "Ground-effect machines")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000217")
(TNR "tgm000216"))


(CONCEPT
(DESCRIPTOR "Airline industry")
(SN "Includes activities and structures.")
(UF "Air line industry")
(UF "Air lines")
(UF "Aviation industry")
(BT "Business enterprises")
(RT "Airplanes")
(RT "Flight attendants")
(CN ":DOUBLE-INDEX TRANSPORTATION FACILITIES  - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000194")
(TNR "tgm000193"))


(CONCEPT
(DESCRIPTOR "Airline industry strikes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Pilots' strikes")
(BT "Strikes")
(RT "Air pilots")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000195")
(TNR "tgm000194"))


(CONCEPT
(NON-DESCRIPTOR "Airline pilots")
(USE "Air pilots")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000196")
(TNR "tgm000195"))


(CONCEPT
(NON-DESCRIPTOR "Airmail service")
(USE "Air mail service")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000197")
(TNR "tgm000196"))


(CONCEPT
(NON-DESCRIPTOR "Airplane carriers")
(USE "Aircraft carriers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000198")
(TNR "tgm000197"))


(CONCEPT
(DESCRIPTOR "Airplane cockpits")
(BT "Airplane equipment")
(RT "Airplanes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000199")
(TNR "tgm000198"))


(CONCEPT
(NON-DESCRIPTOR "Airplane crashes")
(USE "Aircraft accidents")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000200")
(TNR "tgm000199"))


(CONCEPT
(DESCRIPTOR "Airplane engines")
(UF "Airplane motors")
(BT "Engines")
(RT "Airplane equipment")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000201")
(TNR "tgm000200"))


(CONCEPT
(DESCRIPTOR "Airplane equipment")
(UF "Airplane rigging")
(BT "Equipment")
(NT "Airplane cockpits")
(NT "Airplane propellers")
(NT "Airplane wings")
(RT "Airplane engines")
(RT "Airplanes")
(RT "Flight simulators")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000202")
(TNR "tgm000201"))


(CONCEPT
(NON-DESCRIPTOR "Airplane hangars")
(USE "Hangars")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000203")
(TNR "tgm000202"))


(CONCEPT
(DESCRIPTOR "Airplane industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Aircraft industry")
(BT "Transportation industry")
(RT "Airplanes")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000204")
(TNR "tgm000203"))


(CONCEPT
(NON-DESCRIPTOR "Airplane motors")
(USE "Airplane engines")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000205")
(TNR "tgm000204"))


(CONCEPT
(DESCRIPTOR "Airplane propellers")
(UF "Propellers, Airplane")
(BT "Airplane equipment")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000206")
(TNR "tgm000205"))


(CONCEPT
(DESCRIPTOR "Airplane racing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Racing")
(RT "Airplanes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000207")
(TNR "tgm000206"))


(CONCEPT
(NON-DESCRIPTOR "Airplane rigging")
(USE "Airplane equipment")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000208")
(TNR "tgm000207"))


(CONCEPT
(DESCRIPTOR "Airplane wings")
(UF "Wings, Airplane")
(BT "Airplane equipment")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000209")
(TNR "tgm000208"))


(CONCEPT
(DESCRIPTOR "Airplanes")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Includes commercial, private, and military airplanes.")
(BT "Aircraft")
(NT "Airtankers")
(NT "Biplanes")
(NT "Bombers")
(NT "Convertiplanes")
(NT "Fighter planes")
(NT "Gliders (Aircraft)")
(NT "Monoplanes")
(NT "Seaplanes")
(NT "Supersonic planes")
(NT "Transport planes")
(RT "Air mail service")
(RT "Airline industry")
(RT "Airplane cockpits")
(RT "Airplane equipment")
(RT "Airplane industry")
(RT "Airplane racing")
(RT "Autogiros")
(RT "Crop dusting")
(RT "Helicopters")
(RT "Model airplanes")
(RT "Nose art")
(RT "Paper airplanes")
(RT "Parachuting")
(RT "Stunt flying")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000210")
(TNR "tgm000209"))


(CONCEPT
(DESCRIPTOR "Airport terminals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Terminals (Stations)")
(BT "Transportation facilities")
(RT "Airports")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000211")
(TNR "tgm000210"))


(CONCEPT
(DESCRIPTOR "Airports")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Transportation facilities")
(RT "Air bases")
(RT "Air travel")
(RT "Aircraft")
(RT "Airport terminals")
(RT "Hangars")
(RT "Runways (Aeronautics)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000212")
(TNR "tgm000211"))


(CONCEPT
(NON-DESCRIPTOR "Air-sea rescues")
(USE "Search & rescue operations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000218")
(TNR "tgm000217"))


(CONCEPT
(DESCRIPTOR "Airships")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Lighter-than-air aircraft having a propelling system and a means for controlling the direction of motion.")
(UF "Aerostats")
(UF "Air ships")
(UF "Blimps")
(UF "Dirigibles")
(UF "Zeppelins")
(BT "Aircraft")
(RT "Balloons (Aircraft)")
(RT "Mooring masts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000213")
(TNR "tgm000212"))


(CONCEPT
(NON-DESCRIPTOR "Airshows")
(USE "Air shows")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000214")
(TNR "tgm000213"))


(CONCEPT
(NON-DESCRIPTOR "Airsickness")
(USE "Motion sickness")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000215")
(TNR "tgm000214"))


(CONCEPT
(DESCRIPTOR "Air-supported structures")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Inflatable structures")
(BT "Buildings")
(RT "Portable buildings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000219")
(TNR "tgm000218"))


(CONCEPT
(DESCRIPTOR "Airtankers")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Aerial tankers")
(UF "Tanker aircraft")
(BT "Airplanes")
(RT "Air refueling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000216")
(TNR "tgm000215"))


(CONCEPT
(NON-DESCRIPTOR "Aisles")
(USE "Passageways")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000220")
(TNR "tgm000219"))


(CONCEPT
(DESCRIPTOR "Alarm clocks")
(BT "Clocks & watches")
(RT "Sleeping")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000221")
(TNR "tgm000220"))


(CONCEPT
(NON-DESCRIPTOR "Alarms")
(USE "Security systems")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012029"))


(CONCEPT
(DESCRIPTOR "Albatrosses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000222")
(TNR "tgm000221"))


(CONCEPT
(NON-DESCRIPTOR "Albertypes")
(USE "Collotypes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000024")
(FCNlctgm "lctgm000223")
(TNR "tgm000222"))


(CONCEPT
(DESCRIPTOR "Albinos")
(BT "People")
(RT "Birth defects")
(RT "Human curiosities")
(CN ":DOUBLE-INDEX HUMAN CURIOSITIES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000224")
(TNR "tgm000223"))


(CONCEPT
(DESCRIPTOR "Album cards")
(SN "Collecting cards intended for display in albums; popular from about 1850 to 1890.  They usually lack a publisher's name or date and do not have advertising on them.")
(BT "Collecting cards")
(HN "Changed 10/90.  Formerly, ALBUM CARDS may have been indexed as COLLECTING CARDS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000025")
(FCNlctgm "lctgm000225")
(TNR "tgm000224"))


(CONCEPT
(DESCRIPTOR "Album covers")
(SN "Containers for sound recordings; printed with graphic designs.")
(UF "Covers, Album")
(UF "Covers, Record")
(UF "Jackets, Record")
(UF "Record covers")
(UF "Record jackets")
(UF "Sleeves, Record")
(BT "Covers (Illustration)")
(HN "Changed 6/94. Formerly, ALBUM COVERS may have been indexed as RECORD JACKETS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000026")
(FCNlctgm "lctgm000226")
(TNR "tgm000225"))


(CONCEPT
(NON-DESCRIPTOR "Albumen photoprints")
(USE "Albumen prints")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000227")
(TNR "tgm000226"))


(CONCEPT
(DESCRIPTOR "Albumen prints")
(SN "Predominant paper print photographic process in the 1800s; popular 1850s-1890s.")
(UF "Albumen photoprints")
(BT "Silver printing-out paper prints")
(RT "Crystoleum photographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000027")
(FCNlctgm "lctgm000228")
(TNR "tgm000227"))


(CONCEPT
(DESCRIPTOR "Albumen transparencies")
(SN "Typically, glass lantern slides or stereographs; introduced 1849; largely replaced by collodion transparencies.")
(UF "Hyalotypes")
(BT "Glass transparencies")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000028")
(FCNlctgm "lctgm000229")
(TNR "tgm000228"))


(CONCEPT
(DESCRIPTOR "Albums")
(SN "Bound or loose-leaf sets of pages. Includes handmade albums and published volumes of blank pages designed for the addition of images or keepsakes.")
(UF "Souvenir albums")
(NT "Photograph albums")
(NT "Presentation albums")
(NT "Scrapbooks")
(NT "Sketchbooks")
(RT "Sample books")
(HN "Changed 6/94. Formerly, some albums may have been indexed as SOUVENIR ALBUMS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000029")
(FCNlctgm "lctgm000230")
(TNR "tgm000229"))


(CONCEPT
(DESCRIPTOR "Alchemy")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of alchemy in general and the activities of alchemists.")
(UF "Transmutation of metals")
(BT "Chemistry")
(BT "Supernatural practices")
(RT "Gold")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000231")
(TNR "tgm000230"))


(CONCEPT
(NON-DESCRIPTOR "Alcohol abuse")
(USE "Alcoholism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000232")
(TNR "tgm000231"))


(CONCEPT
(NON-DESCRIPTOR "Alcoholic beverage industry")
(USE "Brewing industry")
(USE "Distilling industries")
(USE "Wine industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000233")
(TNR "tgm000232"))


(CONCEPT
(DESCRIPTOR "Alcoholic beverages")
(UF "Cocktails")
(UF "Liquor")
(BT "Beverages")
(NT "Beer")
(NT "Gin")
(NT "Liqueurs")
(NT "Tequila")
(NT "Vodka")
(NT "Whiskey")
(NT "Wine")
(RT "Bars")
(RT "Bars (Furniture)")
(RT "Blue laws")
(RT "Drunk driving")
(RT "Hangovers")
(RT "Intoxication")
(RT "Liquor stores")
(RT "Prohibition")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000234")
(TNR "tgm000233"))


(CONCEPT
(DESCRIPTOR "Alcoholism")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION INTOXICATION for images of drunk persons.")
(UF "Addiction to alcohol")
(UF "Alcohol abuse")
(UF "Dipsomania")
(UF "Drinking problem")
(UF "Liquor problem")
(BT "Diseases")
(BT "Drug abuse")
(RT "Intoxication")
(RT "Temperance")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000235")
(TNR "tgm000234"))


(CONCEPT
(DESCRIPTOR "Alcoves")
(SN "A small recessed section of a room.")
(UF "Nooks")
(UF "Recesses (Architecture)")
(BT "Interiors")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000236")
(TNR "tgm000235"))


(CONCEPT
(NON-DESCRIPTOR "Aldermen")
(USE "City council members")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000237")
(TNR "tgm000236"))


(CONCEPT
(NON-DESCRIPTOR "Alders")
(USE "Birches")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012030"))


(CONCEPT
(NON-DESCRIPTOR "ALF")
(USE "Extraterrestrial life")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000238")
(TNR "tgm000237"))


(CONCEPT
(DESCRIPTOR "Alfalfa")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Plants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000239")
(TNR "tgm000238"))


(CONCEPT
(DESCRIPTOR "Algae")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Organisms")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012028"))


(CONCEPT
(DESCRIPTOR "Alidades")
(SN "Telescopic sighting devices used as part of a ship's navigational equipment for taking bearings.")
(BT "Telescopes")
(RT "Navigation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000240")
(TNR "tgm000239"))


(CONCEPT
(DESCRIPTOR "Alien laborers")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "For laborers who seek work outside their own :COUNTRY. :SEARCH-SUBDIVISION MIGRANT LABORERS for those who regularly migrate within the same :COUNTRY.")
(UF "Foreign workers")
(BT "Aliens")
(BT "Laborers")
(CN "Used in a note under MIGRANT LABORERS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000241")
(TNR "tgm000240"))


(CONCEPT
(NON-DESCRIPTOR "Alien life forms")
(USE "Extraterrestrial life")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000242")
(TNR "tgm000241"))


(CONCEPT
(DESCRIPTOR "Aliens")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "For persons who are not citizens of the :COUNTRY in which they reside.")
(UF "Enemy aliens")
(UF "Expatriates")
(UF "Foreign residents")
(UF "Foreigners")
(BT "Foreign visitors")
(NT "Alien laborers")
(NT "Illegal aliens")
(RT "Deportations")
(RT "Emigration & immigration")
(RT "Exiles")
(RT "Immigrants")
(RT "Minorities")
(RT "Refugees")
(RT "Repatriation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000243")
(TNR "tgm000242"))


(CONCEPT
(NON-DESCRIPTOR "Aliens (Space)")
(USE "Extraterrestrial life")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000244")
(TNR "tgm000243"))


(CONCEPT
(DESCRIPTOR "All terrain vehicles")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Off-road vehicles")
(BT "Vehicles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000245")
(TNR "tgm000244"))


(CONCEPT
(DESCRIPTOR "Allegiance")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Devotion or loyalty to a cause, group, or person.")
(UF "Adherence")
(UF "Fidelity")
(UF "Loyalty, Political")
(UF "Political loyalty")
(BT "Mental states")
(RT "Patriotism")
(RT "Pledges of allegiance")
(RT "Solidarity")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000246")
(TNR "tgm000245"))


(CONCEPT
(DESCRIPTOR "Allegorical drawings")
(BT "Allegories")
(BT "Drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000030")
(FCNlctgm "lctgm000247")
(TNR "tgm000246"))


(CONCEPT
(DESCRIPTOR "Allegorical paintings")
(BT "Allegories")
(BT "Paintings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000031")
(FCNlctgm "lctgm000248")
(TNR "tgm000247"))


(CONCEPT
(DESCRIPTOR "Allegorical photographs")
(BT "Allegories")
(BT "Photographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000032")
(FCNlctgm "lctgm000249")
(TNR "tgm000248"))


(CONCEPT
(DESCRIPTOR "Allegorical prints")
(BT "Allegories")
(BT "Prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000033")
(FCNlctgm "lctgm000250")
(TNR "tgm000249"))


(CONCEPT
(DESCRIPTOR "Allegories")
(SN "Representations of truths or generalizations about human existence by means of symbolic images; often of classical derivation.")
(NT "Allegorical drawings")
(NT "Allegorical paintings")
(NT "Allegorical photographs")
(NT "Allegorical prints")
(RT "Allusions")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000034")
(FCNlctgm "lctgm000251")
(TNR "tgm000250"))


(CONCEPT
(NON-DESCRIPTOR "Allergic diseases")
(USE "Allergies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000252")
(TNR "tgm000251"))


(CONCEPT
(DESCRIPTOR "Allergies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Allergic diseases")
(BT "Diseases")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000253")
(TNR "tgm000252"))


(CONCEPT
(DESCRIPTOR "Alleys")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Narrow lanes between buildings, especially through the middle of city blocks, giving access to the rear of buildings; also, for those which are residential cul-de-sacs.")
(BT "Streets")
(RT "Backyards")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000254")
(TNR "tgm000253"))


(CONCEPT
(NON-DESCRIPTOR "Alleys, Bowling")
(USE "Bowling alleys")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000255")
(TNR "tgm000254"))


(CONCEPT
(NON-DESCRIPTOR "Alliances")
(USE "Treaties")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000256")
(TNR "tgm000255"))


(CONCEPT
(NON-DESCRIPTOR "Alliances, Temporary")
(USE "Coalition (Social sciences)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000257")
(TNR "tgm000256"))


(CONCEPT
(NON-DESCRIPTOR "Allies, War")
(USE "War allies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000258")
(TNR "tgm000257"))


(CONCEPT
(DESCRIPTOR "Alligator hunting")
(GEO-FACET ":COUNTRY :STATE")
(BT "Hunting")
(RT "Alligators")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000259")
(TNR "tgm000258"))


(CONCEPT
(DESCRIPTOR "Alligators")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Reptiles")
(RT "Alligator hunting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000260")
(TNR "tgm000259"))


(CONCEPT
(NON-DESCRIPTOR "Allowances, Children's")
(USE "Children's allowances")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000261")
(TNR "tgm000260"))


(CONCEPT
(DESCRIPTOR "Allusions")
(SN "Representations of or references to one work in another work. Does not include routine reproductions or works made _after_ other works.")
(BT "Concepts")
(RT "Allegories")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000035")
(FCNlctgm "lctgm000262")
(TNR "tgm000261"))


(CONCEPT
(DESCRIPTOR "Almanacs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Books")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000263")
(TNR "tgm000262"))


(CONCEPT
(NON-DESCRIPTOR "Almimbars")
(USE "Minbars")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000264")
(TNR "tgm000263"))


(CONCEPT
(NON-DESCRIPTOR "Alms")
(USE "Charity")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000265")
(TNR "tgm000264"))


(CONCEPT
(NON-DESCRIPTOR "Alms box")
(USE "Poor boxes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000266")
(TNR "tgm000265"))


(CONCEPT
(NON-DESCRIPTOR "Almsgiving")
(USE "Charity")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000267")
(TNR "tgm000266"))


(CONCEPT
(DESCRIPTOR "Almshouses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Privately financed homes for the poor. Includes activities and structures.")
(UF "Poor farms")
(UF "Poorhouses")
(UF "Workhouses (Poorhouses)")
(BT "Welfare facilities")
(RT "Poor persons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000268")
(TNR "tgm000267"))


(CONCEPT
(DESCRIPTOR "Aloes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Plants")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012027"))


(CONCEPT
(DESCRIPTOR "Alpacas")
(GEO-FACET ":COUNTRY :STATE")
(BT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000269")
(TNR "tgm000268"))


(CONCEPT
(DESCRIPTOR "Alphabets (Writing systems)")
(UF "Letters of the alphabet")
(BT "Writing systems")
(NT "Initials")
(NT "Phonetic alphabets")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000270")
(TNR "tgm000269"))


(CONCEPT
(NON-DESCRIPTOR "Altar boys")
(USE "Acolytes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000271")
(TNR "tgm000270"))


(CONCEPT
(NON-DESCRIPTOR "Altar servers")
(USE "Acolytes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000272")
(TNR "tgm000271"))


(CONCEPT
(DESCRIPTOR "Altarpieces")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Predellas")
(UF "Reredoses")
(UF "Retables")
(UF "Retablos")
(BT "Religious architectural elements")
(RT "Altars")
(RT "Art")
(RT "Churches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000273")
(TNR "tgm000272"))


(CONCEPT
(DESCRIPTOR "Altars")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Religious architectural elements")
(RT "Altarpieces")
(RT "Churches")
(RT "Pulpits")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000274")
(TNR "tgm000273"))


(CONCEPT
(NON-DESCRIPTOR "Alternative schools")
(USE "Free schools")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000275")
(TNR "tgm000274"))


(CONCEPT
(NON-DESCRIPTOR "Altruists")
(USE "Philanthropists")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000276")
(TNR "tgm000275"))


(CONCEPT
(NON-DESCRIPTOR "Aluminium")
(USE "Aluminum")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000277")
(TNR "tgm000276"))


(CONCEPT
(DESCRIPTOR "Aluminum")
(UF "Aluminium")
(BT "Metals")
(RT "Aluminum industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000278")
(TNR "tgm000277"))


(CONCEPT
(DESCRIPTOR "Aluminum industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Metallurgical industry")
(RT "Aluminum")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000279")
(TNR "tgm000278"))


(CONCEPT
(DESCRIPTOR "Alumni & alumnae")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Alumnus")
(UF "Graduates")
(BT "People associated with education & communication")
(RT "Students")
(RT "Universities & colleges")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000280")
(TNR "tgm000279"))


(CONCEPT
(NON-DESCRIPTOR "Alumnus")
(USE "Alumni & alumnae")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000281")
(TNR "tgm000280"))


(CONCEPT
(DESCRIPTOR "Amaryllis")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Flowers")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012032"))


(CONCEPT
(NON-DESCRIPTOR "Amateur radio")
(USE "Radio broadcasting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000282")
(TNR "tgm000281"))


(CONCEPT
(DESCRIPTOR "Amateur works")
(SN "Works created by people who are not full-time or professional practitioners in the medium or genre; often made for pleasure rather than money; does not refer to image quality.")
(RT "Children's art")
(RT "Juvenilia")
(RT "Snapshots")
(RT "Student works")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000036")
(FCNlctgm "lctgm000283")
(TNR "tgm000282"))


(CONCEPT
(DESCRIPTOR "Ambassadors")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Diplomats")
(CN ":SUBDIVIDE-BY :NATIONALITY of :COUNTRY ambassador represents.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000284")
(TNR "tgm000283"))


(CONCEPT
(DESCRIPTOR "Ambrotypes")
(SN "Direct-image photographs; the chemically reduced collodion glass negative packaged against a dark background appears as a positive. Commonly in a case; popular mid-1850s to mid-1860s.")
(UF "Cased photographs")
(UF "Collodion positive photographs")
(BT "Photographs")
(CN "Used in a note under PHOTOGRAPHS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000037")
(FCNlctgm "lctgm000285")
(TNR "tgm000284"))


(CONCEPT
(DESCRIPTOR "Ambulances")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Vehicles")
(RT "Emergency medical services")
(RT "Health care facilities")
(RT "Mobile health units")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000286")
(TNR "tgm000285"))


(CONCEPT
(DESCRIPTOR "Ambushes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Warfare")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000287")
(TNR "tgm000286"))


(CONCEPT
(NON-DESCRIPTOR "Amendments, Constitutional")
(USE "Constitutional amendments")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000288")
(TNR "tgm000287"))


(CONCEPT
(DESCRIPTOR "Ammunition")
(BT "Arms & armament")
(NT "Bullets")
(NT "Cannon balls")
(NT "Shells (Ammunition)")
(RT "Ammunition dumps")
(RT "Bullet holes")
(RT "Caissons (Vehicles)")
(RT "Gunpowder")
(RT "Magazines (Military buildings)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000289")
(TNR "tgm000288"))


(CONCEPT
(NON-DESCRIPTOR "Ammunition depots")
(USE "Magazines (Military buildings)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000290")
(TNR "tgm000289"))


(CONCEPT
(DESCRIPTOR "Ammunition dumps")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Military facilities")
(RT "Ammunition")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000291")
(TNR "tgm000290"))


(CONCEPT
(NON-DESCRIPTOR "Ammunition magazines")
(USE "Magazines (Military buildings)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000292")
(TNR "tgm000291"))


(CONCEPT
(DESCRIPTOR "Amnesty")
(GEO-FACET ":COUNTRY")
(UF "Political amnesty")
(BT "Law & legal affairs")
(CN ":SUBDIVIDE-by :COUNTRY granting amnesty.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000293")
(TNR "tgm000292"))


(CONCEPT
(NON-DESCRIPTOR "Amphibian tractors")
(USE "Tracked landing vehicles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000294")
(TNR "tgm000293"))


(CONCEPT
(DESCRIPTOR "Amphibians")
(GEO-FACET ":COUNTRY :STATE")
(BT "Animals")
(NT "Frogs")
(NT "Toads")
(RT "Aquatic animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000295")
(TNR "tgm000294"))


(CONCEPT
(NON-DESCRIPTOR "Amphibious aircraft")
(USE "Amphibious vehicles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000296")
(TNR "tgm000295"))


(CONCEPT
(NON-DESCRIPTOR "Amphibious automobiles")
(USE "Amphibious vehicles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000297")
(TNR "tgm000296"))


(CONCEPT
(DESCRIPTOR "Amphibious operations")
(CN "Used only as a subdivision with :NAMES-OF :NAME-OF-WAR [Appendix C].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm000298")
(TNR "tgm000297"))


(CONCEPT
(DESCRIPTOR "Amphibious vehicles")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Amphibious aircraft")
(UF "Amphibious automobiles")
(UF "Motor vehicles, Amphibious")
(BT "Vehicles")
(NT "Tracked landing vehicles")
(RT "Landing craft")
(RT "Military vehicles")
(RT "Seaplanes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000299")
(TNR "tgm000298"))


(CONCEPT
(DESCRIPTOR "Amphitheaters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For natural or man-made oval, semicircular, or circular areas formed by slopes or rising tiers of seats around an open space used for various public events. :SEARCH-SUBDIVISION AUDITORIUMS for facilities used for public gatherings. :SEARCH-SUBDIVISION STADIUMS for large, often unroofed structures in which athletic events are held.")
(BT "Open-air theaters")
(RT "Stadiums")
(CN "Used in a note under AUDITORIUMS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000300")
(TNR "tgm000299"))


(CONCEPT
(DESCRIPTOR "Amputation")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "The surgical removal of a body part.")
(BT "Surgery")
(RT "Amputees")
(RT "Dismemberment")
(HN "Changed 11/2007 from Nonpostable Term (USE SURGERY).")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000301")
(TNR "tgm000300"))


(CONCEPT
(DESCRIPTOR "Amputees")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People with disabilities")
(RT "Amputation")
(RT "Artificial limbs")
(RT "Dismemberment")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000302")
(TNR "tgm000301"))


(CONCEPT
(DESCRIPTOR "Amulets")
(UF "Charms")
(UF "Fetishes")
(BT "Magical devices")
(RT "Jewelry")
(RT "Magic")
(RT "Preventive medicine")
(RT "Talismans")
(RT "Witchcraft")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000303")
(TNR "tgm000302"))


(CONCEPT
(DESCRIPTOR "Amusement parks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Parks, Amusement")
(BT "Sports & recreation facilities")
(RT "Amusement piers")
(RT "Amusement rides")
(RT "Carnival games")
(RT "Circuses & shows")
(RT "Fairs")
(RT "Human curiosities")
(RT "Miniature railroads")
(RT "Sideshows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000304")
(TNR "tgm000303"))


(CONCEPT
(DESCRIPTOR "Amusement piers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Recreation piers")
(BT "Sports & recreation facilities")
(RT "Amusement parks")
(RT "Amusement rides")
(RT "Boardwalks")
(RT "Piers & wharves")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000305")
(TNR "tgm000304"))


(CONCEPT
(DESCRIPTOR "Amusement rides")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Rides, Amusement")
(BT "Sports & recreation facilities")
(NT "Bumper cars")
(NT "Ferris wheels")
(NT "Merry-go-rounds")
(NT "Roller coasters")
(RT "Amusement parks")
(RT "Amusement piers")
(RT "Fairs")
(RT "Water slides")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000306")
(TNR "tgm000305"))


(CONCEPT
(DESCRIPTOR "Anaglyphs")
(SN "Photomechanical images in two contrasting colors, such as red and green.  Printed either as a pair of images or as one image superimposed on the other but slightly out of registry.  When viewed through a pair of lenses, each in the appropriate different color, a three-dimensional effect is created.  Introduced in 1891; popular during the 1920s.")
(BT "Novelty works")
(BT "Photomechanical prints")
(BT "Stereographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000038")
(FCNlctgm "lctgm000307")
(TNR "tgm000306"))


(CONCEPT
(NON-DESCRIPTOR "Analysis of food")
(USE "Food inspections")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000308")
(TNR "tgm000307"))


(CONCEPT
(DESCRIPTOR "Anamorphic images")
(SN "Images produced by a distorting optical system or other method that renders an image unrecognizable unless viewed by the proper restoring device. Popular for prints and drawings in the 1600s and 1700s and for photographs in the 1800s.  Images are often recorded as they appear in a convex or concave cylindrical mirror.")
(BT "Novelty works")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000039")
(FCNlctgm "lctgm000309")
(TNR "tgm000308"))


(CONCEPT
(DESCRIPTOR "Anarchism")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of anarchism in general.")
(UF "Anarchy")
(BT "Economic & political systems")
(RT "Anarchists")
(RT "Government regulation")
(RT "Libertarianism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000310")
(TNR "tgm000309"))


(CONCEPT
(DESCRIPTOR "Anarchists")
(SN ":SEARCH-SUBDIVISION ANARCHISM for the subject of anarchism in general and the activities of anarchists.")
(BT "People associated with politics & government")
(RT "Anarchism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000311")
(TNR "tgm000310"))


(CONCEPT
(NON-DESCRIPTOR "Anarchy")
(USE "Anarchism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000312")
(TNR "tgm000311"))


(CONCEPT
(DESCRIPTOR "Anatomy")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of anatomy in general and the activities of anatomists.")
(BT "Biology")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000313")
(TNR "tgm000312"))


(CONCEPT
(NON-DESCRIPTOR "Ancestors")
(USE "Families")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000314")
(TNR "tgm000313"))


(CONCEPT
(NON-DESCRIPTOR "Anchor persons")
(USE "Television news anchors")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000315")
(TNR "tgm000314"))


(CONCEPT
(NON-DESCRIPTOR "Anchorage")
(USE "Mooring")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000316")
(TNR "tgm000315"))


(CONCEPT
(NON-DESCRIPTOR "Anchorites")
(USE "Hermits")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000317")
(TNR "tgm000316"))


(CONCEPT
(NON-DESCRIPTOR "Anchormen")
(USE "Television news anchors")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000318")
(TNR "tgm000317"))


(CONCEPT
(DESCRIPTOR "Anchors")
(BT "Equipment")
(RT "Mooring")
(RT "Ship equipment & rigging")
(RT "Vessels")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000319")
(TNR "tgm000318"))


(CONCEPT
(NON-DESCRIPTOR "Anchors (Television journalism)")
(USE "Television news anchors")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000320")
(TNR "tgm000319"))


(CONCEPT
(DESCRIPTOR "Andirons")
(SN "Pairs of metal firewood supports used on a hearth, usually made of horizontal bars mounted on short legs.")
(UF "Fire dogs")
(BT "Furnishings")
(RT "Fireplaces")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000321")
(TNR "tgm000320"))


(CONCEPT
(DESCRIPTOR "Anemia")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Diseases")
(RT "Blood")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000322")
(TNR "tgm000321"))


(CONCEPT
(DESCRIPTOR "Anemones")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Flowers")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012031"))


(CONCEPT
(DESCRIPTOR "Anesthesia")
(UF "Ether")
(BT "Medicine")
(NT "Acupuncture anesthesia")
(RT "Medicines")
(RT "Surgery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000323")
(TNR "tgm000322"))


(CONCEPT
(DESCRIPTOR "Angels")
(UF "Cherubim")
(UF "Seraphim")
(BT "Supernatural beings")
(RT "Heaven")
(RT "Putti")
(RT "Religion")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000324")
(TNR "tgm000323"))


(CONCEPT
(DESCRIPTOR "Anger")
(UF "Indignation")
(UF "Wrath")
(BT "Mental states")
(RT "Deadly sins")
(RT "Quarreling")
(RT "Swearing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000325")
(TNR "tgm000324"))


(CONCEPT
(DESCRIPTOR "Anglican churches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on buildings, as well as the associated grounds.")
(BT "Churches")
(RT "Cathedrals")
(RT "Episcopal churches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000326")
(TNR "tgm000325"))


(CONCEPT
(NON-DESCRIPTOR "Angling")
(USE "Fishing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000327")
(TNR "tgm000326"))


(CONCEPT
(NON-DESCRIPTOR "Angst")
(USE "Anxiety")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000328")
(TNR "tgm000327"))


(CONCEPT
(NON-DESCRIPTOR "Anguish")
(USE "Distress")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000329")
(TNR "tgm000328"))


(CONCEPT
(NON-DESCRIPTOR "Animal acts")
(USE "Trained animals")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000330")
(TNR "tgm000329"))


(CONCEPT
(DESCRIPTOR "Animal attacks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Attacks by animals")
(BT "Animal behavior")
(RT "Animals")
(RT "Bites & stings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000331")
(TNR "tgm000330"))


(CONCEPT
(DESCRIPTOR "Animal auctions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For animal auctions of all types.")
(BT "Auctions")
(RT "Livestock")
(CN ":DOUBLE-INDEX type of animal.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000332")
(TNR "tgm000331"))


(CONCEPT
(NON-DESCRIPTOR "Animal babies")
(USE "Baby animals")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000333")
(TNR "tgm000332"))


(CONCEPT
(NON-DESCRIPTOR "Animal bathing")
(USE "Animal grooming")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000334")
(TNR "tgm000333"))


(CONCEPT
(DESCRIPTOR "Animal behavior")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Behavior of animals")
(BT "Behavior")
(NT "Animal attacks")
(NT "Animal fighting")
(NT "Animal migration")
(NT "Hibernation")
(RT "Animals")
(RT "Bodily functions")
(RT "Stampedes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000335")
(TNR "tgm000334"))


(CONCEPT
(NON-DESCRIPTOR "Animal bites")
(USE "Bites & stings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000336")
(TNR "tgm000335"))


(CONCEPT
(DESCRIPTOR "Animal breeding")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animal husbandry")
(RT "Cattle breeders")
(RT "Dog breeders")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012040"))


(CONCEPT
(NON-DESCRIPTOR "Animal cleaning")
(USE "Animal grooming")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000337")
(TNR "tgm000336"))


(CONCEPT
(DESCRIPTOR "Animal experimentation")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Experimental animals")
(UF "Laboratory animals")
(BT "Experiments")
(RT "Animal treatment")
(RT "Animals")
(RT "Dissections")
(RT "Science")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000338")
(TNR "tgm000337"))


(CONCEPT
(DESCRIPTOR "Animal feeding")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes feeding of pets, livestock, etc.")
(UF "Feeding of animals")
(UF "Feeding of pets")
(UF "Pet feeding")
(BT "Animal husbandry")
(BT "Feeding")
(RT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000339")
(TNR "tgm000338"))


(CONCEPT
(DESCRIPTOR "Animal fighting")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animal behavior")
(BT "Sports")
(NT "Bullfighting")
(NT "Cockfighting")
(RT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000340")
(TNR "tgm000339"))


(CONCEPT
(DESCRIPTOR "Animal grooming")
(SN "Human tending, cleaning, brushing, etc. of animals.")
(UF "Animal bathing")
(UF "Animal cleaning")
(UF "Bathing of animals")
(BT "Animal husbandry")
(BT "Grooming")
(RT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000341")
(TNR "tgm000340"))


(CONCEPT
(NON-DESCRIPTOR "Animal horns")
(USE "Horns (Animal)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000342")
(TNR "tgm000341"))


(CONCEPT
(NON-DESCRIPTOR "Animal hospitals")
(USE "Veterinary hospitals")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000343")
(TNR "tgm000342"))


(CONCEPT
(DESCRIPTOR "Animal housing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Agricultural facilities")
(NT "Apiaries")
(NT "Aviaries")
(NT "Beehives")
(NT "Birdhouses")
(NT "Kennels")
(NT "Poultry houses")
(NT "Stables")
(RT "Animal shelters")
(RT "Animals")
(RT "Rookeries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000344")
(TNR "tgm000343"))


(CONCEPT
(DESCRIPTOR "Animal husbandry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Care of domestic animals, especially farm animals.")
(BT "Agriculture")
(NT "Animal breeding")
(NT "Animal feeding")
(NT "Animal grooming")
(NT "Cattle branding")
(NT "Dehorning")
(NT "Dog walking")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012054"))


(CONCEPT
(DESCRIPTOR "Animal locomotion")
(BT "Locomotion")
(RT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000345")
(TNR "tgm000344"))


(CONCEPT
(DESCRIPTOR "Animal migration")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animal behavior")
(RT "Animals")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012053"))


(CONCEPT
(DESCRIPTOR "Animal shelters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Dog pounds")
(UF "Pounds (Animal)")
(BT "Welfare facilities")
(RT "Animal housing")
(RT "Animal treatment")
(RT "Animal welfare organizations")
(RT "Animals")
(RT "Dogcatching")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000346")
(TNR "tgm000345"))


(CONCEPT
(DESCRIPTOR "Animal shows")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes shows of farm animals or pets.")
(BT "Exhibitions")
(NT "Dog shows")
(NT "Horse shows")
(NT "Livestock shows")
(RT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000347")
(TNR "tgm000346"))


(CONCEPT
(NON-DESCRIPTOR "Animal skins")
(USE "Hides & skins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000348")
(TNR "tgm000347"))


(CONCEPT
(DESCRIPTOR "Animal teams")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animals")
(NT "Dog teams")
(NT "Horse teams")
(NT "Ox teams")
(NT "Packtrains")
(RT "Carriages & coaches")
(RT "Carts & wagons")
(RT "Pack animals")
(RT "Sleds & sleighs")
(RT "Yokes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000349")
(TNR "tgm000348"))


(CONCEPT
(DESCRIPTOR "Animal tracks")
(GEO-FACET ":COUNTRY :STATE")
(UF "Tracks, Animal")
(BT "Footprints")
(RT "Animals")
(RT "Hunting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000350")
(TNR "tgm000349"))


(CONCEPT
(DESCRIPTOR "Animal training")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Field trials")
(UF "Training of animals")
(BT "Teaching")
(RT "Trained animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000351")
(TNR "tgm000350"))


(CONCEPT
(DESCRIPTOR "Animal traps")
(UF "Traps, Animal")
(BT "Fishing & hunting gear")
(NT "Fishing weirs")
(NT "Flypaper")
(NT "Mousetraps")
(RT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000352")
(TNR "tgm000351"))


(CONCEPT
(DESCRIPTOR "Animal treatment")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Protection of animals")
(BT "Behavior")
(NT "Dogcatching")
(RT "Animal experimentation")
(RT "Animal shelters")
(RT "Animal welfare organizations")
(RT "Animals")
(RT "Ethics")
(RT "Wildlife conservation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000353")
(TNR "tgm000352"))


(CONCEPT
(DESCRIPTOR "Animal welfare organizations")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Humane societies")
(BT "Organizations")
(RT "Animal shelters")
(RT "Animal treatment")
(RT "Animals")
(CN ":DOUBLE-INDEX ORGANIZATIONS' FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000354")
(TNR "tgm000353"))


(CONCEPT
(DESCRIPTOR "Animals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --ANIMALS & PETS :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B]. :SEARCH-SUBDIVISION --ANIMALS :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(BT "Organisms")
(NT "Alpacas")
(NT "Amphibians")
(NT "Animal teams")
(NT "Animals in human situations")
(NT "Anteaters")
(NT "Apes")
(NT "Aquatic animals")
(NT "Arachnids")
(NT "Armadillos")
(NT "Baby animals")
(NT "Badgers")
(NT "Bats")
(NT "Bears")
(NT "Birds")
(NT "Bison")
(NT "Buffaloes")
(NT "Camels")
(NT "Cats")
(NT "Cheetahs")
(NT "Circus animals")
(NT "Dead animals")
(NT "Deer")
(NT "Dogs")
(NT "Donkeys")
(NT "Eggs")
(NT "Elephants")
(NT "Extinct animals")
(NT "Foxes")
(NT "Game & game birds")
(NT "Giraffes")
(NT "Goats")
(NT "Hippopotamuses")
(NT "Horses")
(NT "Hyenas")
(NT "Insects")
(NT "Kangaroos")
(NT "Leopards")
(NT "Lions")
(NT "Livestock")
(NT "Llamas")
(NT "Lynx")
(NT "Minks")
(NT "Moles (Animals)")
(NT "Mongooses")
(NT "Monkeys")
(NT "Mules")
(NT "Muskox")
(NT "Ocelots")
(NT "Opossums")
(NT "Otters")
(NT "Pack animals")
(NT "Pandas")
(NT "Panthers")
(NT "Peccaries")
(NT "Pets")
(NT "Platypuses")
(NT "Primates")
(NT "Pumas")
(NT "Raccoons")
(NT "Reptiles")
(NT "Rhinoceroses")
(NT "Rodents")
(NT "Seals (Animals)")
(NT "Sheep")
(NT "Skunks")
(NT "Sloths")
(NT "Snails")
(NT "Swine")
(NT "Tapirs")
(NT "Tigers")
(NT "Trained animals")
(NT "Weasels")
(NT "Wild cats")
(NT "Wolverines")
(NT "Wolves")
(NT "Worms")
(NT "Zebras")
(NT "Zoo animals")
(RT "Animal attacks")
(RT "Animal behavior")
(RT "Animal experimentation")
(RT "Animal feeding")
(RT "Animal fighting")
(RT "Animal grooming")
(RT "Animal housing")
(RT "Animal locomotion")
(RT "Animal migration")
(RT "Animal shelters")
(RT "Animal shows")
(RT "Animal tracks")
(RT "Animal traps")
(RT "Animal treatment")
(RT "Animal welfare organizations")
(RT "Camouflage (Biology)")
(RT "Food")
(RT "Fossils")
(RT "Herding")
(RT "Hibernation")
(RT "Hides & skins")
(RT "Hormones")
(RT "Mascots")
(RT "Milking")
(RT "Monsters")
(RT "Nature")
(RT "Packtrains")
(RT "Ranches")
(RT "Rookeries")
(RT "Stampedes")
(RT "Stuffed animals (Toys)")
(RT "Veterinary hospitals")
(RT "Veterinary medicine")
(RT "Zoos")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000355")
(TNR "tgm000354"))


(CONCEPT
(DESCRIPTOR "Animals in human situations")
(BT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000356")
(TNR "tgm000355"))


(CONCEPT
(NON-DESCRIPTOR "Animals, Stuffed")
(USE "Stuffed animals (Toys)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000357")
(TNR "tgm000356"))


(CONCEPT
(DESCRIPTOR "Animation")
(BT "Cinematography")
(RT "Motion pictures")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000358")
(TNR "tgm000357"))


(CONCEPT
(DESCRIPTOR "Animation cels")
(SN "Images on celluloid or polyester sheets, which are used to create an animated sequence for movie, videotape, or other moving image productions; usually drawings or paintings.")
(UF "Cartoon cels")
(UF "Cels, Animation")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000040")
(FCNlctgm "lctgm000359")
(TNR "tgm000358"))


(CONCEPT
(DESCRIPTOR "Annexations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Acquisition of territory")
(UF "Cession of territory")
(UF "Territory, Annexation of")
(BT "Law & legal affairs")
(RT "Boundaries")
(RT "International relations")
(RT "Military occupations")
(CN ":SUBDIVIDE-BY geographically by area being annexed.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000360")
(TNR "tgm000359"))


(CONCEPT
(DESCRIPTOR "Anniversaries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --COMMEMORATION :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP and :CLASSES-OF-PERSONS [Appendix A]; with :NAMES-OF :NAMED-PERSON [Appendix B]; with :NAMES-OF :NAME-OF-WAR [Appendix C]; :USED-WITH :CORPORATE-BODY :NAMED-EVENT [Appendix D].")
(UF "Jubilees")
(BT "Events")
(NT "Birthdays")
(RT "Celebrations")
(RT "Commemorations")
(RT "Festivals")
(RT "Founders' Day commemorations")
(RT "Historical reenactments")
(RT "Holidays")
(RT "Reunions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000361")
(TNR "tgm000360"))


(CONCEPT
(DESCRIPTOR "Announcements")
(SN "Small notices of special occasions, such as weddings and meetings.")
(FUN "Formerly TGMI term & TGMII term.")
(BT "Ephemera")
(RT "Broadsides")
(RT "Invitations")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000041")
(FCNlctgm "lctgm000362")
(TNR "tgm000361"))


(CONCEPT
(DESCRIPTOR "Announcing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Communication")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000363")
(TNR "tgm000362"))


(CONCEPT
(NON-DESCRIPTOR "Annual leave")
(USE "Employee vacations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000364")
(TNR "tgm000363"))


(CONCEPT
(DESCRIPTOR "Anteaters")
(GEO-FACET ":COUNTRY :STATE")
(BT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000365")
(TNR "tgm000364"))


(CONCEPT
(DESCRIPTOR "Antelope hunting")
(GEO-FACET ":COUNTRY :STATE")
(BT "Big game hunting")
(RT "Antelopes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000366")
(TNR "tgm000365"))


(CONCEPT
(DESCRIPTOR "Antelopes")
(GEO-FACET ":COUNTRY :STATE")
(BT "Deer")
(NT "Gazelles")
(RT "Antelope hunting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000367")
(TNR "tgm000366"))


(CONCEPT
(DESCRIPTOR "Antennas (Electronics)")
(BT "Electronic apparatus & appliances")
(NT "Radio antennas")
(NT "Television antennas")
(RT "Radio & television towers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000368")
(TNR "tgm000367"))


(CONCEPT
(DESCRIPTOR "Anthelmintics")
(UF "Vermifuges")
(UF "Worm medicines")
(BT "Patent medicines")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000369")
(TNR "tgm000368"))


(CONCEPT
(DESCRIPTOR "Anthemia")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Ornaments consisting of floral or foliated forms arranged in a radiating cluster but always flat.")
(UF "Honeysuckle ornaments")
(BT "Architectural decorations & ornaments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000370")
(TNR "tgm000369"))


(CONCEPT
(NON-DESCRIPTOR "Anthems, National")
(USE "National songs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000371")
(TNR "tgm000370"))


(CONCEPT
(NON-DESCRIPTOR "Anthracite mining")
(USE "Coal mining")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000372")
(TNR "tgm000371"))


(CONCEPT
(NON-DESCRIPTOR "Anthropological photographs")
(USE "Ethnographic photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000042")
(FCNlctgm "lctgm000373")
(TNR "tgm000372"))


(CONCEPT
(DESCRIPTOR "Anthropologists")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Scientists")
(RT "Anthropology")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000374")
(TNR "tgm000373"))


(CONCEPT
(DESCRIPTOR "Anthropology")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of anthropology in general and the activities of anthropologists.")
(BT "Social science")
(RT "Anthropologists")
(RT "Archaeology")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000375")
(TNR "tgm000374"))


(CONCEPT
(DESCRIPTOR "Antiaircraft guns")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Artillery (Weaponry)")
(RT "Antiaircraft missiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000376")
(TNR "tgm000375"))


(CONCEPT
(DESCRIPTOR "Antiaircraft missiles")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Missiles")
(RT "Air warfare")
(RT "Antiaircraft guns")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000377")
(TNR "tgm000376"))


(CONCEPT
(DESCRIPTOR "Anti-Americanism")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE")
(BT "Prejudice")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000391")
(TNR "tgm000390"))


(CONCEPT
(DESCRIPTOR "Anti-Catholicism")
(BT "Prejudice")
(RT "Catholicism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000392")
(TNR "tgm000391"))


(CONCEPT
(NON-DESCRIPTOR "Anticommunism")
(USE "Anti-communism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000378")
(TNR "tgm000377"))


(CONCEPT
(DESCRIPTOR "Anti-communism")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For anti-communism in general as well as rhetoric or activities directed against communism.")
(UF "Anticommunism")
(UF "Anti-communist movements")
(BT "Prejudice")
(RT "Communism")
(RT "McCarthyism")
(HN "Prior to 4/1991, COMMUNISM was used for both communism and anti-communism.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000393")
(TNR "tgm000392"))


(CONCEPT
(NON-DESCRIPTOR "Anti-communist movements")
(USE "Anti-communism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000394")
(TNR "tgm000393"))


(CONCEPT
(NON-DESCRIPTOR "Anticum")
(USE "Pronaoi")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000379")
(TNR "tgm000378"))


(CONCEPT
(DESCRIPTOR "Anti-Nazi movement")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Protest movements")
(RT "National socialism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000395")
(TNR "tgm000394"))


(CONCEPT
(DESCRIPTOR "Antinuclear movements")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Protest movements")
(RT "Nuclear power")
(RT "Nuclear weapons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000380")
(TNR "tgm000379"))


(CONCEPT
(NON-DESCRIPTOR "Antipathy")
(USE "Prejudice")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000381")
(TNR "tgm000380"))


(CONCEPT
(DESCRIPTOR "Antipersonnel weapons")
(SN "Weapons designed for use against military personnel.")
(BT "Arms & armament")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000382")
(TNR "tgm000381"))


(CONCEPT
(NON-DESCRIPTOR "Antique shops")
(USE "Antique stores")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000383")
(TNR "tgm000382"))


(CONCEPT
(DESCRIPTOR "Antique stores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Antique shops")
(BT "Stores & shops")
(RT "Antiques")
(HN "Changed 1/1993 from ANTIQUE DEALERS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000384")
(TNR "tgm000383"))


(CONCEPT
(DESCRIPTOR "Antiques")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION ANTIQUITIES for relics of ancient times.")
(BT "Objects")
(RT "Antique stores")
(RT "Antiquities")
(CN "Used in a note under ANTIQUITIES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000385")
(TNR "tgm000384"))


(CONCEPT
(DESCRIPTOR "Antiquities")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Relics of ancient times, such as coins or statues. :SEARCH-SUBDIVISION ARCHAEOLOGICAL SITES for ancient structures or remains of ancient structures. :SEARCH-SUBDIVISION ANTIQUES for objects of an earlier period, but not of ancient times. :SEARCH-SUBDIVISION --ANTIQUITIES & ARCHAEOLOGICAL SITES :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A].")
(BT "Objects")
(RT "Antiques")
(RT "Archaeological sites")
(RT "Archaeology")
(RT "Ruins")
(CN "Used in a note under ARCHAEOLOGICAL SITES. Used in a note under ANTIQUES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000386")
(TNR "tgm000385"))


(CONCEPT
(DESCRIPTOR "Antiquities & archaeological sites")
(CN "Used only as a subdivision with :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm000387")
(TNR "tgm000386"))


(CONCEPT
(DESCRIPTOR "Antisemitism")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Racism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000388")
(TNR "tgm000387"))


(CONCEPT
(NON-DESCRIPTOR "Anti-slavery movement")
(USE "Abolition movement")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000396")
(TNR "tgm000395"))


(CONCEPT
(DESCRIPTOR "Antitoxins")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Antibody formed in the body as a result of the introduction of a toxin and able to neutralize the toxin.")
(BT "Medicines")
(RT "Communicable diseases")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000389")
(TNR "tgm000388"))


(CONCEPT
(DESCRIPTOR "Antitrust law")
(GEO-FACET ":COUNTRY :STATE")
(BT "Laws")
(RT "Government regulation")
(RT "Industrial trusts")
(RT "Interlocking directorates")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000390")
(TNR "tgm000389"))


(CONCEPT
(NON-DESCRIPTOR "Anti-war")
(USE "Pacifism")
(USE "Peace")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000397")
(TNR "tgm000396"))


(CONCEPT
(NON-DESCRIPTOR "Anti-war movements")
(USE "Protest movements")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000398")
(TNR "tgm000397"))


(CONCEPT
(DESCRIPTOR "Antlers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Horns (Animal)")
(RT "Deer")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000399")
(TNR "tgm000398"))


(CONCEPT
(DESCRIPTOR "Ants")
(GEO-FACET ":COUNTRY :STATE")
(BT "Insects")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000400")
(TNR "tgm000399"))


(CONCEPT
(DESCRIPTOR "Anvils")
(BT "Equipment")
(RT "Metalworking")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012052"))


(CONCEPT
(DESCRIPTOR "Anxiety")
(UF "Angst")
(BT "Mental states")
(RT "Fear")
(RT "Perspiration")
(RT "Stress")
(RT "Worry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000401")
(TNR "tgm000400"))


(CONCEPT
(DESCRIPTOR "Apartheid")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the political, economic, and social policies of the government of South Africa designed to keep :RACIAL-GROUP in South Africa and Namibia separated.")
(UF "Separate development (Race relations)")
(BT "Economic & political systems")
(RT "Race relations")
(RT "Segregation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000402")
(TNR "tgm000401"))


(CONCEPT
(NON-DESCRIPTOR "Apartment complexes")
(USE "Housing developments")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000403")
(TNR "tgm000402"))


(CONCEPT
(DESCRIPTOR "Apartment hotels")
(UF "Hotels, Apartment")
(UF "Hotels, Residential")
(UF "Residential hotels")
(BT "Apartment houses")
(BT "Hotels")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000404")
(TNR "tgm000403"))


(CONCEPT
(DESCRIPTOR "Apartment houses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For apartment house structures; :SEARCH-SUBDIVISION APARTMENTS for single units within apartment houses or living units not in apartment houses.")
(UF "Flats")
(UF "High rise apartment buildings")
(BT "Dwellings")
(NT "Apartment hotels")
(NT "Tenement houses")
(RT "Apartments")
(RT "Houses")
(RT "Penthouses")
(CN "Used in a note under APARTMENTS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000405")
(TNR "tgm000404"))


(CONCEPT
(DESCRIPTOR "Apartments")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For single units within apartment houses or living units not in apartment houses; :SEARCH-SUBDIVISION APARTMENT HOUSES for apartment house structures.")
(UF "Flats")
(BT "Interiors")
(RT "Apartment houses")
(RT "Penthouses")
(CN "Used in a note under APARTMENT HOUSES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000406")
(TNR "tgm000405"))


(CONCEPT
(DESCRIPTOR "Apathy")
(UF "Impassiveness")
(UF "Indifference")
(BT "Mental states")
(NT "Voter apathy")
(RT "Boredom")
(RT "Obliviousness")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000407")
(TNR "tgm000406"))


(CONCEPT
(DESCRIPTOR "Apes")
(GEO-FACET ":COUNTRY :STATE")
(SN "Distinguished from the other higher primates, the monkeys, by their complete lack of external tail and by their more complex brains.")
(BT "Animals")
(BT "Primates")
(NT "Chimpanzees")
(NT "Gorillas")
(NT "Orangutans")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000408")
(TNR "tgm000407"))


(CONCEPT
(NON-DESCRIPTOR "Aphorisms")
(USE "Proverbs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000409")
(TNR "tgm000408"))


(CONCEPT
(DESCRIPTOR "Apiaries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animal housing")
(RT "Bees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000410")
(TNR "tgm000409"))


(CONCEPT
(NON-DESCRIPTOR "Apothecaries")
(USE "Pharmacists")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000411")
(TNR "tgm000410"))


(CONCEPT
(NON-DESCRIPTOR "Apothecary shops")
(USE "Drugstores")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000412")
(TNR "tgm000411"))


(CONCEPT
(NON-DESCRIPTOR "Apparel")
(USE "Clothing & dress")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000413")
(TNR "tgm000412"))


(CONCEPT
(NON-DESCRIPTOR "Apparitions")
(USE "Ghosts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000414")
(TNR "tgm000413"))


(CONCEPT
(NON-DESCRIPTOR "Applause")
(USE "Hand clapping")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000415")
(TNR "tgm000414"))


(CONCEPT
(DESCRIPTOR "Apple orchards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Orchards")
(RT "Apple trees")
(RT "Apples")
(CN ":DOUBLE-INDEX HARVESTING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000416")
(TNR "tgm000415"))


(CONCEPT
(DESCRIPTOR "Apple trees")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fruit trees")
(RT "Apple orchards")
(RT "Apples")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000417")
(TNR "tgm000416"))


(CONCEPT
(DESCRIPTOR "Apples")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fruit")
(NT "Crab apples")
(RT "Apple orchards")
(RT "Apple trees")
(RT "Bobbing for apples")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000418")
(TNR "tgm000417"))


(CONCEPT
(DESCRIPTOR "Appliance stores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Stores & shops")
(NT "Light fixture stores")
(RT "Appliances")
(RT "Furniture stores")
(RT "Hardware stores")
(RT "Home furnishings stores")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000419")
(TNR "tgm000418"))


(CONCEPT
(DESCRIPTOR "Appliances")
(SN "Instruments or devices (as electric stoves, fans, or refrigerators) operated by gas or electric current.")
(UF "Domestic appliances")
(UF "Home appliances")
(BT "Equipment")
(NT "Air conditioners")
(NT "Dishwashing machines")
(NT "Electric can openers")
(NT "Refrigerators")
(NT "Toasters")
(NT "Vacuum cleaners")
(NT "Washing machines")
(RT "Appliance stores")
(RT "Irons (Pressing)")
(RT "Light fixtures")
(RT "Microwave ovens")
(RT "Ovens")
(RT "Sewing machines")
(RT "Stoves")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000420")
(TNR "tgm000419"))


(CONCEPT
(NON-DESCRIPTOR "Appointments, Presidential")
(USE "Presidential appointments")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000421")
(TNR "tgm000420"))


(CONCEPT
(DESCRIPTOR "Apportionment")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Reapportionment")
(BT "Politics & government")
(RT "Census")
(RT "Political elections")
(RT "Political representation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000422")
(TNR "tgm000421"))


(CONCEPT
(DESCRIPTOR "Apprentices")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(RT "Child labor")
(RT "Children")
(RT "Vocational education")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000423")
(TNR "tgm000422"))


(CONCEPT
(NON-DESCRIPTOR "Appropriations")
(USE "Economic policy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000424")
(TNR "tgm000423"))


(CONCEPT
(DESCRIPTOR "Apricot trees")
(BT "Fruit trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000425")
(TNR "tgm000424"))


(CONCEPT
(DESCRIPTOR "Aprons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Clothing & dress")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000426")
(TNR "tgm000425"))


(CONCEPT
(DESCRIPTOR "Apses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Building divisions")
(RT "Basilicas")
(RT "Churches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000427")
(TNR "tgm000426"))


(CONCEPT
(NON-DESCRIPTOR "Aquaducts")
(USE "Aqueducts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000428")
(TNR "tgm000427"))


(CONCEPT
(DESCRIPTOR "Aquariums")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Exhibition facilities")
(RT "Aquatic animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000429")
(TNR "tgm000428"))


(CONCEPT
(DESCRIPTOR "Aquatic animals")
(GEO-FACET ":COUNTRY :STATE")
(SN "For animals that live entirely in the water.")
(UF "Fauna, Marine")
(UF "Marine animals")
(UF "Marine life")
(UF "Ocean life")
(UF "Sea animals")
(UF "Sea life")
(UF "Water animals")
(BT "Animals")
(NT "Corals")
(NT "Dolphins")
(NT "Fish")
(NT "Jellyfishes")
(NT "Octopuses")
(NT "Sea anemones")
(NT "Shellfish")
(NT "Sponges")
(NT "Squids")
(NT "Starfishes")
(NT "Walruses")
(NT "Whales")
(RT "Amphibians")
(RT "Aquariums")
(RT "Sea otters")
(RT "Seas")
(RT "Shells (Animal)")
(RT "Tide pools")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000430")
(TNR "tgm000429"))


(CONCEPT
(NON-DESCRIPTOR "Aquatic gardens")
(USE "Water gardens")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000431")
(TNR "tgm000430"))


(CONCEPT
(DESCRIPTOR "Aquatic plants")
(BT "Plants")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012051"))


(CONCEPT
(DESCRIPTOR "Aquatic sports")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Water sports")
(BT "Sports")
(NT "Logrolling (Aquatic sports)")
(NT "Shooting rapids")
(NT "Surfing")
(NT "Water skiing")
(RT "Diving")
(RT "Sailing")
(RT "Swimming")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000432")
(TNR "tgm000431"))


(CONCEPT
(DESCRIPTOR "Aquatints")
(BT "Intaglio prints")
(NT "Sugar-lift aquatints")
(RT "Etchings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000043")
(FCNlctgm "lctgm000433")
(TNR "tgm000432"))


(CONCEPT
(DESCRIPTOR "Aqueducts")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Structures for conveying a canal over a river or hollow.")
(UF "Acqueducts")
(UF "Aquaducts")
(UF "Conduits, Water")
(UF "Water conduits")
(BT "Hydraulic facilities")
(RT "Bridges")
(RT "Canals")
(RT "Flumes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000434")
(TNR "tgm000433"))


(CONCEPT
(NON-DESCRIPTOR "Arab-Jewish relations")
(USE "Jewish-Arab relations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000435")
(TNR "tgm000434"))


(CONCEPT
(NON-DESCRIPTOR "Arachnida")
(USE "Arachnids")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000436")
(TNR "tgm000435"))


(CONCEPT
(DESCRIPTOR "Arachnids")
(UF "Arachnida")
(BT "Animals")
(NT "Scorpions")
(NT "Spiders")
(RT "Insects")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000437")
(TNR "tgm000436"))


(CONCEPT
(NON-DESCRIPTOR "Arbitration of industrial disputes")
(USE "Industrial arbitration")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000438")
(TNR "tgm000437"))


(CONCEPT
(NON-DESCRIPTOR "Arboretums")
(USE "Botanical gardens")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000439")
(TNR "tgm000438"))


(CONCEPT
(DESCRIPTOR "Arbors (Bowers)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Leafy shelters of boughs, vines, etc.")
(UF "Bowers")
(BT "Landscape architecture facilities")
(NT "Pergolas")
(NT "Trellises")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000440")
(TNR "tgm000439"))


(CONCEPT
(DESCRIPTOR "Arcades (Architectural components)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on series of arches. :SEARCH-SUBDIVISION ARCADES (SHOPPING FACILITIES) for covered passageways or avenues along which are located rows of shops.")
(BT "Architectural elements")
(RT "Arcades (Shopping facilities)")
(RT "Arches")
(RT "Loggias")
(RT "Walls")
(CN "Used in a note under ARCADES (SHOPPING FACILITIES).")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000441")
(TNR "tgm000440"))


(CONCEPT
(DESCRIPTOR "Arcades (Shopping facilities)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For covered passageways or avenues along which are located rows of shops.  :SEARCH-SUBDIVISION ARCADES (ARCHITECTURAL COMPONENTS) for images that focus on series of arches.")
(UF "Shopping arcades")
(BT "Mercantile facilities")
(RT "Arcades (Architectural components)")
(RT "Shopping centers")
(CN "Used in a note under ARCADES (ARCHITECTURAL COMPONENTS).")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000442")
(TNR "tgm000441"))


(CONCEPT
(NON-DESCRIPTOR "Arcades, Penny")
(USE "Penny arcades")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000443")
(TNR "tgm000442"))


(CONCEPT
(NON-DESCRIPTOR "Arch blocks")
(USE "Voussoirs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000444")
(TNR "tgm000443"))


(CONCEPT
(DESCRIPTOR "Archaeological sites")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For ancient structures still largely intact and remains of ancient structures; also includes active excavations. :SEARCH-SUBDIVISION ANTIQUITIES for relics (coins, etc.) of ancient times. :SEARCH-SUBDIVISION RUINS for remains of structures not of ancient times and under ABANDONED BUILDINGS for vacant, possibly dilapidated buildings. :SEARCH-SUBDIVISION --ANTIQUITIES & ARCHAEOLOGICAL SITES :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A].")
(UF "Excavation sites")
(BT "Historic sites")
(RT "Antiquities")
(RT "Archaeology")
(RT "Cliff dwellings")
(RT "Earthworks (Archaeology)")
(RT "Ruins")
(RT "Trilithons")
(CN "Used in a note under ANTIQUITIES and in a note under RUINS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000445")
(TNR "tgm000444"))


(CONCEPT
(DESCRIPTOR "Archaeology")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of archaeology in general and the activities of archaeologists.")
(BT "Science")
(RT "Anthropology")
(RT "Antiquities")
(RT "Archaeological sites")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000446")
(TNR "tgm000445"))


(CONCEPT
(NON-DESCRIPTOR "Archbishops")
(USE "Bishops")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000447")
(TNR "tgm000446"))


(CONCEPT
(DESCRIPTOR "Archery")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Shooting")
(BT "Sports")
(RT "Arrows")
(RT "Bows (Archery)")
(RT "Crossbows")
(RT "Martial arts")
(RT "Targets (Sports)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000448")
(TNR "tgm000447"))


(CONCEPT
(DESCRIPTOR "Arches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Architectural elements")
(NT "Proscenium arches")
(RT "Arcades (Architectural components)")
(RT "Memorial arches")
(RT "Tympana")
(RT "Voussoirs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000449")
(TNR "tgm000448"))


(CONCEPT
(NON-DESCRIPTOR "Arches, Rock")
(USE "Rock formations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000450")
(TNR "tgm000449"))


(CONCEPT
(NON-DESCRIPTOR "Archipelagoes")
(USE "Islands")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000451")
(TNR "tgm000450"))


(CONCEPT
(DESCRIPTOR "Architects")
(BT "People")
(RT "Architects' offices")
(RT "Architecture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000452")
(TNR "tgm000451"))


(CONCEPT
(DESCRIPTOR "Architects' offices")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Architectural offices")
(UF "Architectural studios")
(BT "Service industry facilities")
(RT "Architects")
(RT "Offices")
(HN "Changed 1/1993 from ARCHITECTURAL OFFICES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000453")
(TNR "tgm000452"))


(CONCEPT
(DESCRIPTOR "Architectural & site components")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Elements that, together, contribute to the make-up and appearance of structures.")
(BT "Built environment")
(NT "Architectural elements")
(NT "Building divisions")
(NT "Building systems")
(NT "Site elements")
(RT "Architecture")
(RT "Circulation (Architecture)")
(RT "Facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000469")
(TNR "tgm000468"))


(CONCEPT
(DESCRIPTOR "Architectural decorations & ornaments")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Motifs, Architectural")
(UF "Ornaments, Architectural")
(BT "Architectural elements")
(NT "Acanthi")
(NT "Acorn decorations")
(NT "Anthemia")
(NT "Architectural sculpture")
(NT "Bosses (Architecture)")
(NT "Chimneypieces")
(NT "Festoons")
(NT "Friezes (Ornamental bands)")
(NT "Grotesques")
(NT "Medallions (Ornament areas)")
(NT "Mosaics")
(NT "Quatrefoils")
(NT "Rosettes")
(NT "Trophies (Architectural ornaments)")
(RT "Decorations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000454")
(TNR "tgm000453"))


(CONCEPT
(NON-DESCRIPTOR "Architectural details")
(USE "Architectural elements")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000455")
(TNR "tgm000454"))


(CONCEPT
(DESCRIPTOR "Architectural drawings")
(SN "Graphic delineations made for the design and construction (or documentation of design and construction) of sites, structures, details, fixtures, furnishings, and decorations, as well as other objects designed by an architect or architectural office.")
(UF "Drawings, Architectural")
(BT "Design drawings")
(CN "Also index under terms that express the type of projection or purpose, listed under PROJECTIONS and DESIGN DRAWINGS.  Used in a note under ENGINEERING DRAWINGS, LANDSCAPE ARCHITECTURE DRAWINGS, and NAVAL ARCHITECTURE DRAWINGS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000044")
(FCNlctgm "lctgm000456")
(TNR "tgm000455"))


(CONCEPT
(DESCRIPTOR "Architectural education")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Education")
(RT "Architecture")
(CN ":DOUBLE-INDEX EDUCATIONAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000457")
(TNR "tgm000456"))


(CONCEPT
(DESCRIPTOR "Architectural elements")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Individual parts of a structure that play a functional or decorative role.")
(UF "Architectural details")
(UF "Details, Architectural")
(BT "Architectural & site components")
(NT "Arcades (Architectural components)")
(NT "Arches")
(NT "Architectural decorations & ornaments")
(NT "Architectural orders")
(NT "Architraves")
(NT "Awnings")
(NT "Balusters")
(NT "Balustrades")
(NT "Batteries (Weaponry)")
(NT "Battlements")
(NT "Beams")
(NT "Buttresses")
(NT "Capitals (Columns)")
(NT "Cartouches (Architecture)")
(NT "Caryatids")
(NT "Catafalques")
(NT "Ceilings")
(NT "Chair rails")
(NT "Chimneypieces")
(NT "Chimneys")
(NT "Coalholes")
(NT "Coffers (Ceilings)")
(NT "Colonnades")
(NT "Columns")
(NT "Consoles")
(NT "Copings")
(NT "Cornerstones")
(NT "Cornices")
(NT "Courses (Wall components)")
(NT "Cupolas")
(NT "Domes")
(NT "Doors & doorways")
(NT "Dormers")
(NT "Drums (Domes)")
(NT "Entablatures")
(NT "Finials")
(NT "Fireplaces")
(NT "Floors")
(NT "Flying buttresses")
(NT "Friezes (Entablature components)")
(NT "Gables")
(NT "Gargoyles")
(NT "Grilles")
(NT "Lanterns (Architecture)")
(NT "Light courts")
(NT "Lintels")
(NT "Locks (Hydraulic engineering)")
(NT "Mantels")
(NT "Moats")
(NT "Moldings")
(NT "Newels")
(NT "Niches")
(NT "Ovens")
(NT "Overmantels")
(NT "Paneling")
(NT "Parapets")
(NT "Pedestals")
(NT "Pediments")
(NT "Pilasters")
(NT "Plasterwork")
(NT "Podiums")
(NT "Pylons (Bridges)")
(NT "Quoins")
(NT "Rafters")
(NT "Railings")
(NT "Religious architectural elements")
(NT "Roofs")
(NT "Roundels")
(NT "Shutters")
(NT "Spandrels")
(NT "Spires")
(NT "Spolia")
(NT "Stairways")
(NT "Steeples")
(NT "Structural systems")
(NT "Trilithons")
(NT "Trusses")
(NT "Turnstiles")
(NT "Tympana")
(NT "Vaults (Architecture)")
(NT "Voussoirs")
(NT "Wainscoting")
(NT "Walls")
(NT "Weather vanes")
(NT "Window boxes")
(NT "Window seats")
(NT "Windows")
(NT "Woodwork")
(RT "Architectural mirrors")
(RT "Mirrors")
(RT "Screens")
(RT "Towers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000458")
(TNR "tgm000457"))


(CONCEPT
(NON-DESCRIPTOR "Architectural fantasies")
(USE "Fantastic architecture")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000459")
(TNR "tgm000458"))


(CONCEPT
(DESCRIPTOR "Architectural follies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Eye catchers")
(UF "Follies, Architectural")
(BT "Landscape architecture facilities")
(RT "Mimetic buildings")
(RT "Recycled structures")
(RT "Visionary architecture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000460")
(TNR "tgm000459"))


(CONCEPT
(DESCRIPTOR "Architectural mirrors")
(BT "Mirrors")
(RT "Architectural elements")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000461")
(TNR "tgm000460"))


(CONCEPT
(DESCRIPTOR "Architectural models")
(SN "Miniature relief or three-dimensional representations in scale of structures or parts of structures made for the purpose of showing the result of actual architectural construction plans. :SEARCH-SUBDIVISION BUILDING MODELS for miniature representations of real or imaginary buildings. :SEARCH-SUBDIVISION MODEL HOUSES for full-scale representations of houses planned to be constructed.")
(UF "Design models")
(BT "Models")
(RT "Building models")
(RT "Competition entries")
(RT "Construction industry")
(CN "Used in a note under BUILDING MODELS and MODEL HOUSES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000462")
(TNR "tgm000461"))


(CONCEPT
(NON-DESCRIPTOR "Architectural offices")
(USE "Architects' offices")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000463")
(TNR "tgm000462"))


(CONCEPT
(DESCRIPTOR "Architectural orders")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "In classical architecture, particular styles of columns with their entablatures having standardized details.")
(UF "Orders, Architectural")
(BT "Architectural elements")
(NT "Corinthian order")
(NT "Doric order")
(NT "Ionic order")
(NT "Tuscan order")
(RT "Capitals (Columns)")
(RT "Columns")
(RT "Entablatures")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000464")
(TNR "tgm000463"))


(CONCEPT
(DESCRIPTOR "Architectural photographs")
(SN "Photographs made to record a structure for architects, architectural historians, and others who need clear representations of such aspects as construction phases, exteriors, or interiors. Not meant for every photo of a structure.")
(BT "Photographs")
(NT "Progress photographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000045")
(FCNlctgm "lctgm000465")
(TNR "tgm000464"))


(CONCEPT
(NON-DESCRIPTOR "Architectural polychromy")
(USE "Polychromy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000466")
(TNR "tgm000465"))


(CONCEPT
(DESCRIPTOR "Architectural sculpture")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Sculpture that is integral to a structure.")
(BT "Architectural decorations & ornaments")
(BT "Sculpture")
(RT "Caryatids")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000467")
(TNR "tgm000466"))


(CONCEPT
(NON-DESCRIPTOR "Architectural studios")
(USE "Architects' offices")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012050"))


(CONCEPT
(NON-DESCRIPTOR "Architectural terracotta")
(USE "Terra-cotta")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000468")
(TNR "tgm000467"))


(CONCEPT
(DESCRIPTOR "Architecture")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of architecture (style, design, etc.) in general and the activities of architects. :SEARCH-SUBDIVISION FACILITIES - or NTs - and ARCHITECTURAL & SITE COMPONENTS for images that focus on structures  and sites or elements thereof, under CONSTRUCTION for the process of building, and under CONSTRUCTION INDUSTRY for the construction business.")
(BT "Art")
(NT "Fantastic architecture")
(NT "Rock-cut architecture")
(NT "Visionary architecture")
(RT "Architects")
(RT "Architectural & site components")
(RT "Architectural education")
(RT "Facilities")
(RT "Unbuilt projects")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000470")
(TNR "tgm000469"))


(CONCEPT
(DESCRIPTOR "Architraves")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "The lowermost elements of a classical entablature and similar elements when carried around doorways and openings.")
(UF "Epistyles")
(BT "Architectural elements")
(RT "Entablatures")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000471")
(TNR "tgm000470"))


(CONCEPT
(DESCRIPTOR "Archives")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Depositories")
(UF "Manuscript repositories")
(UF "Record repositories")
(UF "Repositories")
(BT "Cultural facilities")
(BT "Storage facilities")
(RT "Government facilities")
(RT "Libraries")
(RT "Recording & registration")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000472")
(TNR "tgm000471"))


(CONCEPT
(NON-DESCRIPTOR "Argot")
(USE "Slang")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000473")
(TNR "tgm000472"))


(CONCEPT
(NON-DESCRIPTOR "Arguments")
(USE "Debates")
(USE "Quarreling")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000474")
(TNR "tgm000473"))


(CONCEPT
(NON-DESCRIPTOR "Aristocracy")
(USE "Upper class")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000475")
(TNR "tgm000474"))


(CONCEPT
(DESCRIPTOR "Aristotypes")
(SN "Photographic prints made on various non-albumen papers. The trade name became a general term for prints made on collodion silver chloride printing-out papers (introduced in the 1860s) and was later applied to gelatin silver chloride papers (introduced in the 1880s).")
(BT "Collodion printing-out paper prints")
(BT "Gelatin silver printing-out paper prints")
(HN "Changed 6/94. Formerly, ARISTOTYPES may have been indexed as COLLODION PRINTING-OUT PAPER PRINTS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000046")
(FCNlctgm "lctgm000476")
(TNR "tgm000475"))


(CONCEPT
(NON-DESCRIPTOR "Arithmetic")
(USE "Mathematics")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000477")
(TNR "tgm000476"))


(CONCEPT
(DESCRIPTOR "Armadillos")
(GEO-FACET ":COUNTRY :STATE")
(BT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000478")
(TNR "tgm000477"))


(CONCEPT
(NON-DESCRIPTOR "Armament")
(USE "Arms & armament")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000479")
(TNR "tgm000478"))


(CONCEPT
(NON-DESCRIPTOR "Armed forces")
(USE "Military organizations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000480")
(TNR "tgm000479"))


(CONCEPT
(DESCRIPTOR "Armies")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Military organizations")
(NT "Artillery (Troops)")
(NT "Cavalry")
(NT "Infantry")
(RT "Draft")
(RT "Troop movements")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000481")
(TNR "tgm000480"))


(CONCEPT
(DESCRIPTOR "Armistices")
(SN "Temporary suspensions of hostilities by agreement between opponents. :SEARCH-SUBDIVISIONs --ARMISTICES and --PEACE :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(UF "Ceasefires")
(UF "Truces")
(BT "Warfare")
(RT "Campaigns & battles")
(RT "Peace")
(RT "Peace negotiations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000482")
(TNR "tgm000481"))


(CONCEPT
(DESCRIPTOR "Armor")
(BT "Arms & armament")
(BT "Clothing & dress")
(NT "Shields")
(RT "Armorers")
(RT "Helmets")
(RT "Knights")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000483")
(TNR "tgm000482"))


(CONCEPT
(DESCRIPTOR "Armored trains")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Trains with protective covering, usually steel plates. Includes exteriors and interiors.")
(BT "Armored vehicles")
(BT "Railroad cars")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000484")
(TNR "tgm000483"))


(CONCEPT
(DESCRIPTOR "Armored vehicle industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Ordnance industry")
(BT "Transportation industry")
(RT "Armored vehicles")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES  - or NTs - for images that focus on facilties.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000485")
(TNR "tgm000484"))


(CONCEPT
(DESCRIPTOR "Armored vehicles")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Vehicles with protective covering, usually steel plates.")
(BT "Vehicles")
(NT "Armored trains")
(NT "Armored vessels")
(NT "Tanks (Military science)")
(RT "Armored vehicle industry")
(RT "Arms & armament")
(RT "Military art & science")
(RT "Military vehicles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000486")
(TNR "tgm000485"))


(CONCEPT
(DESCRIPTOR "Armored vessels")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "For the first armored warships built during the revolution in naval architecture in the second half of the 19th century.")
(UF "Broadsides (Warships)")
(UF "Casements")
(UF "Iron-clad vessels")
(UF "Ironclads")
(BT "Armored vehicles")
(BT "Warships")
(NT "Turret ships")
(RT "Floating batteries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000487")
(TNR "tgm000486"))


(CONCEPT
(DESCRIPTOR "Armorers")
(BT "People associated with manual labor")
(RT "Armor")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000488")
(TNR "tgm000487"))


(CONCEPT
(NON-DESCRIPTOR "Armorial bearings")
(USE "Coats of arms")
(FUN "Formerly TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000047")
(TNR "tgm000488"))


(CONCEPT
(DESCRIPTOR "Armorial bookplates")
(SN "Book plates bearing such heraldic devices as coats of arms.")
(UF "Heraldic bookplates")
(BT "Bookplates")
(RT "Coats of arms")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000048")
(FCNlctgm "lctgm000489")
(TNR "tgm000489"))


(CONCEPT
(DESCRIPTOR "Armories")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Buildings used for military training or the storage and manufacture of military equipment or weapons.")
(UF "Arsenals")
(BT "Military facilities")
(RT "Arms & armament")
(RT "Military depots")
(RT "Ordnance industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000490")
(TNR "tgm000490"))


(CONCEPT
(DESCRIPTOR "Arms & armament")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Armament")
(UF "Ordnance")
(UF "Weapons")
(BT "Equipment")
(NT "Ammunition")
(NT "Antipersonnel weapons")
(NT "Armor")
(NT "Artillery (Weaponry)")
(NT "Battering rams")
(NT "Bayonets")
(NT "Bombs")
(NT "Coup sticks")
(NT "Crossbows")
(NT "Daggers & swords")
(NT "Firearms")
(NT "Flamethrowers")
(NT "Grenades")
(NT "Gun turrets")
(NT "Mines (Warfare)")
(NT "Missiles")
(NT "Nightsticks")
(NT "Nuclear weapons")
(NT "Spears")
(NT "Throwing sticks")
(NT "Torpedoes")
(RT "Armored vehicles")
(RT "Armories")
(RT "Arms control")
(RT "Arms race")
(RT "Arrowheads")
(RT "Arrows")
(RT "Axes")
(RT "Bows (Archery)")
(RT "Chevaux-de-frise")
(RT "Explosives")
(RT "Fishing & hunting gear")
(RT "Gunpowder")
(RT "Illegal arms transfers")
(RT "Knives")
(RT "Military art & science")
(RT "Ordnance industry")
(RT "Powder kegs")
(RT "Rearmament")
(RT "Slingshots")
(RT "Tear gas")
(RT "Trophies (Architectural ornaments)")
(RT "Warships")
(CN "Nationality subdivision indicates place where arms were manufactured.  Geographic subdivision indicates place where arms are depicted.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000498")
(TNR "tgm000498"))


(CONCEPT
(DESCRIPTOR "Arms (Anatomy)")
(BT "Body parts")
(RT "Human body")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000497")
(TNR "tgm000497"))


(CONCEPT
(DESCRIPTOR "Arms control")
(SN "For international action placing limitations on armed forces, armaments, and military expenditures. Includes restrictions on the use, levels, or deployment of weapons or forces.")
(UF "Control of arms")
(UF "Disarmament")
(BT "International relations")
(NT "Nuclear nonproliferation")
(RT "Arms & armament")
(RT "Arms race")
(RT "International security")
(RT "Militarism")
(RT "Peace")
(RT "Rearmament")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000491")
(TNR "tgm000491"))


(CONCEPT
(NON-DESCRIPTOR "Arms policy")
(USE "Military policy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000492")
(TNR "tgm000492"))


(CONCEPT
(NON-DESCRIPTOR "Arms production")
(USE "Ordnance industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000493")
(TNR "tgm000493"))


(CONCEPT
(DESCRIPTOR "Arms race")
(SN "For reciprocal build-up in the quality or quantity of the military power of two opponents, caused by each striving to maintain or achieve a desired military posture relative to the other.")
(BT "National security")
(RT "Arms & armament")
(RT "Arms control")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000494")
(TNR "tgm000494"))


(CONCEPT
(NON-DESCRIPTOR "Arms smuggling")
(USE "Illegal arms transfers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000495")
(TNR "tgm000495"))


(CONCEPT
(NON-DESCRIPTOR "Arms trafficking")
(USE "Illegal arms transfers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000496")
(TNR "tgm000496"))


(CONCEPT
(NON-DESCRIPTOR "Army jeeps")
(USE "Jeep automobiles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000499")
(TNR "tgm000499"))


(CONCEPT
(NON-DESCRIPTOR "Army schools")
(USE "Military education")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000500")
(TNR "tgm000500"))


(CONCEPT
(DESCRIPTOR "Army-Navy stores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Military surplus stores")
(UF "Surplus stores, Military")
(UF "War surplus stores")
(BT "Stores & shops")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000501")
(TNR "tgm000501"))


(CONCEPT
(NON-DESCRIPTOR "Around the world voyages")
(USE "Voyages around the world")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000502")
(TNR "tgm000502"))


(CONCEPT
(NON-DESCRIPTOR "Around-the-world flights")
(USE "Flights around the world")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000503")
(TNR "tgm000503"))


(CONCEPT
(NON-DESCRIPTOR "Arrests")
(USE "Law enforcement")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000504")
(TNR "tgm000504"))


(CONCEPT
(DESCRIPTOR "Arrivals & departures")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Departures")
(UF "Landings (Arrivals)")
(UF "Leave-takings")
(BT "Activities")
(NT "Homecomings")
(RT "Emigration & immigration")
(RT "Farewells")
(RT "Internal migration")
(RT "Salutations")
(RT "Travel")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000505")
(TNR "tgm000505"))


(CONCEPT
(DESCRIPTOR "Arrowheads")
(BT "Equipment")
(RT "Arms & armament")
(RT "Arrows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000506")
(TNR "tgm000506"))


(CONCEPT
(DESCRIPTOR "Arrows")
(BT "Equipment")
(RT "Archery")
(RT "Arms & armament")
(RT "Arrowheads")
(RT "Bows (Archery)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000507")
(TNR "tgm000507"))


(CONCEPT
(DESCRIPTOR "Arroyos")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Land")
(RT "Streams")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000508")
(TNR "tgm000508"))


(CONCEPT
(NON-DESCRIPTOR "Arsenals")
(USE "Armories")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000509")
(TNR "tgm000509"))


(CONCEPT
(DESCRIPTOR "Arson")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Crimes")
(RT "Fires")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000510")
(TNR "tgm000510"))


(CONCEPT
(DESCRIPTOR "Art")
(SN ":SEARCH-SUBDIVISION --ARTS & CRAFTS :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A].")
(BT "Disciplines")
(NT "Architecture")
(NT "Dance")
(NT "Decorative arts")
(NT "Decoupage")
(NT "Design")
(NT "Drawing")
(NT "Modeling (Sculpture)")
(NT "Murals")
(NT "Nose art")
(NT "Origami")
(NT "Painting")
(NT "Performance art")
(NT "Printmaking")
(NT "Rock art")
(NT "Sculpture")
(NT "Stained glass")
(NT "Textile art")
(RT "Altarpieces")
(RT "Art auctions")
(RT "Art clubs")
(RT "Art collectors")
(RT "Art dealers")
(RT "Art education")
(RT "Art exhibitions")
(RT "Art festivals")
(RT "Art objects")
(RT "Art thefts")
(RT "Artists")
(RT "Artists' materials")
(RT "Calligraphy")
(RT "Graffiti")
(RT "Sandpaintings")
(RT "Surrealism")
(RT "Textures")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000511")
(TNR "tgm000511"))


(CONCEPT
(DESCRIPTOR "Art auctions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Painting auctions")
(BT "Auctions")
(RT "Art")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000512")
(TNR "tgm000512"))


(CONCEPT
(NON-DESCRIPTOR "Art by children")
(USE "Children's art")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000049")
(FCNlctgm "lctgm000513")
(TNR "tgm000513"))


(CONCEPT
(DESCRIPTOR "Art clubs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Art societies")
(BT "Clubs")
(RT "Art")
(RT "Camera clubs")
(CN ":DOUBLE-INDEX ORGANIZATIONS' FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000514")
(TNR "tgm000514"))


(CONCEPT
(NON-DESCRIPTOR "Art collections, Private")
(USE "Private art collections")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000515")
(TNR "tgm000515"))


(CONCEPT
(DESCRIPTOR "Art collectors")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Collectors")
(RT "Art")
(RT "Art dealers")
(RT "Private art collections")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000516")
(TNR "tgm000516"))


(CONCEPT
(NON-DESCRIPTOR "Art colonies")
(USE "Artist colonies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000517")
(TNR "tgm000517"))


(CONCEPT
(NON-DESCRIPTOR "Art critics")
(USE "Critics")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000518")
(TNR "tgm000518"))


(CONCEPT
(DESCRIPTOR "Art dealers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Dealers, Art")
(BT "People associated with commercial activities")
(RT "Art")
(RT "Art collectors")
(RT "Commercial art galleries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000519")
(TNR "tgm000519"))


(CONCEPT
(DESCRIPTOR "Art education")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Art schools")
(BT "Education")
(RT "Art")
(CN ":DOUBLE-INDEX EDUCATIONAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000520")
(TNR "tgm000520"))


(CONCEPT
(NON-DESCRIPTOR "Art exhibition posters")
(USE "Exhibition posters")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000050")
(FCNlctgm "lctgm000521")
(TNR "tgm000521"))


(CONCEPT
(DESCRIPTOR "Art exhibitions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities, structures, and sites.")
(BT "Exhibitions")
(RT "Art")
(RT "Photography")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000522")
(TNR "tgm000522"))


(CONCEPT
(DESCRIPTOR "Art festivals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Arts festivals")
(BT "Festivals")
(RT "Art")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000523")
(TNR "tgm000523"))


(CONCEPT
(NON-DESCRIPTOR "Art galleries, Commercial")
(USE "Commercial art galleries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000524")
(TNR "tgm000524"))


(CONCEPT
(NON-DESCRIPTOR "Art materials")
(USE "Artists' materials")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000525")
(TNR "tgm000525"))


(CONCEPT
(DESCRIPTOR "Art objects")
(UF "Bric-a-brac")
(UF "Objects, Art")
(BT "Objects")
(NT "Cave drawings")
(NT "Jade art objects")
(RT "Art")
(RT "Jewelry")
(RT "Religious articles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000526")
(TNR "tgm000526"))


(CONCEPT
(DESCRIPTOR "Art reproductions")
(SN "Commercially published, mechanically printed copies of individual paintings, prints, drawings, and other two-dimensional works of art.")
(BT "Reproductions")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000051")
(FCNlctgm "lctgm000527")
(TNR "tgm000527"))


(CONCEPT
(NON-DESCRIPTOR "Art schools")
(USE "Art education")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000528")
(TNR "tgm000528"))


(CONCEPT
(NON-DESCRIPTOR "Art societies")
(USE "Art clubs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000529")
(TNR "tgm000529"))


(CONCEPT
(NON-DESCRIPTOR "Art supplies")
(USE "Artists' materials")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000530")
(TNR "tgm000530"))


(CONCEPT
(DESCRIPTOR "Art thefts")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Crimes")
(RT "Art")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000532")
(TNR "tgm000531"))


(CONCEPT
(NON-DESCRIPTOR "Art, Performance")
(USE "Performance art")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000559")
(TNR "tgm000558"))


(CONCEPT
(DESCRIPTOR "Artesian wells")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Wells")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000533")
(TNR "tgm000532"))


(CONCEPT
(DESCRIPTOR "Arthritis")
(BT "Diseases")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012049"))


(CONCEPT
(DESCRIPTOR "Artichokes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Plants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000534")
(TNR "tgm000533"))


(CONCEPT
(NON-DESCRIPTOR "Artificial butter")
(USE "Margarine")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000535")
(TNR "tgm000534"))


(CONCEPT
(DESCRIPTOR "Artificial eyes")
(BT "Medical equipment & supplies")
(RT "Eyes")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012077"))


(CONCEPT
(DESCRIPTOR "Artificial flower industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(RT "Artificial flowers")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000536")
(TNR "tgm000535"))


(CONCEPT
(DESCRIPTOR "Artificial flowers")
(BT "Artificial plants")
(BT "Decorations")
(RT "Artificial flower industry")
(RT "Flowers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000537")
(TNR "tgm000536"))


(CONCEPT
(DESCRIPTOR "Artificial limbs")
(UF "Prosthetics")
(BT "Medical equipment & supplies")
(NT "Peg legs")
(RT "Amputees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000538")
(TNR "tgm000537"))


(CONCEPT
(DESCRIPTOR "Artificial plants")
(BT "Decorations")
(NT "Artificial flowers")
(RT "Plants")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012076"))


(CONCEPT
(DESCRIPTOR "Artificial pollination")
(UF "Pollination, Artificial")
(BT "Horticulture")
(RT "Biology")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000539")
(TNR "tgm000538"))


(CONCEPT
(DESCRIPTOR "Artificial respiration")
(BT "Lifesaving")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000540")
(TNR "tgm000539"))


(CONCEPT
(DESCRIPTOR "Artificial rock formations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Monuments & memorials")
(NT "Cairns")
(RT "Boulders")
(RT "Rock formations")
(RT "Rocks")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000541")
(TNR "tgm000540"))


(CONCEPT
(DESCRIPTOR "Artificial rubber industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Synthetic rubber industry")
(BT "Chemical industry")
(RT "Rubber industry")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES  - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000542")
(TNR "tgm000541"))


(CONCEPT
(DESCRIPTOR "Artificial satellites")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Earth satellites")
(UF "Orbiting vehicles")
(UF "Satellite vehicles")
(UF "Sputniks")
(BT "Vehicles")
(RT "Space flight")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000543")
(TNR "tgm000542"))


(CONCEPT
(NON-DESCRIPTOR "Artificial weather control")
(USE "Weather control")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000544")
(TNR "tgm000543"))


(CONCEPT
(DESCRIPTOR "Artillery (Troops)")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Armies")
(RT "Artillery (Weaponry)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000545")
(TNR "tgm000544"))


(CONCEPT
(DESCRIPTOR "Artillery (Weaponry)")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "For missile engines and weapons, as well as mounted guns as distinct from small arms.")
(UF "Guns")
(BT "Arms & armament")
(NT "Antiaircraft guns")
(NT "Bazookas")
(NT "Cannons")
(NT "Horse artillery")
(NT "Mortars (Ordnance)")
(NT "Railroad artillery")
(RT "Artillery (Troops)")
(RT "Batteries (Weaponry)")
(RT "Bombs")
(RT "Firearms")
(RT "Gun turrets")
(RT "Quaker guns")
(RT "Rockets")
(HN "Changed 10/1992 from ARTILLERY.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000546")
(TNR "tgm000545"))


(CONCEPT
(DESCRIPTOR "Artisans")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(NT "Potters")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012075"))


(CONCEPT
(DESCRIPTOR "Artist colonies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Art colonies")
(UF "Colonies, Artist")
(BT "Colonies")
(RT "Artists")
(RT "Collective settlements")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000547")
(TNR "tgm000546"))


(CONCEPT
(DESCRIPTOR "Artists")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "People")
(NT "Cartoonists")
(NT "Sculptors")
(NT "War artists")
(RT "Art")
(RT "Artist colonies")
(RT "Artists' models")
(RT "Artists' studios")
(RT "Draftspersons")
(RT "Photographers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000548")
(TNR "tgm000547"))


(CONCEPT
(DESCRIPTOR "Artists' devices")
(SN "Designs, symbols, or mottoes used by artists to identify their creations.")
(UF "Devices, Artists'")
(UF "Symbols, Artists'")
(BT "Emblems")
(RT "Artists' signatures")
(RT "Monograms")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000052")
(FCNlctgm "lctgm000549")
(TNR "tgm000548"))


(CONCEPT
(NON-DESCRIPTOR "Artists' early works")
(USE "Juvenilia")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000053")
(FCNlctgm "lctgm000550")
(TNR "tgm000549"))


(CONCEPT
(DESCRIPTOR "Artists' materials")
(UF "Art materials")
(UF "Art supplies")
(BT "Equipment")
(NT "Palettes")
(RT "Art")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000551")
(TNR "tgm000550"))


(CONCEPT
(DESCRIPTOR "Artists' models")
(UF "Models, Artists'")
(BT "People")
(RT "Artists")
(RT "Fashion models")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000552")
(TNR "tgm000551"))


(CONCEPT
(DESCRIPTOR "Artists' proofs")
(SN "Prints which are accepted for an edition but are unnumbered or numbered separately from the edition and reserved for the artist's use.")
(BT "Prints")
(BT "Proofs")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000054")
(FCNlctgm "lctgm000553")
(TNR "tgm000552"))


(CONCEPT
(DESCRIPTOR "Artists' signatures")
(BT "Autographs")
(RT "Artists' devices")
(RT "Chops")
(FUN "Formerly TGMI term & TGMII term. SN: Signatures of artists, photographers, painters, or printmakers")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000055")
(FCNlctgm "lctgm000554")
(TNR "tgm000553"))


(CONCEPT
(DESCRIPTOR "Artists' studios")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Studios")
(RT "Artists")
(RT "Photographic studios")
(RT "Potteries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000555")
(TNR "tgm000554"))


(CONCEPT
(NON-DESCRIPTOR "Artotypes")
(USE "Collotypes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000056")
(FCNlctgm "lctgm000556")
(TNR "tgm000555"))


(CONCEPT
(DESCRIPTOR "Arts & crafts")
(CN "Used only as a subdivision with :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm000558")
(TNR "tgm000557"))


(CONCEPT
(NON-DESCRIPTOR "Arts festivals")
(USE "Art festivals")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000557")
(TNR "tgm000556"))


(CONCEPT
(DESCRIPTOR "Asbestos mining")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and sites.")
(BT "Mining")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000560")
(TNR "tgm000559"))


(CONCEPT
(DESCRIPTOR "As-built drawings")
(SN "Final set of working drawings incorporating (through revisions or annotations) any changes  of dimensions, materials, form, and method of construction encountered in the completion of the structure or site.")
(UF "Drawings, As-built")
(BT "Working drawings")
(RT "Record drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000057")
(FCNlctgm "lctgm000591")
(TNR "tgm000590"))


(CONCEPT
(DESCRIPTOR "Ash disposal")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Refuse disposal")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000561")
(TNR "tgm000560"))


(CONCEPT
(DESCRIPTOR "Ash trees")
(BT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000562")
(TNR "tgm000561"))


(CONCEPT
(NON-DESCRIPTOR "Asiatic cholera")
(USE "Cholera")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000563")
(TNR "tgm000562"))


(CONCEPT
(DESCRIPTOR "Asparagus")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vegetables")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000564")
(TNR "tgm000563"))


(CONCEPT
(DESCRIPTOR "Asparagus ferns")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Plants")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012074"))


(CONCEPT
(DESCRIPTOR "Aspens")
(BT "Poplars")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012073"))


(CONCEPT
(DESCRIPTOR "Aspergillums")
(SN "A brush or small perforated container with a handle that is used for sprinkling holy water in a liturgical service.")
(BT "Religious articles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000565")
(TNR "tgm000564"))


(CONCEPT
(DESCRIPTOR "Aspersoriums")
(SN "A bucket-like vessel that holds the Holy Water and into which the aspergillum is dipped.")
(BT "Religious articles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000566")
(TNR "tgm000565"))


(CONCEPT
(NON-DESCRIPTOR "Aspirations, Student")
(USE "Student aspirations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000567")
(TNR "tgm000566"))


(CONCEPT
(DESCRIPTOR "Assassinations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For murders of prominent persons. :SEARCH-SUBDIVISIONs --ASSASSINATION or --ASSASSINATION ATTEMPTS :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B].")
(UF "Political murders")
(UF "Political violence")
(UF "Violence, Political")
(BT "Homicides")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000568")
(TNR "tgm000567"))


(CONCEPT
(DESCRIPTOR "Assayers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(RT "Assaying")
(RT "Mining")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000569")
(TNR "tgm000568"))


(CONCEPT
(DESCRIPTOR "Assaying")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Testing")
(RT "Assayers")
(RT "Chemical industry")
(RT "Metallurgical industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000570")
(TNR "tgm000569"))


(CONCEPT
(NON-DESCRIPTOR "Assemblies")
(USE "Legislative bodies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000571")
(TNR "tgm000570"))


(CONCEPT
(NON-DESCRIPTOR "Assembly halls")
(USE "Auditoriums")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000572")
(TNR "tgm000571"))


(CONCEPT
(DESCRIPTOR "Assembly-line methods")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Production-line methods")
(BT "Processes & techniques")
(RT "Industry")
(CN ":DOUBLE-INDEX the industry.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000573")
(TNR "tgm000572"))


(CONCEPT
(NON-DESCRIPTOR "Asses")
(USE "Donkeys")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000574")
(TNR "tgm000573"))


(CONCEPT
(NON-DESCRIPTOR "Assimilation")
(USE "Acculturation")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000575")
(TNR "tgm000574"))


(CONCEPT
(DESCRIPTOR "Assistance")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --ECONOMIC & INDUSTRIAL ASPECTS :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(UF "Aid (Relief)")
(UF "Economic assistance")
(UF "Federal subsidies")
(UF "Government lending")
(UF "Government subsidies")
(UF "Grants")
(UF "Monetary assistance")
(UF "Public welfare")
(UF "Relief (Aid)")
(UF "Subsidies")
(UF "Welfare")
(BT "Activities")
(NT "Clothing relief")
(NT "Disaster relief")
(NT "Domestic economic assistance")
(NT "Farm relief")
(NT "Food relief")
(NT "International agricultural assistance")
(NT "International economic assistance")
(NT "Legal aid")
(NT "Military assistance")
(NT "Rescue work")
(NT "Suicide prevention")
(RT "Asylums")
(RT "Charitable organizations")
(RT "Charity")
(RT "Cooperation")
(RT "Economic policy")
(RT "International organizations")
(RT "Philanthropy")
(RT "Poor boxes")
(RT "Poor persons")
(RT "Public service organizations")
(RT "Scarcity")
(RT "Welfare facilities")
(CN ":SUBDIVIDE-BY geographically by place in which assistance is given. Used in a note under SCARCITY.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000576")
(TNR "tgm000575"))


(CONCEPT
(DESCRIPTOR "Associated objects")
(CN "Used only as a subdivision under :NAMES-OF :NAMED-PERSON [Appendix B].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm000577")
(TNR "tgm000576"))


(CONCEPT
(NON-DESCRIPTOR "Associations")
(USE "Organizations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000578")
(TNR "tgm000577"))


(CONCEPT
(DESCRIPTOR "Asters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Flowers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000579")
(TNR "tgm000578"))


(CONCEPT
(DESCRIPTOR "Astrolabes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Astronomical instruments")
(RT "Astronomical observatories")
(RT "Astronomy")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000580")
(TNR "tgm000579"))


(CONCEPT
(DESCRIPTOR "Astrologers")
(BT "People")
(RT "Astrology")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012072"))


(CONCEPT
(NON-DESCRIPTOR "Astrological signs")
(USE "Zodiac")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000581")
(TNR "tgm000580"))


(CONCEPT
(DESCRIPTOR "Astrology")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of astrology in general and the activities of astrologers.")
(BT "Supernatural practices")
(RT "Astrologers")
(RT "Astronomy")
(RT "Celestial bodies")
(RT "Constellations")
(RT "Divination")
(RT "Fortune telling")
(RT "Prophecy")
(RT "Stargazing")
(RT "Zodiac")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000582")
(TNR "tgm000581"))


(CONCEPT
(DESCRIPTOR "Astronauts")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Cosmonauts")
(BT "People associated with transportation")
(RT "Air pilots")
(RT "Flight crews")
(RT "Space flight")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000583")
(TNR "tgm000582"))


(CONCEPT
(DESCRIPTOR "Astronomers")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Scientists")
(RT "Astronomy")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000584")
(TNR "tgm000583"))


(CONCEPT
(DESCRIPTOR "Astronomical instruments")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Scientific equipment")
(NT "Astrolabes")
(NT "Telescopes")
(RT "Astronomical observatories")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000585")
(TNR "tgm000584"))


(CONCEPT
(NON-DESCRIPTOR "Astronomical observation")
(USE "Astronomy")
(USE "Stargazing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000586")
(TNR "tgm000585"))


(CONCEPT
(DESCRIPTOR "Astronomical observatories")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on facilities. :SEARCH-SUBDIVISION ASTRONOMY for activities.")
(UF "Observatories")
(BT "Research facilities")
(RT "Astrolabes")
(RT "Astronomical instruments")
(RT "Astronomy")
(RT "Planetaria")
(RT "Telescopes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000587")
(TNR "tgm000586"))


(CONCEPT
(DESCRIPTOR "Astronomy")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of astronomy in general and the activities of astronomers.")
(UF "Astronomical observation")
(BT "Science")
(NT "Zodiac")
(RT "Astrolabes")
(RT "Astrology")
(RT "Astronomers")
(RT "Astronomical observatories")
(RT "Celestial bodies")
(RT "Constellations")
(RT "Cosmology")
(RT "Eclipses")
(RT "Galaxies")
(RT "Sextants")
(RT "Stargazing")
(CN "Used in a note under ASTRONOMICAL OBSERVATORIES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000588")
(TNR "tgm000587"))


(CONCEPT
(NON-DESCRIPTOR "Asylum, Right to")
(USE "Right to asylum")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000590")
(TNR "tgm000589"))


(CONCEPT
(DESCRIPTOR "Asylums")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Institutions for the protection or relief of some class of destitute, afflicted, or otherwise unfortunate persons. Includes activities and structures. :SEARCH-SUBDIVISION MENTAL INSTITUTIONS for insane asylums.")
(UF "Benevolent institutions")
(UF "Charitable institutions")
(UF "Homes (Institutions)")
(BT "Welfare facilities")
(RT "Assistance")
(RT "Charitable organizations")
(RT "Foster home care")
(RT "Institutional care")
(RT "Mental institutions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000589")
(TNR "tgm000588"))


(CONCEPT
(DESCRIPTOR "Athenaeums")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Atheneums")
(BT "Cultural facilities")
(RT "Libraries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000592")
(TNR "tgm000591"))


(CONCEPT
(NON-DESCRIPTOR "Atheneums")
(USE "Athenaeums")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000593")
(TNR "tgm000592"))


(CONCEPT
(DESCRIPTOR "Athletes")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Sports teams")
(UF "Teams, Sports")
(BT "People associated with entertainment & sports")
(NT "Baseball players")
(NT "Basketball players")
(NT "Bowlers")
(NT "Boxers (Sports)")
(NT "Canoeists (Sports)")
(NT "Cricket players")
(NT "Fencers")
(NT "Field hockey players")
(NT "Football players")
(NT "Gymnasts")
(NT "Ice hockey players")
(NT "Jockeys")
(NT "Rowers")
(NT "Runners (Sports)")
(NT "Soccer players")
(NT "Softball players")
(NT "Tennis players")
(NT "Wrestlers")
(RT "Athletic clubs")
(RT "Coaching (Athletics)")
(RT "Cyclists")
(RT "Skiers")
(RT "Sports")
(RT "Sports & recreation facilities")
(RT "Sportsmanship")
(RT "Swimmers")
(CN "Geographical subdivision indicates place where team or athletes are based.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000594")
(TNR "tgm000593"))


(CONCEPT
(DESCRIPTOR "Athletic clubs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Sports clubs")
(UF "Turnvereine")
(BT "Clubs")
(RT "Athletes")
(RT "Locker rooms")
(RT "Sports")
(CN ":DOUBLE-INDEX ORGANIZATIONS'  FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000595")
(TNR "tgm000594"))


(CONCEPT
(NON-DESCRIPTOR "Athletic equipment")
(USE "Sporting goods")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000596")
(TNR "tgm000595"))


(CONCEPT
(DESCRIPTOR "Athletic fields")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Sports & recreation facilities")
(RT "Playgrounds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000597")
(TNR "tgm000596"))


(CONCEPT
(DESCRIPTOR "Athletic shoes")
(UF "Sport shoes")
(BT "Shoes")
(NT "Sneakers")
(NT "Tennis shoes")
(RT "Sports")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000598")
(TNR "tgm000597"))


(CONCEPT
(NON-DESCRIPTOR "Athletics")
(USE "Sports")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000599")
(TNR "tgm000598"))


(CONCEPT
(NON-DESCRIPTOR "Atolls")
(USE "Islands")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000600")
(TNR "tgm000599"))


(CONCEPT
(NON-DESCRIPTOR "Atom bombs")
(USE "Atomic bombs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000601")
(TNR "tgm000600"))


(CONCEPT
(NON-DESCRIPTOR "Atom smashers")
(USE "Particle accelerators")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000602")
(TNR "tgm000601"))


(CONCEPT
(NON-DESCRIPTOR "Atomic bombing victims")
(USE "Nuclear weapons victims")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000603")
(TNR "tgm000602"))


(CONCEPT
(DESCRIPTOR "Atomic bombs")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "A-bombs")
(UF "Atom bombs")
(BT "Bombs")
(BT "Nuclear weapons")
(RT "Mushroom clouds")
(RT "Nuclear fallout")
(RT "Nuclear weapons testing")
(RT "Nuclear weapons victims")
(HN "Changed 7/1997 from non-postable term (USE NUCLEAR WEAPONS).")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000604")
(TNR "tgm000603"))


(CONCEPT
(NON-DESCRIPTOR "Atomic medicine")
(USE "Nuclear medicine")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000605")
(TNR "tgm000604"))


(CONCEPT
(NON-DESCRIPTOR "Atomic power")
(USE "Nuclear power")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000606")
(TNR "tgm000605"))


(CONCEPT
(NON-DESCRIPTOR "Atomic submarines")
(USE "Nuclear submarines")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000607")
(TNR "tgm000606"))


(CONCEPT
(NON-DESCRIPTOR "Atomic weapons")
(USE "Nuclear weapons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000608")
(TNR "tgm000607"))


(CONCEPT
(DESCRIPTOR "Atoms")
(BT "Objects")
(RT "Molecular models")
(RT "Nuclear power")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000609")
(TNR "tgm000608"))


(CONCEPT
(DESCRIPTOR "Atriums")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes modern atriums that are enclosed.")
(UF "Interior courtyards")
(BT "Rooms & spaces")
(RT "Courtyards")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000610")
(TNR "tgm000609"))


(CONCEPT
(DESCRIPTOR "Atrocities")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --MORAL & ETHICAL ASPECTS :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C]. :SEARCH-SUBDIVISION --ATROCITIES :USED-WITH the :NAMES-OF :NAME-OF-WAR [Appendix C].")
(BT "Punishment & torture")
(NT "Death marches")
(NT "Forced labor")
(NT "Genocide")
(NT "Massacres")
(RT "Crimes")
(RT "Executions")
(RT "War crimes")
(CN ":SUBDIVIDE-BY :NATIONALITY of those committing the atrocity.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000611")
(TNR "tgm000610"))


(CONCEPT
(NON-DESCRIPTOR "Attacks by animals")
(USE "Animal attacks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000612")
(TNR "tgm000611"))


(CONCEPT
(DESCRIPTOR "Attics")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Garrets")
(BT "Interiors")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000613")
(TNR "tgm000612"))


(CONCEPT
(NON-DESCRIPTOR "Attitudes")
(USE "Mental states")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000614")
(TNR "tgm000613"))


(CONCEPT
(NON-DESCRIPTOR "Attorneys")
(USE "Lawyers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000615")
(TNR "tgm000614"))


(CONCEPT
(NON-DESCRIPTOR "Attorneys general")
(USE "Cabinet officers")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012071"))


(CONCEPT
(DESCRIPTOR "Au pairs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "People who help a family with child care, housework, and other tasks.")
(BT "People")
(RT "Babysitting")
(RT "Children")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000616")
(TNR "tgm000615"))


(CONCEPT
(DESCRIPTOR "Auction catalogs")
(BT "Catalogs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000058")
(FCNlctgm "lctgm000617")
(TNR "tgm000616"))


(CONCEPT
(DESCRIPTOR "Auctioneers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with commercial activities")
(RT "Auctions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000618")
(TNR "tgm000617"))


(CONCEPT
(DESCRIPTOR "Auctions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Commerce")
(NT "Animal auctions")
(NT "Art auctions")
(RT "Auctioneers")
(RT "Slave trade")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000619")
(TNR "tgm000618"))


(CONCEPT
(DESCRIPTOR "Audiences")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Groups or assemblies of listeners.")
(BT "People")
(NT "Motion picture audiences")
(NT "Theater audiences")
(RT "Concerts")
(RT "Crowds")
(RT "Events")
(RT "Spectators")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000620")
(TNR "tgm000619"))


(CONCEPT
(DESCRIPTOR "Audiovisual materials")
(NT "Motion pictures")
(NT "Sound recordings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000621")
(TNR "tgm000620"))


(CONCEPT
(DESCRIPTOR "Auditions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Tryouts")
(BT "Events")
(RT "Actors")
(RT "Actresses")
(RT "Rehearsals")
(RT "Theatrical productions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000622")
(TNR "tgm000621"))


(CONCEPT
(DESCRIPTOR "Auditoriums")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For facilities used for public gatherings. :SEARCH-SUBDIVISION AMPHITHEATERS for flat or gently sloping outdoor areas surrounded by slopes on which spectators can sit.")
(UF "Assembly halls")
(BT "Cultural facilities")
(RT "Concert halls")
(RT "Lecture halls")
(RT "Social & civic facilities")
(RT "Stages (Platforms)")
(RT "Theaters")
(CN "Used in a note under AMPHITHEATERS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000623")
(TNR "tgm000622"))


(CONCEPT
(NON-DESCRIPTOR "Augury")
(USE "Divination")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000624")
(TNR "tgm000623"))


(CONCEPT
(NON-DESCRIPTOR "Auricular confession")
(USE "Confessions")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000625")
(TNR "tgm000624"))


(CONCEPT
(DESCRIPTOR "Auroras")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Northern lights")
(BT "Natural phenomena")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000626")
(TNR "tgm000625"))


(CONCEPT
(DESCRIPTOR "Authors")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Writers")
(BT "People associated with education & communication")
(NT "Dramatists")
(NT "Lyricists")
(NT "Poets")
(RT "Literature")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000627")
(TNR "tgm000626"))


(CONCEPT
(NON-DESCRIPTOR "Authors' rights")
(USE "Copyright")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000628")
(TNR "tgm000627"))


(CONCEPT
(DESCRIPTOR "Autistic children")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Mentally handicapped children")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000629")
(TNR "tgm000628"))


(CONCEPT
(NON-DESCRIPTOR "Auto courts")
(USE "Motels")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000630")
(TNR "tgm000629"))


(CONCEPT
(NON-DESCRIPTOR "Auto mechanics")
(USE "Mechanics (Persons)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000631")
(TNR "tgm000630"))


(CONCEPT
(NON-DESCRIPTOR "Auto parts")
(USE "Automobile equipment & supplies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000632")
(TNR "tgm000631"))


(CONCEPT
(NON-DESCRIPTOR "Auto parts stores")
(USE "Automobile equipment & supplies stores")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000633")
(TNR "tgm000632"))


(CONCEPT
(NON-DESCRIPTOR "Auto shows")
(USE "Automobile shows")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012069"))


(CONCEPT
(NON-DESCRIPTOR "Auto washes")
(USE "Car washes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000634")
(TNR "tgm000633"))


(CONCEPT
(DESCRIPTOR "Autochromes")
(SN "The Lumière brothers began marketing autochromes in 1907, and the color glass transparencies continued to be available into the 1930s.")
(BT "Screen color glass transparencies")
(HN "Changed 5/89.  Formerly, AUTOCHROMES may have been indexed as SCREEN COLOR GLASS PHOTOTRANSPARENCIES.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000059")
(FCNlctgm "lctgm000635")
(TNR "tgm000634"))


(CONCEPT
(DESCRIPTOR "Auto-da-fé sermons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Ceremonies at which judgment was pronounced on those convicted of heresy by the Spanish Inquisition.")
(UF "Autos-da-fé")
(BT "Rites & ceremonies")
(RT "Religious meetings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000672")
(TNR "tgm000671"))


(CONCEPT
(DESCRIPTOR "Autogiros")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Gyroplanes")
(BT "Aircraft")
(RT "Airplanes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000636")
(TNR "tgm000635"))


(CONCEPT
(NON-DESCRIPTOR "Autograph sessions")
(USE "Autographing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000637")
(TNR "tgm000636"))


(CONCEPT
(DESCRIPTOR "Autographing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Autograph sessions")
(UF "Book signings")
(UF "Signing autographs")
(BT "Writing")
(RT "Celebrities")
(RT "Celebrity touring")
(RT "Document signings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000638")
(TNR "tgm000637"))


(CONCEPT
(DESCRIPTOR "Autographs")
(SN ":NAMES-OF people written in their own hand; stamped or printed signatures are not included.")
(BT "Inscriptions")
(NT "Artists' signatures")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000060")
(FCNlctgm "lctgm000639")
(TNR "tgm000638"))


(CONCEPT
(DESCRIPTOR "Autoharps")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Stringed instruments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000640")
(TNR "tgm000639"))


(CONCEPT
(NON-DESCRIPTOR "Automatic data processing equipment")
(USE "Calculators")
(USE "Computers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000641")
(TNR "tgm000640"))


(CONCEPT
(DESCRIPTOR "Automation")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Activities")
(RT "Machinery")
(RT "Mechanical systems")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000642")
(TNR "tgm000641"))


(CONCEPT
(NON-DESCRIPTOR "Automatons")
(USE "Robots")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000643")
(TNR "tgm000642"))


(CONCEPT
(DESCRIPTOR "Automats")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Restaurants")
(RT "Coin operated machines")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000644")
(TNR "tgm000643"))


(CONCEPT
(NON-DESCRIPTOR "Automobile accessories")
(USE "Automobile equipment & supplies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000645")
(TNR "tgm000644"))


(CONCEPT
(DESCRIPTOR "Automobile breakdowns")
(BT "Vehicle maintenance & repair")
(RT "Accidents")
(RT "Automobiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000646")
(TNR "tgm000645"))


(CONCEPT
(DESCRIPTOR "Automobile dealerships")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Dealerships, Automobile")
(UF "Used car lots")
(BT "Business enterprises")
(BT "Mercantile facilities")
(RT "Automobile equipment & supplies stores")
(RT "Automobiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000647")
(TNR "tgm000646"))


(CONCEPT
(DESCRIPTOR "Automobile driving")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Driving, Automobile")
(BT "Transportation")
(NT "Stunt driving")
(RT "Automobiles")
(RT "Drunk driving")
(RT "Parking")
(RT "Recreation")
(RT "Speeding")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000648")
(TNR "tgm000647"))


(CONCEPT
(DESCRIPTOR "Automobile equipment & supplies")
(UF "Auto parts")
(UF "Automobile accessories")
(BT "Equipment")
(NT "Automobile radiator ornaments")
(NT "Windshield wipers")
(RT "Automobile equipment & supplies stores")
(RT "Automobiles")
(RT "Dashboards")
(RT "License plates")
(RT "Steering wheels")
(RT "Windshields")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000649")
(TNR "tgm000648"))


(CONCEPT
(DESCRIPTOR "Automobile equipment & supplies stores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Auto parts stores")
(BT "Stores & shops")
(RT "Automobile dealerships")
(RT "Automobile equipment & supplies")
(RT "Automobile industry")
(RT "Vehicle maintenance & repair")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000650")
(TNR "tgm000649"))


(CONCEPT
(DESCRIPTOR "Automobile industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Transportation industry")
(RT "Automobile equipment & supplies stores")
(RT "Automobile industry unions")
(RT "Automobiles")
(RT "Truck industry")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities. Used in a note under WELDING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000651")
(TNR "tgm000650"))


(CONCEPT
(DESCRIPTOR "Automobile industry strikes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Strikes")
(RT "Automobile industry unions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000652")
(TNR "tgm000651"))


(CONCEPT
(DESCRIPTOR "Automobile industry unions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Labor unions")
(RT "Automobile industry")
(RT "Automobile industry strikes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000653")
(TNR "tgm000652"))


(CONCEPT
(DESCRIPTOR "Automobile inspections")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Inspections")
(RT "Automobiles")
(RT "Safety")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000654")
(TNR "tgm000653"))


(CONCEPT
(NON-DESCRIPTOR "Automobile license plates")
(USE "License plates")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000655")
(TNR "tgm000654"))


(CONCEPT
(NON-DESCRIPTOR "Automobile mechanics")
(USE "Mechanics (Persons)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000656")
(TNR "tgm000655"))


(CONCEPT
(DESCRIPTOR "Automobile racing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Car racing")
(BT "Racing")
(NT "Automobile rallies")
(NT "Drag racing")
(RT "Automobiles")
(RT "Racing automobiles")
(CN "Used in note under AUTOMOBILE RACING DRIVERS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000657")
(TNR "tgm000656"))


(CONCEPT
(DESCRIPTOR "Automobile racing drivers")
(SN "For automobile racing drivers not engaged in the activity of racing. :SEARCH-SUBDIVISION AUTOMOBILE RACING for activities.")
(UF "Drag racers")
(BT "People associated with entertainment & sports")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000658")
(TNR "tgm000657"))


(CONCEPT
(DESCRIPTOR "Automobile radiator ornaments")
(UF "Radiator ornaments")
(BT "Automobile equipment & supplies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000659")
(TNR "tgm000658"))


(CONCEPT
(DESCRIPTOR "Automobile rallies")
(UF "Rallies, Automobile")
(BT "Automobile racing")
(NT "Motorcycle rallies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000660")
(TNR "tgm000659"))


(CONCEPT
(DESCRIPTOR "Automobile repair")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vehicle maintenance & repair")
(RT "Mechanics (Persons)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000661")
(TNR "tgm000660"))


(CONCEPT
(DESCRIPTOR "Automobile service stations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes gasoline pumps which are part of a service station.")
(UF "Commercial garages")
(UF "Filling stations")
(UF "Garages, Commercial")
(UF "Gas stations")
(UF "Service stations")
(BT "Business enterprises")
(BT "Transportation facilities")
(RT "Automobiles")
(RT "Gasoline")
(RT "Gasoline pumps")
(RT "Vehicle maintenance & repair")
(CN "Used in a note under GASOLINE and GASOLINE PUMPS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000662")
(TNR "tgm000661"))


(CONCEPT
(DESCRIPTOR "Automobile shows")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Auto shows")
(UF "Car shows")
(BT "Exhibitions")
(RT "Automobiles")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012068"))


(CONCEPT
(NON-DESCRIPTOR "Automobile tags")
(USE "License plates")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000663")
(TNR "tgm000662"))


(CONCEPT
(DESCRIPTOR "Automobile theft")
(BT "Crimes")
(RT "Automobiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000664")
(TNR "tgm000663"))


(CONCEPT
(DESCRIPTOR "Automobile travel")
(GEO-FACET ":COUNTRY :STATE")
(BT "Travel")
(RT "Sightseers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000665")
(TNR "tgm000664"))


(CONCEPT
(DESCRIPTOR "Automobiles")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Cars")
(BT "Vehicles")
(NT "Convertible automobiles")
(NT "Electric automobiles")
(NT "Experimental automobiles")
(NT "Hot rods")
(NT "Limousines")
(NT "Racing automobiles")
(NT "Sports cars")
(NT "Station wagons")
(NT "Steam automobiles")
(NT "Three wheel automobiles")
(RT "Automobile breakdowns")
(RT "Automobile dealerships")
(RT "Automobile driving")
(RT "Automobile equipment & supplies")
(RT "Automobile industry")
(RT "Automobile inspections")
(RT "Automobile racing")
(RT "Automobile service stations")
(RT "Automobile shows")
(RT "Automobile theft")
(RT "Car washes")
(RT "Chauffeurs")
(RT "Convertiplanes")
(RT "Drive-in restaurants")
(RT "Drive-in theaters")
(RT "Driver education")
(RT "Garages")
(RT "Hearses")
(RT "Jeep automobiles")
(RT "Model cars")
(RT "Motorcades")
(RT "Traffic accidents")
(RT "Trailers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000666")
(TNR "tgm000665"))


(CONCEPT
(NON-DESCRIPTOR "Automobiles, Coaster")
(USE "Coaster cars")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000667")
(TNR "tgm000666"))


(CONCEPT
(DESCRIPTOR "Autonomy")
(GEO-FACET ":COUNTRY :STATE")
(UF "Home rule")
(UF "Independence")
(UF "Self-government")
(BT "Economic & political systems")
(NT "Municipal home rule")
(RT "National liberation movements")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000668")
(TNR "tgm000667"))


(CONCEPT
(NON-DESCRIPTOR "Autos-da-fé")
(USE "Auto-da-fé sermons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000670")
(TNR "tgm000669"))


(CONCEPT
(NON-DESCRIPTOR "Autosuggestion")
(USE "Hypnotism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000669")
(TNR "tgm000668"))


(CONCEPT
(NON-DESCRIPTOR "Autotypes")
(USE "Carbon prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000061")
(FCNlctgm "lctgm000671")
(TNR "tgm000670"))


(CONCEPT
(DESCRIPTOR "Autumn")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Fall")
(BT "Seasons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000673")
(TNR "tgm000672"))


(CONCEPT
(DESCRIPTOR "Avalanches")
(GEO-FACET ":COUNTRY :STATE")
(BT "Landslides")
(RT "Mountains")
(RT "Snow")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000674")
(TNR "tgm000673"))


(CONCEPT
(NON-DESCRIPTOR "Avant des lettres prints")
(USE "Proofs before letters")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000062")
(FCNlctgm "lctgm000675")
(TNR "tgm000674"))


(CONCEPT
(DESCRIPTOR "Avarice")
(UF "Covetousness")
(UF "Greed")
(BT "Mental states")
(RT "Deadly sins")
(RT "Miserliness")
(RT "Wealth")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000676")
(TNR "tgm000675"))


(CONCEPT
(NON-DESCRIPTOR "Avenues")
(USE "Streets")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000677")
(TNR "tgm000676"))


(CONCEPT
(DESCRIPTOR "Aviaries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animal housing")
(RT "Birds")
(RT "Zoos")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000678")
(TNR "tgm000677"))


(CONCEPT
(NON-DESCRIPTOR "Aviation")
(USE "Aeronautics")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000679")
(TNR "tgm000678"))


(CONCEPT
(NON-DESCRIPTOR "Aviation industry")
(USE "Airline industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000680")
(TNR "tgm000679"))


(CONCEPT
(NON-DESCRIPTOR "Aviation mechanics (Persons)")
(USE "Mechanics (Persons)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000681")
(TNR "tgm000680"))


(CONCEPT
(DESCRIPTOR "Aviation mechanics (Science)")
(UF "Mechanics, Aviation (Science)")
(BT "Science")
(RT "Aeronautics")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000682")
(TNR "tgm000681"))


(CONCEPT
(NON-DESCRIPTOR "Aviation personnel")
(USE "Flight crews")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000683")
(TNR "tgm000682"))


(CONCEPT
(NON-DESCRIPTOR "Aviators")
(USE "Air pilots")
(USE "Fighter pilots")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000684")
(TNR "tgm000683"))


(CONCEPT
(DESCRIPTOR "Avocados")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fruit")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000685")
(TNR "tgm000684"))


(CONCEPT
(NON-DESCRIPTOR "Awaking")
(USE "Waking")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000686")
(TNR "tgm000685"))


(CONCEPT
(DESCRIPTOR "Awards")
(UF "Prizes")
(UF "Rewards")
(UF "Rewards & prizes")
(UF "Trophies")
(BT "Objects")
(NT "Military decorations")
(NT "Nobel prizes")
(RT "Contests")
(RT "Medals")
(RT "Rites & ceremonies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000687")
(TNR "tgm000686"))


(CONCEPT
(NON-DESCRIPTOR "Awards of merit")
(USE "Rewards of merit")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000063")
(FCNlctgm "lctgm000688")
(TNR "tgm000687"))


(CONCEPT
(DESCRIPTOR "Awnings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Architectural elements")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000689")
(TNR "tgm000688"))


(CONCEPT
(NON-DESCRIPTOR "AWOL")
(USE "Military deserters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000690")
(TNR "tgm000689"))


(CONCEPT
(DESCRIPTOR "Axes")
(UF "Hatchets")
(BT "Equipment")
(NT "Tomahawks")
(RT "Arms & armament")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000691")
(TNR "tgm000690"))


(CONCEPT
(DESCRIPTOR "Axonometric projections")
(SN "Parallel orthographic projections in which the object or subject is tilted in relation to the
picture plane so that three faces and axes are visible although not in true shape.")
(BT "Projections")
(NT "Isometric projections")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000064")
(FCNlctgm "lctgm000692")
(TNR "tgm000691"))


(CONCEPT
(DESCRIPTOR "Azaleas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Rhododendrons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000693")
(TNR "tgm000692"))


(CONCEPT
(NON-DESCRIPTOR "Babies")
(USE "Infants")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000696")
(TNR "tgm000695"))


(CONCEPT
(DESCRIPTOR "Baboons")
(GEO-FACET ":COUNTRY :STATE")
(BT "Monkeys")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000697")
(TNR "tgm000696"))


(CONCEPT
(DESCRIPTOR "Baby animals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Animal babies")
(UF "Young animals")
(BT "Animals")
(NT "Bear cubs")
(NT "Ducklings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000698")
(TNR "tgm000697"))


(CONCEPT
(DESCRIPTOR "Baby boom generation")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(RT "Intergenerational relations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000699")
(TNR "tgm000698"))


(CONCEPT
(DESCRIPTOR "Baby carriages")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Perambulators")
(BT "Vehicles")
(NT "Strollers (Baby carriages)")
(RT "Infants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000700")
(TNR "tgm000699"))


(CONCEPT
(NON-DESCRIPTOR "Baby sitting")
(USE "Babysitting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000701")
(TNR "tgm000700"))


(CONCEPT
(DESCRIPTOR "Babysitting")
(UF "Baby sitting")
(BT "Activities")
(RT "Au pairs")
(RT "Children")
(RT "Day care")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000702")
(TNR "tgm000701"))


(CONCEPT
(DESCRIPTOR "Bachelors")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Men")
(RT "Marriage")
(RT "Single women")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000703")
(TNR "tgm000702"))


(CONCEPT
(NON-DESCRIPTOR "Back yards")
(USE "Backyards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000704")
(TNR "tgm000703"))


(CONCEPT
(DESCRIPTOR "Backdrops")
(BT "Objects")
(RT "Stage props")
(RT "Studio props")
(HN "Before 1/2008, images may have been indexed under STUDIO PROPS.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000705")
(TNR "tgm000704"))


(CONCEPT
(DESCRIPTOR "Backgammon")
(BT "Board games")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000706")
(TNR "tgm000705"))


(CONCEPT
(DESCRIPTOR "Backpacking")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Hiking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000707")
(TNR "tgm000706"))


(CONCEPT
(DESCRIPTOR "Backs (Anatomy)")
(BT "Body parts")
(RT "Human body")
(RT "Scoliosis")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000708")
(TNR "tgm000707"))


(CONCEPT
(DESCRIPTOR "Backyards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Back yards")
(BT "Sites")
(BT "Yards")
(RT "Alleys")
(RT "Dwellings")
(RT "Gardens")
(RT "Outbuildings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000709")
(TNR "tgm000708"))


(CONCEPT
(DESCRIPTOR "Bacon")
(BT "Meat")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012087"))


(CONCEPT
(DESCRIPTOR "Bacteria")
(UF "Germs")
(UF "Microbes")
(BT "Microorganisms")
(RT "Diseases")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000710")
(TNR "tgm000709"))


(CONCEPT
(NON-DESCRIPTOR "Bacteriological warfare")
(USE "Biological warfare")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000711")
(TNR "tgm000710"))


(CONCEPT
(DESCRIPTOR "Badgers")
(GEO-FACET ":COUNTRY :STATE")
(BT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000712")
(TNR "tgm000711"))


(CONCEPT
(DESCRIPTOR "Badges")
(SN "Devices indicating support of a cause, achievements, or membership in a society or group.
May be printed, photographic, plastic, metal, cloth, or other fabric; usually intended to be worn
on the person.")
(UF "Ribbon badges")
(BT "Ephemera")
(NT "Buttons (Information artifacts)")
(RT "Memorabilia")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000065")
(FCNlctgm "lctgm000713")
(TNR "tgm000712"))


(CONCEPT
(DESCRIPTOR "Badlands")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "An area of irregularly eroded land formations.")
(BT "Land")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012084"))


(CONCEPT
(DESCRIPTOR "Badminton")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Sports")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000714")
(TNR "tgm000713"))


(CONCEPT
(NON-DESCRIPTOR "Baggage")
(USE "Luggage")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000715")
(TNR "tgm000714"))


(CONCEPT
(DESCRIPTOR "Bagpipes")
(SN "Includes the activity of playing bagpipes.")
(BT "Wind instruments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000717")
(TNR "tgm000715"))


(CONCEPT
(DESCRIPTOR "Bags")
(SN "Sacks, usually rectangular in shape and made of paper, plastic, or cloth; often printed with manufacturer's name or advertisement.")
(UF "Sacks")
(BT "Packaging")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000066")
(FCNlctgm "lctgm000718")
(TNR "tgm000716"))


(CONCEPT
(DESCRIPTOR "Bailiffs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Law enforcement officers")
(BT "People")
(RT "Law enforcement")
(RT "Police")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000720")
(TNR "tgm000717"))


(CONCEPT
(DESCRIPTOR "Baked products")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION BAKING for activities.")
(BT "Food")
(NT "Bread")
(NT "Cakes")
(NT "Cookies")
(NT "Crackers")
(NT "Doughnuts")
(NT "Ice cream cones")
(NT "Matzos")
(NT "Pies")
(NT "Pretzels")
(RT "Bakeries")
(RT "Baking")
(RT "Baking powder")
(CN ":SUBDIVIDE-BY location of national or regional association, as appropriate.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000721")
(TNR "tgm000718"))


(CONCEPT
(DESCRIPTOR "Bakeries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on facilities. :SEARCH-SUBDIVISION BAKING for activities.")
(UF "Bakery shops")
(BT "Stores & shops")
(RT "Baked products")
(RT "Baking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000722")
(TNR "tgm000719"))


(CONCEPT
(NON-DESCRIPTOR "Bakery shops")
(USE "Bakeries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000723")
(TNR "tgm000720"))


(CONCEPT
(DESCRIPTOR "Baking")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes both commercial and domestic activities.")
(BT "Cookery")
(RT "Baked products")
(RT "Bakeries")
(RT "Baking powder")
(RT "Ovens")
(RT "Yeast")
(CN "Used in a note under BAKED PRODUCTS and BAKERIES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000724")
(TNR "tgm000721"))


(CONCEPT
(DESCRIPTOR "Baking powder")
(BT "Food")
(RT "Baked products")
(RT "Baking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000725")
(TNR "tgm000722"))


(CONCEPT
(DESCRIPTOR "Balalaikas")
(SN "Includes the activity of playing balalaikas.")
(BT "Stringed instruments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000726")
(TNR "tgm000723"))


(CONCEPT
(NON-DESCRIPTOR "Balance of nature")
(USE "Ecology")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000727")
(TNR "tgm000724"))


(CONCEPT
(DESCRIPTOR "Balconies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For platforms (usually unroofed) that project from the wall of a building, enclosed by a parapet or railing.")
(BT "Rooms & spaces")
(RT "Galleries (Upper level spaces)")
(RT "Loggias")
(RT "Porches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000728")
(TNR "tgm000725"))


(CONCEPT
(NON-DESCRIPTOR "Bald eagles")
(USE "Eagles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000729")
(TNR "tgm000726"))


(CONCEPT
(DESCRIPTOR "Baldness")
(BT "Physical characteristics")
(RT "Hairstyles")
(RT "Scalps")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000730")
(TNR "tgm000727"))


(CONCEPT
(DESCRIPTOR "Ball & chain")
(SN "Symbol of something that severely restricts a person's activity; usually oppressively.")
(BT "Symbols")
(RT "Prisoners")
(RT "Shackles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000733")
(TNR "tgm000730"))


(CONCEPT
(DESCRIPTOR "Ball bearings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Objects")
(RT "Machinery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000731")
(TNR "tgm000728"))


(CONCEPT
(DESCRIPTOR "Ball dresses")
(UF "Balldresses")
(BT "Dresses")
(RT "Ballroom dancing")
(RT "Evening gowns")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000732")
(TNR "tgm000729"))


(CONCEPT
(DESCRIPTOR "Ballads")
(BT "Songs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000734")
(TNR "tgm000731"))


(CONCEPT
(NON-DESCRIPTOR "Balldresses")
(USE "Ball dresses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000735")
(TNR "tgm000732"))


(CONCEPT
(DESCRIPTOR "Ballerinas")
(BT "Ballet dancers")
(BT "Women")
(RT "Ballet")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000736")
(TNR "tgm000733"))


(CONCEPT
(DESCRIPTOR "Ballet")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "For the subject of ballet in general and the activity of  ballet dancing.")
(BT "Dance")
(RT "Ballerinas")
(RT "Ballet dancers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000737")
(TNR "tgm000734"))


(CONCEPT
(DESCRIPTOR "Ballet dancers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Dancers")
(NT "Ballerinas")
(RT "Ballet")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000738")
(TNR "tgm000735"))


(CONCEPT
(NON-DESCRIPTOR "Balloon accidents")
(USE "Ballooning accidents")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000739")
(TNR "tgm000736"))


(CONCEPT
(DESCRIPTOR "Balloon ascensions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Aeronautics")
(RT "Balloons (Aircraft)")
(RT "Events")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000740")
(TNR "tgm000737"))


(CONCEPT
(DESCRIPTOR "Balloon racing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Racing")
(RT "Balloons (Aircraft)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000741")
(TNR "tgm000738"))


(CONCEPT
(NON-DESCRIPTOR "Balloon views")
(USE "Aerial views")
(USE "Bird's-eye views")
(USE "Panoramic views")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000067")
(FCNlctgm "lctgm000742")
(TNR "tgm000739"))


(CONCEPT
(DESCRIPTOR "Ballooning accidents")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Balloon accidents")
(BT "Aircraft accidents")
(RT "Balloons (Aircraft)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000743")
(TNR "tgm000740"))


(CONCEPT
(DESCRIPTOR "Balloonists")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Air pilots")
(RT "Balloons (Aircraft)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000744")
(TNR "tgm000741"))


(CONCEPT
(DESCRIPTOR "Balloons (Aircraft)")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Hot air balloons")
(BT "Aircraft")
(NT "Captive balloons")
(RT "Airships")
(RT "Balloon ascensions")
(RT "Balloon racing")
(RT "Ballooning accidents")
(RT "Balloonists")
(RT "Parachuting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000745")
(TNR "tgm000742"))


(CONCEPT
(DESCRIPTOR "Balloons (Novelties)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For balloons other than vehicles.")
(BT "Festive decorations")
(BT "Toys")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000746")
(TNR "tgm000743"))


(CONCEPT
(DESCRIPTOR "Ballot boxes")
(BT "Boxes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000747")
(TNR "tgm000744"))


(CONCEPT
(NON-DESCRIPTOR "Ballot counting")
(USE "Vote counting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000748")
(TNR "tgm000745"))


(CONCEPT
(NON-DESCRIPTOR "Ballot tabulation")
(USE "Vote counting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000749")
(TNR "tgm000746"))


(CONCEPT
(DESCRIPTOR "Ballots")
(SN "Sheets of paper, cards, or other devices used to cast a vote or announce a slate of candidates.")
(UF "Election tickets")
(BT "Ephemera")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000068")
(FCNlctgm "lctgm000750")
(TNR "tgm000747"))


(CONCEPT
(DESCRIPTOR "Ballroom dancing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For dancing at balls (large and formal assemblies for social dancing).")
(BT "Dance")
(RT "Ball dresses")
(RT "Ballrooms")
(RT "Balls (Parties)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000751")
(TNR "tgm000748"))


(CONCEPT
(DESCRIPTOR "Ballrooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Interiors")
(RT "Ballroom dancing")
(RT "Dance floors")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000752")
(TNR "tgm000749"))


(CONCEPT
(DESCRIPTOR "Balls (Parties)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For formal dances; :SEARCH-SUBDIVISION DANCE PARTIES for less formal dances.")
(UF "Cotillions")
(BT "Dance parties")
(RT "Ballroom dancing")
(CN "Used in a note under DANCE PARTIES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000753")
(TNR "tgm000750"))


(CONCEPT
(DESCRIPTOR "Balls (Sporting goods)")
(BT "Sporting goods")
(NT "Baseballs")
(NT "Billiard balls")
(NT "Bowling balls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000754")
(TNR "tgm000751"))


(CONCEPT
(NON-DESCRIPTOR "Baltic hemp")
(USE "Flax")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000755")
(TNR "tgm000752"))


(CONCEPT
(DESCRIPTOR "Balusters")
(SN "One of a number of short, vertical members used to support a stair handrail or coping.")
(UF "Banisters")
(BT "Architectural elements")
(RT "Balustrades")
(RT "Stairways")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000756")
(TNR "tgm000753"))


(CONCEPT
(DESCRIPTOR "Balustrades")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Architectural elements")
(RT "Balusters")
(RT "Railings")
(RT "Roofs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000757")
(TNR "tgm000754"))


(CONCEPT
(DESCRIPTOR "Bamboo")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Plants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000758")
(TNR "tgm000755"))


(CONCEPT
(DESCRIPTOR "Banana peels")
(BT "Refuse")
(RT "Bananas")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000759")
(TNR "tgm000756"))


(CONCEPT
(DESCRIPTOR "Banana plantations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Plantations")
(RT "Banana plants")
(RT "Bananas")
(CN ":DOUBLE-INDEX HARVESTING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000760")
(TNR "tgm000757"))


(CONCEPT
(DESCRIPTOR "Banana plants")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Banana trees")
(BT "Plants")
(RT "Banana plantations")
(RT "Bananas")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000761")
(TNR "tgm000758"))


(CONCEPT
(NON-DESCRIPTOR "Banana trees")
(USE "Banana plants")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012083"))


(CONCEPT
(DESCRIPTOR "Bananas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fruit")
(RT "Banana peels")
(RT "Banana plantations")
(RT "Banana plants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000762")
(TNR "tgm000759"))


(CONCEPT
(DESCRIPTOR "Band uniforms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Uniforms")
(RT "Bands")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000763")
(TNR "tgm000760"))


(CONCEPT
(NON-DESCRIPTOR "Band wagons")
(USE "Bandwagons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000764")
(TNR "tgm000761"))


(CONCEPT
(NON-DESCRIPTOR "Bandits")
(USE "Criminals")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000765")
(TNR "tgm000762"))


(CONCEPT
(NON-DESCRIPTOR "Bandmasters")
(USE "Conductors")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000766")
(TNR "tgm000763"))


(CONCEPT
(DESCRIPTOR "Bands")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Brass bands")
(BT "Music ensembles")
(NT "Big bands")
(NT "Marching bands")
(NT "Military bands")
(NT "Rock groups")
(NT "Youth bands")
(RT "Band uniforms")
(RT "Bandstands")
(RT "Bandwagons")
(RT "Brass instruments")
(RT "Drill teams")
(RT "Wind instruments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000767")
(TNR "tgm000764"))


(CONCEPT
(DESCRIPTOR "Bandstands")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Cultural facilities")
(RT "Bands")
(RT "Gazebos")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000768")
(TNR "tgm000765"))


(CONCEPT
(DESCRIPTOR "Bandwagons")
(UF "Band wagons")
(BT "Carts & wagons")
(RT "Bands")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000769")
(TNR "tgm000766"))


(CONCEPT
(NON-DESCRIPTOR "Banisters")
(USE "Balusters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000770")
(TNR "tgm000767"))


(CONCEPT
(DESCRIPTOR "Banjos")
(SN "Includes the activity of playing banjos.")
(BT "Stringed instruments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000771")
(TNR "tgm000768"))


(CONCEPT
(NON-DESCRIPTOR "Bank checks")
(USE "Checks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000772")
(TNR "tgm000769"))


(CONCEPT
(DESCRIPTOR "Bank note vignettes")
(SN "Engraved decorations primarily designed for use on bank notes or other currency but also commonly used on stock certificates and other securities. Pictorial or ornamental images from the 1790s to the present.")
(UF "Security engravings")
(BT "Vignettes")
(RT "Certificates")
(RT "Money")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000069")
(FCNlctgm "lctgm000773")
(TNR "tgm000770"))


(CONCEPT
(DESCRIPTOR "Bank notes")
(SN "Promissory notes issued by banks, payable to bearer on dem:USED-WITHout interest, and circulating as money.")
(BT "Money")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000070")
(FCNlctgm "lctgm000774")
(TNR "tgm000771"))


(CONCEPT
(NON-DESCRIPTOR "Bank runs")
(USE "Business panics")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000775")
(TNR "tgm000772"))


(CONCEPT
(DESCRIPTOR "Bankers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with commercial activities")
(RT "Banking")
(RT "Banks")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000776")
(TNR "tgm000773"))


(CONCEPT
(DESCRIPTOR "Banking")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For individual or local banking activities. :SEARCH-SUBDIVISION BANKING INDUSTRY for large-scale banking or images related to the industry as a whole and under BANKS for images that focus on buildings.")
(BT "Business & finance")
(RT "Bankers")
(RT "Banking industry")
(RT "Banks")
(RT "Credit")
(CN "Used in a note under BANKS and BANKING INDUSTRY.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000777")
(TNR "tgm000774"))


(CONCEPT
(DESCRIPTOR "Banking industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For large-scale banking or images related to the industry as a whole. :SEARCH-SUBDIVISION BANKING for individual or local banking activities and under BANKS for images that focus on buildings.")
(BT "Business & finance")
(BT "Industry")
(RT "Banking")
(RT "Banks")
(CN "Used in a note under BANKS and BANKING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000778")
(TNR "tgm000775"))


(CONCEPT
(DESCRIPTOR "Banks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on buildings. :SEARCH-SUBDIVISION BANKING for individual or local banking activities and under BANKING INDUSTRY for large-scale banking or images related to the industry as a whole.")
(UF "Depositories")
(BT "Financial facilities")
(RT "Bankers")
(RT "Banking")
(RT "Banking industry")
(RT "Coin banks")
(RT "Safe-deposit boxes")
(RT "Safes")
(RT "Vaults (Strong rooms)")
(CN "Used in a note under BANKING and BANKING INDUSTRY.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000779")
(TNR "tgm000776"))


(CONCEPT
(DESCRIPTOR "Banners")
(SN "Sheets of cloth, plastic, or paper intended for hanging or other public display.")
(BT "Signs (Notices)")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000071")
(FCNlctgm "lctgm000780")
(TNR "tgm000777"))


(CONCEPT
(DESCRIPTOR "Banquet camera photographs")
(SN "Photographs made from a fixed wide-angle-lens camera capable of producing a sharp image of great depth. Usually photographs of large groups of people.  One camera, marketed 1913-1926, produced prints of 7 x 17 in. (18 x 43 cm.) and 12 x 20 in. (30 x 51 cm.).")
(BT "Photographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000072")
(FCNlctgm "lctgm000781")
(TNR "tgm000778"))


(CONCEPT
(DESCRIPTOR "Banquet halls")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Interiors")
(RT "Banquets")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000782")
(TNR "tgm000779"))


(CONCEPT
(DESCRIPTOR "Banquets")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Feasts")
(BT "Eating & drinking")
(NT "Luaus")
(RT "Banquet halls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000783")
(TNR "tgm000780"))


(CONCEPT
(DESCRIPTOR "Banyan trees")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "East Indian trees, the branches of which send out numerous trunks that grow down to the soil so that a single tree covers a large area.")
(BT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000784")
(TNR "tgm000781"))


(CONCEPT
(DESCRIPTOR "Baobabs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000785")
(TNR "tgm000782"))


(CONCEPT
(NON-DESCRIPTOR "Baptism, Sailors'")
(USE "Shellbacks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000789")
(TNR "tgm000786"))


(CONCEPT
(DESCRIPTOR "Baptismal certificates")
(BT "Certificates")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000073")
(FCNlctgm "lctgm000786")
(TNR "tgm000783"))


(CONCEPT
(NON-DESCRIPTOR "Baptismal fonts")
(USE "Fonts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000787")
(TNR "tgm000784"))


(CONCEPT
(DESCRIPTOR "Baptisms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Christenings")
(UF "Immersions, Baptismal")
(BT "Rites & ceremonies")
(RT "Baptisteries")
(RT "Fonts")
(RT "Preaching")
(RT "Religious services")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000788")
(TNR "tgm000785"))


(CONCEPT
(DESCRIPTOR "Baptist churches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on buildings, as well as the associated grounds.")
(BT "Protestant churches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000790")
(TNR "tgm000787"))


(CONCEPT
(DESCRIPTOR "Baptisteries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Part of church used for baptism, containing a baptismal font.")
(UF "Baptistries")
(BT "Rooms & spaces")
(RT "Baptisms")
(RT "Churches")
(RT "Fonts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000791")
(TNR "tgm000788"))


(CONCEPT
(NON-DESCRIPTOR "Baptistries")
(USE "Baptisteries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000792")
(TNR "tgm000789"))


(CONCEPT
(NON-DESCRIPTOR "Barabans")
(USE "Drums (Domes)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000793")
(TNR "tgm000790"))


(CONCEPT
(NON-DESCRIPTOR "Barbary corsairs")
(USE "Pirates")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000794")
(TNR "tgm000791"))


(CONCEPT
(NON-DESCRIPTOR "Barbary sheep")
(USE "Mountain sheep")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000795")
(TNR "tgm000792"))


(CONCEPT
(DESCRIPTOR "Barbecue grills")
(BT "Equipment")
(RT "Barbecues")
(RT "Cookery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000796")
(TNR "tgm000793"))


(CONCEPT
(DESCRIPTOR "Barbecues")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "A social gathering, held outdoors, at which barbecued food is eaten.")
(BT "Eating & drinking")
(RT "Barbecue grills")
(RT "Outdoor cookery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000797")
(TNR "tgm000794"))


(CONCEPT
(DESCRIPTOR "Barbed wire")
(BT "Wire")
(RT "Barbed wire industry")
(RT "Fences")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000798")
(TNR "tgm000795"))


(CONCEPT
(DESCRIPTOR "Barbed wire industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(RT "Barbed wire")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000799")
(TNR "tgm000796"))


(CONCEPT
(NON-DESCRIPTOR "Barbed-wire entanglements")
(USE "Wire obstacles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000800")
(TNR "tgm000797"))


(CONCEPT
(DESCRIPTOR "Barbells")
(BT "Equipment")
(RT "Weight lifting")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012082"))


(CONCEPT
(DESCRIPTOR "Barber poles")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Poles, Barber")
(BT "Signs (Notices)")
(RT "Barbershops")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm011910")
(TNR "tgm000798"))


(CONCEPT
(DESCRIPTOR "Barbering")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For activities outside of barbershops.")
(BT "Hairdressing")
(RT "Barbers' strikes")
(RT "Barbershops")
(RT "Shaving")
(CN "Used in a note under BARBERSHOPS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000801")
(TNR "tgm000799"))


(CONCEPT
(DESCRIPTOR "Barbers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(RT "Hairdressing")
(RT "Hairstyles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000802")
(TNR "tgm000800"))


(CONCEPT
(DESCRIPTOR "Barbers' strikes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Strikes")
(RT "Barbering")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000803")
(TNR "tgm000801"))


(CONCEPT
(DESCRIPTOR "Barbershop quartets")
(UF "Quartets, Barbershop")
(BT "Music ensembles")
(RT "Singing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000804")
(TNR "tgm000802"))


(CONCEPT
(DESCRIPTOR "Barbershops")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION BARBERING for activities outside of shops.")
(BT "Service industry facilities")
(RT "Barber poles")
(RT "Barbering")
(RT "Beauty shops")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000805")
(TNR "tgm000803"))


(CONCEPT
(DESCRIPTOR "Bards")
(BT "Entertainers")
(RT "Harps")
(RT "Minstrels")
(RT "Poets")
(RT "Singers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000806")
(TNR "tgm000804"))


(CONCEPT
(DESCRIPTOR "Bareback riding")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Horseback riding")
(RT "Circuses & shows")
(RT "Trick riding")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000807")
(TNR "tgm000805"))


(CONCEPT
(NON-DESCRIPTOR "Bargaining")
(USE "Negotiating")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000808")
(TNR "tgm000806"))


(CONCEPT
(DESCRIPTOR "Barges")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Riverboats")
(BT "Boats")
(NT "Whalebacks")
(RT "Shipping")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000809")
(TNR "tgm000807"))


(CONCEPT
(DESCRIPTOR "Bark")
(BT "Plant parts")
(NT "Cork")
(RT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000810")
(TNR "tgm000808"))


(CONCEPT
(DESCRIPTOR "Barley")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Grains")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000811")
(TNR "tgm000809"))


(CONCEPT
(DESCRIPTOR "Barns")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Agricultural facilities")
(RT "Haylofts")
(RT "Stables")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000812")
(TNR "tgm000810"))


(CONCEPT
(DESCRIPTOR "Barnyards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Agricultural facilities")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012099"))


(CONCEPT
(DESCRIPTOR "Barometers")
(BT "Scientific equipment")
(RT "Weather")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000813")
(TNR "tgm000811"))


(CONCEPT
(NON-DESCRIPTOR "Baronage")
(USE "Peerage")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000814")
(TNR "tgm000812"))


(CONCEPT
(DESCRIPTOR "Barracks")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Quarters, Military")
(BT "Dwellings")
(BT "Military facilities")
(RT "Officers' quarters")
(RT "Quonset huts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000815")
(TNR "tgm000813"))


(CONCEPT
(DESCRIPTOR "Barrage balloons")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Small captive balloons used to support wires or nets as protection against air attacks.")
(BT "Captive balloons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000816")
(TNR "tgm000814"))


(CONCEPT
(DESCRIPTOR "Barrel ceilings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Ceilings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000817")
(TNR "tgm000815"))


(CONCEPT
(NON-DESCRIPTOR "Barrel organ players")
(USE "Organ grinders")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000818")
(TNR "tgm000816"))


(CONCEPT
(DESCRIPTOR "Barrels")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Casks")
(BT "Containers")
(RT "Coopers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000819")
(TNR "tgm000817"))


(CONCEPT
(DESCRIPTOR "Barricades")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Ramparts")
(BT "Forts & fortifications")
(NT "Chevaux-de-frise")
(RT "Electric fences")
(RT "Military art & science")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000820")
(TNR "tgm000818"))


(CONCEPT
(NON-DESCRIPTOR "Barrier reefs")
(USE "Reefs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000821")
(TNR "tgm000819"))


(CONCEPT
(NON-DESCRIPTOR "Barriers (Military science)")
(USE "Obstacles (Military science)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000822")
(TNR "tgm000820"))


(CONCEPT
(DESCRIPTOR "Barrooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Tap rooms")
(UF "Taprooms")
(BT "Interiors")
(RT "Bars")
(RT "Bars (Furniture)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000823")
(TNR "tgm000821"))


(CONCEPT
(DESCRIPTOR "Bars")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Juke joints")
(UF "Public houses")
(UF "Pubs")
(UF "Saloons")
(UF "Taverns")
(BT "Eating & drinking facilities")
(NT "Speakeasies")
(RT "Alcoholic beverages")
(RT "Barrooms")
(RT "Bartenders")
(RT "Beer halls")
(RT "Hotels")
(RT "Nightclubs")
(RT "Restaurants")
(RT "Taverns (Inns)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000824")
(TNR "tgm000822"))


(CONCEPT
(DESCRIPTOR "Bars (Furniture)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "A counter over which liquor and other beverages are served.")
(BT "Built-in furniture")
(RT "Alcoholic beverages")
(RT "Barrooms")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000825")
(TNR "tgm000823"))


(CONCEPT
(NON-DESCRIPTOR "Bars (Sand)")
(USE "Sandbars")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000826")
(TNR "tgm000824"))


(CONCEPT
(DESCRIPTOR "Bartenders")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(RT "Bars")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000827")
(TNR "tgm000825"))


(CONCEPT
(DESCRIPTOR "Barter")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Exchange (Barter)")
(BT "Commerce")
(RT "Money")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000828")
(TNR "tgm000826"))


(CONCEPT
(NON-DESCRIPTOR "Base exchanges")
(USE "Military exchanges")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000829")
(TNR "tgm000827"))


(CONCEPT
(DESCRIPTOR "Baseball")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes organizations and activities.")
(BT "Sports")
(NT "Finnish baseball")
(NT "Water baseball")
(NT "World series (Baseball)")
(RT "Baseball players")
(RT "Baseball scouts")
(RT "Baseballs")
(RT "Softball")
(CN "Used in a note under BASEBALL PLAYERS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000830")
(TNR "tgm000828"))


(CONCEPT
(DESCRIPTOR "Baseball bats")
(UF "Bats, Baseball")
(BT "Sporting goods")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012080"))


(CONCEPT
(DESCRIPTOR "Baseball cards")
(SN "Advertising or collectible cards that feature portraits of baseball players, other people, or topics associated with the game.  Introduced in 1886 or 1887 by a tobacco company; also popular with bubble gum manufacturers beginning in the 1930s. Common sizes include 1.5 x 2.5 inches, 2.5 x 3.5 inches, and ca. 5 x 8 inches.  The cards may be actual photographs mounted on card stock or photomechanically printed.")
(BT "Sports cards")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000074")
(FCNlctgm "lctgm000831")
(TNR "tgm000829"))


(CONCEPT
(DESCRIPTOR "Baseball managers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with entertainment & sports")
(CN "Geographical subdivision indicates place where manager is based.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000832")
(TNR "tgm000830"))


(CONCEPT
(DESCRIPTOR "Baseball players")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Athletes")
(RT "Baseball")
(RT "Softball players")
(CN "Geographical subdivision indicates place where team or player is based.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000833")
(TNR "tgm000831"))


(CONCEPT
(DESCRIPTOR "Baseball scouts")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Scouts, Baseball")
(BT "People associated with entertainment & sports")
(RT "Baseball")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000834")
(TNR "tgm000832"))


(CONCEPT
(DESCRIPTOR "Baseball umpires")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Umpires, Baseball")
(BT "Referees")
(RT "Sports officiating")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000835")
(TNR "tgm000833"))


(CONCEPT
(DESCRIPTOR "Baseballs")
(BT "Balls (Sporting goods)")
(RT "Baseball")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000836")
(TNR "tgm000834"))


(CONCEPT
(DESCRIPTOR "Basements")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cellars")
(BT "Interiors")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000837")
(TNR "tgm000835"))


(CONCEPT
(DESCRIPTOR "Basilicas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Churches")
(RT "Apses")
(RT "Naves")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000838")
(TNR "tgm000836"))


(CONCEPT
(DESCRIPTOR "Basins")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Washbasins")
(BT "Containers")
(RT "Cleaning")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000839")
(TNR "tgm000837"))


(CONCEPT
(DESCRIPTOR "Basins (Bodies of water)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Bodies of water")
(NT "Settling basins")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000840")
(TNR "tgm000838"))


(CONCEPT
(NON-DESCRIPTOR "Basins, Settling")
(USE "Settling basins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000841")
(TNR "tgm000839"))


(CONCEPT
(DESCRIPTOR "Basket making")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Handicraft")
(RT "Baskets")
(RT "Weaving")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000842")
(TNR "tgm000840"))


(CONCEPT
(DESCRIPTOR "Basketball")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes organizations and activities.")
(BT "Sports")
(RT "Basketball players")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000843")
(TNR "tgm000841"))


(CONCEPT
(DESCRIPTOR "Basketball players")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Athletes")
(RT "Basketball")
(CN "Geographical subdivision indicates place where team or player is based.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000844")
(TNR "tgm000842"))


(CONCEPT
(DESCRIPTOR "Baskets")
(BT "Containers")
(NT "Picnic baskets")
(RT "Basket making")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000845")
(TNR "tgm000843"))


(CONCEPT
(NON-DESCRIPTOR "Baskets, Picnic")
(USE "Picnic baskets")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000846")
(TNR "tgm000844"))


(CONCEPT
(DESCRIPTOR "Bas-reliefs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Works of sculpture in which the projection of figures, ornaments, etc., from the background is slight, no part being entirely detached.")
(BT "Sculpture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000851")
(TNR "tgm000849"))


(CONCEPT
(DESCRIPTOR "Basses (Fish)")
(GEO-FACET ":COUNTRY :STATE")
(BT "Fish")
(HN "Changed 11/1995 from BASS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000847")
(TNR "tgm000845"))


(CONCEPT
(NON-DESCRIPTOR "Bassinets")
(USE "Children's furniture")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000848")
(TNR "tgm000846"))


(CONCEPT
(DESCRIPTOR "Bassoons")
(SN "Includes the activity of playing bassoons.")
(BT "Wind instruments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000849")
(TNR "tgm000847"))


(CONCEPT
(NON-DESCRIPTOR "Bastardy")
(USE "Illegitimacy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000850")
(TNR "tgm000848"))


(CONCEPT
(NON-DESCRIPTOR "Bath chairs")
(USE "Wheeled chairs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000852")
(TNR "tgm000850"))


(CONCEPT
(NON-DESCRIPTOR "Bath houses")
(USE "Bathhouses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000853")
(TNR "tgm000851"))


(CONCEPT
(DESCRIPTOR "Bathhouses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Public facilities containing dressing rooms. Includes activities and structures. :SEARCH-SUBDIVISION PUBLIC BATHS for public buildings for bathing.")
(UF "Bath houses")
(UF "Bathing pavilions")
(UF "Beach changing-rooms")
(UF "Pool houses")
(BT "Sports & recreation facilities")
(NT "Cabanas")
(RT "Bathing")
(RT "Beaches")
(RT "Public baths")
(RT "Shelters")
(RT "Swimming")
(CN "Used in a note under PUBLIC BATHS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000854")
(TNR "tgm000852"))


(CONCEPT
(DESCRIPTOR "Bathing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Baths")
(BT "Grooming")
(RT "Ablution fountains")
(RT "Bathhouses")
(RT "Bathrooms")
(RT "Bathtubs & showers")
(RT "Hygiene")
(RT "Public baths")
(RT "Therapeutic baths")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000855")
(TNR "tgm000853"))


(CONCEPT
(NON-DESCRIPTOR "Bathing beaches")
(USE "Beaches")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000856")
(TNR "tgm000854"))


(CONCEPT
(DESCRIPTOR "Bathing beauties")
(BT "Women")
(RT "Bathing suits")
(RT "Beauty contests")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000857")
(TNR "tgm000855"))


(CONCEPT
(DESCRIPTOR "Bathing caps")
(BT "Headgear")
(RT "Swimming")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012098"))


(CONCEPT
(NON-DESCRIPTOR "Bathing houses")
(USE "Public baths")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000858")
(TNR "tgm000856"))


(CONCEPT
(NON-DESCRIPTOR "Bathing of animals")
(USE "Animal grooming")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000859")
(TNR "tgm000857"))


(CONCEPT
(NON-DESCRIPTOR "Bathing pavilions")
(USE "Bathhouses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000860")
(TNR "tgm000858"))


(CONCEPT
(DESCRIPTOR "Bathing suits")
(SN "For images in which swimming attire is prominent.")
(UF "Swimsuits")
(BT "Clothing & dress")
(NT "Bikinis (Bathing suits)")
(RT "Bathing beauties")
(RT "Beaches")
(RT "Swimming")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000861")
(TNR "tgm000859"))


(CONCEPT
(DESCRIPTOR "Bathrobes")
(BT "Clothing & dress")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012097"))


(CONCEPT
(DESCRIPTOR "Bathrooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Lavatories")
(UF "Washrooms")
(BT "Interiors")
(RT "Bathing")
(RT "Bathtubs & showers")
(RT "Privies")
(RT "Public comfort stations")
(RT "Rest rooms")
(RT "Toilets")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000862")
(TNR "tgm000860"))


(CONCEPT
(NON-DESCRIPTOR "Baths")
(USE "Bathing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000863")
(TNR "tgm000861"))


(CONCEPT
(NON-DESCRIPTOR "Baths, Bird")
(USE "Birdbaths")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000864")
(TNR "tgm000862"))


(CONCEPT
(DESCRIPTOR "Bathtubs & showers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Showers")
(UF "Tubs, Bath")
(BT "Plumbing fixtures")
(RT "Bathing")
(RT "Bathrooms")
(RT "Furniture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000865")
(TNR "tgm000863"))


(CONCEPT
(DESCRIPTOR "Bathyspheres")
(SN "Strongly built diving spheres used for deep-sea observation and study.")
(BT "Scientific equipment")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000866")
(TNR "tgm000864"))


(CONCEPT
(DESCRIPTOR "Batiks")
(BT "Textiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000867")
(TNR "tgm000865"))


(CONCEPT
(DESCRIPTOR "Baton twirling")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Sports")
(RT "Drill teams")
(RT "Drum majorettes")
(RT "Drum majoring")
(RT "Drum majors")
(RT "Parades & processions")
(CN "Used in a note under DRUM MAJORS and DRUM MAJORETTES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000868")
(TNR "tgm000866"))


(CONCEPT
(DESCRIPTOR "Bats")
(GEO-FACET ":COUNTRY :STATE")
(BT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000869")
(TNR "tgm000867"))


(CONCEPT
(NON-DESCRIPTOR "Bats, Baseball")
(USE "Baseball bats")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012081"))


(CONCEPT
(NON-DESCRIPTOR "Battercakes")
(USE "Pancakes & waffles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000870")
(TNR "tgm000868"))


(CONCEPT
(NON-DESCRIPTOR "Battered children")
(USE "Abused children")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000871")
(TNR "tgm000869"))


(CONCEPT
(NON-DESCRIPTOR "Battered women")
(USE "Abused women")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000872")
(TNR "tgm000870"))


(CONCEPT
(DESCRIPTOR "Batteries (Weaponry)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Architectural elements")
(NT "Floating batteries")
(RT "Artillery (Weaponry)")
(RT "Forts & fortifications")
(RT "Military art & science")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000873")
(TNR "tgm000871"))


(CONCEPT
(NON-DESCRIPTOR "Batteries, electric")
(USE "Electric batteries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000874")
(TNR "tgm000872"))


(CONCEPT
(DESCRIPTOR "Battering rams")
(UF "Rams, Battering")
(BT "Arms & armament")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000875")
(TNR "tgm000873"))


(CONCEPT
(NON-DESCRIPTOR "Battle flags")
(USE "Military standards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000876")
(TNR "tgm000874"))


(CONCEPT
(NON-DESCRIPTOR "Battle reenactments")
(USE "Historical reenactments")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000877")
(TNR "tgm000875"))


(CONCEPT
(DESCRIPTOR "Battlefields")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Battle sites after the time of fighting. :SEARCH-SUBDIVISION CAMPAIGNS & BATTLES and under the :NAMES-OF conflicts for images at the time of battles. :SEARCH-SUBDIVISION --BATTLEFIELDS :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(BT "Historic sites")
(RT "Campaigns & battles")
(RT "War damage")
(CN "Used in a note under CAMPAIGNS & BATTLES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000878")
(TNR "tgm000876"))


(CONCEPT
(DESCRIPTOR "Battlements")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Parapets consisting of alternate solid parts and open spaces that surmount a wall.")
(UF "Embattlements")
(BT "Architectural elements")
(RT "Forts & fortifications")
(RT "Parapets")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000879")
(TNR "tgm000877"))


(CONCEPT
(NON-DESCRIPTOR "Battles")
(USE "Campaigns & battles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000880")
(TNR "tgm000878"))


(CONCEPT
(DESCRIPTOR "Battleships")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Dreadnoughts")
(UF "Pocket battleships")
(BT "Warships")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000881")
(TNR "tgm000879"))


(CONCEPT
(DESCRIPTOR "Baxter prints")
(SN "Color prints that use a combination printing process that involves intaglio plates (or occasionally lithographic stones/plates) to produce a print to which color is subsequently applied using up to 20 wood blocks. The process was invented by George Baxter in 1835 and widely used until the 1870s. The term is used to refer to prints made by Baxter himself. For Baxter prints made by other printers, :SEARCH-SUBDIVISION BAXTER-PROCESS PRINTS.")
(BT "Prints")
(RT "Baxter-process prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000075")
(FCNlctgm "lctgm000882")
(TNR "tgm000880"))


(CONCEPT
(DESCRIPTOR "Baxter-process prints")
(BT "Prints")
(RT "Baxter prints")
(CN "Color prints that use a combination printing process that involves intaglio plates (or occasionally lithographic stones/plates) to produce a print to which color is subsequently applied using up to 20 wood blocks. The process was invented by George Baxter in 1835 and widely used until the 1870s. The term is used to refer to prints made by printers other than Baxter. For Baxter prints made by Baxter himself, :SEARCH-SUBDIVISION BAXTER PRINTS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000076")
(FCNlctgm "lctgm000883")
(TNR "tgm000881"))


(CONCEPT
(NON-DESCRIPTOR "Bay trees")
(USE "Laurels")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012096"))


(CONCEPT
(DESCRIPTOR "Bay windows")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Jut windows")
(UF "Oriel windows")
(BT "Windows")
(NT "Bow windows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000884")
(TNR "tgm000882"))


(CONCEPT
(NON-DESCRIPTOR "Bayoneting")
(USE "Bayonets")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000885")
(TNR "tgm000883"))


(CONCEPT
(DESCRIPTOR "Bayonets")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Bayoneting")
(BT "Arms & armament")
(RT "Rifles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000886")
(TNR "tgm000884"))


(CONCEPT
(DESCRIPTOR "Bayous")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Distributaries of streams, bounded by natural levees, through which water is channeled by repeated divisions into swamps, then marshes of a delta, and ultimately into the ocean.")
(BT "Streams")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000887")
(TNR "tgm000885"))


(CONCEPT
(DESCRIPTOR "Bays (Bodies of water)")
(GEO-FACET ":COUNTRY :STATE")
(UF "Coves")
(UF "Estuaries")
(UF "Gulfs")
(UF "Inlets")
(UF "Sounds (Geomorphology)")
(BT "Bodies of water")
(NT "Fjords")
(RT "Harbors")
(RT "Seas")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000888")
(TNR "tgm000886"))


(CONCEPT
(DESCRIPTOR "Bays (Rooms & spaces)")
(BT "Rooms & spaces")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000889")
(TNR "tgm000887"))


(CONCEPT
(DESCRIPTOR "Bazaars")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Markets consisting of rows of shops or stalls often found in Middle Eastern or Islamic countries.")
(UF "Oriental bazaars")
(UF "Souks")
(UF "Suqs")
(BT "Markets")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000890")
(TNR "tgm000888"))


(CONCEPT
(DESCRIPTOR "Bazookas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Rocket launchers")
(BT "Artillery (Weaponry)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000891")
(TNR "tgm000889"))


(CONCEPT
(NON-DESCRIPTOR "Beach changing-rooms")
(USE "Bathhouses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000892")
(TNR "tgm000890"))


(CONCEPT
(DESCRIPTOR "Beachcombing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Recreation")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012095"))


(CONCEPT
(DESCRIPTOR "Beaches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bathing beaches")
(UF "Boat landings")
(UF "Seashores")
(UF "Strands")
(BT "Land")
(RT "Bathhouses")
(RT "Bathing suits")
(RT "Boardwalks")
(RT "Bodies of water")
(RT "Coastlines")
(RT "Dunes")
(RT "Resorts")
(RT "Sand sculpture")
(RT "Surf fishing")
(RT "Swimming")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000893")
(TNR "tgm000891"))


(CONCEPT
(DESCRIPTOR "Beacons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Communication devices")
(RT "Lighthouses")
(RT "Navigation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000894")
(TNR "tgm000892"))


(CONCEPT
(DESCRIPTOR "Bead & reel moldings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Reel & bead moldings")
(BT "Moldings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000895")
(TNR "tgm000893"))


(CONCEPT
(DESCRIPTOR "Beads")
(BT "Objects")
(RT "Jewelry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000896")
(TNR "tgm000894"))


(CONCEPT
(DESCRIPTOR "Beadwork")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Objects")
(RT "Handicraft")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012094"))


(CONCEPT
(DESCRIPTOR "Beams")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Architectural elements")
(NT "Girders")
(NT "I-beams")
(HN "Changed 4/2008 from Nonpostable.")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000897")
(TNR "tgm000895"))


(CONCEPT
(NON-DESCRIPTOR "Beano")
(USE "Bingo")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000898")
(TNR "tgm000896"))


(CONCEPT
(DESCRIPTOR "Beans")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vegetables")
(NT "Soybeans")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000899")
(TNR "tgm000897"))


(CONCEPT
(DESCRIPTOR "Bear cubs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cubs, Bear")
(BT "Baby animals")
(BT "Bears")
(RT "Grizzly bears")
(RT "Polar bears")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000900")
(TNR "tgm000898"))


(CONCEPT
(DESCRIPTOR "Bear hunting")
(GEO-FACET ":COUNTRY :STATE")
(BT "Big game hunting")
(RT "Bears")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000901")
(TNR "tgm000899"))


(CONCEPT
(DESCRIPTOR "Beards")
(UF "Whiskers")
(BT "Hair")
(RT "Hairstyles")
(RT "Mustaches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000902")
(TNR "tgm000900"))


(CONCEPT
(DESCRIPTOR "Bears")
(GEO-FACET ":COUNTRY :STATE")
(BT "Animals")
(NT "Bear cubs")
(NT "Grizzly bears")
(NT "Polar bears")
(RT "Bear hunting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000903")
(TNR "tgm000901"))


(CONCEPT
(DESCRIPTOR "Beat generation")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Beatniks")
(UF "Beats")
(BT "People")
(RT "Bohemians")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000904")
(TNR "tgm000902"))


(CONCEPT
(DESCRIPTOR "Beating")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Punishment & torture")
(NT "Spanking")
(NT "Whipping")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000905")
(TNR "tgm000903"))


(CONCEPT
(NON-DESCRIPTOR "Beatniks")
(USE "Beat generation")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000906")
(TNR "tgm000904"))


(CONCEPT
(NON-DESCRIPTOR "Beats")
(USE "Beat generation")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000907")
(TNR "tgm000905"))


(CONCEPT
(NON-DESCRIPTOR "Beautification of cities & towns")
(USE "Urban beautification")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000908")
(TNR "tgm000906"))


(CONCEPT
(DESCRIPTOR "Beauty")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "A pleasing quality associated with harmony of form or color, excellence of craftsmanship, truthfulness, originality, or another, often unspecified, quality.")
(BT "Aesthetics")
(RT "Ugliness")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000909")
(TNR "tgm000907"))


(CONCEPT
(DESCRIPTOR "Beauty contestants")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Beauty queens")
(UF "Contestants, Beauty")
(BT "Women")
(RT "Beauty contests")
(CN "Geographical subdivision indicates place where contestant is based.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000910")
(TNR "tgm000908"))


(CONCEPT
(DESCRIPTOR "Beauty contests")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Beauty pageants")
(BT "Contests")
(RT "Bathing beauties")
(RT "Beauty contestants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000911")
(TNR "tgm000909"))


(CONCEPT
(NON-DESCRIPTOR "Beauty pageants")
(USE "Beauty contests")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000912")
(TNR "tgm000910"))


(CONCEPT
(NON-DESCRIPTOR "Beauty parlors")
(USE "Beauty shops")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000913")
(TNR "tgm000911"))


(CONCEPT
(NON-DESCRIPTOR "Beauty queens")
(USE "Beauty contestants")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000914")
(TNR "tgm000912"))


(CONCEPT
(DESCRIPTOR "Beauty shops")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Beauty parlors")
(UF "Salons, Beauty")
(BT "Service industry facilities")
(RT "Barbershops")
(RT "Grooming")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000915")
(TNR "tgm000913"))


(CONCEPT
(DESCRIPTOR "Beaver dams")
(GEO-FACET ":COUNTRY :STATE")
(BT "Dwellings")
(RT "Beavers")
(RT "Bodies of water")
(RT "Dams")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000916")
(TNR "tgm000914"))


(CONCEPT
(DESCRIPTOR "Beavers")
(GEO-FACET ":COUNTRY :STATE")
(BT "Rodents")
(RT "Beaver dams")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000917")
(TNR "tgm000915"))


(CONCEPT
(NON-DESCRIPTOR "Bed linens")
(USE "Bedsheets")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012110"))


(CONCEPT
(DESCRIPTOR "Bed of nails")
(BT "Objects")
(RT "Beds")
(RT "Nails & spikes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000918")
(TNR "tgm000916"))


(CONCEPT
(DESCRIPTOR "Bedbugs")
(GEO-FACET ":COUNTRY :STATE")
(BT "Insects")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000919")
(TNR "tgm000917"))


(CONCEPT
(DESCRIPTOR "Bedpans")
(BT "Containers")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012108"))


(CONCEPT
(DESCRIPTOR "Bedrolls")
(BT "Furnishings")
(RT "Blankets")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012107"))


(CONCEPT
(DESCRIPTOR "Bedrooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Interiors")
(RT "Beds")
(RT "Boudoirs")
(RT "Bunk beds")
(RT "Dormitories")
(RT "Staterooms")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000920")
(TNR "tgm000918"))


(CONCEPT
(DESCRIPTOR "Beds")
(BT "Furniture")
(NT "Bunk beds")
(NT "Cots")
(NT "Deathbeds")
(NT "Feather beds")
(RT "Bed of nails")
(RT "Bedrooms")
(RT "Bedsheets")
(RT "Bedspreads")
(RT "Pillows")
(RT "Sleeping")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000921")
(TNR "tgm000919"))


(CONCEPT
(DESCRIPTOR "Bedsheets")
(UF "Bed linens")
(UF "Sheets (Bed)")
(BT "Furnishings")
(RT "Beds")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012109"))


(CONCEPT
(NON-DESCRIPTOR "Bedside vigils")
(USE "Vigils")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000922")
(TNR "tgm000920"))


(CONCEPT
(DESCRIPTOR "Bedspreads")
(BT "Furnishings")
(NT "Quilts")
(RT "Beds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000923")
(TNR "tgm000921"))


(CONCEPT
(DESCRIPTOR "Bedtime")
(BT "Time")
(RT "Night")
(RT "Sleeping")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000924")
(TNR "tgm000922"))


(CONCEPT
(DESCRIPTOR "Bee culture")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Beekeeping")
(BT "Agriculture")
(RT "Beehives")
(RT "Bees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000925")
(TNR "tgm000923"))


(CONCEPT
(DESCRIPTOR "Beeches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000926")
(TNR "tgm000924"))


(CONCEPT
(DESCRIPTOR "Beef cattle")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cattle, Beef")
(BT "Cattle")
(RT "Meat industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000927")
(TNR "tgm000925"))


(CONCEPT
(NON-DESCRIPTOR "Beefcake photographs")
(USE "Glamour photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000077")
(FCNlctgm "lctgm000928")
(TNR "tgm000926"))


(CONCEPT
(DESCRIPTOR "Beehive houses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Houses with a circular plan and a conical dome.")
(BT "Houses")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012047"))


(CONCEPT
(DESCRIPTOR "Beehives")
(UF "Hives, Bee")
(BT "Animal housing")
(BT "Nests")
(RT "Bee culture")
(RT "Bees")
(RT "Honeycombs")
(RT "Wasps' nests")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000929")
(TNR "tgm000927"))


(CONCEPT
(NON-DESCRIPTOR "Beekeeping")
(USE "Bee culture")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000930")
(TNR "tgm000928"))


(CONCEPT
(DESCRIPTOR "Beer")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Alcoholic beverages")
(RT "Beer gardens")
(RT "Beer halls")
(RT "Brewing industry")
(CN ":DOUBLE-INDEX EATING & DRINKING for the activity of beer drinking.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000931")
(TNR "tgm000929"))


(CONCEPT
(DESCRIPTOR "Beer gardens")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Eating and drinking establishments serving food and drink to individuals and families, and often serving as social centers. Originated in Germany and brought to the U.S. by German and East European immigrants.")
(BT "Eating & drinking facilities")
(RT "Beer")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000932")
(TNR "tgm000930"))


(CONCEPT
(DESCRIPTOR "Beer halls")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Eating & drinking facilities")
(RT "Bars")
(RT "Beer")
(RT "Nightclubs")
(RT "Restaurants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000933")
(TNR "tgm000931"))


(CONCEPT
(NON-DESCRIPTOR "Beer industry")
(USE "Brewing industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000934")
(TNR "tgm000932"))


(CONCEPT
(DESCRIPTOR "Bees")
(GEO-FACET ":COUNTRY :STATE")
(UF "Bumble bees")
(BT "Insects")
(RT "Apiaries")
(RT "Bee culture")
(RT "Beehives")
(RT "Honeycombs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000935")
(TNR "tgm000933"))


(CONCEPT
(DESCRIPTOR "Bees (Cooperative gatherings)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Social gatherings where people combine work, competition, and amusement.")
(BT "Events")
(BT "Manners & customs")
(NT "Quilting bees")
(RT "Country life")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000936")
(TNR "tgm000934"))


(CONCEPT
(NON-DESCRIPTOR "Beet sugar")
(USE "Sugar")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000937")
(TNR "tgm000935"))


(CONCEPT
(DESCRIPTOR "Beets")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Sugar beets")
(BT "Vegetables")
(RT "Sugar")
(RT "Sugar industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000938")
(TNR "tgm000936"))


(CONCEPT
(NON-DESCRIPTOR "Before & after views")
(USE "Then & now comparisons")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000078")
(FCNlctgm "lctgm000939")
(TNR "tgm000937"))


(CONCEPT
(DESCRIPTOR "Beggars")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Poor persons")
(RT "Tin cups")
(RT "Tramps")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000940")
(TNR "tgm000938"))


(CONCEPT
(NON-DESCRIPTOR "Begging (Pleading)")
(USE "Pleading (Begging)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000941")
(TNR "tgm000939"))


(CONCEPT
(NON-DESCRIPTOR "Beginnings")
(USE "Creation")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000942")
(TNR "tgm000940"))


(CONCEPT
(DESCRIPTOR "Begonias")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Flowers")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012106"))


(CONCEPT
(DESCRIPTOR "Behavior")
(NT "Acculturation")
(NT "Aggression")
(NT "Animal behavior")
(NT "Animal treatment")
(NT "Child behavior")
(NT "Clumsiness")
(NT "Conformity")
(NT "Cooperation")
(NT "Corruption")
(NT "Discrimination")
(NT "Drug abuse")
(NT "Eavesdropping")
(NT "Imitation")
(NT "Individuality")
(NT "Interpersonal relations")
(NT "Role reversal")
(NT "School attendance")
(NT "Self-interest")
(NT "Tardiness")
(NT "Thrift")
(NT "Tobacco habit")
(NT "Voyeurism")
(RT "Manners & customs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000943")
(TNR "tgm000941"))


(CONCEPT
(NON-DESCRIPTOR "Behavior of animals")
(USE "Animal behavior")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000944")
(TNR "tgm000942"))


(CONCEPT
(NON-DESCRIPTOR "Behavior of children")
(USE "Child behavior")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000945")
(TNR "tgm000943"))


(CONCEPT
(NON-DESCRIPTOR "Beheadings")
(USE "Decapitations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000946")
(TNR "tgm000944"))


(CONCEPT
(NON-DESCRIPTOR "Behinds (Human body)")
(USE "Buttocks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000947")
(TNR "tgm000945"))


(CONCEPT
(NON-DESCRIPTOR "Belching")
(USE "Burping")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000948")
(TNR "tgm000946"))


(CONCEPT
(NON-DESCRIPTOR "Bell boys")
(USE "Hotel porters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000949")
(TNR "tgm000947"))


(CONCEPT
(NON-DESCRIPTOR "Bell buoys")
(USE "Buoys")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000950")
(TNR "tgm000948"))


(CONCEPT
(NON-DESCRIPTOR "Bell hops")
(USE "Hotel porters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000951")
(TNR "tgm000949"))


(CONCEPT
(NON-DESCRIPTOR "Bell peppers")
(USE "Peppers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000952")
(TNR "tgm000950"))


(CONCEPT
(DESCRIPTOR "Bell tents")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Tents")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000953")
(TNR "tgm000951"))


(CONCEPT
(DESCRIPTOR "Bell towers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Campaniles")
(BT "Towers")
(RT "Bells")
(RT "Carillons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000954")
(TNR "tgm000952"))


(CONCEPT
(NON-DESCRIPTOR "Bellmen's verses")
(USE "Carriers' addresses")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000079")
(FCNlctgm "lctgm000955")
(TNR "tgm000953"))


(CONCEPT
(DESCRIPTOR "Bellows")
(SN "Instruments or machines that by alternate expansion and contraction or by rise and fall of the top draws in air through a valve or orifice and expels it more or less forcibly through a tube.")
(BT "Equipment")
(RT "Machinery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000956")
(TNR "tgm000954"))


(CONCEPT
(DESCRIPTOR "Bells")
(SN "Includes the activity of ringing bells.")
(BT "Percussion instruments")
(NT "Carillons")
(NT "Chimes")
(RT "Bell towers")
(RT "Communication devices")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000957")
(TNR "tgm000955"))


(CONCEPT
(DESCRIPTOR "Belly dance")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Dance")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000958")
(TNR "tgm000956"))


(CONCEPT
(NON-DESCRIPTOR "Belt courses")
(USE "Stringcourses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000959")
(TNR "tgm000957"))


(CONCEPT
(DESCRIPTOR "Belt industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000960")
(TNR "tgm000958"))


(CONCEPT
(DESCRIPTOR "Belts & belting (Equipment)")
(BT "Equipment")
(RT "Machinery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000962")
(TNR "tgm000960"))


(CONCEPT
(DESCRIPTOR "Belts (Clothing)")
(BT "Clothing & dress")
(RT "Buckles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000961")
(TNR "tgm000959"))


(CONCEPT
(NON-DESCRIPTOR "Belvederes")
(USE "Gazebos")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000963")
(TNR "tgm000961"))


(CONCEPT
(DESCRIPTOR "Benches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Bleachers")
(BT "Seating furniture")
(NT "Window seats")
(RT "Pews")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000964")
(TNR "tgm000962"))


(CONCEPT
(NON-DESCRIPTOR "Benches, Windows")
(USE "Window seats")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000965")
(TNR "tgm000963"))


(CONCEPT
(DESCRIPTOR "Benedictions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the blessing of objects and persons and the act of blessing as a liturgical function.")
(UF "Blessings")
(BT "Rites & ceremonies")
(RT "Preaching")
(RT "Religious services")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000966")
(TNR "tgm000964"))


(CONCEPT
(NON-DESCRIPTOR "Benefits (Fund raising)")
(USE "Fund raising")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000967")
(TNR "tgm000965"))


(CONCEPT
(NON-DESCRIPTOR "Benefits, Employee")
(USE "Employee fringe benefits")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000968")
(TNR "tgm000966"))


(CONCEPT
(NON-DESCRIPTOR "Benefits, Veterans'")
(USE "Veterans' benefits")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000969")
(TNR "tgm000967"))


(CONCEPT
(NON-DESCRIPTOR "Benevolence")
(USE "Charity")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000970")
(TNR "tgm000968"))


(CONCEPT
(NON-DESCRIPTOR "Benevolent institutions")
(USE "Asylums")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000971")
(TNR "tgm000969"))


(CONCEPT
(NON-DESCRIPTOR "Benevolent societies")
(USE "Fraternal organizations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000972")
(TNR "tgm000970"))


(CONCEPT
(NON-DESCRIPTOR "Bequests")
(USE "Inheritance & succession")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000973")
(TNR "tgm000971"))


(CONCEPT
(DESCRIPTOR "Berets")
(BT "Hats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000974")
(TNR "tgm000972"))


(CONCEPT
(DESCRIPTOR "Berries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fruit")
(NT "Blueberries")
(NT "Cranberries")
(NT "Raspberries")
(NT "Strawberries")
(RT "Berry pickers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000975")
(TNR "tgm000973"))


(CONCEPT
(DESCRIPTOR "Berry pickers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fruit pickers")
(RT "Berries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000976")
(TNR "tgm000974"))


(CONCEPT
(NON-DESCRIPTOR "Berthing")
(USE "Mooring")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000977")
(TNR "tgm000975"))


(CONCEPT
(NON-DESCRIPTOR "Betting")
(USE "Gambling")
(USE "Wagers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000978")
(TNR "tgm000976"))


(CONCEPT
(NON-DESCRIPTOR "Bevel siding")
(USE "Clapboard siding")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000979")
(TNR "tgm000977"))


(CONCEPT
(DESCRIPTOR "Beverage industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Food industry")
(NT "Brewing industry")
(NT "Coffee industry")
(NT "Distilling industries")
(NT "Tea industry")
(NT "Wine industry")
(RT "Beverage industry strikes")
(RT "Beverages")
(RT "Bottling industry")
(RT "Dairying")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000980")
(TNR "tgm000978"))


(CONCEPT
(DESCRIPTOR "Beverage industry strikes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Strikes")
(RT "Beverage industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000981")
(TNR "tgm000979"))


(CONCEPT
(DESCRIPTOR "Beverages")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Drinks")
(BT "Food")
(NT "Alcoholic beverages")
(NT "Bitters")
(NT "Carbonated beverages")
(NT "Coffee")
(NT "Fruit juices")
(NT "Mineral waters")
(NT "Tea")
(RT "Beverage industry")
(RT "Drinking vessels")
(RT "Eating & drinking")
(RT "Eating & drinking facilities")
(RT "Lemonade stands")
(RT "Pitchers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000982")
(TNR "tgm000980"))


(CONCEPT
(NON-DESCRIPTOR "Bias (Psychology)")
(USE "Prejudice")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000984")
(TNR "tgm000982"))


(CONCEPT
(NON-DESCRIPTOR "Bias crimes")
(USE "Hate crimes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000983")
(TNR "tgm000981"))


(CONCEPT
(DESCRIPTOR "Bible cards")
(SN "Cards with a scriptural picture or quotation, or both. Sometimes issued in sets and often used as rewards of merit in Sunday schools.")
(UF "Scripture cards")
(UF "Sunday school cards")
(BT "Devotional images")
(RT "Collecting cards")
(RT "Rewards of merit")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000080")
(FCNlctgm "lctgm000985")
(TNR "tgm000983"))


(CONCEPT
(DESCRIPTOR "Bible societies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Societies concerned with the publication and distribution of the Bible. Includes activities and structures.")
(BT "Organizations")
(RT "Bibles")
(RT "Publishing industry")
(CN ":DOUBLE-INDEX ORGANIZATIONS'  FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000986")
(TNR "tgm000984"))


(CONCEPT
(NON-DESCRIPTOR "Bible stories")
(USE "Biblical events")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000987")
(TNR "tgm000985"))


(CONCEPT
(DESCRIPTOR "Bibles")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Religious books")
(RT "Bible societies")
(RT "Biblical events")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000988")
(TNR "tgm000986"))


(CONCEPT
(DESCRIPTOR "Biblical events")
(UF "Bible stories")
(BT "Events")
(NT "End of the world")
(NT "Resurrection")
(NT "Stations of the Cross")
(RT "Bibles")
(RT "Crèches (Nativity scenes)")
(RT "Noah's ark")
(RT "Ten commandments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000989")
(TNR "tgm000987"))


(CONCEPT
(NON-DESCRIPTOR "Bicentennials")
(USE "Centennial celebrations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000990")
(TNR "tgm000988"))


(CONCEPT
(DESCRIPTOR "Bicycle racing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Cycling")
(BT "Racing")
(RT "Bicycles & tricycles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000991")
(TNR "tgm000989"))


(CONCEPT
(DESCRIPTOR "Bicycle shops")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Stores & shops")
(RT "Bicycles & tricycles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000992")
(TNR "tgm000990"))


(CONCEPT
(DESCRIPTOR "Bicycles & tricycles")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Tricycles")
(UF "Velocipedes")
(BT "Vehicles")
(RT "Bicycle racing")
(RT "Bicycle shops")
(RT "Cycling")
(RT "Cyclists")
(RT "Motorcycles")
(RT "Wheeled chairs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000993")
(TNR "tgm000991"))


(CONCEPT
(NON-DESCRIPTOR "Bicycling")
(USE "Cycling")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000994")
(TNR "tgm000992"))


(CONCEPT
(DESCRIPTOR "Big bands")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Dance bands")
(UF "Jazz bands")
(BT "Bands")
(RT "Jazz")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000995")
(TNR "tgm000993"))


(CONCEPT
(DESCRIPTOR "Big business")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Conduct of commercial activities involving economic groups consisting of large profit-making corporations, especially with regard to their influence on social and political policy.")
(UF "Economic concentration")
(BT "Business & finance")
(NT "Industrial trusts")
(NT "Monopolies")
(RT "Special interests")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000996")
(TNR "tgm000994"))


(CONCEPT
(DESCRIPTOR "Big game fishing")
(GEO-FACET ":COUNTRY :STATE")
(UF "Deep-sea fishing")
(BT "Fishing")
(NT "Shark fishing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000997")
(TNR "tgm000995"))


(CONCEPT
(DESCRIPTOR "Big game hunting")
(GEO-FACET ":COUNTRY :STATE")
(BT "Hunting")
(NT "Antelope hunting")
(NT "Bear hunting")
(NT "Bison hunting")
(NT "Deer hunting")
(NT "Elephant hunting")
(NT "Elk hunting")
(NT "Kangaroo hunting")
(NT "Lion hunting")
(NT "Moose hunting")
(NT "Mountain goat hunting")
(NT "Mountain sheep hunting")
(NT "Muskox hunting")
(NT "Puma hunting")
(RT "Safaris")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm000998")
(TNR "tgm000996"))


(CONCEPT
(NON-DESCRIPTOR "Big top")
(USE "Circuses & shows")
(USE "Show tents")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm000999")
(TNR "tgm000997"))


(CONCEPT
(DESCRIPTOR "Bigamy")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Multiple marriage as a criminal offense. :SEARCH-SUBDIVISION POLYGAMY for the practice of having more than one spouse.")
(UF "Multiple marriage")
(BT "Crimes")
(BT "Marriage")
(RT "Polygamy")
(CN "Used in a note under POLYGAMY.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001000")
(TNR "tgm000998"))


(CONCEPT
(NON-DESCRIPTOR "Biggest")
(USE "Curiosities & wonders")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001001")
(TNR "tgm000999"))


(CONCEPT
(NON-DESCRIPTOR "Bighorn sheep")
(USE "Mountain sheep")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001002")
(TNR "tgm001000"))


(CONCEPT
(NON-DESCRIPTOR "Bigotry")
(USE "Prejudice")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001003")
(TNR "tgm001001"))


(CONCEPT
(NON-DESCRIPTOR "Bikers (Motorcyclists)")
(USE "Motorcyclists")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012105"))


(CONCEPT
(DESCRIPTOR "Bikinis (Bathing suits)")
(BT "Bathing suits")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001004")
(TNR "tgm001002"))


(CONCEPT
(NON-DESCRIPTOR "Bill paying")
(USE "Paying bills")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001005")
(TNR "tgm001003"))


(CONCEPT
(DESCRIPTOR "Billboard posters")
(SN "Large multi-sheet posters; intended for posting on billboards, fences, or similar surfaces.")
(BT "Posters")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000081")
(FCNlctgm "lctgm001006")
(TNR "tgm001004"))


(CONCEPT
(DESCRIPTOR "Billboards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Signs (Notices)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001007")
(TNR "tgm001005"))


(CONCEPT
(DESCRIPTOR "Billheads")
(SN "Documents for itemized accounts of the separate cost of goods sold or shipped, or services performed; pictorial or typographically decorated.")
(BT "Stationery")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000082")
(FCNlctgm "lctgm001008")
(TNR "tgm001006"))


(CONCEPT
(DESCRIPTOR "Billiard balls")
(BT "Balls (Sporting goods)")
(RT "Billiards")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001009")
(TNR "tgm001007"))


(CONCEPT
(NON-DESCRIPTOR "Billiard halls")
(USE "Billiard parlors")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001010")
(TNR "tgm001008"))


(CONCEPT
(DESCRIPTOR "Billiard parlors")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION BILLIARDS for images that focus on the game.")
(UF "Billiard halls")
(UF "Parlors, Billiard")
(UF "Pool halls")
(UF "Pool parlors")
(UF "Poolrooms")
(BT "Sports & recreation facilities")
(RT "Billiard rooms")
(RT "Billiards")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001011")
(TNR "tgm001009"))


(CONCEPT
(DESCRIPTOR "Billiard rooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION BILLIARDS for images that focus on the game.")
(BT "Recreation rooms")
(RT "Billiard parlors")
(RT "Billiards")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001012")
(TNR "tgm001010"))


(CONCEPT
(DESCRIPTOR "Billiard table industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Furniture industry")
(RT "Billiards")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001013")
(TNR "tgm001011"))


(CONCEPT
(DESCRIPTOR "Billiards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Carom billiards")
(UF "Pool")
(BT "Games")
(NT "Snooker")
(RT "Billiard balls")
(RT "Billiard parlors")
(RT "Billiard rooms")
(RT "Billiard table industry")
(CN "Used in a note under BILLIARD ROOMS and BILLIARD PARLORS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001014")
(TNR "tgm001012"))


(CONCEPT
(NON-DESCRIPTOR "Bills (Legislation)")
(USE "Legislation")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001016")
(TNR "tgm001014"))


(CONCEPT
(NON-DESCRIPTOR "Bills of fare")
(USE "Menus")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000083")
(FCNlctgm "lctgm001015")
(TNR "tgm001013"))


(CONCEPT
(NON-DESCRIPTOR "Billy clubs")
(USE "Nightsticks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001017")
(TNR "tgm001015"))


(CONCEPT
(DESCRIPTOR "Bimetallism")
(SN "Use of two metals (such as gold and silver) jointly as a monetary standard with both constituting legal tender at a predetermined ratio.")
(BT "Monetary policy")
(RT "Silver question")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001018")
(TNR "tgm001016"))


(CONCEPT
(NON-DESCRIPTOR "Binding twine")
(USE "Twine")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001019")
(TNR "tgm001017"))


(CONCEPT
(DESCRIPTOR "Bingo")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Beano")
(BT "Games")
(RT "Gambling")
(RT "Lotería (Game)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001020")
(TNR "tgm001018"))


(CONCEPT
(DESCRIPTOR "Binoculars")
(BT "Optical devices")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001021")
(TNR "tgm001019"))


(CONCEPT
(DESCRIPTOR "Biofeedback training")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Therapy")
(RT "Health care")
(RT "Stress")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001022")
(TNR "tgm001020"))


(CONCEPT
(NON-DESCRIPTOR "Biological mechanics")
(USE "Biomechanics")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001023")
(TNR "tgm001021"))


(CONCEPT
(DESCRIPTOR "Biological pest control")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Use of natural predators or parasites to control insects and related pests.")
(BT "Pest control")
(RT "Agriculture")
(RT "Biology")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001024")
(TNR "tgm001022"))


(CONCEPT
(DESCRIPTOR "Biological warfare")
(UF "Bacteriological warfare")
(UF "Germ warfare")
(BT "Warfare")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001025")
(TNR "tgm001023"))


(CONCEPT
(DESCRIPTOR "Biologists")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Scientists")
(RT "Biology")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001026")
(TNR "tgm001024"))


(CONCEPT
(DESCRIPTOR "Biology")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of biology in general and the activities of biologists.")
(BT "Science")
(NT "Anatomy")
(NT "Botany")
(NT "Embryology")
(NT "Marine biology")
(NT "Zoology")
(RT "Artificial pollination")
(RT "Biological pest control")
(RT "Biologists")
(RT "Biomechanics")
(RT "Camouflage (Biology)")
(RT "Dissections")
(RT "Evolution")
(RT "Longevity")
(RT "Pest control")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001027")
(TNR "tgm001025"))


(CONCEPT
(DESCRIPTOR "Biomechanics")
(SN "For the study of the mechanics of biological and especially muscular activity.")
(UF "Biological mechanics")
(BT "Physics")
(RT "Biology")
(RT "Locomotion")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001028")
(TNR "tgm001026"))


(CONCEPT
(DESCRIPTOR "Bioterrorism")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Terrorism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001029")
(TNR "tgm001027"))


(CONCEPT
(DESCRIPTOR "Biplanes")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Airplanes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001030")
(TNR "tgm001028"))


(CONCEPT
(NON-DESCRIPTOR "Bi-racial dating")
(USE "Interracial dating")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001066")
(TNR "tgm001064"))


(CONCEPT
(NON-DESCRIPTOR "Biracial people")
(USE "Racially mixed people")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001031")
(TNR "tgm001029"))


(CONCEPT
(NON-DESCRIPTOR "Birch trees")
(USE "Birches")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001032")
(TNR "tgm001030"))


(CONCEPT
(DESCRIPTOR "Birches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Alders")
(UF "Birch trees")
(BT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001033")
(TNR "tgm001031"))


(CONCEPT
(NON-DESCRIPTOR "Bird baths")
(USE "Birdbaths")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001034")
(TNR "tgm001032"))


(CONCEPT
(NON-DESCRIPTOR "Bird cages")
(USE "Birdcages")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001035")
(TNR "tgm001033"))


(CONCEPT
(NON-DESCRIPTOR "Bird dogs")
(USE "Hunting dogs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001036")
(TNR "tgm001034"))


(CONCEPT
(DESCRIPTOR "Bird feeders")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Birdfeeders")
(BT "Equipment")
(RT "Birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001037")
(TNR "tgm001035"))


(CONCEPT
(NON-DESCRIPTOR "Bird houses")
(USE "Birdhouses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001038")
(TNR "tgm001036"))


(CONCEPT
(NON-DESCRIPTOR "Bird hunting")
(USE "Game bird hunting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001039")
(TNR "tgm001037"))


(CONCEPT
(DESCRIPTOR "Bird watching")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Birding (Bird watching)")
(UF "Birdwatching")
(BT "Recreation")
(RT "Birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001040")
(TNR "tgm001038"))


(CONCEPT
(DESCRIPTOR "Birdbaths")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Baths, Bird")
(UF "Bird baths")
(BT "Yard ornaments")
(RT "Birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001041")
(TNR "tgm001039"))


(CONCEPT
(DESCRIPTOR "Birdcages")
(UF "Bird cages")
(BT "Cages")
(RT "Birds")
(RT "Pets")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001042")
(TNR "tgm001040"))


(CONCEPT
(NON-DESCRIPTOR "Birdfeeders")
(USE "Bird feeders")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001043")
(TNR "tgm001041"))


(CONCEPT
(DESCRIPTOR "Birdhouses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bird houses")
(UF "Houses, Bird")
(BT "Animal housing")
(NT "Dovecotes")
(RT "Birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001044")
(TNR "tgm001042"))


(CONCEPT
(NON-DESCRIPTOR "Birding (Bird watching)")
(USE "Bird watching")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001045")
(TNR "tgm001043"))


(CONCEPT
(DESCRIPTOR "Birds")
(GEO-FACET ":COUNTRY :STATE")
(UF "Chicks")
(UF "Nestlings")
(BT "Animals")
(NT "Albatrosses")
(NT "Birds of prey")
(NT "Bulbuls")
(NT "Chickadees")
(NT "Coots")
(NT "Cormorants")
(NT "Cranes (Birds)")
(NT "Crows")
(NT "Ducks")
(NT "Finches")
(NT "Flamingos")
(NT "Geese")
(NT "Grouse")
(NT "Gulls")
(NT "Herons")
(NT "Hummingbirds")
(NT "Ibis")
(NT "Kingfishers")
(NT "Loons")
(NT "Magpies")
(NT "Mynahs")
(NT "Ostriches")
(NT "Parrots")
(NT "Partridges")
(NT "Peafowl")
(NT "Pelicans")
(NT "Penguins")
(NT "Pheasants")
(NT "Pigeons")
(NT "Poultry")
(NT "Prairie hens")
(NT "Quails")
(NT "Ravens")
(NT "Robins")
(NT "Sandpipers")
(NT "Snipes")
(NT "Starlings")
(NT "Storks")
(NT "Swallows")
(NT "Swans")
(NT "Titmice")
(NT "Toucans")
(NT "Turkeys")
(NT "Vultures")
(NT "Woodcocks")
(NT "Woodpeckers")
(RT "Aviaries")
(RT "Bird feeders")
(RT "Bird watching")
(RT "Birdbaths")
(RT "Birdcages")
(RT "Birdhouses")
(RT "Cockfighting")
(RT "Extinct birds")
(RT "Feathers")
(RT "Firebird (Mythical bird)")
(RT "Game & game birds")
(RT "Game bird hunting")
(RT "Nests")
(RT "Phoenix (Mythical bird)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001046")
(TNR "tgm001044"))


(CONCEPT
(DESCRIPTOR "Birds of prey")
(GEO-FACET ":COUNTRY :STATE")
(UF "Prey, Birds of")
(BT "Birds")
(NT "Eagles")
(NT "Hawks")
(NT "Ospreys")
(NT "Owls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001047")
(TNR "tgm001045"))


(CONCEPT
(DESCRIPTOR "Bird's-eye view prints")
(SN "Bird's-eye views of cities and towns that are lithographs, engravings, or other types of prints including photomechanical ones. Popular in the United States 1870-1910s, but also made earlier.")
(UF "Panoramic maps")
(BT "Bird's-eye views")
(BT "Prints")
(RT "Cityscape prints")
(CN "Used in a note under BIRD'S-EYE VIEWS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000084")
(FCNlctgm "lctgm001048")
(TNR "tgm001046"))


(CONCEPT
(DESCRIPTOR "Bird's-eye views")
(SN "Graphic representations of scenes portrayed as if viewed from above at an oblique angle.  If of a city or town, not generally drawn strictly to scale but showing street patterns, individual buildings, and major landscape features in perspective.")
(UF "Balloon views")
(UF "Views, Bird's-eye")
(BT "Views")
(NT "Bird's-eye view prints")
(RT "Aerial views")
(RT "Maps")
(RT "Panoramic views")
(RT "Projections")
(CN "For the class of engravings, lithographs, and photomechanical prints commonly known as bird's-eye views, use BIRD'S-EYE VIEW PRINTS. Do not use for photographs.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000085")
(FCNlctgm "lctgm001049")
(TNR "tgm001047"))


(CONCEPT
(NON-DESCRIPTOR "Birdwatching")
(USE "Bird watching")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001050")
(TNR "tgm001048"))


(CONCEPT
(DESCRIPTOR "Birth certificates")
(BT "Certificates")
(RT "Family trees")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000086")
(FCNlctgm "lctgm001051")
(TNR "tgm001049"))


(CONCEPT
(DESCRIPTOR "Birth control")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Contraception")
(BT "Health care")
(NT "Abortions")
(NT "Sterilization")
(RT "Births")
(RT "Medicine")
(RT "Population control")
(RT "Women")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001052")
(TNR "tgm001050"))


(CONCEPT
(DESCRIPTOR "Birth defects")
(UF "Abnormalities")
(UF "Malformations")
(BT "Physical characteristics")
(NT "Cretinism")
(RT "Albinos")
(RT "Births")
(RT "Human curiosities")
(RT "People with disabilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001053")
(TNR "tgm001051"))


(CONCEPT
(DESCRIPTOR "Birthday cards")
(BT "Greeting cards")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000087")
(FCNlctgm "lctgm001054")
(TNR "tgm001052"))


(CONCEPT
(DESCRIPTOR "Birthday parties")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Parties")
(RT "Birthdays")
(RT "Children's parties")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001055")
(TNR "tgm001053"))


(CONCEPT
(DESCRIPTOR "Birthdays")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --COMMEMORATION :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B].")
(BT "Anniversaries")
(RT "Birthday parties")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001056")
(TNR "tgm001054"))


(CONCEPT
(DESCRIPTOR "Birthplaces")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --BIRTHPLACE :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B].")
(BT "Historic sites")
(RT "Dwellings")
(CN "Used in a note under DWELLINGS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001057")
(TNR "tgm001055"))


(CONCEPT
(DESCRIPTOR "Births")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Childbirth")
(UF "Home births")
(BT "Events")
(BT "Life cycle")
(RT "Birth control")
(RT "Birth defects")
(RT "Illegitimacy")
(RT "Maternity hospitals")
(RT "Midwives")
(RT "Pregnancy")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001058")
(TNR "tgm001056"))


(CONCEPT
(NON-DESCRIPTOR "Births, Multiple")
(USE "Quadruplets")
(USE "Quintuplets")
(USE "Triplets")
(USE "Twins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001059")
(TNR "tgm001057"))


(CONCEPT
(DESCRIPTOR "Biscuits")
(BT "Bread")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012103"))


(CONCEPT
(DESCRIPTOR "Bishops")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "High ranking prelates in the Christian church; usually administers a diocese.")
(UF "Archbishops")
(BT "Clergy")
(BT "Prelates")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001060")
(TNR "tgm001058"))


(CONCEPT
(DESCRIPTOR "Bison")
(GEO-FACET ":COUNTRY :STATE")
(SN "For the American buffalo. :SEARCH-SUBDIVISION BUFFALOES for buffaloes of the eastern hemisphere.")
(BT "Animals")
(RT "Bison hunting")
(RT "Buffaloes")
(RT "Cattle")
(CN "Used in a note under BUFFALOES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001061")
(TNR "tgm001059"))


(CONCEPT
(DESCRIPTOR "Bison hunting")
(GEO-FACET ":COUNTRY :STATE")
(BT "Big game hunting")
(RT "Bison")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001062")
(TNR "tgm001060"))


(CONCEPT
(DESCRIPTOR "Bites & stings")
(UF "Animal bites")
(UF "Insect bites")
(UF "Stings & bites")
(BT "Wounds & injuries")
(RT "Animal attacks")
(RT "Insects")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001063")
(TNR "tgm001061"))


(CONCEPT
(DESCRIPTOR "Bitters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Beverages")
(RT "Patent medicines")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001064")
(TNR "tgm001062"))


(CONCEPT
(DESCRIPTOR "Bittersweet")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Plants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001065")
(TNR "tgm001063"))


(CONCEPT
(NON-DESCRIPTOR "Black art (Witchcraft)")
(USE "Witchcraft")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001067")
(TNR "tgm001065"))


(CONCEPT
(DESCRIPTOR "Black eyes")
(BT "Eyes")
(BT "Wounds & injuries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001068")
(TNR "tgm001066"))


(CONCEPT
(NON-DESCRIPTOR "Black light works")
(USE "Luminescent works")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000088")
(FCNlctgm "lctgm001069")
(TNR "tgm001067"))


(CONCEPT
(NON-DESCRIPTOR "Black line prints")
(USE "Diazotypes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000089")
(FCNlctgm "lctgm001070")
(TNR "tgm001068"))


(CONCEPT
(DESCRIPTOR "Black lung")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Lung disease caused by coal dust inhalation.")
(BT "Diseases")
(RT "Coal mining")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001071")
(TNR "tgm001069"))


(CONCEPT
(DESCRIPTOR "Black market")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Contraband trade")
(UF "Gray market")
(BT "Commerce")
(RT "Consumer rationing")
(RT "Price regulation")
(RT "Smuggling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001072")
(TNR "tgm001070"))


(CONCEPT
(DESCRIPTOR "Black power")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Movement of Africans Americans to gain control of the political, social, economic, and cultural institutions that effect them. Term especially used in the 1960s and 1970s.")
(BT "Power (Social sciences)")
(RT "Political participation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001073")
(TNR "tgm001071"))


(CONCEPT
(DESCRIPTOR "Black sheep")
(SN "Member of a group who stands in conspicuous and unfavorable contrast to the other members, especially by reason of socially undesirable characteristics.")
(UF "Sheep, Black")
(BT "People")
(BT "Symbols")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001074")
(TNR "tgm001072"))


(CONCEPT
(NON-DESCRIPTOR "Black-and-white prints")
(USE "Photographic prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000090")
(FCNlctgm "lctgm001083")
(TNR "tgm001081"))


(CONCEPT
(DESCRIPTOR "Blackboards")
(UF "Chalkboards")
(BT "Equipment")
(RT "Furniture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001075")
(TNR "tgm001073"))


(CONCEPT
(DESCRIPTOR "Black-eyed Susans")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Rudbeckia")
(BT "Flowers")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012101"))


(CONCEPT
(DESCRIPTOR "Blackface entertainers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Black-face entertainers")
(BT "Entertainers")
(RT "Minstrel shows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001076")
(TNR "tgm001074"))


(CONCEPT
(NON-DESCRIPTOR "Black-face entertainers")
(USE "Blackface entertainers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm011894")
(TNR "tgm001082"))


(CONCEPT
(NON-DESCRIPTOR "Blackface entertainment")
(USE "Minstrel shows")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001077")
(TNR "tgm001075"))


(CONCEPT
(NON-DESCRIPTOR "Black-face entertainment")
(USE "Minstrel shows")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm011893")
(TNR "tgm001083"))


(CONCEPT
(NON-DESCRIPTOR "Blackmail")
(USE "Extortion")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001078")
(TNR "tgm001076"))


(CONCEPT
(NON-DESCRIPTOR "Blackouts")
(USE "Electric power failures")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001079")
(TNR "tgm001077"))


(CONCEPT
(NON-DESCRIPTOR "Blacksmith shops")
(USE "Forge shops")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001080")
(TNR "tgm001078"))


(CONCEPT
(DESCRIPTOR "Blacksmithing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Horse shoeing")
(UF "Horseshoeing")
(BT "Forging")
(RT "Blacksmiths")
(RT "Horseshoes")
(CN "Used in a note under BLACKSMITHS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001081")
(TNR "tgm001079"))


(CONCEPT
(DESCRIPTOR "Blacksmiths")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with manual labor")
(RT "Blacksmithing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001082")
(TNR "tgm001080"))


(CONCEPT
(DESCRIPTOR "Blaming")
(UF "Accusing")
(UF "Censuring")
(UF "Fault finding")
(UF "Pointing the finger")
(UF "Reproaching")
(BT "Interpersonal relations")
(NT "Passing the buck")
(RT "Quarreling")
(RT "Scapegoats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001084")
(TNR "tgm001084"))


(CONCEPT
(DESCRIPTOR "Blankets")
(BT "Textiles")
(RT "Bedrolls")
(RT "Clothing & dress")
(RT "Furnishings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001085")
(TNR "tgm001085"))


(CONCEPT
(NON-DESCRIPTOR "Blast furnaces")
(USE "Furnaces")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001086")
(TNR "tgm001086"))


(CONCEPT
(DESCRIPTOR "Blasting")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Processes & techniques")
(RT "Demolition")
(RT "Explosions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001087")
(TNR "tgm001087"))


(CONCEPT
(DESCRIPTOR "Blazers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Clothing & dress")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001088")
(TNR "tgm001088"))


(CONCEPT
(DESCRIPTOR "Bleachers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Sports & recreation facilities")
(NT "Benches")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012100"))


(CONCEPT
(NON-DESCRIPTOR "Bleeding (Therapy)")
(USE "Phlebotomy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001089")
(TNR "tgm001089"))


(CONCEPT
(NON-DESCRIPTOR "Blessings")
(USE "Benedictions")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001090")
(TNR "tgm001090"))


(CONCEPT
(NON-DESCRIPTOR "Blimps")
(USE "Airships")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001091")
(TNR "tgm001091"))


(CONCEPT
(NON-DESCRIPTOR "Blind embossed prints")
(USE "Inkless intaglio prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000091")
(FCNlctgm "lctgm001092")
(TNR "tgm001092"))


(CONCEPT
(DESCRIPTOR "Blind man's bluff")
(BT "Games")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001093")
(TNR "tgm001093"))


(CONCEPT
(DESCRIPTOR "Blind persons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People with disabilities")
(RT "Blindness")
(RT "Braille")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001094")
(TNR "tgm001094"))


(CONCEPT
(DESCRIPTOR "Blind stamps")
(SN "Symbols or other devices embossed or impressed without ink onto paper or other material. Often used to identify the creator, printer, publisher, or owner.")
(UF "Stamps, Blind")
(BT "Marks (Symbols)")
(RT "Embossed works")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000092")
(FCNlctgm "lctgm001095")
(TNR "tgm001095"))


(CONCEPT
(DESCRIPTOR "Blindfolds")
(BT "Physical restraints")
(RT "Eyes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001096")
(TNR "tgm001096"))


(CONCEPT
(DESCRIPTOR "Blindness")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the physical condition of being without sight.")
(BT "Vision disorders")
(RT "Blind persons")
(RT "Mental states")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001097")
(TNR "tgm001097"))


(CONCEPT
(DESCRIPTOR "Blinds (Shelters)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "A concealing enclosure from which a person may shoot birds or observe wildlife.")
(BT "Shelters")
(RT "Hunting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001098")
(TNR "tgm001098"))


(CONCEPT
(DESCRIPTOR "Blizzards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes the event and any resulting damage.")
(UF "Snowstorms")
(BT "Storms")
(RT "Snow")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001099")
(TNR "tgm001099"))


(CONCEPT
(NON-DESCRIPTOR "Block prints")
(USE "Relief prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000093")
(FCNlctgm "lctgm001100")
(TNR "tgm001100"))


(CONCEPT
(DESCRIPTOR "Blockade running")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Warfare")
(RT "Blockades")
(RT "Ships")
(RT "Smuggling")
(RT "War relief")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001101")
(TNR "tgm001101"))


(CONCEPT
(DESCRIPTOR "Blockades")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Barriers set up by troops or ships to prevent ingress or egress; also restrictive measures to obstruct communication and cut off commerce with an enemy.")
(BT "Warfare")
(RT "Blockade running")
(RT "Embargoes")
(CN ":SUBDIVIDE-BY :NATIONALITY of those imposing the blockade.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001102")
(TNR "tgm001102"))


(CONCEPT
(DESCRIPTOR "Blockhouses")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Military facilities")
(RT "Forts & fortifications")
(RT "Martello towers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001103")
(TNR "tgm001103"))


(CONCEPT
(DESCRIPTOR "Blocks (Toys)")
(UF "Building blocks (Toys)")
(BT "Toys")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001104")
(TNR "tgm001104"))


(CONCEPT
(NON-DESCRIPTOR "Blocks, Glass")
(USE "Glass blocks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001105")
(TNR "tgm001105"))


(CONCEPT
(NON-DESCRIPTOR "Blocks, Printing")
(USE "Printing blocks")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000094")
(FCNlctgm "lctgm001106")
(TNR "tgm001106"))


(CONCEPT
(DESCRIPTOR "Blood")
(BT "Body parts")
(RT "Anemia")
(RT "Blood donations")
(RT "Blood testing")
(RT "Blood transfusions")
(RT "Cardiovascular system")
(RT "Human body")
(RT "Phlebotomy")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001107")
(TNR "tgm001107"))


(CONCEPT
(NON-DESCRIPTOR "Blood circulation")
(USE "Cardiovascular system")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001108")
(TNR "tgm001108"))


(CONCEPT
(DESCRIPTOR "Blood donations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Donations of blood")
(BT "Health care")
(RT "Blood")
(RT "Blood transfusions")
(RT "Medicine")
(RT "Phlebotomy")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001109")
(TNR "tgm001109"))


(CONCEPT
(NON-DESCRIPTOR "Blood letting")
(USE "Phlebotomy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001110")
(TNR "tgm001110"))


(CONCEPT
(NON-DESCRIPTOR "Blood pressure, High")
(USE "Hypertension")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001111")
(TNR "tgm001111"))


(CONCEPT
(DESCRIPTOR "Blood testing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Health care")
(RT "Blood")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001112")
(TNR "tgm001112"))


(CONCEPT
(DESCRIPTOR "Blood transfusions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Health care")
(RT "Blood")
(RT "Blood donations")
(RT "Medicine")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001113")
(TNR "tgm001113"))


(CONCEPT
(DESCRIPTOR "Bloodhounds")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Dogs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001114")
(TNR "tgm001114"))


(CONCEPT
(NON-DESCRIPTOR "Bloodletting")
(USE "Phlebotomy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001115")
(TNR "tgm001115"))


(CONCEPT
(DESCRIPTOR "Bloody shirt")
(SN "Means employed to stir up or revive party or sectional animosity.")
(UF "Waving the bloody shirt")
(BT "Symbols")
(RT "Clothing & dress")
(RT "Prejudice")
(RT "Sectionalism (United States)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001116")
(TNR "tgm001116"))


(CONCEPT
(DESCRIPTOR "Bloomers")
(BT "Clothing & dress")
(RT "Underwear")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001117")
(TNR "tgm001117"))


(CONCEPT
(NON-DESCRIPTOR "Blossoms")
(USE "Flowers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001118")
(TNR "tgm001118"))


(CONCEPT
(NON-DESCRIPTOR "Blue collar (Social class)")
(USE "Working class")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001120")
(TNR "tgm001120"))


(CONCEPT
(NON-DESCRIPTOR "Blue collar workers")
(USE "Laborers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001119")
(TNR "tgm001119"))


(CONCEPT
(NON-DESCRIPTOR "Blue jeans")
(USE "Jeans (Clothing)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001121")
(TNR "tgm001121"))


(CONCEPT
(DESCRIPTOR "Blue laws")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Laws")
(RT "Alcoholic beverages")
(RT "Prohibition")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001122")
(TNR "tgm001122"))


(CONCEPT
(NON-DESCRIPTOR "Blue line prints")
(USE "Diazotypes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000095")
(FCNlctgm "lctgm001123")
(TNR "tgm001123"))


(CONCEPT
(DESCRIPTOR "Blueberries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Berries")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012142"))


(CONCEPT
(DESCRIPTOR "Bluefish")
(GEO-FACET ":COUNTRY :STATE")
(BT "Fish")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001124")
(TNR "tgm001124"))


(CONCEPT
(DESCRIPTOR "Blueprints")
(SN "Cyanotypes that reproduce designs as white lines against a blue background.  Introduced in the United States ca. 1876; predominant method for reproducing architectural and engineering drawings by the 1950s; largely discontinued by 1980.")
(BT "Cyanotypes")
(BT "Reproductions")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000096")
(FCNlctgm "lctgm001125")
(TNR "tgm001125"))


(CONCEPT
(DESCRIPTOR "Blues music")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Music")
(RT "Blues singers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001126")
(TNR "tgm001126"))


(CONCEPT
(DESCRIPTOR "Blues singers")
(UF "Blues vocalists")
(BT "Singers")
(RT "Blues music")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001127")
(TNR "tgm001127"))


(CONCEPT
(NON-DESCRIPTOR "Blues vocalists")
(USE "Blues singers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001128")
(TNR "tgm001128"))


(CONCEPT
(NON-DESCRIPTOR "Bluffs")
(USE "Cliffs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001129")
(TNR "tgm001129"))


(CONCEPT
(DESCRIPTOR "Board games")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Games")
(NT "Backgammon")
(NT "Checkers")
(NT "Chess")
(NT "Mah jong")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001130")
(TNR "tgm001130"))


(CONCEPT
(NON-DESCRIPTOR "Board rooms")
(USE "Conference rooms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001131")
(TNR "tgm001131"))


(CONCEPT
(NON-DESCRIPTOR "Boarding houses")
(USE "Lodging houses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001132")
(TNR "tgm001132"))


(CONCEPT
(DESCRIPTOR "Boarding schools")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Residential schools")
(UF "Schools, Boarding")
(BT "Schools")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001133")
(TNR "tgm001133"))


(CONCEPT
(NON-DESCRIPTOR "Boardrooms")
(USE "Conference rooms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001134")
(TNR "tgm001134"))


(CONCEPT
(NON-DESCRIPTOR "Boards of education")
(USE "School boards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001135")
(TNR "tgm001136"))


(CONCEPT
(DESCRIPTOR "Boards of trade")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "In the United States, bodies organized for the advancement and protection of business interests. Includes activities and structures.")
(BT "Commercial organizations")
(RT "Chambers of commerce")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001136")
(TNR "tgm001137"))


(CONCEPT
(NON-DESCRIPTOR "Boards, Game")
(USE "Gameboards")
(FUN "Formerly TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000097")
(TNR "tgm001135"))


(CONCEPT
(DESCRIPTOR "Boardwalks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Walkways")
(RT "Amusement piers")
(RT "Beaches")
(RT "Penny arcades")
(RT "Streets")
(RT "Waterfronts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001137")
(TNR "tgm001138"))


(CONCEPT
(DESCRIPTOR "Boars")
(GEO-FACET ":COUNTRY :STATE")
(BT "Swine")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001138")
(TNR "tgm001139"))


(CONCEPT
(NON-DESCRIPTOR "Boasting")
(USE "Bragging")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001139")
(TNR "tgm001140"))


(CONCEPT
(DESCRIPTOR "Boat & ship companies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Business enterprises")
(RT "Vessels")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001147")
(TNR "tgm001148"))


(CONCEPT
(DESCRIPTOR "Boat & ship industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Boat building")
(UF "Boatyards")
(UF "Dockyards")
(UF "Dry docks")
(UF "Shipbuilding")
(UF "Shipyards")
(BT "Transportation industry")
(RT "Boat & ship industry strikes")
(RT "Construction industry")
(RT "Launchings")
(RT "Naval yards & naval stations")
(RT "Vessels")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001148")
(TNR "tgm001149"))


(CONCEPT
(DESCRIPTOR "Boat & ship industry strikes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Strikes")
(RT "Boat & ship industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001149")
(TNR "tgm001150"))


(CONCEPT
(NON-DESCRIPTOR "Boat building")
(USE "Boat & ship industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001140")
(TNR "tgm001141"))


(CONCEPT
(DESCRIPTOR "Boat clubs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Clubs")
(NT "Yacht clubs")
(CN ":DOUBLE-INDEX ORGANIZATIONS'  FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001141")
(TNR "tgm001142"))


(CONCEPT
(DESCRIPTOR "Boat engines")
(UF "Motorboat engines")
(UF "Ship engines")
(BT "Engines")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001142")
(TNR "tgm001143"))


(CONCEPT
(DESCRIPTOR "Boat graveyards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Graveyards, Boat")
(BT "Junkyards")
(RT "Vessels")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001143")
(TNR "tgm001144"))


(CONCEPT
(NON-DESCRIPTOR "Boat landings")
(USE "Beaches")
(USE "Piers & wharves")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001144")
(TNR "tgm001145"))


(CONCEPT
(NON-DESCRIPTOR "Boat people")
(USE "Refugees")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001145")
(TNR "tgm001146"))


(CONCEPT
(NON-DESCRIPTOR "Boat racing")
(USE "Regattas")
(USE "Steamboat racing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001146")
(TNR "tgm001147"))


(CONCEPT
(DESCRIPTOR "Boathouses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "A building usually built partly in the water for the housing or storing of boats.")
(BT "Transportation facilities")
(RT "Sports & recreation facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001150")
(TNR "tgm001151"))


(CONCEPT
(NON-DESCRIPTOR "Boating")
(USE "Boats")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001151")
(TNR "tgm001152"))


(CONCEPT
(DESCRIPTOR "Boatmen")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with transportation")
(RT "Boats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001152")
(TNR "tgm001153"))


(CONCEPT
(DESCRIPTOR "Boats")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Boating")
(BT "Vessels")
(NT "Barges")
(NT "Canal boats")
(NT "Canoes")
(NT "Coracles")
(NT "Dhows")
(NT "Dories (Boats)")
(NT "Ferries")
(NT "Fireboats")
(NT "Fishing boats")
(NT "Flatboats")
(NT "Glass bottom boats")
(NT "Houseboats")
(NT "Iceboats")
(NT "Junks")
(NT "Kayaks")
(NT "Keelboats")
(NT "Lifeboats")
(NT "Longboats")
(NT "Motorboats")
(NT "Paddleboats")
(NT "Pilot boats")
(NT "Racing shells")
(NT "Rafts")
(NT "Rowboats")
(NT "Sailboats")
(NT "Sampans")
(NT "Showboats")
(NT "Tugboats")
(RT "Boatmen")
(RT "Boatwomen")
(RT "Portages")
(RT "Regattas")
(RT "Ships")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001153")
(TNR "tgm001154"))


(CONCEPT
(DESCRIPTOR "Boatwomen")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with transportation")
(RT "Boats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001154")
(TNR "tgm001155"))


(CONCEPT
(NON-DESCRIPTOR "Boatyards")
(USE "Boat & ship industry")
(USE "Naval yards & naval stations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001155")
(TNR "tgm001156"))


(CONCEPT
(DESCRIPTOR "Bobbing for apples")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Games")
(RT "Apples")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001156")
(TNR "tgm001157"))


(CONCEPT
(DESCRIPTOR "Bobsleds")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes the activity of bobsledding.")
(BT "Sleds & sleighs")
(HN "Changed 7/1989 from BOBSLEDDING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001157")
(TNR "tgm001158"))


(CONCEPT
(DESCRIPTOR "Bobwhites")
(GEO-FACET ":COUNTRY :STATE")
(BT "Quails")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001158")
(TNR "tgm001159"))


(CONCEPT
(DESCRIPTOR "Boccie (Game)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Sports")
(RT "Bowling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001159")
(TNR "tgm001160"))


(CONCEPT
(NON-DESCRIPTOR "Bodies")
(USE "Dead animals")
(USE "Dead persons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001160")
(TNR "tgm001161"))


(CONCEPT
(DESCRIPTOR "Bodies of water")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Water, Bodies of")
(BT "Physical geographic features")
(NT "Basins (Bodies of water)")
(NT "Bays (Bodies of water)")
(NT "Channels")
(NT "Harbors")
(NT "Lakes & ponds")
(NT "Pools")
(NT "Puddles")
(NT "Rivers")
(NT "Seas")
(NT "Springs")
(NT "Streams")
(NT "Territorial waters")
(RT "Beaches")
(RT "Beaver dams")
(RT "Floating")
(RT "Floods")
(RT "Hydraulic facilities")
(RT "Land")
(RT "Nature")
(RT "Oases")
(RT "Rapids")
(RT "Reflections")
(RT "Sand boils")
(RT "Wading")
(RT "Water pollution")
(RT "Waterfalls")
(RT "Waterfronts")
(RT "Waterways")
(RT "Wetlands")
(RT "Whirlpools")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001161")
(TNR "tgm001162"))


(CONCEPT
(DESCRIPTOR "Bodily functions")
(BT "Activities")
(NT "Burping")
(NT "Coughing")
(NT "Defecation")
(NT "Flatulence")
(NT "Perspiration")
(NT "Sneezing")
(NT "Urination")
(NT "Vomiting")
(NT "Yawning")
(RT "Animal behavior")
(RT "Human body")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001162")
(TNR "tgm001163"))


(CONCEPT
(DESCRIPTOR "Body image")
(BT "Mental states")
(RT "Human body")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001163")
(TNR "tgm001164"))


(CONCEPT
(DESCRIPTOR "Body marking")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Body-marking")
(BT "Manners & customs")
(NT "Body painting")
(NT "Face painting")
(NT "Tattoos")
(RT "Branding (Punishment)")
(RT "Scars")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001164")
(TNR "tgm001165"))


(CONCEPT
(DESCRIPTOR "Body painting")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Body marking")
(BT "Painting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001165")
(TNR "tgm001166"))


(CONCEPT
(DESCRIPTOR "Body parts")
(NT "Arms (Anatomy)")
(NT "Backs (Anatomy)")
(NT "Blood")
(NT "Bones (Body parts)")
(NT "Brains")
(NT "Breasts")
(NT "Buttocks")
(NT "Cardiovascular system")
(NT "DNA")
(NT "Ears")
(NT "Eyes")
(NT "Faces")
(NT "Feathers")
(NT "Feet")
(NT "Fingers")
(NT "Hair")
(NT "Hands")
(NT "Heads (Anatomy)")
(NT "Hearts (Anatomy)")
(NT "Hides & skins")
(NT "Horns (Animal)")
(NT "Legs")
(NT "Mouths")
(NT "Muscles")
(NT "Noses")
(NT "Plant parts")
(NT "Scalps")
(NT "Shells (Animal)")
(NT "Skeletons")
(NT "Skin")
(NT "Stomachs")
(NT "Teeth")
(NT "Tongues")
(RT "Cells (Biology)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001166")
(TNR "tgm001167"))


(CONCEPT
(NON-DESCRIPTOR "Body, Human")
(USE "Human body")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001170")
(TNR "tgm001171"))


(CONCEPT
(NON-DESCRIPTOR "Bodybuilders")
(USE "Strong men")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001167")
(TNR "tgm001168"))


(CONCEPT
(NON-DESCRIPTOR "Bodybuilding")
(USE "Weight lifting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001168")
(TNR "tgm001169"))


(CONCEPT
(DESCRIPTOR "Bodyguards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with health & safety")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001169")
(TNR "tgm001170"))


(CONCEPT
(NON-DESCRIPTOR "Body-marking")
(USE "Body marking")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001171")
(TNR "tgm001172"))


(CONCEPT
(NON-DESCRIPTOR "Bogs")
(USE "Wetlands")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001172")
(TNR "tgm001173"))


(CONCEPT
(DESCRIPTOR "Bohemians")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Nonconformists")
(BT "People")
(RT "Beat generation")
(RT "Hippies")
(RT "Manners & customs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001173")
(TNR "tgm001174"))


(CONCEPT
(DESCRIPTOR "Boiler industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(RT "Boilers")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILTIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001174")
(TNR "tgm001175"))


(CONCEPT
(DESCRIPTOR "Boilers")
(BT "Equipment")
(RT "Boiler industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001175")
(TNR "tgm001176"))


(CONCEPT
(NON-DESCRIPTOR "Bolshevism")
(USE "Communism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001176")
(TNR "tgm001177"))


(CONCEPT
(DESCRIPTOR "Bolts & nuts")
(UF "Nuts (Hardware)")
(BT "Hardware")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001177")
(TNR "tgm001178"))


(CONCEPT
(NON-DESCRIPTOR "Bomb attacks")
(USE "Bombings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001178")
(TNR "tgm001179"))


(CONCEPT
(NON-DESCRIPTOR "Bomb damage")
(USE "War damage")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001179")
(TNR "tgm001180"))


(CONCEPT
(NON-DESCRIPTOR "Bomb shelters")
(USE "Air raid shelters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001180")
(TNR "tgm001181"))


(CONCEPT
(DESCRIPTOR "Bombardment")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Sustained military attacks on cities, military positions, and other places with bombs, shells, rockets, or other explosive missiles.  :SEARCH-SUBDIVISION AERIAL BOMBING for images of military bombardment by bombs dropped from the air and under BOMBINGS for the use of explosive devices for the purposes of political terrrorism, protest, etc.")
(BT "Warfare")
(RT "Aerial bombings")
(RT "Bombings")
(CN "Used in a note under BOMBINGS and AERIAL BOMBINGS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001181")
(TNR "tgm001182"))


(CONCEPT
(DESCRIPTOR "Bombers")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Airplanes")
(RT "Air warfare")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001182")
(TNR "tgm001183"))


(CONCEPT
(DESCRIPTOR "Bombings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the use of explosive devices for the purposes of political terrorism, protest, etc.  :SEARCH-SUBDIVISION AERIAL BOMBINGS for images of military bombardment by bombs dropped from the air and under BOMBARDMENT for sustained military attacks on cities, military positions, and other places with bombs, shells, rockets, or other explosive missiles.")
(UF "Bomb attacks")
(BT "Violence")
(RT "Aerial bombings")
(RT "Bombardment")
(RT "Bombs")
(RT "Explosions")
(RT "Nuclear weapons")
(RT "Ordnance testing")
(RT "Terrorism")
(CN "Used in a note under AERIAL BOMBINGS and BOMBARDMENT.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001183")
(TNR "tgm001184"))


(CONCEPT
(NON-DESCRIPTOR "Bomb-proof buildings")
(USE "Bombproof construction")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001186")
(TNR "tgm001187"))


(CONCEPT
(DESCRIPTOR "Bombproof construction")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bomb-proof buildings")
(UF "Building, Bombproof")
(BT "Construction")
(RT "Air raid shelters")
(RT "Forts & fortifications")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001184")
(TNR "tgm001185"))


(CONCEPT
(DESCRIPTOR "Bombs")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Arms & armament")
(BT "Explosives")
(NT "Atomic bombs")
(RT "Artillery (Weaponry)")
(RT "Bombings")
(RT "Nuclear weapons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001185")
(TNR "tgm001186"))


(CONCEPT
(NON-DESCRIPTOR "Bondage")
(USE "Physical restraints")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001187")
(TNR "tgm001188"))


(CONCEPT
(NON-DESCRIPTOR "Bonds (Financial records)")
(USE "Bonds (Negotiable instruments)")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000098")
(FCNlctgm "lctgm001188")
(TNR "tgm001189"))


(CONCEPT
(DESCRIPTOR "Bonds (Negotiable instruments)")
(SN "Interest-bearing certificates indicating public or private indebtedness.")
(UF "Bonds (Financial records)")
(BT "Certificates")
(RT "Saving & investment")
(RT "War bonds & funds")
(HN "Changed 1/97.  Formerly, BONDS (NEGOTIABLE INSTRUMENTS) may have been indexed as BONDS (FINANCIAL RECORDS).")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000099")
(FCNlctgm "lctgm001189")
(TNR "tgm001190"))


(CONCEPT
(NON-DESCRIPTOR "Bone fractures")
(USE "Fractures (Bones)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001190")
(TNR "tgm001191"))


(CONCEPT
(DESCRIPTOR "Bones (Body parts)")
(BT "Body parts")
(NT "Wishbones")
(RT "Death's head")
(RT "Fractures (Bones)")
(RT "Skeletons")
(RT "Skull & crossbones")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001191")
(TNR "tgm001192"))


(CONCEPT
(DESCRIPTOR "Bones (Musical instrument)")
(BT "Percussion instruments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001192")
(TNR "tgm001193"))


(CONCEPT
(NON-DESCRIPTOR "Bongo drums")
(USE "Hand drums")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012141"))


(CONCEPT
(DESCRIPTOR "Bonnets")
(SN "Head coverings for women or small children made of cloth or straw usually tied under the chin with ribbons or strings and made with or without a brim.")
(UF "Poke bonnets")
(UF "Sunbonnets")
(BT "Hats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001193")
(TNR "tgm001194"))


(CONCEPT
(DESCRIPTOR "Bonsai")
(BT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001194")
(TNR "tgm001195"))


(CONCEPT
(DESCRIPTOR "Booby traps")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Explosives")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001195")
(TNR "tgm001196"))


(CONCEPT
(DESCRIPTOR "Book & magazine posters")
(SN "Posters issued to advertise books, magazines, and newspapers, especially artist-designed posters issued in the United States starting ca. 1890.")
(UF "Magazine posters")
(UF "Newspaper posters")
(UF "Periodical posters")
(BT "Posters")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000105")
(FCNlctgm "lctgm001212")
(TNR "tgm001197"))


(CONCEPT
(DESCRIPTOR "Book burning")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Burning of books")
(BT "Censorship")
(RT "Books")
(RT "Fires")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001196")
(TNR "tgm001198"))


(CONCEPT
(NON-DESCRIPTOR "Book cases")
(USE "Bookcases")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001197")
(TNR "tgm001199"))


(CONCEPT
(DESCRIPTOR "Book clubs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Clubs")
(RT "Book talks")
(RT "Books")
(RT "Reading")
(CN ":DOUBLE-INDEX CLUBHOUSES or ORGANIZATIONS'  FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001198")
(TNR "tgm001200"))


(CONCEPT
(DESCRIPTOR "Book conveyors")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Conveying systems")
(RT "Books")
(RT "Bookstacks")
(RT "Libraries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001199")
(TNR "tgm001201"))


(CONCEPT
(DESCRIPTOR "Book covers")
(SN "Covers forming the binding or outer enclosure of a hardback or paperback book.  Includes detached covers.")
(BT "Covers (Illustration)")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000100")
(FCNlctgm "lctgm001200")
(TNR "tgm001202"))


(CONCEPT
(NON-DESCRIPTOR "Book donations")
(USE "Book drives")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001201")
(TNR "tgm001203"))


(CONCEPT
(DESCRIPTOR "Book drives")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Book donations")
(UF "Drives, Book")
(BT "Community service")
(RT "Books")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001202")
(TNR "tgm001204"))


(CONCEPT
(DESCRIPTOR "Book ends")
(BT "Equipment")
(RT "Bookcases")
(RT "Books")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001203")
(TNR "tgm001205"))


(CONCEPT
(NON-DESCRIPTOR "Book exhibitions")
(USE "Book fairs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001204")
(TNR "tgm001206"))


(CONCEPT
(DESCRIPTOR "Book fairs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities, structures, and sites.")
(UF "Book exhibitions")
(BT "Exhibitions")
(RT "Bookselling")
(RT "Publishing industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001205")
(TNR "tgm001207"))


(CONCEPT
(DESCRIPTOR "Book illustrations")
(SN "Illustrations in books or pamphlets, whether photographs, photomechanical prints, or other media; whether still part of or detached from the volume.  Also, drawings, photographs, prints, and other pictures made to be reproduced as illustrations, whether or not they were ever published.")
(UF "Pamphlet illustrations")
(BT "Illustrations")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000101")
(FCNlctgm "lctgm001206")
(TNR "tgm001208"))


(CONCEPT
(DESCRIPTOR "Book jackets")
(SN "Detachable flexible covers, usually paper, designed for or published with a book.")
(UF "Book wrappers")
(UF "Dust jackets")
(UF "Jackets, Book")
(BT "Packaging")
(CN "In Binding Terms: A Thesaurus for Use in Rare Book and Special Collections Cataloguing, the term \"Dust jackets\" is used for \"Book jackets.\"")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000102")
(FCNlctgm "lctgm001207")
(TNR "tgm001209"))


(CONCEPT
(NON-DESCRIPTOR "Book plates")
(USE "Bookplates")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000103")
(FCNlctgm "lctgm001208")
(TNR "tgm001210"))


(CONCEPT
(NON-DESCRIPTOR "Book signings")
(USE "Autographing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001209")
(TNR "tgm001211"))


(CONCEPT
(DESCRIPTOR "Book talks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Entertainment")
(BT "Public speaking")
(RT "Book clubs")
(RT "Books")
(RT "Libraries")
(RT "Reading")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001210")
(TNR "tgm001212"))


(CONCEPT
(NON-DESCRIPTOR "Book trade")
(USE "Bookselling")
(USE "Publishing industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001211")
(TNR "tgm001213"))


(CONCEPT
(NON-DESCRIPTOR "Book wrappers")
(USE "Book jackets")
(FUN "Formerly TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000104")
(TNR "tgm001214"))


(CONCEPT
(DESCRIPTOR "Bookbinding")
(BT "Processes & techniques")
(RT "Books")
(RT "Handicraft")
(RT "Leather industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001213")
(TNR "tgm001215"))


(CONCEPT
(DESCRIPTOR "Bookcases")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Book cases")
(UF "Bookshelves")
(UF "Cases, Book")
(BT "Furniture")
(RT "Book ends")
(RT "Bookstacks")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001214")
(TNR "tgm001216"))


(CONCEPT
(NON-DESCRIPTOR "Booklets")
(USE "Leaflets")
(USE "Pamphlets")
(USE "Viewbooks")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000106")
(FCNlctgm "lctgm001215")
(TNR "tgm001217"))


(CONCEPT
(DESCRIPTOR "Bookmarks")
(SN "Paper, cardboard, cloth, or other markers used to hold a place in a book.")
(BT "Ephemera")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000107")
(FCNlctgm "lctgm001216")
(TNR "tgm001218"))


(CONCEPT
(DESCRIPTOR "Bookmobiles")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Vehicles")
(RT "Libraries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001217")
(TNR "tgm001219"))


(CONCEPT
(DESCRIPTOR "Bookplates")
(SN "Book owners' identification labels; usually intended for pasting inside a book.")
(UF "Book plates")
(UF "Ex libris")
(BT "Labels")
(NT "Armorial bookplates")
(RT "Ownership marks")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000108")
(FCNlctgm "lctgm001218")
(TNR "tgm001220"))


(CONCEPT
(DESCRIPTOR "Books")
(SN "Form: Published non-periodical volumes in bound codex form, usually with 49 or more pages. Search also under terms beginning with BOOK. SUBJECT: For images that focus on books. :SEARCH-SUBDIVISION READING for activities.")
(BT "Objects")
(NT "Almanacs")
(NT "Buddhist sacred books")
(NT "Encyclopedias & dictionaries")
(NT "Flip books")
(NT "Registers")
(NT "Religious books")
(NT "Telephone directories")
(RT "Book burning")
(RT "Book clubs")
(RT "Book conveyors")
(RT "Book drives")
(RT "Book ends")
(RT "Book talks")
(RT "Bookbinding")
(RT "Bookstacks")
(RT "Bookstores")
(RT "Leaflets")
(RT "Libraries")
(RT "Pamphlets")
(RT "Publishing industry")
(RT "Secondhand bookstores")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000109")
(FCNlctgm "lctgm001219")
(TNR "tgm001221"))


(CONCEPT
(DESCRIPTOR "Bookselling")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For bookselling outside of bookstores.")
(UF "Book trade")
(UF "Colportage")
(BT "Selling")
(RT "Book fairs")
(RT "Bookstores")
(RT "Publishing industry")
(RT "Secondhand bookstores")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001220")
(TNR "tgm001222"))


(CONCEPT
(NON-DESCRIPTOR "Bookshelves")
(USE "Bookcases")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001221")
(TNR "tgm001223"))


(CONCEPT
(DESCRIPTOR "Bookstacks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For sets of shelves or bookcases usually separated by narrow aisles, used for compactly storing books.")
(UF "Stacks, Book")
(BT "Furniture")
(RT "Book conveyors")
(RT "Bookcases")
(RT "Books")
(RT "Libraries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001222")
(TNR "tgm001224"))


(CONCEPT
(DESCRIPTOR "Bookstores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Stores & shops")
(NT "Secondhand bookstores")
(RT "Books")
(RT "Bookselling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001223")
(TNR "tgm001225"))


(CONCEPT
(DESCRIPTOR "Boomerangs")
(BT "Throwing sticks")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001224")
(TNR "tgm001226"))


(CONCEPT
(NON-DESCRIPTOR "Boot industry")
(USE "Shoe industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001225")
(TNR "tgm001227"))


(CONCEPT
(NON-DESCRIPTOR "Boot making")
(USE "Shoemaking")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001226")
(TNR "tgm001228"))


(CONCEPT
(NON-DESCRIPTOR "Bootblacks")
(USE "Shoe shiners")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001227")
(TNR "tgm001229"))


(CONCEPT
(NON-DESCRIPTOR "Booting")
(USE "Kicking")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001228")
(TNR "tgm001230"))


(CONCEPT
(NON-DESCRIPTOR "Bootlegging")
(USE "Prohibition")
(USE "Stills (Distilleries)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001229")
(TNR "tgm001231"))


(CONCEPT
(DESCRIPTOR "Boots")
(SN "Footwear usually of leather or rubber that covers the foot and part or all of the legs.")
(BT "Footwear")
(NT "Cowboy boots")
(HN "Changed 8/1988 from non-postable term (Use SHOES).")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001230")
(TNR "tgm001232"))


(CONCEPT
(NON-DESCRIPTOR "Booty")
(USE "War destruction & pillage")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001231")
(TNR "tgm001233"))


(CONCEPT
(NON-DESCRIPTOR "Borders")
(USE "Boundaries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001232")
(TNR "tgm001234"))


(CONCEPT
(DESCRIPTOR "Borders (Ornament areas)")
(BT "Patterns (Design elements)")
(RT "Graphic design")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001233")
(TNR "tgm001235"))


(CONCEPT
(DESCRIPTOR "Boredom")
(UF "Ennui")
(BT "Mental states")
(RT "Apathy")
(RT "Fatigue")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001234")
(TNR "tgm001236"))


(CONCEPT
(NON-DESCRIPTOR "Borers")
(USE "Drilling & boring machinery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001235")
(TNR "tgm001237"))


(CONCEPT
(DESCRIPTOR "Boring")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For cutting of holes in earth or rocks to determine the nature of the strata penetrated or to create an outlet for oil, water, or gas. :SEARCH-SUBDIVISION DRILLING for drilling of holes in metal or wood for construction and manufacturing purposes.")
(BT "Processes & techniques")
(NT "Underwater drilling")
(RT "Construction")
(RT "Drilling")
(RT "Drilling & boring machinery")
(RT "Excavation")
(RT "Petroleum industry")
(CN "Used in a note under DRILLING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001236")
(TNR "tgm001238"))


(CONCEPT
(NON-DESCRIPTOR "Boring machinery")
(USE "Drilling & boring machinery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001237")
(TNR "tgm001239"))


(CONCEPT
(NON-DESCRIPTOR "Bosses")
(USE "Supervisors")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001238")
(TNR "tgm001240"))


(CONCEPT
(DESCRIPTOR "Bosses (Architecture)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Raised ornaments used in architectural elements.")
(BT "Architectural decorations & ornaments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001239")
(TNR "tgm001241"))


(CONCEPT
(NON-DESCRIPTOR "Botanical drawings")
(USE "Botanical illustrations")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000110")
(FCNlctgm "lctgm001240")
(TNR "tgm001242"))


(CONCEPT
(DESCRIPTOR "Botanical gardens")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Arboretums")
(BT "Gardens")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001241")
(TNR "tgm001243"))


(CONCEPT
(DESCRIPTOR "Botanical illustrations")
(SN "Illustrations of plants or plant life; or illustrations made to document botanical specimens.")
(UF "Botanical drawings")
(UF "Drawings, Botanical")
(BT "Scientific illustrations")
(FUN "FUN: Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000111")
(FCNlctgm "lctgm001242")
(TNR "tgm001244"))


(CONCEPT
(DESCRIPTOR "Botany")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of botany in general and the activities of botanists.")
(BT "Biology")
(RT "Paleontology")
(RT "Plants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001243")
(TNR "tgm001245"))


(CONCEPT
(DESCRIPTOR "Bottle feeding")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Feeding")
(RT "Breast feeding")
(RT "Children")
(RT "Infants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001244")
(TNR "tgm001246"))


(CONCEPT
(DESCRIPTOR "Bottle industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(RT "Bottles")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001245")
(TNR "tgm001247"))


(CONCEPT
(NON-DESCRIPTOR "Bottled ships")
(USE "Ship models in bottles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001246")
(TNR "tgm001248"))


(CONCEPT
(DESCRIPTOR "Bottles")
(BT "Containers")
(RT "Bottle industry")
(RT "Glassware")
(RT "Ship models in bottles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001247")
(TNR "tgm001249"))


(CONCEPT
(DESCRIPTOR "Bottling industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(RT "Beverage industry")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001248")
(TNR "tgm001250"))


(CONCEPT
(DESCRIPTOR "Boudoir card photographs")
(SN "Card photographs; mounts measure approximately 8.5 x 5.5 in. (22 x 14 cm.).  Introduced in the United States ca. 1890.")
(BT "Card photographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000112")
(FCNlctgm "lctgm001249")
(TNR "tgm001251"))


(CONCEPT
(NON-DESCRIPTOR "Boudoir photographs")
(USE "Glamour photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000113")
(FCNlctgm "lctgm001250")
(TNR "tgm001252"))


(CONCEPT
(DESCRIPTOR "Boudoirs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Women's bedrooms, dressing rooms, or private sitting rooms.")
(UF "Dressing rooms")
(BT "Interiors")
(RT "Bedrooms")
(RT "Living rooms")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001251")
(TNR "tgm001253"))


(CONCEPT
(DESCRIPTOR "Boulders")
(GEO-FACET ":COUNTRY :STATE")
(SN "Detached and rounded or much-worn masses of rock.")
(BT "Rocks")
(RT "Artificial rock formations")
(RT "Rock formations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001252")
(TNR "tgm001254"))


(CONCEPT
(DESCRIPTOR "Boundaries")
(GEO-FACET ":COUNTRY :STATE")
(UF "Borders")
(BT "Law & legal affairs")
(BT "Physical geographic features")
(RT "Annexations")
(RT "Boundary markers")
(RT "Geography")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001253")
(TNR "tgm001255"))


(CONCEPT
(DESCRIPTOR "Boundary markers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Markers, Boundary")
(BT "Monuments & memorials")
(RT "Boundaries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001254")
(TNR "tgm001256"))


(CONCEPT
(DESCRIPTOR "Bouquets")
(BT "Flower arrangements")
(RT "Festive decorations")
(RT "Flowers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001255")
(TNR "tgm001257"))


(CONCEPT
(NON-DESCRIPTOR "Bourgeoisie")
(USE "Middle class")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001256")
(TNR "tgm001258"))


(CONCEPT
(DESCRIPTOR "Bow ties")
(BT "Neckties")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012140"))


(CONCEPT
(DESCRIPTOR "Bow windows")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Bay windows that are curved in plan.")
(UF "Windows, Bow")
(BT "Bay windows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001257")
(TNR "tgm001259"))


(CONCEPT
(NON-DESCRIPTOR "Bowers")
(USE "Arbors (Bowers)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001258")
(TNR "tgm001260"))


(CONCEPT
(DESCRIPTOR "Bowing")
(BT "Etiquette")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001259")
(TNR "tgm001261"))


(CONCEPT
(DESCRIPTOR "Bowler hats")
(UF "Bowlers (Hats)")
(UF "Derbies")
(BT "Hats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001260")
(TNR "tgm001262"))


(CONCEPT
(DESCRIPTOR "Bowlers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bowling leagues")
(UF "Bowling teams")
(BT "Athletes")
(RT "Bowling")
(RT "Bowling alleys")
(CN "Geographical subdivision indicates place where team or player is based.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001261")
(TNR "tgm001263"))


(CONCEPT
(NON-DESCRIPTOR "Bowlers (Hats)")
(USE "Bowler hats")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001262")
(TNR "tgm001264"))


(CONCEPT
(DESCRIPTOR "Bowling")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Sports")
(RT "Boccie (Game)")
(RT "Bowlers")
(RT "Bowling alleys")
(RT "Bowling balls")
(RT "Pinsetting")
(CN "Used in a note under BOWLING ALLEYS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001263")
(TNR "tgm001265"))


(CONCEPT
(DESCRIPTOR "Bowling alleys")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION BOWLING for activities.")
(UF "Alleys, Bowling")
(UF "Lanes, Bowling")
(BT "Sports & recreation facilities")
(RT "Bowlers")
(RT "Bowling")
(RT "Pinsetting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001264")
(TNR "tgm001266"))


(CONCEPT
(DESCRIPTOR "Bowling balls")
(BT "Balls (Sporting goods)")
(RT "Bowling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001265")
(TNR "tgm001267"))


(CONCEPT
(NON-DESCRIPTOR "Bowling leagues")
(USE "Bowlers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001266")
(TNR "tgm001268"))


(CONCEPT
(NON-DESCRIPTOR "Bowling teams")
(USE "Bowlers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001267")
(TNR "tgm001269"))


(CONCEPT
(DESCRIPTOR "Bowls (Tableware)")
(BT "Tableware")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001268")
(TNR "tgm001270"))


(CONCEPT
(DESCRIPTOR "Bows (Archery)")
(BT "Equipment")
(NT "Crossbows")
(RT "Archery")
(RT "Arms & armament")
(RT "Arrows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001269")
(TNR "tgm001271"))


(CONCEPT
(NON-DESCRIPTOR "Box cars")
(USE "Railroad freight cars")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001270")
(TNR "tgm001272"))


(CONCEPT
(DESCRIPTOR "Box industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Paper box industry")
(UF "Wooden box industry")
(BT "Industry")
(RT "Boxes")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001271")
(TNR "tgm001273"))


(CONCEPT
(NON-DESCRIPTOR "Box irons")
(USE "Irons (Pressing)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001272")
(TNR "tgm001274"))


(CONCEPT
(NON-DESCRIPTOR "Box offices")
(USE "Ticket offices")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001273")
(TNR "tgm001275"))


(CONCEPT
(DESCRIPTOR "Boxers (Sports)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Athletes")
(RT "Boxing")
(CN "Geographical subdivision indicates place where player is based.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001274")
(TNR "tgm001276"))


(CONCEPT
(DESCRIPTOR "Boxes")
(BT "Containers")
(NT "Ballot boxes")
(NT "Poor boxes")
(NT "Suggestion boxes")
(RT "Box industry")
(RT "Pandora's box")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001275")
(TNR "tgm001277"))


(CONCEPT
(NON-DESCRIPTOR "Boxes, Music")
(USE "Music boxes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001276")
(TNR "tgm001278"))


(CONCEPT
(DESCRIPTOR "Boxing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Prizefighting")
(BT "Sports")
(RT "Boxers (Sports)")
(RT "Fighting")
(RT "Martial arts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001277")
(TNR "tgm001279"))


(CONCEPT
(DESCRIPTOR "Boycotts")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Events")
(RT "Commerce")
(RT "Strikes")
(CN ":SUBDIVIDE-BY :NATIONALITY of those imposing the boycott.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001278")
(TNR "tgm001280"))


(CONCEPT
(DESCRIPTOR "Boys")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Males, ages 0-16.")
(BT "Children")
(RT "Men")
(RT "Teenagers")
(HN "Changed 7/1991 from non-postable term (Use CHILDREN). For earlier cataloging, :SEARCH-SUBDIVISION CHILDREN.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001279")
(TNR "tgm001281"))


(CONCEPT
(NON-DESCRIPTOR "Boys' gangs")
(USE "Gangs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001280")
(TNR "tgm001282"))


(CONCEPT
(DESCRIPTOR "Bracelets")
(BT "Jewelry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001281")
(TNR "tgm001283"))


(CONCEPT
(NON-DESCRIPTOR "Braces")
(USE "Orthopedic braces")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001282")
(TNR "tgm001284"))


(CONCEPT
(NON-DESCRIPTOR "Brackets (Consoles)")
(USE "Consoles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001283")
(TNR "tgm001285"))


(CONCEPT
(DESCRIPTOR "Bragging")
(UF "Boasting")
(BT "Communication")
(RT "Pride")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001284")
(TNR "tgm001286"))


(CONCEPT
(DESCRIPTOR "Braids (Hairdressing)")
(UF "Pigtails")
(BT "Hairstyles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001285")
(TNR "tgm001287"))


(CONCEPT
(DESCRIPTOR "Braille")
(BT "Writing systems")
(RT "Blind persons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001286")
(TNR "tgm001288"))


(CONCEPT
(DESCRIPTOR "Brains")
(BT "Body parts")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012139"))


(CONCEPT
(NON-DESCRIPTOR "Branches")
(USE "Tree limbs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001287")
(TNR "tgm001289"))


(CONCEPT
(DESCRIPTOR "Branches, chapters, etc.")
(CN "Used only as a subdivision with :CORPORATE-BODY :NAMED-EVENT [Appendix D].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm001288")
(TNR "tgm001290"))


(CONCEPT
(DESCRIPTOR "Branding (Punishment)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Punishment & torture")
(RT "Body marking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001290")
(TNR "tgm001292"))


(CONCEPT
(NON-DESCRIPTOR "Branding of cattle")
(USE "Cattle branding")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001289")
(TNR "tgm001291"))


(CONCEPT
(NON-DESCRIPTOR "Brands")
(USE "Cattle brands")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001291")
(TNR "tgm001293"))


(CONCEPT
(NON-DESCRIPTOR "Brass bands")
(USE "Bands")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001292")
(TNR "tgm001294"))


(CONCEPT
(DESCRIPTOR "Brass industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Metallurgical industry")
(RT "Brasswork")
(RT "Copper industry")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001293")
(TNR "tgm001295"))


(CONCEPT
(DESCRIPTOR "Brass instruments")
(SN "Includes the activity of playing brass instruments.")
(BT "Wind instruments")
(NT "Bugles")
(NT "Cornets")
(NT "French horns")
(NT "Trombones")
(NT "Trumpets")
(NT "Tubas")
(RT "Bands")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001294")
(TNR "tgm001296"))


(CONCEPT
(NON-DESCRIPTOR "Brass work")
(USE "Brasswork")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001295")
(TNR "tgm001297"))


(CONCEPT
(DESCRIPTOR "Brasswork")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Brass work")
(BT "Metalwork")
(RT "Brass industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001296")
(TNR "tgm001298"))


(CONCEPT
(NON-DESCRIPTOR "Bravery")
(USE "Courage")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001297")
(TNR "tgm001299"))


(CONCEPT
(DESCRIPTOR "Bread")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Baked products")
(NT "Biscuits")
(NT "Tortillas")
(RT "Sandwiches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001298")
(TNR "tgm001300"))


(CONCEPT
(DESCRIPTOR "Bread & soup lines")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Food lines")
(UF "Soup lines")
(BT "Food relief")
(BT "Queues")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001299")
(TNR "tgm001301"))


(CONCEPT
(NON-DESCRIPTOR "Break crops")
(USE "Crop rotation")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001300")
(TNR "tgm001302"))


(CONCEPT
(NON-DESCRIPTOR "Breakers")
(USE "Seas")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001301")
(TNR "tgm001303"))


(CONCEPT
(NON-DESCRIPTOR "Breakers (Machinery)")
(USE "Coal mining")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001302")
(TNR "tgm001304"))


(CONCEPT
(NON-DESCRIPTOR "Breakfast cereals")
(USE "Prepared cereals")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001303")
(TNR "tgm001305"))


(CONCEPT
(DESCRIPTOR "Breakfast rooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Interiors")
(RT "Eating & drinking facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001304")
(TNR "tgm001306"))


(CONCEPT
(NON-DESCRIPTOR "Breaks (Rest periods)")
(USE "Rest periods")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001305")
(TNR "tgm001307"))


(CONCEPT
(NON-DESCRIPTOR "Breakwaters")
(USE "Jetties")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001306")
(TNR "tgm001308"))


(CONCEPT
(NON-DESCRIPTOR "Breast beams")
(USE "Lintels")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001307")
(TNR "tgm001309"))


(CONCEPT
(DESCRIPTOR "Breast feeding")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Breastfeeding")
(UF "Nursing (Infant feeding)")
(BT "Feeding")
(RT "Bottle feeding")
(RT "Infants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001308")
(TNR "tgm001310"))


(CONCEPT
(NON-DESCRIPTOR "Breastfeeding")
(USE "Breast feeding")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001309")
(TNR "tgm001311"))


(CONCEPT
(DESCRIPTOR "Breasts")
(UF "Mammary glands")
(BT "Body parts")
(RT "Human body")
(RT "Mammography")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001310")
(TNR "tgm001312"))


(CONCEPT
(DESCRIPTOR "Breechcloths")
(SN "Garment worn by Native American men and boys that consisted of a piece of material fastened around the waist with a belt.")
(BT "Clothing & dress")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001311")
(TNR "tgm001313"))


(CONCEPT
(NON-DESCRIPTOR "Breeders, Dog")
(USE "Dog breeders")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001312")
(TNR "tgm001314"))


(CONCEPT
(NON-DESCRIPTOR "Breeding grounds")
(USE "Rookeries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001313")
(TNR "tgm001315"))


(CONCEPT
(DESCRIPTOR "Brethren churches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on buildings, as well as the associated grounds.")
(UF "Dunkard churches")
(BT "Protestant churches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001314")
(TNR "tgm001316"))


(CONCEPT
(NON-DESCRIPTOR "Breweries")
(USE "Brewing industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001315")
(TNR "tgm001317"))


(CONCEPT
(DESCRIPTOR "Brewing industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Alcoholic beverage industry")
(UF "Beer industry")
(UF "Breweries")
(BT "Beverage industry")
(RT "Beer")
(RT "Hops")
(RT "Yeast")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001316")
(TNR "tgm001318"))


(CONCEPT
(DESCRIPTOR "Bribery")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Crimes")
(RT "Corruption")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001317")
(TNR "tgm001319"))


(CONCEPT
(NON-DESCRIPTOR "Bric-a-brac")
(USE "Art objects")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001324")
(TNR "tgm001326"))


(CONCEPT
(DESCRIPTOR "Brick industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Building materials industry")
(BT "Clay industries")
(RT "Bricks")
(RT "Kilns")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001318")
(TNR "tgm001320"))


(CONCEPT
(DESCRIPTOR "Bricklayers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with manual labor")
(RT "Bricks")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001319")
(TNR "tgm001321"))


(CONCEPT
(DESCRIPTOR "Bricklayers' unions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Labor unions")
(RT "Bricklaying")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001320")
(TNR "tgm001322"))


(CONCEPT
(DESCRIPTOR "Bricklaying")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Masonry")
(RT "Bricklayers' unions")
(RT "Brickwork")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001321")
(TNR "tgm001323"))


(CONCEPT
(DESCRIPTOR "Bricks")
(BT "Building materials")
(RT "Brick industry")
(RT "Bricklayers")
(RT "Brickwork")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001322")
(TNR "tgm001324"))


(CONCEPT
(DESCRIPTOR "Brickwork")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Masonry")
(RT "Bricklaying")
(RT "Bricks")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001323")
(TNR "tgm001325"))


(CONCEPT
(NON-DESCRIPTOR "Bridal gowns")
(USE "Wedding clothing & dress")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001325")
(TNR "tgm001327"))


(CONCEPT
(NON-DESCRIPTOR "Bridegrooms")
(USE "Grooms (Weddings)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001326")
(TNR "tgm001328"))


(CONCEPT
(DESCRIPTOR "Brides")
(SN "For images which focus on persons, :SEARCH-SUBDIVISION WEDDINGS for activities.")
(BT "Women")
(RT "Grooms (Weddings)")
(RT "Royal weddings")
(RT "Showers (Parties)")
(RT "Wedding clothing & dress")
(RT "Weddings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001327")
(TNR "tgm001329"))


(CONCEPT
(DESCRIPTOR "Bridesmaids")
(BT "Women")
(RT "Weddings")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012138"))


(CONCEPT
(DESCRIPTOR "Bridge (Game)")
(BT "Card games")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001330")
(TNR "tgm001332"))


(CONCEPT
(DESCRIPTOR "Bridge construction")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Civil engineering")
(BT "Construction")
(RT "Bridges")
(RT "Road construction")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001328")
(TNR "tgm001330"))


(CONCEPT
(DESCRIPTOR "Bridge failures")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Collapse of bridges")
(BT "Disasters")
(RT "Bridges")
(RT "Pier & wharf failures")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001329")
(TNR "tgm001331"))


(CONCEPT
(DESCRIPTOR "Bridges")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Structures erected over a depression or obstacle, as over a river, gorge, roadway, etc., carrying a roadway and/or walkway for vehicles or persons. :SEARCH-SUBDIVISION SWING BRIDGES for bridges that move horizontally and under VERTICAL LIFT BRIDGES for bridges that lift vertically.")
(UF "Viaducts")
(BT "Transportation facilities")
(NT "Covered bridges")
(NT "Drawbridges")
(NT "Ice crossings")
(NT "Pedestrian bridges")
(NT "Pile bridges")
(NT "Pontoon bridges")
(NT "Railroad bridges")
(NT "Stone bridges")
(NT "Suspension bridges")
(NT "Swing bridges")
(NT "Toll bridges")
(NT "Transporter bridges")
(NT "Truss bridges")
(NT "Vertical lift bridges")
(RT "Aqueducts")
(RT "Bridge construction")
(RT "Bridge failures")
(RT "Culverts")
(RT "Elevated highways")
(RT "Moving of structures")
(RT "Pylons (Bridges)")
(RT "Trestles")
(RT "Trusses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001331")
(TNR "tgm001333"))


(CONCEPT
(NON-DESCRIPTOR "Bridges, Natural")
(USE "Rock formations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001332")
(TNR "tgm001334"))


(CONCEPT
(NON-DESCRIPTOR "Bridle making")
(USE "Saddlery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001333")
(TNR "tgm001335"))


(CONCEPT
(NON-DESCRIPTOR "Bridle paths")
(USE "Trails & paths")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001334")
(TNR "tgm001336"))


(CONCEPT
(DESCRIPTOR "Bridles")
(BT "Equipment")
(RT "Harnesses")
(RT "Saddlery")
(RT "Saddles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001335")
(TNR "tgm001337"))


(CONCEPT
(DESCRIPTOR "Briefcases")
(BT "Equipment")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001336")
(TNR "tgm001338"))


(CONCEPT
(NON-DESCRIPTOR "Broadcast towers")
(USE "Radio & television towers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001337")
(TNR "tgm001339"))


(CONCEPT
(DESCRIPTOR "Broadcasting")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --COMMUNICATIONS :USED-WITH the :NAMES-OF :NAME-OF-WAR [Appendix C].")
(BT "Communication")
(NT "Radio broadcasting")
(NT "Talk shows")
(NT "Television broadcasting")
(RT "Newsrooms")
(RT "Radio & television towers")
(RT "Reporters")
(RT "Sound recording")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001338")
(TNR "tgm001340"))


(CONCEPT
(NON-DESCRIPTOR "Broadcasting studios")
(USE "Television studios")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001339")
(TNR "tgm001341"))


(CONCEPT
(NON-DESCRIPTOR "Broadsheets")
(USE "Broadsides")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000114")
(FCNlctgm "lctgm001340")
(TNR "tgm001342"))


(CONCEPT
(DESCRIPTOR "Broadsides")
(SN "Single-sheet public notices that are usually printed on only one side. They provide information, commentary, proclamation, or other announcement or advertisement. Primarily posted but also distributed by hand. They are usually less pictorial than posters and have more extensive text than signs.")
(UF "Broadsheets")
(BT "Ephemera")
(NT "Handbills")
(NT "Playbills")
(NT "Wanted posters")
(RT "Announcements")
(RT "Carriers' addresses")
(RT "Fliers (Printed matter)")
(RT "Posters")
(RT "Signs (Notices)")
(CN "Used in a note under ADVERTISEMENTS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000115")
(FCNlctgm "lctgm001341")
(TNR "tgm001343"))


(CONCEPT
(NON-DESCRIPTOR "Broadsides (Warships)")
(USE "Armored vessels")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001342")
(TNR "tgm001344"))


(CONCEPT
(DESCRIPTOR "Broccoli")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vegetables")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001343")
(TNR "tgm001345"))


(CONCEPT
(NON-DESCRIPTOR "Brochures")
(USE "Leaflets")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000116")
(FCNlctgm "lctgm001344")
(TNR "tgm001346"))


(CONCEPT
(DESCRIPTOR "Broken glass")
(UF "Glass, Broken")
(BT "Objects")
(RT "Glassware")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001345")
(TNR "tgm001347"))


(CONCEPT
(NON-DESCRIPTOR "Bromide prints")
(USE "Gelatin silver prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000117")
(FCNlctgm "lctgm001346")
(TNR "tgm001348"))


(CONCEPT
(NON-DESCRIPTOR "Bromoil photoprints")
(USE "Bromoil prints")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001347")
(TNR "tgm001349"))


(CONCEPT
(DESCRIPTOR "Bromoil prints")
(SN "Bromide prints that are developed and then bleached and colored.  Oil base pigment(s) is applied with a soft brush or a brayer, usually in repeated applications. Introduced in 1907.")
(UF "Bromoil photoprints")
(BT "Photographic prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000118")
(FCNlctgm "lctgm001348")
(TNR "tgm001350"))


(CONCEPT
(DESCRIPTOR "Broncos")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bucking broncos")
(BT "Horses")
(RT "Cowboys")
(RT "Rodeos")
(RT "Trick riding")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001349")
(TNR "tgm001351"))


(CONCEPT
(DESCRIPTOR "Bronze industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Metallurgical industry")
(RT "Copper industry")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001350")
(TNR "tgm001352"))


(CONCEPT
(NON-DESCRIPTOR "Brooks")
(USE "Streams")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001351")
(TNR "tgm001353"))


(CONCEPT
(DESCRIPTOR "Broom & brush industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(RT "Brooms & brushes")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001352")
(TNR "tgm001354"))


(CONCEPT
(DESCRIPTOR "Brooms & brushes")
(SN "For brooms and brushes not in the process of being used. :SEARCH-SUBDIVISION SWEEPING & DUSTING for activities.")
(UF "Brushes")
(BT "Equipment")
(RT "Broom & brush industry")
(RT "Sweeping & dusting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001353")
(TNR "tgm001355"))


(CONCEPT
(DESCRIPTOR "Brothels")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Houses of prostitution")
(UF "Whorehouses")
(BT "Service industry facilities")
(RT "Prostitution")
(RT "Red-light districts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001354")
(TNR "tgm001356"))


(CONCEPT
(NON-DESCRIPTOR "Brotherly love")
(USE "Interpersonal relations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001355")
(TNR "tgm001357"))


(CONCEPT
(NON-DESCRIPTOR "Brothers")
(USE "Families")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001356")
(TNR "tgm001358"))


(CONCEPT
(NON-DESCRIPTOR "Brown line prints")
(USE "Diazotypes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000119")
(FCNlctgm "lctgm001357")
(TNR "tgm001359"))


(CONCEPT
(NON-DESCRIPTOR "Brownies")
(USE "Fairies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001358")
(TNR "tgm001360"))


(CONCEPT
(NON-DESCRIPTOR "Brownprints")
(USE "Kallitypes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000120")
(FCNlctgm "lctgm001359")
(TNR "tgm001361"))


(CONCEPT
(DESCRIPTOR "Brush works")
(RT "Paintings")
(RT "Wash drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000121")
(FCNlctgm "lctgm001360")
(TNR "tgm001362"))


(CONCEPT
(NON-DESCRIPTOR "Brushes")
(USE "Brooms & brushes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001361")
(TNR "tgm001363"))


(CONCEPT
(DESCRIPTOR "Brussels sprouts")
(BT "Vegetables")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012134"))


(CONCEPT
(NON-DESCRIPTOR "Bubble blowing")
(USE "Bubbles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001362")
(TNR "tgm001364"))


(CONCEPT
(NON-DESCRIPTOR "Bubble gum cards")
(USE "Sports cards")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000122")
(FCNlctgm "lctgm001363")
(TNR "tgm001365"))


(CONCEPT
(NON-DESCRIPTOR "Bubble jet prints")
(USE "Inkjet prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000123")
(FCNlctgm "lctgm001364")
(TNR "tgm001366"))


(CONCEPT
(DESCRIPTOR "Bubbles")
(UF "Bubble blowing")
(BT "Natural phenomena")
(BT "Objects")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001365")
(TNR "tgm001367"))


(CONCEPT
(NON-DESCRIPTOR "Bubonic plague")
(USE "Plague")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001366")
(TNR "tgm001368"))


(CONCEPT
(NON-DESCRIPTOR "Buccaneers")
(USE "Pirates")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001367")
(TNR "tgm001369"))


(CONCEPT
(NON-DESCRIPTOR "Buck passing")
(USE "Passing the buck")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001368")
(TNR "tgm001370"))


(CONCEPT
(DESCRIPTOR "Bucket brigades")
(SN "A chain of persons putting out a fire by passing buckets of water from hand to hand.")
(BT "Fire fighters")
(RT "Fires")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001369")
(TNR "tgm001371"))


(CONCEPT
(NON-DESCRIPTOR "Buckets")
(USE "Pails")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001370")
(TNR "tgm001372"))


(CONCEPT
(NON-DESCRIPTOR "Bucking broncos")
(USE "Broncos")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001371")
(TNR "tgm001373"))


(CONCEPT
(DESCRIPTOR "Buckles")
(BT "Objects")
(RT "Belts (Clothing)")
(RT "Clothing & dress")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001372")
(TNR "tgm001374"))


(CONCEPT
(DESCRIPTOR "Buckwheat")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Grains")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001373")
(TNR "tgm001375"))


(CONCEPT
(DESCRIPTOR "Buddhas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Buddhist gods")
(RT "Buddhism")
(RT "Religious articles")
(RT "Sculpture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001374")
(TNR "tgm001376"))


(CONCEPT
(DESCRIPTOR "Buddhism")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Religion")
(RT "Buddhas")
(RT "Buddhist gods")
(RT "Buddhist sacred books")
(RT "Buddhist temples")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001375")
(TNR "tgm001377"))


(CONCEPT
(DESCRIPTOR "Buddhist gods")
(BT "Gods")
(NT "Buddhas")
(RT "Buddhism")
(RT "Buddhist temples")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001376")
(TNR "tgm001378"))


(CONCEPT
(DESCRIPTOR "Buddhist monks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Monks")
(RT "Buddhist temples")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001377")
(TNR "tgm001379"))


(CONCEPT
(DESCRIPTOR "Buddhist sacred books")
(BT "Books")
(RT "Buddhism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001378")
(TNR "tgm001380"))


(CONCEPT
(DESCRIPTOR "Buddhist temples")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Temples")
(RT "Buddhism")
(RT "Buddhist gods")
(RT "Buddhist monks")
(RT "Wats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001379")
(TNR "tgm001381"))


(CONCEPT
(NON-DESCRIPTOR "Budget")
(USE "Economic policy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001380")
(TNR "tgm001382"))


(CONCEPT
(NON-DESCRIPTOR "Budget freezes")
(USE "Government spending reductions")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001381")
(TNR "tgm001383"))


(CONCEPT
(NON-DESCRIPTOR "Budget reductions")
(USE "Government spending reductions")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001382")
(TNR "tgm001384"))


(CONCEPT
(DESCRIPTOR "Buffaloes")
(GEO-FACET ":COUNTRY :STATE")
(SN "For buffaloes of the eastern hemisphere. :SEARCH-SUBDIVISION BISON for the American buffalo.")
(UF "Oxen, Wild")
(UF "Wild oxen")
(BT "Animals")
(NT "Water buffaloes")
(RT "Bison")
(RT "Cattle")
(CN "Used in a note under BISON.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001383")
(TNR "tgm001385"))


(CONCEPT
(DESCRIPTOR "Buffets (Cookery)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Smorgasbords")
(BT "Eating & drinking")
(RT "Cookery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001384")
(TNR "tgm001386"))


(CONCEPT
(DESCRIPTOR "Buffets (Furniture)")
(UF "Credenzas")
(UF "Sideboards")
(BT "Furniture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001385")
(TNR "tgm001387"))


(CONCEPT
(NON-DESCRIPTOR "Buggies")
(USE "Carriages & coaches")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001386")
(TNR "tgm001388"))


(CONCEPT
(DESCRIPTOR "Bugles")
(SN "Valveless brass instruments that resemble trumpets and are used especially for military calls. Includes the activity of playing bugles.")
(BT "Brass instruments")
(RT "Communication devices")
(RT "Trombones")
(RT "Trumpets")
(RT "Tubas")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001387")
(TNR "tgm001389"))


(CONCEPT
(NON-DESCRIPTOR "Bugs")
(USE "Insects")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001388")
(TNR "tgm001390"))


(CONCEPT
(NON-DESCRIPTOR "Bugs (Electronic surveillance)")
(USE "Electronic surveillance")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001389")
(TNR "tgm001391"))


(CONCEPT
(NON-DESCRIPTOR "Building")
(USE "Construction")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001390")
(TNR "tgm001392"))


(CONCEPT
(NON-DESCRIPTOR "Building blocks (Toys)")
(USE "Blocks (Toys)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001391")
(TNR "tgm001393"))


(CONCEPT
(DESCRIPTOR "Building construction")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Construction")
(NT "Modular construction")
(RT "Buildings")
(RT "Cornerstone laying")
(RT "Toppings out")
(CN ":DOUBLE-INDEX the type of building. Used in a note under BUILDINGS.")
(HN "Term established 2/90. Earlier cataloging used CONSTRUCTION INDUSTRY and the type of structure involved.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001392")
(TNR "tgm001394"))


(CONCEPT
(DESCRIPTOR "Building dedications")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Dedication of buildings")
(BT "Dedications")
(NT "Church dedications")
(NT "Cornerstone laying")
(RT "Buildings")
(RT "Ground breaking ceremonies")
(RT "Toppings out")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001393")
(TNR "tgm001395"))


(CONCEPT
(DESCRIPTOR "Building deterioration")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Decay of buildings")
(UF "Deterioration of buildings")
(UF "Dilapidation of buildings")
(UF "Weathering of buildings")
(BT "Deterioration")
(RT "Abandoned buildings")
(RT "Building failures")
(RT "Erosion")
(RT "Slums")
(RT "Vandalism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001394")
(TNR "tgm001396"))


(CONCEPT
(DESCRIPTOR "Building divisions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Architectural & site components")
(NT "Apses")
(NT "Clerestories")
(NT "Haylofts")
(NT "Pavilions (Building divisions)")
(NT "Penthouses")
(NT "Rooms & spaces")
(NT "Wings (Building divisions)")
(RT "Buildings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001395")
(TNR "tgm001397"))


(CONCEPT
(DESCRIPTOR "Building failures")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Collapse of buildings")
(UF "Roof collapses")
(BT "Disasters")
(RT "Building deterioration")
(RT "Buildings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001396")
(TNR "tgm001398"))


(CONCEPT
(NON-DESCRIPTOR "Building guards")
(USE "Watchmen")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001397")
(TNR "tgm001399"))


(CONCEPT
(DESCRIPTOR "Building materials")
(BT "Objects")
(NT "Bricks")
(NT "Clapboard siding")
(NT "Concrete")
(NT "Glass blocks")
(NT "Laminated wood")
(NT "Laths")
(NT "Lumber")
(NT "Tiles")
(NT "Vitrolite (Trademark)")
(RT "Building materials industry")
(RT "Laminated plastics")
(RT "Porcelain enamel")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001398")
(TNR "tgm001400"))


(CONCEPT
(DESCRIPTOR "Building materials industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(NT "Brick industry")
(NT "Cement industries")
(NT "Concrete products industry")
(NT "Nail industry")
(RT "Building materials")
(RT "Ceramic industries")
(RT "Construction industry")
(RT "Glass industry")
(RT "Lumber industry")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001399")
(TNR "tgm001401"))


(CONCEPT
(DESCRIPTOR "Building models")
(SN "Miniature relief or three-dimensional representations of real or imaginary buildings. :SEARCH-SUBDIVISION ARCHITECTURAL MODELS for miniature representations in scale of structures or parts of structures made for the purpose of showing the result of actual architectural construction plans. :SEARCH-SUBDIVISION MODEL HOUSES for full-scale representations of houses planned to be constructed.")
(BT "Models")
(NT "Dollhouses")
(RT "Architectural models")
(RT "Buildings")
(CN "Used in a note under ARCHITECTURAL MODELS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001400")
(TNR "tgm001402"))


(CONCEPT
(NON-DESCRIPTOR "Building plaques")
(USE "Plaques")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001401")
(TNR "tgm001403"))


(CONCEPT
(DESCRIPTOR "Building systems")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Assemblies of integrated building subsystems satisfying the functional requirements of a building.")
(BT "Architectural & site components")
(NT "Conveying systems")
(NT "Mechanical systems")
(NT "Mechanical systems components")
(RT "Intercommunication systems")
(RT "Lighting")
(RT "Public address systems")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001402")
(TNR "tgm001404"))


(CONCEPT
(NON-DESCRIPTOR "Building, Bombproof")
(USE "Bombproof construction")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001406")
(TNR "tgm001408"))


(CONCEPT
(DESCRIPTOR "Buildings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For buildings in general; includes buildings with indeterminate functions and buildings distinguished by attributes other than function.   :SEARCH-SUBDIVISION other FACILITIES NTs for buildings that serve particular functions (e.g., AGRICULTURAL FACILITIES).  :SEARCH-SUBDIVISION -- STRUCTURES :USED-WITH :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP, and :CLASSES-OF-PERSONS [Appendix A].  :SEARCH-SUBDIVISION --BUILDINGS :USED-WITH :NAMES-OF :CORPORATE-BODY :NAMED-EVENT [Appendix D].")
(BT "Facilities")
(NT "Abandoned buildings")
(NT "Air-supported structures")
(NT "Buildings distinguished by form")
(NT "Buildings distinguished by material")
(NT "Gatehouses")
(NT "Historic buildings")
(NT "Metal buildings")
(NT "Office buildings")
(NT "Outbuildings")
(NT "Portable buildings")
(NT "Prefabricated buildings")
(NT "Recycled structures")
(NT "Temporary buildings")
(RT "Building construction")
(RT "Building dedications")
(RT "Building divisions")
(RT "Building failures")
(RT "Building models")
(RT "Geodesic domes")
(RT "Moving of structures")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001403")
(TNR "tgm001405"))


(CONCEPT
(DESCRIPTOR "Buildings distinguished by form")
(BT "Buildings")
(NT "A-frame buildings")
(NT "Circular buildings")
(NT "Distyle-in-antis buildings")
(NT "Greek cross-plan buildings")
(NT "Hexagonal buildings")
(NT "Latin cross-plan buildings")
(NT "Lean-tos")
(NT "Mimetic buildings")
(NT "Octagonal buildings")
(NT "Skyscrapers")
(NT "Towers")
(CN "This heading is not used for indexing.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001404")
(TNR "tgm001406"))


(CONCEPT
(DESCRIPTOR "Buildings distinguished by material")
(BT "Buildings")
(NT "Adobe buildings")
(NT "Half-timbered buildings")
(NT "Sod buildings")
(NT "Stone buildings")
(NT "Thatched roof buildings")
(NT "Wooden buildings")
(CN "This heading is not used for indexing.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001405")
(TNR "tgm001407"))


(CONCEPT
(DESCRIPTOR "Built environment")
(BT "Objects")
(NT "Architectural & site components")
(NT "Facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001407")
(TNR "tgm001409"))


(CONCEPT
(DESCRIPTOR "Built-in furniture")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Furniture")
(NT "Bars (Furniture)")
(RT "Counters")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001408")
(TNR "tgm001410"))


(CONCEPT
(NON-DESCRIPTOR "Bulbs, Light")
(USE "Light bulbs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001409")
(TNR "tgm001411"))


(CONCEPT
(DESCRIPTOR "Bulbuls")
(GEO-FACET ":COUNTRY :STATE")
(BT "Birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001410")
(TNR "tgm001412"))


(CONCEPT
(NON-DESCRIPTOR "Bull rings")
(USE "Bullrings")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012136"))


(CONCEPT
(DESCRIPTOR "Bulldogs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Dogs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001411")
(TNR "tgm001413"))


(CONCEPT
(DESCRIPTOR "Bulldozers")
(BT "Machinery")
(RT "Steam shovels")
(RT "Tracklaying vehicles")
(RT "Tractors")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001412")
(TNR "tgm001414"))


(CONCEPT
(DESCRIPTOR "Bullet holes")
(BT "Holes")
(RT "Ammunition")
(RT "Bullets")
(RT "Firearms")
(RT "Shooting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001413")
(TNR "tgm001415"))


(CONCEPT
(DESCRIPTOR "Bulletin boards")
(BT "Communication devices")
(RT "Office equipment & supplies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001414")
(TNR "tgm001416"))


(CONCEPT
(DESCRIPTOR "Bullets")
(BT "Ammunition")
(RT "Bullet holes")
(RT "Firearms")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001415")
(TNR "tgm001417"))


(CONCEPT
(DESCRIPTOR "Bullfighters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Matadors")
(UF "Toreadors")
(UF "Toreros")
(BT "People associated with entertainment & sports")
(RT "Bullfighting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001416")
(TNR "tgm001418"))


(CONCEPT
(DESCRIPTOR "Bullfighting")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animal fighting")
(BT "Sports")
(RT "Bullfighters")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001417")
(TNR "tgm001419"))


(CONCEPT
(DESCRIPTOR "Bullhorns")
(SN "A hand-held combined microphone and loudspeaker.")
(BT "Horns (Communication devices)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001418")
(TNR "tgm001420"))


(CONCEPT
(DESCRIPTOR "Bullies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bully")
(BT "People")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001419")
(TNR "tgm001421"))


(CONCEPT
(NON-DESCRIPTOR "Bullocks")
(USE "Cattle")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001420")
(TNR "tgm001422"))


(CONCEPT
(DESCRIPTOR "Bullrings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bull rings")
(BT "Stadiums")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012135"))


(CONCEPT
(DESCRIPTOR "Bulls")
(GEO-FACET ":COUNTRY :STATE")
(BT "Cattle")
(RT "Cows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001421")
(TNR "tgm001423"))


(CONCEPT
(DESCRIPTOR "Bull's eye windows")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Round or oval windows, usually with glazing bars radiating from a circular center.")
(UF "Oeil-de-boeuf windows")
(UF "Oxeye windows")
(BT "Windows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001422")
(TNR "tgm001424"))


(CONCEPT
(NON-DESCRIPTOR "Bull's-eyes")
(USE "Targets (Sports)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001423")
(TNR "tgm001425"))


(CONCEPT
(NON-DESCRIPTOR "Bully")
(USE "Bullies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001424")
(TNR "tgm001426"))


(CONCEPT
(NON-DESCRIPTOR "Bumble bees")
(USE "Bees")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001425")
(TNR "tgm001427"))


(CONCEPT
(DESCRIPTOR "Bumper cars")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Amusement rides")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001426")
(TNR "tgm001428"))


(CONCEPT
(DESCRIPTOR "Bumper stickers")
(SN "Stickers bearing printed messages and intended for display on automobile bumpers, although used in many other places.  The self-adhesive stickers were introduced in the mid-1900s and are often ca. 3 x 13 inches.")
(BT "Stickers")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc00012")
(FCNlctgm "lctgm001427")
(TNR "tgm001429"))


(CONCEPT
(DESCRIPTOR "Bundling (Packing)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "The activity of assembling or binding material in a group.")
(UF "Ricking")
(BT "Activities")
(RT "Shipping")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001428")
(TNR "tgm001430"))


(CONCEPT
(DESCRIPTOR "Bungalows")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "One-story frame houses or summer cottages, often surrounded by covered verandas.")
(BT "Houses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001429")
(TNR "tgm001431"))


(CONCEPT
(DESCRIPTOR "Bunk beds")
(BT "Beds")
(RT "Bedrooms")
(RT "Dormitories")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012124"))


(CONCEPT
(DESCRIPTOR "Bunkers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Fortified chambers, mostly below ground, often built of reinforced concrete and provided with openings for guns.")
(BT "Military facilities")
(RT "Forts & fortifications")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001430")
(TNR "tgm001432"))


(CONCEPT
(DESCRIPTOR "Buoys")
(UF "Bell buoys")
(BT "Communication devices")
(RT "Navigation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001431")
(TNR "tgm001433"))


(CONCEPT
(NON-DESCRIPTOR "Bureaucratic paperwork")
(USE "Paperwork")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001432")
(TNR "tgm001434"))


(CONCEPT
(NON-DESCRIPTOR "Bureaucratic red tape")
(USE "Red tape")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001433")
(TNR "tgm001435"))


(CONCEPT
(NON-DESCRIPTOR "Bureaucrats")
(USE "Government employees")
(USE "Government officials")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001434")
(TNR "tgm001436"))


(CONCEPT
(NON-DESCRIPTOR "Bureaus (Furniture)")
(USE "Clothes chests")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001435")
(TNR "tgm001437"))


(CONCEPT
(NON-DESCRIPTOR "Burglar alarms")
(USE "Security systems")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001436")
(TNR "tgm001438"))


(CONCEPT
(NON-DESCRIPTOR "Burglaries")
(USE "Robberies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001437")
(TNR "tgm001439"))


(CONCEPT
(NON-DESCRIPTOR "Burial clothings")
(USE "Shrouds")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001438")
(TNR "tgm001440"))


(CONCEPT
(NON-DESCRIPTOR "Burial mounds")
(USE "Mounds (Burials)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001439")
(TNR "tgm001441"))


(CONCEPT
(NON-DESCRIPTOR "Burial vaults")
(USE "Tombs & sepulchral monuments")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001440")
(TNR "tgm001442"))


(CONCEPT
(NON-DESCRIPTOR "Burials")
(USE "Funeral rites & ceremonies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001441")
(TNR "tgm001443"))


(CONCEPT
(DESCRIPTOR "Burials at sea")
(BT "Funeral rites & ceremonies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001442")
(TNR "tgm001444"))


(CONCEPT
(NON-DESCRIPTOR "Burlesque posters")
(USE "Theatrical posters")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000125")
(FCNlctgm "lctgm001443")
(TNR "tgm001445"))


(CONCEPT
(DESCRIPTOR "Burlesque shows")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For theatrical entertainments characterized by broad humor, consisting of comic skits, slapstick, striptease acts, and songs and dances performed by soloists or a chorus.")
(BT "Theatrical productions")
(RT "Music")
(RT "Music halls")
(RT "Sideshows")
(RT "Striptease")
(RT "Stripteasers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001444")
(TNR "tgm001446"))


(CONCEPT
(NON-DESCRIPTOR "Burning")
(USE "Fire")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001445")
(TNR "tgm001447"))


(CONCEPT
(DESCRIPTOR "Burning at the stake")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Burnt at the stake")
(BT "Executions")
(RT "Fires")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001446")
(TNR "tgm001448"))


(CONCEPT
(DESCRIPTOR "Burning coal veins")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fire")
(RT "Coal")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001447")
(TNR "tgm001449"))


(CONCEPT
(NON-DESCRIPTOR "Burning in effigy")
(USE "Executions in effigy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001448")
(TNR "tgm001450"))


(CONCEPT
(NON-DESCRIPTOR "Burning of books")
(USE "Book burning")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001449")
(TNR "tgm001451"))


(CONCEPT
(NON-DESCRIPTOR "Burning the dead")
(USE "Cremation")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001450")
(TNR "tgm001452"))


(CONCEPT
(DESCRIPTOR "Burns & scalds")
(UF "Scalds")
(BT "Wounds & injuries")
(NT "Sunburns")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001451")
(TNR "tgm001453"))


(CONCEPT
(NON-DESCRIPTOR "Burnt at the stake")
(USE "Burning at the stake")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001452")
(TNR "tgm001454"))


(CONCEPT
(NON-DESCRIPTOR "Burnt offerings")
(USE "Sacrifices")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001453")
(TNR "tgm001455"))


(CONCEPT
(DESCRIPTOR "Burping")
(UF "Belching")
(BT "Bodily functions")
(RT "Manners & customs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001454")
(TNR "tgm001456"))


(CONCEPT
(NON-DESCRIPTOR "Burros")
(USE "Donkeys")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001455")
(TNR "tgm001457"))


(CONCEPT
(DESCRIPTOR "Bus drivers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with transportation")
(RT "Buses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001456")
(TNR "tgm001458"))


(CONCEPT
(NON-DESCRIPTOR "Bus girls")
(USE "Bus persons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001457")
(TNR "tgm001459"))


(CONCEPT
(DESCRIPTOR "Bus persons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "People who work in restaurants, usually by clearing and setting up tables.")
(UF "Bus girls")
(UF "Busboys")
(UF "Table boys")
(BT "Restaurant workers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001458")
(TNR "tgm001460"))


(CONCEPT
(NON-DESCRIPTOR "Bus stations")
(USE "Bus terminals")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001459")
(TNR "tgm001461"))


(CONCEPT
(DESCRIPTOR "Bus stops")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Site elements")
(RT "Bus terminals")
(RT "Bus travel")
(RT "Buses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001460")
(TNR "tgm001462"))


(CONCEPT
(DESCRIPTOR "Bus terminals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bus stations")
(BT "Transportation facilities")
(RT "Bus stops")
(RT "Bus travel")
(RT "Buses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001461")
(TNR "tgm001463"))


(CONCEPT
(DESCRIPTOR "Bus travel")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Motor bus travel")
(BT "Travel")
(RT "Bus stops")
(RT "Bus terminals")
(RT "Buses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001462")
(TNR "tgm001464"))


(CONCEPT
(NON-DESCRIPTOR "Busboys")
(USE "Bus persons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001463")
(TNR "tgm001465"))


(CONCEPT
(DESCRIPTOR "Buses")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Omnibuses")
(BT "Vehicles")
(NT "Double-decker buses")
(NT "School buses")
(RT "Bus drivers")
(RT "Bus stops")
(RT "Bus terminals")
(RT "Bus travel")
(RT "Mass transit")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001464")
(TNR "tgm001466"))


(CONCEPT
(DESCRIPTOR "Bush pilots")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Pilots, Bush")
(BT "Air pilots")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001465")
(TNR "tgm001467"))


(CONCEPT
(NON-DESCRIPTOR "Bushes")
(USE "Shrubs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001466")
(TNR "tgm001468"))


(CONCEPT
(DESCRIPTOR "Business & finance")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Finance")
(BT "Activities")
(NT "Accounting")
(NT "Banking")
(NT "Banking industry")
(NT "Big business")
(NT "Commerce")
(NT "Corporate mergers")
(NT "Credit")
(NT "Debt")
(NT "Expense accounts")
(NT "Paying bills")
(NT "Saving & investment")
(NT "Usury")
(RT "Business education")
(RT "Commercial facilities")
(RT "Discounts")
(RT "Economic & social conditions")
(RT "Economic aspects of war")
(RT "Economic policy")
(RT "Financial disclosure")
(RT "Insurance")
(RT "Money")
(RT "Mortgages")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001477")
(TNR "tgm001479"))


(CONCEPT
(DESCRIPTOR "Business cards")
(SN "Small cards that bear name and often address of a business or organization. Usually lack illustration except for a logo or emblem. More an information card than an advertisement.")
(UF "Tradecards")
(BT "Cards")
(RT "Advertising cards")
(RT "Visiting cards")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000126")
(FCNlctgm "lctgm001467")
(TNR "tgm001469"))


(CONCEPT
(DESCRIPTOR "Business districts")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Areas in towns or cities used for commerical purposes; usually defined and limited by zoning ordinances.")
(UF "Central business districts")
(UF "Commercial districts")
(UF "Districts, Business")
(UF "Downtown districts")
(BT "Commercial facilities")
(NT "Red-light districts")
(RT "Commercial streets")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001468")
(TNR "tgm001470"))


(CONCEPT
(DESCRIPTOR "Business education")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Business schools")
(BT "Education")
(RT "Business & finance")
(CN ":DOUBLE-INDEX EDUCATIONAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001469")
(TNR "tgm001471"))


(CONCEPT
(DESCRIPTOR "Business enterprises")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For organizations and undertakings concerned with the supply and distribution of goods and services.  :SEARCH-SUBDIVISION COMMERCIAL FACILITIES - or NTs - for facilities where goods and services are bought and sold.")
(UF "Companies")
(UF "Enterprises, Business")
(UF "Firms")
(BT "Commercial organizations")
(NT "Airline industry")
(NT "Automobile dealerships")
(NT "Automobile service stations")
(NT "Boat & ship companies")
(NT "Clock & watch making")
(NT "Diaper service")
(NT "Fuel trade")
(NT "Insurance companies")
(NT "Interior decoration firms")
(NT "Lease & rental services")
(NT "Mail-order businesses")
(NT "Monument builders")
(NT "Motion picture industry")
(NT "Moving & storage trade")
(NT "Plumbing industry")
(NT "Printing industry")
(NT "Private utility companies")
(NT "Public utility companies")
(NT "Publishing industry")
(NT "Railroad companies")
(NT "Real estate business")
(NT "Stationery trade")
(NT "Telephone companies")
(RT "Business people")
(RT "Commerce")
(RT "Commercial facilities")
(RT "Cooperatives")
(RT "Customer relations")
(RT "Fur trade")
(RT "Home labor")
(RT "Industry")
(RT "Merchandise displays")
(RT "Military exchanges")
(RT "Occupations")
(RT "Offices")
(RT "Real estate development")
(RT "Secondhand sales")
(RT "Shoe shining")
(RT "Sutlers")
(HN "Scope note changed 1/1993.  Formerly included both organizations involved in supply and distribution of goods and services and the facilities where goods and services are bought and sold, including stores and shops.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001470")
(TNR "tgm001472"))


(CONCEPT
(NON-DESCRIPTOR "Business ethics")
(USE "Ethics")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001471")
(TNR "tgm001473"))


(CONCEPT
(NON-DESCRIPTOR "Business machines")
(USE "Office equipment & supplies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001472")
(TNR "tgm001474"))


(CONCEPT
(DESCRIPTOR "Business panics")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bank runs")
(UF "Financial panics")
(UF "Money crises")
(BT "Economic & social conditions")
(RT "Depressions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001473")
(TNR "tgm001475"))


(CONCEPT
(DESCRIPTOR "Business people")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Businessmen")
(UF "Businesswomen")
(UF "Entrepreneurs")
(UF "Executives")
(UF "Manufacturers")
(BT "People associated with commercial activities")
(RT "Business enterprises")
(RT "Sales personnel")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001474")
(TNR "tgm001476"))


(CONCEPT
(NON-DESCRIPTOR "Business schools")
(USE "Business education")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001475")
(TNR "tgm001477"))


(CONCEPT
(NON-DESCRIPTOR "Business takeovers")
(USE "Corporate mergers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001476")
(TNR "tgm001478"))


(CONCEPT
(NON-DESCRIPTOR "Businessmen")
(USE "Business people")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001478")
(TNR "tgm001480"))


(CONCEPT
(NON-DESCRIPTOR "Businesswomen")
(USE "Business people")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001479")
(TNR "tgm001481"))


(CONCEPT
(DESCRIPTOR "Busing (School integration)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "School busing (Integration)")
(UF "Student busing (School integration)")
(BT "School integration")
(RT "Education")
(RT "Minorities")
(RT "Race relations")
(RT "School buses")
(RT "Schools")
(RT "Segregation")
(RT "Transportation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001480")
(TNR "tgm001482"))


(CONCEPT
(NON-DESCRIPTOR "Buskers")
(USE "Street entertainers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001481")
(TNR "tgm001483"))


(CONCEPT
(DESCRIPTOR "Butcher blocks")
(UF "Chopping blocks")
(BT "Equipment")
(RT "Home food processing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001482")
(TNR "tgm001484"))


(CONCEPT
(DESCRIPTOR "Butcher shops")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Stores & shops")
(RT "Meat cutting")
(RT "Meat industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001483")
(TNR "tgm001485"))


(CONCEPT
(DESCRIPTOR "Butchers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001484")
(TNR "tgm001486"))


(CONCEPT
(DESCRIPTOR "Butlers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Servants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001485")
(TNR "tgm001487"))


(CONCEPT
(NON-DESCRIPTOR "Butments")
(USE "Abutments")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001486")
(TNR "tgm001488"))


(CONCEPT
(DESCRIPTOR "Butter")
(BT "Dairy products")
(RT "Butter making")
(RT "Churns")
(RT "Margarine")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001487")
(TNR "tgm001489"))


(CONCEPT
(NON-DESCRIPTOR "Butter churns")
(USE "Churns")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001488")
(TNR "tgm001490"))


(CONCEPT
(DESCRIPTOR "Butter making")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For domestic activities. :SEARCH-SUBDIVISION DAIRYING for large scale or commercial activities.")
(UF "Churning")
(BT "Home food processing")
(RT "Butter")
(RT "Churns")
(RT "Dairying")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001489")
(TNR "tgm001491"))


(CONCEPT
(DESCRIPTOR "Butterflies")
(GEO-FACET ":COUNTRY :STATE")
(BT "Insects")
(RT "Butterfly nets")
(RT "Moths")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001490")
(TNR "tgm001492"))


(CONCEPT
(NON-DESCRIPTOR "Butterfly chairs")
(USE "Hardoy chairs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001491")
(TNR "tgm001493"))


(CONCEPT
(DESCRIPTOR "Butterfly nets")
(UF "Nets, Butterfly")
(BT "Nets")
(RT "Butterflies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001492")
(TNR "tgm001494"))


(CONCEPT
(DESCRIPTOR "Butterfly roofs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Roofs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001493")
(TNR "tgm001495"))


(CONCEPT
(DESCRIPTOR "Buttes")
(GEO-FACET ":COUNTRY :STATE")
(BT "Land")
(RT "Hills")
(RT "Mountains")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001494")
(TNR "tgm001496"))


(CONCEPT
(DESCRIPTOR "Buttocks")
(UF "Behinds (Human body)")
(UF "Butts (Human body)")
(UF "Derrieres")
(BT "Body parts")
(RT "Human body")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001495")
(TNR "tgm001497"))


(CONCEPT
(NON-DESCRIPTOR "Button badges")
(USE "Buttons (Information artifacts)")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000127")
(FCNlctgm "lctgm001496")
(TNR "tgm001498"))


(CONCEPT
(DESCRIPTOR "Buttonhole industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Buttonhole-cutter industry")
(BT "Clothing industry")
(NT "Buttons (Fasteners)")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001497")
(TNR "tgm001499"))


(CONCEPT
(NON-DESCRIPTOR "Buttonhole-cutter industry")
(USE "Buttonhole industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001498")
(TNR "tgm001500"))


(CONCEPT
(NON-DESCRIPTOR "Buttons")
(USE "Buttons (Fasteners)")
(USE "Buttons (Information artifacts)")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000128")
(FCNlctgm "lctgm001499")
(TNR "tgm001501"))


(CONCEPT
(DESCRIPTOR "Buttons (Fasteners)")
(UF "Buttons")
(BT "Buttonhole industry")
(BT "Clothing & dress")
(BT "Fasteners")
(RT "Cuff links")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001500")
(TNR "tgm001502"))


(CONCEPT
(DESCRIPTOR "Buttons (Information artifacts)")
(SN "Ornaments or badges for wearing, as on a lapel; stamped or printed with designs or slogans. Often disc-shaped.")
(UF "Button badges")
(UF "Buttons")
(BT "Badges")
(HN "Changed 1/97. Formerly BUTTONS (INFORMATION ARTIFACTS) may have been indexed as BADGES.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000129")
(FCNlctgm "lctgm001501")
(TNR "tgm001503"))


(CONCEPT
(DESCRIPTOR "Buttresses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Structures of wood, stone, or brick built against a wall or building in order to provide strength and/or support.")
(BT "Architectural elements")
(NT "Flying buttresses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001502")
(TNR "tgm001504"))


(CONCEPT
(NON-DESCRIPTOR "Buttresses, Flying")
(USE "Flying buttresses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001503")
(TNR "tgm001505"))


(CONCEPT
(NON-DESCRIPTOR "Butts (Human body)")
(USE "Buttocks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001504")
(TNR "tgm001506"))


(CONCEPT
(NON-DESCRIPTOR "Buzzards")
(USE "Vultures")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm0015")
(TNR "tgm001507"))


(CONCEPT
(NON-DESCRIPTOR "Cab drivers")
(USE "Taxicab drivers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001506")
(TNR "tgm001508"))


(CONCEPT
(DESCRIPTOR "Cabanas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Shelters resembling cabins usually with an open side facing a beach.")
(BT "Bathhouses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001507")
(TNR "tgm001509"))


(CONCEPT
(NON-DESCRIPTOR "Cabarets")
(USE "Nightclubs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001508")
(TNR "tgm001510"))


(CONCEPT
(DESCRIPTOR "Cabbage")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vegetables")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001509")
(TNR "tgm001511"))


(CONCEPT
(NON-DESCRIPTOR "Cabinet card photographs")
(USE "Cabinet photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000130")
(FCNlctgm "lctgm001510")
(TNR "tgm001512"))


(CONCEPT
(NON-DESCRIPTOR "Cabinet cards")
(USE "Cabinet photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000131")
(FCNlctgm "lctgm001511")
(TNR "tgm001513"))


(CONCEPT
(NON-DESCRIPTOR "Cabinet making")
(USE "Cabinetmaking")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001512")
(TNR "tgm001514"))


(CONCEPT
(DESCRIPTOR "Cabinet officers")
(GEO-FACET ":COUNTRY :STATE")
(SN "For the subject of the office in general and for incumbents.")
(UF "Attorneys general")
(BT "Government officials")
(NT "Prime ministers")
(RT "Cabinet officers' spouses")
(CN ":SUBDIVIDE-BY geographically by the jurisdiction (e.g. state, nation) of the cabinet officer.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001513")
(TNR "tgm001515"))


(CONCEPT
(DESCRIPTOR "Cabinet officers' spouses")
(GEO-FACET ":COUNTRY :STATE")
(BT "Spouses")
(RT "Cabinet officers")
(CN ":SUBDIVIDE-BY geographically by the jurisdiction (e.g., state, nation) of the cabinet officer.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001514")
(TNR "tgm001516"))


(CONCEPT
(DESCRIPTOR "Cabinet photographs")
(SN "Card photographs; mounts measure approximately 6.5 x 4.25 in. (16.5 x 10.5 cm.). Introduced in the United States in 1866; popular until ca. 1900.")
(UF "Cabinet card photographs")
(UF "Cabinet cards")
(BT "Card photographs")
(HN "Changed 6/94. Formerly, CABINET PHOTOGRAPHS may have been indexed as CABINET CARD PHOTOGRAPHS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000132")
(FCNlctgm "lctgm001515")
(TNR "tgm001517"))


(CONCEPT
(DESCRIPTOR "Cabinetmaking")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Skilled work of cutting, shaping, and assembling high-grade articles of furniture requiring fine finish.")
(UF "Cabinet making")
(BT "Handicraft")
(RT "Carpentry")
(RT "Furniture")
(RT "Joinery")
(RT "Woodworking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001516")
(TNR "tgm001518"))


(CONCEPT
(NON-DESCRIPTOR "Cabinets")
(USE "Cupboards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001517")
(TNR "tgm001519"))


(CONCEPT
(DESCRIPTOR "Cabinets (Case furniture)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Furniture with a set of drawers or pigeon holes and doors, used for storing and displaying items.")
(UF "China closets")
(BT "Furniture")
(NT "Filing cabinets")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001518")
(TNR "tgm001520"))


(CONCEPT
(DESCRIPTOR "Cabins")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "A simple one-story house or hut, often of logs.")
(UF "Cottages, Resort")
(UF "Resort cottages")
(BT "Houses")
(NT "Log cabins")
(RT "Resorts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001519")
(TNR "tgm001521"))


(CONCEPT
(NON-DESCRIPTOR "Cabins, Ship")
(USE "Crew quarters")
(USE "Staterooms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001520")
(TNR "tgm001522"))


(CONCEPT
(NON-DESCRIPTOR "Cable cars")
(USE "Cable railroads")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001521")
(TNR "tgm001523"))


(CONCEPT
(DESCRIPTOR "Cable industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Wire cable industry")
(BT "Industry")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001522")
(TNR "tgm001524"))


(CONCEPT
(DESCRIPTOR "Cable railroads")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For railroads powered by cable. These railroads were situated underground in most cities; such systems were largely abandoned in most U.S. cities after the mid 1890s in favor of street railroads running on overhead electric wires.")
(UF "Cable cars")
(UF "Funicular railroads")
(BT "Railroads")
(NT "Aerial tramways")
(RT "Inclined railroads")
(RT "Mountain railroads")
(RT "Street railroads")
(CN "Used in a note under STREET RAILROADS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001523")
(TNR "tgm001525"))


(CONCEPT
(NON-DESCRIPTOR "Cables, Submarine")
(USE "Submarine cables")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001524")
(TNR "tgm001526"))


(CONCEPT
(NON-DESCRIPTOR "Cables, Telecommunication")
(USE "Telecommunication cables")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001525")
(TNR "tgm001527"))


(CONCEPT
(NON-DESCRIPTOR "Cabooses")
(USE "Railroad cabooses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001526")
(TNR "tgm001528"))


(CONCEPT
(NON-DESCRIPTOR "Cabs")
(USE "Taxicabs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001527")
(TNR "tgm001529"))


(CONCEPT
(NON-DESCRIPTOR "Cabs, Hansom")
(USE "Carriages & coaches")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001528")
(TNR "tgm001530"))


(CONCEPT
(DESCRIPTOR "Cacao")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For cacao trees and culture.")
(UF "Chocolate-trees")
(BT "Trees")
(RT "Chocolate industry")
(RT "Cocoa industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001529")
(TNR "tgm001531"))


(CONCEPT
(NON-DESCRIPTOR "Cacti")
(USE "Cactus")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012137"))


(CONCEPT
(DESCRIPTOR "Cactus")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cacti")
(BT "Plants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001530")
(TNR "tgm001532"))


(CONCEPT
(NON-DESCRIPTOR "CAD drawings")
(USE "Computer-aided designs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000133")
(FCNlctgm "lctgm001531")
(TNR "tgm001533"))


(CONCEPT
(NON-DESCRIPTOR "Cadavers")
(USE "Dead animals")
(USE "Dead persons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001532")
(TNR "tgm001534"))


(CONCEPT
(DESCRIPTOR "Caddies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Golf caddies")
(BT "People associated with manual labor")
(RT "Golf")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001533")
(TNR "tgm001535"))


(CONCEPT
(DESCRIPTOR "Cadets")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Military students")
(BT "People associated with military activities")
(RT "Military education")
(RT "Military training")
(RT "Students")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001534")
(TNR "tgm001536"))


(CONCEPT
(DESCRIPTOR "Caduceus")
(SN "Symbol of the medical profession.")
(BT "Symbols")
(RT "Medicine")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001535")
(TNR "tgm001537"))


(CONCEPT
(DESCRIPTOR "Cafes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Usually small and informal establishments serving various refreshments, often partly outdoors.")
(BT "Restaurants")
(RT "Coffeehouses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001536")
(TNR "tgm001538"))


(CONCEPT
(DESCRIPTOR "Cafeterias")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Self-service food establishments.")
(UF "Lunchrooms")
(UF "Self-service restaurants")
(BT "Restaurants")
(RT "School meals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001537")
(TNR "tgm001539"))


(CONCEPT
(DESCRIPTOR "Cages")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes enclosures resembling a cage in form or purpose.")
(BT "Equipment")
(NT "Birdcages")
(RT "Containers")
(RT "Jails")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001538")
(TNR "tgm001540"))


(CONCEPT
(DESCRIPTOR "Cairns")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For heaps of stones piled up as monuments or landmarks.")
(UF "Rock cairns")
(BT "Artificial rock formations")
(RT "Monuments & memorials")
(RT "Mounds (Burials)")
(RT "Stonework")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001539")
(TNR "tgm001541"))


(CONCEPT
(DESCRIPTOR "Caissons (Hydraulic structures)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Hydraulic facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001540")
(TNR "tgm001542"))


(CONCEPT
(DESCRIPTOR "Caissons (Vehicles)")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Carts & wagons")
(RT "Ammunition")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001541")
(TNR "tgm001543"))


(CONCEPT
(DESCRIPTOR "Cakes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Baked products")
(BT "Confections")
(CN "As appropriate, :SUBDIVIDE-BY place with which cakes are associated.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001542")
(TNR "tgm001544"))


(CONCEPT
(DESCRIPTOR "Cakewalks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Afro-American entertainment having a cake as a prize for the most accomplished walking steps; also, a stage dance involving a high prance with backward tilt.")
(BT "Contests")
(BT "Dance")
(RT "Entertainment")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001543")
(TNR "tgm001545"))


(CONCEPT
(NON-DESCRIPTOR "Calamities")
(USE "Disasters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001544")
(TNR "tgm001546"))


(CONCEPT
(NON-DESCRIPTOR "Calculating machines")
(USE "Calculators")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001545")
(TNR "tgm001547"))


(CONCEPT
(DESCRIPTOR "Calculator industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Adding machine industry")
(BT "Office equipment & supplies industry")
(RT "Calculators")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001546")
(TNR "tgm001548"))


(CONCEPT
(DESCRIPTOR "Calculators")
(SN "For present-day calculators, as well as calculators and mechanical computers of pre-1945 vintage. :SEARCH-SUBDIVISION COMPUTERS for modern electronic computers first developed after 1945.")
(UF "Adding machines")
(UF "Automatic data processing equipment")
(UF "Calculating machines")
(UF "Data processing equipment")
(UF "Mechanical computers")
(BT "Office equipment & supplies")
(RT "Calculator industry")
(RT "Computers")
(RT "Punched card systems")
(RT "Weights & measures")
(CN "Used in a note under COMPUTERS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001547")
(TNR "tgm001549"))


(CONCEPT
(DESCRIPTOR "Calendars")
(SN "Tabular registers of days according to a system, usually covering one year and referring the days of each month to the days of the week.")
(BT "Charts")
(NT "Perpetual calendars")
(NT "Religious calendars")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000134")
(FCNlctgm "lctgm001548")
(TNR "tgm001550"))


(CONCEPT
(DESCRIPTOR "Calico")
(BT "Textiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001549")
(TNR "tgm001551"))


(CONCEPT
(NON-DESCRIPTOR "California crazy")
(USE "Mimetic buildings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001550")
(TNR "tgm001552"))


(CONCEPT
(DESCRIPTOR "California poppies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Poppies, California")
(BT "Flowers")
(BT "Poppies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001551")
(TNR "tgm001553"))


(CONCEPT
(DESCRIPTOR "Calisthenics")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Exercise without apparatus or with light hand apparatus to promote strength and gracefulness.")
(BT "Physical fitness")
(RT "Physical education")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001552")
(TNR "tgm001554"))


(CONCEPT
(NON-DESCRIPTOR "Calla")
(USE "Lilies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001553")
(TNR "tgm001555"))


(CONCEPT
(NON-DESCRIPTOR "Calligrams")
(USE "Letter pictures")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000135")
(FCNlctgm "lctgm001554")
(TNR "tgm001556"))


(CONCEPT
(DESCRIPTOR "Calligraphy")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Processes & techniques")
(RT "Art")
(RT "Writing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001555")
(TNR "tgm001557"))


(CONCEPT
(NON-DESCRIPTOR "Calling cards")
(USE "Visiting cards")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000137")
(FCNlctgm "lctgm001556")
(TNR "tgm001558"))


(CONCEPT
(DESCRIPTOR "Calliopes")
(SN "Includes the activity of playing calliopes.")
(BT "Keyboard instruments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001557")
(TNR "tgm001559"))


(CONCEPT
(NON-DESCRIPTOR "Callitypes")
(USE "Kallitypes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000138")
(FCNlctgm "lctgm001558")
(TNR "tgm001560"))


(CONCEPT
(DESCRIPTOR "Caloric engines")
(UF "Hot-air engines")
(BT "Engines")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001559")
(TNR "tgm001561"))


(CONCEPT
(DESCRIPTOR "Calotypes")
(SN "Paper negatives made using William Henry Fox Talbot's patented (1841) calotype process, a developing-out process.  More popular in England, Scotland and France than in the United States.  May or may not be waxed.  After 1850, superceded by Gustave Le Gray's waxed paper process.")
(UF "Talbotypes")
(BT "Paper negatives")
(RT "Photogenic drawings")
(RT "Salted paper prints")
(RT "Waxed paper negatives")
(CN "Use PHOTOGENIC DRAWINGS for Talbot's printed-out paper negatives.  Use WAXED PAPER NEGATIVES for most paper negatives after 1850.  Use SALTED PAPER PRINTS for most prints made from calotypes.  Used in a note under PHOTOGENIC DRAWINGS and SALTED PAPER PRINTS.")
(HN "Changed 1/97.  Formerly included prints made from calotypes as well as the negatives themselves.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000139")
(FCNlctgm "lctgm001560")
(TNR "tgm001562"))


(CONCEPT
(DESCRIPTOR "Calumets")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Peace pipes")
(BT "Tobacco pipes")
(RT "Peace")
(CN "Changed 11/1993 from PEACE PIPES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001561")
(TNR "tgm001563"))


(CONCEPT
(NON-DESCRIPTOR "Calumny")
(USE "Libel & slander")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001562")
(TNR "tgm001564"))


(CONCEPT
(NON-DESCRIPTOR "Calves")
(USE "Cattle")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001563")
(TNR "tgm001565"))


(CONCEPT
(DESCRIPTOR "Camels")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animals")
(RT "Caravans")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001564")
(TNR "tgm001566"))


(CONCEPT
(DESCRIPTOR "Cameos (Stamps)")
(SN "Small metal-engraved emblems, produced ca. 1850-1880; usually printed in color and often embossed. Typical designs include medallions or shields with views of merchandise or business establishments. Found chiefly on commercial envelopes; also used on billheads, business cards, and as advertisements in publications. Considered a type of corner card by envelope collectors.")
(BT "Emblems")
(RT "Advertisements")
(RT "Corner cards")
(RT "Embossed works")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000140")
(FCNlctgm "lctgm001565")
(TNR "tgm001567"))


(CONCEPT
(DESCRIPTOR "Camera clubs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Photography clubs")
(BT "Clubs")
(RT "Art clubs")
(RT "Photography")
(CN ":DOUBLE-INDEX ORGANIZATIONS' FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001566")
(TNR "tgm001568"))


(CONCEPT
(DESCRIPTOR "Camera lucida works")
(SN "Drawings (and paintings or other works made from them) produced by tracing the image of an object or scene as it appears when projected through the prism of a camera lucida.  The device, which aids accuracy and enlargement or reduction, was not widely used until the early 1800s; replaced the camera obscura.")
(RT "Tracings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000141")
(FCNlctgm "lctgm001567")
(TNR "tgm001569"))


(CONCEPT
(DESCRIPTOR "Camera obscura works")
(SN "Drawings (and paintings or other works made from them) produced by tracing the image of an object or scene as it appears when projected through the aperture of a camera obscura, which is used to aid accuracy.  This device, available by the 1500s, may be a portable box with lens and mirror, or a room; supplanted by the camera lucida.")
(RT "Tracings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000142")
(FCNlctgm "lctgm001568")
(TNR "tgm001570"))


(CONCEPT
(DESCRIPTOR "Cameras")
(BT "Photographic apparatus & supplies")
(NT "Instant cameras")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001569")
(TNR "tgm001571"))


(CONCEPT
(DESCRIPTOR "Camouflage (Biology)")
(BT "Physical characteristics")
(RT "Animals")
(RT "Biology")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001570")
(TNR "tgm001572"))


(CONCEPT
(DESCRIPTOR "Camouflage (Military science)")
(SN ":SEARCH-SUBDIVISION --CAMOUFLAGE :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(BT "Warfare")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001571")
(TNR "tgm001573"))


(CONCEPT
(NON-DESCRIPTOR "Camp cookery")
(USE "Outdoor cookery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001572")
(TNR "tgm001574"))


(CONCEPT
(NON-DESCRIPTOR "Camp life")
(USE "Military life")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001573")
(TNR "tgm001575"))


(CONCEPT
(DESCRIPTOR "Camp meetings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Religious gatherings held, usually by Methodists, for conducting a series of religious services in the open air or in some removed spot. Includes activities and sites.")
(UF "Campmeetings")
(BT "Religious meetings")
(RT "Outdoor religious services")
(RT "Revivals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001574")
(TNR "tgm001576"))


(CONCEPT
(NON-DESCRIPTOR "Camp stoves")
(USE "Stoves")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001575")
(TNR "tgm001577"))


(CONCEPT
(NON-DESCRIPTOR "Campaign books")
(USE "Pressbooks")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000143")
(FCNlctgm "lctgm001576")
(TNR "tgm001578"))


(CONCEPT
(DESCRIPTOR "Campaign finance reform")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Reform")
(RT "Political campaign funds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001577")
(TNR "tgm001579"))


(CONCEPT
(NON-DESCRIPTOR "Campaign funds")
(USE "Political campaign funds")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001578")
(TNR "tgm001580"))


(CONCEPT
(DESCRIPTOR "Campaign headquarters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Organizations' facilities")
(RT "Political campaigns")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001579")
(TNR "tgm001581"))


(CONCEPT
(DESCRIPTOR "Campaign insignia")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Insignia")
(RT "Political campaigns")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001580")
(TNR "tgm001582"))


(CONCEPT
(DESCRIPTOR "Campaign managers")
(BT "People associated with politics & government")
(RT "Political campaigns")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001581")
(TNR "tgm001583"))


(CONCEPT
(NON-DESCRIPTOR "Campaign posters")
(USE "Political posters")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000144")
(FCNlctgm "lctgm001582")
(TNR "tgm001584"))


(CONCEPT
(NON-DESCRIPTOR "Campaigning, Whistle-stop")
(USE "Whistle-stop campaigning")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001583")
(TNR "tgm001585"))


(CONCEPT
(DESCRIPTOR "Campaigns & battles")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images at the time of fighting. :SEARCH-SUBDIVISION BATTLEFIELDS for sites of previously fought battles.  :SEARCH-SUBDIVISION --CAMPAIGNS & BATTLES :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(UF "Battles")
(UF "Campaigns, Military")
(UF "Combat")
(UF "Invasions")
(BT "Warfare")
(RT "Action & adventure dramas")
(RT "Air warfare")
(RT "Armistices")
(RT "Battlefields")
(RT "Foxholes")
(RT "Gas warfare")
(RT "Lancers")
(RT "Massacres")
(RT "Military art & science")
(RT "Mine warfare")
(RT "Naval warfare")
(RT "Night warfare")
(RT "Trench warfare")
(RT "War")
(CN "Also index under :NAMES-OF specific battle when known.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001584")
(TNR "tgm001586"))


(CONCEPT
(NON-DESCRIPTOR "Campaigns, Membership")
(USE "Membership campaigns")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001585")
(TNR "tgm001587"))


(CONCEPT
(NON-DESCRIPTOR "Campaigns, Military")
(USE "Campaigns & battles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001586")
(TNR "tgm001588"))


(CONCEPT
(NON-DESCRIPTOR "Campaigns, Political")
(USE "Political campaigns")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001587")
(TNR "tgm001589"))


(CONCEPT
(NON-DESCRIPTOR "Campaigns, Scrap")
(USE "Scrap drives")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001588")
(TNR "tgm001590"))


(CONCEPT
(NON-DESCRIPTOR "Campaniles")
(USE "Bell towers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001589")
(TNR "tgm001591"))


(CONCEPT
(DESCRIPTOR "Campfires")
(BT "Fire")
(RT "Camping")
(RT "Camps")
(RT "Outdoor cookery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001590")
(TNR "tgm001592"))


(CONCEPT
(DESCRIPTOR "Camping")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For camping outside of organized camps :USED-WITHout permanent shelters. :SEARCH-SUBDIVISION CAMPS for organized camps and camping within permanent structures.")
(BT "Activities")
(RT "Campfires")
(RT "Camps")
(RT "Recreation")
(RT "Tents")
(RT "Tourist camps & hostels")
(CN "Used in a note under CAMPS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001591")
(TNR "tgm001593"))


(CONCEPT
(NON-DESCRIPTOR "Campmeetings")
(USE "Camp meetings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001592")
(TNR "tgm001594"))


(CONCEPT
(DESCRIPTOR "Camps")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and sites. :SEARCH-SUBDIVISION PRIVATE CAMPS for retreats, complexes of cabins, boathouses, etc., for families and friends. :SEARCH-SUBDIVISION CAMPING for camping outside of organized camps :USED-WITHout permanent shelters.")
(UF "Organized camps")
(UF "Summer camps")
(BT "Sports & recreation facilities")
(NT "Military camps")
(NT "Private camps")
(NT "Work camps")
(RT "Campfires")
(RT "Camping")
(RT "Indian encampments")
(RT "Lodges")
(CN "Used in a note under PRIVATE CAMPS and CAMPING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001593")
(TNR "tgm001595"))


(CONCEPT
(NON-DESCRIPTOR "Camps, Internment")
(USE "Concentration camps")
(USE "Relocation camps")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001594")
(TNR "tgm001596"))


(CONCEPT
(NON-DESCRIPTOR "Camps, Military")
(USE "Military camps")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001595")
(TNR "tgm001597"))


(CONCEPT
(NON-DESCRIPTOR "Camps, Mining")
(USE "Mining camps")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001596")
(TNR "tgm001598"))


(CONCEPT
(NON-DESCRIPTOR "Campus disorders")
(USE "Student movements")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001597")
(TNR "tgm001599"))


(CONCEPT
(NON-DESCRIPTOR "Campus schools")
(USE "Laboratory schools")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001598")
(TNR "tgm001600"))


(CONCEPT
(DESCRIPTOR "Can industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(RT "Cans")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001599")
(TNR "tgm001601"))


(CONCEPT
(DESCRIPTOR "Canal boats")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Boats")
(NT "Gondolas")
(RT "Canals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001600")
(TNR "tgm001602"))


(CONCEPT
(DESCRIPTOR "Canal construction")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Civil engineering")
(BT "Construction")
(RT "Canals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001601")
(TNR "tgm001603"))


(CONCEPT
(DESCRIPTOR "Canal construction workers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Construction workers")
(RT "Canals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001602")
(TNR "tgm001604"))


(CONCEPT
(DESCRIPTOR "Canals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Hydraulic facilities")
(NT "Irrigation canals & flumes")
(RT "Aqueducts")
(RT "Canal boats")
(RT "Canal construction")
(RT "Canal construction workers")
(RT "Erosion protection works")
(RT "Locks (Hydraulic engineering)")
(RT "Millraces")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001603")
(TNR "tgm001605"))


(CONCEPT
(DESCRIPTOR "Cancellation proofs")
(UF "Cancelled plate prints")
(BT "Proofs")
(RT "Restrikes")
(HN "Changed 11/90.  Formerly, CANCELLATION PROOFS  may have been indexed as CANCELLED PLATE PRINTS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000145")
(FCNlctgm "lctgm001604")
(TNR "tgm001606"))


(CONCEPT
(NON-DESCRIPTOR "Cancelled plate prints")
(USE "Cancellation proofs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000146")
(FCNlctgm "lctgm001605")
(TNR "tgm001607"))


(CONCEPT
(DESCRIPTOR "Cancer")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Diseases")
(RT "Kaposi's sarcoma")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001606")
(TNR "tgm001608"))


(CONCEPT
(DESCRIPTOR "Candelabras")
(BT "Light fixtures")
(RT "Candles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001607")
(TNR "tgm001609"))


(CONCEPT
(NON-DESCRIPTOR "Candid portraits")
(USE "Portrait photographs")
(FUN "Formerly TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(FCNGMGPC "gmgpc000147")
(TNR "tgm001610"))


(CONCEPT
(NON-DESCRIPTOR "Candidates, Political")
(USE "Political elections")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001608")
(TNR "tgm001611"))


(CONCEPT
(NON-DESCRIPTOR "Candidates, Presidential")
(USE "Presidential elections")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001609")
(TNR "tgm001612"))


(CONCEPT
(DESCRIPTOR "Candlelight vigils")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vigils")
(RT "Prayer")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001610")
(TNR "tgm001613"))


(CONCEPT
(DESCRIPTOR "Candlemaking")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For small businesses and domestic activities.")
(BT "Processes & techniques")
(RT "Candles")
(RT "Industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001611")
(TNR "tgm001614"))


(CONCEPT
(DESCRIPTOR "Candles")
(BT "Objects")
(RT "Candelabras")
(RT "Candlemaking")
(RT "Candlesticks")
(RT "Lighting")
(RT "Sconces")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001612")
(TNR "tgm001615"))


(CONCEPT
(DESCRIPTOR "Candlesticks")
(BT "Light fixtures")
(RT "Candles")
(RT "Menorahs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001613")
(TNR "tgm001616"))


(CONCEPT
(DESCRIPTOR "Candy")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Confections")
(RT "Chewing gum")
(CN "As appropriate, :SUBDIVIDE-BY place with which candy is associated.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001614")
(TNR "tgm001617"))


(CONCEPT
(NON-DESCRIPTOR "Candy making")
(USE "Cookery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001615")
(TNR "tgm001618"))


(CONCEPT
(NON-DESCRIPTOR "Candy stores")
(USE "Confectioneries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001616")
(TNR "tgm001619"))


(CONCEPT
(NON-DESCRIPTOR "Cane sugar")
(USE "Sugar")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001617")
(TNR "tgm001620"))


(CONCEPT
(NON-DESCRIPTOR "Canes")
(USE "Staffs (Sticks)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001618")
(TNR "tgm001621"))


(CONCEPT
(DESCRIPTOR "Canned foods")
(BT "Food")
(RT "Cans")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001619")
(TNR "tgm001622"))


(CONCEPT
(DESCRIPTOR "Canneries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Factories")
(RT "Cannery workers")
(RT "Fishing industry")
(RT "Food industry")
(HN "Changed 6/1996 from non-postable term (Use FOOD INDUSTRY).")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001620")
(TNR "tgm001623"))


(CONCEPT
(DESCRIPTOR "Cannery workers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with manual labor")
(RT "Canneries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001621")
(TNR "tgm001624"))


(CONCEPT
(DESCRIPTOR "Cannibalism")
(GEO-FACET ":COUNTRY")
(BT "Manners & customs")
(RT "Shrunken heads")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001622")
(TNR "tgm001625"))


(CONCEPT
(DESCRIPTOR "Canning & preserving")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Preserving")
(BT "Processes & techniques")
(RT "Food industry")
(RT "Home food processing")
(HN "Changed 8/2004 from non-postable term (USE HOME FOOD PROCESSING or USE FOOD INDUSTRY).")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001623")
(TNR "tgm001626"))


(CONCEPT
(DESCRIPTOR "Cannon balls")
(UF "Cannonballs")
(BT "Ammunition")
(RT "Cannons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001624")
(TNR "tgm001627"))


(CONCEPT
(NON-DESCRIPTOR "Cannonballs")
(USE "Cannon balls")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001625")
(TNR "tgm001628"))


(CONCEPT
(DESCRIPTOR "Cannons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Artillery (Weaponry)")
(NT "Hotchkiss revolving cannons")
(NT "Howitzers")
(RT "Cannon balls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001626")
(TNR "tgm001629"))


(CONCEPT
(NON-DESCRIPTOR "Canoeing")
(USE "Canoes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001627")
(TNR "tgm001630"))


(CONCEPT
(DESCRIPTOR "Canoeists (Sports)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Athletes")
(RT "Canoes")
(HN "Changed 11/2003 from CANOEISTS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001628")
(TNR "tgm001631"))


(CONCEPT
(DESCRIPTOR "Canoes")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Canoeing")
(BT "Boats")
(NT "Outrigger canoes")
(RT "Canoeists (Sports)")
(RT "Kayaks")
(RT "Shooting rapids")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001629")
(TNR "tgm001632"))


(CONCEPT
(DESCRIPTOR "Canopies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Roofs")
(RT "Landscape pavilions")
(RT "Marquees")
(RT "Tents")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001630")
(TNR "tgm001633"))


(CONCEPT
(DESCRIPTOR "Cans")
(UF "Milk cans")
(BT "Containers")
(NT "Oil cans")
(NT "Sardine cans")
(RT "Can industry")
(RT "Canned foods")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001631")
(TNR "tgm001634"))


(CONCEPT
(DESCRIPTOR "Cantaloupes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Melons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001632")
(TNR "tgm001635"))


(CONCEPT
(DESCRIPTOR "Canteens (Beverage containers)")
(BT "Containers")
(RT "Drinking vessels")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001633")
(TNR "tgm001636"))


(CONCEPT
(NON-DESCRIPTOR "Canteens (Employee)")
(USE "Employee eating facilities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001634")
(TNR "tgm001637"))


(CONCEPT
(DESCRIPTOR "Canteens (Wartime, emergency, etc.)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Temporary establishments which provide members of the armed forces and, in emergencies, civilians with food and recreation.")
(BT "Sports & recreation facilities")
(RT "Disaster relief")
(RT "Restaurants")
(RT "USO clubs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001635")
(TNR "tgm001638"))


(CONCEPT
(DESCRIPTOR "Cantilever construction")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Construction using horizontal projecting members which are supported at only one end.")
(BT "Construction")
(RT "Cantilevered roofs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001636")
(TNR "tgm001639"))


(CONCEPT
(DESCRIPTOR "Cantilevered roofs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "V-support roofs")
(BT "Roofs")
(RT "Cantilever construction")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001637")
(TNR "tgm001640"))


(CONCEPT
(DESCRIPTOR "Cantors (Judaism)")
(SN "Synagogue officials who sing or chant liturgical music.")
(BT "People associated with religion")
(BT "Singers")
(RT "Judaism")
(RT "Rabbis")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001638")
(TNR "tgm001641"))


(CONCEPT
(DESCRIPTOR "Canvassing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Door-to-door selling")
(UF "Traveling salesmanship")
(BT "Selling")
(RT "Peddlers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001639")
(TNR "tgm001642"))


(CONCEPT
(NON-DESCRIPTOR "Canvassing, Political")
(USE "Political elections")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001640")
(TNR "tgm001643"))


(CONCEPT
(DESCRIPTOR "Canyons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For valleys between precipitous walls. :SEARCH-SUBDIVISION CLIFFS for very steep, perpendicular, or overhanging faces of rock, earth, or glacial ice of considerable height.")
(UF "Chasms")
(UF "Gorges")
(UF "Gulches")
(UF "Gullies")
(UF "Ravines")
(BT "Valleys")
(RT "Cliffs")
(CN "Used in a note under CLIFFS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001641")
(TNR "tgm001644"))


(CONCEPT
(DESCRIPTOR "Capes (Clothing)")
(UF "Cloaks")
(BT "Clothing & dress")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001642")
(TNR "tgm001645"))


(CONCEPT
(DESCRIPTOR "Capes (Coasts)")
(GEO-FACET ":COUNTRY :STATE")
(UF "Headlands")
(UF "Necks (Coasts)")
(UF "Points (Coasts)")
(BT "Land")
(RT "Peninsulas")
(RT "Waterfronts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001643")
(TNR "tgm001646"))


(CONCEPT
(NON-DESCRIPTOR "Capital punishment")
(USE "Executions")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001644")
(TNR "tgm001647"))


(CONCEPT
(NON-DESCRIPTOR "Capital sins")
(USE "Deadly sins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001645")
(TNR "tgm001648"))


(CONCEPT
(DESCRIPTOR "Capitalism")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of capitalism in general.")
(BT "Economic & political systems")
(RT "Capitalists & financiers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001646")
(TNR "tgm001649"))


(CONCEPT
(DESCRIPTOR "Capitalists & financiers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Financiers")
(UF "Investors")
(BT "People associated with commercial activities")
(RT "Capitalism")
(RT "Venture capital")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001647")
(TNR "tgm001650"))


(CONCEPT
(DESCRIPTOR "Capitals (Columns)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Molded or carved tops of columns.")
(BT "Architectural elements")
(RT "Architectural orders")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001648")
(TNR "tgm001651"))


(CONCEPT
(NON-DESCRIPTOR "Capitol buildings")
(USE "Capitols")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001649")
(TNR "tgm001652"))


(CONCEPT
(DESCRIPTOR "Capitol pages")
(UF "Congressional pages")
(UF "Pages, Congressional")
(BT "Children")
(RT "Legislators")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001650")
(TNR "tgm001653"))


(CONCEPT
(DESCRIPTOR "Capitols")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Capitol buildings")
(UF "Parliament buildings")
(UF "State houses")
(UF "Statehouses")
(BT "Government facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001651")
(TNR "tgm001654"))


(CONCEPT
(NON-DESCRIPTOR "Capitulations, Military")
(USE "Surrenders")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001652")
(TNR "tgm001655"))


(CONCEPT
(NON-DESCRIPTOR "Caps")
(USE "Hats")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001653")
(TNR "tgm001656"))


(CONCEPT
(DESCRIPTOR "Captain's chairs")
(UF "Low-back windsor chairs")
(BT "Chairs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001654")
(TNR "tgm001657"))


(CONCEPT
(NON-DESCRIPTOR "Captains, Ship")
(USE "Ship captains")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001655")
(TNR "tgm001658"))


(CONCEPT
(DESCRIPTOR "Captive balloons")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Kite balloons")
(UF "Observation kite balloons")
(BT "Balloons (Aircraft)")
(NT "Barrage balloons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001656")
(TNR "tgm001659"))


(CONCEPT
(DESCRIPTOR "Captives")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Prisoners")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001657")
(TNR "tgm001660"))


(CONCEPT
(DESCRIPTOR "Capture & imprisonment")
(CN "Used only as a subdivision with :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A] :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm001658")
(TNR "tgm001661"))


(CONCEPT
(NON-DESCRIPTOR "Captures")
(USE "Confiscations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001659")
(TNR "tgm001662"))


(CONCEPT
(DESCRIPTOR "Capybaras")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Rodents")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001660")
(TNR "tgm001663"))


(CONCEPT
(NON-DESCRIPTOR "Car mechanics")
(USE "Mechanics (Persons)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001661")
(TNR "tgm001664"))


(CONCEPT
(NON-DESCRIPTOR "Car racing")
(USE "Automobile racing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001662")
(TNR "tgm001665"))


(CONCEPT
(NON-DESCRIPTOR "Car shows")
(USE "Automobile shows")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012070"))


(CONCEPT
(NON-DESCRIPTOR "Car sickness")
(USE "Motion sickness")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001663")
(TNR "tgm001666"))


(CONCEPT
(DESCRIPTOR "Car washes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Auto washes")
(UF "Carwashes")
(BT "Service industry facilities")
(RT "Automobiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001664")
(TNR "tgm001667"))


(CONCEPT
(DESCRIPTOR "Caravans")
(GEO-FACET ":COUNTRY")
(SN "Companies of travelers with their animals, wagons, and equipment on a journey.")
(BT "Transportation")
(NT "Wagon trains")
(RT "Camels")
(RT "Caravansaries")
(RT "Commerce")
(RT "Packtrains")
(RT "Travel")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001665")
(TNR "tgm001668"))


(CONCEPT
(DESCRIPTOR "Caravansaries")
(GEO-FACET ":COUNTRY")
(BT "Public accommodation facilities")
(RT "Caravans")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001666")
(TNR "tgm001669"))


(CONCEPT
(NON-DESCRIPTOR "Carbines")
(USE "Rifles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001667")
(TNR "tgm001670"))


(CONCEPT
(NON-DESCRIPTOR "Carbon photoprints")
(USE "Carbon prints")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001668")
(TNR "tgm001671"))


(CONCEPT
(DESCRIPTOR "Carbon prints")
(SN "Photographic prints made by a relatively permanent, non-silver process involving bichromated gelatin. Popular ca. 1870-1900; more common in Europe than United States; often used to reproduce art works. Typically carbon black, but a wide range of other pigments may also be used.")
(UF "Autotypes")
(UF "Carbon photoprints")
(UF "Chromotypes")
(UF "Lambertypes")
(BT "Photographic prints")
(NT "Carbro prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000148")
(FCNlctgm "lctgm001669")
(TNR "tgm001672"))


(CONCEPT
(DESCRIPTOR "Carbon transparencies")
(SN "Transparencies made with a carbon process on glass.")
(BT "Glass transparencies")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000149")
(FCNlctgm "lctgm001670")
(TNR "tgm001673"))


(CONCEPT
(DESCRIPTOR "Carbonated beverages")
(UF "Soda water")
(UF "Soft drinks")
(BT "Beverages")
(NT "Sarsaparilla")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001671")
(TNR "tgm001674"))


(CONCEPT
(DESCRIPTOR "Carborundum prints")
(SN "For prints produced from printing plates that have been coated with carborundum, an abrasive powder of silicon carbide, mixed with a resin or liquid that hardens on the surface of the plate to catch and hold ink, or under pressure, scores the plate creating pits which retain ink.  The plate can be worked in the same manner as a mezzotint to create an image by burnishing the surface to produce the tonal ranges of an image.")
(BT "Intaglio prints")
(RT "Mezzotints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000150")
(FCNlctgm "lctgm001672")
(TNR "tgm001675"))


(CONCEPT
(NON-DESCRIPTOR "Carbro photoprints")
(USE "Carbro prints")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001673")
(TNR "tgm001676"))


(CONCEPT
(DESCRIPTOR "Carbro prints")
(SN "Photographic prints made by pressing a specially sensitized carbon tissue against a wet bromide print and subsequently developing the tissue.  Introduced in 1905 as Ozobrome; popular 1920s-1930s as a way to make carbon prints larger than the original negative since the bromide print intermediary could be an enlargement of the negative.")
(UF "Carbro photoprints")
(UF "Ozobrome photoprints")
(UF "Ozobrome prints")
(BT "Carbon prints")
(NT "Tricolor carbro prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000151")
(FCNlctgm "lctgm001674")
(TNR "tgm001677"))


(CONCEPT
(DESCRIPTOR "Card catalogs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Storage furniture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001675")
(TNR "tgm001678"))


(CONCEPT
(DESCRIPTOR "Card games")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the activity of playing cards.")
(UF "Card playing")
(BT "Games")
(NT "Bridge (Game)")
(NT "Poker")
(RT "Card tricks")
(RT "Gambling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001676")
(TNR "tgm001679"))


(CONCEPT
(DESCRIPTOR "Card photograph albums")
(SN "Albums designed to hold card photographs.")
(UF "Cartes de visite albums")
(BT "Photograph albums")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000152")
(FCNlctgm "lctgm001677")
(TNR "tgm001680"))


(CONCEPT
(DESCRIPTOR "Card photographs")
(SN "Paper photographic prints made by a variety of processes on commercially produced cardboard mounts of standard sizes (with some variation).  Introduced in the 1850s. This term includes negatives and unmounted photographic prints intended for such standard mounts.  Often portraits.")
(BT "Photographs")
(NT "Boudoir card photographs")
(NT "Cabinet photographs")
(NT "Cartes de visite")
(NT "Imperial card photographs")
(NT "Kodak card photographs")
(NT "Panel card photographs")
(NT "Promenade card photographs")
(NT "Victoria card photographs")
(RT "Photographic prints")
(RT "Stereographs")
(CN "As desired, also index under the type of photographic process.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000153")
(FCNlctgm "lctgm001678")
(TNR "tgm001681"))


(CONCEPT
(NON-DESCRIPTOR "Card playing")
(USE "Card games")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001679")
(TNR "tgm001682"))


(CONCEPT
(DESCRIPTOR "Card tricks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Magic")
(RT "Card games")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001680")
(TNR "tgm001683"))


(CONCEPT
(DESCRIPTOR "Cardinals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Chief officials of Roman Catholic papal bureaucracy.")
(BT "Clergy")
(BT "Prelates")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001681")
(TNR "tgm001684"))


(CONCEPT
(DESCRIPTOR "Cardiovascular system")
(UF "Blood circulation")
(UF "Circulatory system")
(UF "Vascular system")
(BT "Body parts")
(RT "Blood")
(RT "Human body")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001682")
(TNR "tgm001685"))


(CONCEPT
(DESCRIPTOR "Cards")
(SN "Pieces of thin paperboard or stiff paper, which are flat, usually small and rectangular, and designed to convey messages or other information.")
(BT "Ephemera")
(NT "Advertising cards")
(NT "Business cards")
(NT "Collecting cards")
(NT "Comic cards")
(NT "Dance cards")
(NT "Display cards")
(NT "Membership cards")
(NT "Playing cards")
(NT "Postcards")
(NT "Sentiment cards")
(NT "Speakeasy cards")
(NT "Sports cards")
(NT "Visiting cards")
(RT "Greeting cards")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000154")
(FCNlctgm "lctgm001683")
(TNR "tgm001686"))


(CONCEPT
(NON-DESCRIPTOR "Cards, Charge")
(USE "Credit cards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001684")
(TNR "tgm001687"))


(CONCEPT
(NON-DESCRIPTOR "Cards, Credit")
(USE "Credit cards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001685")
(TNR "tgm001688"))


(CONCEPT
(NON-DESCRIPTOR "Cards, Report")
(USE "Report cards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001686")
(TNR "tgm001689"))


(CONCEPT
(NON-DESCRIPTOR "Cards, Window")
(USE "Window cards")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000155")
(FCNlctgm "lctgm001687")
(TNR "tgm001690"))


(CONCEPT
(NON-DESCRIPTOR "Careers")
(USE "Occupations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001688")
(TNR "tgm001691"))


(CONCEPT
(NON-DESCRIPTOR "Cargo")
(USE "Shipping")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001689")
(TNR "tgm001692"))


(CONCEPT
(NON-DESCRIPTOR "Cargo handling")
(USE "Shipping")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001690")
(TNR "tgm001693"))


(CONCEPT
(DESCRIPTOR "Cargo holds")
(UF "Freight holds")
(UF "Holds, Cargo")
(BT "Interiors")
(RT "Cargo ships")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001691")
(TNR "tgm001694"))


(CONCEPT
(NON-DESCRIPTOR "Cargo planes")
(USE "Transport planes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001692")
(TNR "tgm001695"))


(CONCEPT
(DESCRIPTOR "Cargo ships")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Freight ships")
(UF "Freighters")
(BT "Ships")
(NT "Liberty ships")
(NT "Tankers")
(RT "Cargo holds")
(RT "Shipping")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001693")
(TNR "tgm001696"))


(CONCEPT
(NON-DESCRIPTOR "Caribou")
(USE "Reindeer")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001694")
(TNR "tgm001697"))


(CONCEPT
(DESCRIPTOR "Caricatures")
(SN "Cartoons that portray in a critical or facetious way a real individual or group, or a figure representing a social, political, ethnic, or racial type.  The effect is usually achieved through distortion or exaggeration of the features or form.")
(UF "Stereotypes")
(BT "Cartoons (Commentary)")
(RT "Ethnic stereotypes")
(RT "Portraits")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000156")
(FCNlctgm "lctgm001695")
(TNR "tgm001698"))


(CONCEPT
(NON-DESCRIPTOR "Caricaturists")
(USE "Cartoonists")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001696")
(TNR "tgm001699"))


(CONCEPT
(DESCRIPTOR "Carillons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Bells")
(RT "Bell towers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001697")
(TNR "tgm001700"))


(CONCEPT
(DESCRIPTOR "Carnations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Flowers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001698")
(TNR "tgm001701"))


(CONCEPT
(DESCRIPTOR "Carnival")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Festivals, merrymaking, and revelry which takes place before Lent.")
(BT "Celebrations")
(RT "Holidays")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001699")
(TNR "tgm001702"))


(CONCEPT
(DESCRIPTOR "Carnival games")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Games")
(RT "Amusement parks")
(RT "Carnivals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001700")
(TNR "tgm001703"))


(CONCEPT
(NON-DESCRIPTOR "Carnival posters")
(USE "Circus posters")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000157")
(FCNlctgm "lctgm001701")
(TNR "tgm001704"))


(CONCEPT
(DESCRIPTOR "Carnivals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "A traveling collection of shows, rides, foods, and/or games.")
(BT "Entertainment")
(RT "Carnival games")
(RT "Fairs")
(RT "Midways")
(HN "Changed 6/2004 from non-postable term (USE AMUSEMENT PARKS).")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001702")
(TNR "tgm001705"))


(CONCEPT
(NON-DESCRIPTOR "Carnivals, Winter")
(USE "Winter carnivals")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001703")
(TNR "tgm001706"))


(CONCEPT
(DESCRIPTOR "Caroling")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Singing")
(RT "Holidays")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001704")
(TNR "tgm001707"))


(CONCEPT
(NON-DESCRIPTOR "Carols, Christmas")
(USE "Christmas carols")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001705")
(TNR "tgm001708"))


(CONCEPT
(NON-DESCRIPTOR "Carom billiards")
(USE "Billiards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001706")
(TNR "tgm001709"))


(CONCEPT
(NON-DESCRIPTOR "Carousels")
(USE "Merry-go-rounds")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001707")
(TNR "tgm001710"))


(CONCEPT
(DESCRIPTOR "Carpenter shops")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on facilities. :SEARCH-SUBDIVISION CARPENTRY for activities.")
(BT "Workshops")
(RT "Carpentry")
(CN "Used in a note under CARPENTRY.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001708")
(TNR "tgm001711"))


(CONCEPT
(DESCRIPTOR "Carpenters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with manual labor")
(RT "Carpenters' unions")
(RT "Carpentry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001709")
(TNR "tgm001712"))


(CONCEPT
(DESCRIPTOR "Carpenters' unions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Labor unions")
(RT "Carpenters")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001710")
(TNR "tgm001713"))


(CONCEPT
(DESCRIPTOR "Carpentry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Building with wood, especially in the construction of buildings and other structures.")
(BT "Construction")
(NT "Joinery")
(RT "Cabinetmaking")
(RT "Carpenter shops")
(RT "Carpenters")
(RT "Chisels & mallets")
(RT "Woodworking")
(CN "Used in a note under CARPENTER SHOPS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001711")
(TNR "tgm001714"))


(CONCEPT
(NON-DESCRIPTOR "Carpet tacks")
(USE "Tacks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001712")
(TNR "tgm001715"))


(CONCEPT
(NON-DESCRIPTOR "Carpets")
(USE "Floor coverings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001713")
(TNR "tgm001716"))


(CONCEPT
(NON-DESCRIPTOR "Carpinus")
(USE "Hornbeams")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001714")
(TNR "tgm001717"))


(CONCEPT
(NON-DESCRIPTOR "Carriage drivers")
(USE "Coach drivers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001715")
(TNR "tgm001718"))


(CONCEPT
(DESCRIPTOR "Carriage houses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Coach houses")
(BT "Transportation facilities")
(RT "Residential facilities")
(RT "Storage facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001716")
(TNR "tgm001719"))


(CONCEPT
(DESCRIPTOR "Carriages & coaches")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Vehicles, drawn by animals, used primarily for the transport of people.")
(UF "Buggies")
(UF "Cabs, Hansom")
(UF "Coaches")
(UF "Hansom cabs")
(UF "Turnouts")
(BT "Vehicles")
(NT "Goat carts")
(NT "Pony carts")
(NT "Stagecoaches")
(RT "Animal teams")
(RT "Carts & wagons")
(RT "Chariots")
(RT "Coach drivers")
(RT "Hearses")
(RT "Howdahs")
(RT "Wheeled chairs")
(CN "Used in a note under CARTS & WAGONS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001717")
(TNR "tgm001720"))


(CONCEPT
(NON-DESCRIPTOR "Carrier pigeons")
(USE "Homing pigeons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001718")
(TNR "tgm001721"))


(CONCEPT
(NON-DESCRIPTOR "Carriers (Warships)")
(USE "Aircraft carriers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001720")
(TNR "tgm001723"))


(CONCEPT
(DESCRIPTOR "Carriers' addresses")
(UF "Bellmen's verses")
(UF "Newscarriers' addresses")
(UF "Newsmen's presents")
(BT "Ephemera")
(RT "Broadsides")
(RT "New Year cards")
(CN "TGM II term.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001719")
(TNR "tgm001722"))


(CONCEPT
(NON-DESCRIPTOR "Carriers, Aircraft")
(USE "Aircraft carriers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001721")
(TNR "tgm001724"))


(CONCEPT
(NON-DESCRIPTOR "Carries")
(USE "Portages")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001722")
(TNR "tgm001725"))


(CONCEPT
(DESCRIPTOR "Carrots")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vegetables")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001723")
(TNR "tgm001726"))


(CONCEPT
(NON-DESCRIPTOR "Carrying & lifting")
(USE "Lifting & carrying")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001724")
(TNR "tgm001727"))


(CONCEPT
(NON-DESCRIPTOR "Cars")
(USE "Automobiles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001725")
(TNR "tgm001728"))


(CONCEPT
(DESCRIPTOR "Cartes de visite")
(SN "Card photographs; mounts measure approximately 4 x 2.5 in. (10 x 6 cm.).  Introduced in the United States in 1859; made into the 1900s.")
(BT "Card photographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000159")
(FCNlctgm "lctgm001726")
(TNR "tgm001729"))


(CONCEPT
(NON-DESCRIPTOR "Cartes de visite (Visiting cards)")
(USE "Visiting cards")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000161")
(FCNlctgm "lctgm001728")
(TNR "tgm001731"))


(CONCEPT
(NON-DESCRIPTOR "Cartes de visite albums")
(USE "Card photograph albums")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000160")
(FCNlctgm "lctgm001727")
(TNR "tgm001730"))


(CONCEPT
(NON-DESCRIPTOR "Cartography")
(USE "Map making")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001729")
(TNR "tgm001732"))


(CONCEPT
(NON-DESCRIPTOR "Cartoon cels")
(USE "Animation cels")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000162")
(FCNlctgm "lctgm001730")
(TNR "tgm001733"))


(CONCEPT
(NON-DESCRIPTOR "Cartoon characters")
(USE "Fictitious characters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001731")
(TNR "tgm001734"))


(CONCEPT
(NON-DESCRIPTOR "Cartoon patterns")
(USE "Cartoons (Working drawings)")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000163")
(FCNlctgm "lctgm001732")
(TNR "tgm001735"))


(CONCEPT
(NON-DESCRIPTOR "Cartoon strips")
(USE "Comics")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000164")
(FCNlctgm "lctgm001733")
(TNR "tgm001736"))


(CONCEPT
(DESCRIPTOR "Cartoonists")
(UF "Caricaturists")
(BT "Artists")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001734")
(TNR "tgm001737"))


(CONCEPT
(NON-DESCRIPTOR "Cartoons")
(USE "Cartoons (Commentary)")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000165")
(FCNlctgm "lctgm001735")
(TNR "tgm001738"))


(CONCEPT
(DESCRIPTOR "Cartoons (Commentary)")
(SN "Pictorial images using wit to comment on such things as contemporary events, social habits, or political trends; usually executed in a broad or abbreviated manner.")
(UF "Cartoons")
(UF "Comic pictures")
(BT "Pictures")
(NT "Caricatures")
(NT "Comic cards")
(NT "Comics")
(NT "Editorial cartoons")
(NT "Political cartoons")
(NT "Satires (Visual works)")
(RT "Humorous pictures")
(RT "Protest works")
(HN "Changed 6/94. Formerly, CARTOONS (COMMENTARY) may have been indexed as CARTOONS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000166")
(FCNlctgm "lctgm001736")
(TNR "tgm001739"))


(CONCEPT
(DESCRIPTOR "Cartoons (Working drawings)")
(SN "Full-size preparatory drawings made to transfer a design to the working surface of a painting, tapestry, or other large work. [AAT]")
(UF "Cartoon patterns")
(BT "Working drawings")
(HN "Changed 6/94. Formerly, CARTOONS (WORKING DRAWINGS) may have been indexed as CARTOON PATTERNS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000167")
(FCNlctgm "lctgm001737")
(TNR "tgm001740"))


(CONCEPT
(DESCRIPTOR "Cartouches")
(SN "Graphic delineations that are ornamental frames intended to contain an inscription, such as a map title, or a decoration, such as a coat of arms.")
(BT "Decorations")
(RT "Maps")
(RT "Title pages")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000168")
(FCNlctgm "lctgm001738")
(TNR "tgm001741"))


(CONCEPT
(DESCRIPTOR "Cartouches (Architecture)")
(SN "An ornamental tablet often inscribed or decorated, and framed with elaborate scroll-like carving.")
(BT "Architectural elements")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001739")
(TNR "tgm001742"))


(CONCEPT
(DESCRIPTOR "Carts & wagons")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Vehicles, drawn by animal or man or pushed, primarily for the transportation of goods. :SEARCH-SUBDIVISION CARRIAGES & COACHES for vehicles used primarily to transport people.")
(UF "Delivery wagons")
(UF "Freight wagons")
(UF "Wagons")
(BT "Vehicles")
(NT "Bandwagons")
(NT "Caissons (Vehicles)")
(NT "Chuck wagons")
(NT "Covered wagons")
(NT "Grocery carts")
(NT "Hoover wagons")
(NT "Mail wagons")
(RT "Animal teams")
(RT "Carriages & coaches")
(RT "Portable darkrooms")
(RT "Shipping")
(RT "Wagon sheds")
(CN "Used in a note under CARRIAGES & COACHES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001740")
(TNR "tgm001743"))


(CONCEPT
(DESCRIPTOR "Carving")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Sculpting")
(UF "Sculpturing")
(BT "Handicraft")
(NT "Ivory carving")
(NT "Stone carving")
(NT "Wood carving")
(RT "Sculpture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001741")
(TNR "tgm001744"))


(CONCEPT
(NON-DESCRIPTOR "Carvings")
(USE "Sculpture")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001742")
(TNR "tgm001745"))


(CONCEPT
(NON-DESCRIPTOR "Carwashes")
(USE "Car washes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001743")
(TNR "tgm001746"))


(CONCEPT
(DESCRIPTOR "Caryatids")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "A column, pier, or pilaster in the form of a draped female figure.")
(BT "Architectural elements")
(RT "Architectural sculpture")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012133"))


(CONCEPT
(NON-DESCRIPTOR "Cascades")
(USE "Waterfalls")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001744")
(TNR "tgm001747"))


(CONCEPT
(NON-DESCRIPTOR "Cased photographs")
(USE "Ambrotypes")
(USE "Daguerreotypes")
(USE "Photograph cases")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000169")
(FCNlctgm "lctgm001745")
(TNR "tgm001748"))


(CONCEPT
(DESCRIPTOR "Casein paintings")
(BT "Paintings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000170")
(FCNlctgm "lctgm001746")
(TNR "tgm001749"))


(CONCEPT
(NON-DESCRIPTOR "Casement doors")
(USE "French doors")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001747")
(TNR "tgm001750"))


(CONCEPT
(DESCRIPTOR "Casement windows")
(SN "Windows having a sash that opens on hinges attached to the upright side of the frame.")
(BT "Windows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001748")
(TNR "tgm001751"))


(CONCEPT
(NON-DESCRIPTOR "Casements")
(USE "Armored vessels")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001749")
(TNR "tgm001752"))


(CONCEPT
(NON-DESCRIPTOR "Cases, Book")
(USE "Bookcases")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001750")
(TNR "tgm001753"))


(CONCEPT
(NON-DESCRIPTOR "Cases, Display")
(USE "Showcases")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001751")
(TNR "tgm001754"))


(CONCEPT
(NON-DESCRIPTOR "Cases, Photograph")
(USE "Union cases")
(FUN "Formerly TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(FCNGMGPC "gmgpc000171")
(TNR "tgm001755"))


(CONCEPT
(NON-DESCRIPTOR "Cases, Show")
(USE "Showcases")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001752")
(TNR "tgm001756"))


(CONCEPT
(DESCRIPTOR "Cash registers")
(BT "Office equipment & supplies")
(RT "Money")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001753")
(TNR "tgm001757"))


(CONCEPT
(DESCRIPTOR "Casinos")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Sports & recreation facilities")
(RT "Gambling")
(RT "Hotels")
(RT "Resorts")
(RT "Slot machines")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001754")
(TNR "tgm001758"))


(CONCEPT
(NON-DESCRIPTOR "Caskets")
(USE "Coffins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001755")
(TNR "tgm001759"))


(CONCEPT
(NON-DESCRIPTOR "Casks")
(USE "Barrels")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001756")
(TNR "tgm001760"))


(CONCEPT
(DESCRIPTOR "Cassette tape recorders")
(BT "Sound equipment & supplies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001757")
(TNR "tgm001761"))


(CONCEPT
(NON-DESCRIPTOR "Cassons")
(USE "Coffers (Ceilings)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001758")
(TNR "tgm001762"))


(CONCEPT
(DESCRIPTOR "Cast ironwork")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Pig ironwork")
(BT "Ironwork")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001759")
(TNR "tgm001763"))


(CONCEPT
(DESCRIPTOR "Cast paper prints")
(SN "Paper works made since the 1970s by pouring wet, often colored, pulp into a mold.  Such prints may be difficult to distinguish from embossed prints.")
(BT "Prints")
(RT "Embossed prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000172")
(FCNlctgm "lctgm001760")
(TNR "tgm001764"))


(CONCEPT
(DESCRIPTOR "Castaways")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "People")
(RT "Marooned")
(RT "Shipwrecks")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001761")
(TNR "tgm001765"))


(CONCEPT
(DESCRIPTOR "Castles & palaces")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Chateaux")
(UF "Palaces")
(BT "Houses")
(RT "Forts & fortifications")
(RT "Moats")
(RT "Official residences")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001762")
(TNR "tgm001766"))


(CONCEPT
(DESCRIPTOR "Casualties")
(CN "Used only as a subdivision with :NAMES-OF :NAME-OF-WAR [Appendix C].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm001763")
(TNR "tgm001767"))


(CONCEPT
(NON-DESCRIPTOR "Casualties, War")
(USE "War casualties")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001764")
(TNR "tgm001768"))


(CONCEPT
(NON-DESCRIPTOR "Cat food industry")
(USE "Pet food industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001765")
(TNR "tgm001769"))


(CONCEPT
(DESCRIPTOR "Cat tails (Plant)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cat's tails")
(UF "Reed mace")
(BT "Plants")
(HN "Changed 11/2002 from non-postable term USE TIMOTHY-GRASS")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001766")
(TNR "tgm001770"))


(CONCEPT
(DESCRIPTOR "Catacombs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Subterranean cemeteries consisting of galleries or passages with side recesses for tombs.")
(BT "Cemeteries")
(RT "Tombs & sepulchral monuments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001767")
(TNR "tgm001771"))


(CONCEPT
(DESCRIPTOR "Catafalques")
(SN "Draped or canopied raised structure on which a coffin is placed.")
(BT "Architectural elements")
(RT "Coffins")
(RT "Funeral rites & ceremonies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001768")
(TNR "tgm001772"))


(CONCEPT
(NON-DESCRIPTOR "Catalog order businesses")
(USE "Mail-order businesses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001769")
(TNR "tgm001773"))


(CONCEPT
(DESCRIPTOR "Catalogs")
(SN "Enumerations of items arranged systematically with descriptive details.  May have prices.")
(UF "Catalogues")
(NT "Auction catalogs")
(NT "Exhibition catalogs")
(NT "Sales catalogs")
(RT "Ephemera")
(RT "Price lists")
(RT "Sample books")
(CN "In Genre Terms ... Rare Book, this term is spelled \"catalogues.\"")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000173")
(FCNlctgm "lctgm001770")
(TNR "tgm001774"))


(CONCEPT
(NON-DESCRIPTOR "Catalogues")
(USE "Catalogs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000174")
(FCNlctgm "lctgm001771")
(TNR "tgm001775"))


(CONCEPT
(DESCRIPTOR "Catalpas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001772")
(TNR "tgm001776"))


(CONCEPT
(NON-DESCRIPTOR "Cataracts")
(USE "Waterfalls")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001773")
(TNR "tgm001777"))


(CONCEPT
(NON-DESCRIPTOR "Catastrophes")
(USE "Disasters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001774")
(TNR "tgm001778"))


(CONCEPT
(DESCRIPTOR "Caterpillars")
(GEO-FACET ":COUNTRY :STATE")
(BT "Insects")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001775")
(TNR "tgm001779"))


(CONCEPT
(NON-DESCRIPTOR "Caterpillar-type machinery")
(USE "Tracklaying vehicles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001776")
(TNR "tgm001780"))


(CONCEPT
(DESCRIPTOR "Catfish")
(GEO-FACET ":COUNTRY :STATE")
(BT "Fish")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001777")
(TNR "tgm001781"))


(CONCEPT
(DESCRIPTOR "Cathedrals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on buildings, as well as the associated grounds.")
(BT "Churches")
(RT "Anglican churches")
(RT "Catholic churches")
(RT "Flying buttresses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001778")
(TNR "tgm001782"))


(CONCEPT
(DESCRIPTOR "Catholic churches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on buildings, as well as the associated grounds.")
(BT "Churches")
(RT "Cathedrals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001779")
(TNR "tgm001783"))


(CONCEPT
(DESCRIPTOR "Catholicism")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Christianity")
(RT "Anti-Catholicism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001780")
(TNR "tgm001784"))


(CONCEPT
(DESCRIPTOR "Cats")
(GEO-FACET ":COUNTRY :STATE")
(UF "Kittens")
(BT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001781")
(TNR "tgm001785"))


(CONCEPT
(NON-DESCRIPTOR "Cat's tails")
(USE "Cat tails (Plant)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001782")
(TNR "tgm001786"))


(CONCEPT
(NON-DESCRIPTOR "Catstep gables")
(USE "Crow-stepped gables")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001783")
(TNR "tgm001787"))


(CONCEPT
(DESCRIPTOR "Cattle")
(GEO-FACET ":COUNTRY :STATE")
(SN "Includes domesticated calves, heifers, and steers. Also includes mixed groups of cattle and cows and bulls, if their sex cannot be determined.")
(UF "Bullocks")
(UF "Calves")
(UF "Heifers")
(UF "Steers")
(BT "Livestock")
(NT "Beef cattle")
(NT "Bulls")
(NT "Cows")
(NT "Dairy cattle")
(NT "Oxen")
(RT "Bison")
(RT "Buffaloes")
(RT "Cattle branding")
(RT "Cattle brands")
(RT "Cattle breeders")
(RT "Cattle herding")
(RT "Cattle raids")
(RT "Cattle ranches")
(RT "Corrals")
(RT "Dairy farming")
(RT "Dairying")
(RT "Rodeos")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001784")
(TNR "tgm001788"))


(CONCEPT
(DESCRIPTOR "Cattle branding")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Branding of cattle")
(BT "Animal husbandry")
(RT "Cattle")
(RT "Cattle brands")
(RT "Cowboys")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001785")
(TNR "tgm001789"))


(CONCEPT
(DESCRIPTOR "Cattle brands")
(UF "Brands")
(BT "Equipment")
(RT "Cattle")
(RT "Cattle branding")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001786")
(TNR "tgm001790"))


(CONCEPT
(DESCRIPTOR "Cattle breeders")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with agriculture")
(RT "Animal breeding")
(RT "Cattle")
(RT "Cattle ranches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001787")
(TNR "tgm001791"))


(CONCEPT
(DESCRIPTOR "Cattle herders")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cowherds")
(BT "Herders")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012151"))


(CONCEPT
(DESCRIPTOR "Cattle herding")
(GEO-FACET ":COUNTRY :STATE")
(UF "Round-ups")
(BT "Herding")
(RT "Cattle")
(RT "Cowboys")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001788")
(TNR "tgm001792"))


(CONCEPT
(NON-DESCRIPTOR "Cattle markets")
(USE "Meat industry")
(USE "Stockyards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001789")
(TNR "tgm001793"))


(CONCEPT
(NON-DESCRIPTOR "Cattle pens")
(USE "Stockyards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001790")
(TNR "tgm001794"))


(CONCEPT
(DESCRIPTOR "Cattle raids")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Crimes")
(RT "Cattle")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001791")
(TNR "tgm001795"))


(CONCEPT
(DESCRIPTOR "Cattle ranches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Ranches")
(RT "Cattle")
(RT "Cattle breeders")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001792")
(TNR "tgm001796"))


(CONCEPT
(NON-DESCRIPTOR "Cattle, Beef")
(USE "Beef cattle")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001793")
(TNR "tgm001797"))


(CONCEPT
(DESCRIPTOR "Cauldrons")
(SN "Large, open vessel sometimes used over a fire.")
(BT "Cooking utensils")
(RT "Kettles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001794")
(TNR "tgm001798"))


(CONCEPT
(DESCRIPTOR "Cauliflower")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vegetables")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001795")
(TNR "tgm001799"))


(CONCEPT
(DESCRIPTOR "Causes")
(CN "Used only as a subdivision with :NAMES-OF :NAME-OF-WAR [Appendix C].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm001796")
(TNR "tgm001800"))


(CONCEPT
(DESCRIPTOR "Causeways")
(GEO-FACET ":COUNTRY :STATE")
(SN "Raised ways across wet ground or water.")
(BT "Roads")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001797")
(TNR "tgm001801"))


(CONCEPT
(DESCRIPTOR "Cavalry")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Dragoons")
(BT "Armies")
(RT "Horse artillery")
(RT "Horses")
(RT "Lancers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001798")
(TNR "tgm001802"))


(CONCEPT
(DESCRIPTOR "Cave churches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on structures, as well as the associated grounds.")
(BT "Churches")
(RT "Caves")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001799")
(TNR "tgm001803"))


(CONCEPT
(DESCRIPTOR "Cave drawings")
(GEO-FACET ":COUNTRY :STATE")
(UF "Pictographs")
(BT "Art objects")
(RT "Caves")
(RT "Murals")
(RT "Rock art")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001800")
(TNR "tgm001804"))


(CONCEPT
(DESCRIPTOR "Cave dwellers")
(GEO-FACET ":COUNTRY :STATE")
(UF "Cavemen")
(UF "Troglodytes")
(BT "People")
(RT "Cave dwellings")
(RT "Caves")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001801")
(TNR "tgm001805"))


(CONCEPT
(DESCRIPTOR "Cave dwellings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Dwellings")
(RT "Cave dwellers")
(RT "Caves")
(RT "Rock-cut architecture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001802")
(TNR "tgm001806"))


(CONCEPT
(NON-DESCRIPTOR "Cavemen")
(USE "Cave dwellers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001803")
(TNR "tgm001807"))


(CONCEPT
(NON-DESCRIPTOR "Caverns")
(USE "Caves")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001804")
(TNR "tgm001808"))


(CONCEPT
(DESCRIPTOR "Caves")
(GEO-FACET ":COUNTRY :STATE")
(SN "Includes the activity of exploring caves.")
(UF "Caverns")
(UF "Caving")
(UF "Grottoes")
(UF "Spelunking")
(BT "Land")
(RT "Cave churches")
(RT "Cave drawings")
(RT "Cave dwellers")
(RT "Cave dwellings")
(RT "Rock formations")
(RT "Stalactites & stalagmites")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001805")
(TNR "tgm001809"))


(CONCEPT
(DESCRIPTOR "Caviar")
(BT "Seafood")
(RT "Eggs")
(RT "Fish")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001806")
(TNR "tgm001810"))


(CONCEPT
(NON-DESCRIPTOR "Caving")
(USE "Caves")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001807")
(TNR "tgm001811"))


(CONCEPT
(NON-DESCRIPTOR "Cavities")
(USE "Holes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001808")
(TNR "tgm001812"))


(CONCEPT
(NON-DESCRIPTOR "Ceasefires")
(USE "Armistices")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001809")
(TNR "tgm001813"))


(CONCEPT
(DESCRIPTOR "Cedar trees")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001810")
(TNR "tgm001814"))


(CONCEPT
(DESCRIPTOR "Ceibas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Silk-cotton trees")
(BT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001811")
(TNR "tgm001815"))


(CONCEPT
(DESCRIPTOR "Ceilings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Architectural elements")
(NT "Barrel ceilings")
(NT "Suspended ceilings")
(RT "Coffers (Ceilings)")
(RT "Paneling")
(RT "Vaults (Architecture)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001812")
(TNR "tgm001816"))


(CONCEPT
(DESCRIPTOR "Celebrations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes festivities associated with major events and holidays, as well as smaller festivities such as birthday parties. :SEARCH-SUBDIVISION --COMMEMORATION :USED-WITH the :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP, and :CLASSES-OF-PERSONS [Appendix A]; with :NAMES-OF :NAMED-PERSON [Appendix B]; with :NAMES-OF :NAME-OF-WAR [Appendix C]; :USED-WITH :CORPORATE-BODY :NAMED-EVENT [Appendix D].")
(BT "Events")
(NT "Carnival")
(NT "Centennial celebrations")
(NT "Fourth of July celebrations")
(NT "Political pageantry")
(NT "Victory celebrations")
(RT "Anniversaries")
(RT "Commemorations")
(RT "Fairs")
(RT "Festivals")
(RT "Holidays")
(RT "Pageants")
(RT "Parades & processions")
(RT "Parties")
(RT "Reunions")
(RT "Rites & ceremonies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001813")
(TNR "tgm001817"))


(CONCEPT
(DESCRIPTOR "Celebrities")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Search also under types of celebrities, e.g. Actors, Musicians, Writers, etc.")
(UF "Famous people")
(UF "Prominent people")
(BT "People")
(RT "Autographing")
(RT "Celebrity touring")
(RT "Entertainers")
(RT "Fame")
(RT "Socialites")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001814")
(TNR "tgm001818"))


(CONCEPT
(NON-DESCRIPTOR "Celebrity")
(USE "Fame")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001815")
(TNR "tgm001819"))


(CONCEPT
(DESCRIPTOR "Celebrity touring")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For performance or publicity tours by celebrities. :SEARCH-SUBDIVISION --JOURNEYS :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B].")
(UF "Publicity tours")
(UF "Touring, Celebrity")
(BT "Travel")
(RT "Autographing")
(RT "Celebrities")
(RT "Whistle-stop campaigning")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001816")
(TNR "tgm001820"))


(CONCEPT
(DESCRIPTOR "Celery")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vegetables")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001817")
(TNR "tgm001821"))


(CONCEPT
(DESCRIPTOR "Celestial bodies")
(BT "Natural phenomena")
(NT "Comets")
(NT "Constellations")
(NT "Galaxies")
(NT "Moon")
(NT "Planets")
(NT "Stars")
(NT "Sun")
(RT "Astrology")
(RT "Astronomy")
(RT "Zodiac")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001818")
(TNR "tgm001822"))


(CONCEPT
(NON-DESCRIPTOR "Cell phones")
(USE "Cellular telephones")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001819")
(TNR "tgm001823"))


(CONCEPT
(NON-DESCRIPTOR "Cellars")
(USE "Basements")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001820")
(TNR "tgm001824"))


(CONCEPT
(DESCRIPTOR "Cellocuts")
(SN "Prints made from blocks on which the surface has been built up with liquid plastics. May be printed in intaglio or relief. They look much like linocuts.")
(BT "Prints")
(RT "Intaglio prints")
(RT "Relief prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000175")
(FCNlctgm "lctgm001821")
(TNR "tgm001825"))


(CONCEPT
(NON-DESCRIPTOR "Cellos")
(USE "Violoncellos")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001822")
(TNR "tgm001826"))


(CONCEPT
(DESCRIPTOR "Cells (Biology)")
(BT "Microorganisms")
(NT "Spermatozoa")
(RT "Body parts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001823")
(TNR "tgm001827"))


(CONCEPT
(DESCRIPTOR "Cells (Rooms)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Single room for one person within a building such as a monastery, hermitage, convent, or prison.")
(BT "Rooms & spaces")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001824")
(TNR "tgm001828"))


(CONCEPT
(DESCRIPTOR "Cellular telephones")
(UF "Cell phones")
(UF "Mobile phones")
(BT "Communication devices")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001825")
(TNR "tgm001829"))


(CONCEPT
(NON-DESCRIPTOR "Celluloid industry")
(USE "Plastics industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001826")
(TNR "tgm001830"))


(CONCEPT
(NON-DESCRIPTOR "Cellulose acetate negatives")
(USE "Acetate negatives")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000176")
(FCNlctgm "lctgm001827")
(TNR "tgm001831"))


(CONCEPT
(NON-DESCRIPTOR "Cellulose diacetate negatives")
(USE "Acetate negatives")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000177")
(FCNlctgm "lctgm001828")
(TNR "tgm001832"))


(CONCEPT
(NON-DESCRIPTOR "Cellulose nitrate negatives")
(USE "Nitrate negatives")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000178")
(FCNlctgm "lctgm001829")
(TNR "tgm001833"))


(CONCEPT
(NON-DESCRIPTOR "Cellulose triacetate negatives")
(USE "Acetate negatives")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000179")
(FCNlctgm "lctgm001830")
(TNR "tgm001834"))


(CONCEPT
(NON-DESCRIPTOR "Cels, Animation")
(USE "Animation cels")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000180")
(FCNlctgm "lctgm001831")
(TNR "tgm001835"))


(CONCEPT
(NON-DESCRIPTOR "Cembalos")
(USE "Harpsichords")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001832")
(TNR "tgm001836"))


(CONCEPT
(DESCRIPTOR "Cement industries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Building materials industry")
(BT "Ceramic industries")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001833")
(TNR "tgm001837"))


(CONCEPT
(NON-DESCRIPTOR "Cement mixers")
(USE "Concrete mixers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001834")
(TNR "tgm001838"))


(CONCEPT
(DESCRIPTOR "Cemeteries")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --CEMETERIES :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(UF "Graveyards")
(BT "Funerary facilities")
(NT "Catacombs")
(RT "Gravedigging")
(RT "Graves")
(RT "Tombs & sepulchral monuments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001835")
(TNR "tgm001839"))


(CONCEPT
(DESCRIPTOR "Censers")
(BT "Religious articles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001836")
(TNR "tgm001840"))


(CONCEPT
(DESCRIPTOR "Censored works")
(SN "Materials altered or prohibited because they are considered unsuitable for the general public.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000181")
(FCNlctgm "lctgm001837")
(TNR "tgm001841"))


(CONCEPT
(DESCRIPTOR "Censorship")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --COMMUNICATIONS :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(UF "Intellectual freedom")
(BT "Communication")
(NT "Book burning")
(RT "Freedom of information")
(RT "Freedom of speech")
(RT "National security")
(RT "Politics & government")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001838")
(TNR "tgm001842"))


(CONCEPT
(NON-DESCRIPTOR "Censuring")
(USE "Blaming")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001839")
(TNR "tgm001843"))


(CONCEPT
(DESCRIPTOR "Census")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Population surveys")
(BT "Demography")
(RT "Apportionment")
(RT "Surveying")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001840")
(TNR "tgm001844"))


(CONCEPT
(DESCRIPTOR "Centaurs")
(BT "Supernatural beings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001841")
(TNR "tgm001845"))


(CONCEPT
(DESCRIPTOR "Centenarians")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Older people")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001842")
(TNR "tgm001846"))


(CONCEPT
(DESCRIPTOR "Centennial celebrations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bicentennials")
(UF "Tercentennials")
(UF "Tricentennials")
(BT "Celebrations")
(RT "Exhibitions")
(RT "History")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001843")
(TNR "tgm001847"))


(CONCEPT
(NON-DESCRIPTOR "Centers, Visitors'")
(USE "Visitors' centers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001844")
(TNR "tgm001848"))


(CONCEPT
(NON-DESCRIPTOR "Central business districts")
(USE "Business districts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001845")
(TNR "tgm001849"))


(CONCEPT
(DESCRIPTOR "Centrists")
(SN "Member of a center or moderate party.")
(BT "People associated with politics & government")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001846")
(TNR "tgm001850"))


(CONCEPT
(NON-DESCRIPTOR "Century plants")
(USE "Agaves")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001847")
(TNR "tgm001851"))


(CONCEPT
(DESCRIPTOR "Ceramic industries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(NT "Cement industries")
(NT "Clay industries")
(NT "Glass industry")
(RT "Building materials industry")
(RT "Pottery industry")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001848")
(TNR "tgm001852"))


(CONCEPT
(DESCRIPTOR "Ceramic photographs")
(SN "Photographs produced by any of a variety of processes on a porcelain, earthenware, or other ceramic support.")
(UF "Photoceramics")
(UF "Porcelain photographs")
(BT "Photographic prints")
(RT "Opalotypes")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000182")
(FCNlctgm "lctgm001849")
(TNR "tgm001853"))


(CONCEPT
(NON-DESCRIPTOR "Ceramicists")
(USE "Potters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001850")
(TNR "tgm001854"))


(CONCEPT
(NON-DESCRIPTOR "Ceramics")
(USE "Pottery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001851")
(TNR "tgm001855"))


(CONCEPT
(DESCRIPTOR "Cereal products")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Food")
(NT "Prepared cereals")
(RT "Grain industry")
(RT "Grains")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001852")
(TNR "tgm001856"))


(CONCEPT
(DESCRIPTOR "Cerebral palsy")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Diseases")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012131"))


(CONCEPT
(DESCRIPTOR "Ceremonial dancers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --DANCE :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP, and :CLASSES-OF-PERSONS [Appendix A].")
(UF "Tribal dancers")
(BT "Dancers")
(BT "People associated with religion")
(RT "Rites & ceremonies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001853")
(TNR "tgm001857"))


(CONCEPT
(DESCRIPTOR "Ceremonial maces")
(BT "Staffs (Sticks)")
(BT "Symbols")
(RT "Power (Social sciences)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001854")
(TNR "tgm001858"))


(CONCEPT
(DESCRIPTOR "Ceremonial objects")
(BT "Objects")
(NT "May poles")
(NT "Religious articles")
(NT "Sandpaintings")
(NT "Scepters")
(RT "Rites & ceremonies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001855")
(TNR "tgm001859"))


(CONCEPT
(DESCRIPTOR "Ceremonial rooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Interiors")
(NT "Reception rooms")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001856")
(TNR "tgm001860"))


(CONCEPT
(NON-DESCRIPTOR "Ceremonial-civic buildings")
(USE "Social & civic facilities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001857")
(TNR "tgm001861"))


(CONCEPT
(NON-DESCRIPTOR "Ceremonies")
(USE "Rites & ceremonies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001858")
(TNR "tgm001862"))


(CONCEPT
(DESCRIPTOR "Cerographs")
(SN "Relief prints from a line block produced by cerography, a wax-engraving technique used to create an electrotyped plate with raised surface that is attached to a printing block.")
(UF "Glyphographs")
(UF "Wax engravings")
(BT "Relief prints")
(FUN "Formerly TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(FCNGMGPC "gmgpc001195")
(TNR "tgm001863"))


(CONCEPT
(DESCRIPTOR "Certificates")
(SN "Documents containing certified statements of, for example, ownership, membership, fulfilled requirements, or legal status.")
(BT "Ephemera")
(NT "Baptismal certificates")
(NT "Birth certificates")
(NT "Bonds (Negotiable instruments)")
(NT "Death certificates")
(NT "Diplomas")
(NT "Insurance certificates")
(NT "Marriage certificates")
(NT "Membership certificates")
(NT "Stock certificates")
(RT "Bank note vignettes")
(RT "Frakturs (Illumination)")
(RT "Rewards of merit")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000183")
(FCNlctgm "lctgm001859")
(TNR "tgm001864"))


(CONCEPT
(NON-DESCRIPTOR "Cession of territory")
(USE "Annexations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001860")
(TNR "tgm001865"))


(CONCEPT
(NON-DESCRIPTOR "Chadoufs")
(USE "Shadoofs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001861")
(TNR "tgm001866"))


(CONCEPT
(DESCRIPTOR "Chafing dishes")
(BT "Tableware")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001862")
(TNR "tgm001867"))


(CONCEPT
(DESCRIPTOR "Chain gangs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Prison laborers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001863")
(TNR "tgm001868"))


(CONCEPT
(NON-DESCRIPTOR "Chain stores")
(USE "Stores & shops")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001864")
(TNR "tgm001869"))


(CONCEPT
(DESCRIPTOR "Chains")
(BT "Equipment")
(RT "Hoisting machinery")
(RT "Shackles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001865")
(TNR "tgm001870"))


(CONCEPT
(NON-DESCRIPTOR "Chains (Shackles)")
(USE "Shackles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001866")
(TNR "tgm001871"))


(CONCEPT
(DESCRIPTOR "Chair rails")
(SN "Horizontal wood strips on plaster walls which prevent chair backs from harming the wall.")
(BT "Architectural elements")
(RT "Walls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001867")
(TNR "tgm001872"))


(CONCEPT
(DESCRIPTOR "Chairs")
(BT "Seating furniture")
(NT "Captain's chairs")
(NT "Folding chairs")
(NT "Hardoy chairs")
(NT "Lounge chairs")
(NT "Rocking chairs")
(NT "Stools")
(NT "Thrones")
(RT "Sedan chairs")
(RT "Wheelchairs")
(RT "Wheeled chairs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001868")
(TNR "tgm001873"))


(CONCEPT
(DESCRIPTOR "Chalets")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "A timber house often found in the Alps, distinguished by the exposed and decorative use of structural members, balconies, and stairs.  Upper floors usually project beyond the stories below.")
(BT "Houses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001869")
(TNR "tgm001874"))


(CONCEPT
(DESCRIPTOR "Chalices")
(UF "Communion-cups")
(BT "Drinking vessels")
(RT "Religious articles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001870")
(TNR "tgm001875"))


(CONCEPT
(DESCRIPTOR "Chalk drawings")
(BT "Drawings")
(NT "A trois crayons drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000184")
(FCNlctgm "lctgm001871")
(TNR "tgm001876"))


(CONCEPT
(NON-DESCRIPTOR "Chalkboards")
(USE "Blackboards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001872")
(TNR "tgm001877"))


(CONCEPT
(DESCRIPTOR "Chamber pots")
(UF "Jordans")
(BT "Containers")
(RT "Furnishings")
(RT "Hygiene")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001873")
(TNR "tgm001878"))


(CONCEPT
(DESCRIPTOR "Chambers of commerce")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Associations of businessmen who promote commercial and industrial interests in the community. Includes activities and structures.")
(BT "Commercial organizations")
(RT "Boards of trade")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001874")
(TNR "tgm001879"))


(CONCEPT
(DESCRIPTOR "Champagne (Wine)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Wine")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001875")
(TNR "tgm001880"))


(CONCEPT
(DESCRIPTOR "Chancels")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Area of a church consisting of an altar and seats reserved for clergy and choir.")
(BT "Rooms & spaces")
(RT "Churches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001876")
(TNR "tgm001881"))


(CONCEPT
(NON-DESCRIPTOR "Chanceries")
(USE "Embassies")
(USE "Judicial proceedings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001877")
(TNR "tgm001882"))


(CONCEPT
(DESCRIPTOR "Chandeliers")
(BT "Light fixtures")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001878")
(TNR "tgm001883"))


(CONCEPT
(NON-DESCRIPTOR "Change purses")
(USE "Purses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001879")
(TNR "tgm001884"))


(CONCEPT
(NON-DESCRIPTOR "Changing rooms")
(USE "Locker rooms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001880")
(TNR "tgm001885"))


(CONCEPT
(DESCRIPTOR "Channels")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "River channels")
(UF "Sounds (Geomorphology)")
(UF "Straits")
(BT "Bodies of water")
(RT "Moats")
(RT "Streams")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001881")
(TNR "tgm001886"))


(CONCEPT
(NON-DESCRIPTOR "Chaparajos")
(USE "Chaps")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001882")
(TNR "tgm001887"))


(CONCEPT
(DESCRIPTOR "Chapels")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For chapels within churches or other buildings or for small, separate houses of worship sometimes associated with a church.")
(UF "Oratories")
(BT "Interiors")
(RT "Churches")
(HN "Usage note altered 11/2000. In earlier cataloging CHAPELS was used only for chapels within churches or other buildings.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001883")
(TNR "tgm001888"))


(CONCEPT
(DESCRIPTOR "Chaplains")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Clergy who are officially attached to the Armed Forces, legislative bodies, institutions, courts, etc.")
(BT "Clergy")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001884")
(TNR "tgm001889"))


(CONCEPT
(DESCRIPTOR "Chaps")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Leather leg coverings held together at the top by a belt or lacings, worn over trousers when horseback riding.")
(UF "Chaparajos")
(BT "Clothing & dress")
(RT "Cowboys")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001885")
(TNR "tgm001890"))


(CONCEPT
(NON-DESCRIPTOR "Characters, Fictitious")
(USE "Fictitious characters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001886")
(TNR "tgm001891"))


(CONCEPT
(DESCRIPTOR "Charcoal")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fuel")
(RT "Charcoal making")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001887")
(TNR "tgm001892"))


(CONCEPT
(DESCRIPTOR "Charcoal drawings")
(BT "Drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000185")
(FCNlctgm "lctgm001888")
(TNR "tgm001893"))


(CONCEPT
(DESCRIPTOR "Charcoal making")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "The activity of making charcoal in small-scale operations.")
(BT "Processes & techniques")
(RT "Charcoal")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001889")
(TNR "tgm001894"))


(CONCEPT
(NON-DESCRIPTOR "Charge cards")
(USE "Credit cards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001890")
(TNR "tgm001895"))


(CONCEPT
(DESCRIPTOR "Chariot racing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Horse racing")
(RT "Chariots")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001891")
(TNR "tgm001896"))


(CONCEPT
(DESCRIPTOR "Chariots")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vehicles")
(RT "Carriages & coaches")
(RT "Chariot racing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001892")
(TNR "tgm001897"))


(CONCEPT
(NON-DESCRIPTOR "Charitable institutions")
(USE "Asylums")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001893")
(TNR "tgm001898"))


(CONCEPT
(DESCRIPTOR "Charitable organizations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Charities")
(BT "Organizations")
(RT "Assistance")
(RT "Asylums")
(RT "Charity")
(RT "Clubs")
(RT "Community service")
(RT "Fraternal organizations")
(RT "Philanthropy")
(RT "Public service")
(RT "Thrift shops")
(CN ":DOUBLE-INDEX ORGANIZATIONS'  FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001894")
(TNR "tgm001899"))


(CONCEPT
(NON-DESCRIPTOR "Charitable work")
(USE "Community service")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001895")
(TNR "tgm001900"))


(CONCEPT
(NON-DESCRIPTOR "Charities")
(USE "Charitable organizations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001896")
(TNR "tgm001901"))


(CONCEPT
(DESCRIPTOR "Charity")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Alms")
(UF "Almsgiving")
(UF "Benevolence")
(BT "Interpersonal relations")
(RT "Assistance")
(RT "Charitable organizations")
(RT "Community service")
(RT "Ethics")
(RT "Philanthropy")
(RT "Poor boxes")
(RT "Poor persons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001897")
(TNR "tgm001902"))


(CONCEPT
(NON-DESCRIPTOR "Charlatans")
(USE "Quacks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001898")
(TNR "tgm001903"))


(CONCEPT
(DESCRIPTOR "Charleston (Dance)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Dance")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001899")
(TNR "tgm001904"))


(CONCEPT
(NON-DESCRIPTOR "Charms")
(USE "Amulets")
(USE "Talismans")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001900")
(TNR "tgm001905"))


(CONCEPT
(DESCRIPTOR "Charters")
(SN "Instruments in writing, creating and defining the franchises of a city, educational institution, or corporation.")
(BT "Documents")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc001194")
(FCNlctgm "lctgm001901")
(TNR "tgm001906"))


(CONCEPT
(DESCRIPTOR "Charts")
(SN "Delineations of information in tabular form.")
(BT "Diagrams")
(NT "Calendars")
(NT "Family trees")
(NT "Schedules (Architectural records)")
(NT "Schedules (Time plans)")
(NT "Seating charts")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000186")
(FCNlctgm "lctgm001902")
(TNR "tgm001907"))


(CONCEPT
(DESCRIPTOR "Chasing")
(UF "Pursuing")
(BT "Locomotion")
(RT "Running")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001903")
(TNR "tgm001908"))


(CONCEPT
(NON-DESCRIPTOR "Chasms")
(USE "Canyons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001904")
(TNR "tgm001909"))


(CONCEPT
(DESCRIPTOR "Chastity belts")
(UF "Girdles of chastity")
(BT "Clothing & dress")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001905")
(TNR "tgm001910"))


(CONCEPT
(NON-DESCRIPTOR "Chateaux")
(USE "Castles & palaces")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001906")
(TNR "tgm001911"))


(CONCEPT
(DESCRIPTOR "Chauffeurs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with transportation")
(RT "Automobiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001907")
(TNR "tgm001912"))


(CONCEPT
(DESCRIPTOR "Chautauquas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities, structures, and sites.")
(BT "Adult education")
(RT "Education")
(RT "Entertainment")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001908")
(TNR "tgm001913"))


(CONCEPT
(NON-DESCRIPTOR "Chauvinism, Male")
(USE "Sexism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001909")
(TNR "tgm001914"))


(CONCEPT
(DESCRIPTOR "Checkers")
(BT "Board games")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001910")
(TNR "tgm001915"))


(CONCEPT
(NON-DESCRIPTOR "Checkpoints")
(USE "Security checkpoints")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001911")
(TNR "tgm001916"))


(CONCEPT
(DESCRIPTOR "Checks")
(UF "Bank checks")
(BT "Ephemera")
(RT "Money")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001912")
(TNR "tgm001917"))


(CONCEPT
(NON-DESCRIPTOR "Cheer leading")
(USE "Cheerleading")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001913")
(TNR "tgm001918"))


(CONCEPT
(DESCRIPTOR "Cheering")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Communication")
(RT "Cheerleading")
(RT "Excitement")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001914")
(TNR "tgm001919"))


(CONCEPT
(NON-DESCRIPTOR "Cheerleaders")
(USE "Cheerleading")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001915")
(TNR "tgm001920"))


(CONCEPT
(DESCRIPTOR "Cheerleading")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cheer leading")
(UF "Cheerleaders")
(BT "Sports")
(RT "Cheering")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001916")
(TNR "tgm001921"))


(CONCEPT
(DESCRIPTOR "Cheese")
(BT "Dairy products")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001917")
(TNR "tgm001922"))


(CONCEPT
(NON-DESCRIPTOR "Cheesecake photographs")
(USE "Glamour photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000187")
(FCNlctgm "lctgm001918")
(TNR "tgm001923"))


(CONCEPT
(DESCRIPTOR "Cheetahs")
(GEO-FACET ":COUNTRY :STATE")
(UF "Chittahs")
(BT "Animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001919")
(TNR "tgm001924"))


(CONCEPT
(NON-DESCRIPTOR "Chefs")
(USE "Cooks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001920")
(TNR "tgm001925"))


(CONCEPT
(NON-DESCRIPTOR "Chemical abuse")
(USE "Drug abuse")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001921")
(TNR "tgm001926"))


(CONCEPT
(DESCRIPTOR "Chemical industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes and activities and structures.")
(BT "Industry")
(NT "Artificial rubber industry")
(NT "Fertilizer industry")
(NT "Paint industry")
(NT "Pharmaceutical industry")
(NT "Phosphate industry")
(NT "Soda industry")
(NT "Sulphur industry")
(NT "Sulphuric acid industry")
(NT "Turpentine industry")
(RT "Assaying")
(RT "Chemicals")
(RT "Funnels")
(RT "Gums & resins")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001922")
(TNR "tgm001927"))


(CONCEPT
(DESCRIPTOR "Chemicals")
(BT "Objects")
(NT "Hormones")
(NT "Metals")
(NT "Minerals")
(NT "Nitrates")
(NT "Poisons")
(NT "Tear gas")
(NT "Vitamins")
(RT "Chemical industry")
(RT "Chemistry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001923")
(TNR "tgm001928"))


(CONCEPT
(DESCRIPTOR "Chemistry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of chemistry in general and the activities of chemists.")
(BT "Science")
(NT "Alchemy")
(RT "Chemicals")
(RT "Chemists")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001924")
(TNR "tgm001929"))


(CONCEPT
(DESCRIPTOR "Chemists")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Scientists")
(RT "Chemistry")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012130"))


(CONCEPT
(DESCRIPTOR "Cherries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fruit")
(RT "Cherry orchards")
(RT "Cherry trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001925")
(TNR "tgm001930"))


(CONCEPT
(DESCRIPTOR "Cherry orchards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Orchards")
(RT "Cherries")
(RT "Cherry trees")
(CN ":DOUBLE-INDEX HARVESTING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001926")
(TNR "tgm001931"))


(CONCEPT
(DESCRIPTOR "Cherry trees")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Japanese flowering cherry trees")
(BT "Fruit trees")
(RT "Cherries")
(RT "Cherry orchards")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001927")
(TNR "tgm001932"))


(CONCEPT
(NON-DESCRIPTOR "Cherubim")
(USE "Angels")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001928")
(TNR "tgm001933"))


(CONCEPT
(NON-DESCRIPTOR "Cherubs")
(USE "Putti")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012118"))


(CONCEPT
(DESCRIPTOR "Chess")
(BT "Board games")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001929")
(TNR "tgm001934"))


(CONCEPT
(DESCRIPTOR "Chestnuts")
(BT "Nuts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001930")
(TNR "tgm001935"))


(CONCEPT
(DESCRIPTOR "Chests")
(BT "Furniture")
(NT "Clothes chests")
(NT "Treasure chests")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001931")
(TNR "tgm001936"))


(CONCEPT
(NON-DESCRIPTOR "Cheval-de-frise")
(USE "Chevaux-de-frise")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001932")
(TNR "tgm001937"))


(CONCEPT
(DESCRIPTOR "Chevaux-de-frise")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Defensive obstacle composed of spikes or barbed wire attached to a wooden frame.")
(UF "Cheval-de-frise")
(BT "Barricades")
(RT "Arms & armament")
(RT "Trench warfare")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001933")
(TNR "tgm001938"))


(CONCEPT
(DESCRIPTOR "Chewing gum")
(UF "Gum, Chewing")
(BT "Confections")
(RT "Candy")
(RT "Chewing gum industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001934")
(TNR "tgm001939"))


(CONCEPT
(DESCRIPTOR "Chewing gum industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Food industry")
(RT "Chewing gum")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001935")
(TNR "tgm001940"))


(CONCEPT
(NON-DESCRIPTOR "Chewing tobacco")
(USE "Smokeless tobacco")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001936")
(TNR "tgm001941"))


(CONCEPT
(DESCRIPTOR "Chiaroscuro woodcuts")
(SN "Woodcuts printed from two or more blocks, one of which is usually cut to print the design in black and the others to print neutral or background colors to show differences in value. Technique developed in Europe in the 1500s; often used to reproduce drawings and paintings.")
(BT "Woodcuts")
(RT "Reproductive prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000188")
(FCNlctgm "lctgm001937")
(TNR "tgm001942"))


(CONCEPT
(DESCRIPTOR "Chickadees")
(GEO-FACET ":COUNTRY :STATE")
(BT "Birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001938")
(TNR "tgm001943"))


(CONCEPT
(NON-DESCRIPTOR "Chicken coops")
(USE "Poultry houses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001939")
(TNR "tgm001944"))


(CONCEPT
(NON-DESCRIPTOR "Chicken houses")
(USE "Poultry houses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001940")
(TNR "tgm001945"))


(CONCEPT
(DESCRIPTOR "Chicken industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Poultry industry")
(RT "Chickens")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001941")
(TNR "tgm001946"))


(CONCEPT
(DESCRIPTOR "Chickens")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Chicks")
(BT "Poultry")
(NT "Roosters")
(RT "Chicken industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001942")
(TNR "tgm001947"))


(CONCEPT
(NON-DESCRIPTOR "Chicks")
(USE "Birds")
(USE "Chickens")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001943")
(TNR "tgm001948"))


(CONCEPT
(NON-DESCRIPTOR "Chief justices")
(USE "Supreme Court justices")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001944")
(TNR "tgm001949"))


(CONCEPT
(NON-DESCRIPTOR "Chiefs, Tribal")
(USE "Tribal chiefs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001945")
(TNR "tgm001950"))


(CONCEPT
(NON-DESCRIPTOR "Child abuse victims")
(USE "Abused children")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001946")
(TNR "tgm001951"))


(CONCEPT
(DESCRIPTOR "Child actors")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Actors")
(BT "Children")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001947")
(TNR "tgm001952"))


(CONCEPT
(DESCRIPTOR "Child behavior")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Behavior of children")
(UF "Children misbehaving")
(BT "Behavior")
(RT "Child discipline")
(RT "Child rearing")
(RT "Children")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001948")
(TNR "tgm001953"))


(CONCEPT
(NON-DESCRIPTOR "Child care")
(USE "Day care")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001949")
(TNR "tgm001954"))


(CONCEPT
(NON-DESCRIPTOR "Child custody")
(USE "Custody of children")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001950")
(TNR "tgm001955"))


(CONCEPT
(DESCRIPTOR "Child discipline")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Disciplinary action")
(UF "Disciplining children")
(UF "Punishment of children")
(BT "Teaching")
(NT "School discipline")
(RT "Child behavior")
(RT "Child rearing")
(RT "Children")
(RT "Punishment & torture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001951")
(TNR "tgm001956"))


(CONCEPT
(DESCRIPTOR "Child labor")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images about or depicting child labor.")
(BT "Employment")
(RT "Apprentices")
(RT "Child laborers")
(HN "Changed 3/1989 from non-postable term (use CHILDREN-- WORK).")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001952")
(TNR "tgm001957"))


(CONCEPT
(DESCRIPTOR "Child laborers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Children")
(BT "Laborers")
(RT "Child labor")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001953")
(TNR "tgm001958"))


(CONCEPT
(DESCRIPTOR "Child marriage")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Marriage")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012048"))


(CONCEPT
(NON-DESCRIPTOR "Child prodigies")
(USE "Gifted children")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001954")
(TNR "tgm001959"))


(CONCEPT
(DESCRIPTOR "Child prostitution")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Prostitution")
(RT "Abused children")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001955")
(TNR "tgm001960"))


(CONCEPT
(NON-DESCRIPTOR "Child raising")
(USE "Child rearing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001956")
(TNR "tgm001961"))


(CONCEPT
(DESCRIPTOR "Child rearing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Images related to the principles and techniques of raising children.")
(UF "Child raising")
(UF "Raising of children")
(UF "Rearing of children")
(BT "Activities")
(RT "Child behavior")
(RT "Child discipline")
(RT "Children's allowances")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001957")
(TNR "tgm001962"))


(CONCEPT
(DESCRIPTOR "Child trafficking")
(UF "Trafficking in children")
(BT "Commerce")
(BT "Crimes")
(RT "Abused children")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001958")
(TNR "tgm001963"))


(CONCEPT
(NON-DESCRIPTOR "Childbirth")
(USE "Births")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001959")
(TNR "tgm001964"))


(CONCEPT
(DESCRIPTOR "Childhood & youth")
(CN "Used only as a subdivision with :NAMES-OF :NAMED-PERSON [Appendix B].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm001960")
(TNR "tgm001965"))


(CONCEPT
(DESCRIPTOR "Children")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes ages 0-16. This heading may be further :SUBDIVIDE-BY the subdivisions used for :CLASSES-OF-PERSONS [Appendix A]. :SEARCH-SUBDIVISION --CHILDREN :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP [Appendix A] :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C]. Search also under other headings beginning with CHILDREN.")
(UF "Fathers & children")
(BT "People")
(NT "Abandoned children")
(NT "Abused children")
(NT "Acolytes")
(NT "Boys")
(NT "Capitol pages")
(NT "Child actors")
(NT "Child laborers")
(NT "Children playing adults")
(NT "Choirboys")
(NT "Delivery boys")
(NT "Gifted children")
(NT "Girls")
(NT "Infants")
(NT "Juvenile delinquents")
(NT "Mentally handicapped children")
(NT "Mentally ill children")
(NT "Newspaper carriers")
(NT "Orphans")
(NT "Pin boys")
(NT "Runaway children")
(NT "School children")
(NT "Sick children")
(NT "Street children")
(NT "Unsupervised children")
(RT "4-H clubs")
(RT "Adoption")
(RT "Apprentices")
(RT "Au pairs")
(RT "Babysitting")
(RT "Bottle feeding")
(RT "Child behavior")
(RT "Child discipline")
(RT "Children's museums")
(RT "Children's theater")
(RT "Cupids")
(RT "Day care")
(RT "Foster home care")
(RT "Gangs")
(RT "Governesses")
(RT "Nurseries")
(RT "Schools")
(RT "Teenage pregnancy")
(RT "Television programs for children")
(RT "Young adults")
(RT "Youth")
(RT "Youth bands")
(CN "As appropriate, :SUBDIVIDE-BY the subdivisions used for :CLASSES-OF-PERSONS [Appendix A].")
(HN "Deleted precoordinated CHILDREN headings in 2004. Current practice is to use postcoordinated terms. For example, for the former term CHILDREN PLAYING, use the terms CHILDREN and PLAY (RECREATION). Before 1/2005, images may have been indexed under ADULTS & CHILDREN, CHILDREN & ADULTS, FATHERS & CHILDREN, MOTHERS & CHILDREN.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001961")
(TNR "tgm001966"))


(CONCEPT
(NON-DESCRIPTOR "Children misbehaving")
(USE "Child behavior")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001962")
(TNR "tgm001967"))


(CONCEPT
(DESCRIPTOR "Children playing adults")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Children playing house")
(BT "Children")
(NT "Children playing soldiers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001963")
(TNR "tgm001968"))


(CONCEPT
(NON-DESCRIPTOR "Children playing house")
(USE "Children playing adults")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001964")
(TNR "tgm001969"))


(CONCEPT
(DESCRIPTOR "Children playing soldiers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Children playing adults")
(RT "Soldiers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001965")
(TNR "tgm001970"))


(CONCEPT
(DESCRIPTOR "Children's allowances")
(UF "Allowances, Children's")
(BT "Money")
(RT "Child rearing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001966")
(TNR "tgm001971"))


(CONCEPT
(DESCRIPTOR "Children's art")
(SN "Art produced by children. See JUVENILIA for works produced during an artist's childhood or youth.")
(UF "Art by children")
(UF "Children's works")
(UF "Juvenile art")
(BT "Pictures")
(RT "Amateur works")
(RT "Juvenilia")
(RT "Student works")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000189")
(FCNlctgm "lctgm001967")
(TNR "tgm001972"))


(CONCEPT
(DESCRIPTOR "Children's comics")
(SN "For comics intended for young children which may include such activities as puzzles, coloring, and cut-outs.")
(BT "Comics")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000190")
(FCNlctgm "lctgm001969")
(TNR "tgm001974"))


(CONCEPT
(DESCRIPTOR "Children's furniture")
(UF "Bassinets")
(UF "Cribs")
(BT "Furniture")
(NT "Cradles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001970")
(TNR "tgm001975"))


(CONCEPT
(DESCRIPTOR "Children's literature")
(GEO-FACET ":NATIONALITY ")
(BT "Literature")
(NT "Fairy tales")
(NT "Nursery rhymes")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012129"))


(CONCEPT
(DESCRIPTOR "Children's museums")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Galleries & museums")
(RT "Children")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001971")
(TNR "tgm001976"))


(CONCEPT
(DESCRIPTOR "Children's parties")
(BT "Parties")
(NT "Children's tea parties")
(RT "Birthday parties")
(RT "Pinatas")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001972")
(TNR "tgm001977"))


(CONCEPT
(DESCRIPTOR "Children's playhouses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Playhouses, Children")
(BT "Sports & recreation facilities")
(RT "Playrooms")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001973")
(TNR "tgm001978"))


(CONCEPT
(DESCRIPTOR "Children's rights")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Civil rights")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001974")
(TNR "tgm001979"))


(CONCEPT
(NON-DESCRIPTOR "Children's rooms")
(USE "Nurseries")
(USE "Playrooms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001975")
(TNR "tgm001980"))


(CONCEPT
(DESCRIPTOR "Children's tea parties")
(BT "Children's parties")
(BT "Tea parties")
(RT "Tea")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001976")
(TNR "tgm001981"))


(CONCEPT
(NON-DESCRIPTOR "Children's television programs")
(USE "Television programs for children")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001977")
(TNR "tgm001982"))


(CONCEPT
(DESCRIPTOR "Children's theater")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Theatrical productions")
(RT "Children")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001978")
(TNR "tgm001983"))


(CONCEPT
(NON-DESCRIPTOR "Children's works")
(USE "Children's art")
(USE "Juvenilia")
(FUN "Formerly TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(FCNGMGPC "gmgpc000191")
(TNR "tgm001984"))


(CONCEPT
(DESCRIPTOR "Chimes")
(BT "Bells")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001979")
(TNR "tgm001985"))


(CONCEPT
(NON-DESCRIPTOR "Chimney pieces")
(USE "Chimneypieces")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001980")
(TNR "tgm001986"))


(CONCEPT
(DESCRIPTOR "Chimney sweeping")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Sweeping & dusting")
(RT "Chimney sweeps")
(RT "Chimneys")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001981")
(TNR "tgm001987"))


(CONCEPT
(DESCRIPTOR "Chimney sweeps")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with manual labor")
(RT "Chimney sweeping")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001982")
(TNR "tgm001988"))


(CONCEPT
(DESCRIPTOR "Chimneypieces")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Ornamental constructions over and around fireplaces that include the mantel.")
(UF "Chimney pieces")
(UF "Mantelpieces")
(BT "Architectural decorations & ornaments")
(BT "Architectural elements")
(RT "Fireplaces")
(RT "Mantels")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001983")
(TNR "tgm001989"))


(CONCEPT
(DESCRIPTOR "Chimneys")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Architectural elements")
(NT "Smokestacks")
(RT "Chimney sweeping")
(RT "Fireplaces")
(RT "Flues")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001984")
(TNR "tgm001990"))


(CONCEPT
(DESCRIPTOR "Chimpanzees")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Chimps")
(BT "Apes")
(RT "Monkeys")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001985")
(TNR "tgm001991"))


(CONCEPT
(NON-DESCRIPTOR "Chimps")
(USE "Chimpanzees")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001986")
(TNR "tgm001992"))


(CONCEPT
(NON-DESCRIPTOR "China")
(USE "Porcelain")
(USE "Tableware")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001987")
(TNR "tgm001993"))


(CONCEPT
(NON-DESCRIPTOR "China closets")
(USE "Cabinets (Case furniture)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001988")
(TNR "tgm001994"))


(CONCEPT
(DESCRIPTOR "Chine collé prints")
(SN "Prints made by laying down a thin sheet of paper on a heavier backing.  The thin sheet adheres permanently to the backing sheet during printing.  Lithographic or intaglio method.")
(BT "Prints")
(RT "Intaglio prints")
(RT "Lithographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000192")
(FCNlctgm "lctgm001989")
(TNR "tgm001995"))


(CONCEPT
(NON-DESCRIPTOR "Chinese junks")
(USE "Junks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001990")
(TNR "tgm001996"))


(CONCEPT
(NON-DESCRIPTOR "Chinese lanterns")
(USE "Paper lanterns")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001991")
(TNR "tgm001997"))


(CONCEPT
(DESCRIPTOR "Chinese restaurants")
(BT "Restaurants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001992")
(TNR "tgm001998"))


(CONCEPT
(DESCRIPTOR "Chipmunks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Squirrels")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001993")
(TNR "tgm001999"))


(CONCEPT
(DESCRIPTOR "Chiropractors")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Medical personnel")
(RT "Health care")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012128"))


(CONCEPT
(DESCRIPTOR "Chisels & mallets")
(UF "Mallets")
(BT "Hand tools")
(RT "Carpentry")
(RT "Stone cutting")
(RT "Woodworking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001994")
(TNR "tgm002000"))


(CONCEPT
(NON-DESCRIPTOR "Chittahs")
(USE "Cheetahs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm001995")
(TNR "tgm002001"))


(CONCEPT
(DESCRIPTOR "Chivalry")
(BT "Manners & customs")
(RT "Knights")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001996")
(TNR "tgm002002"))


(CONCEPT
(NON-DESCRIPTOR "Chloride prints")
(USE "Photographic prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000193")
(FCNlctgm "lctgm001997")
(TNR "tgm002003"))


(CONCEPT
(NON-DESCRIPTOR "Chloro-bromide prints")
(USE "Gelatin silver prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000194")
(FCNlctgm "lctgm001998")
(TNR "tgm002004"))


(CONCEPT
(DESCRIPTOR "Chocolate industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Food industry")
(RT "Cacao")
(RT "Cocoa industry")
(RT "Confections")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm001999")
(TNR "tgm002005"))


(CONCEPT
(NON-DESCRIPTOR "Chocolate-trees")
(USE "Cacao")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002000")
(TNR "tgm002006"))


(CONCEPT
(NON-DESCRIPTOR "Choice")
(USE "Choosing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002001")
(TNR "tgm002007"))


(CONCEPT
(DESCRIPTOR "Choir stalls")
(UF "Stalls, choir")
(BT "Religious architectural elements")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002002")
(TNR "tgm002008"))


(CONCEPT
(DESCRIPTOR "Choirboys")
(BT "Children")
(BT "Singers")
(RT "Choirs (Music)")
(RT "Religious services")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002003")
(TNR "tgm002009"))


(CONCEPT
(DESCRIPTOR "Choirs (Music)")
(BT "Music ensembles")
(RT "Choirboys")
(RT "Conducting")
(RT "Religious services")
(RT "Singing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002004")
(TNR "tgm002010"))


(CONCEPT
(NON-DESCRIPTOR "Choking")
(USE "Strangling")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002005")
(TNR "tgm002011"))


(CONCEPT
(DESCRIPTOR "Cholera")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Asiatic cholera")
(BT "Communicable diseases")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002006")
(TNR "tgm002012"))


(CONCEPT
(DESCRIPTOR "Choosing")
(UF "Choice")
(BT "Mental states")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002007")
(TNR "tgm002013"))


(CONCEPT
(NON-DESCRIPTOR "Chopping blocks")
(USE "Butcher blocks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002008")
(TNR "tgm002014"))


(CONCEPT
(NON-DESCRIPTOR "Chopping wood")
(USE "Woodcutting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002009")
(TNR "tgm002015"))


(CONCEPT
(DESCRIPTOR "Chops")
(SN "Identifying marks stamped or embossed on prints by artists, printers, or publishers.")
(BT "Marks (Symbols)")
(RT "Artists' signatures")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000195")
(FCNlctgm "lctgm002010")
(TNR "tgm002016"))


(CONCEPT
(DESCRIPTOR "Chopsticks")
(BT "Equipment")
(RT "Silverware")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002011")
(TNR "tgm002017"))


(CONCEPT
(DESCRIPTOR "Choreographers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with entertainment & sports")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012127"))


(CONCEPT
(DESCRIPTOR "Choreography")
(BT "Dance")
(RT "Dancers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002012")
(TNR "tgm002018"))


(CONCEPT
(DESCRIPTOR "Chorus girls")
(BT "Entertainers")
(BT "Women")
(RT "Chorus girls' unions")
(RT "Musical revues & comedies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002013")
(TNR "tgm002019"))


(CONCEPT
(DESCRIPTOR "Chorus girls' unions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Labor unions")
(RT "Chorus girls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002014")
(TNR "tgm002020"))


(CONCEPT
(NON-DESCRIPTOR "Choruses")
(USE "Singers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002015")
(TNR "tgm002021"))


(CONCEPT
(DESCRIPTOR "Chow chows (Dogs)")
(GEO-FACET ":COUNTRY :STATE")
(UF "Spitz dogs")
(BT "Dogs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002016")
(TNR "tgm002022"))


(CONCEPT
(DESCRIPTOR "Chowder")
(BT "Soups")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002017")
(TNR "tgm002023"))


(CONCEPT
(NON-DESCRIPTOR "Christenings")
(USE "Baptisms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002018")
(TNR "tgm002024"))


(CONCEPT
(NON-DESCRIPTOR "Christian")
(USE "Christianity")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002019")
(TNR "tgm002025"))


(CONCEPT
(NON-DESCRIPTOR "Christian right")
(USE "Religious fundamentalism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002020")
(TNR "tgm002026"))


(CONCEPT
(DESCRIPTOR "Christian Science churches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on buildings, as well as the associated grounds.")
(BT "Protestant churches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002021")
(TNR "tgm002027"))


(CONCEPT
(NON-DESCRIPTOR "Christian union")
(USE "Ecumenism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002022")
(TNR "tgm002028"))


(CONCEPT
(DESCRIPTOR "Christian vacation schools")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Vacation Bible schools")
(BT "Church schools")
(RT "Christianity")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002023")
(TNR "tgm002029"))


(CONCEPT
(DESCRIPTOR "Christianity")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Christian")
(BT "Religion")
(NT "Catholicism")
(RT "Christian vacation schools")
(RT "Clergy")
(RT "Confessions")
(RT "Evangelists")
(RT "Gospel music")
(RT "Missionaries")
(RT "Monks")
(RT "Nuns")
(RT "Saints")
(RT "Stations of the Cross")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002024")
(TNR "tgm002030"))


(CONCEPT
(DESCRIPTOR "Christmas cards")
(BT "Greeting cards")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000196")
(FCNlctgm "lctgm002026")
(TNR "tgm002031"))


(CONCEPT
(DESCRIPTOR "Christmas carols")
(UF "Carols, Christmas")
(BT "Songs")
(RT "Holidays")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002027")
(TNR "tgm002032"))


(CONCEPT
(NON-DESCRIPTOR "Christmas crèches")
(USE "Crèches (Nativity scenes)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002028")
(TNR "tgm002033"))


(CONCEPT
(DESCRIPTOR "Christmas decoration stores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Stores & shops")
(RT "Christmas decorations")
(RT "Decorations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002029")
(TNR "tgm002034"))


(CONCEPT
(DESCRIPTOR "Christmas decorations")
(BT "Festive decorations")
(RT "Christmas decoration stores")
(RT "Holidays")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002030")
(TNR "tgm002035"))


(CONCEPT
(DESCRIPTOR "Christmas presents")
(BT "Gifts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002031")
(TNR "tgm002036"))


(CONCEPT
(NON-DESCRIPTOR "Christmas puddings")
(USE "Plum puddings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002032")
(TNR "tgm002037"))


(CONCEPT
(DESCRIPTOR "Christmas seals")
(BT "Objects")
(RT "Fund raising")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002033")
(TNR "tgm002038"))


(CONCEPT
(DESCRIPTOR "Christmas stockings")
(BT "Festive decorations")
(RT "Gifts")
(RT "Hosiery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002034")
(TNR "tgm002039"))


(CONCEPT
(DESCRIPTOR "Christmas trees")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Festive decorations")
(BT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002035")
(TNR "tgm002040"))


(CONCEPT
(DESCRIPTOR "Chromolithographs")
(SN "Lithographs of the mid- to late 1800s printed in colors; often made to look like an oil painting or watercolor.")
(BT "Lithographs")
(NT "Oleographs")
(CN "Subdivide the term LITHOGRAPHS with --COLOR for fine art prints")
(FUN "Formerly TGMI term & TGMII term.printed in color.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000197")
(FCNlctgm "lctgm002036")
(TNR "tgm002041"))


(CONCEPT
(NON-DESCRIPTOR "Chromo-photographs")
(USE "Crystoleum photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000199")
(FCNlctgm "lctgm002038")
(TNR "tgm002043"))


(CONCEPT
(NON-DESCRIPTOR "Chromotypes")
(USE "Carbon prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000198")
(FCNlctgm "lctgm002037")
(TNR "tgm002042"))


(CONCEPT
(NON-DESCRIPTOR "Chronometers")
(USE "Clocks & watches")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002039")
(TNR "tgm002044"))


(CONCEPT
(NON-DESCRIPTOR "Chronophotographs")
(USE "Motion study photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000200")
(FCNlctgm "lctgm002040")
(TNR "tgm002045"))


(CONCEPT
(DESCRIPTOR "Chrysanthemums")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Flowers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002041")
(TNR "tgm002046"))


(CONCEPT
(DESCRIPTOR "Chuck wagons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cook cars")
(BT "Carts & wagons")
(RT "Kitchens")
(RT "Outdoor cookery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002042")
(TNR "tgm002047"))


(CONCEPT
(DESCRIPTOR "Church & state")
(GEO-FACET ":COUNTRY :STATE")
(SN "For images that focus on the  relationship between government and Christian denominations.")
(UF "State & church")
(BT "Religion & politics")
(RT "Religion")
(RT "Religious tolerance")
(RT "Secularism")
(RT "Theocracy")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002047")
(TNR "tgm002052"))


(CONCEPT
(DESCRIPTOR "Church dedications")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Consecration of churches")
(BT "Building dedications")
(RT "Churches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002043")
(TNR "tgm002048"))


(CONCEPT
(DESCRIPTOR "Church schools")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For elementary and secondary schools operated under church auspices, control, or support. Includes activities and structures.")
(BT "Schools")
(NT "Christian vacation schools")
(NT "Sunday schools")
(RT "Religious education")
(RT "Religious facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002044")
(TNR "tgm002049"))


(CONCEPT
(NON-DESCRIPTOR "Church services")
(USE "Religious services")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002045")
(TNR "tgm002050"))


(CONCEPT
(NON-DESCRIPTOR "Church vestments")
(USE "Vestments")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002046")
(TNR "tgm002051"))


(CONCEPT
(DESCRIPTOR "Churches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on buildings, as well as the associated grounds.")
(UF "Churchyards")
(UF "Wooden churches")
(BT "Religious facilities")
(NT "Anglican churches")
(NT "Basilicas")
(NT "Cathedrals")
(NT "Catholic churches")
(NT "Cave churches")
(NT "Mission churches")
(NT "Mormon churches")
(NT "Orthodox churches")
(NT "Protestant churches")
(RT "Altarpieces")
(RT "Altars")
(RT "Apses")
(RT "Baptisteries")
(RT "Chancels")
(RT "Chapels")
(RT "Church dedications")
(RT "Clerestories")
(RT "Fonts")
(RT "Greek cross-plan buildings")
(RT "Hymn boards")
(RT "Latin cross-plan buildings")
(RT "Mosques")
(RT "Naves")
(RT "Organ lofts")
(RT "Parish houses")
(RT "Pews")
(RT "Sacristies")
(RT "Synagogues")
(RT "Tabernacles")
(RT "Temples")
(CN "Used in a note under CHAPELS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002048")
(TNR "tgm002053"))


(CONCEPT
(NON-DESCRIPTOR "Churchyards")
(USE "Churches")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002049")
(TNR "tgm002054"))


(CONCEPT
(NON-DESCRIPTOR "Churning")
(USE "Butter making")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002050")
(TNR "tgm002055"))


(CONCEPT
(DESCRIPTOR "Churns")
(SN "Machine which agitates cream or whole milk, turning it into butter.")
(UF "Butter churns")
(BT "Equipment")
(RT "Butter")
(RT "Butter making")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002051")
(TNR "tgm002056"))


(CONCEPT
(NON-DESCRIPTOR "Cibachrome prints")
(USE "Dye destruction prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000201")
(FCNlctgm "lctgm002052")
(TNR "tgm002057"))


(CONCEPT
(DESCRIPTOR "Cider")
(BT "Fruit juices")
(RT "Wine")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002053")
(TNR "tgm002058"))


(CONCEPT
(DESCRIPTOR "Cigar industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Tobacco industry")
(RT "Cigars")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILTIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002054")
(TNR "tgm002059"))


(CONCEPT
(DESCRIPTOR "Cigar store Indians")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Wood carvings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002055")
(TNR "tgm002060"))


(CONCEPT
(DESCRIPTOR "Cigarette cards")
(SN "Cards enclosed with cigarettes. Flourished in the United States 1885-1895 and 1909-1917; printed or photographic.")
(UF "Tobacco cards")
(BT "Trade cards")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000202")
(FCNlctgm "lctgm002056")
(TNR "tgm002061"))


(CONCEPT
(DESCRIPTOR "Cigarette holders")
(BT "Smoking paraphernalia")
(RT "Cigarettes")
(RT "Smoking")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012126"))


(CONCEPT
(DESCRIPTOR "Cigarette industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Tobacco industry")
(RT "Cigarettes")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002057")
(TNR "tgm002062"))


(CONCEPT
(DESCRIPTOR "Cigarette lighters")
(BT "Smoking paraphernalia")
(RT "Cigarettes")
(RT "Smoking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002058")
(TNR "tgm002063"))


(CONCEPT
(DESCRIPTOR "Cigarette papers")
(UF "Rolling papers")
(BT "Smoking paraphernalia")
(RT "Cigarettes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002059")
(TNR "tgm002064"))


(CONCEPT
(DESCRIPTOR "Cigarettes")
(BT "Tobacco products")
(RT "Cigarette holders")
(RT "Cigarette industry")
(RT "Cigarette lighters")
(RT "Cigarette papers")
(RT "Smoking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002060")
(TNR "tgm002065"))


(CONCEPT
(DESCRIPTOR "Cigars")
(BT "Tobacco products")
(RT "Cigar industry")
(RT "Smoking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002061")
(TNR "tgm002066"))


(CONCEPT
(NON-DESCRIPTOR "Cinema")
(USE "Motion pictures")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002062")
(TNR "tgm002067"))


(CONCEPT
(DESCRIPTOR "Cinematography")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of cinematography in general and the activities of cinematographers.")
(UF "Motion picture photography")
(BT "Photography")
(NT "Animation")
(RT "Motion picture cameras")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002063")
(TNR "tgm002068"))


(CONCEPT
(NON-DESCRIPTOR "Cinerary urns")
(USE "Urns")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002064")
(TNR "tgm002069"))


(CONCEPT
(NON-DESCRIPTOR "Circles, traffic")
(USE "Traffic circles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002065")
(TNR "tgm002070"))


(CONCEPT
(DESCRIPTOR "Circular buildings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Round buildings")
(BT "Buildings distinguished by form")
(RT "Rotundas")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002066")
(TNR "tgm002071"))


(CONCEPT
(DESCRIPTOR "Circular rooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Round rooms")
(BT "Interiors")
(RT "Rotundas")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002067")
(TNR "tgm002072"))


(CONCEPT
(DESCRIPTOR "Circulars")
(SN "Printed promotional pieces, frequently announcing sales; may be several pages in length; distributed widely through the mail, door to door, as newspaper inserts, or at commercial establishments.")
(BT "Fliers (Printed matter)")
(RT "Handbills")
(HN "Changed 6/94. Formerly, CIRCULARS may have been indexed as HANDBILLS or LEAFLETS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000203")
(FCNlctgm "lctgm002068")
(TNR "tgm002073"))


(CONCEPT
(DESCRIPTOR "Circulation (Architecture)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Traffic patterns through parts of buildings, including the methods of travel such as corridors or elevators.")
(UF "Circulation in buildings")
(BT "Concepts")
(RT "Architectural & site components")
(RT "Locomotion")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002070")
(TNR "tgm002075"))


(CONCEPT
(NON-DESCRIPTOR "Circulation in buildings")
(USE "Circulation (Architecture)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002069")
(TNR "tgm002074"))


(CONCEPT
(NON-DESCRIPTOR "Circulatory system")
(USE "Cardiovascular system")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002071")
(TNR "tgm002076"))


(CONCEPT
(NON-DESCRIPTOR "Circumnavigation")
(USE "Voyages around the world")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002072")
(TNR "tgm002077"))


(CONCEPT
(DESCRIPTOR "Circus animals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animals")
(RT "Circus performers")
(RT "Circuses & shows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002073")
(TNR "tgm002078"))


(CONCEPT
(NON-DESCRIPTOR "Circus entertainers")
(USE "Circus performers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002074")
(TNR "tgm002079"))


(CONCEPT
(DESCRIPTOR "Circus parades")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Parades & processions")
(RT "Circuses & shows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002075")
(TNR "tgm002080"))


(CONCEPT
(DESCRIPTOR "Circus performers")
(UF "Circus entertainers")
(BT "Entertainers")
(RT "Acrobatics")
(RT "Acrobats")
(RT "Aerialists")
(RT "Circus animals")
(RT "Circuses & shows")
(RT "Clowns")
(RT "Daredevils")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002076")
(TNR "tgm002081"))


(CONCEPT
(DESCRIPTOR "Circus posters")
(SN "Includes posters for circuses as well as carnivals, and wild west shows.")
(UF "Carnival posters")
(UF "Wild west show posters")
(BT "Performing arts posters")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000204")
(FCNlctgm "lctgm002077")
(TNR "tgm002082"))


(CONCEPT
(DESCRIPTOR "Circus spectacles")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "A feature of early circuses, spectacles were large scale, lavish dramas or pageants based on imaginative or historical themes. Today refers to the grand-opening parade before the performance or the parade just after the conclusion of the first half of the program. Not to be conf:USED-WITH circus street parades.")
(BT "Entertainment")
(RT "Circuses & shows")
(RT "Pageants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002078")
(TNR "tgm002083"))


(CONCEPT
(DESCRIPTOR "Circuses & shows")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Big top")
(UF "Shows")
(UF "Specialty acts")
(BT "Entertainment")
(NT "Medicine shows")
(NT "Sideshows")
(NT "Wild west shows")
(RT "Acrobatics")
(RT "Acrobats")
(RT "Amusement parks")
(RT "Bareback riding")
(RT "Circus animals")
(RT "Circus parades")
(RT "Circus performers")
(RT "Circus spectacles")
(RT "Human curiosities")
(RT "Juggling")
(RT "Midways")
(RT "Rodeos")
(RT "Show tents")
(RT "Sword swallowing")
(RT "Trained animals")
(RT "Trick riding")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002079")
(TNR "tgm002084"))


(CONCEPT
(NON-DESCRIPTOR "Cirkut camera photographs")
(USE "Panoramic photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000205")
(FCNlctgm "lctgm002080")
(TNR "tgm002085"))


(CONCEPT
(NON-DESCRIPTOR "Citadels")
(USE "Forts & fortifications")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002081")
(TNR "tgm002086"))


(CONCEPT
(NON-DESCRIPTOR "Citations, Traffic")
(USE "Ticketing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002082")
(TNR "tgm002087"))


(CONCEPT
(DESCRIPTOR "Cities & towns")
(GEO-FACET ":COUNTRY :STATE")
(SN "For images that focus on structures and sites.  :SEARCH-SUBDIVISION CITY & TOWN LIFE for images that focus on activities.")
(BT "Settlements")
(RT "City & town life")
(RT "Miniature cities & towns")
(RT "Streets")
(RT "Villages")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002083")
(TNR "tgm002088"))


(CONCEPT
(NON-DESCRIPTOR "Citizen participation")
(USE "Community service")
(USE "Political participation")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002084")
(TNR "tgm002089"))


(CONCEPT
(DESCRIPTOR "Citizenship")
(GEO-FACET ":COUNTRY")
(BT "Politics & government")
(RT "Naturalization")
(RT "Repatriation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002085")
(TNR "tgm002090"))


(CONCEPT
(DESCRIPTOR "Citrus fruit")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fruit")
(NT "Grapefruit")
(NT "Lemons")
(NT "Limes")
(NT "Oranges")
(RT "Citrus fruit industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002086")
(TNR "tgm002091"))


(CONCEPT
(DESCRIPTOR "Citrus fruit industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Citrus industry")
(UF "Citrus trade")
(BT "Fruit industry")
(RT "Citrus fruit")
(RT "Orange orchards")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002087")
(TNR "tgm002092"))


(CONCEPT
(NON-DESCRIPTOR "Citrus industry")
(USE "Citrus fruit industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002088")
(TNR "tgm002093"))


(CONCEPT
(NON-DESCRIPTOR "Citrus trade")
(USE "Citrus fruit industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002089")
(TNR "tgm002094"))


(CONCEPT
(DESCRIPTOR "City & town halls")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "City halls")
(UF "Guildhalls (Municipal buildings)")
(UF "Town halls")
(UF "Village halls")
(BT "Government facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002100")
(TNR "tgm002105"))


(CONCEPT
(DESCRIPTOR "City & town life")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on activities.  :SEARCH-SUBDIVISION CITIES & TOWNS for images that focus on structures and sites.  :SEARCH-SUBDIVISION STREETS for thoroughfares in cities, towns, and villages.")
(UF "Street life")
(UF "Town life")
(UF "Urban life")
(BT "Manners & customs")
(RT "Cities & towns")
(RT "Economic & social conditions")
(RT "Ethnic neighborhoods")
(RT "Markets")
(RT "Neighborhoods")
(RT "Peddlers")
(RT "Slums")
(RT "Street entertainers")
(RT "Streets")
(RT "Town criers")
(RT "Town meetings")
(RT "Traffic accidents")
(RT "Traffic congestion")
(CN "Used in a note under STREETS and CITIES & TOWNS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002101")
(TNR "tgm002106"))


(CONCEPT
(NON-DESCRIPTOR "City beautification")
(USE "Urban beautification")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002090")
(TNR "tgm002095"))


(CONCEPT
(DESCRIPTOR "City council members")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Aldermen")
(UF "Council members, City")
(BT "Municipal officials")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002091")
(TNR "tgm002096"))


(CONCEPT
(NON-DESCRIPTOR "City gates")
(USE "Gates")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002092")
(TNR "tgm002097"))


(CONCEPT
(NON-DESCRIPTOR "City government")
(USE "Municipal government")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002093")
(TNR "tgm002098"))


(CONCEPT
(NON-DESCRIPTOR "City halls")
(USE "City & town halls")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002094")
(TNR "tgm002099"))


(CONCEPT
(NON-DESCRIPTOR "City officials")
(USE "Municipal officials")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002095")
(TNR "tgm002100"))


(CONCEPT
(DESCRIPTOR "City planning")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Planning, City")
(UF "Urban planning")
(BT "Social science")
(RT "Housing")
(RT "Land subdivision")
(RT "Land use")
(RT "Municipal services")
(RT "Urban beautification")
(RT "Urban growth")
(RT "Urban renewal")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002096")
(TNR "tgm002101"))


(CONCEPT
(NON-DESCRIPTOR "City planning drawings")
(USE "Planning drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000206")
(FCNlctgm "lctgm002097")
(TNR "tgm002102"))


(CONCEPT
(NON-DESCRIPTOR "City views")
(USE "Cityscapes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000207")
(FCNlctgm "lctgm002098")
(TNR "tgm002103"))


(CONCEPT
(DESCRIPTOR "City walls")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Forts & fortifications")
(BT "Walls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002099")
(TNR "tgm002104"))


(CONCEPT
(DESCRIPTOR "Cityscape drawings")
(BT "Cityscapes")
(BT "Drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000208")
(FCNlctgm "lctgm002102")
(TNR "tgm002107"))


(CONCEPT
(DESCRIPTOR "Cityscape paintings")
(BT "Cityscapes")
(BT "Paintings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000209")
(FCNlctgm "lctgm002103")
(TNR "tgm002108"))


(CONCEPT
(DESCRIPTOR "Cityscape photographs")
(BT "Cityscapes")
(BT "Photographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000210")
(FCNlctgm "lctgm002104")
(TNR "tgm002109"))


(CONCEPT
(DESCRIPTOR "Cityscape prints")
(BT "Cityscapes")
(BT "Prints")
(RT "Bird's-eye view prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000211")
(FCNlctgm "lctgm002105")
(TNR "tgm002110"))


(CONCEPT
(DESCRIPTOR "Cityscapes")
(SN "General or broad views of cities and towns or sections of them.  Usually made from an elevated or distant vantage point, such as a view from a roof or a view of a skyline.")
(UF "City views")
(UF "Skyline views")
(UF "Topographical views")
(UF "Townscapes")
(UF "Views, City")
(NT "Cityscape drawings")
(NT "Cityscape paintings")
(NT "Cityscape photographs")
(NT "Cityscape prints")
(RT "Panoramic views")
(RT "Views")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000212")
(FCNlctgm "lctgm002106")
(TNR "tgm002111"))


(CONCEPT
(NON-DESCRIPTOR "Civic buildings")
(USE "Social & civic facilities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002107")
(TNR "tgm002112"))


(CONCEPT
(DESCRIPTOR "Civic leaders")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Community leaders")
(BT "People")
(RT "Community service")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002108")
(TNR "tgm002113"))


(CONCEPT
(DESCRIPTOR "Civil defense")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --CIVIL DEFENSE :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(UF "Civilian defense")
(UF "Defense, Civil")
(UF "Emergency preparedness")
(BT "Preparedness")
(NT "Air raid drills")
(NT "Air raid warning systems")
(NT "War blackouts")
(RT "Air raid shelters")
(RT "Evacuations")
(RT "War")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002109")
(TNR "tgm002114"))


(CONCEPT
(DESCRIPTOR "Civil disobedience")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Government, Resistance to")
(UF "Noncooperation")
(UF "Political violence")
(UF "Resistance to government")
(UF "Violence, Political")
(BT "Demonstrations")
(NT "Passive resistance")
(RT "Activists")
(RT "Civil rights leaders")
(RT "Political prisoners")
(RT "Protest movements")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002110")
(TNR "tgm002115"))


(CONCEPT
(NON-DESCRIPTOR "Civil disorders")
(USE "Riots")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002111")
(TNR "tgm002116"))


(CONCEPT
(DESCRIPTOR "Civil engineering")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of civil engineering in general and the activities of civil engineers.")
(BT "Engineering")
(NT "Bridge construction")
(NT "Canal construction")
(NT "Dam construction")
(NT "Excavation")
(NT "Reclamation of land")
(NT "Road construction")
(NT "Road cuts")
(RT "Pilings (Civil engineering)")
(RT "Surveying")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002112")
(TNR "tgm002117"))


(CONCEPT
(DESCRIPTOR "Civil liberties")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "For the rights of individuals. :SEARCH-SUBDIVISION CIVIL RIGHTS for the constitutional and legal status and treatment of minority groups that are distinguished from the majority by race, religion, sex, national origin, etc.")
(UF "Human rights")
(BT "Liberty")
(NT "Civil rights")
(NT "Freedom of information")
(NT "Freedom of movement")
(NT "Freedom of religion")
(NT "Freedom of speech")
(NT "Right of property")
(NT "Suffrage")
(RT "Employee rights")
(RT "Firearms control")
(CN "Used in a note under CIVIL RIGHTS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002113")
(TNR "tgm002118"))


(CONCEPT
(DESCRIPTOR "Civil rights")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --CIVIL RIGHTS :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP and :CLASSES-OF-PERSONS [Appendix A].")
(UF "Civil rights movements")
(UF "Freedom from discrimination")
(UF "Rights, Civil")
(BT "Civil liberties")
(NT "Children's rights")
(NT "Employee rights")
(NT "Gay rights")
(NT "Veterans' rights")
(NT "Women's rights")
(RT "Abolition movement")
(RT "Civil rights demonstrations")
(RT "Civil rights leaders")
(RT "Discrimination")
(RT "Integration")
(RT "Legal aid")
(RT "Minorities")
(RT "Segregation")
(RT "Slavery")
(CN "Used in a note under CIVIL LIBERTIES and CIVIL RIGHTS DEMONSTRATIONS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002114")
(TNR "tgm002119"))


(CONCEPT
(DESCRIPTOR "Civil rights demonstrations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Demonstrations")
(RT "Civil rights")
(HN "Before 6/19/98, images indexed under CIVIL RIGHTS and DEMONSTRATIONS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002115")
(TNR "tgm002120"))


(CONCEPT
(DESCRIPTOR "Civil rights leaders")
(GEO-FACET ":COUNTRY :STATE")
(SN "For officials and other individuals involved in organizing to promote civil rights.")
(UF "Civil rights workers")
(BT "People")
(RT "Activists")
(RT "Civil disobedience")
(RT "Civil rights")
(RT "Demonstrations")
(RT "Political participation")
(RT "Protest movements")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002116")
(TNR "tgm002121"))


(CONCEPT
(NON-DESCRIPTOR "Civil rights movements")
(USE "Civil rights")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002117")
(TNR "tgm002122"))


(CONCEPT
(NON-DESCRIPTOR "Civil rights workers")
(USE "Civil rights leaders")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002118")
(TNR "tgm002123"))


(CONCEPT
(DESCRIPTOR "Civil service")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of employment in branches of the public service which are not military, naval, legislative, or judicial.")
(UF "Federal employment")
(UF "Merit system")
(BT "Employment")
(BT "Politics & government")
(RT "Administrative agencies")
(RT "Civil service reform")
(RT "Government employees")
(RT "Government officials")
(RT "Public service")
(RT "Public service employment")
(CN "Used in a note under PUBLIC SERVICE EMPLOYMENT.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002119")
(TNR "tgm002124"))


(CONCEPT
(DESCRIPTOR "Civil service reform")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Reform")
(RT "Civil service")
(RT "Government reorganization")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002120")
(TNR "tgm002125"))


(CONCEPT
(NON-DESCRIPTOR "Civil War envelopes")
(USE "Patriotic envelopes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000213")
(FCNlctgm "lctgm002121")
(TNR "tgm002126"))


(CONCEPT
(DESCRIPTOR "Civil wars")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "War")
(RT "Rebellions")
(RT "Revolutions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002122")
(TNR "tgm002127"))


(CONCEPT
(NON-DESCRIPTOR "Civilian defense")
(USE "Civil defense")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002123")
(TNR "tgm002128"))


(CONCEPT
(NON-DESCRIPTOR "Civilian war relief")
(USE "War relief")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002124")
(TNR "tgm002129"))


(CONCEPT
(NON-DESCRIPTOR "Civilians, Evacuation of")
(USE "Evacuations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002125")
(TNR "tgm002130"))


(CONCEPT
(DESCRIPTOR "Civilization")
(SN "For the subject of and symbolic representations of civilization.")
(BT "Concepts")
(RT "Creation")
(RT "Evolution")
(RT "History")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002126")
(TNR "tgm002131"))


(CONCEPT
(DESCRIPTOR "Clambakes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Picnics")
(RT "Clamming")
(RT "Shellfish")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002127")
(TNR "tgm002132"))


(CONCEPT
(DESCRIPTOR "Clamming")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Activities")
(RT "Clambakes")
(RT "Clams")
(RT "Shellfish industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002128")
(TNR "tgm002133"))


(CONCEPT
(DESCRIPTOR "Clams")
(GEO-FACET ":COUNTRY :STATE")
(BT "Shellfish")
(RT "Clamming")
(RT "Shucking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002129")
(TNR "tgm002134"))


(CONCEPT
(NON-DESCRIPTOR "Clandestine literature")
(USE "Underground literature")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002130")
(TNR "tgm002135"))


(CONCEPT
(DESCRIPTOR "Clapboard siding")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bevel siding")
(UF "Siding, Bevel")
(UF "Siding, Clapboard")
(UF "Weatherboard siding")
(BT "Building materials")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002131")
(TNR "tgm002136"))


(CONCEPT
(DESCRIPTOR "Clapper boards")
(SN "Hinged boards attached to a slate used in motion picture production to indicate take and synchronize sound and picture.")
(BT "Motion picture devices")
(RT "Motion picture production & direction")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002132")
(TNR "tgm002137"))


(CONCEPT
(DESCRIPTOR "Clarinets")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Wind instruments")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012125"))


(CONCEPT
(NON-DESCRIPTOR "Classes (Social)")
(USE "Social classes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002133")
(TNR "tgm002138"))


(CONCEPT
(DESCRIPTOR "Classified defense information")
(BT "Communication")
(RT "National security")
(RT "Spying")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002134")
(TNR "tgm002139"))


(CONCEPT
(DESCRIPTOR "Classrooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "School classrooms")
(UF "Schoolrooms")
(BT "Interiors")
(RT "Educational facilities")
(RT "Lecture halls")
(RT "School children")
(RT "School overcrowding")
(RT "Students")
(RT "Teachers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002135")
(TNR "tgm002140"))


(CONCEPT
(NON-DESCRIPTOR "Clavicembalos")
(USE "Harpsichords")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002136")
(TNR "tgm002141"))


(CONCEPT
(DESCRIPTOR "Clay")
(BT "Land")
(RT "Clay mining")
(RT "Terra-cotta")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002137")
(TNR "tgm002142"))


(CONCEPT
(DESCRIPTOR "Clay industries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Ceramic industries")
(NT "Brick industry")
(NT "Pottery industry")
(NT "Tile industry")
(RT "Clay mining")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002138")
(TNR "tgm002143"))


(CONCEPT
(DESCRIPTOR "Clay miners")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Miners")
(RT "Clay mining")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002139")
(TNR "tgm002144"))


(CONCEPT
(DESCRIPTOR "Clay mining")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and sites.")
(BT "Mining")
(RT "Clay")
(RT "Clay industries")
(RT "Clay miners")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002140")
(TNR "tgm002145"))


(CONCEPT
(NON-DESCRIPTOR "Clay modeling")
(USE "Modeling (Sculpture)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002141")
(TNR "tgm002146"))


(CONCEPT
(DESCRIPTOR "Cleaning")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Washing")
(BT "Processes & techniques")
(NT "Dishwashing")
(NT "Laundry")
(NT "Refuse disposal")
(NT "Snow removal")
(NT "Street cleaning")
(NT "Sweeping & dusting")
(NT "Window cleaning")
(RT "Basins")
(RT "Cleaning personnel")
(RT "Household soap")
(RT "Housework")
(RT "Wash tubs")
(RT "Washboards")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002142")
(TNR "tgm002147"))


(CONCEPT
(DESCRIPTOR "Cleaning establishments")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Dry cleaners")
(UF "Laundries (Commercial establishments)")
(BT "Service industry facilities")
(RT "Diaper service")
(RT "Laundry")
(RT "Laundry workers' strikes")
(CN "Used in a note under LAUNDRIES (ROOMS & SPACES).")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002143")
(TNR "tgm002148"))


(CONCEPT
(DESCRIPTOR "Cleaning personnel")
(BT "People associated with manual labor")
(NT "Janitors")
(RT "Cleaning")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002144")
(TNR "tgm002149"))


(CONCEPT
(DESCRIPTOR "Clearing of land")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Removal of timber and bushes from land. :SEARCH-SUBDIVISION RECLAMATION OF LAND for bringing wild, waste, or marshy land into a condition for cultivation or other use.")
(UF "Land clearing")
(BT "Reclamation of land")
(RT "Cutover lands")
(RT "Mowing")
(RT "Real estate development")
(CN "Used in a note under RECLAMATION OF LAND.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002145")
(TNR "tgm002150"))


(CONCEPT
(NON-DESCRIPTOR "Clearstories")
(USE "Clerestories")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002146")
(TNR "tgm002151"))


(CONCEPT
(DESCRIPTOR "Clematis")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Flowers")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012120"))


(CONCEPT
(NON-DESCRIPTOR "Clenched fists")
(USE "Fists")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002147")
(TNR "tgm002152"))


(CONCEPT
(DESCRIPTOR "Clerestories")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Clearstories")
(BT "Building divisions")
(RT "Churches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002148")
(TNR "tgm002153"))


(CONCEPT
(DESCRIPTOR "Clergy")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Clergymen")
(UF "Clerics")
(UF "Dignitaries")
(UF "Ministers of the gospel")
(BT "People associated with religion")
(NT "Bishops")
(NT "Cardinals")
(NT "Chaplains")
(NT "Patriarchs")
(NT "Prelates")
(NT "Priests")
(NT "Rabbis")
(RT "Christianity")
(RT "Confessions")
(RT "Missionaries")
(RT "Preachers")
(RT "Religion")
(RT "Religious orders")
(RT "Religious services")
(RT "Spiritual leaders")
(RT "Theological seminaries")
(HN "Changed 12/1992 from CLERGYMEN.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002149")
(TNR "tgm002154"))


(CONCEPT
(NON-DESCRIPTOR "Clergymen")
(USE "Clergy")
(HN "Changed 12/1992 from postable term.")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002150")
(TNR "tgm002155"))


(CONCEPT
(NON-DESCRIPTOR "Clerical workers")
(USE "Office workers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002151")
(TNR "tgm002156"))


(CONCEPT
(NON-DESCRIPTOR "Clerics")
(USE "Clergy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002152")
(TNR "tgm002157"))


(CONCEPT
(DESCRIPTOR "Clerks")
(BT "Office workers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002153")
(TNR "tgm002158"))


(CONCEPT
(NON-DESCRIPTOR "Clerks' strikes")
(USE "Retail trade strikes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002154")
(TNR "tgm002159"))


(CONCEPT
(DESCRIPTOR "Clichés-verre")
(SN "Salted paper, albumen, silver gelatin, or other photographic prints made by exposure to a coating on a glass or film support, through which lines have been drawn or areas scraped away. Alternatively, inks can be applied to a transparent matrix in varying thicknesses to alter the amount of light reaching the sensitized paper.  May resemble drawings or prints.")
(UF "Glass prints")
(BT "Photographic prints")
(RT "Drawings")
(RT "Prints")
(RT "Reproductions")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000214")
(FCNlctgm "lctgm002155")
(TNR "tgm002160"))


(CONCEPT
(DESCRIPTOR "Cliff dwellings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Dwellings")
(RT "Archaeological sites")
(RT "Cliffs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002156")
(TNR "tgm002161"))


(CONCEPT
(DESCRIPTOR "Cliffs")
(GEO-FACET ":COUNTRY :STATE")
(SN "Very steep, perpendicular, or overhanging faces of rock, earth, or glacial ice of considerable height. :SEARCH-SUBDIVISION CANYONS for images that focus on valleys between cliffs.")
(UF "Bluffs")
(UF "Escarpments")
(UF "Palisades")
(UF "Precipices")
(BT "Land")
(RT "Canyons")
(RT "Cliff dwellings")
(RT "Mountains")
(CN "Used in a note under CANYONS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002157")
(TNR "tgm002162"))


(CONCEPT
(NON-DESCRIPTOR "Climate")
(USE "Weather")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002158")
(TNR "tgm002163"))


(CONCEPT
(DESCRIPTOR "Climbing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Locomotion")
(NT "Mountaineering")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002159")
(TNR "tgm002164"))


(CONCEPT
(NON-DESCRIPTOR "Climbing plants")
(USE "Vines")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002160")
(TNR "tgm002165"))


(CONCEPT
(DESCRIPTOR "Clinics")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Health care facilities for treatment of non-resident patients.")
(UF "Free clinics")
(BT "Health care facilities")
(RT "Infirmaries")
(RT "Mobile health units")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002161")
(TNR "tgm002166"))


(CONCEPT
(DESCRIPTOR "Clipper ship cards")
(SN "Printed cards made to attract freight consignments or passengers to clipper ships preparing to
depart; chiefly 1850s-1860s; commonly 4 x 6.5 in. (10 x 16 cm.).")
(UF "Yankee clipper cards")
(BT "Sailing cards")
(HN "Changed 6/94.  Formerly, CLIPPER SHIP CARDS may have been indexed as SHIP
CARDS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000215")
(FCNlctgm "lctgm002162")
(TNR "tgm002167"))


(CONCEPT
(DESCRIPTOR "Clipper ships")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Sailing ships")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002163")
(TNR "tgm002168"))


(CONCEPT
(DESCRIPTOR "Clippings")
(SN "Illustrations, pages, articles, or columns of text removed from books, newspapers, periodicals, or other publications.")
(UF "Newspaper clippings")
(UF "Press clippings")
(NT "Tear sheets")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000216")
(FCNlctgm "lctgm002164")
(TNR "tgm002169"))


(CONCEPT
(NON-DESCRIPTOR "Clips, Paper")
(USE "Paper clips")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002165")
(TNR "tgm002170"))


(CONCEPT
(NON-DESCRIPTOR "Cloaks")
(USE "Capes (Clothing)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002166")
(TNR "tgm002171"))


(CONCEPT
(DESCRIPTOR "Clock & watch industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures. :SEARCH-SUBDIVISION CLOCK & WATCH MAKING for small businesses.")
(UF "Watch industry")
(BT "Industry")
(RT "Clock & watch making")
(RT "Clocks & watches")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities. Used in a note under CLOCK & WATCH MAKING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002168")
(TNR "tgm002173"))


(CONCEPT
(DESCRIPTOR "Clock & watch making")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For small businesses. :SEARCH-SUBDIVISION CLOCK & WATCH INDUSTRY for factory work.")
(UF "Watch making")
(BT "Business enterprises")
(RT "Clock & watch industry")
(RT "Clocks & watches")
(CN "Used in a note under CLOCK & WATCH INDUSTRY.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002169")
(TNR "tgm002174"))


(CONCEPT
(DESCRIPTOR "Clock towers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Towers")
(RT "Clocks & watches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002167")
(TNR "tgm002172"))


(CONCEPT
(DESCRIPTOR "Clocks & watches")
(UF "Chronometers")
(UF "Timepieces")
(UF "Watches")
(BT "Equipment")
(NT "Alarm clocks")
(NT "Cuckoo clocks")
(NT "Hourglasses")
(NT "Longcase clocks")
(NT "Street clocks")
(NT "Sundials")
(NT "Time clocks")
(RT "Clock & watch industry")
(RT "Clock & watch making")
(RT "Clock towers")
(RT "Furnishings")
(RT "Jewelry")
(RT "Time")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002170")
(TNR "tgm002175"))


(CONCEPT
(DESCRIPTOR "Cloisonné")
(BT "Processes & techniques")
(RT "Jewelry")
(RT "Pottery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002171")
(TNR "tgm002176"))


(CONCEPT
(NON-DESCRIPTOR "Cloisters")
(USE "Convents")
(USE "Monasteries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002172")
(TNR "tgm002177"))


(CONCEPT
(DESCRIPTOR "Cloning")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Processes & techniques")
(RT "Medicine")
(RT "Science")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002173")
(TNR "tgm002178"))


(CONCEPT
(NON-DESCRIPTOR "Closed seas")
(USE "Freedom of the seas")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002174")
(TNR "tgm002179"))


(CONCEPT
(DESCRIPTOR "Closets")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Clothing closets")
(UF "Linen closets")
(UF "Wardrobes")
(BT "Furniture")
(RT "Clothing & dress")
(RT "Cupboards")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002175")
(TNR "tgm002180"))


(CONCEPT
(NON-DESCRIPTOR "Cloth")
(USE "Textiles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002176")
(TNR "tgm002181"))


(CONCEPT
(NON-DESCRIPTOR "Cloth labels")
(USE "Textile labels")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000217")
(FCNlctgm "lctgm002177")
(TNR "tgm002182"))


(CONCEPT
(DESCRIPTOR "Cloth photographs")
(SN "Photographs produced by any of a variety of processes on cotton, silk, or other cloth support.")
(UF "Collodion positive photographs")
(BT "Photographic prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000218")
(FCNlctgm "lctgm002178")
(TNR "tgm002183"))


(CONCEPT
(DESCRIPTOR "Cloth prints")
(SN "Prints produced by any of a variety of processes on cotton, silk, or other cloth support.  This term does not include printed textile design fabrics.")
(BT "Prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000219")
(FCNlctgm "lctgm002179")
(TNR "tgm002184"))


(CONCEPT
(DESCRIPTOR "Clothes chests")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bureaus (Furniture)")
(UF "Dressers (Furniture)")
(BT "Chests")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002180")
(TNR "tgm002185"))


(CONCEPT
(NON-DESCRIPTOR "Clothes designers")
(USE "Fashion designers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002181")
(TNR "tgm002186"))


(CONCEPT
(NON-DESCRIPTOR "Clothes washing")
(USE "Laundry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002182")
(TNR "tgm002187"))


(CONCEPT
(NON-DESCRIPTOR "Clothes, Maternity")
(USE "Maternity clothes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002185")
(TNR "tgm002190"))


(CONCEPT
(DESCRIPTOR "Clotheslines")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Equipment")
(RT "Clothespins")
(RT "Laundry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002183")
(TNR "tgm002188"))


(CONCEPT
(DESCRIPTOR "Clothespins")
(BT "Equipment")
(RT "Clotheslines")
(RT "Laundry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002184")
(TNR "tgm002189"))


(CONCEPT
(DESCRIPTOR "Clothing & dress")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Search also under groups of people associated with particular types of clothing, e.g., FLAPPERS and COWBOYS. :SEARCH-SUBDIVISION --CLOTHING & DRESS :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A].")
(UF "Accessories")
(UF "Apparel")
(UF "Dress")
(UF "Fashion")
(UF "Garments")
(UF "National costumes")
(BT "Objects")
(NT "Aprons")
(NT "Armor")
(NT "Bathing suits")
(NT "Bathrobes")
(NT "Belts (Clothing)")
(NT "Blazers")
(NT "Bloomers")
(NT "Breechcloths")
(NT "Buttons (Fasteners)")
(NT "Capes (Clothing)")
(NT "Chaps")
(NT "Chastity belts")
(NT "Coats")
(NT "Collars")
(NT "Costumes")
(NT "Crowns")
(NT "Diapers")
(NT "Diving suits")
(NT "Dresses")
(NT "Fans (Accessories)")
(NT "Footwear")
(NT "Fur garments")
(NT "Gloves")
(NT "Hair ornaments")
(NT "Handbags")
(NT "Handkerchiefs")
(NT "Headgear")
(NT "Hosiery")
(NT "Jewelry")
(NT "Kimonos")
(NT "Leather garments")
(NT "Leis")
(NT "Masks")
(NT "Maternity clothes")
(NT "Mittens")
(NT "Mourning clothing & dress")
(NT "Neckties")
(NT "Neckwear")
(NT "Paper garments")
(NT "Protective clothing")
(NT "Purses")
(NT "Robes")
(NT "Scarves")
(NT "Shawls")
(NT "Shirts")
(NT "Shirtwaists")
(NT "Skirts")
(NT "Sleepwear")
(NT "Sport clothes")
(NT "Suits (Clothing)")
(NT "Sweaters")
(NT "Trousers")
(NT "Tuxedoes")
(NT "Underwear")
(NT "Uniforms")
(NT "Veils")
(NT "Vestments")
(NT "Vests")
(NT "Waistcoats")
(NT "Wedding clothing & dress")
(NT "Wigs")
(RT "Blankets")
(RT "Bloody shirt")
(RT "Buckles")
(RT "Closets")
(RT "Clothing industry")
(RT "Clothing relief")
(RT "Corsages")
(RT "Cross dressing")
(RT "Dandies")
(RT "Dress reform")
(RT "Eye patches")
(RT "Fashion designers")
(RT "Fashion designs")
(RT "Fashion models")
(RT "Fashion shows")
(RT "Hairstyles")
(RT "Laundry")
(RT "Polka dots")
(RT "Staffs (Sticks)")
(RT "Umbrellas")
(RT "Undressing")
(RT "Velcro (Trademark)")
(RT "Wallets")
(RT "Zippers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002193")
(TNR "tgm002198"))


(CONCEPT
(NON-DESCRIPTOR "Clothing closets")
(USE "Closets")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002186")
(TNR "tgm002191"))


(CONCEPT
(DESCRIPTOR "Clothing industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(NT "Buttonhole industry")
(NT "Fashion industry")
(NT "Hat industry")
(NT "Hosiery industry")
(NT "Neckwear industry")
(NT "Shoe industry")
(NT "Shoestring industry")
(RT "Clothing & dress")
(RT "Clothing industry unions")
(RT "Mannequins")
(RT "Sewing")
(RT "Tailoring")
(RT "Textile industry")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002187")
(TNR "tgm002192"))


(CONCEPT
(DESCRIPTOR "Clothing industry strikes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Garment workers' strikes")
(BT "Strikes")
(RT "Clothing industry unions")
(RT "Textile industry strikes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002188")
(TNR "tgm002193"))


(CONCEPT
(DESCRIPTOR "Clothing industry unions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Labor unions")
(RT "Clothing industry")
(RT "Clothing industry strikes")
(RT "Textile industry unions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002189")
(TNR "tgm002194"))


(CONCEPT
(NON-DESCRIPTOR "Clothing reform")
(USE "Dress reform")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002190")
(TNR "tgm002195"))


(CONCEPT
(DESCRIPTOR "Clothing relief")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN ":SUBDIVIDE-BY :NATIONALITY only when relief provided to another :COUNTRY.")
(BT "Assistance")
(RT "Clothing & dress")
(RT "Disaster relief")
(RT "Disaster victims")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002191")
(TNR "tgm002196"))


(CONCEPT
(DESCRIPTOR "Clothing stores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Stores & shops")
(NT "Shoe stores")
(RT "Mannequins")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002192")
(TNR "tgm002197"))


(CONCEPT
(NON-DESCRIPTOR "Cloud seeding")
(USE "Rain making")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002194")
(TNR "tgm002199"))


(CONCEPT
(DESCRIPTOR "Clouds")
(BT "Natural phenomena")
(NT "Mushroom clouds")
(RT "Mists")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002195")
(TNR "tgm002200"))


(CONCEPT
(DESCRIPTOR "Clover")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Plants")
(NT "Four-leaf clovers")
(NT "Sweet clover")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012121"))


(CONCEPT
(DESCRIPTOR "Clowns")
(BT "Entertainers")
(RT "Circus performers")
(RT "Comedians")
(RT "Fools & jesters")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002196")
(TNR "tgm002201"))


(CONCEPT
(NON-DESCRIPTOR "Club women")
(USE "Clubwomen")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002197")
(TNR "tgm002202"))


(CONCEPT
(DESCRIPTOR "Clubhouses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Organizations' facilities")
(RT "Clubs")
(RT "Fraternal lodges")
(RT "Sports & recreation facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002198")
(TNR "tgm002203"))


(CONCEPT
(DESCRIPTOR "Clubs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --ORGANIZATIONS :USED-WITH :NAMES-OF racial, ethnic, and regional groups :USED-WITH :CLASSES-OF-PERSONS [Appendix A].")
(BT "Organizations")
(NT "4-H clubs")
(NT "Art clubs")
(NT "Athletic clubs")
(NT "Boat clubs")
(NT "Book clubs")
(NT "Camera clubs")
(NT "Country clubs")
(NT "Drama clubs")
(NT "Hunting & fishing clubs")
(NT "Motorcycle clubs")
(NT "USO clubs")
(RT "Charitable organizations")
(RT "Clubhouses")
(RT "Clubwomen")
(RT "Fraternal organizations")
(RT "Patriotic societies")
(CN ":DOUBLE-INDEX ORGANIZATIONS' FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002199")
(TNR "tgm002204"))


(CONCEPT
(DESCRIPTOR "Clubwomen")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For women identified as being active in formally established societies or clubs.")
(UF "Club women")
(BT "Women")
(RT "Clubs")
(RT "Socialites")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002200")
(TNR "tgm002205"))


(CONCEPT
(DESCRIPTOR "Clumsiness")
(BT "Behavior")
(RT "Accidents")
(RT "Falling")
(RT "Locomotion")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002201")
(TNR "tgm002206"))


(CONCEPT
(DESCRIPTOR "Coach drivers")
(UF "Carriage drivers")
(UF "Coachmen")
(BT "People associated with transportation")
(RT "Carriages & coaches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002202")
(TNR "tgm002207"))


(CONCEPT
(NON-DESCRIPTOR "Coach houses")
(USE "Carriage houses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002203")
(TNR "tgm002208"))


(CONCEPT
(NON-DESCRIPTOR "Coaches")
(USE "Carriages & coaches")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002204")
(TNR "tgm002209"))


(CONCEPT
(DESCRIPTOR "Coaches (Athletics)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with entertainment & sports")
(RT "Coaching (Athletics)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002205")
(TNR "tgm002210"))


(CONCEPT
(DESCRIPTOR "Coaching (Athletics)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Teaching")
(RT "Athletes")
(RT "Coaches (Athletics)")
(RT "Physical education")
(RT "Sports")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002206")
(TNR "tgm002211"))


(CONCEPT
(NON-DESCRIPTOR "Coachmen")
(USE "Coach drivers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002207")
(TNR "tgm002212"))


(CONCEPT
(DESCRIPTOR "Coal")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fuel")
(BT "Minerals")
(NT "Coke")
(RT "Burning coal veins")
(RT "Coal mining")
(RT "Coalholes")
(RT "Ore industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002208")
(TNR "tgm002213"))


(CONCEPT
(NON-DESCRIPTOR "Coal hole")
(USE "Coalholes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002209")
(TNR "tgm002214"))


(CONCEPT
(DESCRIPTOR "Coal miners")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Miners")
(RT "Coal mining")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002210")
(TNR "tgm002215"))


(CONCEPT
(DESCRIPTOR "Coal mining")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and sites.")
(UF "Anthracite mining")
(UF "Breakers (Machinery)")
(BT "Mining")
(RT "Black lung")
(RT "Coal")
(RT "Coal miners")
(RT "Miners' strikes")
(CN ":DOUBLE-INDEX STRIP MINING, as appropriate. Used in a note under  STRIP MINING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002211")
(TNR "tgm002216"))


(CONCEPT
(DESCRIPTOR "Coalholes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "An opening in a sidewalk leading to a coal bin or a compartment for storing coal.")
(UF "Coal hole")
(BT "Architectural elements")
(RT "Coal")
(RT "Storage facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002212")
(TNR "tgm002217"))


(CONCEPT
(DESCRIPTOR "Coalition (Social sciences)")
(UF "Alliances, Temporary")
(BT "Power (Social sciences)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002213")
(TNR "tgm002218"))


(CONCEPT
(DESCRIPTOR "Coaster cars")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Automobiles, Coaster")
(UF "Soap box derby racers")
(BT "Vehicles")
(RT "Racing automobiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002214")
(TNR "tgm002219"))


(CONCEPT
(DESCRIPTOR "Coastlines")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Coasts")
(UF "Shorelines")
(BT "Physical geographic features")
(RT "Beaches")
(RT "Waterfronts")
(HN "Changed 06/2001; formerly a non-postable term under WATERFRONTS and CAPES (COASTS).; AAT: identical")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002215")
(TNR "tgm002220"))


(CONCEPT
(NON-DESCRIPTOR "Coasts")
(USE "Coastlines")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002216")
(TNR "tgm002221"))


(CONCEPT
(DESCRIPTOR "Coats")
(UF "Jackets")
(UF "Overcoats")
(BT "Clothing & dress")
(NT "Fur coats")
(NT "Raincoats")
(NT "Tail coats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002217")
(TNR "tgm002222"))


(CONCEPT
(DESCRIPTOR "Coats of arms")
(SN "Heraldic bearings, usually depicted on an escutcheon often with a crest, motto, or other adjuncts.")
(UF "Armorial bearings")
(UF "Heraldic devices")
(BT "Emblems")
(RT "Armorial bookplates")
(RT "Escutcheons (Heraldry)")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000220")
(FCNlctgm "lctgm002218")
(TNR "tgm002223"))


(CONCEPT
(NON-DESCRIPTOR "Cobblers")
(USE "Shoemakers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002219")
(TNR "tgm002224"))


(CONCEPT
(NON-DESCRIPTOR "Cobblestone roads")
(USE "Cobblestone streets")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002220")
(TNR "tgm002225"))


(CONCEPT
(DESCRIPTOR "Cobblestone streets")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cobblestone roads")
(BT "Streets")
(HN "Changed 1/1993 from COBBLESTONE ROADS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002221")
(TNR "tgm002226"))


(CONCEPT
(DESCRIPTOR "Cobras")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Snakes")
(NT "Snake charming")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012122"))


(CONCEPT
(DESCRIPTOR "Cobwebs")
(UF "Spiderwebs")
(BT "Objects")
(RT "Spiders")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002222")
(TNR "tgm002227"))


(CONCEPT
(DESCRIPTOR "Cocaine")
(UF "Crack (Cocaine)")
(BT "Narcotics")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002223")
(TNR "tgm002228"))


(CONCEPT
(DESCRIPTOR "Cockatoos")
(GEO-FACET ":COUNTRY :STATE")
(BT "Parrots")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002224")
(TNR "tgm002229"))


(CONCEPT
(DESCRIPTOR "Cockfighting")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animal fighting")
(BT "Sports")
(RT "Birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002225")
(TNR "tgm002230"))


(CONCEPT
(NON-DESCRIPTOR "Cocktail waitresses")
(USE "Waitresses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002226")
(TNR "tgm002231"))


(CONCEPT
(NON-DESCRIPTOR "Cocktails")
(USE "Alcoholic beverages")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002227")
(TNR "tgm002232"))


(CONCEPT
(DESCRIPTOR "Cocoa industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Food industry")
(RT "Cacao")
(RT "Chocolate industry")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002228")
(TNR "tgm002233"))


(CONCEPT
(NON-DESCRIPTOR "Coconut palms")
(USE "Palms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002229")
(TNR "tgm002234"))


(CONCEPT
(DESCRIPTOR "Coconut plantations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Plantations")
(RT "Coconuts")
(RT "Palms")
(CN ":DOUBLE-INDEX HARVESTING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002230")
(TNR "tgm002235"))


(CONCEPT
(DESCRIPTOR "Coconuts")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fruit")
(RT "Coconut plantations")
(RT "Palms")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002231")
(TNR "tgm002236"))


(CONCEPT
(DESCRIPTOR "Codfish")
(GEO-FACET ":COUNTRY :STATE")
(BT "Fish")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002232")
(TNR "tgm002237"))


(CONCEPT
(NON-DESCRIPTOR "Codicils")
(USE "Wills")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002233")
(TNR "tgm002238"))


(CONCEPT
(DESCRIPTOR "Coffee")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes the activity of coffee drinking.")
(BT "Beverages")
(RT "Coffee cups")
(RT "Coffee plantations")
(RT "Coffee plants")
(RT "Coffeehouses")
(RT "Coffeepots")
(CN ":DOUBLE-INDEX EATING & DRINKING for the activity of coffee drinking.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002234")
(TNR "tgm002239"))


(CONCEPT
(NON-DESCRIPTOR "Coffee breaks")
(USE "Rest periods")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002235")
(TNR "tgm002240"))


(CONCEPT
(DESCRIPTOR "Coffee cups")
(BT "Drinking vessels")
(RT "Coffee")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002236")
(TNR "tgm002241"))


(CONCEPT
(DESCRIPTOR "Coffee industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Beverage industry")
(RT "Coffee plantations")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002237")
(TNR "tgm002242"))


(CONCEPT
(DESCRIPTOR "Coffee plantations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Plantations")
(RT "Coffee")
(RT "Coffee industry")
(RT "Coffee plants")
(CN ":DOUBLE-INDEX HARVESTING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002238")
(TNR "tgm002243"))


(CONCEPT
(DESCRIPTOR "Coffee plants")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Plants")
(RT "Coffee")
(RT "Coffee plantations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002239")
(TNR "tgm002244"))


(CONCEPT
(NON-DESCRIPTOR "Coffee pots")
(USE "Coffeepots")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002240")
(TNR "tgm002245"))


(CONCEPT
(DESCRIPTOR "Coffee tables")
(UF "Tables, Coffee")
(BT "Tables")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002241")
(TNR "tgm002246"))


(CONCEPT
(DESCRIPTOR "Coffeehouses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Enterprises serving coffee and other refreshments, and that commonly serve as an informal club or forum for political discussion.")
(BT "Eating & drinking facilities")
(RT "Cafes")
(RT "Coffee")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002242")
(TNR "tgm002247"))


(CONCEPT
(DESCRIPTOR "Coffeepots")
(UF "Coffee pots")
(BT "Containers")
(RT "Coffee")
(RT "Teapots")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002243")
(TNR "tgm002248"))


(CONCEPT
(DESCRIPTOR "Coffers (Ceilings)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For recessed panels, especially forming with other panels a continuous pattern in a vault, ceiling, or soffit.")
(UF "Cassons")
(BT "Architectural elements")
(NT "Dome coffers")
(RT "Ceilings")
(RT "Paneling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002244")
(TNR "tgm002249"))


(CONCEPT
(DESCRIPTOR "Coffins")
(UF "Caskets")
(BT "Containers")
(NT "Sarcophagi")
(RT "Catafalques")
(RT "Dead persons")
(RT "Funeral rites & ceremonies")
(RT "Lying in state")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002245")
(TNR "tgm002250"))


(CONCEPT
(NON-DESCRIPTOR "Cog railroads")
(USE "Mountain railroads")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002246")
(TNR "tgm002251"))


(CONCEPT
(NON-DESCRIPTOR "Cogwheels")
(USE "Gearing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002247")
(TNR "tgm002252"))


(CONCEPT
(NON-DESCRIPTOR "Coiffures")
(USE "Hairstyles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002248")
(TNR "tgm002253"))


(CONCEPT
(NON-DESCRIPTOR "Coigns")
(USE "Quoins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002249")
(TNR "tgm002254"))


(CONCEPT
(NON-DESCRIPTOR "Coillons")
(USE "Quoins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002250")
(TNR "tgm002255"))


(CONCEPT
(DESCRIPTOR "Coin banks")
(UF "Piggy banks")
(BT "Containers")
(RT "Banks")
(RT "Coins")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002251")
(TNR "tgm002256"))


(CONCEPT
(DESCRIPTOR "Coin counting machines")
(SN "Device used in banks, mints, and financial institutions for counting coins.")
(UF "Counting devices")
(BT "Machinery")
(RT "Counting")
(RT "Weights & measures")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002252")
(TNR "tgm002257"))


(CONCEPT
(DESCRIPTOR "Coin operated machines")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Machines, Coin operated")
(BT "Machinery")
(NT "Jukeboxes")
(NT "Pinball machines")
(NT "Slot machines")
(NT "Vending machines")
(RT "Automats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002253")
(TNR "tgm002258"))


(CONCEPT
(NON-DESCRIPTOR "Coin purses")
(USE "Purses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002254")
(TNR "tgm002259"))


(CONCEPT
(NON-DESCRIPTOR "Coin-operated binoculars")
(USE "Viewing scopes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002257")
(TNR "tgm002262"))


(CONCEPT
(DESCRIPTOR "Coins")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE")
(UF "Specie")
(BT "Money")
(RT "Coin banks")
(RT "Silver question")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002255")
(TNR "tgm002260"))


(CONCEPT
(NON-DESCRIPTOR "Coins (Wall components)")
(USE "Quoins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002256")
(TNR "tgm002261"))


(CONCEPT
(DESCRIPTOR "Coke")
(BT "Coal")
(RT "Coke industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002258")
(TNR "tgm002263"))


(CONCEPT
(DESCRIPTOR "Coke industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(RT "Coke")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002259")
(TNR "tgm002264"))


(CONCEPT
(DESCRIPTOR "Cold")
(BT "Natural phenomena")
(RT "Heat")
(RT "Ice")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002260")
(TNR "tgm002265"))


(CONCEPT
(DESCRIPTOR "Cold storage")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Process of preserving perishables by storing them at low temperatures.")
(BT "Processes & techniques")
(RT "Refrigerators")
(RT "Storage facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002261")
(TNR "tgm002266"))


(CONCEPT
(DESCRIPTOR "Cold-frames")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "An outdoor shallow rectangular frame of boards or concrete with a usually glass cover to protect small plants from wind and low temperature especially early in the growing season.")
(BT "Equipment")
(RT "Gardening")
(RT "Greenhouses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002262")
(TNR "tgm002267"))


(CONCEPT
(DESCRIPTOR "Coleus")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Plants")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012123"))


(CONCEPT
(NON-DESCRIPTOR "Collaboration")
(USE "Fraternization")
(CN "Used only as a subdivision with :NAMES-OF :NAME-OF-WAR [Appendix C].")
(FUN "Formerly TGMI term [nonpostable].")
(TTCRef "Reference [MARC 150]")
(FCNlctgm "lctgm002263")
(TNR "tgm002268"))


(CONCEPT
(DESCRIPTOR "Collages")
(SN "Mixed media constructions in which bits of relatively flat materials, such as newspaper or cloth, or three-dimensional objects, are fixed to a support for symbolic or suggestive effect.")
(BT "Pictures")
(RT "Mixed media")
(RT "Montages")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000221")
(FCNlctgm "lctgm002264")
(TNR "tgm002269"))


(CONCEPT
(DESCRIPTOR "Collagraphs")
(SN "Prints made from blocks or plates on which the image has been built up with a collage of various materials and objects.  May be printed in intaglio or relief.")
(UF "Collographs")
(BT "Prints")
(RT "Intaglio prints")
(RT "Relief prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000222")
(FCNlctgm "lctgm002265")
(TNR "tgm002270"))


(CONCEPT
(NON-DESCRIPTOR "Collapse of bridges")
(USE "Bridge failures")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002266")
(TNR "tgm002271"))


(CONCEPT
(NON-DESCRIPTOR "Collapse of buildings")
(USE "Building failures")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002267")
(TNR "tgm002272"))


(CONCEPT
(NON-DESCRIPTOR "Collapse of piers & wharves")
(USE "Pier & wharf failures")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002268")
(TNR "tgm002273"))


(CONCEPT
(DESCRIPTOR "Collars")
(BT "Clothing & dress")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002269")
(TNR "tgm002274"))


(CONCEPT
(DESCRIPTOR "Collecting cards")
(SN "Cards issued to be sold singly, in strips, or in other sets for collecting and trading. Not available as premiums; not intended to be advertisements. Examples include cards illustrating movie stars, or wild flowers. Use TRADE CARDS for advertising cards enclosed with products.")
(UF "Trading cards")
(BT "Cards")
(NT "Album cards")
(RT "Advertising cards")
(RT "Bible cards")
(RT "Comic cards")
(RT "Devotional images")
(RT "Sports cards")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000223")
(FCNlctgm "lctgm002270")
(TNR "tgm002275"))


(CONCEPT
(DESCRIPTOR "Collective farms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Collectives")
(BT "Farms")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002271")
(TNR "tgm002276"))


(CONCEPT
(NON-DESCRIPTOR "Collective security")
(USE "International security")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002272")
(TNR "tgm002277"))


(CONCEPT
(DESCRIPTOR "Collective settlements")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For formally organized communal ventures, usually based on ideological, political, or religious affiliation.")
(UF "Collectives")
(UF "Communal settlements")
(UF "Utopian communities")
(BT "Settlements")
(RT "Artist colonies")
(RT "Cooperatives")
(RT "Cults")
(RT "Religious communities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002273")
(TNR "tgm002278"))


(CONCEPT
(NON-DESCRIPTOR "Collectives")
(USE "Collective farms")
(USE "Collective settlements")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002274")
(TNR "tgm002279"))


(CONCEPT
(DESCRIPTOR "Collectors")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(NT "Art collectors")
(RT "Hobbyists")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002275")
(TNR "tgm002280"))


(CONCEPT
(DESCRIPTOR "Collectors' marks")
(BT "Ownership marks")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000224")
(FCNlctgm "lctgm002276")
(TNR "tgm002281"))


(CONCEPT
(DESCRIPTOR "College administrators")
(UF "College officials")
(UF "University administrators")
(BT "People associated with education & communication")
(NT "College presidents")
(RT "Universities & colleges")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002277")
(TNR "tgm002282"))


(CONCEPT
(NON-DESCRIPTOR "College fraternities")
(USE "Fraternities & sororities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002278")
(TNR "tgm002283"))


(CONCEPT
(NON-DESCRIPTOR "College officials")
(USE "College administrators")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002279")
(TNR "tgm002284"))


(CONCEPT
(DESCRIPTOR "College presidents")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "University presidents")
(BT "College administrators")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002280")
(TNR "tgm002285"))


(CONCEPT
(NON-DESCRIPTOR "College students")
(USE "Students")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002281")
(TNR "tgm002286"))


(CONCEPT
(NON-DESCRIPTOR "College unions")
(USE "Student unions")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002282")
(TNR "tgm002287"))


(CONCEPT
(NON-DESCRIPTOR "College, Electoral")
(USE "Electoral college")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002284")
(TNR "tgm002289"))


(CONCEPT
(NON-DESCRIPTOR "Colleges")
(USE "Universities & colleges")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002283")
(TNR "tgm002288"))


(CONCEPT
(DESCRIPTOR "Collies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Dogs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002285")
(TNR "tgm002290"))


(CONCEPT
(NON-DESCRIPTOR "Collisions")
(USE "Accidents")
(USE "Disasters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002286")
(TNR "tgm002291"))


(CONCEPT
(NON-DESCRIPTOR "Collodio-chloride prints")
(USE "Collodion printing-out paper prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000230")
(FCNlctgm "lctgm002293")
(TNR "tgm002298"))


(CONCEPT
(NON-DESCRIPTOR "Collodion dry plate negatives")
(USE "Dry collodion negatives")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000225")
(FCNlctgm "lctgm002287")
(TNR "tgm002292"))


(CONCEPT
(NON-DESCRIPTOR "Collodion negatives")
(USE "Dry collodion negatives")
(USE "Wet collodion negatives")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000226")
(FCNlctgm "lctgm002288")
(TNR "tgm002293"))


(CONCEPT
(NON-DESCRIPTOR "Collodion positive photographs")
(USE "Ambrotypes")
(USE "Cloth photographs")
(USE "Collodion transparencies")
(USE "Leather photographs")
(USE "Tintypes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000227")
(FCNlctgm "lctgm0022890")
(TNR "tgm002294"))


(CONCEPT
(NON-DESCRIPTOR "Collodion printing-out paper photoprints")
(USE "Collodion printing-out paper prints")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002290")
(TNR "tgm002295"))


(CONCEPT
(DESCRIPTOR "Collodion printing-out paper prints")
(SN "Available in the 1860s but not popular until late 1880s; chief commercial portrait medium 1895-1910.  Glossy version has warm image hues while the matte version, which dominated from the mid-1890s, has near-neutral image hues. Usually toned with gold or platinum so that images show little or no fading.  They do not exhibit silver mirroring.")
(UF "Collodio-chloride prints")
(UF "Collodion printing-out paper photoprints")
(BT "Silver printing-out paper prints")
(NT "Aristotypes")
(CN "Glossy collodion prints are virtually indistinguishable from SILVER GELATIN PRINTING-OUT PAPER PRINTS by visual inspection.  If in doubt, use SILVER PRINTING-OUT PAPER PRINTS.  Used in a note under SILVER GELATIN PRINTING-OUT PAPER PRINTS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000228")
(FCNlctgm "lctgm002291")
(TNR "tgm002296"))


(CONCEPT
(DESCRIPTOR "Collodion transparencies")
(SN "Typically, glass stereographs or lantern slides; used 1850s-1890s.")
(UF "Collodion positive photographs")
(BT "Glass transparencies")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000229")
(FCNlctgm "lctgm002292")
(TNR "tgm002297"))


(CONCEPT
(NON-DESCRIPTOR "Collographs")
(USE "Collagraphs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000231")
(FCNlctgm "lctgm002294")
(TNR "tgm002299"))


(CONCEPT
(DESCRIPTOR "Collonnettes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Conspicuously small columns.")
(BT "Columns")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002295")
(TNR "tgm002300"))


(CONCEPT
(DESCRIPTOR "Collotypes")
(SN "Photomechanical prints introduced commercially in the 1860s; commonly used in book illustration; can be difficult to distinguish from actual photographs.")
(UF "Albertypes")
(UF "Artotypes")
(UF "Heliotypes")
(BT "Photomechanical prints")
(CN "Used in a note under PHOTOGRAPHIC PRINTS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000232")
(FCNlctgm "lctgm002296")
(TNR "tgm002301"))


(CONCEPT
(NON-DESCRIPTOR "Colonialism")
(USE "Imperialism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002297")
(TNR "tgm002302"))


(CONCEPT
(DESCRIPTOR "Colonies")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "For the subject of colonies and colonialism.")
(BT "Settlements")
(NT "Artist colonies")
(RT "Colonists")
(RT "Emigration & immigration")
(RT "National liberation movements")
(RT "White man's burden")
(CN ":SUBDIVIDE-BY colonizing :COUNTRY.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002298")
(TNR "tgm002303"))


(CONCEPT
(NON-DESCRIPTOR "Colonies, Artist")
(USE "Artist colonies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002299")
(TNR "tgm002304"))


(CONCEPT
(DESCRIPTOR "Colonists")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "People")
(RT "Colonies")
(RT "Emigration & immigration")
(RT "Frontier & pioneer life")
(CN "Used in a note under COLONIES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002300")
(TNR "tgm002305"))


(CONCEPT
(DESCRIPTOR "Colonnades")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Rows of columns supporting an entablature.")
(BT "Architectural elements")
(NT "Peristyles")
(RT "Columns")
(RT "Entablatures")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002301")
(TNR "tgm002306"))


(CONCEPT
(NON-DESCRIPTOR "Color circles")
(USE "Color wheels")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000233")
(FCNlctgm "lctgm002302")
(TNR "tgm002307"))


(CONCEPT
(NON-DESCRIPTOR "Color guards")
(USE "Flag bearers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002303")
(TNR "tgm002308"))


(CONCEPT
(NON-DESCRIPTOR "Color in architecture")
(USE "Polychromy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002304")
(TNR "tgm002309"))


(CONCEPT
(NON-DESCRIPTOR "Color screen transparencies")
(USE "Screen color film transparencies")
(USE "Screen color glass transparencies")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000234")
(FCNlctgm "lctgm002305")
(TNR "tgm002310"))


(CONCEPT
(DESCRIPTOR "Color separation negatives")
(UF "Separation negatives")
(BT "Film negatives")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000235")
(FCNlctgm "lctgm002306")
(TNR "tgm002311"))


(CONCEPT
(DESCRIPTOR "Color separation positives")
(SN "Transparencies, usually in sets of three films. Each is used to make a plate for printing one
color, in register with the others, to form a full-color photomechanical print. [AAT]")
(UF "Color separation transparencies")
(UF "Positives, Color separation")
(UF "Postitives, Color separation")
(UF "Postives, Color separation")
(UF "Separation positives, Color")
(UF "Separation transparencies, Color")
(BT "Film transparencies")
(HN "Changed 6/94. Formerly, COLOR SEPARATION POSITIVES may have been indexed as
COLOR SEPARATION TRANSPARENCIES.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000236")
(FCNlctgm "lctgm002307")
(TNR "tgm002312"))


(CONCEPT
(NON-DESCRIPTOR "Color separation transparencies")
(USE "Color separation positives")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000237")
(FCNlctgm "lctgm002308")
(TNR "tgm002313"))


(CONCEPT
(DESCRIPTOR "Color wheels")
(SN "Vertical wheels on which colored paper disks are mounted to illustrate the arrangement of the hues of the spectrum in the order in which they appear in nature; frequently found with architectural drawings and other design work.")
(UF "Color circles")
(UF "Wheels, Color")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000238")
(FCNlctgm "lctgm002309")
(TNR "tgm002314"))


(CONCEPT
(NON-DESCRIPTOR "Coloring")
(USE "Dyeing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002310")
(TNR "tgm002315"))


(CONCEPT
(DESCRIPTOR "Colors")
(BT "Physical characteristics")
(RT "Polychromy")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002311")
(TNR "tgm002316"))


(CONCEPT
(NON-DESCRIPTOR "Colportage")
(USE "Bookselling")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002312")
(TNR "tgm002317"))


(CONCEPT
(NON-DESCRIPTOR "Colts")
(USE "Horses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002313")
(TNR "tgm002318"))


(CONCEPT
(DESCRIPTOR "Columbines")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Flowers")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012119"))


(CONCEPT
(DESCRIPTOR "Columns")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes both supporting pillars and free-standing shafts.")
(UF "Pillars")
(BT "Architectural elements")
(NT "Collonnettes")
(RT "Architectural orders")
(RT "Colonnades")
(RT "Distyle-in-antis buildings")
(RT "Obelisks")
(RT "Pedestals")
(RT "Pilasters")
(RT "Totem poles")
(CN "Used in a note under ARCHITECTURAL ORDERS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002314")
(TNR "tgm002319"))


(CONCEPT
(NON-DESCRIPTOR "Combat")
(USE "Campaigns & battles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002315")
(TNR "tgm002320"))


(CONCEPT
(NON-DESCRIPTOR "Combination prints")
(USE "Composite photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000239")
(FCNlctgm "lctgm002316")
(TNR "tgm002321"))


(CONCEPT
(DESCRIPTOR "Combines (Agricultural machinery)")
(BT "Harvesting machinery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002317")
(TNR "tgm002322"))


(CONCEPT
(DESCRIPTOR "Combs")
(BT "Dressing & grooming equipment")
(RT "Hairdressing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002318")
(TNR "tgm002323"))


(CONCEPT
(DESCRIPTOR "Comedians")
(BT "Entertainers")
(RT "Clowns")
(RT "Comedies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002319")
(TNR "tgm002324"))


(CONCEPT
(DESCRIPTOR "Comedies")
(SN "For images representing dramatic productions or scenes (theatrical, film, radio, or television) which have humorous or amusing intent.")
(BT "Entertainment")
(RT "Comedians")
(RT "Motion pictures")
(RT "Musical revues & comedies")
(RT "Radio broadcasting")
(RT "Television programs")
(RT "Theatrical productions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002320")
(TNR "tgm002325"))


(CONCEPT
(NON-DESCRIPTOR "Comedies, Musical")
(USE "Musical revues & comedies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002321")
(TNR "tgm002326"))


(CONCEPT
(DESCRIPTOR "Comets")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Celestial bodies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002322")
(TNR "tgm002327"))


(CONCEPT
(NON-DESCRIPTOR "Comfort stations")
(USE "Public comfort stations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002323")
(TNR "tgm002328"))


(CONCEPT
(DESCRIPTOR "Comic books")
(SN "Cartoon strips in pamphlet form; usually periodicals.")
(BT "Comics")
(RT "Adventure comics")
(RT "Periodicals")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000240")
(FCNlctgm "lctgm002324")
(TNR "tgm002329"))


(CONCEPT
(DESCRIPTOR "Comic cards")
(SN "Cards, issued individually or in sets, that bear a caricature or cartoon.  Popular 1850s-1900.  This term does not include postcards.")
(BT "Cards")
(BT "Cartoons (Commentary)")
(RT "Collecting cards")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000241")
(FCNlctgm "lctgm002325")
(TNR "tgm002330"))


(CONCEPT
(NON-DESCRIPTOR "Comic characters")
(USE "Fictitious characters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002326")
(TNR "tgm002331"))


(CONCEPT
(NON-DESCRIPTOR "Comic pictures")
(USE "Cartoons (Commentary)")
(USE "Humorous pictures")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000242")
(FCNlctgm "lctgm002327")
(TNR "tgm002332"))


(CONCEPT
(NON-DESCRIPTOR "Comic strips")
(USE "Comics")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000243")
(FCNlctgm "lctgm002328")
(TNR "tgm002333"))


(CONCEPT
(DESCRIPTOR "Comics")
(SN "Sequences of cartoons with a story line laid out in a series of pictorial panels across a page or sheet and concerning a continuous character or set of characters.")
(UF "Cartoon strips")
(UF "Comic strips")
(BT "Cartoons (Commentary)")
(NT "Adventure comics")
(NT "Children's comics")
(NT "Comic books")
(NT "Underground comics")
(HN "Changed 10/90.  Formerly, COMICS may have been indexed as CARTOON STRIPS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000244")
(FCNlctgm "lctgm002329")
(TNR "tgm002334"))


(CONCEPT
(NON-DESCRIPTOR "Coming out")
(USE "Debutantes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002330")
(TNR "tgm002335"))


(CONCEPT
(NON-DESCRIPTOR "Command of troops")
(USE "Military leadership")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002331")
(TNR "tgm002336"))


(CONCEPT
(DESCRIPTOR "Commemorations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Acts in honor or remembrance of an individual, a category of persons, or an event. :SEARCH-SUBDIVISION --COMMEMORATION :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A]; with :NAMES-OF :NAMED-PERSON [Appendix B]; with :NAMES-OF :NAME-OF-WAR [Appendix C]; :USED-WITH :CORPORATE-BODY :NAMED-EVENT [Appendix D].")
(BT "Events")
(RT "Anniversaries")
(RT "Celebrations")
(RT "Historical reenactments")
(RT "Impersonation")
(RT "Memorial rites & ceremonies")
(RT "Reunions")
(RT "Vigils")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002332")
(TNR "tgm002337"))


(CONCEPT
(DESCRIPTOR "Commemorative prints")
(SN "Prints bearing an allegorical or narrative image commemorating an important event or occasion, such as a decisive battle or the founding of an institution. Usually text on the print indicates its commemorative nature, e.g., in honor of, in memory of. Use MEMORIAL WORKS for death memorials.")
(BT "Prints")
(RT "Keepsakes")
(RT "Memorial works")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000245")
(FCNlctgm "lctgm002333")
(TNR "tgm002338"))


(CONCEPT
(NON-DESCRIPTOR "Commencements")
(USE "Graduation ceremonies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002334")
(TNR "tgm002339"))


(CONCEPT
(DESCRIPTOR "Commerce")
(GEO-FACET ":NATIONALITY ")
(SN ":SEARCH-SUBDIVISION --COMMERCE :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A].")
(UF "Exports")
(UF "Foreign trade")
(UF "Imports")
(UF "Trade")
(BT "Business & finance")
(NT "Auctions")
(NT "Barter")
(NT "Black market")
(NT "Child trafficking")
(NT "Free trade & protection")
(NT "Fur trade")
(NT "International competition")
(NT "Merchandise exchanges")
(NT "Prostitution")
(NT "Secondhand sales")
(NT "Selling")
(NT "Shopping")
(NT "Slave trade")
(NT "Stock market")
(NT "Tourism")
(RT "Boycotts")
(RT "Business enterprises")
(RT "Caravans")
(RT "Commercial organizations")
(RT "Commercialism")
(RT "Consuls")
(RT "Consumers")
(RT "Customhouses")
(RT "Embargoes")
(RT "Shipping")
(RT "Surplus commodities")
(RT "Tariffs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002335")
(TNR "tgm002340"))


(CONCEPT
(NON-DESCRIPTOR "Commercial art design drawings")
(USE "Graphic design drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000246")
(FCNlctgm "lctgm002336")
(TNR "tgm002341"))


(CONCEPT
(DESCRIPTOR "Commercial art galleries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Art galleries, Commercial")
(BT "Mercantile facilities")
(RT "Art dealers")
(RT "Galleries & museums")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002337")
(TNR "tgm002342"))


(CONCEPT
(NON-DESCRIPTOR "Commercial buildings")
(USE "Commercial facilities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002338")
(TNR "tgm002343"))


(CONCEPT
(NON-DESCRIPTOR "Commercial catalogs")
(USE "Sales catalogs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000247")
(FCNlctgm "lctgm002339")
(TNR "tgm002344"))


(CONCEPT
(NON-DESCRIPTOR "Commercial districts")
(USE "Business districts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002340")
(TNR "tgm002345"))


(CONCEPT
(DESCRIPTOR "Commercial facilities")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For facilities associated with the various activities involved in conducting business or trade.")
(UF "Commercial buildings")
(BT "Facilities")
(NT "Business districts")
(NT "Eating & drinking facilities")
(NT "Financial facilities")
(NT "Mercantile facilities")
(NT "Motion picture studios")
(NT "Service industry facilities")
(RT "Business & finance")
(RT "Business enterprises")
(RT "Office buildings")
(RT "Parking garages")
(HN "Changed 2/1993 from COMMERCIAL BUILDINGS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002341")
(TNR "tgm002346"))


(CONCEPT
(NON-DESCRIPTOR "Commercial garages")
(USE "Automobile service stations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002342")
(TNR "tgm002347"))


(CONCEPT
(DESCRIPTOR "Commercial organizations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Organizations")
(NT "Boards of trade")
(NT "Business enterprises")
(NT "Chambers of commerce")
(NT "Cooperatives")
(NT "Industry")
(NT "Interlocking directorates")
(RT "Commerce")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002343")
(TNR "tgm002348"))


(CONCEPT
(NON-DESCRIPTOR "Commercial radio")
(USE "Radio broadcasting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002344")
(TNR "tgm002349"))


(CONCEPT
(DESCRIPTOR "Commercial streets")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Streets")
(RT "Business districts")
(RT "Shopping")
(HN "Made postable 2/90. Earlier cataloging used STREETS and/or BUSINESS ENTERPRISES or COMMERCIAL BUILDINGS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002345")
(TNR "tgm002350"))


(CONCEPT
(DESCRIPTOR "Commercialism")
(SN "Excessive emphasis on profit or financial success.")
(BT "Economic & political systems")
(RT "Commerce")
(RT "War profiteering")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002346")
(TNR "tgm002351"))


(CONCEPT
(NON-DESCRIPTOR "Commercials")
(USE "Television advertising")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002347")
(TNR "tgm002352"))


(CONCEPT
(NON-DESCRIPTOR "Commissaries, Military")
(USE "Military exchanges")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002348")
(TNR "tgm002353"))


(CONCEPT
(NON-DESCRIPTOR "Commissions of inquiry")
(USE "Governmental investigations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002349")
(TNR "tgm002354"))


(CONCEPT
(NON-DESCRIPTOR "Committee rooms")
(USE "Conference rooms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002350")
(TNR "tgm002355"))


(CONCEPT
(DESCRIPTOR "Committees")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Body of persons appointed for a special function.")
(BT "Organizations")
(RT "Delegations")
(RT "Governmental investigations")
(RT "Juries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002351")
(TNR "tgm002356"))


(CONCEPT
(NON-DESCRIPTOR "Commodes (Washstands)")
(USE "Washstands")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002352")
(TNR "tgm002357"))


(CONCEPT
(NON-DESCRIPTOR "Commodities, Surplus")
(USE "Surplus commodities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002353")
(TNR "tgm002358"))


(CONCEPT
(DESCRIPTOR "Commodity exchanges")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Exchanges")
(UF "Produce exchanges")
(BT "Financial facilities")
(RT "Merchants' exchanges")
(RT "Stock exchanges")
(CN ":DOUBLE-INDEX the industry.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002354")
(TNR "tgm002359"))


(CONCEPT
(NON-DESCRIPTOR "Common graves")
(USE "Mass burials")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002355")
(TNR "tgm002360"))


(CONCEPT
(NON-DESCRIPTOR "Common markets")
(USE "International economic integration")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002356")
(TNR "tgm002361"))


(CONCEPT
(NON-DESCRIPTOR "Commons (Social order)")
(USE "Working class")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002357")
(TNR "tgm002362"))


(CONCEPT
(NON-DESCRIPTOR "Communal settlements")
(USE "Collective settlements")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002358")
(TNR "tgm002363"))


(CONCEPT
(DESCRIPTOR "Communicable diseases")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Illnesses caused by living beings (both microscopic or submicroscopic, such as viruses, bacteria, and protozoa, and visible, such as certain disease-producing mites and worms) that invade the body.")
(UF "Contagious diseases")
(UF "Epidemics")
(UF "Infectious diseases")
(UF "Pestilences")
(BT "Diseases")
(NT "AIDS (Disease)")
(NT "Cholera")
(NT "Hookworm disease")
(NT "Influenza")
(NT "Leprosy")
(NT "Malaria")
(NT "Measles")
(NT "Plague")
(NT "Pneumonia")
(NT "Poliomyelitis")
(NT "Rabies")
(NT "Sexually transmitted diseases")
(NT "Smallpox")
(NT "Trench mouth")
(NT "Tuberculosis")
(NT "Typhoid fever")
(NT "Typhus fever")
(NT "Yellow fever")
(RT "Antitoxins")
(RT "Quarantines")
(RT "Vaccinations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002359")
(TNR "tgm002364"))


(CONCEPT
(DESCRIPTOR "Communication")
(SN ":SEARCH-SUBDIVISION --COMMUNICATION :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP, and :CLASSES-OF-PERSONS [Appendix A]. :SEARCH-SUBDIVISION --COMMUNICATIONS :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(BT "Activities")
(NT "Advertising")
(NT "Announcing")
(NT "Bragging")
(NT "Broadcasting")
(NT "Censorship")
(NT "Cheering")
(NT "Classified defense information")
(NT "Complaining")
(NT "Confessions")
(NT "Contract negotiations")
(NT "Conversation")
(NT "Correspondence")
(NT "Criticism")
(NT "Crying")
(NT "Cursing")
(NT "Debates")
(NT "Declarations of war")
(NT "Discussion")
(NT "Filibustering")
(NT "Flattery")
(NT "Gestures")
(NT "Gossiping")
(NT "Hog calling")
(NT "Hugging")
(NT "International communication")
(NT "Interstellar communication")
(NT "Interviews")
(NT "Joking")
(NT "Journalism")
(NT "Kissing")
(NT "Language")
(NT "Laughter")
(NT "Negotiating")
(NT "Newspaper headlines")
(NT "Peace negotiations")
(NT "Petitions")
(NT "Plays on words")
(NT "Pleading (Begging)")
(NT "Press")
(NT "Press conferences")
(NT "Proclamations")
(NT "Promises")
(NT "Propaganda")
(NT "Proverbs")
(NT "Public opinion")
(NT "Public opinion polls")
(NT "Public speaking")
(NT "Publicity")
(NT "Questioning")
(NT "Reminiscing")
(NT "Resolutions")
(NT "Rumor")
(NT "Screaming")
(NT "Shouting")
(NT "Sign language")
(NT "Signaling")
(NT "Silence")
(NT "Slang")
(NT "Slogans")
(NT "Sound recording")
(NT "Storytelling")
(NT "Telepathy")
(NT "Temper tantrums")
(NT "Threats")
(NT "Ticker tape")
(NT "Video recording")
(NT "Warnings")
(NT "Whispering")
(NT "Winking")
(NT "Writing")
(NT "Writing systems")
(RT "Communication devices")
(RT "Communication facilities")
(RT "Interpersonal relations")
(RT "Messengers")
(RT "Passwords")
(RT "Sounds")
(RT "Speech therapy")
(RT "Town criers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002360")
(TNR "tgm002365"))


(CONCEPT
(NON-DESCRIPTOR "Communication cables")
(USE "Telecommunication cables")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002361")
(TNR "tgm002366"))


(CONCEPT
(DESCRIPTOR "Communication devices")
(BT "Equipment")
(NT "Beacons")
(NT "Bulletin boards")
(NT "Buoys")
(NT "Cellular telephones")
(NT "Facsimile transmissions")
(NT "Horns (Communication devices)")
(NT "Hotlines (Communication)")
(NT "Intercommunication systems")
(NT "License plates")
(NT "Megaphones")
(NT "Phonographs")
(NT "Public address systems")
(NT "Radiophones")
(NT "Radios")
(NT "Scoreboards")
(NT "Signal flags")
(NT "Signal lights")
(NT "Signals")
(NT "Telecommunication cables")
(NT "Telecommunication lines")
(NT "Telegraph")
(NT "Telephones")
(NT "Televisions")
(RT "Bells")
(RT "Bugles")
(RT "Communication")
(RT "Communication facilities")
(RT "Pneumatic tubes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002362")
(TNR "tgm002367"))


(CONCEPT
(DESCRIPTOR "Communication facilities")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For structures housing communication devices and/or activities.")
(BT "Facilities")
(NT "Radio stations")
(NT "Signal stations")
(NT "Signal towers")
(NT "Telegraph offices")
(NT "Telephone booths")
(RT "Communication")
(RT "Communication devices")
(RT "Lighthouses")
(RT "Stockrooms")
(RT "Television studios")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002363")
(TNR "tgm002368"))


(CONCEPT
(NON-DESCRIPTOR "Communication with the dead")
(USE "Spiritualism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002364")
(TNR "tgm002369"))


(CONCEPT
(DESCRIPTOR "Communications")
(CN "Used only as a subdivision with :NAMES-OF :NAME-OF-WAR [Appendix C].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm002365")
(TNR "tgm002370"))


(CONCEPT
(DESCRIPTOR "Communion")
(UF "Eucharist")
(UF "Holy Communion")
(UF "Lord's Supper")
(UF "Sacrament of the Altar")
(BT "Rites & ceremonies")
(RT "Preaching")
(RT "Religious services")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002366")
(TNR "tgm002371"))


(CONCEPT
(NON-DESCRIPTOR "Communion-cups")
(USE "Chalices")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002367")
(TNR "tgm002372"))


(CONCEPT
(DESCRIPTOR "Communism")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of communism in general.")
(UF "Bolshevism")
(UF "Leninism")
(UF "Maoism")
(UF "Marxism")
(BT "Economic & political systems")
(RT "Anti-communism")
(RT "Communists")
(RT "Hammer & sickle")
(RT "McCarthyism")
(RT "Totalitarianism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002368")
(TNR "tgm002373"))


(CONCEPT
(DESCRIPTOR "Communists")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION COMMUNISM  for the subject of communism in general and the activities of communists.")
(BT "People associated with politics & government")
(RT "Communism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002369")
(TNR "tgm002374"))


(CONCEPT
(NON-DESCRIPTOR "Communities, Religious")
(USE "Religious communities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002370")
(TNR "tgm002375"))


(CONCEPT
(NON-DESCRIPTOR "Community beautification")
(USE "Urban beautification")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002371")
(TNR "tgm002376"))


(CONCEPT
(DESCRIPTOR "Community centers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Social & civic facilities")
(RT "Sports & recreation facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002372")
(TNR "tgm002377"))


(CONCEPT
(NON-DESCRIPTOR "Community leaders")
(USE "Civic leaders")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012115"))


(CONCEPT
(DESCRIPTOR "Community property")
(BT "Law & legal affairs")
(RT "Marriage")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002373")
(TNR "tgm002378"))


(CONCEPT
(DESCRIPTOR "Community service")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Charitable work")
(UF "Citizen participation")
(UF "Service, Community")
(UF "Voluntarism")
(UF "Volunteer work")
(BT "Public service")
(NT "Book drives")
(NT "Scrap drives")
(RT "Charitable organizations")
(RT "Charity")
(RT "Civic leaders")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002374")
(TNR "tgm002379"))


(CONCEPT
(DESCRIPTOR "Commuters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For persons who travel regularly between one place and another. :SEARCH-SUBDIVISION PASSENGERS for general travelers.")
(BT "People associated with transportation")
(RT "Passengers")
(CN "Used in a note under PASSENGERS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002375")
(TNR "tgm002380"))


(CONCEPT
(NON-DESCRIPTOR "Companies")
(USE "Business enterprises")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002376")
(TNR "tgm002381"))


(CONCEPT
(NON-DESCRIPTOR "Company housing")
(USE "Labor housing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002377")
(TNR "tgm002382"))


(CONCEPT
(NON-DESCRIPTOR "Company police")
(USE "Private police")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002378")
(TNR "tgm002383"))


(CONCEPT
(NON-DESCRIPTOR "Comparisons, Then & now")
(USE "Then & now comparisons")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000248")
(FCNlctgm "lctgm002379")
(TNR "tgm002384"))


(CONCEPT
(DESCRIPTOR "Compasses")
(BT "Scientific equipment")
(RT "Navigation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002380")
(TNR "tgm002385"))


(CONCEPT
(NON-DESCRIPTOR "Compensation for war damage")
(USE "Reparations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002381")
(TNR "tgm002386"))


(CONCEPT
(NON-DESCRIPTOR "Compensation for work")
(USE "Wages")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002382")
(TNR "tgm002387"))


(CONCEPT
(NON-DESCRIPTOR "Compensatory spending")
(USE "Deficit financing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002383")
(TNR "tgm002388"))


(CONCEPT
(DESCRIPTOR "Competition (Psychology)")
(UF "Rivalry")
(BT "Mental states")
(RT "Cooperation")
(RT "Interpersonal relations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002386")
(TNR "tgm002391"))


(CONCEPT
(DESCRIPTOR "Competition drawings")
(SN "Graphic delineations produced for a design contest or to win a construction or design contract. Customarily prepared according to a prescribed program.  In architecture, often a set of elevations, plans, sections, and renderings; often rendered or in perspective.")
(UF "Drawings, Competition")
(BT "Design drawings")
(RT "Presentation drawings (Proposals)")
(RT "Proposed works")
(CN "Used in a note under ARCHITECTURAL DRAWINGS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000249")
(FCNlctgm "lctgm002384")
(TNR "tgm002389"))


(CONCEPT
(DESCRIPTOR "Competition entries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Objects")
(RT "Architectural models")
(RT "Contests")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002385")
(TNR "tgm002390"))


(CONCEPT
(NON-DESCRIPTOR "Competitions")
(USE "Contests")
(USE "Sports")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002387")
(TNR "tgm002392"))


(CONCEPT
(DESCRIPTOR "Complaining")
(UF "Nagging")
(BT "Communication")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002388")
(TNR "tgm002393"))


(CONCEPT
(DESCRIPTOR "Composers")
(BT "Musicians")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002389")
(TNR "tgm002394"))


(CONCEPT
(DESCRIPTOR "Composite drawings")
(SN "Drawings in which two or more drawings are displayed together or fused into one.")
(BT "Drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000250")
(FCNlctgm "lctgm002390")
(TNR "tgm002395"))


(CONCEPT
(DESCRIPTOR "Composite photographs")
(SN "Photographs made through multiple exposure of negatives, sandwiching negatives, or other means of combining negatives. Examples include: a print made by combining cloud and landscape negatives and works by Henry Peach Robinson or Jerry Uelsmann.")
(UF "Combination prints")
(UF "Simulated images")
(BT "Photographs")
(RT "Montages")
(CN "Used in a note under MONTAGES.")
(HN "Changed 6/94. Formerly, COMPOSITE PHOTOGRAPHS may have been indexed as COMBINATION PRINTS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000251")
(FCNlctgm "lctgm002391")
(TNR "tgm002396"))


(CONCEPT
(NON-DESCRIPTOR "Composition (Printing)")
(USE "Typesetting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002393")
(TNR "tgm002398"))


(CONCEPT
(NON-DESCRIPTOR "Composition cases")
(USE "Union cases")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000252")
(FCNlctgm "lctgm002392")
(TNR "tgm002397"))


(CONCEPT
(DESCRIPTOR "Compost")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fertilizers")
(RT "Farming")
(RT "Gardening")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002394")
(TNR "tgm002399"))


(CONCEPT
(NON-DESCRIPTOR "Compressors, Air")
(USE "Air compressors")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002395")
(TNR "tgm002400"))


(CONCEPT
(NON-DESCRIPTOR "Compulsory military service")
(USE "Draft")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002396")
(TNR "tgm002401"))


(CONCEPT
(DESCRIPTOR "Computer circuits")
(BT "Objects")
(RT "Computers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002397")
(TNR "tgm002402"))


(CONCEPT
(DESCRIPTOR "Computer graphics")
(SN "Images created within or altered with a computer system; may simulate photographs, pictorial or ornamental drawings, or other images.")
(UF "Simulated images")
(BT "Digital images")
(NT "Computer-aided designs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000253")
(FCNlctgm "lctgm002398")
(TNR "tgm002403"))


(CONCEPT
(DESCRIPTOR "Computer-aided designs")
(SN "Graphic delineations, usually design drawings, created with a computer drafting system.")
(UF "CAD drawings")
(BT "Computer graphics")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000254")
(FCNlctgm "lctgm002400")
(TNR "tgm002405"))


(CONCEPT
(NON-DESCRIPTOR "Computer-generated prints")
(USE "Digital prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000255")
(FCNlctgm "lctgm002401")
(TNR "tgm002406"))


(CONCEPT
(DESCRIPTOR "Computers")
(SN "For modern electronic computers first developed after 1945. :SEARCH-SUBDIVISION CALCULATORS for present-day calculators, as well as calculators and mechanical computers of pre-1945 vintage.")
(UF "Automatic data processing equipment")
(UF "Data processing equipment")
(UF "Electronic calculating machines")
(BT "Office equipment & supplies")
(NT "Punched card systems")
(RT "Calculators")
(RT "Computer circuits")
(RT "Robots")
(CN "Used in a note under CALCULATORS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002399")
(TNR "tgm002404"))


(CONCEPT
(NON-DESCRIPTOR "Con artists")
(USE "Swindlers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002402")
(TNR "tgm002407"))


(CONCEPT
(NON-DESCRIPTOR "Concealed camera photographs")
(USE "Detective camera photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000256")
(FCNlctgm "lctgm002403")
(TNR "tgm002408"))


(CONCEPT
(DESCRIPTOR "Concentration camps")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Camps, Internment")
(UF "Internment camps")
(BT "Detention facilities")
(RT "Forced labor")
(RT "Political prisoners")
(RT "Prisoners of war")
(RT "Relocation camps")
(RT "Settlements")
(RT "War")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002404")
(TNR "tgm002409"))


(CONCEPT
(DESCRIPTOR "Concepts")
(NT "Abyss")
(NT "Allusions")
(NT "Circulation (Architecture)")
(NT "Civilization")
(NT "Creation")
(NT "Crises")
(NT "Curiosities & wonders")
(NT "Danger")
(NT "Deadly sins")
(NT "Deathbeds")
(NT "Dietary laws")
(NT "Ecumenism")
(NT "Eden")
(NT "Evolution")
(NT "Extravagance")
(NT "Fame")
(NT "Fantasy")
(NT "Fictitious characters")
(NT "Heaven")
(NT "Hell")
(NT "Honor")
(NT "Incompetence")
(NT "Intellect")
(NT "Justice")
(NT "Leisure")
(NT "Liberty")
(NT "Life cycle")
(NT "Literacy")
(NT "Longevity")
(NT "Manners & customs")
(NT "Metamorphosis")
(NT "Midlife crisis")
(NT "Names")
(NT "Nature")
(NT "Obscenity")
(NT "Paradise")
(NT "Peace")
(NT "Pedigree")
(NT "Pluralism (Social sciences)")
(NT "Power (Social sciences)")
(NT "Prestige")
(NT "Privacy")
(NT "Rake's progress")
(NT "Reform")
(NT "Rejuvenation")
(NT "Religion")
(NT "Religious fundamentalism")
(NT "Safety")
(NT "Sanitation")
(NT "Seapower")
(NT "Social mobility")
(NT "Social values")
(NT "Solidarity")
(NT "Solitude")
(NT "Soul")
(NT "Standardization")
(NT "Straw man")
(NT "Supernatural")
(NT "Surrealism")
(NT "Symbols")
(NT "Ten commandments")
(NT "Time")
(NT "Toleration")
(NT "Truth")
(NT "Unbuilt projects")
(NT "Unidentified flying objects")
(NT "Utopias")
(NT "Wages")
(NT "White man's burden")
(NT "Wisdom")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002405")
(TNR "tgm002410"))


(CONCEPT
(DESCRIPTOR "Concert halls")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Symphony halls")
(BT "Cultural facilities")
(NT "Music halls")
(NT "Opera houses")
(RT "Auditoriums")
(RT "Concerts")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002406")
(TNR "tgm002411"))


(CONCEPT
(DESCRIPTOR "Concert posters")
(SN "Includes posters for orchestra, solo instrument, ensemble, vocalist, and other musical performances.")
(UF "Music posters")
(BT "Performing arts posters")
(NT "Rock posters")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000257")
(FCNlctgm "lctgm002407")
(TNR "tgm002412"))


(CONCEPT
(DESCRIPTOR "Concerts")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Entertainment")
(RT "Audiences")
(RT "Concert halls")
(RT "Conductors")
(RT "Music")
(RT "Music festivals")
(RT "Musical instruments")
(RT "Orchestras")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002408")
(TNR "tgm002413"))


(CONCEPT
(DESCRIPTOR "Concourses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For large open spaces or halls in buildings where crowds come together and circulate, as in a railroad station or airport.")
(BT "Interiors")
(RT "Passageways")
(RT "Transportation facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002409")
(TNR "tgm002414"))


(CONCEPT
(DESCRIPTOR "Concrete")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Building materials")
(RT "Concrete mixers")
(RT "Reinforced concrete construction")
(RT "Textile block construction")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002410")
(TNR "tgm002415"))


(CONCEPT
(DESCRIPTOR "Concrete mixers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cement mixers")
(UF "Mixers, Concrete")
(BT "Machinery")
(RT "Concrete")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002411")
(TNR "tgm002416"))


(CONCEPT
(DESCRIPTOR "Concrete products industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Building materials industry")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002412")
(TNR "tgm002417"))


(CONCEPT
(NON-DESCRIPTOR "Condemned persons")
(USE "Prisoners")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012116"))


(CONCEPT
(DESCRIPTOR "Condiments")
(BT "Food")
(NT "Ketchup")
(NT "Mustard")
(NT "Salt")
(RT "Spices")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002413")
(TNR "tgm002418"))


(CONCEPT
(DESCRIPTOR "Condominiums")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Condos")
(BT "Dwellings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002414")
(TNR "tgm002419"))


(CONCEPT
(NON-DESCRIPTOR "Condos")
(USE "Condominiums")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002415")
(TNR "tgm002420"))


(CONCEPT
(DESCRIPTOR "Conducting")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the activity of orchestral or choral conducting.")
(BT "Activities")
(RT "Choirs (Music)")
(RT "Conductors")
(RT "Orchestras")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002416")
(TNR "tgm002421"))


(CONCEPT
(NON-DESCRIPTOR "Conductor heads")
(USE "Leader heads")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002417")
(TNR "tgm002422"))


(CONCEPT
(DESCRIPTOR "Conductors")
(SN "For images that focus on conductors and for conductors away from the context of their work.")
(UF "Bandmasters")
(BT "Musicians")
(RT "Concerts")
(RT "Conducting")
(RT "Music ensembles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002418")
(TNR "tgm002423"))


(CONCEPT
(NON-DESCRIPTOR "Conductors, Railroad")
(USE "Railroad employees")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002419")
(TNR "tgm002424"))


(CONCEPT
(NON-DESCRIPTOR "Conduits, Water")
(USE "Aqueducts")
(USE "Culverts")
(USE "Pipes (Conduits)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002420")
(TNR "tgm002425"))


(CONCEPT
(NON-DESCRIPTOR "Cones, Ice cream")
(USE "Ice cream cones")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002422")
(TNR "tgm002427"))


(CONCEPT
(NON-DESCRIPTOR "Conestoga wagons")
(USE "Covered wagons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002421")
(TNR "tgm002426"))


(CONCEPT
(DESCRIPTOR "Confectioneries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Candy stores")
(BT "Stores & shops")
(RT "Confections")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002423")
(TNR "tgm002428"))


(CONCEPT
(DESCRIPTOR "Confections")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Sweet edibles, including candies, cakes, pastries, and other mixtures of sugar, fruit, or nuts.")
(UF "Sweetmeats")
(UF "Sweets")
(BT "Food")
(NT "Cakes")
(NT "Candy")
(NT "Chewing gum")
(RT "Chocolate industry")
(RT "Confectioneries")
(CN "As appropriate, :SUBDIVIDE-BY place with which confections are associated.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002424")
(TNR "tgm002429"))


(CONCEPT
(DESCRIPTOR "Conference rooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Board rooms")
(UF "Boardrooms")
(UF "Committee rooms")
(UF "Convention halls (Rooms)")
(UF "Meeting rooms")
(BT "Interiors")
(RT "Meetings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002425")
(TNR "tgm002430"))


(CONCEPT
(NON-DESCRIPTOR "Conferences")
(USE "Meetings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002426")
(TNR "tgm002431"))


(CONCEPT
(NON-DESCRIPTOR "Conferences, Press")
(USE "Press conferences")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002427")
(TNR "tgm002432"))


(CONCEPT
(NON-DESCRIPTOR "Confession")
(USE "Confessions")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002428")
(TNR "tgm002433"))


(CONCEPT
(DESCRIPTOR "Confessionals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Furnishings")
(BT "Religious architectural elements")
(RT "Confessions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002429")
(TNR "tgm002434"))


(CONCEPT
(DESCRIPTOR "Confessions")
(SN "Statements of guilt given to law enforcement or religious officials.")
(UF "Auricular confession")
(UF "Confession")
(BT "Communication")
(RT "Christianity")
(RT "Clergy")
(RT "Confessionals")
(RT "Criminals")
(RT "Police")
(RT "Religion")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002430")
(TNR "tgm002435"))


(CONCEPT
(NON-DESCRIPTOR "Confidence men")
(USE "Swindlers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002431")
(TNR "tgm002436"))


(CONCEPT
(DESCRIPTOR "Confirmations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Rites & ceremonies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002432")
(TNR "tgm002437"))


(CONCEPT
(DESCRIPTOR "Confiscations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --DESTRUCTION & PILLAGE :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(UF "Captures")
(UF "Seizures")
(BT "Law enforcement")
(NT "Drug seizures")
(RT "Police raids")
(RT "War")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002433")
(TNR "tgm002438"))


(CONCEPT
(NON-DESCRIPTOR "Conflagrations")
(USE "Fires")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002434")
(TNR "tgm002439"))


(CONCEPT
(DESCRIPTOR "Conformity")
(BT "Behavior")
(RT "Individuality")
(RT "Interpersonal relations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002435")
(TNR "tgm002440"))


(CONCEPT
(DESCRIPTOR "Confrontations")
(SN "The act of facing down or challenging; may or may not include quarreling and physical fighting.")
(BT "Events")
(RT "Fighting")
(RT "Interpersonal relations")
(RT "Quarreling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002436")
(TNR "tgm002441"))


(CONCEPT
(DESCRIPTOR "Confucian temples")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Temples")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002437")
(TNR "tgm002442"))


(CONCEPT
(NON-DESCRIPTOR "Congestion, Traffic")
(USE "Traffic congestion")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002438")
(TNR "tgm002443"))


(CONCEPT
(DESCRIPTOR "Congregational churches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on buildings, as well as the associated grounds.")
(BT "Protestant churches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002439")
(TNR "tgm002444"))


(CONCEPT
(NON-DESCRIPTOR "Congress & presidents")
(USE "Presidents & the Congress")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002440")
(TNR "tgm002445"))


(CONCEPT
(NON-DESCRIPTOR "Congresses")
(USE "Legislative bodies")
(USE "Meetings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002441")
(TNR "tgm002446"))


(CONCEPT
(NON-DESCRIPTOR "Congressional hearings")
(USE "Legislative hearings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002442")
(TNR "tgm002447"))


(CONCEPT
(NON-DESCRIPTOR "Congressional investigations")
(USE "Legislative hearings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002443")
(TNR "tgm002448"))


(CONCEPT
(NON-DESCRIPTOR "Congressional pages")
(USE "Capitol pages")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002444")
(TNR "tgm002449"))


(CONCEPT
(DESCRIPTOR "Congressional privileges & immunities")
(UF "Immunities, Congressional")
(UF "Privileges, Congressional")
(BT "Law & legal affairs")
(RT "Legislators")
(RT "Political patronage")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002445")
(TNR "tgm002450"))


(CONCEPT
(NON-DESCRIPTOR "Congressional spouses")
(USE "Legislators' spouses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002446")
(TNR "tgm002451"))


(CONCEPT
(NON-DESCRIPTOR "Congressmen")
(USE "Legislators")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002447")
(TNR "tgm002452"))


(CONCEPT
(DESCRIPTOR "Conjectural works")
(SN "Images showing how something in the past might have appeared, such as historical events, places, objects, or people. Also, pictures of the imagined future appearance of real people, places, and objects.")
(UF "Historical studies")
(UF "Imaginary views")
(UF "Recreations (Conjectural works)")
(BT "Pictures")
(RT "Reconstructions")
(RT "Then & now comparisons")
(RT "Visionary architecture")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000258")
(FCNlctgm "lctgm002448")
(TNR "tgm002453"))


(CONCEPT
(DESCRIPTOR "Conjoined twins")
(UF "Siamese twins")
(BT "Twins")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002449")
(TNR "tgm002454"))


(CONCEPT
(NON-DESCRIPTOR "Conjurers")
(USE "Magicians")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002450")
(TNR "tgm002455"))


(CONCEPT
(NON-DESCRIPTOR "Conjuring")
(USE "Magic")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002451")
(TNR "tgm002456"))


(CONCEPT
(DESCRIPTOR "Conscientious objectors")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(RT "Draft")
(RT "Draft resisters")
(RT "Freedom of religion")
(RT "Moral aspects of war")
(RT "Pacifists")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002452")
(TNR "tgm002457"))


(CONCEPT
(NON-DESCRIPTOR "Consciousness, Loss of")
(USE "Loss of consciousness")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002453")
(TNR "tgm002458"))


(CONCEPT
(NON-DESCRIPTOR "Consciousness-raising groups")
(USE "Group relations training")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002454")
(TNR "tgm002459"))


(CONCEPT
(NON-DESCRIPTOR "Conscription, Military")
(USE "Draft")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002455")
(TNR "tgm002460"))


(CONCEPT
(NON-DESCRIPTOR "Consecration of churches")
(USE "Church dedications")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002456")
(TNR "tgm002461"))


(CONCEPT
(DESCRIPTOR "Conservation & restoration")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For restoration work on structures, as well as conservation of objects, e.g., books.")
(UF "Restoration")
(BT "Processes & techniques")
(RT "Construction")
(RT "Recycled structures")
(RT "Remodeling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002458")
(TNR "tgm002463"))


(CONCEPT
(DESCRIPTOR "Conservation of natural resources")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Environmental protection")
(UF "Natural resource conservation")
(BT "Environmental policy")
(NT "Recycling")
(NT "Soil conservation")
(NT "Wildlife conservation")
(RT "Ecology")
(RT "Fish ladders")
(RT "Land use")
(RT "Water supply")
(RT "Water use")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002457")
(TNR "tgm002462"))


(CONCEPT
(DESCRIPTOR "Conservatism")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Neo-conservatism")
(UF "New Right")
(UF "Reactionism")
(BT "Economic & political systems")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002459")
(TNR "tgm002464"))


(CONCEPT
(NON-DESCRIPTOR "Conservatories (Greenhouses)")
(USE "Greenhouses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002460")
(TNR "tgm002465"))


(CONCEPT
(NON-DESCRIPTOR "Conservatories, Home")
(USE "Garden rooms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002461")
(TNR "tgm002466"))


(CONCEPT
(NON-DESCRIPTOR "Conservatories, Musical")
(USE "Music education")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002462")
(TNR "tgm002467"))


(CONCEPT
(DESCRIPTOR "Consoles")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Projecting, scroll-shaped members serving as brackets or corbels.")
(UF "Brackets (Consoles)")
(BT "Architectural elements")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002463")
(TNR "tgm002468"))


(CONCEPT
(DESCRIPTOR "Conspiracy")
(UF "Plots")
(UF "Schemes")
(BT "Events")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002464")
(TNR "tgm002469"))


(CONCEPT
(DESCRIPTOR "Constellations")
(BT "Celestial bodies")
(RT "Astrology")
(RT "Astronomy")
(RT "Stars")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002465")
(TNR "tgm002470"))


(CONCEPT
(DESCRIPTOR "Constituents")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "People entitled to elect a representative to a legislative body.")
(BT "People associated with politics & government")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002466")
(TNR "tgm002471"))


(CONCEPT
(DESCRIPTOR "Constitutional amendments")
(UF "Amendments, Constitutional")
(BT "Law & legal affairs")
(NT "Equal rights amendments")
(RT "Constitutions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002467")
(TNR "tgm002472"))


(CONCEPT
(DESCRIPTOR "Constitutional conventions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Meetings")
(RT "Constitutions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002468")
(TNR "tgm002473"))


(CONCEPT
(DESCRIPTOR "Constitutions")
(GEO-FACET ":COUNTRY :STATE")
(BT "Law & legal affairs")
(RT "Constitutional amendments")
(RT "Constitutional conventions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002469")
(TNR "tgm002474"))


(CONCEPT
(DESCRIPTOR "Construction")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the process of building and types of construction.  :SEARCH-SUBDIVISION CONSTRUCTION INDUSTRY for the construction business.  :SEARCH-SUBDIVISION --ENGINEERING & CONSTRUCTION :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(UF "Building")
(BT "Processes & techniques")
(NT "Bombproof construction")
(NT "Bridge construction")
(NT "Building construction")
(NT "Canal construction")
(NT "Cantilever construction")
(NT "Carpentry")
(NT "Dam construction")
(NT "Fire-resistive construction")
(NT "Iron construction")
(NT "Masonry")
(NT "Railroad construction & maintenance")
(NT "Reinforced concrete construction")
(NT "Road construction")
(NT "Textile block construction")
(RT "Boring")
(RT "Conservation & restoration")
(RT "Construction industry")
(RT "Construction workers")
(RT "Demolition")
(RT "Drilling")
(RT "Excavation")
(RT "Maintenance & repair")
(RT "Railroad construction workers")
(RT "Remodeling")
(RT "Scaffolding")
(RT "Steeplejacks")
(RT "Structural systems")
(CN "Used in a note under ARCHITECTURE and CONSTRUCTION INDUSTRY.")
(HN "Usage altered 2/90. In earlier cataloging, CONSTRUCTION was used only for small-scale building operations.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002470")
(TNR "tgm002475"))


(CONCEPT
(DESCRIPTOR "Construction camps")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Mobile camps for construction workers.")
(BT "Labor housing")
(RT "Construction industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002471")
(TNR "tgm002476"))


(CONCEPT
(DESCRIPTOR "Construction equipment")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Machinery")
(RT "Construction industry")
(RT "Construction workers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002472")
(TNR "tgm002477"))


(CONCEPT
(DESCRIPTOR "Construction industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the construction business, including finance, planning, management, and skills. :SEARCH-SUBDIVISION CONSTRUCTION or its NTs for the process of building and types of construction.")
(BT "Industry")
(RT "Architectural models")
(RT "Boat & ship industry")
(RT "Building materials industry")
(RT "Construction")
(RT "Construction camps")
(RT "Construction equipment")
(RT "Construction workers")
(RT "Engineering")
(RT "Model houses")
(RT "Plumbing industry")
(RT "Real estate development")
(RT "Steeplejacks")
(RT "Surveying")
(CN "Used in a note under ARCHITECTURE and CONSTRUCTION. :DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(HN "Usage altered 2/90. In earlier cataloging, CONSTRUCTION INDUSTRY was used for large-scale building operations.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002473")
(TNR "tgm002478"))


(CONCEPT
(NON-DESCRIPTOR "Construction progress photographs")
(USE "Progress photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000259")
(FCNlctgm "lctgm002474")
(TNR "tgm002479"))


(CONCEPT
(DESCRIPTOR "Construction workers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with manual labor")
(NT "Canal construction workers")
(RT "Construction")
(RT "Construction equipment")
(RT "Construction industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002475")
(TNR "tgm002480"))


(CONCEPT
(NON-DESCRIPTOR "Consular service")
(USE "Foreign service")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002476")
(TNR "tgm002481"))


(CONCEPT
(DESCRIPTOR "Consulates")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Government facilities")
(RT "Diplomats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002477")
(TNR "tgm002482"))


(CONCEPT
(DESCRIPTOR "Consuls")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Diplomats")
(RT "Commerce")
(CN ":SUBDIVIDE-BY :NATIONALITY of :COUNTRY consul represents.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002478")
(TNR "tgm002483"))


(CONCEPT
(NON-DESCRIPTOR "Consumer cooperatives")
(USE "Cooperatives")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002479")
(TNR "tgm002484"))


(CONCEPT
(DESCRIPTOR "Consumer protection")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Law & legal affairs")
(RT "Consumers")
(RT "Food inspections")
(RT "Government regulation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002480")
(TNR "tgm002485"))


(CONCEPT
(DESCRIPTOR "Consumer rationing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Rationing, Consumer")
(BT "Government regulation")
(RT "Black market")
(RT "Economic aspects of war")
(RT "Government spending policy")
(RT "Scarcity")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002481")
(TNR "tgm002486"))


(CONCEPT
(DESCRIPTOR "Consumers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with commercial activities")
(RT "Commerce")
(RT "Consumer protection")
(RT "Customer relations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002482")
(TNR "tgm002487"))


(CONCEPT
(NON-DESCRIPTOR "Consumption (Disease)")
(USE "Tuberculosis")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002483")
(TNR "tgm002488"))


(CONCEPT
(DESCRIPTOR "Contact lenses")
(BT "Optical devices")
(RT "Eyeglasses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002484")
(TNR "tgm002489"))


(CONCEPT
(DESCRIPTOR "Contact prints")
(SN "Photographic prints made by interfacing one negative and a sheet of photographic paper and exposing the paper with light.")
(UF "Lumiprints")
(UF "Prints, Contact")
(BT "Photographic prints")
(BT "Proofs")
(NT "Contact sheets")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000260")
(FCNlctgm "lctgm002485")
(TNR "tgm002490"))


(CONCEPT
(DESCRIPTOR "Contact sheets")
(SN "Proof sheets containing contact prints from more than one negative; often used to select images for individual printing.")
(UF "Proof sheets")
(BT "Contact prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000261")
(FCNlctgm "lctgm002486")
(TNR "tgm002491"))


(CONCEPT
(NON-DESCRIPTOR "Contagious diseases")
(USE "Communicable diseases")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002487")
(TNR "tgm002492"))


(CONCEPT
(DESCRIPTOR "Containers")
(BT "Equipment")
(NT "Barrels")
(NT "Basins")
(NT "Baskets")
(NT "Bedpans")
(NT "Bottles")
(NT "Boxes")
(NT "Cans")
(NT "Canteens (Beverage containers)")
(NT "Chamber pots")
(NT "Coffeepots")
(NT "Coffins")
(NT "Coin banks")
(NT "Crates")
(NT "Drinking vessels")
(NT "Fuel tanks")
(NT "Ice buckets")
(NT "Luggage")
(NT "Mailboxes")
(NT "Musical instrument cases")
(NT "Pails")
(NT "Pigeonholes")
(NT "Pitchers")
(NT "Plant containers")
(NT "Powder kegs")
(NT "Samovars")
(NT "Septic tanks")
(NT "Spittoons")
(NT "Teapots")
(NT "Time capsules")
(NT "Tin cups")
(NT "Trays")
(NT "Troughs")
(NT "Urns")
(NT "Vases")
(NT "Vats")
(NT "Wallets")
(NT "Wash tubs")
(RT "Cages")
(RT "Cornucopias")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002488")
(TNR "tgm002493"))


(CONCEPT
(DESCRIPTOR "Containment (International relations)")
(GEO-FACET ":COUNTRY :STATE")
(BT "International relations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002489")
(TNR "tgm002494"))


(CONCEPT
(NON-DESCRIPTOR "Conté crayon drawings")
(USE "Crayon drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000262")
(FCNlctgm "lctgm002490")
(TNR "tgm002495"))


(CONCEPT
(DESCRIPTOR "Contentment")
(BT "Mental states")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002491")
(TNR "tgm002496"))


(CONCEPT
(NON-DESCRIPTOR "Contestants, Beauty")
(USE "Beauty contestants")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002492")
(TNR "tgm002497"))


(CONCEPT
(DESCRIPTOR "Contests")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Competitions")
(BT "Events")
(NT "Beauty contests")
(NT "Cakewalks")
(NT "Marathons")
(NT "Spelling bees")
(NT "Tournaments")
(RT "Awards")
(RT "Competition entries")
(RT "Exhibitions")
(RT "Livestock shows")
(RT "Manners & customs")
(RT "Sports")
(RT "Victories")
(RT "World records")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002493")
(TNR "tgm002498"))


(CONCEPT
(DESCRIPTOR "Contorting")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Activities")
(RT "Acrobatics")
(RT "Contortionists")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002494")
(TNR "tgm002499"))


(CONCEPT
(DESCRIPTOR "Contortionists")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Acrobats")
(RT "Contorting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002495")
(TNR "tgm002500"))


(CONCEPT
(NON-DESCRIPTOR "Contraband trade")
(USE "Black market")
(USE "Prohibition")
(USE "Smuggling")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002496")
(TNR "tgm002501"))


(CONCEPT
(NON-DESCRIPTOR "Contraception")
(USE "Birth control")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002497")
(TNR "tgm002502"))


(CONCEPT
(DESCRIPTOR "Contract drawings")
(SN "Graphic delineations which constitute part of a legal contract between a client and craftsman, builder, architect, engineer, contractor, or other service provider. Signed or accepted by one or more parties, or otherwise identified as part of a contract agreement or set of specifications. Used especially from the mid- to late-1800s.")
(UF "Drawings, Contract")
(BT "Design drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000263")
(FCNlctgm "lctgm002498")
(TNR "tgm002503"))


(CONCEPT
(DESCRIPTOR "Contract laborers")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Coolies")
(BT "Laborers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002499")
(TNR "tgm002504"))


(CONCEPT
(DESCRIPTOR "Contract negotiations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Communication")
(RT "Contracts")
(RT "Labor unions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002500")
(TNR "tgm002505"))


(CONCEPT
(DESCRIPTOR "Contracts")
(UF "Agreements")
(BT "Law & legal affairs")
(NT "Defense contracts")
(NT "Insurance")
(NT "Mortgages")
(RT "Contract negotiations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002501")
(TNR "tgm002506"))


(CONCEPT
(NON-DESCRIPTOR "Contras")
(USE "Counterrevolutionaries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002502")
(TNR "tgm002507"))


(CONCEPT
(NON-DESCRIPTOR "Control of arms")
(USE "Arms control")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002503")
(TNR "tgm002508"))


(CONCEPT
(NON-DESCRIPTOR "Control of guns")
(USE "Firearms control")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002504")
(TNR "tgm002509"))


(CONCEPT
(NON-DESCRIPTOR "Control of pests")
(USE "Pest control")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002505")
(TNR "tgm002510"))


(CONCEPT
(DESCRIPTOR "Control rooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Rooms & spaces")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002506")
(TNR "tgm002511"))


(CONCEPT
(NON-DESCRIPTOR "Convalescent camps")
(USE "Medical aspects of war")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002507")
(TNR "tgm002512"))


(CONCEPT
(NON-DESCRIPTOR "Convalescent homes")
(USE "Nursing homes")
(USE "Rest homes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002508")
(TNR "tgm002513"))


(CONCEPT
(DESCRIPTOR "Convalescent hospitals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Hospitals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002509")
(TNR "tgm002514"))


(CONCEPT
(NON-DESCRIPTOR "Convalescents")
(USE "Medical aspects of war")
(USE "Sick persons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002510")
(TNR "tgm002515"))


(CONCEPT
(NON-DESCRIPTOR "Convenience stations")
(USE "Public comfort stations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002511")
(TNR "tgm002516"))


(CONCEPT
(DESCRIPTOR "Convenience stores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Fast food stores")
(BT "Stores & shops")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002512")
(TNR "tgm002517"))


(CONCEPT
(NON-DESCRIPTOR "Convention halls")
(USE "Social & civic facilities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002513")
(TNR "tgm002518"))


(CONCEPT
(NON-DESCRIPTOR "Convention halls (Rooms)")
(USE "Conference rooms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002514")
(TNR "tgm002519"))


(CONCEPT
(NON-DESCRIPTOR "Conventions")
(USE "Treaties")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002515")
(TNR "tgm002520"))


(CONCEPT
(NON-DESCRIPTOR "Conventions (Congresses)")
(USE "Meetings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002516")
(TNR "tgm002521"))


(CONCEPT
(DESCRIPTOR "Convents")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For local communities or houses of nuns.")
(UF "Cloisters")
(UF "Nunneries")
(BT "Religious communities")
(RT "Abbeys")
(RT "Monasteries")
(RT "Nuns")
(RT "Religious orders")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002517")
(TNR "tgm002522"))


(CONCEPT
(DESCRIPTOR "Conversation")
(SN "For images of persons engaged in casual talk.")
(UF "Speaking")
(UF "Talking")
(BT "Communication")
(RT "Gossiping")
(RT "Interviews")
(RT "Shouting")
(RT "Whispering")
(CN "Used in a note under DISCUSSION.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002518")
(TNR "tgm002523"))


(CONCEPT
(NON-DESCRIPTOR "Converted structures")
(USE "Recycled structures")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002519")
(TNR "tgm002524"))


(CONCEPT
(DESCRIPTOR "Convertible automobiles")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Convertibles (Automobiles)")
(BT "Automobiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002520")
(TNR "tgm002525"))


(CONCEPT
(DESCRIPTOR "Convertible furniture")
(BT "Furniture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002521")
(TNR "tgm002526"))


(CONCEPT
(NON-DESCRIPTOR "Convertibles (Automobiles)")
(USE "Convertible automobiles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002522")
(TNR "tgm002527"))


(CONCEPT
(DESCRIPTOR "Convertiplanes")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Airplanes")
(RT "Automobiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002523")
(TNR "tgm002528"))


(CONCEPT
(NON-DESCRIPTOR "Conveying machinery")
(USE "Conveying systems")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002524")
(TNR "tgm002529"))


(CONCEPT
(DESCRIPTOR "Conveying systems")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Conveying machinery")
(BT "Building systems")
(BT "Machinery")
(NT "Book conveyors")
(NT "Dumbwaiters")
(NT "Elevators")
(NT "Escalators")
(NT "Pneumatic tubes")
(HN "Changed 1/1993 from CONVEYING MACHINERY.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002525")
(TNR "tgm002530"))


(CONCEPT
(NON-DESCRIPTOR "Convict laborers")
(USE "Prison laborers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002526")
(TNR "tgm002531"))


(CONCEPT
(NON-DESCRIPTOR "Convicts")
(USE "Prisoners")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002527")
(TNR "tgm002532"))


(CONCEPT
(DESCRIPTOR "Convoys")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Organized groups of ships or motor vehicles traveling together with or without escort.")
(BT "Transportation")
(RT "Shipping")
(RT "Travel")
(RT "Vehicles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002528")
(TNR "tgm002533"))


(CONCEPT
(NON-DESCRIPTOR "Cook cars")
(USE "Chuck wagons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002529")
(TNR "tgm002534"))


(CONCEPT
(DESCRIPTOR "Cookery")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Candy making")
(UF "Cooking")
(UF "Food preparation")
(BT "Processes & techniques")
(NT "Baking")
(NT "Frying")
(NT "Home food processing")
(NT "Military cookery")
(NT "Outdoor cookery")
(RT "Barbecue grills")
(RT "Buffets (Cookery)")
(RT "Cooking utensils")
(RT "Cooks")
(RT "Dietary laws")
(RT "Eating & drinking")
(RT "Food")
(RT "Home economics")
(RT "Housework")
(RT "Kitchens")
(RT "Luncheons")
(RT "Oils & fats")
(RT "Pots & pans")
(RT "Stoves")
(RT "Street kitchens")
(RT "Toasters")
(RT "Vanilla")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002530")
(TNR "tgm002535"))


(CONCEPT
(DESCRIPTOR "Cookies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Baked products")
(NT "Fortune cookies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002531")
(TNR "tgm002536"))


(CONCEPT
(NON-DESCRIPTOR "Cooking")
(USE "Cookery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002532")
(TNR "tgm002537"))


(CONCEPT
(DESCRIPTOR "Cooking utensils")
(UF "Kitchen utensils")
(BT "Equipment")
(NT "Cauldrons")
(NT "Kettles")
(NT "Pots & pans")
(RT "Cookery")
(RT "Corkscrews")
(RT "Forks")
(RT "Funnels")
(RT "Silverware")
(RT "Spoons")
(RT "Tableware")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002533")
(TNR "tgm002538"))


(CONCEPT
(DESCRIPTOR "Cooks")
(UF "Chefs")
(BT "People")
(RT "Cookery")
(RT "Restaurant workers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002534")
(TNR "tgm002539"))


(CONCEPT
(NON-DESCRIPTOR "Coolies")
(USE "Contract laborers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002535")
(TNR "tgm002540"))


(CONCEPT
(NON-DESCRIPTOR "Coons")
(USE "Raccoons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002536")
(TNR "tgm002541"))


(CONCEPT
(DESCRIPTOR "Cooperation")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the association of persons or living things for their common good.")
(BT "Behavior")
(RT "Assistance")
(RT "Competition (Psychology)")
(RT "Cooperatives")
(RT "International organization")
(RT "International organizations")
(RT "Interpersonal relations")
(RT "Solidarity")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002537")
(TNR "tgm002542"))


(CONCEPT
(DESCRIPTOR "Cooperatives")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Enterprises or organizations owned by and operated for the benefit of those using their services. Includes activities and structures.")
(UF "Consumer cooperatives")
(UF "Marketing cooperatives")
(BT "Commercial organizations")
(RT "Business enterprises")
(RT "Collective settlements")
(RT "Cooperation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002538")
(TNR "tgm002543"))


(CONCEPT
(DESCRIPTOR "Coopers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with manual labor")
(RT "Barrels")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002539")
(TNR "tgm002544"))


(CONCEPT
(DESCRIPTOR "Coots")
(GEO-FACET ":COUNTRY :STATE")
(BT "Birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002540")
(TNR "tgm002545"))


(CONCEPT
(NON-DESCRIPTOR "Copies")
(USE "Reproductions")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000264")
(FCNlctgm "lctgm002541")
(TNR "tgm002546"))


(CONCEPT
(NON-DESCRIPTOR "Coping")
(USE "Copings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002542")
(TNR "tgm002547"))


(CONCEPT
(DESCRIPTOR "Copings")
(SN "Stone, terra-cotta, or metal protective caps for walls or other structures.")
(UF "Coping")
(BT "Architectural elements")
(RT "Parapets")
(RT "Walls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002543")
(TNR "tgm002548"))


(CONCEPT
(DESCRIPTOR "Copper")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Metals")
(RT "Copper industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002544")
(TNR "tgm002549"))


(CONCEPT
(DESCRIPTOR "Copper industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Metallurgical industry")
(RT "Brass industry")
(RT "Bronze industry")
(RT "Copper")
(RT "Copper mining")
(RT "Copperwork")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002545")
(TNR "tgm002550"))


(CONCEPT
(DESCRIPTOR "Copper miners")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For persons not actually engaged in mining work. :SEARCH-SUBDIVISION COPPER MINING for activities.")
(BT "Miners")
(RT "Copper mining")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002546")
(TNR "tgm002551"))


(CONCEPT
(DESCRIPTOR "Copper mining")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and sites.")
(BT "Mining")
(RT "Copper industry")
(RT "Copper miners")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002547")
(TNR "tgm002552"))


(CONCEPT
(NON-DESCRIPTOR "Copper work")
(USE "Copperwork")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002548")
(TNR "tgm002553"))


(CONCEPT
(DESCRIPTOR "Copperwork")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Copper work")
(BT "Metalwork")
(RT "Copper industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002549")
(TNR "tgm002554"))


(CONCEPT
(DESCRIPTOR "Copy art")
(SN "Images made with photocopy machines, such as Xerox machines, that are original works rather than reproductions of other documents. Examples include multiple copy, personal use invitations as well as artists' works.")
(UF "Xerographic art")
(BT "Photocopies")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000265")
(FCNlctgm "lctgm002550")
(TNR "tgm002555"))


(CONCEPT
(DESCRIPTOR "Copying machines")
(BT "Office equipment & supplies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002551")
(TNR "tgm002556"))


(CONCEPT
(NON-DESCRIPTOR "Copying rooms")
(USE "Scriptoria")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002552")
(TNR "tgm002557"))


(CONCEPT
(DESCRIPTOR "Copyright")
(UF "Authors' rights")
(BT "Law & legal affairs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002553")
(TNR "tgm002558"))


(CONCEPT
(DESCRIPTOR "Coracles")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Small, round or broad boats covered with skin or cloth used in the Near East and Great Britain.")
(BT "Boats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002554")
(TNR "tgm002559"))


(CONCEPT
(DESCRIPTOR "Corals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Aquatic animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002555")
(TNR "tgm002560"))


(CONCEPT
(NON-DESCRIPTOR "Corbel gables")
(USE "Crow-stepped gables")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002556")
(TNR "tgm002561"))


(CONCEPT
(NON-DESCRIPTOR "Corbiestepped gables")
(USE "Crow-stepped gables")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002557")
(TNR "tgm002562"))


(CONCEPT
(NON-DESCRIPTOR "Cordons")
(USE "Stringcourses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002558")
(TNR "tgm002563"))


(CONCEPT
(DESCRIPTOR "Corduroy roads")
(GEO-FACET ":COUNTRY :STATE")
(SN "Roads built of logs laid side by side transversely.")
(BT "Roads")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002559")
(TNR "tgm002564"))


(CONCEPT
(DESCRIPTOR "Corinthian order")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Architectural orders")
(RT "Acanthi")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002560")
(TNR "tgm002565"))


(CONCEPT
(DESCRIPTOR "Cork")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Bark")
(RT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002561")
(TNR "tgm002566"))


(CONCEPT
(DESCRIPTOR "Corkscrews")
(BT "Equipment")
(RT "Cooking utensils")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002562")
(TNR "tgm002567"))


(CONCEPT
(DESCRIPTOR "Cormorants")
(GEO-FACET ":COUNTRY :STATE")
(BT "Birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002563")
(TNR "tgm002568"))


(CONCEPT
(DESCRIPTOR "Corn")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Grains")
(NT "Popcorn")
(RT "Corn cribs")
(RT "Corn husking")
(RT "Corn shocks")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002564")
(TNR "tgm002569"))


(CONCEPT
(DESCRIPTOR "Corn cribs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Corncribs")
(UF "Cribs, Corn")
(BT "Food storage buildings")
(RT "Corn")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002565")
(TNR "tgm002570"))


(CONCEPT
(DESCRIPTOR "Corn husking")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Corn shucking")
(UF "Husking bees")
(BT "Home food processing")
(RT "Corn")
(RT "Farm life")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002566")
(TNR "tgm002571"))


(CONCEPT
(DESCRIPTOR "Corn shocks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Stalks of corn set up in a field with the butt ends down.")
(BT "Sheaves")
(RT "Corn")
(RT "Harvesting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002567")
(TNR "tgm002572"))


(CONCEPT
(NON-DESCRIPTOR "Corn shucking")
(USE "Corn husking")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002568")
(TNR "tgm002573"))


(CONCEPT
(NON-DESCRIPTOR "Corncribs")
(USE "Corn cribs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002569")
(TNR "tgm002574"))


(CONCEPT
(DESCRIPTOR "Corner cards")
(SN "Designs printed as advertising on business envelopes during the 1840s and 1850s; usually in the top left corner. Earliest designs consisted of pre-printed return addresses. Later designs became more elaborate and incorporated embossing. The design was often the same one used on a business card showing the establishment.")
(BT "Pictorial envelopes")
(RT "Cameos (Stamps)")
(RT "Embossed works")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000266")
(FCNlctgm "lctgm002570")
(TNR "tgm002575"))


(CONCEPT
(NON-DESCRIPTOR "Corner stones")
(USE "Cornerstones")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002571")
(TNR "tgm002576"))


(CONCEPT
(DESCRIPTOR "Cornerstone laying")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Foundation stones, Laying of")
(BT "Building dedications")
(RT "Building construction")
(RT "Cornerstones")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002572")
(TNR "tgm002577"))


(CONCEPT
(DESCRIPTOR "Cornerstones")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Stones forming part of corners or angles in walls, especially lying at the foundation of a principal angle.")
(UF "Corner stones")
(UF "Pillar stones")
(BT "Architectural elements")
(RT "Cornerstone laying")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002573")
(TNR "tgm002578"))


(CONCEPT
(DESCRIPTOR "Cornets")
(SN "Includes the activity of playing cornets.")
(BT "Brass instruments")
(RT "Trombones")
(RT "Trumpets")
(RT "Tubas")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002574")
(TNR "tgm002579"))


(CONCEPT
(DESCRIPTOR "Cornices")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Molded projections that can either serve as uppermost division of an entablature, run around the walls of a room just below the ceiling, or serve as exterior trim at the meeting of wall and roof.")
(BT "Architectural elements")
(RT "Entablatures")
(RT "Moldings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002575")
(TNR "tgm002580"))


(CONCEPT
(DESCRIPTOR "Cornucopias")
(UF "Horns of plenty")
(BT "Symbols")
(RT "Containers")
(RT "Prosperity")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002576")
(TNR "tgm002581"))


(CONCEPT
(DESCRIPTOR "Coronations")
(GEO-FACET ":COUNTRY")
(SN ":SEARCH-SUBDIVISION --CORONATION :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B].")
(BT "Rites & ceremonies")
(RT "Crowns")
(RT "Rulers")
(CN "Prefer the subdivision.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002577")
(TNR "tgm002582"))


(CONCEPT
(NON-DESCRIPTOR "Corporal punishment devices")
(USE "Punishment devices")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002578")
(TNR "tgm002583"))


(CONCEPT
(DESCRIPTOR "Corporate mergers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Business takeovers")
(UF "Corporate takeovers")
(BT "Business & finance")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002579")
(TNR "tgm002584"))


(CONCEPT
(NON-DESCRIPTOR "Corporate takeovers")
(USE "Corporate mergers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002580")
(TNR "tgm002585"))


(CONCEPT
(NON-DESCRIPTOR "Corpses")
(USE "Dead persons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002581")
(TNR "tgm002586"))


(CONCEPT
(NON-DESCRIPTOR "Corpulence")
(USE "Obesity")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002582")
(TNR "tgm002587"))


(CONCEPT
(DESCRIPTOR "Corrals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Agricultural facilities")
(RT "Cattle")
(RT "Fences")
(RT "Horses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002583")
(TNR "tgm002588"))


(CONCEPT
(NON-DESCRIPTOR "Correctional facilities")
(USE "Prisons")
(USE "Reformatories")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002584")
(TNR "tgm002589"))


(CONCEPT
(DESCRIPTOR "Correspondence")
(UF "Letters")
(UF "Mail")
(BT "Communication")
(NT "Hate mail")
(NT "Letters to Santa Claus")
(NT "Love letters")
(NT "Telegrams")
(NT "V-mail")
(RT "Postal service")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002585")
(TNR "tgm002590"))


(CONCEPT
(DESCRIPTOR "Correspondence schools")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Education")
(CN ":DOUBLE-INDEX EDUCATIONAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002586")
(TNR "tgm002591"))


(CONCEPT
(NON-DESCRIPTOR "Correspondents")
(USE "Reporters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002587")
(TNR "tgm002592"))


(CONCEPT
(NON-DESCRIPTOR "Corridors")
(USE "Passageways")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002588")
(TNR "tgm002593"))


(CONCEPT
(DESCRIPTOR "Corruption")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Graft")
(UF "Political corruption")
(UF "Political scandals")
(UF "Scandals, Political")
(BT "Behavior")
(RT "Bribery")
(RT "Crimes")
(RT "Ethics")
(RT "Gerrymandering")
(RT "Muckraking")
(RT "Scandals")
(RT "Vice")
(RT "War profiteering")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002589")
(TNR "tgm002594"))


(CONCEPT
(DESCRIPTOR "Corsages")
(BT "Flower arrangements")
(RT "Clothing & dress")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012114"))


(CONCEPT
(NON-DESCRIPTOR "Corsairs")
(USE "Pirates")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002590")
(TNR "tgm002595"))


(CONCEPT
(DESCRIPTOR "Corsets")
(BT "Lingerie")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002591")
(TNR "tgm002596"))


(CONCEPT
(DESCRIPTOR "Cortisone")
(BT "Hormones")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002592")
(TNR "tgm002597"))


(CONCEPT
(DESCRIPTOR "Cosmetics")
(UF "Makeup (Cosmetics)")
(UF "Toilet articles")
(UF "Toiletries")
(BT "Dressing & grooming equipment")
(NT "Hair preparations")
(NT "Lipsticks")
(NT "Perfumes")
(NT "Theatrical makeup")
(RT "Cosmetics industry")
(RT "Cosmetics stores")
(RT "Grooming")
(HN "Changed 6/2006 from COSMETICS & SOAP.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002595")
(TNR "tgm002598"))


(CONCEPT
(DESCRIPTOR "Cosmetics industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Industry")
(RT "Cosmetics")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002593")
(TNR "tgm002599"))


(CONCEPT
(DESCRIPTOR "Cosmetics stores")
(BT "Stores & shops")
(RT "Cosmetics")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002594")
(TNR "tgm002600"))


(CONCEPT
(DESCRIPTOR "Cosmology")
(BT "Philosophy")
(RT "Astronomy")
(RT "Creation")
(RT "Extraterrestrial life")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002596")
(TNR "tgm002601"))


(CONCEPT
(NON-DESCRIPTOR "Cosmonauts")
(USE "Astronauts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002597")
(TNR "tgm002602"))


(CONCEPT
(DESCRIPTOR "Cost & standard of living")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cost of living")
(UF "Living standard")
(UF "Standard of living")
(BT "Economic & social conditions")
(RT "Discounts")
(RT "Inflation")
(RT "Poverty")
(RT "Prices")
(RT "Social classes")
(RT "Thrift")
(RT "Wages")
(RT "Wealth")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002600")
(TNR "tgm002605"))


(CONCEPT
(NON-DESCRIPTOR "Cost of living")
(USE "Cost & standard of living")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002598")
(TNR "tgm002603"))


(CONCEPT
(NON-DESCRIPTOR "Cost of war")
(USE "Economic aspects of war")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002599")
(TNR "tgm002604"))


(CONCEPT
(NON-DESCRIPTOR "Costume balls")
(USE "Masquerades")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002601")
(TNR "tgm002606"))


(CONCEPT
(DESCRIPTOR "Costume design drawings")
(SN "Graphic delineations made for the design and production (or documentation of design and production) of costumes for theatrical and other performing arts productions and for special events, such as costume balls or Halloween.")
(BT "Design drawings")
(RT "Fashion design drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000267")
(FCNlctgm "lctgm002602")
(TNR "tgm002607"))


(CONCEPT
(DESCRIPTOR "Costume jewelry")
(BT "Jewelry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002603")
(TNR "tgm002608"))


(CONCEPT
(DESCRIPTOR "Costume prints")
(SN "Prints made for the documentation or study of clothing, such as national dress or military uniforms; often in series.")
(BT "Prints")
(RT "Fashion prints")
(RT "Genre prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000268")
(FCNlctgm "lctgm002604")
(TNR "tgm002609"))


(CONCEPT
(DESCRIPTOR "Costumes")
(GEO-FACET ":NATIONALITY ")
(SN "For clothing or accessories used to disguise or to take on another identity, including clothing of another time or place.  Search also under THEATRICAL PRODUCTIONS, as well as ACTORS and ACTRESSES for people in costume.  For people in traditional dress :SEARCH-SUBDIVISION the subdivision CLOTHING & DRESS :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix B].")
(UF "Theater costumes")
(BT "Clothing & dress")
(RT "Masks")
(RT "Masquerades")
(RT "Mumming")
(RT "Wigs")
(CN ":SUBDIVIDE-BY :NATIONALITY for national costumes.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002605")
(TNR "tgm002610"))


(CONCEPT
(NON-DESCRIPTOR "Cotillions")
(USE "Balls (Parties)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002606")
(TNR "tgm002611"))


(CONCEPT
(DESCRIPTOR "Cots")
(BT "Beds")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012113"))


(CONCEPT
(NON-DESCRIPTOR "Cottages")
(USE "Dwellings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002607")
(TNR "tgm002612"))


(CONCEPT
(NON-DESCRIPTOR "Cottages, Resort")
(USE "Cabins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002608")
(TNR "tgm002613"))


(CONCEPT
(DESCRIPTOR "Cotton")
(SN "For images that focus on the usually white downy substance produced by various plants.")
(BT "Fibers")
(RT "Cotton gins")
(RT "Cotton industry")
(RT "Cotton plantations")
(RT "Plants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002609")
(TNR "tgm002614"))


(CONCEPT
(DESCRIPTOR "Cotton gins")
(BT "Machinery")
(RT "Cotton")
(RT "Cotton industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002610")
(TNR "tgm002615"))


(CONCEPT
(DESCRIPTOR "Cotton industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities of processing raw cotton and weaving cotton into cloth, and associated structures.")
(UF "Cotton mills")
(BT "Textile industry")
(RT "Cotton")
(RT "Cotton gins")
(RT "Cotton plantations")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002611")
(TNR "tgm002616"))


(CONCEPT
(NON-DESCRIPTOR "Cotton mills")
(USE "Cotton industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002612")
(TNR "tgm002617"))


(CONCEPT
(DESCRIPTOR "Cotton pickers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Agricultural laborers")
(RT "Cotton plantations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002613")
(TNR "tgm002618"))


(CONCEPT
(DESCRIPTOR "Cotton plantations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Plantations")
(RT "Cotton")
(RT "Cotton industry")
(RT "Cotton pickers")
(CN ":DOUBLE-INDEX HARVESTING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002614")
(TNR "tgm002619"))


(CONCEPT
(DESCRIPTOR "Cottonwood trees")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Poplars")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012112"))


(CONCEPT
(DESCRIPTOR "Couches")
(SN "Long seating furniture with a back support and one end, generally used for reclining, not sitting.")
(BT "Seating furniture")
(RT "Sofas")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002615")
(TNR "tgm002620"))


(CONCEPT
(NON-DESCRIPTOR "Cougars")
(USE "Pumas")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002616")
(TNR "tgm002621"))


(CONCEPT
(DESCRIPTOR "Coughing")
(BT "Bodily functions")
(RT "Health")
(RT "Sneezing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002617")
(TNR "tgm002622"))


(CONCEPT
(NON-DESCRIPTOR "Council members, City")
(USE "City council members")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002618")
(TNR "tgm002623"))


(CONCEPT
(NON-DESCRIPTOR "Countenances")
(USE "Faces")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002619")
(TNR "tgm002624"))


(CONCEPT
(DESCRIPTOR "Counterbalances")
(BT "Hardware")
(RT "Weights & measures")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002620")
(TNR "tgm002625"))


(CONCEPT
(DESCRIPTOR "Counterfeiting")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Crimes")
(RT "Fraud")
(RT "Money")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002621")
(TNR "tgm002626"))


(CONCEPT
(NON-DESCRIPTOR "Counterfeits")
(USE "Forgeries")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000269")
(FCNlctgm "lctgm002622")
(TNR "tgm002627"))


(CONCEPT
(DESCRIPTOR "Counterproofs")
(SN "In printmaking, impressions taken from a print or drawing by passing it through a press against a sheet of damp paper.  The image appears in reverse.")
(BT "Prints")
(BT "Proofs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000270")
(FCNlctgm "lctgm002623")
(TNR "tgm002628"))


(CONCEPT
(DESCRIPTOR "Counterrevolutionaries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Contras")
(UF "Counterrevolutionists")
(BT "Activists")
(RT "Counterrevolutions")
(CN "Used in a note under COUNTERREVOLUTIONS.")
(HN "Prior to 5/1992 the term COUNTERREVOLUTIONISTS was used.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002624")
(TNR "tgm002629"))


(CONCEPT
(NON-DESCRIPTOR "Counterrevolutionists")
(USE "Counterrevolutionaries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002625")
(TNR "tgm002630"))


(CONCEPT
(DESCRIPTOR "Counterrevolutions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of counterrevolutions in general. :SEARCH-SUBDIVISION COUNTERREVOLUTIONISTS for images that focus on real persons.")
(BT "Events")
(RT "Counterrevolutionaries")
(RT "Revolutions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002626")
(TNR "tgm002631"))


(CONCEPT
(DESCRIPTOR "Counters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "A long horizontal surface used in stores, shops, and banks, of a height convenient to persons standing or sitting on stools.")
(BT "Furniture")
(RT "Built-in furniture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002627")
(TNR "tgm002632"))


(CONCEPT
(DESCRIPTOR "Counting")
(BT "Measuring")
(NT "Vote counting")
(RT "Coin counting machines")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002628")
(TNR "tgm002633"))


(CONCEPT
(NON-DESCRIPTOR "Counting devices")
(USE "Coin counting machines")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002629")
(TNR "tgm002634"))


(CONCEPT
(NON-DESCRIPTOR "Counting of votes")
(USE "Vote counting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002630")
(TNR "tgm002635"))


(CONCEPT
(DESCRIPTOR "Country clubs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Clubs")
(CN ":DOUBLE-INDEX ORGANIZATIONS' FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002631")
(TNR "tgm002636"))


(CONCEPT
(NON-DESCRIPTOR "Country elevators")
(USE "Grain elevators")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002632")
(TNR "tgm002637"))


(CONCEPT
(DESCRIPTOR "Country life")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Rural life")
(BT "Manners & customs")
(NT "Farm life")
(NT "Frontier & pioneer life")
(RT "Bees (Cooperative gatherings)")
(RT "Economic & social conditions")
(RT "Home food processing")
(RT "Square dancing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002633")
(TNR "tgm002638"))


(CONCEPT
(NON-DESCRIPTOR "Country stores")
(USE "General stores")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002634")
(TNR "tgm002639"))


(CONCEPT
(NON-DESCRIPTOR "Countryside")
(USE "Rural areas")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012164"))


(CONCEPT
(NON-DESCRIPTOR "County fairs")
(USE "Fairs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002635")
(TNR "tgm002640"))


(CONCEPT
(DESCRIPTOR "County government")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Politics & government")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002636")
(TNR "tgm002641"))


(CONCEPT
(DESCRIPTOR "Coup sticks")
(SN "A ceremonial wand, stick, or rattle with which a Native American warrior taps an enemy as a way to prove bravery.")
(BT "Arms & armament")
(RT "Warriors")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002637")
(TNR "tgm002642"))


(CONCEPT
(DESCRIPTOR "Couples")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For couples not known to be husband and wife.")
(BT "People")
(RT "Courtship")
(RT "Love")
(RT "Romances")
(RT "Spouses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002638")
(TNR "tgm002643"))


(CONCEPT
(DESCRIPTOR "Coupon stores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Premium stores")
(BT "Stores & shops")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002639")
(TNR "tgm002644"))


(CONCEPT
(DESCRIPTOR "Coupons")
(SN "Printed slips of paper redeemable for goods or services.")
(UF "Ration stamps")
(BT "Ephemera")
(RT "Money")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000271")
(FCNlctgm "lctgm002640")
(TNR "tgm002645"))


(CONCEPT
(DESCRIPTOR "Courage")
(UF "Bravery")
(BT "Mental states")
(RT "Cowardice")
(RT "Heroes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002641")
(TNR "tgm002646"))


(CONCEPT
(DESCRIPTOR "Courses (Wall components)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Layers of masonry units running horizontally in a wall or over an arch.")
(BT "Architectural elements")
(NT "Stringcourses")
(RT "Walls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002642")
(TNR "tgm002647"))


(CONCEPT
(NON-DESCRIPTOR "Courses, Belt")
(USE "Stringcourses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002643")
(TNR "tgm002648"))


(CONCEPT
(NON-DESCRIPTOR "Court houses")
(USE "Courthouses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002644")
(TNR "tgm002649"))


(CONCEPT
(NON-DESCRIPTOR "Court martial")
(USE "Courts martial & courts of inquiry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002645")
(TNR "tgm002650"))


(CONCEPT
(DESCRIPTOR "Courtesans")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Prostitutes")
(RT "Prostitution")
(RT "Relations between the sexes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002646")
(TNR "tgm002651"))


(CONCEPT
(NON-DESCRIPTOR "Courtesies")
(USE "Etiquette")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002647")
(TNR "tgm002652"))


(CONCEPT
(DESCRIPTOR "Courthouses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on facilities.  :SEARCH-SUBDIVISION JUDICIAL PROCEEDINGS for activities.")
(UF "Court houses")
(BT "Government facilities")
(RT "Courtrooms")
(RT "Judicial proceedings")
(RT "Justice facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002648")
(TNR "tgm002653"))


(CONCEPT
(NON-DESCRIPTOR "Courting")
(USE "Courtship")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002649")
(TNR "tgm002654"))


(CONCEPT
(NON-DESCRIPTOR "Courtroom art")
(USE "Courtroom sketches")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000272")
(FCNlctgm "lctgm002650")
(TNR "tgm002655"))


(CONCEPT
(NON-DESCRIPTOR "Courtroom illustrations")
(USE "Courtroom sketches")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000273")
(FCNlctgm "lctgm002651")
(TNR "tgm002656"))


(CONCEPT
(DESCRIPTOR "Courtroom sketches")
(SN "Graphic delineations made during courtroom proceedings to illustrate newspaper, television, or other trial accounts.")
(UF "Courtroom art")
(UF "Courtroom illustrations")
(UF "Trial sketches")
(BT "Illustrations")
(HN "Changed 6/94. Formerly, COURTROOM SKETCHES may have been indexed as COURTROOM ILLUSTRATIONS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000274")
(FCNlctgm "lctgm002652")
(TNR "tgm002657"))


(CONCEPT
(DESCRIPTOR "Courtrooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Interiors")
(RT "Courthouses")
(RT "Judicial proceedings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002653")
(TNR "tgm002658"))


(CONCEPT
(NON-DESCRIPTOR "Courts")
(USE "Judicial proceedings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002654")
(TNR "tgm002659"))


(CONCEPT
(DESCRIPTOR "Courts martial & courts of inquiry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Court martial")
(UF "Courts of inquiry")
(UF "Inquiry, Military courts of")
(UF "Investigations, Military")
(BT "Investigation")
(BT "Judicial proceedings")
(RT "Military art & science")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002655")
(TNR "tgm002660"))


(CONCEPT
(NON-DESCRIPTOR "Courts of inquiry")
(USE "Courts martial & courts of inquiry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002656")
(TNR "tgm002661"))


(CONCEPT
(NON-DESCRIPTOR "Courts, Tennis")
(USE "Tennis courts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002658")
(TNR "tgm002663"))


(CONCEPT
(DESCRIPTOR "Courtship")
(UF "Courting")
(UF "Flirtation")
(UF "Wooing")
(BT "Interpersonal relations")
(BT "Manners & customs")
(NT "Marriage proposals")
(RT "Couples")
(RT "Cupids")
(RT "Dating (Social custom)")
(RT "Free love")
(RT "Kissing")
(RT "Love")
(RT "Love letters")
(RT "Lovers' lanes")
(RT "Marriage")
(RT "Relations between the sexes")
(RT "Romances")
(RT "Seduction")
(HN "Changed 11/1992 from COURTSHIP & LOVE.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002657")
(TNR "tgm002662"))


(CONCEPT
(DESCRIPTOR "Courtyards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Rooms & spaces")
(RT "Atriums")
(RT "Patios")
(RT "Quadrangles (Courtyards)")
(RT "Walls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002659")
(TNR "tgm002664"))


(CONCEPT
(NON-DESCRIPTOR "Couturiers")
(USE "Fashion designers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002660")
(TNR "tgm002665"))


(CONCEPT
(DESCRIPTOR "Cove lighting")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Lighting from sources which are out of sight.")
(BT "Lighting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002661")
(TNR "tgm002666"))


(CONCEPT
(DESCRIPTOR "Coveralls")
(BT "Protective clothing")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012153"))


(CONCEPT
(DESCRIPTOR "Covered bridges")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Bridges")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002662")
(TNR "tgm002667"))


(CONCEPT
(DESCRIPTOR "Covered wagons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Conestoga wagons")
(BT "Carts & wagons")
(RT "Wagon trains")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002663")
(TNR "tgm002668"))


(CONCEPT
(DESCRIPTOR "Covered walks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Porticoes (Covered walks)")
(BT "Walkways")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002664")
(TNR "tgm002669"))


(CONCEPT
(DESCRIPTOR "Covers (Illustration)")
(SN "Illustrations and original designs for the covers of books, periodicals, pamphlets, and other graphic design works.")
(UF "Illustrated covers")
(BT "Graphic design drawings")
(NT "Album covers")
(NT "Book covers")
(NT "Magazine covers")
(RT "Illustrations")
(RT "Packaging")
(RT "Sheet music covers")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000275")
(FCNlctgm "lctgm002665")
(TNR "tgm002670"))


(CONCEPT
(NON-DESCRIPTOR "Covers, Album")
(USE "Album covers")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000276")
(FCNlctgm "lctgm002666")
(TNR "tgm002671"))


(CONCEPT
(NON-DESCRIPTOR "Covers, Illustrated")
(USE "Pictorial envelopes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000277")
(FCNlctgm "lctgm002667")
(TNR "tgm002672"))


(CONCEPT
(NON-DESCRIPTOR "Covers, Magazine")
(USE "Magazine covers")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000278")
(FCNlctgm "lctgm002668")
(TNR "tgm002673"))


(CONCEPT
(NON-DESCRIPTOR "Covers, Patriotic")
(USE "Patriotic envelopes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000279")
(FCNlctgm "lctgm002669")
(TNR "tgm002674"))


(CONCEPT
(NON-DESCRIPTOR "Covers, Record")
(USE "Album covers")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000280")
(FCNlctgm "lctgm002670")
(TNR "tgm002675"))


(CONCEPT
(NON-DESCRIPTOR "Covers, Sheet music")
(USE "Sheet music covers")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000281")
(FCNlctgm "lctgm002671")
(TNR "tgm002676"))


(CONCEPT
(DESCRIPTOR "Covert operations")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "For activities, subversive or otherwise, performed surreptitiously, usually for political or military purposes. :SEARCH-SUBDIVISION --COVERT OPERATIONS :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(UF "Operations, Covert")
(BT "Activities")
(RT "Military intelligence")
(RT "Secret service")
(RT "Spying")
(CN ":SUBDIVIDE-BY :NATIONALITY of those initiating the operation.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002672")
(TNR "tgm002677"))


(CONCEPT
(NON-DESCRIPTOR "Coves")
(USE "Bays (Bodies of water)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002673")
(TNR "tgm002678"))


(CONCEPT
(NON-DESCRIPTOR "Covetousness")
(USE "Avarice")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002674")
(TNR "tgm002679"))


(CONCEPT
(NON-DESCRIPTOR "Cow milking")
(USE "Milking")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002675")
(TNR "tgm002680"))


(CONCEPT
(DESCRIPTOR "Cowardice")
(BT "Mental states")
(RT "Courage")
(RT "Fear")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002676")
(TNR "tgm002681"))


(CONCEPT
(DESCRIPTOR "Cowboy boots")
(BT "Boots")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002677")
(TNR "tgm002682"))


(CONCEPT
(DESCRIPTOR "Cowboy hats")
(BT "Hats")
(RT "Cowboys")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002678")
(TNR "tgm002683"))


(CONCEPT
(DESCRIPTOR "Cowboys")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Stockmen (Animal industry)")
(UF "Vaqueros")
(BT "Men")
(NT "Gauchos")
(RT "Broncos")
(RT "Cattle branding")
(RT "Cattle herding")
(RT "Chaps")
(RT "Cowboy hats")
(RT "Cowgirls")
(RT "Ranches")
(RT "Rodeos")
(RT "Roping")
(RT "Westerns")
(RT "Wild west shows")
(CN ":SUBDIVIDE-BY geographically for the place cowboys are depicted.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002679")
(TNR "tgm002684"))


(CONCEPT
(DESCRIPTOR "Cowgirls")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Women")
(RT "Cowboys")
(RT "Ranches")
(RT "Rodeos")
(RT "Westerns")
(RT "Wild west shows")
(CN ":SUBDIVIDE-BY geographically for place where cowgirls are depicted.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002680")
(TNR "tgm002685"))


(CONCEPT
(NON-DESCRIPTOR "Cowherds")
(USE "Cattle herders")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012152"))


(CONCEPT
(DESCRIPTOR "Cows")
(GEO-FACET ":COUNTRY :STATE")
(BT "Cattle")
(RT "Bulls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002681")
(TNR "tgm002686"))


(CONCEPT
(NON-DESCRIPTOR "Coyns")
(USE "Quoins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002682")
(TNR "tgm002687"))


(CONCEPT
(DESCRIPTOR "Coyote hunting")
(GEO-FACET ":COUNTRY :STATE")
(BT "Hunting")
(RT "Coyotes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002683")
(TNR "tgm002688"))


(CONCEPT
(DESCRIPTOR "Coyotes")
(GEO-FACET ":COUNTRY :STATE")
(BT "Wolves")
(RT "Coyote hunting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002684")
(TNR "tgm002689"))


(CONCEPT
(DESCRIPTOR "Crab apples")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Apples")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012149"))


(CONCEPT
(DESCRIPTOR "Crabs")
(GEO-FACET ":COUNTRY :STATE")
(BT "Shellfish")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002685")
(TNR "tgm002690"))


(CONCEPT
(NON-DESCRIPTOR "Crack (Cocaine)")
(USE "Cocaine")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002686")
(TNR "tgm002691"))


(CONCEPT
(DESCRIPTOR "Crackers")
(BT "Baked products")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002687")
(TNR "tgm002692"))


(CONCEPT
(DESCRIPTOR "Cradleboards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Equipment")
(RT "Infants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002688")
(TNR "tgm002693"))


(CONCEPT
(DESCRIPTOR "Cradles")
(BT "Children's furniture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002689")
(TNR "tgm002694"))


(CONCEPT
(NON-DESCRIPTOR "Craft (Handicraft)")
(USE "Handicraft")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002690")
(TNR "tgm002695"))


(CONCEPT
(DESCRIPTOR "Cranberries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Berries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002691")
(TNR "tgm002696"))


(CONCEPT
(NON-DESCRIPTOR "Cranes")
(USE "Hoisting machinery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002692")
(TNR "tgm002697"))


(CONCEPT
(DESCRIPTOR "Cranes (Birds)")
(GEO-FACET ":COUNTRY :STATE")
(UF "Whooping cranes")
(BT "Birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002693")
(TNR "tgm002698"))


(CONCEPT
(NON-DESCRIPTOR "Crap")
(USE "Feces")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002694")
(TNR "tgm002699"))


(CONCEPT
(NON-DESCRIPTOR "Craps")
(USE "Gambling")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002695")
(TNR "tgm002700"))


(CONCEPT
(DESCRIPTOR "Crash tests")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Testing")
(RT "Accidents")
(RT "Safety")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002696")
(TNR "tgm002701"))


(CONCEPT
(NON-DESCRIPTOR "Crate labels, Fruit")
(USE "Fruit crate labels")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000282")
(FCNlctgm "lctgm002697")
(TNR "tgm002702"))


(CONCEPT
(DESCRIPTOR "Craters")
(GEO-FACET ":COUNTRY :STATE")
(BT "Land")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002698")
(TNR "tgm002703"))


(CONCEPT
(DESCRIPTOR "Crates")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Containers")
(RT "Shipping")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002699")
(TNR "tgm002704"))


(CONCEPT
(NON-DESCRIPTOR "Cravats")
(USE "Neckties")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002700")
(TNR "tgm002705"))


(CONCEPT
(DESCRIPTOR "Crawling & creeping")
(UF "Creeping")
(BT "Locomotion")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002701")
(TNR "tgm002706"))


(CONCEPT
(DESCRIPTOR "Crayon drawings")
(UF "Conté crayon drawings")
(BT "Drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000283")
(FCNlctgm "lctgm002702")
(TNR "tgm002707"))


(CONCEPT
(DESCRIPTOR "Crayon enlargements")
(SN "Photographic portraits, usually oval in shape, often life-size enlargements, made from the 1860s to 1920s by drawing extensively in charcoal or pastel over a faint photographic print.")
(UF "Crayon photographic prints")
(UF "Crayon prints")
(BT "Photographic prints")
(RT "Drawings")
(RT "Portraits")
(HN "Changed 6/94. Formerly, CRAYON ENLARGEMENTS may have been indexed as CRAYON PRINTS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000284")
(FCNlctgm "lctgm002703")
(TNR "tgm002708"))


(CONCEPT
(DESCRIPTOR "Crayon manner prints")
(SN "Etchings, engravings, or drypoints in which dots placed close together, usually by a roulette wheel, create lines which approximate crayon strokes. In vogue in France in the 1700s; chiefly used to reproduce drawings.")
(BT "Intaglio prints")
(RT "Reproductive prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000285")
(FCNlctgm "lctgm002704")
(TNR "tgm002709"))


(CONCEPT
(NON-DESCRIPTOR "Crayon photographic prints")
(USE "Crayon enlargements")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000286")
(FCNlctgm "lctgm002705")
(TNR "tgm002710"))


(CONCEPT
(NON-DESCRIPTOR "Crayon prints")
(USE "Crayon enlargements")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000287")
(FCNlctgm "lctgm002706")
(TNR "tgm002711"))


(CONCEPT
(NON-DESCRIPTOR "Crazes")
(USE "Fads")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002707")
(TNR "tgm002712"))


(CONCEPT
(DESCRIPTOR "Creation")
(UF "Beginnings")
(UF "Origins")
(BT "Concepts")
(RT "Civilization")
(RT "Cosmology")
(RT "Evolution")
(RT "Inventions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002708")
(TNR "tgm002713"))


(CONCEPT
(DESCRIPTOR "Crèches (Nativity scenes)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Christmas crèches")
(UF "Manger scenes (Crèches)")
(UF "Nativity scenes (Crèches)")
(BT "Festive decorations")
(RT "Biblical events")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002709")
(TNR "tgm002714"))


(CONCEPT
(DESCRIPTOR "Credences")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Small table or shelves in a church where the bread and wine rest before consecration.")
(BT "Religious articles")
(RT "Religious architectural elements")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002710")
(TNR "tgm002715"))


(CONCEPT
(NON-DESCRIPTOR "Credenzas")
(USE "Buffets (Furniture)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002711")
(TNR "tgm002716"))


(CONCEPT
(DESCRIPTOR "Credit")
(SN "Amount or limit to which a person or body may receive goods or money on trust of future repayment.")
(BT "Business & finance")
(RT "Banking")
(RT "Credit cards")
(RT "Debt")
(RT "Usury")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002712")
(TNR "tgm002717"))


(CONCEPT
(DESCRIPTOR "Credit cards")
(UF "Cards, Charge")
(UF "Cards, Credit")
(UF "Charge cards")
(BT "Ephemera")
(RT "Credit")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002713")
(TNR "tgm002718"))


(CONCEPT
(NON-DESCRIPTOR "Creeks")
(USE "Streams")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002714")
(TNR "tgm002719"))


(CONCEPT
(NON-DESCRIPTOR "Creeping")
(USE "Crawling & creeping")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002715")
(TNR "tgm002720"))


(CONCEPT
(DESCRIPTOR "Cremation")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION CREMATORIUMS for images that focus on facilities.")
(UF "Burning the dead")
(BT "Funeral rites & ceremonies")
(RT "Crematoriums")
(RT "Death")
(CN "Used in a note under CREMATORIUMS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002716")
(TNR "tgm002721"))


(CONCEPT
(DESCRIPTOR "Crematoriums")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on buildings and other facilities, including ovens in concentration camps. :SEARCH-SUBDIVISION CREMATION for activities.")
(BT "Funerary facilities")
(RT "Cremation")
(RT "Morgues & mortuaries")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002717")
(TNR "tgm002722"))


(CONCEPT
(DESCRIPTOR "Cretinism")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "A medical condition due to congenital lack of thyroid hormone, marked by arrested physical and mental development.")
(BT "Birth defects")
(RT "Dwarfs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002718")
(TNR "tgm002723"))


(CONCEPT
(DESCRIPTOR "Crew quarters")
(UF "Cabins, Ship")
(BT "Interiors")
(RT "Officers' quarters")
(RT "Vessels")
(CN ":DOUBLE-INDEX type of vessel.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002719")
(TNR "tgm002724"))


(CONCEPT
(NON-DESCRIPTOR "Crew rowing")
(USE "Team rowing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002720")
(TNR "tgm002725"))


(CONCEPT
(NON-DESCRIPTOR "Crewing")
(USE "Team rowing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002721")
(TNR "tgm002726"))


(CONCEPT
(NON-DESCRIPTOR "Crews")
(USE "Sailors")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002722")
(TNR "tgm002727"))


(CONCEPT
(NON-DESCRIPTOR "Criblée prints")
(USE "Dotted prints")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000288")
(FCNlctgm "lctgm002723")
(TNR "tgm002728"))


(CONCEPT
(NON-DESCRIPTOR "Cribs")
(USE "Children's furniture")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002724")
(TNR "tgm002729"))


(CONCEPT
(NON-DESCRIPTOR "Cribs, Corn")
(USE "Corn cribs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002725")
(TNR "tgm002730"))


(CONCEPT
(DESCRIPTOR "Cricket")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Sports")
(RT "Cricket players")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002726")
(TNR "tgm002731"))


(CONCEPT
(DESCRIPTOR "Cricket players")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cricketers")
(BT "Athletes")
(RT "Cricket")
(CN "Geographic subdivision indicates place where team or player is based.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002727")
(TNR "tgm002732"))


(CONCEPT
(NON-DESCRIPTOR "Cricketers")
(USE "Cricket players")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002728")
(TNR "tgm002733"))


(CONCEPT
(DESCRIPTOR "Crickets")
(GEO-FACET ":COUNTRY :STATE")
(BT "Insects")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002729")
(TNR "tgm002734"))


(CONCEPT
(NON-DESCRIPTOR "Criers")
(USE "Peddlers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002730")
(TNR "tgm002735"))


(CONCEPT
(DESCRIPTOR "Cries")
(SN "Genre works featuring peddlers hawking their wares with, usually, the text of the rhyme they cried. Introduced by the 1500s; prints, paintings, or drawings.")
(UF "Street cries")
(BT "Genre works")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000289")
(FCNlctgm "lctgm002731")
(TNR "tgm002736"))


(CONCEPT
(NON-DESCRIPTOR "Crime photographs")
(USE "Forensic photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000290")
(FCNlctgm "lctgm002732")
(TNR "tgm002737"))


(CONCEPT
(NON-DESCRIPTOR "Crime syndicates")
(USE "Organized crime")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002733")
(TNR "tgm002738"))


(CONCEPT
(NON-DESCRIPTOR "Crime victims")
(USE "Victims of crimes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002734")
(TNR "tgm002739"))


(CONCEPT
(DESCRIPTOR "Crimes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Activities")
(NT "Arson")
(NT "Art thefts")
(NT "Automobile theft")
(NT "Bigamy")
(NT "Bribery")
(NT "Cattle raids")
(NT "Child trafficking")
(NT "Counterfeiting")
(NT "Drunk driving")
(NT "Embezzlement")
(NT "Extortion")
(NT "Hate crimes")
(NT "Homicides")
(NT "Illegal arms transfers")
(NT "Kidnappings")
(NT "Organized crime")
(NT "Poaching")
(NT "Rapes")
(NT "Robberies")
(NT "Sabotage")
(NT "Sedition")
(NT "Smuggling")
(NT "Terrorism")
(NT "Treason")
(NT "Vandalism")
(NT "War crimes")
(RT "Abused children")
(RT "Abused women")
(RT "Atrocities")
(RT "Corruption")
(RT "Criminal investigations")
(RT "Criminals")
(RT "Family violence")
(RT "Gambling")
(RT "Impeachments")
(RT "Law enforcement")
(RT "Libel & slander")
(RT "Prostitution")
(RT "Rebellions")
(RT "Security systems")
(RT "Self-defense")
(RT "Sexual harassment")
(RT "Swindlers")
(RT "Threats")
(RT "Vice")
(RT "Victims of crimes")
(RT "Violence")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002735")
(TNR "tgm002740"))


(CONCEPT
(DESCRIPTOR "Crimes of passion")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Crimes passionel")
(BT "Homicides")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002736")
(TNR "tgm002741"))


(CONCEPT
(NON-DESCRIPTOR "Crimes passionel")
(USE "Crimes of passion")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002737")
(TNR "tgm002742"))


(CONCEPT
(DESCRIPTOR "Criminal investigations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Investigation")
(RT "Crimes")
(RT "Informers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002738")
(TNR "tgm002743"))


(CONCEPT
(DESCRIPTOR "Criminals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bandits")
(UF "Delinquents")
(UF "Desperadoes")
(UF "Gangsters")
(UF "Highwaymen")
(UF "Offenders")
(UF "Outlaws")
(UF "Robbers")
(BT "People")
(NT "Fugitives from justice")
(NT "Pickpockets")
(NT "Pirates")
(NT "Serial murderers")
(NT "Swindlers")
(NT "Terrorists")
(RT "Confessions")
(RT "Crimes")
(RT "Gangs")
(RT "Juvenile delinquents")
(RT "Military deserters")
(RT "Organized crime")
(RT "Prisoners")
(RT "Punishment & torture")
(RT "Punishment devices")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002739")
(TNR "tgm002744"))


(CONCEPT
(NON-DESCRIPTOR "Crippled persons")
(USE "People with disabilities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002740")
(TNR "tgm002745"))


(CONCEPT
(DESCRIPTOR "Crises")
(SN "The condition of economic or political instability which leads to change.")
(BT "Concepts")
(RT "Economic & political systems")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002741")
(TNR "tgm002746"))


(CONCEPT
(NON-DESCRIPTOR "Crisis, Midlife")
(USE "Midlife crisis")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002742")
(TNR "tgm002747"))


(CONCEPT
(DESCRIPTOR "Criticism")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Communication")
(RT "Critics")
(RT "Irony")
(RT "Mental states")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002743")
(TNR "tgm002748"))


(CONCEPT
(DESCRIPTOR "Critics")
(UF "Art critics")
(UF "Literary critics")
(BT "People")
(RT "Criticism")
(RT "Pundits")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002744")
(TNR "tgm002749"))


(CONCEPT
(DESCRIPTOR "Crocheting")
(BT "Needlework")
(RT "Yarn")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002745")
(TNR "tgm002750"))


(CONCEPT
(NON-DESCRIPTOR "Crockery")
(USE "Pottery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002746")
(TNR "tgm002751"))


(CONCEPT
(DESCRIPTOR "Crocodiles")
(GEO-FACET ":COUNTRY :STATE")
(BT "Reptiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002747")
(TNR "tgm002752"))


(CONCEPT
(DESCRIPTOR "Crocuses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Flowers")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012147"))


(CONCEPT
(DESCRIPTOR "Crop dusting")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Aerial dusting in agriculture")
(UF "Aerial spraying in agriculture")
(BT "Pest control")
(RT "Airplanes")
(RT "Farming")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002748")
(TNR "tgm002753"))


(CONCEPT
(NON-DESCRIPTOR "Crop picking")
(USE "Harvesting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002749")
(TNR "tgm002754"))


(CONCEPT
(DESCRIPTOR "Crop rotation")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Break crops")
(UF "Rotation of crops")
(BT "Farming")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002750")
(TNR "tgm002755"))


(CONCEPT
(DESCRIPTOR "Croplands")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Land that is suited to or used for crops.")
(UF "Farmland")
(UF "Fields (Agriculture)")
(BT "Land")
(RT "Farms")
(RT "Land use")
(RT "Meadows")
(CN ":DOUBLE-INDEX crop as appropriate.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002751")
(TNR "tgm002756"))


(CONCEPT
(NON-DESCRIPTOR "Crops")
(USE "Farming")
(USE "Plants")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002752")
(TNR "tgm002757"))


(CONCEPT
(DESCRIPTOR "Croquet")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Games")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002753")
(TNR "tgm002758"))


(CONCEPT
(DESCRIPTOR "Crosiers")
(SN "Staffs resembling shepherds crooks borne by bishops, abbots, or abbesses as a symbol of office.")
(UF "Croziers")
(BT "Religious articles")
(BT "Staffs (Sticks)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002754")
(TNR "tgm002759"))


(CONCEPT
(DESCRIPTOR "Cross burning")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Hate crimes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002755")
(TNR "tgm002760"))


(CONCEPT
(DESCRIPTOR "Cross dressing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For persons dressing as if they were members of the opposite sex, regardless of purpose.")
(UF "Men in women's clothing")
(UF "Transvestism")
(UF "Women in men's clothing")
(BT "Impersonation")
(RT "Clothing & dress")
(RT "Female impersonators")
(RT "Relations between the sexes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002756")
(TNR "tgm002761"))


(CONCEPT
(DESCRIPTOR "Crossbows")
(BT "Arms & armament")
(BT "Bows (Archery)")
(RT "Archery")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002757")
(TNR "tgm002762"))


(CONCEPT
(NON-DESCRIPTOR "Cross-country journeys")
(USE "Transcontinental journeys")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002766")
(TNR "tgm002771"))


(CONCEPT
(DESCRIPTOR "Crosscut saws")
(BT "Saws")
(RT "Lumber industry")
(RT "Woodcutting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002758")
(TNR "tgm002763"))


(CONCEPT
(DESCRIPTOR "Crossed fingers")
(BT "Fingers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002759")
(TNR "tgm002764"))


(CONCEPT
(DESCRIPTOR "Crosses")
(BT "Objects")
(BT "Symbols")
(RT "Crucifixes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002760")
(TNR "tgm002765"))


(CONCEPT
(NON-DESCRIPTOR "Crossings, Low water")
(USE "Fords (Stream crossings)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002761")
(TNR "tgm002766"))


(CONCEPT
(NON-DESCRIPTOR "Crossings, Railroad")
(USE "Railroad crossings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002762")
(TNR "tgm002767"))


(CONCEPT
(DESCRIPTOR "Crossroads")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Place where two or more roads intersect.")
(BT "Roads")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002763")
(TNR "tgm002768"))


(CONCEPT
(DESCRIPTOR "Crosswalks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Transportation facilities")
(RT "Pedestrians")
(RT "Streets")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002764")
(TNR "tgm002769"))


(CONCEPT
(DESCRIPTOR "Crossword puzzles")
(BT "Games")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002765")
(TNR "tgm002770"))


(CONCEPT
(DESCRIPTOR "Crowbars")
(BT "Hand tools")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002767")
(TNR "tgm002772"))


(CONCEPT
(DESCRIPTOR "Crowds")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Mobs")
(BT "People")
(RT "Audiences")
(RT "Events")
(RT "Overcrowding")
(RT "Queues")
(RT "Rites & ceremonies")
(RT "Spectators")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002768")
(TNR "tgm002773"))


(CONCEPT
(NON-DESCRIPTOR "Crowfooted gables")
(USE "Crow-stepped gables")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002769")
(TNR "tgm002774"))


(CONCEPT
(DESCRIPTOR "Crown of thorns")
(BT "Symbols")
(RT "Crowns")
(RT "Wreaths")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002770")
(TNR "tgm002775"))


(CONCEPT
(DESCRIPTOR "Crowns")
(BT "Clothing & dress")
(RT "Coronations")
(RT "Crown of thorns")
(RT "Jewelry")
(RT "Rulers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002771")
(TNR "tgm002776"))


(CONCEPT
(DESCRIPTOR "Crows")
(GEO-FACET ":COUNTRY :STATE")
(BT "Birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002772")
(TNR "tgm002777"))


(CONCEPT
(DESCRIPTOR "Crow's nests (Ships)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vessel components")
(RT "Ships")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002773")
(TNR "tgm002778"))


(CONCEPT
(DESCRIPTOR "Crow-stepped gables")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Catstep gables")
(UF "Corbel gables")
(UF "Corbiestepped gables")
(UF "Crowfooted gables")
(UF "Step gables")
(BT "Gables")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002774")
(TNR "tgm002779"))


(CONCEPT
(NON-DESCRIPTOR "Croziers")
(USE "Crosiers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002775")
(TNR "tgm002780"))


(CONCEPT
(DESCRIPTOR "Crucifixes")
(SN "A representation of Christ on the cross.")
(BT "Religious articles")
(RT "Crosses")
(RT "Crucifixions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002776")
(TNR "tgm002781"))


(CONCEPT
(DESCRIPTOR "Crucifixions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Executions")
(RT "Crucifixes")
(RT "Stations of the Cross")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002777")
(TNR "tgm002782"))


(CONCEPT
(NON-DESCRIPTOR "Cruciform (Latin) buildings")
(USE "Latin cross-plan buildings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002778")
(TNR "tgm002783"))


(CONCEPT
(DESCRIPTOR "Cruisers (Warships)")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Warships")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002779")
(TNR "tgm002784"))


(CONCEPT
(NON-DESCRIPTOR "Cruises")
(USE "Ocean travel")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002780")
(TNR "tgm002785"))


(CONCEPT
(DESCRIPTOR "Crutches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Medical equipment & supplies")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012146"))


(CONCEPT
(DESCRIPTOR "Crying")
(UF "Weeping")
(BT "Communication")
(RT "Mental states")
(RT "Temper tantrums")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002781")
(TNR "tgm002786"))


(CONCEPT
(NON-DESCRIPTOR "Crystal ball gazing")
(USE "Fortune telling")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002782")
(TNR "tgm002787"))


(CONCEPT
(DESCRIPTOR "Crystal balls")
(BT "Objects")
(RT "Fortune telling")
(RT "Magic")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002783")
(TNR "tgm002788"))


(CONCEPT
(DESCRIPTOR "Crystal glass")
(BT "Glassware")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002784")
(TNR "tgm002789"))


(CONCEPT
(DESCRIPTOR "Crystals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Minerals")
(NT "Salt")
(RT "Quartz")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002785")
(TNR "tgm002790"))


(CONCEPT
(DESCRIPTOR "Crystoleum photographs")
(SN "Photographic prints, usually albumen, the face of which is adhered to glass. The print is made transparent and hand colored, then backed with another glass (which may also be painted to add color to the photo) and a card. They give the appearance of a painting on glass.")
(UF "Chromo-photographs")
(BT "Photographic prints")
(RT "Albumen prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000291")
(FCNlctgm "lctgm002786")
(TNR "tgm002791"))


(CONCEPT
(NON-DESCRIPTOR "Cubs, Bear")
(USE "Bear cubs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002787")
(TNR "tgm002792"))


(CONCEPT
(DESCRIPTOR "Cuckoo clocks")
(BT "Clocks & watches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002788")
(TNR "tgm002793"))


(CONCEPT
(DESCRIPTOR "Cucumbers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Vegetables")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002789")
(TNR "tgm002794"))


(CONCEPT
(DESCRIPTOR "Cuff links")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Jewelry")
(RT "Buttons (Fasteners)")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002790")
(TNR "tgm002795"))


(CONCEPT
(NON-DESCRIPTOR "Cultivation of soils")
(USE "Farming")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002791")
(TNR "tgm002796"))


(CONCEPT
(DESCRIPTOR "Cults")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Organizations")
(RT "Collective settlements")
(RT "Religious groups")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002792")
(TNR "tgm002797"))


(CONCEPT
(NON-DESCRIPTOR "Cultural buildings")
(USE "Cultural facilities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002793")
(TNR "tgm002798"))


(CONCEPT
(DESCRIPTOR "Cultural facilities")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cultural buildings")
(BT "Facilities")
(NT "Archives")
(NT "Athenaeums")
(NT "Auditoriums")
(NT "Bandstands")
(NT "Concert halls")
(NT "Libraries")
(NT "Motion picture studios")
(NT "Theaters")
(NT "Visitors' centers")
(RT "Galleries & museums")
(HN "Changed 1/1993 from CULTURAL BUILDINGS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002794")
(TNR "tgm002799"))


(CONCEPT
(DESCRIPTOR "Cultural policy")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Official government policy toward cultural artifacts or activities; includes protection and restoration of cultural property.")
(BT "Government policy")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002795")
(TNR "tgm002800"))


(CONCEPT
(DESCRIPTOR "Cultural relations")
(UF "Intercultural relations")
(BT "Interpersonal relations")
(RT "Acculturation")
(RT "International relations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002796")
(TNR "tgm002801"))


(CONCEPT
(DESCRIPTOR "Culverts")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For arched drains or sewers.")
(UF "Conduits, Water")
(BT "Hydraulic facilities")
(RT "Bridges")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002797")
(TNR "tgm002802"))


(CONCEPT
(DESCRIPTOR "Cuneiform")
(BT "Writing systems")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002798")
(TNR "tgm002803"))


(CONCEPT
(NON-DESCRIPTOR "Cunes")
(USE "Quoins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002799")
(TNR "tgm002804"))


(CONCEPT
(DESCRIPTOR "Cupboards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Cabinets")
(UF "Dressers, Kitchen")
(UF "Dressers, Pantry")
(UF "Kitchen cabinets")
(UF "Kitchen dressers")
(UF "Pantry dressers")
(BT "Furniture")
(RT "Closets")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002800")
(TNR "tgm002805"))


(CONCEPT
(DESCRIPTOR "Cupids")
(BT "Symbols")
(RT "Children")
(RT "Courtship")
(RT "Love")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002801")
(TNR "tgm002806"))


(CONCEPT
(DESCRIPTOR "Cupolas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Rounded vaults raised on a circular or other base and forming a roof or ceiling.")
(BT "Architectural elements")
(RT "Domes")
(RT "Drums (Domes)")
(RT "Roofs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002802")
(TNR "tgm002807"))


(CONCEPT
(NON-DESCRIPTOR "Cups")
(USE "Drinking vessels")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002803")
(TNR "tgm002808"))


(CONCEPT
(DESCRIPTOR "Curators")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "People associated with education & communication")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012145"))


(CONCEPT
(NON-DESCRIPTOR "Curb markets")
(USE "Stock exchanges")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002804")
(TNR "tgm002809"))


(CONCEPT
(NON-DESCRIPTOR "Cures")
(USE "Healing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002805")
(TNR "tgm002810"))


(CONCEPT
(NON-DESCRIPTOR "Curing (Healing)")
(USE "Healing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002806")
(TNR "tgm002811"))


(CONCEPT
(DESCRIPTOR "Curing (Preservation)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Processes & techniques")
(NT "Fish drying")
(NT "Food drying")
(RT "Hides & skins")
(RT "Home food processing")
(RT "Smokehouses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002807")
(TNR "tgm002812"))


(CONCEPT
(DESCRIPTOR "Curiosities & wonders")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Biggest")
(UF "Extremes")
(UF "Largest")
(UF "Oddities")
(UF "Smallest")
(UF "Trivia")
(UF "Wonders")
(BT "Concepts")
(RT "Firsts")
(RT "Human curiosities")
(RT "World records")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002808")
(TNR "tgm002813"))


(CONCEPT
(DESCRIPTOR "Curiosity")
(BT "Mental states")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002809")
(TNR "tgm002814"))


(CONCEPT
(DESCRIPTOR "Curling")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Winter sports")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002810")
(TNR "tgm002815"))


(CONCEPT
(NON-DESCRIPTOR "Currency")
(USE "Money")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000292")
(FCNlctgm "lctgm002811")
(TNR "tgm002816"))


(CONCEPT
(DESCRIPTOR "Currency question")
(UF "Fiat money")
(UF "Free coinage")
(UF "Monetary question")
(BT "Economic policy")
(NT "Silver question")
(RT "Monetary policy")
(RT "Money")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002812")
(TNR "tgm002817"))


(CONCEPT
(DESCRIPTOR "Cursing")
(SN "For calling upon supernatural powers to send injury upon someone.  Use SWEARING for use of profane language.")
(UF "Execration")
(UF "Imprecation")
(UF "Malediction")
(BT "Communication")
(BT "Supernatural practices")
(RT "Prayer")
(RT "Superstitions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002813")
(TNR "tgm002818"))


(CONCEPT
(DESCRIPTOR "Curtain walls")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Enclosure walls")
(UF "Window walls")
(BT "Walls")
(RT "Windows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002814")
(TNR "tgm002819"))


(CONCEPT
(NON-DESCRIPTOR "Curtains")
(USE "Draperies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002815")
(TNR "tgm002820"))


(CONCEPT
(DESCRIPTOR "Curtsying")
(BT "Etiquette")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002816")
(TNR "tgm002821"))


(CONCEPT
(NON-DESCRIPTOR "Cuspidors")
(USE "Spittoons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002817")
(TNR "tgm002822"))


(CONCEPT
(DESCRIPTOR "Custody of children")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Child custody")
(BT "Law & legal affairs")
(RT "Divorce")
(RT "Families")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002818")
(TNR "tgm002823"))


(CONCEPT
(DESCRIPTOR "Customer relations")
(BT "Interpersonal relations")
(RT "Business enterprises")
(RT "Consumers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002819")
(TNR "tgm002824"))


(CONCEPT
(DESCRIPTOR "Customhouses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Customs houses")
(BT "Government facilities")
(RT "Commerce")
(RT "Customs employees")
(RT "Customs inspections")
(HN "Changed 11/1995 from CUSTOMS HOUSES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002820")
(TNR "tgm002825"))


(CONCEPT
(NON-DESCRIPTOR "Customs")
(USE "Manners & customs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002821")
(TNR "tgm002826"))


(CONCEPT
(NON-DESCRIPTOR "Customs duties")
(USE "Tariffs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002822")
(TNR "tgm002827"))


(CONCEPT
(DESCRIPTOR "Customs employees")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Employees")
(RT "Customhouses")
(RT "Customs inspections")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002823")
(TNR "tgm002828"))


(CONCEPT
(NON-DESCRIPTOR "Customs houses")
(USE "Customhouses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002824")
(TNR "tgm002829"))


(CONCEPT
(DESCRIPTOR "Customs inspections")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Inspections, Customs")
(BT "Inspections")
(RT "Customhouses")
(RT "Customs employees")
(RT "Investigation")
(RT "Searching")
(RT "Tariffs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002825")
(TNR "tgm002830"))


(CONCEPT
(DESCRIPTOR "Cutaway drawings")
(SN "Drawings in which part of an object or structure is removed to show the interior.")
(UF "Drawings, Cutaway")
(BT "Drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000293")
(FCNlctgm "lctgm002827")
(TNR "tgm002832"))


(CONCEPT
(DESCRIPTOR "Cutlery")
(BT "Equipment")
(NT "Knives")
(NT "Scissors & shears")
(RT "Cutlery industry")
(RT "Silverware")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002828")
(TNR "tgm002833"))


(CONCEPT
(DESCRIPTOR "Cutlery industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Equipment industry")
(RT "Cutlery")
(RT "Silverware industry")
(RT "Tableware")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002829")
(TNR "tgm002834"))


(CONCEPT
(NON-DESCRIPTOR "Cut-out figures")
(USE "Cutouts")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000295")
(FCNlctgm "lctgm002832")
(TNR "tgm002837"))


(CONCEPT
(DESCRIPTOR "Cutouts")
(SN "Shapes, forms, or figures cut from, or intended to be cut from, larger pieces of material such as paper, cardboard, wood, or cloth. Often used as decoration, exhibit material, displays, or in miniatures or scale models.")
(UF "Cut-out figures")
(UF "Figures, Cut-out")
(UF "Life-size cutouts")
(UF "Paper cut-outs")
(RT "Cut-paper works")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000294")
(FCNlctgm "lctgm002830")
(TNR "tgm002835"))


(CONCEPT
(DESCRIPTOR "Cutover lands")
(GEO-FACET ":COUNTRY :STATE")
(SN "Land on which most of the salable timber has been cut.")
(UF "Logged-off lands")
(BT "Land")
(RT "Clearing of land")
(RT "Forestry")
(RT "Lumber industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002831")
(TNR "tgm002836"))


(CONCEPT
(DESCRIPTOR "Cut-paper works")
(SN "Images produced by cutting interior areas and sometimes outline shapes to form a design. Examples include hollow cut silhouettes, cobweb valentines, paper snowflakes.")
(UF "Paper cut-outs")
(UF "Scherenschnitte")
(UF "Scissorcraft")
(RT "Cutouts")
(HN "Changed 4/2003. Formerly CUT-PAPER WORKS may have been indexed as PAPER CUTOUTS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000296")
(FCNlctgm "lctgm002833")
(TNR "tgm002838"))


(CONCEPT
(DESCRIPTOR "Cyanotypes")
(SN "Blue photographic prints employing light-sensitive iron salts, most commonly on paper; introduced in the 1840s but not in general use until after 1880; often used as proofs.")
(BT "Monochromatic works")
(BT "Photographic prints")
(NT "Blueprints")
(RT "Proofs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000297")
(FCNlctgm "lctgm002834")
(TNR "tgm002839"))


(CONCEPT
(DESCRIPTOR "Cyclamens")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Flowers")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012144"))


(CONCEPT
(DESCRIPTOR "Cycling")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bicycling")
(BT "Locomotion")
(NT "Bicycle racing")
(RT "Bicycles & tricycles")
(RT "Cyclists")
(RT "Sports")
(RT "Unicycles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002835")
(TNR "tgm002840"))


(CONCEPT
(DESCRIPTOR "Cyclists")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(RT "Athletes")
(RT "Bicycles & tricycles")
(RT "Cycling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002836")
(TNR "tgm002841"))


(CONCEPT
(DESCRIPTOR "Cyclones")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes the event and any resulting damage.")
(BT "Storms")
(RT "Hurricanes")
(RT "Tornadoes")
(CN "Used in a note under STORMS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002837")
(TNR "tgm002842"))


(CONCEPT
(NON-DESCRIPTOR "Cyclopedias")
(USE "Encyclopedias & dictionaries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002838")
(TNR "tgm002843"))


(CONCEPT
(DESCRIPTOR "Cyclotrons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Magnetic resonance accelerators")
(BT "Scientific equipment")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002839")
(TNR "tgm002844"))


(CONCEPT
(DESCRIPTOR "Cymbals")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Percussion instruments")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012143"))


(CONCEPT
(DESCRIPTOR "Cynicism")
(BT "Pessimism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002840")
(TNR "tgm002845"))


(CONCEPT
(DESCRIPTOR "Cypresses")
(BT "Trees")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002841")
(TNR "tgm002846"))


(CONCEPT
(DESCRIPTOR "Cystic fibrosis")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Diseases")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm00284")
(TNR "tgm002847"))


(CONCEPT
(DESCRIPTOR "Dachshunds")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Dogs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002843")
(TNR "tgm002848"))


(CONCEPT
(NON-DESCRIPTOR "Dadoes (Walls)")
(USE "Wainscoting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002844")
(TNR "tgm002849"))


(CONCEPT
(DESCRIPTOR "Daffodils")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Jonquils")
(UF "Narcissus")
(BT "Flowers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002845")
(TNR "tgm002850"))


(CONCEPT
(DESCRIPTOR "Daggers & swords")
(UF "Swords")
(BT "Arms & armament")
(RT "Sword swallowers")
(RT "Sword swallowing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002846")
(TNR "tgm002851"))


(CONCEPT
(DESCRIPTOR "Daguerreotypes")
(SN "Direct-image photographs on silver-coated copper; introduced in 1839 and in general use until ca. 1860; distinctive mirror-like surface; commonly in a case.")
(UF "Cased photographs")
(BT "Photographs")
(CN "Used in a note under PHOTOGRAPHS and STEREOGRAPHS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000298")
(FCNlctgm "lctgm002847")
(TNR "tgm002852"))


(CONCEPT
(DESCRIPTOR "Dairy cattle")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Cattle")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012154"))


(CONCEPT
(DESCRIPTOR "Dairy farming")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the care, breeding, feeding, and milking of dairy cattle. :SEARCH-SUBDIVISION MILKING for the milking of cows away from the context of dairy farms. :SEARCH-SUBDIVISION DAIRYING for the production, processing, and manufacture of milk and its products.")
(BT "Farming")
(RT "Cattle")
(RT "Dairying")
(RT "Milking")
(CN "Used in a note under MILKING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002848")
(TNR "tgm002853"))


(CONCEPT
(DESCRIPTOR "Dairy products")
(BT "Food")
(NT "Butter")
(NT "Cheese")
(NT "Ice cream & ices")
(NT "Milk")
(NT "Yogurt")
(RT "Dairying")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002849")
(TNR "tgm002854"))


(CONCEPT
(NON-DESCRIPTOR "Dairy products industry")
(USE "Dairying")
(HN "Changed 12/2007 to Nonpostable Term (USE DAIRYING).")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002850")
(TNR "tgm002855"))


(CONCEPT
(DESCRIPTOR "Dairy stores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Stores & shops")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002851")
(TNR "tgm002856"))


(CONCEPT
(DESCRIPTOR "Dairy workers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(NT "Milkmen & milkwomen")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002852")
(TNR "tgm002857"))


(CONCEPT
(DESCRIPTOR "Dairying")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the production, processing, and manufacture of milk and its products. Includes activities and structures.")
(UF "Dairy products industry")
(UF "Milk industry")
(BT "Food industry")
(RT "Beverage industry")
(RT "Butter making")
(RT "Cattle")
(RT "Dairy farming")
(RT "Dairy products")
(RT "Goats")
(CN ":DOUBLE-INDEX AGRICULTURAL FACILITIES - or NTs - for images that focus on facilities. Used in a note under BUTTER MAKING and DAIRY FARMING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002853")
(TNR "tgm002858"))


(CONCEPT
(NON-DESCRIPTOR "Dais")
(USE "Podiums")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002854")
(TNR "tgm002859"))


(CONCEPT
(DESCRIPTOR "Daisies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Flowers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002855")
(TNR "tgm002860"))


(CONCEPT
(NON-DESCRIPTOR "Dall sheep")
(USE "Mountain sheep")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002856")
(TNR "tgm002861"))


(CONCEPT
(DESCRIPTOR "Dam construction")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Civil engineering")
(BT "Construction")
(RT "Dams")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002857")
(TNR "tgm002862"))


(CONCEPT
(NON-DESCRIPTOR "Damage to property")
(USE "Accidents")
(USE "Disasters")
(USE "Sabotage")
(USE "Vandalism")
(USE "War damage")
(USE "War destruction & pillage")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002858")
(TNR "tgm002863"))


(CONCEPT
(DESCRIPTOR "Dams")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Hydraulic facilities")
(RT "Beaver dams")
(RT "Dam construction")
(RT "Erosion protection works")
(RT "Hydroelectric power")
(RT "Power plants")
(RT "Reservoirs")
(RT "Spillways")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002859")
(TNR "tgm002864"))


(CONCEPT
(DESCRIPTOR "Dance")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of dance in general and the activity of dancing.  :SEARCH-SUBDIVISION --Dance :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A].")
(BT "Art")
(BT "Locomotion")
(NT "Ballet")
(NT "Ballroom dancing")
(NT "Belly dance")
(NT "Cakewalks")
(NT "Charleston (Dance)")
(NT "Choreography")
(NT "Dragon dance")
(NT "Folk dancing")
(NT "Ghost dance")
(NT "Grass dance")
(NT "Hula dancing")
(NT "Jitterbug dancing")
(NT "Minuets")
(NT "Modern dance")
(NT "Rock & roll dancing")
(NT "Round dancing")
(NT "Snake dance")
(NT "Sun dance")
(NT "Tango")
(NT "Tap dancing")
(NT "Waltz")
(RT "Dance halls")
(RT "Dance marathons")
(RT "Dance parties")
(RT "Dancers")
(RT "Discotheques")
(RT "Entertainment")
(RT "May poles")
(RT "Music")
(RT "Recreation")
(RT "Rites & ceremonies")
(RT "Striptease")
(CN "Used in a note under DANCE HALLS.")
(HN "Changed 9/1995 from Dancing.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002860")
(TNR "tgm002865"))


(CONCEPT
(NON-DESCRIPTOR "Dance bands")
(USE "Big bands")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002861")
(TNR "tgm002866"))


(CONCEPT
(DESCRIPTOR "Dance cards")
(SN "Cards on which :NAMES-OF dances and dance partners may be written.")
(BT "Cards")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000299")
(FCNlctgm "lctgm002862")
(TNR "tgm002867"))


(CONCEPT
(DESCRIPTOR "Dance floors")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Floors")
(RT "Ballrooms")
(RT "Dance halls")
(RT "Discotheques")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002863")
(TNR "tgm002868"))


(CONCEPT
(DESCRIPTOR "Dance halls")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on facilities.  :SEARCH-SUBDIVISION DANCE for activities.")
(BT "Sports & recreation facilities")
(RT "Dance")
(RT "Dance floors")
(RT "Discotheques")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002864")
(TNR "tgm002869"))


(CONCEPT
(DESCRIPTOR "Dance marathons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Marathons")
(RT "Dance")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002865")
(TNR "tgm002870"))


(CONCEPT
(DESCRIPTOR "Dance parties")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For less formal dances; :SEARCH-SUBDIVISION BALLS (PARTIES) for formal dances.")
(UF "Dances")
(BT "Parties")
(NT "Balls (Parties)")
(NT "Hoedowns (Parties)")
(RT "Dance")
(CN "Used in a note under BALLS (PARTIES).")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002866")
(TNR "tgm002871"))


(CONCEPT
(DESCRIPTOR "Dance posters")
(SN "Posters for dance performances; also, posters commemorating dancers or dance companies.")
(BT "Performing arts posters")
(HN "Changed 6/94.  Formerly, DANCE POSTERS may have been indexed as PERFORMING ARTS POSTERS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000300")
(FCNlctgm "lctgm002867")
(TNR "tgm002872"))


(CONCEPT
(DESCRIPTOR "Dancers")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --DANCE :USED-WITH :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A].")
(BT "People")
(NT "Ballet dancers")
(NT "Ceremonial dancers")
(RT "Choreography")
(RT "Dance")
(RT "Entertainers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002868")
(TNR "tgm002873"))


(CONCEPT
(NON-DESCRIPTOR "Dances")
(USE "Dance parties")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002869")
(TNR "tgm002874"))


(CONCEPT
(DESCRIPTOR "Dandies")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Fops")
(BT "Men")
(RT "Clothing & dress")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002870")
(TNR "tgm002875"))


(CONCEPT
(DESCRIPTOR "Danger")
(UF "Hazard")
(UF "Peril")
(BT "Concepts")
(RT "Accidents")
(RT "Action & adventure dramas")
(RT "Disasters")
(RT "Fear")
(RT "Horror dramas")
(RT "Rescues")
(RT "Safety")
(RT "Threats")
(RT "Warnings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002871")
(TNR "tgm002876"))


(CONCEPT
(DESCRIPTOR "Daredevils")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Stunt performers")
(RT "Circus performers")
(RT "Stunt flying")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002872")
(TNR "tgm002877"))


(CONCEPT
(DESCRIPTOR "Darkrooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Photographic darkrooms")
(BT "Rooms & spaces")
(NT "Portable darkrooms")
(RT "Photographic apparatus & supplies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002873")
(TNR "tgm002878"))


(CONCEPT
(NON-DESCRIPTOR "Darkrooms, Portable")
(USE "Portable darkrooms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002874")
(TNR "tgm002879"))


(CONCEPT
(NON-DESCRIPTOR "Dart & egg moldings")
(USE "Egg & dart moldings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002875")
(TNR "tgm002880"))


(CONCEPT
(DESCRIPTOR "Darts")
(BT "Games")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002876")
(TNR "tgm002881"))


(CONCEPT
(NON-DESCRIPTOR "Darwinism")
(USE "Evolution")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002877")
(TNR "tgm002882"))


(CONCEPT
(DESCRIPTOR "Dashboards")
(UF "Instrument panels")
(BT "Equipment")
(RT "Automobile equipment & supplies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002878")
(TNR "tgm002883"))


(CONCEPT
(NON-DESCRIPTOR "Data processing equipment")
(USE "Calculators")
(USE "Computers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002879")
(TNR "tgm002884"))


(CONCEPT
(DESCRIPTOR "Date orchards")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Orchards")
(RT "Dates")
(RT "Palms")
(CN ":DOUBLE-INDEX HARVESTING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002880")
(TNR "tgm002885"))


(CONCEPT
(NON-DESCRIPTOR "Date palms")
(USE "Palms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002881")
(TNR "tgm002886"))


(CONCEPT
(DESCRIPTOR "Dates")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Fruit")
(RT "Date orchards")
(RT "Palms")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002882")
(TNR "tgm002887"))


(CONCEPT
(DESCRIPTOR "Dating (Social custom)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Manners & customs")
(NT "Interracial dating")
(RT "Courtship")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002883")
(TNR "tgm002888"))


(CONCEPT
(NON-DESCRIPTOR "Daughters")
(USE "Families")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002884")
(TNR "tgm002889"))


(CONCEPT
(NON-DESCRIPTOR "Dawn")
(USE "Sunrises & sunsets")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002885")
(TNR "tgm002890"))


(CONCEPT
(DESCRIPTOR "Day care")
(SN "For child or adult care outside of the home during the day.")
(UF "Adult care")
(UF "Child care")
(BT "Activities")
(RT "Babysitting")
(RT "Children")
(RT "Institutional care")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002886")
(TNR "tgm002891"))


(CONCEPT
(DESCRIPTOR "Daydreaming")
(BT "Mental states")
(RT "Dreaming")
(RT "Fantasy")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002887")
(TNR "tgm002892"))


(CONCEPT
(DESCRIPTOR "Daylight savings")
(BT "Time")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002888")
(TNR "tgm002893"))


(CONCEPT
(DESCRIPTOR "Daylilies")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Lilies")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012155"))


(CONCEPT
(NON-DESCRIPTOR "Days of rest")
(USE "Sabbaths")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002889")
(TNR "tgm002894"))


(CONCEPT
(DESCRIPTOR "Dead animals")
(GEO-FACET ":COUNTRY :STATE")
(UF "Bodies")
(UF "Cadavers")
(BT "Animals")
(RT "Death")
(RT "Hunting")
(RT "Hunting trophies")
(RT "Skeletons")
(RT "Taxidermy")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002890")
(TNR "tgm002895"))


(CONCEPT
(DESCRIPTOR "Dead persons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Bodies")
(UF "Cadavers")
(UF "Corpses")
(UF "Deceased")
(BT "People")
(NT "Drowning victims")
(NT "Mummies")
(RT "Coffins")
(RT "Death")
(RT "Deathbeds")
(RT "Executions")
(RT "Funeral rites & ceremonies")
(RT "Seances")
(RT "Skeletons")
(RT "War casualties")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002891")
(TNR "tgm002896"))


(CONCEPT
(DESCRIPTOR "Dead trees")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Trees")
(RT "Death")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012156"))


(CONCEPT
(DESCRIPTOR "Deadly sins")
(SN "The seven capital sins (pride, covetousness, lust, anger, gluttony, envy, and sloth), considered fatal to spiritual progress.")
(UF "Capital sins")
(UF "Seven deadly sins")
(UF "Sins, Deadly")
(BT "Concepts")
(RT "Anger")
(RT "Avarice")
(RT "Envy")
(RT "Gluttony")
(RT "Laziness")
(RT "Lust")
(RT "Pride")
(RT "Religion")
(RT "Temptation")
(RT "Vice")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002892")
(TNR "tgm002897"))


(CONCEPT
(DESCRIPTOR "Deaf persons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People with disabilities")
(RT "Deafness")
(RT "Hearing aids")
(RT "Sign language")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002893")
(TNR "tgm002898"))


(CONCEPT
(DESCRIPTOR "Deafness")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Physical characteristics")
(RT "Deaf persons")
(RT "Hearing aids")
(RT "Sign language")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002894")
(TNR "tgm002899"))


(CONCEPT
(DESCRIPTOR "Dealers' marks")
(SN "Marks of dealers, auction houses, or other sellers.")
(BT "Marks (Symbols)")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000301")
(FCNlctgm "lctgm002895")
(TNR "tgm002900"))


(CONCEPT
(NON-DESCRIPTOR "Dealers, Art")
(USE "Art dealers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002897")
(TNR "tgm002902"))


(CONCEPT
(NON-DESCRIPTOR "Dealerships, Automobile")
(USE "Automobile dealerships")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002896")
(TNR "tgm002901"))


(CONCEPT
(NON-DESCRIPTOR "Deaneries (Buildings)")
(USE "Religious dwellings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002898")
(TNR "tgm002903"))


(CONCEPT
(DESCRIPTOR "Death")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISIONs --DEATH & BURIAL, --DEATH MASK :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B].")
(BT "Events")
(BT "Life cycle")
(NT "Drowning")
(NT "Electrocutions")
(NT "Executions")
(RT "Cremation")
(RT "Dead animals")
(RT "Dead persons")
(RT "Dead trees")
(RT "Dismemberment")
(RT "Funeral rites & ceremonies")
(RT "Graves")
(RT "Heaven")
(RT "Homicides")
(RT "Inheritance & succession")
(RT "Inheritance & transfer taxes")
(RT "Massacres")
(RT "Tombs & sepulchral monuments")
(RT "Wills")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002899")
(TNR "tgm002904"))


(CONCEPT
(DESCRIPTOR "Death & burial")
(CN "Used only as a subdivision with :NAMES-OF :NAMED-PERSON [Appendix B].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm002906")
(TNR "tgm002911"))


(CONCEPT
(DESCRIPTOR "Death certificates")
(BT "Certificates")
(RT "Family trees")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000302")
(FCNlctgm "lctgm002900")
(TNR "tgm002905"))


(CONCEPT
(NON-DESCRIPTOR "Death duties")
(USE "Inheritance & transfer taxes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002901")
(TNR "tgm002906"))


(CONCEPT
(DESCRIPTOR "Death marches")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Atrocities")
(RT "Prisoners of war")
(RT "War crimes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002902")
(TNR "tgm002907"))


(CONCEPT
(DESCRIPTOR "Death mask")
(CN "Used only as a subdivision with :NAMES-OF :NAMED-PERSON [Appendix B].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm002903")
(TNR "tgm002908"))


(CONCEPT
(DESCRIPTOR "Death masks")
(SN ":SEARCH-SUBDIVISION --DEATH MASK :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B].")
(BT "Sculpture")
(RT "Masks")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012157"))


(CONCEPT
(NON-DESCRIPTOR "Death penalty")
(USE "Executions")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002904")
(TNR "tgm002909"))


(CONCEPT
(NON-DESCRIPTOR "Death portraits")
(USE "Postmortem photographs")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000303")
(FCNlctgm "lctgm002905")
(TNR "tgm002910"))


(CONCEPT
(DESCRIPTOR "Deathbeds")
(SN ":SEARCH-SUBDIVISION --DEATH & BURIAL :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B].")
(UF "Last words")
(BT "Beds")
(BT "Concepts")
(RT "Dead persons")
(RT "Last rites")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002907")
(TNR "tgm002912"))


(CONCEPT
(DESCRIPTOR "Death's head")
(BT "Symbols")
(RT "Bones (Body parts)")
(RT "Skull & crossbones")
(RT "Skulls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002908")
(TNR "tgm002913"))


(CONCEPT
(DESCRIPTOR "Debates")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes the activity of engaging in formal debate.")
(UF "Arguments")
(UF "Debating")
(BT "Communication")
(BT "Events")
(RT "Discussion")
(RT "Political participation")
(RT "Public speaking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002909")
(TNR "tgm002914"))


(CONCEPT
(NON-DESCRIPTOR "Debating")
(USE "Debates")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002910")
(TNR "tgm002915"))


(CONCEPT
(DESCRIPTOR "Debris")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "The remains of something broken down or destroyed.")
(BT "Objects")
(RT "Ruins")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002911")
(TNR "tgm002916"))


(CONCEPT
(NON-DESCRIPTOR "Debs")
(USE "Debutantes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002912")
(TNR "tgm002917"))


(CONCEPT
(DESCRIPTOR "Debt")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "IOUs")
(BT "Business & finance")
(NT "Public debt")
(RT "Credit")
(RT "Pawnshops")
(RT "Paying bills")
(RT "Usury")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002913")
(TNR "tgm002918"))


(CONCEPT
(DESCRIPTOR "Debutantes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Coming out")
(UF "Debs")
(BT "Women")
(RT "Manners & customs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002914")
(TNR "tgm002919"))


(CONCEPT
(DESCRIPTOR "Decades")
(BT "Time")
(NT "Nineteen seventies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002915")
(TNR "tgm002920"))


(CONCEPT
(DESCRIPTOR "Decals")
(SN "Images made on paper specially treated so the image can be transferred to another surface, usually by wetting the paper, laying it face down against the other surface, then stripping away the backing sheet.")
(BT "Stickers")
(RT "Transfer sheets")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000304")
(FCNlctgm "lctgm002916")
(TNR "tgm002921"))


(CONCEPT
(DESCRIPTOR "Decapitations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Beheadings")
(BT "Executions")
(RT "Guillotines")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002917")
(TNR "tgm002922"))


(CONCEPT
(NON-DESCRIPTOR "Decay")
(USE "Deterioration")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002918")
(TNR "tgm002923"))


(CONCEPT
(NON-DESCRIPTOR "Decay of buildings")
(USE "Building deterioration")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002919")
(TNR "tgm002924"))


(CONCEPT
(NON-DESCRIPTOR "Deceased")
(USE "Dead persons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002920")
(TNR "tgm002925"))


(CONCEPT
(NON-DESCRIPTOR "Deceit")
(USE "Deception")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002921")
(TNR "tgm002926"))


(CONCEPT
(DESCRIPTOR "Deception")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Deceit")
(UF "Subterfuge")
(BT "Ethics")
(RT "False advertising")
(RT "Fraud")
(RT "Honesty")
(RT "Impersonation")
(CN ":SUBDIVIDE-BY :NATIONALITY of deceivers when the deception is perpetrated by one :NATION on another.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002922")
(TNR "tgm002927"))


(CONCEPT
(DESCRIPTOR "Deckhouses")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "A superstructure on a ship's upper deck.")
(BT "Vessel components")
(RT "Vessels")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002923")
(TNR "tgm002928"))


(CONCEPT
(DESCRIPTOR "Decks (Rooms & spaces)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Sun decks")
(BT "Rooms & spaces")
(RT "Sunspaces")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002924")
(TNR "tgm002929"))


(CONCEPT
(DESCRIPTOR "Decks (Ships)")
(BT "Vessel components")
(RT "Ships")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002925")
(TNR "tgm002930"))


(CONCEPT
(DESCRIPTOR "Declarations of war")
(GEO-FACET ":NATIONALITY ")
(BT "Communication")
(RT "War")
(CN ":SUBDIVIDE-BY :NATIONALITY of :COUNTRY making declaration.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002926")
(TNR "tgm002931"))


(CONCEPT
(NON-DESCRIPTOR "Decline")
(USE "Deterioration")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002927")
(TNR "tgm002932"))


(CONCEPT
(NON-DESCRIPTOR "Decoration, Interior")
(USE "Interior decoration")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002932")
(TNR "tgm002937"))


(CONCEPT
(DESCRIPTOR "Decorations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Ornaments")
(BT "Objects")
(BT "Pictures")
(NT "Artificial flowers")
(NT "Artificial plants")
(NT "Cartouches")
(NT "Dried plant arrangements")
(NT "Festive decorations")
(NT "Flower arrangements")
(NT "Scraps")
(NT "Table settings & decorations")
(NT "Wreaths")
(RT "Architectural decorations & ornaments")
(RT "Christmas decoration stores")
(RT "Illuminations")
(RT "Illustrations")
(RT "Interior decoration")
(RT "Leis")
(RT "Title pages")
(RT "Yard ornaments")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000305")
(FCNlctgm "lctgm002928")
(TNR "tgm002933"))


(CONCEPT
(NON-DESCRIPTOR "Decorations, Festive")
(USE "Festive decorations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002929")
(TNR "tgm002934"))


(CONCEPT
(NON-DESCRIPTOR "Decorations, Military")
(USE "Military decorations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002930")
(TNR "tgm002935"))


(CONCEPT
(NON-DESCRIPTOR "Decorations, Window")
(USE "Window displays")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002931")
(TNR "tgm002936"))


(CONCEPT
(DESCRIPTOR "Decorative arts")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Art")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002933")
(TNR "tgm002938"))


(CONCEPT
(NON-DESCRIPTOR "Decorative plasterwork")
(USE "Plasterwork")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002934")
(TNR "tgm002939"))


(CONCEPT
(DESCRIPTOR "Decoupage")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Art")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002935")
(TNR "tgm002940"))


(CONCEPT
(DESCRIPTOR "Decoys (Hunting)")
(UF "Duck decoys")
(BT "Fishing & hunting gear")
(RT "Game bird hunting")
(RT "Wood carvings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002936")
(TNR "tgm002941"))


(CONCEPT
(NON-DESCRIPTOR "Decrepitude")
(USE "Deterioration")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002937")
(TNR "tgm002942"))


(CONCEPT
(NON-DESCRIPTOR "Dedication of buildings")
(USE "Building dedications")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002938")
(TNR "tgm002943"))


(CONCEPT
(DESCRIPTOR "Dedications")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Ribbon-cutting ceremonies")
(BT "Rites & ceremonies")
(NT "Building dedications")
(NT "Ground breaking ceremonies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002939")
(TNR "tgm002944"))


(CONCEPT
(NON-DESCRIPTOR "Deep-sea fishing")
(USE "Big game fishing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002940")
(TNR "tgm002945"))


(CONCEPT
(DESCRIPTOR "Deer")
(GEO-FACET ":COUNTRY :STATE")
(BT "Animals")
(NT "Antelopes")
(NT "Elk")
(NT "Moose")
(NT "Musk deer")
(NT "Reindeer")
(RT "Antlers")
(RT "Deer hunting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002941")
(TNR "tgm002946"))


(CONCEPT
(DESCRIPTOR "Deer hunting")
(GEO-FACET ":COUNTRY :STATE")
(BT "Big game hunting")
(RT "Deer")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002942")
(TNR "tgm002947"))


(CONCEPT
(NON-DESCRIPTOR "Defamation")
(USE "Libel & slander")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002943")
(TNR "tgm002948"))


(CONCEPT
(DESCRIPTOR "Defecation")
(BT "Bodily functions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002944")
(TNR "tgm002949"))


(CONCEPT
(NON-DESCRIPTOR "Defense (Law)")
(USE "Actions & defenses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002951")
(TNR "tgm002956"))


(CONCEPT
(DESCRIPTOR "Defense budgets")
(GEO-FACET ":COUNTRY :STATE")
(UF "Defense spending")
(BT "Economic policy")
(RT "Defense industry")
(RT "Economic aspects of war")
(RT "Military art & science")
(RT "Military policy")
(RT "National security")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002945")
(TNR "tgm002950"))


(CONCEPT
(DESCRIPTOR "Defense contracts")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Contracts")
(RT "Defense industry")
(RT "Economic aspects of war")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002946")
(TNR "tgm002951"))


(CONCEPT
(DESCRIPTOR "Defense industry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "War industry")
(UF "War production")
(BT "Industry")
(NT "Ordnance industry")
(RT "Defense budgets")
(RT "Defense contracts")
(RT "Defense industry strikes")
(RT "Economic aspects of war")
(RT "Military policy")
(RT "War")
(RT "War rallies")
(CN ":DOUBLE-INDEX type of industry.  :DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002947")
(TNR "tgm002952"))


(CONCEPT
(DESCRIPTOR "Defense industry strikes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Strikes")
(RT "Defense industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002948")
(TNR "tgm002953"))


(CONCEPT
(NON-DESCRIPTOR "Defense policy")
(USE "Military policy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002949")
(TNR "tgm002954"))


(CONCEPT
(NON-DESCRIPTOR "Defense spending")
(USE "Defense budgets")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002950")
(TNR "tgm002955"))


(CONCEPT
(NON-DESCRIPTOR "Defense, Civil")
(USE "Civil defense")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002953")
(TNR "tgm002958"))


(CONCEPT
(NON-DESCRIPTOR "Defense, National")
(USE "National security")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002954")
(TNR "tgm002959"))


(CONCEPT
(NON-DESCRIPTOR "Defenses")
(USE "Forts & fortifications")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002952")
(TNR "tgm002957"))


(CONCEPT
(DESCRIPTOR "Deficit financing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Compensatory spending")
(UF "Spending, Deficit")
(BT "Economic policy")
(RT "Public debt")
(CN ":SUBDIVIDE-BY geographically as appropriate to indicate national, state, or local level.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002955")
(TNR "tgm002960"))


(CONCEPT
(DESCRIPTOR "Dehorning")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animal husbandry")
(RT "Horns (Animal)")
(TTCSubj "Subject [MARC 150/650]")
(TNR "tgm012158"))


(CONCEPT
(NON-DESCRIPTOR "Dehydration of food")
(USE "Food drying")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002956")
(TNR "tgm002961"))


(CONCEPT
(NON-DESCRIPTOR "Deities")
(USE "Goddesses")
(USE "Gods")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002957")
(TNR "tgm002962"))


(CONCEPT
(NON-DESCRIPTOR "Dejection")
(USE "Depression (Mental state)")
(USE "Sadness")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002958")
(TNR "tgm002963"))


(CONCEPT
(DESCRIPTOR "Delegations")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Groups of persons chosen to represent others.")
(BT "People")
(NT "Electoral college")
(RT "Committees")
(RT "Meetings")
(RT "Political representation")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002959")
(TNR "tgm002964"))


(CONCEPT
(DESCRIPTOR "Delicatessens")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Delis")
(BT "Stores & shops")
(RT "Grocery stores")
(RT "Restaurants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002960")
(TNR "tgm002965"))


(CONCEPT
(NON-DESCRIPTOR "Delinquents")
(USE "Criminals")
(USE "Juvenile delinquents")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002961")
(TNR "tgm002966"))


(CONCEPT
(NON-DESCRIPTOR "Delis")
(USE "Delicatessens")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002962")
(TNR "tgm002967"))


(CONCEPT
(DESCRIPTOR "Delivering")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes the activity of transmitting goods or services.")
(BT "Activities")
(RT "Delivery boys")
(RT "Postal service")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002963")
(TNR "tgm002968"))


(CONCEPT
(DESCRIPTOR "Delivery boys")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Children")
(RT "Delivering")
(RT "Messengers")
(RT "Newspaper carriers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002964")
(TNR "tgm002969"))


(CONCEPT
(NON-DESCRIPTOR "Delivery trucks")
(USE "Trucks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002965")
(TNR "tgm002970"))


(CONCEPT
(NON-DESCRIPTOR "Delivery wagons")
(USE "Carts & wagons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002966")
(TNR "tgm002971"))


(CONCEPT
(NON-DESCRIPTOR "Delphiniums")
(USE "Larkspurs")
(TTCSubj "Subject [MARC 450]")
(TNR "tgm012160"))


(CONCEPT
(DESCRIPTOR "Deltas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "River deltas")
(BT "Land")
(RT "Rivers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002967")
(TNR "tgm002972"))


(CONCEPT
(NON-DESCRIPTOR "Delusions")
(USE "Hallucinations & illusions")
(USE "Superstitions")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002968")
(TNR "tgm002973"))


(CONCEPT
(NON-DESCRIPTOR "Demobilizations")
(USE "Military demobilizations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002969")
(TNR "tgm002974"))


(CONCEPT
(DESCRIPTOR "Democracy")
(GEO-FACET ":COUNTRY")
(SN "For the subject of democracy in general.")
(UF "Self-government")
(BT "Economic & political systems")
(RT "Monarchy")
(RT "Political representation")
(RT "Referendums")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002970")
(TNR "tgm002975"))


(CONCEPT
(DESCRIPTOR "Demography")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Population studies")
(BT "Social science")
(NT "Census")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002971")
(TNR "tgm002976"))


(CONCEPT
(NON-DESCRIPTOR "Demolished buildings")
(USE "Ruins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002972")
(TNR "tgm002977"))


(CONCEPT
(DESCRIPTOR "Demolition")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Wrecking")
(BT "Processes & techniques")
(RT "Blasting")
(RT "Construction")
(RT "Wrecking balls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002973")
(TNR "tgm002978"))


(CONCEPT
(DESCRIPTOR "Demons")
(SN "An evil spirit; a malignant being of superhuman nature.")
(BT "Supernatural beings")
(RT "Devil")
(RT "Exorcism")
(RT "Hell")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002974")
(TNR "tgm002979"))


(CONCEPT
(NON-DESCRIPTOR "Demonstration houses")
(USE "Model houses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002975")
(TNR "tgm002980"))


(CONCEPT
(NON-DESCRIPTOR "Demonstration schools")
(USE "Laboratory schools")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002976")
(TNR "tgm002981"))


(CONCEPT
(DESCRIPTOR "Demonstrations")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Public displays, usually by a crowd, either in sympathy with or antagonism toward a cause, event, product, etc. :SEARCH-SUBDIVISION --RIOTS & DEMONSTRATIONS :USED-WITH :CORPORATE-BODY :NAMED-EVENT [Appendix D].")
(UF "Marches, Political")
(UF "Protests")
(UF "Public demonstrations")
(UF "Public protest")
(UF "Sit-ins")
(UF "Smoke-ins")
(BT "Events")
(NT "Civil disobedience")
(NT "Civil rights demonstrations")
(NT "Draft protests")
(NT "Executions in effigy")
(NT "Flag desecration")
(NT "Strikes")
(RT "Activists")
(RT "Civil rights leaders")
(RT "Meetings")
(RT "Pickets")
(RT "Protest movements")
(RT "Riots")
(RT "Student movements")
(CN "Used in a note under CIVIL RIGHTS DEMONSTRATIONS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002977")
(TNR "tgm002982"))


(CONCEPT
(NON-DESCRIPTOR "Demonstrators")
(USE "Activists")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002978")
(TNR "tgm002983"))


(CONCEPT
(NON-DESCRIPTOR "Denominational schools")
(USE "Religious education")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002979")
(TNR "tgm002984"))


(CONCEPT
(DESCRIPTOR "Dens")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Comfortable, usually secluded rooms in dwellings for study, reading, or leisure.")
(BT "Interiors")
(RT "Libraries (Rooms)")
(RT "Living rooms")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002980")
(TNR "tgm002985"))


(CONCEPT
(DESCRIPTOR "Dental education")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Dental schools")
(BT "Medical education")
(RT "Dentistry")
(CN ":DOUBLE-INDEX EDUCATIONAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002981")
(TNR "tgm002986"))


(CONCEPT
(DESCRIPTOR "Dental equipment & supplies")
(UF "Dental instruments")
(UF "Dental supplies")
(BT "Medical equipment & supplies")
(RT "Dentistry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002982")
(TNR "tgm002987"))


(CONCEPT
(DESCRIPTOR "Dental hygiene")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Health care")
(BT "Hygiene")
(RT "Dentistry")
(RT "Teeth")
(RT "Toothbrushes")
(RT "Toothpaste")
(RT "Trench mouth")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002983")
(TNR "tgm002988"))


(CONCEPT
(NON-DESCRIPTOR "Dental instruments")
(USE "Dental equipment & supplies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002984")
(TNR "tgm002989"))


(CONCEPT
(DESCRIPTOR "Dental offices")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Dentists' offices")
(BT "Service industry facilities")
(RT "Dentistry")
(RT "Health care facilities")
(RT "Medical offices")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002985")
(TNR "tgm002990"))


(CONCEPT
(NON-DESCRIPTOR "Dental schools")
(USE "Dental education")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002986")
(TNR "tgm002991"))


(CONCEPT
(NON-DESCRIPTOR "Dental supplies")
(USE "Dental equipment & supplies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002987")
(TNR "tgm002992"))


(CONCEPT
(DESCRIPTOR "Dentistry")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of dentistry in general and the activities of dentists.")
(BT "Medicine")
(RT "Dental education")
(RT "Dental equipment & supplies")
(RT "Dental hygiene")
(RT "Dental offices")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002988")
(TNR "tgm002993"))


(CONCEPT
(NON-DESCRIPTOR "Dentists' offices")
(USE "Dental offices")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002989")
(TNR "tgm002994"))


(CONCEPT
(NON-DESCRIPTOR "Deoxyribonucleic acid")
(USE "DNA")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002990")
(TNR "tgm002995"))


(CONCEPT
(DESCRIPTOR "Department stores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Stores & shops")
(RT "Dry goods stores")
(RT "General stores")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002991")
(TNR "tgm002996"))


(CONCEPT
(NON-DESCRIPTOR "Departures")
(USE "Arrivals & departures")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002992")
(TNR "tgm002997"))


(CONCEPT
(NON-DESCRIPTOR "Dependencies (Buildings)")
(USE "Outbuildings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002993")
(TNR "tgm002998"))


(CONCEPT
(DESCRIPTOR "Deportations")
(GEO-FACET ":COUNTRY")
(SN "Acts to remove, from a :COUNTRY aliens not lawfully there or considered inimical to the public welfare.")
(UF "Expulsions")
(UF "Removals")
(BT "Law & legal affairs")
(RT "Aliens")
(RT "Emigration & immigration")
(RT "Exiles")
(CN ":SUBDIVIDE-BY geographically by :COUNTRY from which persons are being deported.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002994")
(TNR "tgm002999"))


(CONCEPT
(NON-DESCRIPTOR "Depositories")
(USE "Archives")
(USE "Banks")
(USE "Safes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002995")
(TNR "tgm003000"))


(CONCEPT
(NON-DESCRIPTOR "Depots")
(USE "Railroad stations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002996")
(TNR "tgm003001"))


(CONCEPT
(NON-DESCRIPTOR "Depots, Military")
(USE "Military depots")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm002997")
(TNR "tgm003002"))


(CONCEPT
(DESCRIPTOR "Depression (Mental state)")
(UF "Dejection")
(UF "Despondency")
(UF "Gloom (Mental state)")
(UF "Melancholy")
(UF "Unhappiness")
(BT "Mental states")
(RT "Despair")
(RT "Distress")
(RT "Grief")
(RT "Sadness")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002998")
(TNR "tgm003003"))


(CONCEPT
(DESCRIPTOR "Depressions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Economic & social conditions")
(RT "Business panics")
(RT "Poverty")
(RT "Prosperity")
(RT "Unemployed")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm002999")
(TNR "tgm003004"))


(CONCEPT
(NON-DESCRIPTOR "Derailments")
(USE "Railroad accidents")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003000")
(TNR "tgm003005"))


(CONCEPT
(NON-DESCRIPTOR "Derbies")
(USE "Bowler hats")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003001")
(TNR "tgm003006"))


(CONCEPT
(NON-DESCRIPTOR "Derricks")
(USE "Hoisting machinery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003002")
(TNR "tgm003007"))


(CONCEPT
(NON-DESCRIPTOR "Derricks, Oil")
(USE "Oil well drilling rigs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003003")
(TNR "tgm003008"))


(CONCEPT
(NON-DESCRIPTOR "Derrieres")
(USE "Buttocks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003004")
(TNR "tgm003009"))


(CONCEPT
(DESCRIPTOR "Dervishes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People associated with religion")
(NT "Fakirs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003005")
(TNR "tgm003010"))


(CONCEPT
(NON-DESCRIPTOR "Desalination")
(USE "Saline water conversion")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003006")
(TNR "tgm003011"))


(CONCEPT
(NON-DESCRIPTOR "Desalination plants")
(USE "Saline water conversion plants")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003007")
(TNR "tgm003012"))


(CONCEPT
(NON-DESCRIPTOR "Desegregation")
(USE "Segregation")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003008")
(TNR "tgm003013"))


(CONCEPT
(NON-DESCRIPTOR "Desegregation in education")
(USE "School integration")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003009")
(TNR "tgm003014"))


(CONCEPT
(DESCRIPTOR "Desert islands")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Islands")
(BT "Symbols")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003010")
(TNR "tgm003015"))


(CONCEPT
(NON-DESCRIPTOR "Deserted buildings")
(USE "Abandoned buildings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003011")
(TNR "tgm003016"))


(CONCEPT
(NON-DESCRIPTOR "Deserted children")
(USE "Abandoned children")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003012")
(TNR "tgm003017"))


(CONCEPT
(NON-DESCRIPTOR "Deserted towns")
(USE "Ghost towns")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003013")
(TNR "tgm003018"))


(CONCEPT
(NON-DESCRIPTOR "Deserters, Military")
(USE "Military deserters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003014")
(TNR "tgm003019"))


(CONCEPT
(DESCRIPTOR "Deserts")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Land")
(RT "Dunes")
(RT "Oases")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003015")
(TNR "tgm003020"))


(CONCEPT
(DESCRIPTOR "Design")
(BT "Art")
(NT "Graphic design")
(NT "Industrial design")
(NT "Interior decoration")
(NT "Interior design")
(RT "Designers")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003016")
(TNR "tgm003021"))


(CONCEPT
(DESCRIPTOR "Design drawings")
(SN "Graphic delineations in any medium prepared to plan, direct, or document the design and production of a wide range of works in various trades, professions, and artistic pursuits. May be sketches, diagrams, mechanical drawings, or other formats.")
(UF "Drawings, Design")
(UF "Production drawings")
(NT "Architectural drawings")
(NT "Competition drawings")
(NT "Contract drawings")
(NT "Costume design drawings")
(NT "Electrical systems drawings")
(NT "Engineering drawings")
(NT "Fashion design drawings")
(NT "Graphic design drawings")
(NT "Industrial design drawings")
(NT "Interior design drawings")
(NT "Landscape architecture drawings")
(NT "Measured drawings")
(NT "Mechanical drawings")
(NT "Mechanical systems drawings")
(NT "Naval architecture drawings")
(NT "Patent drawings")
(NT "Pattern books")
(NT "Pattern sheets")
(NT "Planning drawings")
(NT "Planting drawings")
(NT "Presentation drawings (Proposals)")
(NT "Proposed works")
(NT "Record drawings")
(NT "Renderings")
(NT "Set design drawings")
(NT "Site plans")
(NT "Storyboards")
(NT "Structural drawings")
(NT "Studies (Visual works)")
(NT "Textile design drawings")
(NT "Working drawings")
(RT "Details")
(RT "Diagrams")
(RT "Pictures")
(RT "Projections")
(RT "Sketches")
(RT "Specifications")
(CN "Used in a note under ARCHITECTURAL DRAWINGS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000306")
(FCNlctgm "lctgm003017")
(TNR "tgm003022"))


(CONCEPT
(NON-DESCRIPTOR "Design models")
(USE "Architectural models")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003018")
(TNR "tgm003023"))


(CONCEPT
(NON-DESCRIPTOR "Design, Industrial")
(USE "Industrial design")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003020")
(TNR "tgm003025"))


(CONCEPT
(NON-DESCRIPTOR "Design, Interior")
(USE "Interior design")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003021")
(TNR "tgm003026"))


(CONCEPT
(DESCRIPTOR "Designers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(NT "Fashion designers")
(RT "Design")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003019")
(TNR "tgm003024"))


(CONCEPT
(DESCRIPTOR "Desks")
(BT "Furniture")
(RT "Writing materials")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003022")
(TNR "tgm003027"))


(CONCEPT
(DESCRIPTOR "Despair")
(UF "Despondency")
(UF "Hopelessness")
(UF "Loss of hope")
(BT "Mental states")
(RT "Depression (Mental state)")
(RT "Distress")
(RT "Optimism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003023")
(TNR "tgm003028"))


(CONCEPT
(NON-DESCRIPTOR "Desperadoes")
(USE "Criminals")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003024")
(TNR "tgm003029"))


(CONCEPT
(NON-DESCRIPTOR "Despondency")
(USE "Depression (Mental state)")
(USE "Despair")
(USE "Sadness")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003025")
(TNR "tgm003030"))


(CONCEPT
(NON-DESCRIPTOR "Destiny")
(USE "Fatalism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003026")
(TNR "tgm003031"))


(CONCEPT
(NON-DESCRIPTOR "Destroying evidence")
(USE "Suppression of evidence")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003027")
(TNR "tgm003032"))


(CONCEPT
(DESCRIPTOR "Destruction & pillage")
(CN "Used only as a subdivision with :NAMES-OF :NAME-OF-WAR [Appendix C].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm003029")
(TNR "tgm003034"))


(CONCEPT
(NON-DESCRIPTOR "Destruction of property")
(USE "Sabotage")
(USE "Vandalism")
(USE "War damage")
(USE "War destruction & pillage")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003028")
(TNR "tgm003033"))


(CONCEPT
(DESCRIPTOR "Details")
(SN "Small specific parts of a painting, design, or other composition; usually at an enlarged scale showing more information than in the entire work. Often done in preparation for a larger finished work, as a subject for study or training, or as a guide for workmen or artisans. This term includes photographic prints made from a portion of a negative.")
(RT "Design drawings")
(RT "Studies (Visual works)")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000307")
(FCNlctgm "lctgm003030")
(TNR "tgm003035"))


(CONCEPT
(NON-DESCRIPTOR "Details, Architectural")
(USE "Architectural elements")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003031")
(TNR "tgm003036"))


(CONCEPT
(NON-DESCRIPTOR "Detection")
(USE "Investigation")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003032")
(TNR "tgm003037"))


(CONCEPT
(DESCRIPTOR "Detective & mystery television programs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Television programs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003034")
(TNR "tgm003039"))


(CONCEPT
(DESCRIPTOR "Detective camera photographs")
(SN "Photographs made by cameras designed to take pictures inconspicuously. The cameras often have special shapes for concealment under a vest or elsewhere or are disguised as other objects, such as revolvers, hats, books, watches, or binoculars.")
(UF "Concealed camera photographs")
(UF "Vest camera photographs")
(BT "Photographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000308")
(FCNlctgm "lctgm003033")
(TNR "tgm003038"))


(CONCEPT
(DESCRIPTOR "Detectives")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For persons who investigate private, especially illegal or illicit affairs; includes private law enforcement agents as well as police investigators.")
(UF "Private detectives")
(UF "Private eyes")
(UF "Sleuths")
(BT "People")
(RT "Investigation")
(RT "Police")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003035")
(TNR "tgm003040"))


(CONCEPT
(DESCRIPTOR "Détente")
(SN "A relaxing of strained relations between nations.")
(BT "International relations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003036")
(TNR "tgm003041"))


(CONCEPT
(DESCRIPTOR "Detention facilities")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION --DETENTION FACILITIES :USED-WITH :NAMES-OF :NAME-OF-WAR [Appendix C].")
(BT "Facilities")
(NT "Concentration camps")
(NT "Jails")
(NT "Prisons")
(NT "Reformatories")
(NT "Relocation camps")
(RT "Dungeons")
(RT "Justice facilities")
(RT "Prison hospitals")
(RT "Slave ships")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003037")
(TNR "tgm003042"))


(CONCEPT
(NON-DESCRIPTOR "Detergent, Household")
(USE "Household soap")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003038")
(TNR "tgm003043"))


(CONCEPT
(DESCRIPTOR "Deterioration")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Decay")
(UF "Decline")
(UF "Decrepitude")
(BT "Economic & social conditions")
(NT "Building deterioration")
(RT "Progress")
(RT "Rake's progress")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003039")
(TNR "tgm003044"))


(CONCEPT
(NON-DESCRIPTOR "Deterioration of buildings")
(USE "Building deterioration")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003040")
(TNR "tgm003045"))


(CONCEPT
(NON-DESCRIPTOR "Devaluation of currency")
(USE "Monetary policy")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003041")
(TNR "tgm003046"))


(CONCEPT
(NON-DESCRIPTOR "Developments, Housing")
(USE "Housing developments")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003042")
(TNR "tgm003047"))


(CONCEPT
(NON-DESCRIPTOR "Devices, Artists'")
(USE "Artists' devices")
(FUN "Formerly TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000309")
(TNR "tgm003048"))


(CONCEPT
(DESCRIPTOR "Devil")
(SN "In Jewish and Christian theology, the proper appellation of the of the supreme spirit of evil, the tempter and spiritual enemy of mankind, the foe of God and holiness, otherwise called Satan.")
(UF "Lucifer")
(UF "Satan")
(BT "Supernatural beings")
(RT "Demons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003043")
(TNR "tgm003049"))


(CONCEPT
(NON-DESCRIPTOR "Devilfish")
(USE "Octopuses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003044")
(TNR "tgm003050"))


(CONCEPT
(DESCRIPTOR "Devotional images")
(SN "Pictures intended as aids to prayer or worship.  Examples include the small lace paper embossed pictures common in Europe during the 1880s that featured saints or scenes from the life of Jesus Christ.  Sometimes issued in sets or used in religious school.  May have a brief religious text.")
(UF "Holy cards")
(UF "Religious pictures")
(UF "Sunday school cards")
(BT "Pictures")
(NT "Bible cards")
(NT "Mizriha'ot")
(RT "Collecting cards")
(RT "Diptychs")
(RT "Ephemera")
(RT "Polyptychs")
(RT "Rewards of merit")
(RT "Triptychs")
(CN ":DOUBLE-INDEX COLLECTING CARDS for appropriate images.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000310")
(FCNlctgm "lctgm003045")
(TNR "tgm003051"))


(CONCEPT
(NON-DESCRIPTOR "Devotional objects")
(USE "Religious articles")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003046")
(TNR "tgm003052"))


(CONCEPT
(DESCRIPTOR "Dhows")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For lateen-rigged Arabian vessels.")
(BT "Boats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003047")
(TNR "tgm003053"))


(CONCEPT
(NON-DESCRIPTOR "Diacetate negatives")
(USE "Acetate negatives")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000311")
(FCNlctgm "lctgm003048")
(TNR "tgm003054"))


(CONCEPT
(DESCRIPTOR "Diagrams")
(SN "Delineations whose principal purpose is to explain rather than represent pictorially. May provide directions or schematic outline for construction, assembly, repair, or operation, as for electrical circuits or traffic flow.")
(UF "Production drawings")
(UF "Technical drawings")
(NT "Charts")
(NT "Graphs")
(RT "Design drawings")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000312")
(FCNlctgm "lctgm003049")
(TNR "tgm003055"))


(CONCEPT
(DESCRIPTOR "Diamond miners")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Miners")
(RT "Diamond mining")
(RT "Diamonds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003050")
(TNR "tgm003056"))


(CONCEPT
(DESCRIPTOR "Diamond mining")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and sites.")
(BT "Mining")
(RT "Diamond miners")
(RT "Diamonds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003051")
(TNR "tgm003057"))


(CONCEPT
(DESCRIPTOR "Diamonds")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Gems")
(RT "Diamond miners")
(RT "Diamond mining")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003052")
(TNR "tgm003058"))


(CONCEPT
(DESCRIPTOR "Diaper service")
(BT "Business enterprises")
(RT "Cleaning establishments")
(RT "Infants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003053")
(TNR "tgm003059"))


(CONCEPT
(DESCRIPTOR "Diapers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Clothing & dress")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003054")
(TNR "tgm003060"))


(CONCEPT
(NON-DESCRIPTOR "Diazo prints")
(USE "Diazotypes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000313")
(FCNlctgm "lctgm003055")
(TNR "tgm003061"))


(CONCEPT
(DESCRIPTOR "Diazotypes")
(SN "Photographic prints made with material containing diazonium compounds; sensitive to blue and ultraviolet light; commonly developed with ammonia.  Several processes; first introduced in 1890, chiefly for reproducing high contrast line drawings, such as architectural drawings, on paper, cloth, or other fabric.  Lines are commonly blue or black, but may be many other colors.")
(UF "Black line prints")
(UF "Blue line prints")
(UF "Brown line prints")
(UF "Diazo prints")
(UF "Dyelines")
(UF "Ozalids")
(UF "Primuline process prints")
(UF "White prints")
(UF "Whiteprints")
(BT "Photographic prints")
(RT "Reproductions")
(HN "Changed 1/97.  Formerly, DIAZOTYPES may have been indexed as DIAZO PRINTS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000314")
(FCNlctgm "lctgm003056")
(TNR "tgm003062"))


(CONCEPT
(NON-DESCRIPTOR "Dice")
(USE "Gambling")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003057")
(TNR "tgm003063"))


(CONCEPT
(NON-DESCRIPTOR "Dictagraphs")
(USE "Dictating machines")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003058")
(TNR "tgm003064"))


(CONCEPT
(NON-DESCRIPTOR "Dictaphones")
(USE "Dictating machines")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003059")
(TNR "tgm003065"))


(CONCEPT
(DESCRIPTOR "Dictating machines")
(UF "Dictagraphs")
(UF "Dictaphones")
(UF "Dictographs")
(BT "Office equipment & supplies")
(RT "Sound recording")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003060")
(TNR "tgm003066"))


(CONCEPT
(DESCRIPTOR "Dictators")
(GEO-FACET ":COUNTRY")
(UF "Tyrants")
(BT "Rulers")
(RT "Fascism")
(RT "Military regimes")
(RT "Totalitarianism")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003061")
(TNR "tgm003067"))


(CONCEPT
(NON-DESCRIPTOR "Dictionaries")
(USE "Encyclopedias & dictionaries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003062")
(TNR "tgm003068"))


(CONCEPT
(NON-DESCRIPTOR "Dictographs")
(USE "Dictating machines")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003063")
(TNR "tgm003069"))


(CONCEPT
(NON-DESCRIPTOR "Die industry")
(USE "Tool & die industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003064")
(TNR "tgm003070"))


(CONCEPT
(DESCRIPTOR "Diesel donkeys")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For usually portable, auxiliary diesel engines used in logging, to load at landings, move equipment, etc.")
(BT "Donkey engines")
(RT "Gasoline engines")
(RT "Lumber industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003065")
(TNR "tgm003071"))


(CONCEPT
(NON-DESCRIPTOR "Diesel electric locomotives")
(USE "Diesel locomotives")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003066")
(TNR "tgm003072"))


(CONCEPT
(DESCRIPTOR "Diesel locomotives")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Diesel electric locomotives")
(UF "Locomotives, Diesel")
(BT "Railroad locomotives")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003067")
(TNR "tgm003073"))


(CONCEPT
(DESCRIPTOR "Dietary laws")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Religious laws that permit and prohibit certain foods, or specify methods of food preparation.")
(BT "Concepts")
(RT "Cookery")
(RT "Eating & drinking")
(RT "Kosher food industry")
(RT "Religion")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003068")
(TNR "tgm003074"))


(CONCEPT
(NON-DESCRIPTOR "Dieting")
(USE "Weight loss")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003069")
(TNR "tgm003075"))


(CONCEPT
(DESCRIPTOR "Digging")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Activities")
(NT "Gravedigging")
(RT "Excavation")
(RT "Shovels")
(RT "Spades")
(RT "Steam shovels")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003070")
(TNR "tgm003076"))


(CONCEPT
(NON-DESCRIPTOR "Digging graves")
(USE "Gravedigging")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003071")
(TNR "tgm003077"))


(CONCEPT
(DESCRIPTOR "Digital images")
(SN "Images composed of encoded picture elements (pixels). Includes scans made without a camera.")
(BT "Electronic images")
(NT "Computer graphics")
(NT "Digital photographs")
(RT "Digital prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000315")
(FCNlctgm "lctgm003072")
(TNR "tgm003078"))


(CONCEPT
(DESCRIPTOR "Digital photographs")
(SN "Direct-positive images produced electronically through the use of a digital camera when light from a subject strikes charge-coupled sensors (or similar devices). The images are electronic files that can be transferred to computers for editing and storage.  They often have file headers with such information as capture date, caption text, photographer name, and technical image characteristics.  The photographs are typically viewed on computer screens or printed using inkjet or laser devices or light-sensitive photographic papers.")
(BT "Digital images")
(BT "Photographs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000316")
(FCNlctgm "lctgm003073")
(TNR "tgm003079"))


(CONCEPT
(DESCRIPTOR "Digital prints")
(SN "Prints made through computer-controlled devices.")
(UF "Computer-generated prints")
(BT "Prints")
(NT "Inkjet prints")
(RT "Digital images")
(CN "Also index under the type of picture, for example, PHOTOGRAPHS, DRAWINGS, or POSTERS.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000317")
(FCNlctgm "lctgm003074")
(TNR "tgm003080"))


(CONCEPT
(NON-DESCRIPTOR "Dignitaries")
(USE "Clergy")
(USE "Diplomats")
(USE "Government officials")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003075")
(TNR "tgm003081"))


(CONCEPT
(DESCRIPTOR "Dikes (Engineering)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Dykes")
(BT "Hydraulic facilities")
(RT "Embankments")
(RT "Erosion protection works")
(RT "Levees")
(RT "Reclamation of land")
(RT "Sea walls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003076")
(TNR "tgm003082"))


(CONCEPT
(DESCRIPTOR "Dikkas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "In mosques, a wood or stone raised platform from which the prayer leader's Koran readings and gestures are repeated for worshippers.")
(BT "Religious architectural elements")
(RT "Mosques")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003077")
(TNR "tgm003083"))


(CONCEPT
(NON-DESCRIPTOR "Dilapidation of buildings")
(USE "Building deterioration")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003078")
(TNR "tgm003084"))


(CONCEPT
(NON-DESCRIPTOR "Diners (Railroad cars)")
(USE "Railroad dining cars")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003079")
(TNR "tgm003085"))


(CONCEPT
(DESCRIPTOR "Diners (Restaurants)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Restaurants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003080")
(TNR "tgm003086"))


(CONCEPT
(NON-DESCRIPTOR "Dining")
(USE "Eating & drinking")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003081")
(TNR "tgm003087"))


(CONCEPT
(NON-DESCRIPTOR "Dining cars")
(USE "Railroad dining cars")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003082")
(TNR "tgm003088"))


(CONCEPT
(DESCRIPTOR "Dining rooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Interiors")
(NT "Mess halls")
(NT "Refectories")
(RT "Dining tables")
(RT "Eating & drinking facilities")
(RT "Employee eating facilities")
(RT "Tables")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003083")
(TNR "tgm003089"))


(CONCEPT
(DESCRIPTOR "Dining tables")
(UF "Tables, Dining")
(BT "Tables")
(RT "Dining rooms")
(RT "Eating & drinking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003084")
(TNR "tgm003090"))


(CONCEPT
(DESCRIPTOR "Dinner parties")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Parties")
(RT "Eating & drinking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003085")
(TNR "tgm003091"))


(CONCEPT
(DESCRIPTOR "Dinosaurs")
(BT "Extinct animals")
(BT "Reptiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003086")
(TNR "tgm003092"))


(CONCEPT
(NON-DESCRIPTOR "Diocletian windows")
(USE "Palladian windows")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003087")
(TNR "tgm003093"))


(CONCEPT
(DESCRIPTOR "Dioramas")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Objects")
(RT "Exhibitions")
(RT "Galleries & museums")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003088")
(TNR "tgm003094"))


(CONCEPT
(NON-DESCRIPTOR "Diplomacy")
(USE "International relations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003089")
(TNR "tgm003095"))


(CONCEPT
(DESCRIPTOR "Diplomas")
(SN "Documents awarded to students or honorees to certify degree conferred by an educational institution.")
(BT "Certificates")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000318")
(FCNlctgm "lctgm003090")
(TNR "tgm003096"))


(CONCEPT
(NON-DESCRIPTOR "Diplomatic service")
(USE "Foreign service")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003091")
(TNR "tgm003097"))


(CONCEPT
(DESCRIPTOR "Diplomats")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Dignitaries")
(UF "Ministers (Diplomatic agents)")
(BT "Government employees")
(NT "Ambassadors")
(NT "Consuls")
(RT "Consulates")
(RT "Foreign service")
(RT "International relations")
(CN ":SUBDIVIDE-BY :NATIONALITY of :COUNTRY diplomat represents.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003092")
(TNR "tgm003098"))


(CONCEPT
(NON-DESCRIPTOR "Dipsomania")
(USE "Alcoholism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003093")
(TNR "tgm003099"))


(CONCEPT
(DESCRIPTOR "Diptychs")
(SN "Two separate images connected side by side (hinged or mounted) to form a single work. Often are paintings of devotional images used as altarpieces.")
(RT "Devotional images")
(RT "Polyptychs")
(RT "Triptychs")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000319")
(FCNlctgm "lctgm003094")
(TNR "tgm003100"))


(CONCEPT
(DESCRIPTOR "Direct mail")
(SN "Advertisements intended for distribution by mail.")
(UF "Advertising mail")
(UF "Direct-mail advertising")
(UF "Junk mail")
(BT "Advertisements")
(RT "Sales catalogs")
(HN "Changed 1/97.  Formerly, DIRECT MAIL may have been indexed under ADVERTISING MAIL.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000320")
(FCNlctgm "lctgm003095")
(TNR "tgm003101"))


(CONCEPT
(NON-DESCRIPTOR "Direct-mail advertising")
(USE "Direct mail")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000321")
(FCNlctgm "lctgm003097")
(TNR "tgm003103"))


(CONCEPT
(NON-DESCRIPTOR "Directors, Theatrical")
(USE "Theatrical producers & directors")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003096")
(TNR "tgm003102"))


(CONCEPT
(NON-DESCRIPTOR "Dirigibles")
(USE "Airships")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003098")
(TNR "tgm003104"))


(CONCEPT
(DESCRIPTOR "Dirt")
(UF "Soil")
(BT "Land")
(RT "Earth")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003099")
(TNR "tgm003105"))


(CONCEPT
(DESCRIPTOR "Dirt roads")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Earth roads")
(BT "Roads")
(RT "Mountain roads")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003100")
(TNR "tgm003106"))


(CONCEPT
(NON-DESCRIPTOR "Disabled persons")
(USE "People with disabilities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003101")
(TNR "tgm003107"))


(CONCEPT
(DESCRIPTOR "Disabled veterans")
(GEO-FACET ":NATIONALITY ")
(BT "People with disabilities")
(BT "Veterans")
(RT "War casualties")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003102")
(TNR "tgm003108"))


(CONCEPT
(NON-DESCRIPTOR "Disarmament")
(USE "Arms control")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003103")
(TNR "tgm003109"))


(CONCEPT
(NON-DESCRIPTOR "Disaster housing")
(USE "Emergency housing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003104")
(TNR "tgm003110"))


(CONCEPT
(DESCRIPTOR "Disaster relief")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Assistance")
(NT "War relief")
(RT "Canteens (Wartime, emergency, etc.)")
(RT "Clothing relief")
(RT "Disaster victims")
(RT "Disasters")
(RT "Emergency medical services")
(RT "Evacuations")
(RT "Food relief")
(RT "Relief ships")
(RT "Rescue work")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003105")
(TNR "tgm003111"))


(CONCEPT
(DESCRIPTOR "Disaster victims")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Victims")
(RT "Clothing relief")
(RT "Disaster relief")
(RT "Disasters")
(RT "Evacuations")
(RT "Food relief")
(RT "Rescue work")
(CN ":DOUBLE-INDEX type of disaster. Used in a note under REFUGEES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003106")
(TNR "tgm003112"))


(CONCEPT
(DESCRIPTOR "Disasters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes the event and any resulting damage. :SEARCH-SUBDIVISION --DISASTERS :USED-WITH :CORPORATE-BODY :NAMED-EVENT [Appendix D].")
(UF "Calamities")
(UF "Catastrophes")
(UF "Collisions")
(UF "Damage to property")
(UF "Property damage")
(UF "Wrecks")
(BT "Events")
(NT "Bridge failures")
(NT "Building failures")
(NT "Droughts")
(NT "Famines")
(NT "Fires")
(NT "Nuclear holocausts")
(NT "Pier & wharf failures")
(NT "Shipwrecks")
(NT "War damage")
(RT "Abyss")
(RT "Accidents")
(RT "Danger")
(RT "Disaster relief")
(RT "Disaster victims")
(RT "Earthquakes")
(RT "Emergency housing")
(RT "Explosions")
(RT "Floods")
(RT "Landslides")
(RT "Rescue work")
(RT "Spontaneous shrines")
(RT "Storms")
(RT "Tidal waves")
(RT "Volcanic eruptions")
(CN "Used in a note under RUINS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003107")
(TNR "tgm003113"))


(CONCEPT
(DESCRIPTOR "Disc jockeys")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "DJs")
(BT "People associated with entertainment & sports")
(RT "Radio broadcasting")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003108")
(TNR "tgm003114"))


(CONCEPT
(NON-DESCRIPTOR "Discharges, Military")
(USE "Military discharges")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003109")
(TNR "tgm003115"))


(CONCEPT
(NON-DESCRIPTOR "Disciplinary action")
(USE "Child discipline")
(USE "Punishment & torture")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003110")
(TNR "tgm003116"))


(CONCEPT
(DESCRIPTOR "Disciplines")
(SN "Fields of study or areas of specialization.")
(BT "Activities")
(NT "Art")
(NT "Economics")
(NT "Education")
(NT "Grammar")
(NT "Heraldry")
(NT "History")
(NT "Home economics")
(NT "Literature")
(NT "Map making")
(NT "Mathematics")
(NT "Military art & science")
(NT "Philosophy")
(NT "Science")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003111")
(TNR "tgm003117"))


(CONCEPT
(NON-DESCRIPTOR "Disciplining children")
(USE "Child discipline")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003112")
(TNR "tgm003118"))


(CONCEPT
(NON-DESCRIPTOR "Disclosure of personal finances")
(USE "Financial disclosure")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003113")
(TNR "tgm003119"))


(CONCEPT
(NON-DESCRIPTOR "Discos")
(USE "Discotheques")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003114")
(TNR "tgm003120"))


(CONCEPT
(DESCRIPTOR "Discotheques")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Discos")
(BT "Sports & recreation facilities")
(RT "Dance")
(RT "Dance floors")
(RT "Dance halls")
(RT "Nightclubs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003115")
(TNR "tgm003121"))


(CONCEPT
(DESCRIPTOR "Discounts")
(BT "Prices")
(RT "Business & finance")
(RT "Cost & standard of living")
(RT "Selling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003116")
(TNR "tgm003122"))


(CONCEPT
(NON-DESCRIPTOR "Discoverers")
(USE "Explorers")
(USE "Inventors")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003117")
(TNR "tgm003123"))


(CONCEPT
(NON-DESCRIPTOR "Discoveries")
(USE "Discovery & exploration")
(USE "Inventions")
(USE "Patents")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003118")
(TNR "tgm003124"))


(CONCEPT
(DESCRIPTOR "Discovery & exploration")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Discoveries")
(UF "Exploration")
(UF "Journeys")
(BT "Activities")
(NT "Expeditions & surveys")
(NT "Prospecting")
(NT "Westward movement")
(RT "Events")
(RT "Explorers")
(RT "Frontier & pioneer life")
(RT "Guides & scouts")
(RT "Investigation")
(RT "Travel")
(CN ":SUBDIVIDE-BY :NATIONALITY of those doing the discovery & exploration.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003119")
(TNR "tgm003125"))


(CONCEPT
(DESCRIPTOR "Discrimination")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For overt discrimination. :SEARCH-SUBDIVISION PREJUDICE for the subject of prejudiced attitudes in general.")
(BT "Behavior")
(NT "Hate crimes")
(NT "Race discrimination")
(NT "Segregation")
(NT "Sexual harassment")
(NT "Stereotyping")
(RT "Civil rights")
(RT "Ethics")
(RT "Interpersonal relations")
(RT "Prejudice")
(CN "Used in a note under PREJUDICE.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003120")
(TNR "tgm003126"))


(CONCEPT
(NON-DESCRIPTOR "Discs, Sound")
(USE "Sound recordings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003121")
(TNR "tgm003127"))


(CONCEPT
(DESCRIPTOR "Discus throwing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Track athletics")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003122")
(TNR "tgm003128"))


(CONCEPT
(DESCRIPTOR "Discussion")
(SN ":SEARCH-SUBDIVISION CONVERSATION for casual talking.")
(UF "Group discussion")
(UF "Panel discussions")
(UF "Speaking")
(UF "Talking")
(BT "Communication")
(NT "Forums (Discussion & debate)")
(RT "Debates")
(RT "Meetings")
(RT "Public speaking")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003123")
(TNR "tgm003129"))


(CONCEPT
(NON-DESCRIPTOR "Disease prevention")
(USE "Preventive medicine")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003124")
(TNR "tgm003130"))


(CONCEPT
(DESCRIPTOR "Diseases")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION SICK PERSONS for images of persons affected with unspecified ailments. :SEARCH-SUBDIVISION --HEALTH & WELFARE :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A].")
(UF "Ailments")
(UF "Illnesses")
(UF "Maladies")
(UF "Sickness")
(BT "Physical characteristics")
(NT "Alcoholism")
(NT "Allergies")
(NT "Anemia")
(NT "Arthritis")
(NT "Black lung")
(NT "Cancer")
(NT "Cerebral palsy")
(NT "Communicable diseases")
(NT "Cystic fibrosis")
(NT "Hangovers")
(NT "Hypertension")
(NT "Kaposi's sarcoma")
(NT "Motion sickness")
(NT "Multiple sclerosis")
(NT "Scoliosis")
(NT "Sickle cell anemia")
(NT "Somnambulism")
(NT "Starvation")
(NT "Vision disorders")
(NT "Voice disorders")
(RT "Bacteria")
(RT "Drug abuse")
(RT "Healing")
(RT "Health")
(RT "Malnutrition")
(RT "Pain")
(RT "Sick persons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003125")
(TNR "tgm003131"))


(CONCEPT
(DESCRIPTOR "Disfigured persons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(RT "People with disabilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003126")
(TNR "tgm003132"))


(CONCEPT
(DESCRIPTOR "Disgrace")
(UF "Ignominy")
(UF "Shame")
(BT "Mental states")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003127")
(TNR "tgm003133"))


(CONCEPT
(NON-DESCRIPTOR "Dishes")
(USE "Tableware")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003128")
(TNR "tgm003134"))


(CONCEPT
(NON-DESCRIPTOR "Dishonesty")
(USE "Honesty")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003129")
(TNR "tgm003135"))


(CONCEPT
(NON-DESCRIPTOR "Dishonorable discharges")
(USE "Military discharges")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003130")
(TNR "tgm003136"))


(CONCEPT
(NON-DESCRIPTOR "Dishwashers")
(USE "Dishwashing machines")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003131")
(TNR "tgm003137"))


(CONCEPT
(DESCRIPTOR "Dishwashing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Washing dishes")
(BT "Cleaning")
(RT "Dishwashing machines")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003132")
(TNR "tgm003138"))


(CONCEPT
(DESCRIPTOR "Dishwashing machines")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Dishwashers")
(BT "Appliances")
(RT "Dishwashing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003133")
(TNR "tgm003139"))


(CONCEPT
(NON-DESCRIPTOR "Disks, Sound")
(USE "Sound recordings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003134")
(TNR "tgm003140"))


(CONCEPT
(DESCRIPTOR "Dismemberment")
(BT "Wounds & injuries")
(RT "Amputation")
(RT "Amputees")
(RT "Death")
(RT "Executions")
(RT "Punishment & torture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003135")
(TNR "tgm003141"))


(CONCEPT
(DESCRIPTOR "Dismissal of employees")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Employee dismissal")
(UF "Firing of employees")
(UF "Layoffs")
(UF "Terminations of employment")
(BT "Employee-employer relations")
(RT "Employment")
(RT "Resignations")
(RT "Unemployed")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003136")
(TNR "tgm003142"))


(CONCEPT
(NON-DESCRIPTOR "Displaced persons")
(USE "Refugees")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003137")
(TNR "tgm003143"))


(CONCEPT
(NON-DESCRIPTOR "Displaced persons camps")
(USE "Refugee camps")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003138")
(TNR "tgm003144"))


(CONCEPT
(DESCRIPTOR "Display cards")
(SN "Advertisements on cards made for use on a counter, in a window, or other commercial setting; larger than advertising cards.")
(BT "Advertisements")
(BT "Cards")
(NT "Lobby cards")
(NT "Window cards")
(RT "Signs (Notices)")
(RT "Theatrical posters")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000322")
(FCNlctgm "lctgm003139")
(TNR "tgm003145"))


(CONCEPT
(NON-DESCRIPTOR "Display cases")
(USE "Showcases")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003140")
(TNR "tgm003146"))


(CONCEPT
(NON-DESCRIPTOR "Display drawings")
(USE "Presentation drawings (Proposals)")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000323")
(FCNlctgm "lctgm003141")
(TNR "tgm003147"))


(CONCEPT
(NON-DESCRIPTOR "Display rooms")
(USE "Showrooms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003142")
(TNR "tgm003148"))


(CONCEPT
(NON-DESCRIPTOR "Display windows")
(USE "Show windows")
(USE "Window displays")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003143")
(TNR "tgm003149"))


(CONCEPT
(NON-DESCRIPTOR "Displays of merchandise")
(USE "Merchandise displays")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003144")
(TNR "tgm003150"))


(CONCEPT
(NON-DESCRIPTOR "Disposal of refuse")
(USE "Refuse disposal")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003145")
(TNR "tgm003151"))


(CONCEPT
(NON-DESCRIPTOR "Disposal of waste")
(USE "Sewerage")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003146")
(TNR "tgm003152"))


(CONCEPT
(NON-DESCRIPTOR "Disrobing")
(USE "Undressing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003147")
(TNR "tgm003153"))


(CONCEPT
(DESCRIPTOR "Dissections")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Processes & techniques")
(RT "Animal experimentation")
(RT "Biology")
(RT "Experiments")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003148")
(TNR "tgm003154"))


(CONCEPT
(DESCRIPTOR "Dissenters")
(SN "For those who express nonconcurrence with reigning opinion, beliefs, or decisions.")
(UF "Dissidents")
(UF "Nonconformists")
(BT "People")
(RT "Activists")
(RT "Freedom of religion")
(RT "Freedom of speech")
(RT "Individuality")
(RT "Opposition (Political science)")
(RT "Rebels")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003149")
(TNR "tgm003155"))


(CONCEPT
(NON-DESCRIPTOR "Dissidents")
(USE "Dissenters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003150")
(TNR "tgm003156"))


(CONCEPT
(NON-DESCRIPTOR "Distance running")
(USE "Marathon running")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003151")
(TNR "tgm003157"))


(CONCEPT
(NON-DESCRIPTOR "Distillation apparatus")
(USE "Stills (Distilleries)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003152")
(TNR "tgm003158"))


(CONCEPT
(NON-DESCRIPTOR "Distilleries")
(USE "Distilling industries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003153")
(TNR "tgm003159"))


(CONCEPT
(DESCRIPTOR "Distilling industries")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(UF "Alcoholic beverage industry")
(UF "Distilleries")
(UF "Liquor industry")
(BT "Beverage industry")
(RT "Retorts (Equipment)")
(RT "Stills (Distilleries)")
(CN ":DOUBLE-INDEX INDUSTRIAL FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003154")
(TNR "tgm003160"))


(CONCEPT
(DESCRIPTOR "Distress")
(SN ":SEARCH-SUBDIVISION PAIN for physical distress.")
(UF "Agony")
(UF "Anguish")
(UF "Misery")
(UF "Suffering")
(BT "Mental states")
(RT "Depression (Mental state)")
(RT "Despair")
(RT "Pain")
(RT "Sadness")
(RT "Stress")
(CN "Used in a note under PAIN.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003155")
(TNR "tgm003161"))


(CONCEPT
(NON-DESCRIPTOR "Distribution of wealth")
(USE "Wealth")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003156")
(TNR "tgm003162"))


(CONCEPT
(NON-DESCRIPTOR "Districts, Business")
(USE "Business districts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003157")
(TNR "tgm003163"))


(CONCEPT
(DESCRIPTOR "Distyle-in-antis buildings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Buildings distinguished by form")
(RT "Columns")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003158")
(TNR "tgm003164"))


(CONCEPT
(NON-DESCRIPTOR "Diversity (Ethnic)")
(USE "Pluralism (Social sciences)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003159")
(TNR "tgm003165"))


(CONCEPT
(DESCRIPTOR "Divination")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Art or practice that seeks to foresee or foretell future events or discover hidden knowledge usually by the interpretation of omens or by the aid of supernatural powers.")
(UF "Augury")
(UF "Predictions")
(UF "Soothsaying")
(BT "Supernatural practices")
(NT "Fortune telling")
(RT "Astrology")
(RT "Divining rods")
(RT "Prophecy")
(RT "Sibyls")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003160")
(TNR "tgm003166"))


(CONCEPT
(DESCRIPTOR "Diving")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For diving into water, as from a diving board.")
(BT "Activities")
(NT "Pearl diving")
(NT "Skin diving")
(RT "Aquatic sports")
(RT "Swimming")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003161")
(TNR "tgm003167"))


(CONCEPT
(DESCRIPTOR "Diving suits")
(BT "Clothing & dress")
(RT "Skin diving")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003162")
(TNR "tgm003168"))


(CONCEPT
(DESCRIPTOR "Divining rods")
(UF "Water witches")
(BT "Magical devices")
(RT "Divination")
(RT "Dowsing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003163")
(TNR "tgm003169"))


(CONCEPT
(NON-DESCRIPTOR "Divinity schools")
(USE "Theological seminaries")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003164")
(TNR "tgm003170"))


(CONCEPT
(DESCRIPTOR "Divorce")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Judicial proceedings")
(RT "Custody of children")
(RT "Divorced women")
(RT "Marriage")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003165")
(TNR "tgm003171"))


(CONCEPT
(DESCRIPTOR "Divorced women")
(UF "Divorcees")
(BT "Women")
(RT "Divorce")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003166")
(TNR "tgm003172"))


(CONCEPT
(NON-DESCRIPTOR "Divorcees")
(USE "Divorced women")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003167")
(TNR "tgm003173"))


(CONCEPT
(DESCRIPTOR "Dizziness")
(UF "Giddiness")
(UF "Lightheadedness")
(BT "Physical characteristics")
(RT "Mental states")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003168")
(TNR "tgm003174"))


(CONCEPT
(NON-DESCRIPTOR "DJs")
(USE "Disc jockeys")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003169")
(TNR "tgm003175"))


(CONCEPT
(DESCRIPTOR "DNA")
(UF "Deoxyribonucleic acid")
(BT "Body parts")
(RT "Human body")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003170")
(TNR "tgm003176"))


(CONCEPT
(NON-DESCRIPTOR "Dock hands")
(USE "Longshoremen")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003171")
(TNR "tgm003177"))


(CONCEPT
(NON-DESCRIPTOR "Docks")
(USE "Piers & wharves")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003172")
(TNR "tgm003178"))


(CONCEPT
(NON-DESCRIPTOR "Docks, Loading")
(USE "Loading docks")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003173")
(TNR "tgm003179"))


(CONCEPT
(NON-DESCRIPTOR "Dockyards")
(USE "Boat & ship industry")
(USE "Naval yards & naval stations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003174")
(TNR "tgm003180"))


(CONCEPT
(NON-DESCRIPTOR "Doctors")
(USE "Physicians")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003175")
(TNR "tgm003181"))


(CONCEPT
(NON-DESCRIPTOR "Doctors' offices")
(USE "Medical offices")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003176")
(TNR "tgm003182"))


(CONCEPT
(NON-DESCRIPTOR "Doctors' surgeries")
(USE "Medical offices")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003177")
(TNR "tgm003183"))


(CONCEPT
(DESCRIPTOR "Document signings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Signing of documents")
(BT "Events")
(RT "Autographing")
(RT "Petitions")
(RT "Writing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003178")
(TNR "tgm003184"))


(CONCEPT
(DESCRIPTOR "Documents")
(UF "Records (Information)")
(NT "Charters")
(HN "Changed 10/2004 from TGM I term.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000324")
(FCNlctgm "lctgm003179")
(TNR "tgm003185"))


(CONCEPT
(DESCRIPTOR "Dodos")
(GEO-FACET ":COUNTRY :STATE")
(BT "Extinct birds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003180")
(TNR "tgm003186"))


(CONCEPT
(NON-DESCRIPTOR "Doffing")
(USE "Textile industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003181")
(TNR "tgm003187"))


(CONCEPT
(DESCRIPTOR "Dog breeders")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Breeders, Dog")
(BT "People")
(RT "Animal breeding")
(RT "Dogs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003182")
(TNR "tgm003188"))


(CONCEPT
(NON-DESCRIPTOR "Dog catching")
(USE "Dogcatching")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003183")
(TNR "tgm003189"))


(CONCEPT
(NON-DESCRIPTOR "Dog food industry")
(USE "Pet food industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003184")
(TNR "tgm003190"))


(CONCEPT
(NON-DESCRIPTOR "Dog guides")
(USE "Guide dogs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003185")
(TNR "tgm003191"))


(CONCEPT
(DESCRIPTOR "Dog licenses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Licenses, Dog")
(BT "Licenses")
(RT "Dogs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003186")
(TNR "tgm003192"))


(CONCEPT
(NON-DESCRIPTOR "Dog mushing")
(USE "Dogsledding")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003187")
(TNR "tgm003193"))


(CONCEPT
(NON-DESCRIPTOR "Dog pounds")
(USE "Animal shelters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003188")
(TNR "tgm003194"))


(CONCEPT
(DESCRIPTOR "Dog racing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Racing")
(RT "Dogs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003189")
(TNR "tgm003195"))


(CONCEPT
(DESCRIPTOR "Dog shows")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animal shows")
(RT "Dogs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003190")
(TNR "tgm003196"))


(CONCEPT
(NON-DESCRIPTOR "Dog sledding")
(USE "Dogsledding")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003191")
(TNR "tgm003197"))


(CONCEPT
(DESCRIPTOR "Dog teams")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animal teams")
(RT "Dogs")
(RT "Dogsledding")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003192")
(TNR "tgm003198"))


(CONCEPT
(DESCRIPTOR "Dog walking")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Animal husbandry")
(RT "Dogs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003193")
(TNR "tgm003199"))


(CONCEPT
(DESCRIPTOR "Dogcatching")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Dog catching")
(BT "Animal treatment")
(BT "Municipal services")
(RT "Animal shelters")
(RT "Dogs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003194")
(TNR "tgm003200"))


(CONCEPT
(NON-DESCRIPTOR "Doghouses")
(USE "Kennels")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003195")
(TNR "tgm003201"))


(CONCEPT
(DESCRIPTOR "Dogs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Puppies")
(BT "Animals")
(NT "Bloodhounds")
(NT "Bulldogs")
(NT "Chow chows (Dogs)")
(NT "Collies")
(NT "Dachshunds")
(NT "Greyhounds")
(NT "Hunting dogs")
(NT "Irish wolfhounds")
(NT "Poodles")
(NT "Watchdogs")
(NT "Working dogs")
(RT "Dog breeders")
(RT "Dog licenses")
(RT "Dog racing")
(RT "Dog shows")
(RT "Dog teams")
(RT "Dog walking")
(RT "Dogcatching")
(RT "Dogs of war")
(RT "Dogsledding")
(RT "Fetch (Game)")
(RT "Kennels")
(RT "Sled dog racing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003196")
(TNR "tgm003202"))


(CONCEPT
(DESCRIPTOR "Dogs of war")
(BT "Symbols")
(RT "Dogs")
(RT "War")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003197")
(TNR "tgm003203"))


(CONCEPT
(NON-DESCRIPTOR "Dogsled racing")
(USE "Sled dog racing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003198")
(TNR "tgm003204"))


(CONCEPT
(DESCRIPTOR "Dogsledding")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Dog mushing")
(UF "Dog sledding")
(UF "Sledding, Dog")
(BT "Transportation")
(RT "Dog teams")
(RT "Dogs")
(RT "Sled dog racing")
(RT "Sleds & sleighs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003199")
(TNR "tgm003205"))


(CONCEPT
(DESCRIPTOR "Do-it-yourself work")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Processes & techniques")
(RT "Remodeling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003245")
(TNR "tgm003251"))


(CONCEPT
(DESCRIPTOR "Dollar signs")
(BT "Punctuation")
(BT "Symbols")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003200")
(TNR "tgm003206"))


(CONCEPT
(DESCRIPTOR "Dollhouses")
(UF "Miniature houses")
(BT "Building models")
(RT "Dolls")
(RT "Dwellings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003201")
(TNR "tgm003207"))


(CONCEPT
(DESCRIPTOR "Dollies (Moving equipment)")
(BT "Equipment")
(RT "Moving & storage trade")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003202")
(TNR "tgm003208"))


(CONCEPT
(DESCRIPTOR "Dolls")
(BT "Toys")
(NT "Voodoo dolls")
(RT "Dollhouses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003203")
(TNR "tgm003209"))


(CONCEPT
(DESCRIPTOR "Dolphins")
(GEO-FACET ":COUNTRY :STATE")
(BT "Aquatic animals")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003204")
(TNR "tgm003210"))


(CONCEPT
(DESCRIPTOR "Dome coffers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Coffers (Ceilings)")
(RT "Domes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003205")
(TNR "tgm003211"))


(CONCEPT
(DESCRIPTOR "Domes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Architectural elements")
(NT "Geodesic domes")
(NT "Onion domes")
(RT "Cupolas")
(RT "Dome coffers")
(RT "Drums (Domes)")
(RT "Roofs")
(RT "Rotundas")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003206")
(TNR "tgm003212"))


(CONCEPT
(NON-DESCRIPTOR "Domestic appliances")
(USE "Appliances")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003207")
(TNR "tgm003213"))


(CONCEPT
(DESCRIPTOR "Domestic economic assistance")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Domestic lending")
(BT "Assistance")
(NT "Medicaid")
(NT "Medicare")
(NT "Public service employment")
(RT "Social security")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003208")
(TNR "tgm003214"))


(CONCEPT
(NON-DESCRIPTOR "Domestic lending")
(USE "Domestic economic assistance")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003209")
(TNR "tgm003215"))


(CONCEPT
(DESCRIPTOR "Domestic life")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "People at home; also includes activities in the home or a home-like setting. :SEARCH-SUBDIVISION --DOMESTIC LIFE :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A].")
(UF "Home life")
(BT "Manners & customs")
(NT "Mobile home living")
(RT "Economic & social conditions")
(RT "Families")
(RT "Home economics")
(RT "Housework")
(RT "Laundry")
(RT "Social values")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003210")
(TNR "tgm003216"))


(CONCEPT
(NON-DESCRIPTOR "Domestic violence")
(USE "Family violence")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003211")
(TNR "tgm003217"))


(CONCEPT
(NON-DESCRIPTOR "Domestics")
(USE "Servants")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003212")
(TNR "tgm003218"))


(CONCEPT
(NON-DESCRIPTOR "Donations")
(USE "Gifts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003213")
(TNR "tgm003219"))


(CONCEPT
(NON-DESCRIPTOR "Donations of blood")
(USE "Blood donations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003214")
(TNR "tgm003220"))


(CONCEPT
(DESCRIPTOR "Donkey engines")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For usually portable, auxilliary engines used in logging, to load at landings, move equipment, etc.")
(BT "Engines")
(NT "Diesel donkeys")
(NT "Electric donkeys")
(NT "Steam donkeys")
(RT "Lumber industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003215")
(TNR "tgm003221"))


(CONCEPT
(DESCRIPTOR "Donkeys")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Asses")
(UF "Burros")
(BT "Animals")
(RT "Mules")
(RT "Pin-the-tail-on-the-donkey")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003216")
(TNR "tgm003222"))


(CONCEPT
(NON-DESCRIPTOR "Donuts")
(USE "Doughnuts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003217")
(TNR "tgm003223"))


(CONCEPT
(NON-DESCRIPTOR "Doomsday")
(USE "End of the world")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003218")
(TNR "tgm003224"))


(CONCEPT
(NON-DESCRIPTOR "Door fittings")
(USE "Keyholes")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003219")
(TNR "tgm003225"))


(CONCEPT
(DESCRIPTOR "Door knobs")
(UF "Doorknobs")
(BT "Hardware")
(RT "Doors & doorways")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003220")
(TNR "tgm003226"))


(CONCEPT
(NON-DESCRIPTOR "Door windows")
(USE "French doors")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003221")
(TNR "tgm003227"))


(CONCEPT
(NON-DESCRIPTOR "Doorknobs")
(USE "Door knobs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003222")
(TNR "tgm003228"))


(CONCEPT
(DESCRIPTOR "Doormen")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "People")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003223")
(TNR "tgm003229"))


(CONCEPT
(DESCRIPTOR "Doors & doorways")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Doorways")
(UF "Entrances")
(UF "Portals")
(BT "Architectural elements")
(NT "Folding doors")
(NT "French doors")
(NT "Pocket doors")
(NT "Revolving doors")
(NT "Trapdoors")
(RT "Door knobs")
(RT "Gates")
(RT "Grilles")
(RT "Knocking")
(RT "Lintels")
(RT "Millwork")
(RT "Passageways")
(RT "Turnstiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003224")
(TNR "tgm003230"))


(CONCEPT
(NON-DESCRIPTOR "Door-to-door selling")
(USE "Canvassing")
(USE "Peddlers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003226")
(TNR "tgm003232"))


(CONCEPT
(NON-DESCRIPTOR "Doorways")
(USE "Doors & doorways")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003225")
(TNR "tgm003231"))


(CONCEPT
(DESCRIPTOR "Doric order")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Architectural orders")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003227")
(TNR "tgm003233"))


(CONCEPT
(DESCRIPTOR "Dories (Boats)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For small, narrow, flat-bottomed fishing boats with high sides and sharp prows.")
(BT "Boats")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003228")
(TNR "tgm003234"))


(CONCEPT
(DESCRIPTOR "Dormers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Gabled extensions of attic rooms through a sloping roof to allow for vertical window openings.")
(BT "Architectural elements")
(NT "Shed dormers")
(RT "Roofs")
(RT "Windows")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003229")
(TNR "tgm003235"))


(CONCEPT
(DESCRIPTOR "Dormitories")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Halls of residence")
(UF "Residence halls")
(BT "Dwellings")
(RT "Bedrooms")
(RT "Bunk beds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003230")
(TNR "tgm003236"))


(CONCEPT
(DESCRIPTOR "Dotted prints")
(SN "Metal relief prints in which white dots or stars, produced by punching a metal plate, punctuate otherwise dark background areas.")
(UF "Criblée prints")
(UF "Manière criblée prints")
(BT "Metal cuts")
(HN "Changed 11/90.  Formerly, DOTTED PRINTS may have been indexed as METAL CUTS.  FUN: Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000325")
(FCNlctgm "lctgm003231")
(TNR "tgm003237"))


(CONCEPT
(DESCRIPTOR "Double jeopardy")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Jeopardy, Double")
(BT "Law & legal affairs")
(RT "Judicial proceedings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003232")
(TNR "tgm003238"))


(CONCEPT
(DESCRIPTOR "Double-decker buses")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(BT "Buses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003233")
(TNR "tgm003239"))


(CONCEPT
(NON-DESCRIPTOR "Doubt")
(USE "Suspicion")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003234")
(TNR "tgm003240"))


(CONCEPT
(DESCRIPTOR "Doughnuts")
(UF "Donuts")
(BT "Baked products")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003235")
(TNR "tgm003241"))


(CONCEPT
(DESCRIPTOR "Dovecotes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Houses, Pigeon")
(UF "Pigeon houses")
(BT "Birdhouses")
(RT "Doves")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003236")
(TNR "tgm003242"))


(CONCEPT
(DESCRIPTOR "Doves")
(GEO-FACET ":COUNTRY :STATE")
(BT "Pigeons")
(RT "Dovecotes")
(CN "Used in a note under SYMBOLS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003237")
(TNR "tgm003243"))


(CONCEPT
(NON-DESCRIPTOR "Down")
(USE "Feathers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003238")
(TNR "tgm003244"))


(CONCEPT
(NON-DESCRIPTOR "Down spouts")
(USE "Downspouts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003239")
(TNR "tgm003245"))


(CONCEPT
(NON-DESCRIPTOR "Down-pipes")
(USE "Downspouts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003242")
(TNR "tgm003248"))


(CONCEPT
(DESCRIPTOR "Downspouts")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Down spouts")
(UF "Down-pipes")
(UF "Rainwater pipes")
(BT "Mechanical systems components")
(RT "Leader heads")
(RT "Pipes (Conduits)")
(RT "Roofs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003240")
(TNR "tgm003246"))


(CONCEPT
(NON-DESCRIPTOR "Downtown districts")
(USE "Business districts")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003241")
(TNR "tgm003247"))


(CONCEPT
(DESCRIPTOR "Dowry")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Money or property brought by a woman to her husband at marriage or a gift of money or property given by a man for his bride.")
(BT "Manners & customs")
(RT "Gifts")
(RT "Marriage")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003243")
(TNR "tgm003249"))


(CONCEPT
(DESCRIPTOR "Dowsing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Processes & techniques")
(RT "Divining rods")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003244")
(TNR "tgm003250"))


(CONCEPT
(DESCRIPTOR "Draft")
(GEO-FACET ":COUNTRY")
(UF "Compulsory military service")
(UF "Conscription, Military")
(UF "Selective service")
(BT "Military service")
(RT "Armies")
(RT "Conscientious objectors")
(RT "Draft protests")
(RT "Draft resisters")
(HN "Changed 11/1987 from COMPULSORY MILITARY SERVICE.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003246")
(TNR "tgm003252"))


(CONCEPT
(NON-DESCRIPTOR "Draft dodgers")
(USE "Draft resisters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003247")
(TNR "tgm003253"))


(CONCEPT
(DESCRIPTOR "Draft protests")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Demonstrations")
(RT "Draft")
(RT "Draft resisters")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003248")
(TNR "tgm003254"))


(CONCEPT
(DESCRIPTOR "Draft resisters")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Draft dodgers")
(BT "Activists")
(RT "Conscientious objectors")
(RT "Draft")
(RT "Draft protests")
(RT "Moral aspects of war")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003249")
(TNR "tgm003255"))


(CONCEPT
(NON-DESCRIPTOR "Drafting")
(USE "Drawing")
(USE "Writing")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003250")
(TNR "tgm003256"))


(CONCEPT
(DESCRIPTOR "Drafting tables")
(BT "Tables")
(RT "Drawing")
(RT "Writing")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003251")
(TNR "tgm003257"))


(CONCEPT
(NON-DESCRIPTOR "Draftsmen")
(USE "Draftspersons")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003252")
(TNR "tgm003258"))


(CONCEPT
(DESCRIPTOR "Draftspersons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Draftsmen")
(BT "People")
(RT "Artists")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003253")
(TNR "tgm003259"))


(CONCEPT
(NON-DESCRIPTOR "Drag queens")
(USE "Female impersonators")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003254")
(TNR "tgm003260"))


(CONCEPT
(NON-DESCRIPTOR "Drag racers")
(USE "Automobile racing drivers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003255")
(TNR "tgm003261"))


(CONCEPT
(DESCRIPTOR "Drag racing")
(SN "Vehicles racing on a straight track, in which the objective is to cover the distance as quickly as possible.")
(BT "Automobile racing")
(RT "Hot rods")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003256")
(TNR "tgm003262"))


(CONCEPT
(NON-DESCRIPTOR "Dragging")
(USE "Pulling")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003257")
(TNR "tgm003263"))


(CONCEPT
(DESCRIPTOR "Dragon dance")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Dance")
(RT "Dragons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003258")
(TNR "tgm003264"))


(CONCEPT
(NON-DESCRIPTOR "Dragon flies")
(USE "Dragonflies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003259")
(TNR "tgm003265"))


(CONCEPT
(DESCRIPTOR "Dragonflies")
(GEO-FACET ":COUNTRY :STATE")
(UF "Dragon flies")
(BT "Insects")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003260")
(TNR "tgm003266"))


(CONCEPT
(DESCRIPTOR "Dragons")
(BT "Supernatural beings")
(RT "Dragon dance")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003261")
(TNR "tgm003267"))


(CONCEPT
(NON-DESCRIPTOR "Dragoons")
(USE "Cavalry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003262")
(TNR "tgm003268"))


(CONCEPT
(NON-DESCRIPTOR "Drainage")
(USE "Sewerage")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003263")
(TNR "tgm003269"))


(CONCEPT
(DESCRIPTOR "Drama clubs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Clubs")
(RT "Theatrical productions")
(CN ":DOUBLE-INDEX ORGANIZATIONS' FACILITIES - or NTs - for images that focus on facilities.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003264")
(TNR "tgm003270"))


(CONCEPT
(NON-DESCRIPTOR "Dramas")
(USE "Theatrical productions")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003265")
(TNR "tgm003271"))


(CONCEPT
(DESCRIPTOR "Dramatists")
(UF "Playwrights")
(BT "Authors")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003266")
(TNR "tgm003272"))


(CONCEPT
(DESCRIPTOR "Draperies")
(UF "Curtains")
(UF "Drapery")
(BT "Textiles")
(RT "Festive decorations")
(RT "Furnishings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003267")
(TNR "tgm003273"))


(CONCEPT
(NON-DESCRIPTOR "Drapery")
(USE "Draperies")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003268")
(TNR "tgm003274"))


(CONCEPT
(DESCRIPTOR "Drawbridges")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION SWING BRIDGES for bridges that move horizontally and under VERTICAL LIFT BRIDGES for bridges that move vertically.")
(UF "Lift bridges")
(UF "Movable bridges")
(BT "Bridges")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003269")
(TNR "tgm003275"))


(CONCEPT
(DESCRIPTOR "Drawers (Furniture components)")
(BT "Objects")
(RT "Furniture")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003270")
(TNR "tgm003276"))


(CONCEPT
(DESCRIPTOR "Drawing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Drafting")
(BT "Art")
(RT "Drafting tables")
(RT "Perspective")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003271")
(TNR "tgm003277"))


(CONCEPT
(DESCRIPTOR "Drawing rooms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Withdrawing rooms")
(BT "Interiors")
(RT "Parlors")
(RT "Reception rooms")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003272")
(TNR "tgm003278"))


(CONCEPT
(DESCRIPTOR "Drawings")
(SN "Narrower terms include both physical media and genre categories but are limited to those which use drawing in the sense of a specific medium rather than in the everyday sense of graphic representation.")
(BT "Pictures")
(NT "Abstract drawings")
(NT "Allegorical drawings")
(NT "Chalk drawings")
(NT "Charcoal drawings")
(NT "Cityscape drawings")
(NT "Composite drawings")
(NT "Crayon drawings")
(NT "Cutaway drawings")
(NT "Figure drawings")
(NT "Genre drawings")
(NT "Graphite drawings")
(NT "Ink drawings")
(NT "Landscape drawings")
(NT "Marine drawings")
(NT "Metalpoint drawings")
(NT "Pastels (Visual works)")
(NT "Portrait drawings")
(NT "Scratchboard drawings")
(NT "Seascape drawings")
(NT "Still life drawings")
(NT "Tracings")
(NT "Wash drawings")
(RT "Clichés-verre")
(RT "Crayon enlargements")
(RT "Mixed media")
(RT "Pen works")
(RT "Pencil works")
(RT "Watercolors")
(CN "When using a genre term that includes the word DRAWINGS, also index under a more specific physical process name, if desired.  Used in a note under DIGITAL PRINTS, INKJET PRINTS, and MIXED MEDIA.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000326")
(FCNlctgm "lctgm003273")
(TNR "tgm003279"))


(CONCEPT
(NON-DESCRIPTOR "Drawings of record")
(USE "Record drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000327")
(FCNlctgm "lctgm003274")
(TNR "tgm003280"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Architectural")
(USE "Architectural drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000328")
(FCNlctgm "lctgm003275")
(TNR "tgm003281"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, As-built")
(USE "As-built drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000329")
(FCNlctgm "lctgm003276")
(TNR "tgm003282"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Botanical")
(USE "Botanical illustrations")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000330")
(FCNlctgm "lctgm003277")
(TNR "tgm003283"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Competition")
(USE "Competition drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000331")
(FCNlctgm "lctgm003278")
(TNR "tgm003284"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Contract")
(USE "Contract drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000332")
(FCNlctgm "lctgm003279")
(TNR "tgm003285"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Cutaway")
(USE "Cutaway drawings")
(FUN "Formerly TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(FCNGMGPC "gmgpc000333")
(TNR "tgm003286"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Design")
(USE "Design drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000334")
(FCNlctgm "lctgm003280")
(TNR "tgm003287"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Electrical systems")
(USE "Electrical systems drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000335")
(FCNlctgm "lctgm003281")
(TNR "tgm003288"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Engineering")
(USE "Engineering drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000336")
(FCNlctgm "lctgm003282")
(TNR "tgm003289"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Exploded")
(USE "Exploded drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000337")
(FCNlctgm "lctgm003283")
(TNR "tgm003290"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Framing")
(USE "Framing drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000338")
(FCNlctgm "lctgm003284")
(TNR "tgm003291"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Landscape architecture")
(USE "Landscape architecture drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000339")
(FCNlctgm "lctgm003285")
(TNR "tgm003292"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Measured")
(USE "Measured drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000340")
(FCNlctgm "lctgm003286")
(TNR "tgm003293"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Mechanical")
(USE "Mechanical drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000341")
(FCNlctgm "lctgm003287")
(TNR "tgm003294"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Mechanical systems")
(USE "Mechanical systems drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000342")
(FCNlctgm "lctgm003288")
(TNR "tgm003295"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Medical")
(USE "Medical illustrations")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000343")
(FCNlctgm "lctgm003289")
(TNR "tgm003296"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Naval architecture")
(USE "Naval architecture drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000344")
(FCNlctgm "lctgm003290")
(TNR "tgm003297"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Patent")
(USE "Patent drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000345")
(FCNlctgm "lctgm003291")
(TNR "tgm003298"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Planning")
(USE "Planning drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000346")
(FCNlctgm "lctgm003292")
(TNR "tgm003299"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Presentation")
(USE "Presentation drawings (Proposals)")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000347")
(FCNlctgm "lctgm003293")
(TNR "tgm003300"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Structural")
(USE "Structural drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000348")
(FCNlctgm "lctgm003294")
(TNR "tgm003301"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Structural systems")
(USE "Structural systems drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000349")
(FCNlctgm "lctgm003295")
(TNR "tgm003302"))


(CONCEPT
(NON-DESCRIPTOR "Drawings, Working")
(USE "Working drawings")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000350")
(FCNlctgm "lctgm003296")
(TNR "tgm003303"))


(CONCEPT
(NON-DESCRIPTOR "Dreadnoughts")
(USE "Battleships")
(USE "Government vessels")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003297")
(TNR "tgm003304"))


(CONCEPT
(DESCRIPTOR "Dreaming")
(BT "Mental states")
(NT "Nightmares")
(RT "Daydreaming")
(RT "Sleeping")
(RT "Somnambulism")
(HN "Changed 4/1988 from DREAMS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003298")
(TNR "tgm003305"))


(CONCEPT
(NON-DESCRIPTOR "Dredgers")
(USE "Dredges")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003299")
(TNR "tgm003306"))


(CONCEPT
(DESCRIPTOR "Dredges")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(UF "Dredgers")
(BT "Machinery")
(RT "Dredging")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003300")
(TNR "tgm003307"))


(CONCEPT
(DESCRIPTOR "Dredging")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Excavation")
(RT "Dredges")
(RT "Underwater drilling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003301")
(TNR "tgm003308"))


(CONCEPT
(NON-DESCRIPTOR "Dress")
(USE "Clothing & dress")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003302")
(TNR "tgm003309"))


(CONCEPT
(NON-DESCRIPTOR "Dress designers")
(USE "Fashion designers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003303")
(TNR "tgm003310"))


(CONCEPT
(NON-DESCRIPTOR "Dress forms")
(USE "Mannequins")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003304")
(TNR "tgm003311"))


(CONCEPT
(DESCRIPTOR "Dress reform")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Clothing reform")
(BT "Reform")
(RT "Clothing & dress")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003305")
(TNR "tgm003312"))


(CONCEPT
(NON-DESCRIPTOR "Dressers (Furniture)")
(USE "Clothes chests")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003306")
(TNR "tgm003313"))


(CONCEPT
(NON-DESCRIPTOR "Dressers, Kitchen")
(USE "Cupboards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003307")
(TNR "tgm003314"))


(CONCEPT
(NON-DESCRIPTOR "Dressers, Pantry")
(USE "Cupboards")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003308")
(TNR "tgm003315"))


(CONCEPT
(DESCRIPTOR "Dresses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Clothing & dress")
(NT "Ball dresses")
(NT "Evening gowns")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003309")
(TNR "tgm003316"))


(CONCEPT
(DESCRIPTOR "Dressing & grooming equipment")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Grooming equipment")
(UF "Toilet articles")
(UF "Toiletries")
(BT "Equipment")
(NT "Combs")
(NT "Cosmetics")
(NT "Hair dryers")
(NT "Shaving equipment")
(NT "Toothbrushes")
(RT "Dressing tables")
(RT "Grooming")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003313")
(TNR "tgm003320"))


(CONCEPT
(NON-DESCRIPTOR "Dressing bureaux")
(USE "Dressing tables")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003310")
(TNR "tgm003317"))


(CONCEPT
(NON-DESCRIPTOR "Dressing rooms")
(USE "Boudoirs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003311")
(TNR "tgm003318"))


(CONCEPT
(DESCRIPTOR "Dressing tables")
(UF "Dressing bureaux")
(UF "Tables, Dressing")
(UF "Vanities")
(BT "Tables")
(RT "Dressing & grooming equipment")
(RT "Grooming")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003312")
(TNR "tgm003319"))


(CONCEPT
(NON-DESCRIPTOR "Dressmaking")
(USE "Sewing")
(USE "Tailoring")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003314")
(TNR "tgm003321"))


(CONCEPT
(DESCRIPTOR "Dried plant arrangements")
(BT "Decorations")
(NT "Skeleton leaf arrangements")
(RT "Flowers")
(RT "Plants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003315")
(TNR "tgm003322"))


(CONCEPT
(DESCRIPTOR "Drill halls")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Spacious halls used for drill by military or other drill teams.")
(BT "Military facilities")
(RT "Drill teams")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003316")
(TNR "tgm003323"))


(CONCEPT
(NON-DESCRIPTOR "Drill presses")
(USE "Drilling & boring machinery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003317")
(TNR "tgm003324"))


(CONCEPT
(NON-DESCRIPTOR "Drill rigs")
(USE "Oil well drilling rigs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003318")
(TNR "tgm003325"))


(CONCEPT
(DESCRIPTOR "Drill teams")
(SN "An exhibition marching team that engages in precision drill.")
(BT "People associated with entertainment & sports")
(RT "Bands")
(RT "Baton twirling")
(RT "Drill halls")
(RT "Parades & processions")
(RT "Sports")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003319")
(TNR "tgm003326"))


(CONCEPT
(DESCRIPTOR "Drilling")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For drilling of holes in metal, wood, and other materials, as carried out for construction and manufacturing purposes. :SEARCH-SUBDIVISION BORING for the cutting of holes in earth or rocks to determine the nature of the strata penetrated or to create an outlet for oil, water, or gas.")
(BT "Processes & techniques")
(RT "Boring")
(RT "Construction")
(RT "Drilling & boring machinery")
(RT "Drills (Equipment)")
(CN "Used in a note under BORING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003320")
(TNR "tgm003327"))


(CONCEPT
(DESCRIPTOR "Drilling & boring machinery")
(UF "Borers")
(UF "Boring machinery")
(UF "Drill presses")
(UF "Drills (Machinery)")
(BT "Machinery")
(RT "Boring")
(RT "Drilling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003321")
(TNR "tgm003328"))


(CONCEPT
(NON-DESCRIPTOR "Drilling, Underwater")
(USE "Underwater drilling")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003322")
(TNR "tgm003329"))


(CONCEPT
(DESCRIPTOR "Drills (Equipment)")
(SN "Hand-held tools for making holes in firm objects.")
(BT "Equipment")
(RT "Drilling")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003323")
(TNR "tgm003330"))


(CONCEPT
(NON-DESCRIPTOR "Drills (Machinery)")
(USE "Drilling & boring machinery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003324")
(TNR "tgm003331"))


(CONCEPT
(NON-DESCRIPTOR "Drills, Military")
(USE "Military training")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003325")
(TNR "tgm003332"))


(CONCEPT
(NON-DESCRIPTOR "Drinking")
(USE "Eating & drinking")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003326")
(TNR "tgm003333"))


(CONCEPT
(NON-DESCRIPTOR "Drinking facilities")
(USE "Eating & drinking facilities")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003327")
(TNR "tgm003334"))


(CONCEPT
(DESCRIPTOR "Drinking fountains")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Water fountains")
(BT "Fountains")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003328")
(TNR "tgm003335"))


(CONCEPT
(NON-DESCRIPTOR "Drinking problem")
(USE "Alcoholism")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003329")
(TNR "tgm003336"))


(CONCEPT
(DESCRIPTOR "Drinking vessels")
(UF "Cups")
(UF "Goblets")
(UF "Mugs")
(UF "Tankards")
(BT "Containers")
(BT "Tableware")
(NT "Chalices")
(NT "Coffee cups")
(RT "Beverages")
(RT "Canteens (Beverage containers)")
(RT "Eating & drinking")
(RT "Glassware")
(RT "Tin cups")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003330")
(TNR "tgm003337"))


(CONCEPT
(NON-DESCRIPTOR "Drinking water")
(USE "Water")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003331")
(TNR "tgm003338"))


(CONCEPT
(NON-DESCRIPTOR "Drinks")
(USE "Beverages")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003332")
(TNR "tgm003339"))


(CONCEPT
(NON-DESCRIPTOR "Drive ways")
(USE "Driveways")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003333")
(TNR "tgm003340"))


(CONCEPT
(DESCRIPTOR "Drive-in restaurants")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes activities and structures.")
(BT "Fast food restaurants")
(RT "Automobiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003340")
(TNR "tgm003347"))


(CONCEPT
(DESCRIPTOR "Drive-in theaters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Motion picture theaters")
(RT "Automobiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003341")
(TNR "tgm003348"))


(CONCEPT
(DESCRIPTOR "Driver education")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Education")
(RT "Automobiles")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003334")
(TNR "tgm003341"))


(CONCEPT
(NON-DESCRIPTOR "Drivers, Mule")
(USE "Muleteers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003335")
(TNR "tgm003342"))


(CONCEPT
(NON-DESCRIPTOR "Drives, Book")
(USE "Book drives")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003336")
(TNR "tgm003343"))


(CONCEPT
(NON-DESCRIPTOR "Drives, Membership")
(USE "Membership campaigns")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003337")
(TNR "tgm003344"))


(CONCEPT
(NON-DESCRIPTOR "Drives, Scrap")
(USE "Scrap drives")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003338")
(TNR "tgm003345"))


(CONCEPT
(DESCRIPTOR "Drive-thru windows")
(BT "Windows")
(RT "Fast food restaurants")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003342")
(TNR "tgm003349"))


(CONCEPT
(DESCRIPTOR "Driveways")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Private roads giving access from a public way to a building on abutting grounds.")
(UF "Drive ways")
(BT "Roads")
(RT "Streets")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003339")
(TNR "tgm003346"))


(CONCEPT
(NON-DESCRIPTOR "Driving while intoxicated")
(USE "Drunk driving")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003343")
(TNR "tgm003350"))


(CONCEPT
(NON-DESCRIPTOR "Driving, Automobile")
(USE "Automobile driving")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003344")
(TNR "tgm003351"))


(CONCEPT
(NON-DESCRIPTOR "Drop ceilings")
(USE "Suspended ceilings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003345")
(TNR "tgm003352"))


(CONCEPT
(DESCRIPTOR "Droughts")
(GEO-FACET ":COUNTRY :STATE")
(BT "Disasters")
(RT "Rain")
(RT "Scarcity")
(RT "Water supply")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003346")
(TNR "tgm003353"))


(CONCEPT
(DESCRIPTOR "Drowning")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Death")
(RT "Lifesaving")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003347")
(TNR "tgm003354"))


(CONCEPT
(DESCRIPTOR "Drowning victims")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Dead persons")
(BT "Victims")
(RT "Marine accidents")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003348")
(TNR "tgm003355"))


(CONCEPT
(DESCRIPTOR "Drug abuse")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For abuse or misuse of drugs in a broad sense, such as aspirin, bromides, caffeine, sedatives, alcohol, LSD, marijuana, and narcotics.")
(UF "Addiction to drugs")
(UF "Chemical abuse")
(UF "Drug addiction")
(UF "Narcotic habit")
(UF "Substance abuse")
(BT "Behavior")
(NT "Alcoholism")
(RT "Diseases")
(RT "Drug addicts")
(RT "Drug dealers")
(RT "Narcotics")
(RT "Opium dens")
(CN ":DOUBLE-INDEX the drug.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003349")
(TNR "tgm003356"))


(CONCEPT
(NON-DESCRIPTOR "Drug addiction")
(USE "Drug abuse")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003350")
(TNR "tgm003357"))


(CONCEPT
(DESCRIPTOR "Drug addicts")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Narcotics addicts")
(BT "People")
(RT "Drug abuse")
(RT "Narcotics")
(HN "Changed 9/2005 from NARCOTIC ADDICTS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003351")
(TNR "tgm003358"))


(CONCEPT
(DESCRIPTOR "Drug dealers")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Narcotics dealers")
(BT "People associated with commercial activities")
(RT "Drug abuse")
(RT "Narcotics")
(HN "Changed 9/2005 from NARCOTICS DEALERS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003352")
(TNR "tgm003359"))


(CONCEPT
(DESCRIPTOR "Drug seizures")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Confiscations")
(RT "Narcotics")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003353")
(TNR "tgm003360"))


(CONCEPT
(NON-DESCRIPTOR "Drug stores")
(USE "Drugstores")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003354")
(TNR "tgm003361"))


(CONCEPT
(NON-DESCRIPTOR "Drug trade")
(USE "Drugstores")
(USE "Medicine shows")
(USE "Pharmaceutical industry")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003355")
(TNR "tgm003362"))


(CONCEPT
(NON-DESCRIPTOR "Druggists")
(USE "Pharmacists")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003356")
(TNR "tgm003363"))


(CONCEPT
(NON-DESCRIPTOR "Drugs")
(USE "Medicines")
(USE "Narcotics")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003357")
(TNR "tgm003364"))


(CONCEPT
(DESCRIPTOR "Drugstores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Retail stores where medicines are compounded and dispensed and miscellaneous articles, e.g. food, cosmetics, and film, are sold. Includes activities and structures.")
(UF "Apothecary shops")
(UF "Drug stores")
(UF "Drug trade")
(UF "Pharmacies")
(BT "Stores & shops")
(RT "Medicines")
(RT "Pharmacists")
(RT "Soda fountains")
(HN "Prior to 5/1991, PHARMACIES was used for places where medicines are compounded, dispensed, and sold.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003358")
(TNR "tgm003365"))


(CONCEPT
(DESCRIPTOR "Drum majorettes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION DRUM MAJORING or BATON TWIRLING for images that focus on  activities.")
(UF "Majorettes, Drum")
(BT "People associated with entertainment & sports")
(RT "Baton twirling")
(RT "Drum majoring")
(RT "Drum majors")
(RT "Marching percussion")
(RT "Parades & processions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003359")
(TNR "tgm003366"))


(CONCEPT
(DESCRIPTOR "Drum majoring")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Activities")
(RT "Baton twirling")
(RT "Drum majorettes")
(RT "Drum majors")
(RT "Parades & processions")
(CN "Used in a note under DRUM MAJORS and DRUM MAJORETTES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003360")
(TNR "tgm003367"))


(CONCEPT
(DESCRIPTOR "Drum majors")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION DRUM MAJORING or BATON TWIRLING for images that focus on activities.")
(UF "Majors, Drum")
(BT "People associated with entertainment & sports")
(RT "Baton twirling")
(RT "Drum majorettes")
(RT "Drum majoring")
(RT "Marching percussion")
(RT "Parades & processions")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003361")
(TNR "tgm003368"))


(CONCEPT
(DESCRIPTOR "Drums")
(GEO-FACET ":NATIONALITY :COUNTRY :STATE :CITY")
(SN "Includes the activity of playing drums.")
(BT "Percussion instruments")
(NT "Hand drums")
(NT "Tambourines")
(NT "Trompongs")
(RT "Marching percussion")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003362")
(TNR "tgm003369"))


(CONCEPT
(DESCRIPTOR "Drums (Domes)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Vertical walls that are circular or polygonal and carry a cupola or dome.")
(UF "Barabans")
(BT "Architectural elements")
(RT "Cupolas")
(RT "Domes")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003363")
(TNR "tgm003370"))


(CONCEPT
(DESCRIPTOR "Drunk driving")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Driving while intoxicated")
(UF "Drunken driving")
(UF "DWI")
(BT "Crimes")
(RT "Alcoholic beverages")
(RT "Automobile driving")
(RT "Intoxication")
(RT "Traffic regulations")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003364")
(TNR "tgm003371"))


(CONCEPT
(NON-DESCRIPTOR "Drunken driving")
(USE "Drunk driving")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003365")
(TNR "tgm003372"))


(CONCEPT
(NON-DESCRIPTOR "Drunkenness")
(USE "Intoxication")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003366")
(TNR "tgm003373"))


(CONCEPT
(NON-DESCRIPTOR "Dry cleaners")
(USE "Cleaning establishments")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003367")
(TNR "tgm003374"))


(CONCEPT
(DESCRIPTOR "Dry collodion negatives")
(SN "Negatives coated with a dry collodion solution were introduced in the 1850s. Although convenient because they could be stored until ready to be exposed, they were little used because they required long exposure times. Hand-coated emulsions made these negatives look like wet plates.")
(UF "Collodion dry plate negatives")
(UF "Collodion negatives")
(BT "Dry plate negatives")
(CN "These plates are so difficult to distinguish from WET PLATE NEGATIVES that they might be indexed as wet plates.")
(HN "Changed 6/94. Formerly, DRY COLLODION NEGATIVES may have been indexed as COLLODION DRY PLATE NEGATIVES.")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000351")
(FCNlctgm "lctgm003368")
(TNR "tgm003375"))


(CONCEPT
(NON-DESCRIPTOR "Dry docks")
(USE "Boat & ship industry")
(USE "Naval yards & naval stations")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003369")
(TNR "tgm003376"))


(CONCEPT
(DESCRIPTOR "Dry goods stores")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Stores in which textiles, ready to wear clothing, and notions are sold. Includes activities and structures.")
(UF "Fancy goods stores")
(BT "Stores & shops")
(RT "Department stores")
(RT "General stores")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003370")
(TNR "tgm003377"))


(CONCEPT
(NON-DESCRIPTOR "Dry paintings")
(USE "Sandpaintings")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003371")
(TNR "tgm003378"))


(CONCEPT
(DESCRIPTOR "Dry plate negatives")
(SN "Silver gelatin dry plate negatives were the dominant glass negative ca. 1880-1920. Dry plate negatives were made as early as the 1850s with collodion, honey, and other solutions, but they were not commercially successful and are difficult to distinguish from collodion wet plate negatives.")
(UF "Gelatin dry plate negatives")
(UF "Silver gelatin glass negatives")
(BT "Glass negatives")
(NT "Dry collodion negatives")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000352")
(FCNlctgm "lctgm003372")
(TNR "tgm003379"))


(CONCEPT
(NON-DESCRIPTOR "Dryers, Hair")
(USE "Hair dryers")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003373")
(TNR "tgm003380"))


(CONCEPT
(NON-DESCRIPTOR "Drying of fish")
(USE "Fish drying")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003374")
(TNR "tgm003381"))


(CONCEPT
(NON-DESCRIPTOR "Drying of food")
(USE "Food drying")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003375")
(TNR "tgm003382"))


(CONCEPT
(DESCRIPTOR "Drying sheds")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For structures used to dry material (e.g., paper, textiles) by means of air flow.")
(UF "Sheds, Drying")
(BT "Sheds")
(BT "Storage facilities")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003376")
(TNR "tgm003383"))


(CONCEPT
(DESCRIPTOR "Drypoints")
(BT "Intaglio prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000353")
(FCNlctgm "lctgm003377")
(TNR "tgm003384"))


(CONCEPT
(NON-DESCRIPTOR "Duck decoys")
(USE "Decoys (Hunting)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003378")
(TNR "tgm003385"))


(CONCEPT
(DESCRIPTOR "Duck shooting")
(GEO-FACET ":COUNTRY :STATE")
(BT "Game bird hunting")
(RT "Ducks")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003379")
(TNR "tgm003386"))


(CONCEPT
(NON-DESCRIPTOR "Duckbills")
(USE "Platypuses")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003380")
(TNR "tgm003387"))


(CONCEPT
(DESCRIPTOR "Ducklings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Baby animals")
(BT "Ducks")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003381")
(TNR "tgm003388"))


(CONCEPT
(DESCRIPTOR "Ducks")
(GEO-FACET ":COUNTRY :STATE")
(BT "Birds")
(NT "Ducklings")
(RT "Duck shooting")
(RT "Poultry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003382")
(TNR "tgm003389"))


(CONCEPT
(DESCRIPTOR "Dude ranches")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Ranches")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003383")
(TNR "tgm003390"))


(CONCEPT
(DESCRIPTOR "Dueling")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN ":SEARCH-SUBDIVISION DUELING GROUNDS for images that focus on sites.")
(BT "Manners & customs")
(RT "Dueling grounds")
(RT "Fencing")
(RT "Martial arts")
(CN "Used in a note under DUELING GROUNDS.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003384")
(TNR "tgm003391"))


(CONCEPT
(DESCRIPTOR "Dueling grounds")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For images that focus on sites. :SEARCH-SUBDIVISION DUELING for activities.")
(BT "Sites")
(RT "Dueling")
(CN "Used in a note under DUELING.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003385")
(TNR "tgm003392"))


(CONCEPT
(NON-DESCRIPTOR "Dufay color transparencies")
(USE "Screen color film transparencies")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000354")
(FCNlctgm "lctgm003386")
(TNR "tgm003393"))


(CONCEPT
(DESCRIPTOR "Dugout houses")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Dwellings wholly or partly constructed in the ground, usually in a bank or slope.")
(BT "Houses")
(RT "Sod buildings")
(RT "Stone buildings")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003387")
(TNR "tgm003394"))


(CONCEPT
(NON-DESCRIPTOR "Dumb waiters")
(USE "Dumbwaiters")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003388")
(TNR "tgm003395"))


(CONCEPT
(DESCRIPTOR "Dumbbells")
(BT "Exercise equipment & supplies")
(RT "Physical fitness")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003389")
(TNR "tgm003396"))


(CONCEPT
(DESCRIPTOR "Dumbwaiters")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Dumb waiters")
(BT "Conveying systems")
(RT "Elevators")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003390")
(TNR "tgm003397"))


(CONCEPT
(DESCRIPTOR "Dump trucks")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Trucks")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003391")
(TNR "tgm003398"))


(CONCEPT
(NON-DESCRIPTOR "Dumps")
(USE "Refuse disposal")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003392")
(TNR "tgm003399"))


(CONCEPT
(NON-DESCRIPTOR "Dunce caps")
(USE "Fools' caps")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003393")
(TNR "tgm003400"))


(CONCEPT
(DESCRIPTOR "Dunes")
(GEO-FACET ":COUNTRY :STATE")
(UF "Sand drifts")
(UF "Sand dunes")
(BT "Land")
(RT "Beaches")
(RT "Deserts")
(RT "Sand")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003394")
(TNR "tgm003401"))


(CONCEPT
(DESCRIPTOR "Dungeons")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Interiors")
(RT "Detention facilities")
(RT "Prisons")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003395")
(TNR "tgm003402"))


(CONCEPT
(NON-DESCRIPTOR "Dunkard churches")
(USE "Brethren churches")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003396")
(TNR "tgm003403"))


(CONCEPT
(DESCRIPTOR "Duplexes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Two-family dwellings")
(BT "Houses")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003397")
(TNR "tgm003404"))


(CONCEPT
(DESCRIPTOR "Durbars")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Courts held by native Indian princes; festive receptions given by maharajahs.")
(BT "Events")
(RT "Festivals")
(RT "Rites & ceremonies")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003398")
(TNR "tgm003405"))


(CONCEPT
(NON-DESCRIPTOR "Dusk")
(USE "Sunrises & sunsets")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003399")
(TNR "tgm003406"))


(CONCEPT
(NON-DESCRIPTOR "Dust jackets")
(USE "Book jackets")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000355")
(FCNlctgm "lctgm003400")
(TNR "tgm003407"))


(CONCEPT
(DESCRIPTOR "Dust storms")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes the event and any resulting damage.")
(BT "Storms")
(RT "Erosion")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003401")
(TNR "tgm003408"))


(CONCEPT
(NON-DESCRIPTOR "Dusting")
(USE "Sweeping & dusting")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003402")
(TNR "tgm003409"))


(CONCEPT
(NON-DESCRIPTOR "Dutch reformed churches")
(USE "Reformed churches")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003403")
(TNR "tgm003410"))


(CONCEPT
(NON-DESCRIPTOR "Duties")
(USE "Tariffs")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003404")
(TNR "tgm003411"))


(CONCEPT
(DESCRIPTOR "Dwarfs")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Midgets")
(BT "People")
(RT "Cretinism")
(RT "Fictitious characters")
(RT "Human curiosities")
(CN ":DOUBLE-INDEX HUMAN CURIOSITIES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003405")
(TNR "tgm003412"))


(CONCEPT
(DESCRIPTOR "Dwellings")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Structures designed or used as the living quarters for one or more families.  :SEARCH-SUBDIVISION BIRTHPLACES for dwellings that were a place of birth and under ESTATES for grounds and outbuildings associated with dwellings.  :SEARCH-SUBDIVISION --STRUCTURES :USED-WITH :NAMES-OF :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :USED-WITH :CLASSES-OF-PERSONS [Appendix A]. :SEARCH-SUBDIVISION --HOMES & HAUNTS :USED-WITH :NAMES-OF :NAMED-PERSON [Appendix B].")
(UF "Cottages")
(UF "Estate houses")
(UF "Homes")
(UF "Residences")
(UF "Villas")
(BT "Residential facilities")
(NT "Apartment houses")
(NT "Barracks")
(NT "Beaver dams")
(NT "Cave dwellings")
(NT "Cliff dwellings")
(NT "Condominiums")
(NT "Dormitories")
(NT "Hogans")
(NT "Houseboats")
(NT "Houses")
(NT "Housing")
(NT "Igloos")
(NT "Mobile homes")
(NT "Nests")
(NT "Officers' quarters")
(NT "Rookeries")
(NT "Tipis")
(NT "Wickiups")
(NT "Wigwams")
(RT "Backyards")
(RT "Birthplaces")
(RT "Dollhouses")
(RT "Estates")
(RT "Garages")
(RT "Gatehouses")
(RT "House buying")
(RT "Household moving")
(RT "Huts")
(RT "Lodging houses")
(RT "Private camps")
(RT "Pueblos")
(RT "Ranches")
(RT "Residential streets")
(RT "Tents")
(CN "Used in a note under ESTATES and BIRTHPLACES.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003406")
(TNR "tgm003413"))


(CONCEPT
(NON-DESCRIPTOR "DWI")
(USE "Drunk driving")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003407")
(TNR "tgm003414"))


(CONCEPT
(DESCRIPTOR "Dye coupler negatives")
(SN "Trade names include Kodacolor (launched in 1942 as the first commercial color negative process in the United States), and Ektacolor (1947). A chromogenic development process.")
(UF "Ektacolor negatives")
(UF "Fujicolor negatives")
(UF "Kodacolor negatives")
(BT "Film negatives")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc00035")
(FCNlctgm "lctgm003408")
(TNR "tgm003415"))


(CONCEPT
(NON-DESCRIPTOR "Dye coupler photoprints")
(USE "Dye coupler prints")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003409")
(TNR "tgm003416"))


(CONCEPT
(DESCRIPTOR "Dye coupler prints")
(SN "Includes most color photographic prints (except instant camera) made since 1941. Commonly referred to as Type C if made from a negative and Type R if made from a transparency.  A chromogenic development process.")
(UF "Dye coupler photoprints")
(UF "Type C prints")
(UF "Type R prints")
(BT "Photographic prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000357")
(FCNlctgm "lctgm003410")
(TNR "tgm003417"))


(CONCEPT
(DESCRIPTOR "Dye coupler transparencies")
(UF "Agfacolor transparencies")
(UF "Ektachrome transparencies")
(UF "Fujichrome transparencies")
(UF "Kodachrome transparencies")
(BT "Film transparencies")
(FCNGMGPC "gmgpc000358")
(FCNlctgm "lctgm003411")
(TNR "tgm012062"))


(CONCEPT
(NON-DESCRIPTOR "Dye destruction photoprints")
(USE "Dye destruction prints")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003412")
(TNR "tgm003418"))


(CONCEPT
(DESCRIPTOR "Dye destruction prints")
(SN "Color photographic prints made under various trade names including Utocolor in the early 1900s and Gasparcolor in the 1930s.  Cibachrome, introduced in 1963, is the modern representative of the process.  Valued in part for the relative stability of the color dyes.")
(UF "Cibachrome prints")
(UF "Dye destruction photoprints")
(UF "Silver dye bleach prints")
(BT "Photographic prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000359")
(FCNlctgm "lctgm003413")
(TNR "tgm003419"))


(CONCEPT
(NON-DESCRIPTOR "Dye diffusion transfer photoprints")
(USE "Dye diffusion transfer prints")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003414")
(TNR "tgm003420"))


(CONCEPT
(DESCRIPTOR "Dye diffusion transfer prints")
(SN "Color instant camera photographic prints.  Polaroid was introduced commercially in 1965; Kodak followed in 1976, and Fuji in 1981.  Commonly 3.12 x 3.12 in. (8 x 8 cm.).")
(UF "Dye diffusion transfer photoprints")
(UF "Kodak instant color prints")
(UF "Polaroid instant color prints")
(BT "Instant camera photographs")
(BT "Photographic prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000360")
(FCNlctgm "lctgm003415")
(TNR "tgm003421"))


(CONCEPT
(NON-DESCRIPTOR "Dye transfer photoprints")
(USE "Dye transfer prints")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003416")
(TNR "tgm003422"))


(CONCEPT
(DESCRIPTOR "Dye transfer prints")
(SN "Color photographic prints made by the imbibition process and techniques that begin with three color separation negatives, then dyed matrices, and a final print.  Among the many trade names are Pinatype (introduced in 1903) and Eastman Wash-off Relief (1935-1946). Kodak Dye Transfer process (introduced in 1946) is still in use.")
(UF "Dye transfer photoprints")
(UF "Imbibition process prints")
(UF "Pinatypes")
(BT "Photographic prints")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000361")
(FCNlctgm "lctgm003417")
(TNR "tgm003423"))


(CONCEPT
(DESCRIPTOR "Dyeing")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Coloring")
(BT "Processes & techniques")
(NT "Tie-dyeing")
(RT "Textile industry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003418")
(TNR "tgm003424"))


(CONCEPT
(NON-DESCRIPTOR "Dyelines")
(USE "Diazotypes")
(FUN "Formerly TGMI term [nonpostable] & TGMII term [nonpostable].")
(TTCForm "Genre/Format [MARC 455]")
(TTCSubj "Subject [MARC 450]")
(FCNGMGPC "gmgpc000362")
(FCNlctgm "lctgm003419")
(TNR "tgm003425"))


(CONCEPT
(NON-DESCRIPTOR "Dykes")
(USE "Dikes (Engineering)")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003420")
(TNR "tgm003426"))


(CONCEPT
(DESCRIPTOR "Dynamite")
(UF "Sticks of dynamite")
(BT "Explosives")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003421")
(TNR "tgm003427"))


(CONCEPT
(NON-DESCRIPTOR "Dynamo rooms")
(USE "Engine rooms")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm00342")
(TNR "tgm003428"))


(CONCEPT
(DESCRIPTOR "Eagles")
(GEO-FACET ":COUNTRY :STATE")
(UF "Bald eagles")
(UF "Golden eagles")
(BT "Birds of prey")
(CN "Used in a note under PATRIOTISM.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003423")
(TNR "tgm003429"))


(CONCEPT
(DESCRIPTOR "Ear surgery")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Surgery")
(RT "Ears")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003424")
(TNR "tgm003430"))


(CONCEPT
(NON-DESCRIPTOR "Earnings")
(USE "Wages")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003425")
(TNR "tgm003431"))


(CONCEPT
(DESCRIPTOR "Earrings")
(BT "Jewelry")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003426")
(TNR "tgm003432"))


(CONCEPT
(DESCRIPTOR "Ears")
(BT "Body parts")
(RT "Ear surgery")
(RT "Human body")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003427")
(TNR "tgm003433"))


(CONCEPT
(DESCRIPTOR "Earth")
(UF "World")
(BT "Planets")
(RT "Dirt")
(RT "Voyages around the world")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003428")
(TNR "tgm003434"))


(CONCEPT
(NON-DESCRIPTOR "Earth roads")
(USE "Dirt roads")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003429")
(TNR "tgm003435"))


(CONCEPT
(NON-DESCRIPTOR "Earth satellites")
(USE "Artificial satellites")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003430")
(TNR "tgm003436"))


(CONCEPT
(NON-DESCRIPTOR "Earthenware")
(USE "Pottery")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003431")
(TNR "tgm003437"))


(CONCEPT
(DESCRIPTOR "Earthquakes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "Includes the event and any resulting damage.")
(UF "Natural disasters")
(BT "Natural phenomena")
(RT "Disasters")
(RT "Tidal waves")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003432")
(TNR "tgm003438"))


(CONCEPT
(DESCRIPTOR "Earthworks (Archaeology)")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Facilities")
(RT "Archaeological sites")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003433")
(TNR "tgm003439"))


(CONCEPT
(DESCRIPTOR "Easter cards")
(BT "Greeting cards")
(FUN "Formerly TGMI term & TGMII term.")
(TTCForm "Genre/Format [MARC 155/655]")
(TTCSubj "Subject [MARC 150/650]")
(FCNGMGPC "gmgpc000363")
(FCNlctgm "lctgm003434")
(TNR "tgm003440"))


(CONCEPT
(DESCRIPTOR "Easter egg hunts")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Events")
(RT "Easter eggs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003435")
(TNR "tgm003441"))


(CONCEPT
(DESCRIPTOR "Easter eggs")
(BT "Eggs")
(RT "Easter egg hunts")
(RT "Holidays")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003436")
(TNR "tgm003442"))


(CONCEPT
(NON-DESCRIPTOR "Eastern Orthodox churches")
(USE "Orthodox churches")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003437")
(TNR "tgm003443"))


(CONCEPT
(DESCRIPTOR "Eating & drinking")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Dining")
(UF "Drinking")
(UF "Meals")
(BT "Manners & customs")
(NT "Banquets")
(NT "Barbecues")
(NT "Buffets (Cookery)")
(NT "Grazing")
(NT "School meals")
(RT "Beverages")
(RT "Cookery")
(RT "Dietary laws")
(RT "Dining tables")
(RT "Dinner parties")
(RT "Drinking vessels")
(RT "Eating & drinking facilities")
(RT "Food")
(RT "Gluttony")
(RT "Luaus")
(RT "Luncheons")
(RT "Picnics")
(RT "Railroad dining cars")
(RT "Silverware")
(RT "Tables")
(RT "Tableware")
(RT "Toasting")
(RT "Tube feeding")
(RT "Weight loss")
(CN "Double index, as appropriate, under food or beverage being consumed. Used in a note under COFFEE, COFFEEHOUSES, and TEA.")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003438")
(TNR "tgm003444"))


(CONCEPT
(DESCRIPTOR "Eating & drinking facilities")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Drinking facilities")
(BT "Commercial facilities")
(NT "Bars")
(NT "Beer gardens")
(NT "Beer halls")
(NT "Coffeehouses")
(NT "Employee eating facilities")
(NT "Restaurants")
(RT "Beverages")
(RT "Breakfast rooms")
(RT "Dining rooms")
(RT "Eating & drinking")
(RT "Food")
(RT "Nightclubs")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003439")
(TNR "tgm003445"))


(CONCEPT
(DESCRIPTOR "Eavesdropping")
(BT "Activities")
(BT "Behavior")
(HN "Changed 11/1991 from non-postable term (Use SURVEILLANCE).")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003440")
(TNR "tgm003446"))


(CONCEPT
(DESCRIPTOR "Echoes")
(GEO-FACET ":COUNTRY :STATE :CITY")
(BT "Sounds")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003441")
(TNR "tgm003447"))


(CONCEPT
(DESCRIPTOR "Eclipses")
(BT "Natural phenomena")
(RT "Astronomy")
(RT "Moon")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003442")
(TNR "tgm003448"))


(CONCEPT
(DESCRIPTOR "Ecology")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For the subject of the interrelationship of organisms and their environments and the activities of ecologists.")
(UF "Balance of nature")
(BT "Science")
(RT "Conservation of natural resources")
(RT "Environmental policy")
(RT "Nature")
(RT "Pollution")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003443")
(TNR "tgm003449"))


(CONCEPT
(DESCRIPTOR "Economic & industrial aspects")
(CN "Used only as a subdivision with :NAMES-OF :NAME-OF-WAR [Appendix C].")
(FUN "Formerly TGMI term.")
(TTCSubd "Subdivision [MARC 180 +x/650 +x]")
(FCNlctgm "lctgm003451")
(TNR "tgm003457"))


(CONCEPT
(DESCRIPTOR "Economic & political systems")
(UF "Government systems")
(UF "Political systems")
(BT "Politics & government")
(NT "Anarchism")
(NT "Apartheid")
(NT "Autonomy")
(NT "Capitalism")
(NT "Commercialism")
(NT "Communism")
(NT "Conservatism")
(NT "Democracy")
(NT "Fascism")
(NT "Imperialism")
(NT "International economic integration")
(NT "Liberalism")
(NT "Libertarianism")
(NT "Monarchy")
(NT "National socialism")
(NT "Nationalism")
(NT "Oligarchy")
(NT "Plutocracy")
(NT "Populism")
(NT "Radicalism")
(NT "Regionalism")
(NT "Sectionalism (United States)")
(NT "Secularism")
(NT "Separation of powers")
(NT "Slavery")
(NT "Socialism")
(NT "Technocracy")
(NT "Theocracy")
(NT "Totalitarianism")
(RT "Crises")
(RT "Economics")
(RT "International organization")
(RT "Perestroika")
(RT "Solidarity")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003452")
(TNR "tgm003458"))


(CONCEPT
(DESCRIPTOR "Economic & social conditions")
(GEO-FACET ":COUNTRY :STATE :CITY")
(UF "Social conditions")
(NT "Agricultural productivity")
(NT "Business panics")
(NT "Cost & standard of living")
(NT "Depressions")
(NT "Deterioration")
(NT "Economic aspects of war")
(NT "Employment")
(NT "Illegitimacy")
(NT "Industrial productivity")
(NT "Inflation")
(NT "Overcrowding")
(NT "Poverty")
(NT "Prices")
(NT "Progress")
(NT "Prosperity")
(NT "Recessions")
(NT "Scarcity")
(NT "School attendance")
(NT "Traffic congestion")
(NT "Unemployment")
(NT "Urban growth")
(NT "Wealth")
(RT "Business & finance")
(RT "City & town life")
(RT "Country life")
(RT "Domestic life")
(RT "Economics")
(RT "Gross national product")
(RT "Prestige")
(RT "Sociology")
(CN "This heading is primarily :USED-WITH group-level cataloging to cover the material situation or social status of individuals or groups. Used also as a subdivision with groups of people [Appendix A].")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003453")
(TNR "tgm003459"))


(CONCEPT
(DESCRIPTOR "Economic aspects of war")
(GEO-FACET ":COUNTRY :STATE :CITY")
(SN "For economic causes of war, cost of war, and effect of war and preparation for war on industrial and commercial activity. :SEARCH-SUBDIVISION --ECONOMIC & INDUSTRIAL ASPECTS :USED-WITH the :NAMES-OF :NAME-OF-WAR [Appendix C].")
(UF "Cost of war")
(UF "Economics of war")
(UF "War costs")
(BT "Economic & social conditions")
(NT "Reparations")
(NT "War bonds & funds")
(NT "War claims")
(NT "War profiteering")
(NT "War work")
(RT "Business & finance")
(RT "Consumer rationing")
(RT "Defense budgets")
(RT "Defense contracts")
(RT "Defense industry")
(RT "Sutlers")
(RT "Victory gardens")
(RT "War")
(RT "War relief")
(FUN "Formerly TGMI term.")
(TTCSubj "Subject [MARC 150/650]")
(FCNlctgm "lctgm003444")
(TNR "tgm003450"))


(CONCEPT
(NON-DESCRIPTOR "Economic assistance")
(USE "Assistance")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003445")
(TNR "tgm003451"))


(CONCEPT
(NON-DESCRIPTOR "Economic concentration")
(USE "Big business")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003446")
(TNR "tgm003452"))


(CONCEPT
(NON-DESCRIPTOR "Economic integration")
(USE "International economic integration")
(FUN "Formerly TGMI term [nonpostable].")
(TTCSubj "Subject [MARC 450]")
(FCNlctgm "lctgm003447")
(TNR "tgm003453"))


(CONCEPT
(DESCRIPTOR "Economic policy")
(GEO-FACET ":COUNTRY :STATE")
(UF "Appropriations")
(UF "Budget")
(UF "Federal spending")
(UF "Fiscal policy")
(UF "Five-year plans")
(UF "Spending policy")
(BT "Government policy")
(NT "Agricultural price supports")
(NT "Currency question")
(NT "Defense budgets")
(NT "Deficit financing")
(NT "Economic sanctions")
