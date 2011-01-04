;; <Timestamp: Sunday July 05, 2009 @ 05:36.23 AM - by Stan>
;;; ==============================
;;; regexps used to build:
;;; /home/sp/stan-workspace/lisp/local-emacs/emacs-load-files/naf-mode/notes/xml-parsing/lispified-tgm

;;; ==============================
;; (prin1 (xml-parse-file
;;         "/home/sp/stan-workspace/lisp/local-emacs/emacs-load-files/naf-mode/notes/xml-parsing/tgm1x_m_l2")
;;        (current-buffer))
;;; ==============================

;;......1..2...................3..........................
;;("^\\(\\((TNR nil \"tgm\\)\\([0-9]\\{6,6\\}\\)\")$\\)" . "(TNR \"tgm\\3\"))")

;;(" nil " .  " ")

;;......1..2...........3.......4............
;;(" \\(\\((MARC\\)\\( .*\\)\\()\\)\"\\)" . " [MARC\\3]\"")

;;" (nonpostable) " . " [nonpostable] "
;; " (nonpostable)\." . " [nonpostable] "
;;; ==============================
;; "^(Facet" . "(GEO-FACET"
;; "--[nationality]--[country or state]--[city]"

;; "--\\[nationality]" ":NATIONALITY "
;; "--\\[country]" :COUNTRY
;; "--\\[country or state]" ":COUNTRY :STATE "
;; "--\\[city]" ":CITY"
;; ":STATE \"" . ":STATE"

;;-> (GEO-FACET :NATIONALITY
;;              :COUNTRY
;;              :STATE
;;              :CITY

;;; ==============================
;; "(Appendix A)" . "[Appendix A]"
;; "(Appendix B)" . "[Appendix B]"
;; "(Appendix C)" . "[Appendix C]"
;; "(Appendix D)" . "[Appendix D]"
;; " (or NTs)  " . " - or NTs -"
;; " (or NTs) "  . " - or NTs -"
;; " (and NTs) " . " - or NTs -"
;; ;;..1..2................3............
;; ("\\(\\( - or NTs -\\)\\([^ ]\\)\\)" . "\\2 \\3")
;; ("As appropriate, double index under" . ":DOUBLE-INDEX")


;; ("search under the subdivision" . ":SEARCH-SUBDIVISION")
;; ("Search also under the subdivision" . ":SEARCH-SUBDIVISION")
;; ("Search under: . ":SEARCH-SUBDIVISION")


;; ("Subdivide by" . ":SUBDIVIDE-BY")
;; ("Subdivided by" . ":SUBDIVIDE-BY")
;; ("sudivided by" . ":SUBDIVIDE-BY")
;; ("Subdivide geographically" . ":SUBDIVIDE-BY geographically")
;; ("Subdivide for" . ":SUBDIVIDE-BY")

;; (":SUBDIVIDE-BY nationality" . ":SUBDIVIDE-BY :NATIONALITY")
;; (":SUBDIVIDE-BY the nationality of:" .":SUBDIVIDE-BY :NATIONALITY of")

;; (":DOUBLE-INDEX the name of the" . ":DOUBLE-INDEX :NAMES-OF the")

;; ("used with" . ":USED-WITH")
;; (", and with" .  " :USED-WITH")
;; ("and with" . ":USED-WITH")

;; ("names of specific wars" . "names of wars") ;cleanup first
;; ("corporate bodies and named events" . ":CORPORATE-BODY :NAMED-EVENT")
;; ("named events" . ":NAMED-EVENT")

;; ("classes of persons" . :CLASSES-OF-PERSONS)
;; ("classes of persons" . :CLASSES-OF-PERSONS)
;; ("names of persons" . ":NAMES-OF :NAMED-PERSON)
;; ("names of wars" . ":NAMES-OF :NAME-OF-WAR")
;; ("names of" ":NAMES-OF")

;; ("ethnic, national, or regional group" . ":ETHNIC-GROUP :NATIONAL-GROUP :REGIONAL-GROUP")
;; ("ethnic, national, or regional group" . ":ETHNIC-GROUP :NATIONAL-GROUP :REGIONAL-GROUP")
;; ("ethnic, racial and regional groups" . ":ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP")
;; ("ethnic, racial, and regional groups" . ":ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP")
;; ("ethnic, racial, and regional groups" . ":ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP")
;; ("ethnic, racial, or regional group" . ":ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP")
;; ("names of indigenous peoples" . "INDIGENOUS PEOPLES")
;; ("racial or ethnic groups" . ":ETHNIC-GROUP :RACIAL-GROUP")
;; ("racial or ethnic groups" . ":ETHNIC-GROUP :RACIAL-GROUP")
;; ("ethnic or racial group" . ":ETHNIC-GROUP :RACIAL-GROUP")
;; names of ethnic . :NAMES-OF :ETHNIC-GROUP
;; names of racial groups . :RACIAL-GROUP
;; names of regional groups :REGIONAL-GROUP
;; names of corparate bodies :CORPORATE-BODY

;; ("names of" ":NAMES-OF")
;; ("corporate bodies and named events" . ":CORPORATE-BODY :NAMED-EVENT")
;; ("named events" . ":NAMED-EVENT")
;; ("names of indigenous peoples" . "INDIGENOUS PEOPLES")
;; ("names of persons" . ":NAMES-OF :NAMED-PERSON)
;; ("names of wars" . ":NAMES-OF :NAME-OF-WAR")

;; ("national, state, or city" . ":NATIONALITY :COUNTRY :STATE :CITY")
;; ("Subdivide by nationality of" . "SUBDIVIDE-BY :NATIONALITY of")
;; (":SUBDIVIDE-BY nationality" . ":SUBDIVIDE-BY :NATIONALITY")
;; ("by the nation" . "by :NATIONALITY of the nation")
;; ("by country" . "by :COUNTRY")
;; ("country or state" ":COUNTRY or :STATE")

;;; ==============================
;;; ==============================
;;; ==============================

(CN "As appropriate, double index under AUTOMOBILE SERVICE STATIONS for images that focus on service stations.")
(CN "As appropriate, double index under the subdivision --PEACE used with names of wars (Appendix C).")
(CN "Changed 10/1995 from non-postable term (Use CHILDREN). As appropriate, subdivide by the subdivisions used for classes of persons (Appendix A).")
(CN "Do not double index under SYMBOLS to indicate that one term is being used as a symbol of another term. Thus, PEACE and DOVES, not PEACE and DOVES and SYMBOLS.")
(CN "Double index under INDUSTRIAL FACILITIES (or NTs ) for images that focus on facilities.")
(CN "Double index under INDUSTRIAL FACILITIES (or NTs)  for images that focus on facilities.")
(CN "Double index with the name of the war and the subdivision --DESTRUCTION & PILLAGE (Appendix C). Used in a note under RUINS.")
(CN "Use for allegorical images of water and/or drinking water.  For images of real bodies of water, use BODIES OF WATER (or NTs).")
(CN "Subdivide geographically as appropriate to indicate national, state, or city levels of organization. :DOUBLE-INDEX ORGANIZATIONS' FACILITIES (or NTs) for images that focus on facilities.")
(CN "Subdivide by countries involved in relationship.  May use multiple headings to reflect all the countries involved, e.g. INTERNATIONAL RELATIONS--CHINA; INTERNATIONAL RELATIONS--FRANCE.")
(CN "This heading is primarily used with group-level cataloging to cover the material situation or social status of individuals or groups. Used also as a subdivision with groups of people [Appendix A].")
(CN "Subdivide geographically as appropriate to indicate national, state, or city levels of organization. :DOUBLE-INDEX ORGANIZATIONS' FACILITIES - or NTs - for images that focus on facilities.")
(HN "Added 1/97.  Formerly, WAXED PAPER NEGATIVES may have been indexed as CALOTYPES.")
(HN "Changed 1/1993 from WINGS (ROOMS & SPACES).")
(HN "Changed 1/97.  Formerly, WALLPAPERS may have been indexed as WALLPAPER.")
(HN "Changed 10/90.  Formerly, VIDEODISCS may have been indexed as VIDEO DISKS.")
(HN "Changed 10/90.  Formerly, VIEWBOOKS may have been indexed as SOUVENIR VIEWBOOKS. Also changed 6/94. Formerly, some VIEWBOOKS may have been indexed as SOUVENIR ALBUMS.")
(HN "Changed 11/2006 from non-postable term (USE MILITARY ART & SCIENCE).")
(HN "Changed 11/90.  Formerly, WATERCOLORS may have been indexed as WATERCOLOR DRAWINGS or WATERCOLOR PAINTINGS.")
(HN "Prior to 11/2008, TROUGHS may have been indexed under WATERING TROUGHS.")
(HN "Prior to 11/2008, TROUGHS may have been indexed under WATERING TROUGHS.")
(HN "Term made non-postable, 1/1993, when PALLADIAN WINDOWS was made postable, and DIOCLETIAN WINDOWS and VENETIAN WINDOWS were made non-postable.")
(SN ":SEARCH-SUBDIVISION --COMMEMORATION used with names of ethnic, racial, and regional groups and classes of persons [Appendix A]; with names of persons [Appendix B]; with names of wars [Appendix C]; and with corporate bodies and named events [Appendix D].")
(SN ":SEARCH-SUBDIVISION --MILITARY TACTICS used with names of wars [Appendix C]. Search also under other terms beginning with MILITARY.")
(SN "Advertising cards issued or enclosed with such products as bread, cigarettes, and agricultural machinery.  Use COLLECTING CARDS for cards not intended to be advertisements.")
(SN "For ancient structures still largely intact and remains of ancient structures; also includes active excavations. :SEARCH-SUBDIVISION ANTIQUITIES for relics (coins, etc.) of ancient times. :SEARCH-SUBDIVISION RUINS for remains of structures not of ancient times and under ABANDONED BUILDINGS for vacant, possibly dilapidated buildings. :SEARCH-SUBDIVISION --ANTIQUITIES & ARCHAEOLOGICAL SITES used with names of ethnic, racial, and regional groups, and with classes of persons [Appendix A].")
(SN "For buildings in general; includes buildings with indeterminate functions and buildings distinguished by attributes other than function.   :SEARCH-SUBDIVISION other FACILITIES NTs for buildings that serve particular functions (e.g., AGRICULTURAL FACILITIES).  :SEARCH-SUBDIVISION -- STRUCTURES used with ethnic, racial, and regional groups, and classes of persons [Appendix A].  :SEARCH-SUBDIVISION --BUILDINGS used with names of corporate bodies and named events [Appendix D].")
(SN "For civilian work as part of a war effort. For the effect of war on industrial and commerical activity search under the subdivision --ECONOMIC & INDUSTRIAL ASPECTS or by ethnic, racial, regional groups, and classes of persons subdivisions used with names of specific wars (Appendix C).  The subdivision --WAR used with the names of ethnic, racial and regional groups, and with classes of persons (Appendix A) is used only when the war cannot be identified.")
(SN "For domestic and non-commercial activities, e.g., washing and ironing. Includes laundry work in institutions such as hospitals. Search under CLEANING ESTABLISHMENTS for activities in commercial laundries.")
(SN "For events intended to rally support for war or to spur labor production on behalf of war. Search also under the subdivisions --ECONOMIC & INDUSTRIAL ASPECTS, --EQUIPMENT & SUPPLIES, --RECRUITMENT & ENLISTMENT, and --SOCIAL ASPECTS used with names of wars (Appendix C).")
(SN "For images that focus on dead and wounded persons. Search under MEDICAL ASPECTS OF WAR for relief and medical care of casualties. Search also under the subdivision --CASUALTIES or --MEDICAL ASPECTS used with names of wars (Appendix C).")
(SN "For images that focus on social or economic impacts of unemployment. Use UNEMPLOYED for images of out-of-work or jobless people.")
(SN "For rites and ceremonies in memory of persons, with the deceased present; also for customs associated with mourning. :SEARCH-SUBDIVISION MEMORIAL RITES & CEREMONIES for rites and ceremonies without the presence of the deceased. :SEARCH-SUBDIVISION --DEATH & BURIAL used with names of persons [Appendix B].")
(SN "For the activity of pretending to be another person or type of person. Search also under ENTERTAINERS (and NTs) for portraits in costume. :SEARCH-SUBDIVISION --PERFORMANCES & PORTRAYALS used with ethnic, racial, and regional groups, and with classes of persons [Appendix A]. :SEARCH-SUBDIVISIONs --PERFORMANCES and --PORTRAYALS used with names of persons [Appendix B].")
(SN "For the general subject of looting and destruction of property in the context of war as well as specific acts of plundering. Search also under the subdivision --DESTRUCTION & PILLAGE used with names of wars (Appendix C).")
(SN "For the subject of employment in general. Search also under headings such as BUSINESS ENTERPRISES, INDUSTRY, and MINING for images of people working. :SEARCH-SUBDIVISION --EMPLOYMENT used with names of ethnic, racial, and regional groups, and with classes of persons [Appendix A]. :SEARCH-SUBDIVISION CHILD LABOR for employment of children.")
(SN "For the subject of fishing in general and fishing as a local livelihood. Includes portraits of fishermen with their catch. :SEARCH-SUBDIVISION FISHING INDUSTRY for large-scale fishing. :SEARCH-SUBDIVISION --SUBSISTENCE ACTIVITIES used with indigenous peoples [Appendix A].")
(SN "For the subject of war in general and for wars that cannot be identified by name. Search primarily under names of specific wars and relevant topical subdivisions (Appendix C). The subdivision --WAR is used with names of ethnic, racial and regional groups, and with classes of persons (Appendix A) only when the war cannot be identified.")
(SN "For work activities on farms. :SEARCH-SUBDIVISION PLANTS and NTs for specific farm crops. :SEARCH-SUBDIVISION --SUBSISTENCE ACTIVITIES used with indigenous people [Appendix A].")
(SN "Guiding tools used for duplicating shapes.  [AAT]")
(SN "Heat-produced quick copy reproductions of pictorial or textual documents. Introduced commercially ca. 1950.")
(SN "Includes ages 0-16. This heading may be further subdivided by the subdivisions used for classes of persons [Appendix A]. :SEARCH-SUBDIVISION --CHILDREN used with names of ethnic, racial, and regional groups [Appendix A], and with names of wars [Appendix C]. Search also under other headings beginning with CHILDREN.")
(SN "Includes festivities associated with major events and holidays, as well as smaller festivities such as birthday parties. :SEARCH-SUBDIVISION --COMMEMORATION used with the names of ethnic, racial, and regional groups, and classes of persons [Appendix A]; with names of persons [Appendix B]; with names of wars [Appendix C]; and with corporate bodies and named events [Appendix D].")
(SN "Includes relations among individuals and groups of people. :SEARCH-SUBDIVISION --SOCIAL LIFE used with names of ethnic, racial, and regional groups, and with classes of persons [Appendix A]; with names of persons [Appendix B]; and with corporate bodies and named events [Appendix D].")
(SN "Manufacture, trade, and the processing of  materials and products. Includes activities and structures. :SEARCH-SUBDIVISION --INDUSTRIES used with names of indigenous peoples [Appendix A].")
(SN "Photographic prints made by a formula introduced in the late 1800s.  Used in the 1920s-1950s to reproduce architectural, engineering, and mechanical drawings. Mirror image white lines on a dark brown or sepia background were used to make blue or black line prints.  Revived in mid-1960s as an alternative photographic process.")
(SN "Photographic prints made from color separation negatives printed as three bromide prints, each of which is then pressed against a sensitized carbon tissue of the appropriate color.  The tissues are then superimposed to create the final color photograph.  Chiefly used ca. 1900-1930s.")
(SN "Relics of ancient times, such as coins or statues. :SEARCH-SUBDIVISION ARCHAEOLOGICAL SITES for ancient structures or remains of ancient structures. :SEARCH-SUBDIVISION ANTIQUES for objects of an earlier period, but not of ancient times. :SEARCH-SUBDIVISION --ANTIQUITIES & ARCHAEOLOGICAL SITES used with names of ethnic, racial, and regional groups and with classes of persons [Appendix A].")
(SN "Search also under the subdivision --COMMUNICATIONS used with names of wars (Appendix C).")
(SN "Search also under the subdivision --PEACE used with names of wars (Appendix C).")
(SN "Search also under the subdivision --TRENCH WARFARE used with names of wars (Appendix C).")
(SN "Search also under the subdivision --UNDERGROUND MOVEMENTS used with names of wars (Appendix C).")
(SN "Search also under the subdivision --Veterans used with Names Of Wars (Appendix C).")
(SN "Works produced by artists in their childhood or youth. See CHILDREN'S ART for works produced by children in general.")

;;; ==============================
"Search also under other"
"The subdivision"
" and under XXXXXXXX"
As appropriate, subdivide by subdivisions for classes of persons
"Used only as a subdivision with:"

"For the subject of "
"for images"
"Works depicting"
"for images that focus on"
"for images that focus on facilities" - ;;multiple occurences of this
"Representations of"

"Includes activities and structures"
"Includes activities and structures."

"Used in a note"

"may have been indexed under"
"may have been indexed as"

Chiefly used ca. 1900-1930s.
made non-postable
See

for activities in


;;; ==============================


(CN ":SUBDIVIDE-BY location of national or regional association, as appropriate.")
 "of people giving assistance and :SUBDIVIDE-BY geographically by country receiving assistance."

nationality [of]
country
location [of]
place
ethnic, national, or regional group
countries

subdivisions
       -classes of persons
       -used for

geographically
       -country
       -place

;;; ==============================
classes of persons

country of origin
names of wars

names of
 :ETHNIC-GROUP
 :RACIAL-GROUP
 :REGIONAL-GROUP



"geographically by country" .
"geographically by the nation" .
"geographically by country" .

"geographically by the country or state" .


;;; ==============================
;; :NAMES-OF





;;; ==============================
;;; subdivide by notes
;; 52 matches for "subdivide by" in buffer: lispified-tgm (Occur output)
Subdivide geographically
Subdivide geographically
Search also under the subdivision --CHILDHOOD AND YOUTH
As appropriate, subdivide by subdivisions for classes of persons
This heading may be further subdivided by the subdivisions used for classes of persons (Appendix A).

(CN "Changed 10/1995 from non-postable term (Use CHILDREN). As appropriate, subdivide by the subdivisions used for classes of persons (Appendix A).")
(CN "Subdivide by countries involved in relationship.  May use multiple headings to reflect all the countries involved, e.g. INTERNATIONAL RELATIONS--CHINA; INTERNATIONAL RELATIONS--FRANCE.")
As appropriate, subdivide by subdivisions for classes of persons
(CN "Subdivide by nationality of country ambassador represents.")
(CN "Subdivide by country granting amnesty.")
(CN "Subdivide by nationality of those committing the atrocity.")
(CN "Subdivide by location of national or regional association, as appropriate.")
(CN "Subdivide by nationality of those imposing the blockade.")
(CN "Subdivide by nationality of those imposing the boycott.")
(CN "As appropriate, subdivide by place with which cakes are associated.")
(CN "As appropriate, subdivide by place with which candy is associated.")
(CN "As appropriate, subdivide by the subdivisions used for classes of persons [Appendix A].")
(SN "Subdivide by nationality only when relief provided to another country.")
(CN "Subdivide by colonizing country.")
(CN "As appropriate, subdivide by place with which confections are associated.")
(CN "Subdivide by nationality of country consul represents.")
(CN "Subdivide by nationality for national costumes.")
(CN "Subdivide by nationality of those initiating the operation.")
(CN "Subdivide by nationality of deceivers when the deception is perpetrated by one nation on another.")
(CN "Subdivide by nationality of country making declaration.")
(CN "Subdivide by nationality of country diplomat represents.")
(CN "Subdivide by nationality of those doing the discovery & exploration.")
(CN "Subdivide by nationality of government imposing the embargo.")
(CN "Subdivide by nationality for country of origin. Used in a note under IMMIGRANTS and IMMIGRATION STATIONS.")
(SN "Subdivide by nationality only when relief provided to another country.")
(CN "Subdivide by nationality of those perpetrating the forced labor.")
(CN "Subdivide by nationality of those committing the genocide.")
(CN "Subdivide by ethnic, national, or regional group.")
(CN "Subdivide by ethnic, national, or regional group.")
(CN "Use only when specific ethnic or racial group name is not known. As appropriate, subdivide by the subdivisions used for classes of persons [Appendix A].")
(CN "Subdivide by nationality of people giving assistance and subdivide geographically by country receiving assistance.")
(CN "Subdivide by countries involved in relationship.  May use multiple headings to reflect all the countries involved, e.g. INTERNATIONAL RELATIONS--CHINA; INTERNATIONAL RELATIONS--FRANCE.")
(CN "Subdivide by nationality of those committing the massacre.")
(CN "As appropriate, subdivide by the subdivisions used for classes of persons [Appendix A].")
(CN "Subdivide by nationality of people giving assistance. Subdivide geographically by country receiving assistance.")
(CN "Subdivide by nationality of the invading country.")
(CN "Subdivide by nationality only when in another country.")
(CN "Subdivide by nationality of those conducting the reconnaissance.")
(CN "As appropriate, subdivide by subdivisions used for classes of persons [Appendix A].")
(CN "As appropriate, subdivide by the subdivisions used for classes of persons [Appendix A].")
(CN "Subdivide by the nationality of the prisoners.")
(CN "Subdivide by nationality of country paying reparations; subdivide geographically by country receiving reparations.")
(CN "Subdivide by nationality of those conducting the rescue. Used in a note under RESCUES.")
(CN "Subdivide by nationality of those doing the scuttling.")
(CN "Subdivide by nationality of country surrendering and subdivide geographically by place of depiction.")
(CN "Changed 10/1995 from non-postable term (Use CHILDREN). As appropriate, subdivide by the subdivisions used for classes of persons [Appendix A].")
(CN "Subdivide by nationality of those commiting terrorist acts, when operating outside their own country.")
(CN "Subdivide by nationality only when in another country.")
(CN "Subdivide by nationality of the victors.")
(CN "Subdivide by nationality of those committing the crimes.")
(CN "As appropriate, subdivide by subdivisions for classes of persons [Appendix A].")
;;; ==============================
;;; ==============================
;;; ==============================
34 matches for "geographically" in buffer: lispified-tgm
(CN ":SUBDIVIDE-BY geographically by area being annexed.")
(CN ":SUBDIVIDE-BY geographically by place in which assistance is given. Used in a note under SCARCITY.")
(CN ":SUBDIVIDE-BY geographically by the jurisdiction (e.g. state, nation) of the cabinet officer.")
(CN ":SUBDIVIDE-BY geographically by the jurisdiction (e.g., state, nation) of the cabinet officer.")
(CN ":SUBDIVIDE-BY geographically for the place cowboys are depicted.")
(CN ":SUBDIVIDE-BY geographically for place where cowgirls are depicted.")
(CN ":SUBDIVIDE-BY geographically as appropriate to indicate national, state, or local level.")
(CN ":SUBDIVIDE-BY geographically by country from which persons are being deported.")
(CN ":SUBDIVIDE-BY geographically for place farmer resides.")
(CN ":SUBDIVIDE-BY geographically for place fisherman resides.")
(CN ":SUBDIVIDE-BY geographically for the jurisdiction which the governor represents.")
(CN ":SUBDIVIDE-BY geographically by the nation the head of state represents.")
(CN ":SUBDIVIDE-BY geographically by country in which the immigrants have settled. :DOUBLE-INDEX :NAMES-OF the :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP, :SUBDIVIDE-BY country in which they have settled.")
(CN ":SUBDIVIDE-BY :NATIONALITY of people giving assistance and :SUBDIVIDE-BY geographically by country receiving assistance.")
(CN ":SUBDIVIDE-BY geographically for the jurisdiction of the legislative body.")
(CN ":SUBDIVIDE-BY geographically for the jurisdiction of the body to which the legislator belongs e.g., national, state, etc.")
(CN ":SUBDIVIDE-BY geographically for the jurisdiction of the body to which the legislator belongs e.g., national, state, etc.")
(CN ":SUBDIVIDE-BY :NATIONALITY of people giving assistance. :SUBDIVIDE-BY geographically by country receiving assistance.")
(CN ":SUBDIVIDE-BY geographically by the country or state from which the militia comes.")
(CN ":SUBDIVIDE-BY geographically by place where newspaper is published.")
(CN ":SUBDIVIDE-BY geographically by jurisdiction, e.g., national, state, or city levels of politics and government.")
(CN ":SUBDIVIDE-BY geographically by the nation the president represents.")
(CN ":SUBDIVIDE-BY geographically by the nation the prime minister represents.")
(CN ":SUBDIVIDE-BY :NATIONALITY of country paying reparations; :SUBDIVIDE-BY geographically by country receiving reparations.")
(CN ":SUBDIVIDE-BY geographically by place to which people are returning.")
(CN ":SUBDIVIDE-BY geographically by site in which spacecraft is depicted or, if outside of earth's airspace, by destination.")
(CN ":SUBDIVIDE-BY geographically as appropriate to indicate national, state, or city levels of organization. :DOUBLE-INDEX ORGANIZATIONS' FACILITIES - or NTs - for images that focus on facilities.")
(CN ":SUBDIVIDE-BY geographically as appropriate to indicate national or state level.")
(CN ":SUBDIVIDE-BY :NATIONALITY of country surrendering and :SUBDIVIDE-BY geographically by place of depiction.")
(CN ":SUBDIVIDE-BY geographically by the country claiming jurisdiction.")
(CN ":SUBDIVIDE-BY :NATIONALITY of people giving relief and :SUBDIVIDE-BY geographically for country receiving relief.")
(CN ":SUBDIVIDE-BY geographically as appropriate to indicate national, state, or city levels of organization. :DOUBLE-INDEX ORGANIZATIONS' FACILITIES - or NTs - for images that focus on facilities.")
(CN ":SUBDIVIDE-BY geographically as appropriate to indicate national, state, or city levels of organization. :DOUBLE-INDEX ORGANIZATIONS' FACILITIES - or NTs - for images that focus on facilities.")
(CN ":SUBDIVIDE-BY geographically by the country or state from which the Zouave unit comes.")

;;; ==============================
;;; ==============================
8 matches for "subdivided by" in buffer: lispified-tgm
(SN "Includes ages 0-16. This heading may be further subdivided by the subdivisions used for classes of persons [Appendix A]. :SEARCH-SUBDIVISION --CHILDREN :USED-WITH names of ethnic, racial, and regional groups [Appendix A] :USED-WITH names of wars [Appendix C]. Search also under other headings beginning with CHILDREN.")
(CN "Subdivide geographically by country in which the immigrants have settled. :DOUBLE-INDEX the name of the ethnic, racial, or regional group, subdivided by country in which they have settled.")
(SN "This heading may be further subdivided by the subdivisions used for classes of persons [Appendix A]. See also Library of Congress Subject Headings for names of specific groups.")
(SN "This heading may be further subdivided by the subdivisions used for classes of persons [Appendix A]. :SEARCH-SUBDIVISION --MEN :USED-WITH names of ethnic, racial, and regional groups [Appendix A].")
(SN "This heading may be further subdivided by the subdivisions used for classes of persons [Appendix A].")
(SN "This heading may be further subdivided by the subdivisions used for classes of persons [Appendix A].")
(SN "For persons in the general age range of thirteen to eighteen years. This heading may be further subdivided by the subdivisions used for classes of persons [Appendix A].")
(SN "This heading may be further subdivided by the subdivisions used for classes of persons [Appendix A]. Search also under other headings beginning with WOMEN or WOMEN'S. :SEARCH-SUBDIVISION --WOMEN :USED-WITH names of ethnic, racial, and regional groups [Appendix A] and with names of wars [Appendix C].")

;;; ==============================
;;; ==============================
(while
(search-forward-regexp ", and with")
(replace-match " :USED-WITH"))
;;; ==============================
