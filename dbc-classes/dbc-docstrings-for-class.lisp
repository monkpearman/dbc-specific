;;; :FILE-CREATED <Timestamp: #{2011-03-25T17:55:20-04:00Z}#{11125} - by MON>
;;; :FILE dbc-classes/dbc-class-docstrings.lisp
;;; ==============================


(in-package #:dbc)

;; (setf mon:*default-class-documentation-table* (make-hash-table))

(eval-when (:compile-toplevel); :load-toplevel :execute)

;;; system-base
(make-documented-class 'system-base
:class-doc
#.(format nil 
"Toplevel class for dbc system and system path related objects.~%▶▶▶~%"))

;;; system-path
(make-documented-class 'system-path 
:system-path 
#.(format nil 
"Slot holding the base or topmost paths for dbc system.~%~@
This slot is class allocated and all sub-systems in the dbc-system automatically
inherit it's value.~%~@
This slot value is set automatically at loadtime and should not be rebound.~%~@
User code should not attempt setf the value of this slot!~%")
:class-doc
#.(format nil "Base class for storing dbc system paths.~%▶▶▶~%"))

;; system-subdir
(make-documented-class 'system-subdir
:sub-path
#.(format nil 
"An existing pathname with SUB-NAME in PARENT-PATH.~%")
:sub-name
#.(format nil 
"Name component of a subdir of PARENT-PATH.~%")
:parent-path
#.(format nil 
"The immediate PATHNAME containing the SUB-PATH with SUB-NAME.~%")
:var-name
#.(format nil 
"Initially names the variable holding this object.~%~@
Complex binding behaviour at loadtime.~%")
:class-doc
#.(format nil 
"Slot values of this class access metatda related to subdir/subcomponents
relative to the systems system-path.~%~@
Instances of this class should be instantiated at loadtime enabling subsequent
system introspection of the system at runtime.~%▶▶▶~%"))

;; base-regexp
(make-documented-class 'base-regexp
:class-doc
#.(format nil
"Base class for matching control names of DBC entity instances.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;; entity-regexp-subclass-allocation
(make-documented-class 'entity-regexp-subclass-allocation

:subclass-match-entity-class
#.(format nil 
"Instantiate to a corresponding global class allocated variable value per~%~
subclass of base-regexp.~%~@
This slot corresponds to the MATCH-MATCHER-CLASS slot of ENTITY-REGEXP class.~%~@
Subclasses should access slot-value with a method specialized on~%~
`regexp-match-entity-class' and should not establish direct or indirect setf~%~
methods on the slot-value.~%")

:subclass-match-entity-db
#.(format nil 
"Instantiate to a corresponding global class allocated variable value per~%~
subclass of base-regexp.~%~@
This slot corresponds to the MATCH-MATCHER-DB slot of ENTITY-REGEXP class.~%
Subclasses should access slot-value with a method specialized on~%~
`regexp-match-entity-db' and should not establish direct or indirect setf~%~
methods on the slot-value.~%")

:subclass-match-matcher-db
#.(format nil 
"Instantiate to a corresponding global class allocated variable value per~%~
subclass of base-regexp.~%~@
This slot corresponds to the MATCH-MATCHER-DB slot of ENTITY-REGEXP class.~%~
Subclasses should access slot-value with a method specialized on~%~
`regexp-match-matcher-db' and should not establish direct or indirect setf~%~
methods on the slot-value.~%")

:class-doc
#.(format nil 
"Instances of this class hold the class allocated slot values that subclasses of~%~
the ENTITY-REGEXP class should indirect access through.~%~
The intent of this class is to obfuscate access and instantiation of the global~%~
variables that ENTITY-REGEXP subclasses must instantatiate and access but should~%~
not expose via direct :reader :write :accesor methods.~%"))


(make-documented-class 'entity-regexp
:match-entity-class
#.(format nil
"The class of entity regexp subclasses matched by an instance of this class.~%~@
For example, regexp instances of a subclass which match artist NAFs by their
control name would share the same MATCH-ENTITY-CLASS.~%~@
Likewise, regexp instances of a subclass which match artist NAFs by their
alternative name forms would share the same MATCH-ENTITY-CLASS, but would
maintain a separate MATCH-ENTITY-DB.~%~@
This slot is global per subclass.~%~@
Subclasses should instantiate this slot with :allocation class.~%~@
Its class allocated value should be indirected through access to the
SUBCLASS-MATCH-ENTITY-CLASS slot of an instance of
ENTITY-REGEXP-SUBCLASS-ALLOCATION class.~%~@
Subclasses should access slot-value with a method specialized on~%~
`regexp-match-entity-class' and should not establish direct or indirect setf~%~
methods on this slot.~%")

:match-entity-db
#.(format nil 
"The symbol holding a lookup table of match-container-uuid/entity-instance-uuid pairs.~%~@
 This likely names a special variable and prob. of type `cl:hash-table'.~%~@
 For each regexp subclass there is a corresponding MATCH-ENTITY-DB regardless of~@
 whether that subclass might share a MATCH-ENTITY-CLASS with other subclasses.~%~@
 For example, two sibling subclsses R-1 and R-2 might both match artist NAF~@
 entities and share the same MATCH-ENTITY-CLASS:~%~@
 - R-1 has a MATCH-CONTAINER which is an CL-PPCRE closure matching artist NAFs~%~
   by their control name;~%~@
 - R-2 has a MATCH-CONTAINER which is a list of strings to map as regexps with~%~
   each string matching an artist enity by a known alternative name forms.~%~@
 R-1 and R-2 will maintain a separate MATCH-ENTITY-DB because:~%~@
 - It makes dispatching on the keyed UUID value type of a matcher easier.~%~@
   For example, R-1 matchers are likely more efficient per their~%~@
   match-container-type than those of R-2.~%~@
 - It ensures any potential destrucive actions made in lieu of a match may~%~
   occur in the correct order.~%~@
   For example, R-1 matchers are likely more specific than those of R-2 and~@
   likely it is important that all R-1 matchers sharing the same~@
   MATCH-ENTITY-CLASS be invoked before any of the R-2 matchers in order to~@
   preserve the integrity of the primary control-names.~%~@
   This slot is global-per-subclass.~%~@
   Subclasses should instantiate this slot with :allocation class.~%~@
   Its class allocated value should be indirected through~%~@
   access to the SUBCLASS-MATCH-ENTITY-DB slot of an instance
   of ENTITY-REGEXP-SUBCLASS-ALLOCATION class.~%~@
Subclasses should access slot-value with a method specialized on~%~
`regexp-match-entity-db' and should not establish direct or indirect setf~%~
methods on this slot.~%")

:match-matcher-db
#.(format nil
"Symbol holding a lookup table of match-container-uuid/matcher key value pairs.~%~@
This likely names a special variable and is probably of type `cl:hash-table'.~%~@
For each regexp subclass there is a corresponding MATCH-MATCHER-DB regardless of~@
whether that subclass might share a MATCH-ENTITY-CLASS with other subclasses.~@
The keys into the MATCH-MATCHER-DB are shared with the keys of the MATCH-ENTITY-DB.~@
However, where the latter maps to the UUID of a class instance, the values of a~@
MATCH-MATCHER-DB point to to a matcher which is held in a datastructure specified by~@
MATCH-CONTAINER-TYPE.~%~@
This slot is global per subclass.~%
Subclasses should instantiate this slot with :allocation class.~%~@
Its class allocated value should be indirected through access to the~@
SUBCLASS-MATCH-MATCHER-DB slot of an instance of~@
ENTITY-REGEXP-SUBCLASS-ALLOCATION class.~%~@
Subclasses should access slot-value with a method specialized on~@
`regexp-match-matcher-db' and should not establish direct or indirect setf~@
methods on this slot.~%")

:match-container-type
#.(format nil  
"The type of matcher containing the regexp(s) of an instance.~%~@
Possible values might include:~%~% ~
 closure list string array hash-table~%~@
This slot is local per subclass instance.~%
Subclasses should access slot-value with a method specialized on.~%~
`regexp-match-container-type'. This slot is setfable.~%")

:match-container-uuid         ;; local-per-instance, access with regexp-match-container-id
#.(format nil 
"A UUID associated with a regexp matcher's container.~%~@
This UUID is the key in a key/value pair of the form:~%~% ~
<UUID> <CONTAINED-MATCHER>~%~@
This slot is local per subclass instance.~%~@
Subclasses should access slot-value with a method specialized on~%~
`regexp-match-container-uuid'.~%~@
This slot is setfable.~%~@
Specializers should take special care to ensure that they don't overwrite an
existing UUID.~%~@
An OBJ's UUID should be treated as an immutable constant in almost all
circumstances. Therefor, the intent of this function is to mediate generation of
UUID's run :after initialize-instance and/or when an instance is obsoleted with
`cl:make-instances-obsolete'.~%")

:match-entity-matcher
#.(format nil 
"A matcher object for matching an entity.~%~@
Its type should should be as specified by MATCH-CONTAINER-TYPE.~%~@
It's value is accessed by association with the MATCH-CONTAINER-UUID in the~@
applicable MATCH-MATCHER-DB.~%~@
It should match an entity with a UUID value in the applicable MATCH-ENTITY-DB
for the instances MATCH-ENTITY-CLASS.~%~@
This slot is local per subclass instance.~%~@
Subclasses should access slot-value with a method specialized on.~%~
`regexp-matcher'. This slot is setfable.~%")

:class-doc
#.(format nil
"Class implementing the core slots for implementation of subtyped entity matchers.~%~@
Don't instantiate directly from this class.~%~@
:SEE-ALSO ~%▶▶▶~%"))


;; parsed-field-name-regexp
(make-documented-class 'parsed-field-name-regexp
:class-doc
 #.(format nil
"An `entity-regexp' subclass for matching XML-refs parsed field-names.~%~
:SEE-ALSO .~%▶▶▶~%"))

;; theme-entity-regexp
(make-documented-class 'theme-entity-regexp
:class-doc
 #.(format nil
"An `entity-regexp' sub-class for themes.~%~@
:SEE-ALSO `base-theme-entity'.~%▶▶▶"))

;; category-entity-regexp
(make-documented-class 'category-entity-regexp
:class-doc
 #.(format nil
"An `entity-regexp' sub-class for DBC categories.~%~
:SEE-ALSO `base-category-entity'.~%▶▶▶"))

;; media-entity-regexp
(make-documented-class 'media-entity-regexp
:class-doc
 #.(format nil
"An `entity-regexp' sub-class for DBC media types.~%~
:SEE-ALSO `base-media-entity'.~%▶▶▶"))

;; location-entity-regexp
(make-documented-class 'location-entity-regexp
:class-doc
 #.(format nil
"An `entity-regexp' sub-class for DBC location entities.~%~
:SEE-ALSO `base-location-entity'.~%▶▶▶"))

;; naf-entity-type-regexp
(make-documented-class 'naf-entity-type-regexp
:class-doc
#.(format nil
"An `entity-regexp' sub-class for DBC NAF entities.~%~@
Instances subclassed from `base-naf-entity' should instantiate instances of~%~
both `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp' to enable~%~
system wide xrefing/indexing of entity name-form occurences.~%~@
:SEE-ALSO .~%▶▶▶"))

;; naf-entity-control-name-regexp
(make-documented-class 'naf-entity-control-name-regexp
:class-doc
#.(format nil 
"A `naf-entity-type-regexp' subclass for matching primary NAF control-names.~%~@
NAF control-names are considered canonical and are _rarely_ mutated.~%~@
The matchers named by instances of this class should run _before_ other regexps.~%~@
The MATCH-ENTITY-CONTAINER-TYPE slot of this class is defaulted to 'closure with~@
the intent that the MATCH-ENTITY-MATCHER will be implemented as a CL-PPCRE closure.~%~@
:SEE-ALSO `base-naf-entity', `naf-entity-alt-name-regexp'.~%▶▶▶"))

;; naf-entity-alt-name-regexp
(make-documented-class 'naf-entity-alt-name-regexp
:class-doc
 #.(format nil 
"A `naf-entity-type-regexp' subclass for NAFs with matchable alternative name forms.~%~@
 Alternative name forms might include:~%~% ~
  pseudonyms, also knowns, used-fors, variant spellings, rotated name forms, etc.~%~@
The matchers named by instances of this class should be run _only_after_all_~
control name matchers have had a chance to run and should _never_ destructively~
modify the things they match.~%~@
This constraint is intented to prevent corruption of control-names which should~
always have precedence of an alternative name form.~%~@
:SEE-ALSO `base-naf-entity', `naf-entity-control-name-regexp'.~%▶▶▶~%"))

;; naf-entity-artist-control-regexp
(make-documented-class 'naf-entity-artist-control-regexp
 :class-doc
 #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF artist entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;; naf-entity-artist-alt-regexp
(make-documented-class 'naf-entity-artist-alt-regexp
 :class-doc
 #.(format nil
"A `naf-entity-alt-name-regexp' subclass for DBC NAF artist entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;; naf-entity-person-control-regexp
(make-documented-class 'naf-entity-person-control-regexp
:class-doc
 #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF person entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;; naf-entity-person-alt-regexp
(make-documented-class 'naf-entity-person-alt-regexp
 :class-doc
 #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF person entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;;naf-entity-author-control-regexp
(make-documented-class 'naf-entity-author-control-regexp
 :class-doc
 #.(format nil
   "A `naf-entity-control-name-regexp' subclass for DBC NAF author entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;; naf-entity-author-alt-regexp
(make-documented-class 'naf-entity-author-alt-regexp
 :class-doc
 #.(format nil
           "A `naf-entity-alt-name-regexp' subclass for DBC NAF author entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;; naf-entity-brand-control-regexp
(make-documented-class 'naf-entity-brand-control-regexp
 :class-doc
 #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF brand entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;;naf-entity-brand-alt-regexp
(make-documented-class 'naf-entity-brand-alt-regexp
 :class-doc
 #.(format nil
"A `naf-entity-alt-name-regexp' subclass for DBC NAF brand entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;; naf-entity-publication-control-regexp
(make-documented-class 'naf-entity-publication-control-regexp
 :class-doc
 #.(format nil
           "A `naf-entity-control-name-regexp' subclass for DBC NAF publication entities.~%~@
:SEE-ALSO `naf-entity-publication'.~%▶▶▶~%"))

;; naf-entity-publication-alt-regexp
(make-documented-class 'naf-entity-publication-alt-regexp
 :class-doc
 #.(format nil
"A `naf-entity-alt-name-regexp' subclass for DBC NAF publication entities.~%~@
:NOTE When instantiating objects of this class be careful to discriminate
among like named or similiarly prefixed publication names.~%~@
:SEE-ALSO `naf-entity-publication'.~%▶▶▶~%"))

;; parsed-tgm-theme-record
(make-documented-class 'parsed-tgm-theme-record

:control-id-display-theme
 #.(format nil
"The printed representation of a TGM theme, eg it's display name.
:NOTE The display name is the same whether the theme's non-descriptor is T or not.~%")

:non-descriptor
 #.(format nil
"When non-nil \(a string value\) indicates that this theme is
not to be used for indexing purposes. Refer to the `USE-THEME' slot value for
the preferred theme to use instead.  :NOTE We assign the `non-descriptor'
slot-value to the `control-id-display-theme' as the string token for ALL
themes is used as the primary key for accessing structures which index themes,
ie hash-table/alist/plist key/val pairs.~%")

:use-theme
 #.(format nil
"Original TGM value \"USE\".
This slot is non-nil \(a string value\) when slot-value of `non-descriptor' is non-nil.
the `use-theme' slot-value dentifies a TGM theme to use in preference to this
one and leads from a non-preferred, unauthorized form of a theme to the theme as used.~%")

:used-for
 #.(format nil
"Original TGM value \"UF\". Postable (Main Term) to nonpostable (UF).
used-for - indicates a non-preferred theme, such as an alternative spelling,
inverted form, or synonym; helps define a theme's meaning. The `used-for'
slot-value identifies a reciprocal relationship with themes with a non-nil
`use-theme' slot-value, ie the object instance for theme with `non-descriptor'
slot-value: \"70s\" and use-theme `slot-value' \"Nineteen seventies\" has a
reciprical relationship with the object instance for theme with
`control-id-display-theme' slot-value: \"Nineteen seventies\" and a
`used-for' slot-value: \"70s\"~%")

:broader-theme
 #.(format nil
"Original TGM value \"BT\".
broader-theme - indicates the more general class to which a theme belongs;
everything that is true of a theme is also true of its broader-theme.~%")

:narrower-theme
 #.(format nil
"Original TGM value \"NT\".
narrower-theme - indicates a more specific term or member of a class.~%")

:related-theme
 #.(format nil
"Original TGM value \"RT\".~%
related-theme - brings to the catalog user's attention themes that are associated
because of overlapping meanings or part-whole relationships. TGM I tends to be
generous in supplying related-theme references. This is partly because
relationships that would be implicit in a hierarchical display of the themes are
less apparent when the themes appear in an alphabetical display. In accordance
with thesaurus construction guidelines, however, related-theme references are
never made to two themes at different levels in the same hierarchy.~%
:EXAMPLE       Game industry  NOT  Game industry
               RT  Games           RT  Games
                                   Board games   
                                  [a narrower term to Games]~%
An authorized theme which is closely related to the theme under which it is
listed, but the relationship is not a hierarchical one. The reciprocal is also
RT. Although no precise rules dictate when related term references should be
supplied, some typical situations include:~%~%
 Near synonyms
 Overlapping meanings
 Discipline and the object of study
 Persons and their occupations
 Products and industries
 Whole/part relationships~%
More detailed definitions and discussion of hierarchical and related term
relationships can be found in the ANSI standard.~%")

:facet-note
 #.(format nil
"Original TGM value \"FACET\". A Geographical faceting note.
facet-note indicators, which appear in brackets directly underneath authorized themes,
signal that a theme may be subdivided by geographic and/or nationality
designations.~%
:EXAMPLE  Military camps
          --[nationality]--[country or state]--[city]~%
These indicators have been included on a systematic basis with certain
categories of headings; with other types of headings, they are added as need
arises in P&P's cataloging. \(See Section III for further information about using
geographic, nationality, and other types of subdivisions.\)~%")

:scope-note
 #.(format nil
"Original TGM value \"SN\". Formerly \"Public Note\".
TGM I uses several kinds of notes to help catalogers apply themes consistently
and to help researchers find appropriate search themes.~%
The `scope-note' slote-value defines a theme, explains its scope, or helps a user
understand the structure of the thesaurus.~%
:EXAMPLE   Bison
           PN     For the American buffalo. Search under BUFFALOES 
                  for buffaloes of the eastern hemisphere.~%
:NOTE This field was formerly named Public Note, but was changed to \"Scope
note\" as of 2007\).~%")

:cataloger-note
 #.(format nil
"Original TGM value \"CN\".
cataloger-note - guides indexers in selecting a theme; for thesaurus
maintenance, records other notes in which the theme appears and clarifies how to
use a theme or when to use it in conjunction with another theme \(\"double
indexing\"\).~%
:EXAMPLE  Sick bays
          CN     Double index under type of vessel.~%
The note \"TGM II theme,\" which occurs frequently throughout TGM I, refers to
themes which also appear in Thesaurus for Graphic Materials II: Genre and
Physical Characteristic Themes. \(See Section II.E. for guidance on application of
these themes.\)~%
:EXAMPLE  Stereographs
          CN     TGM II theme.~%
Notes beginning with the phrase \"Used in a note under ...\" are of value
primarily in editing and maintaining the thesaurus.~%
:EXAMPLE  Doves
          CN     Used in a note under SYMBOLS.~%~%")

:history-note
 #.(format nil
"Original TGM value \"HN\".~%
The history note \(HN\) records the fact that a change has taken place in a theme
or the status of a theme since the publication of the first edition of TGM
I. This may prove useful to searchers since it suggests themes that may have been
in use formerly and that should be checked to retrieve older catalog
records. Generally, if one theme has been completely replaced by another theme,
the older theme appears as a \"UF.\"~%
A History note - accounts for earlier ways in which a theme appeared in the
list, in particular, themes that formerly appeared as non-preferred \(UF\) themes;
also, prompts the catalog user to search under earlier forms of headings, in
case headings in a catalog have not been updated to the current forms.~%
:EXAMPLE  Gem photographs: HN: Changed 5/89.  Formerly, Gem
          photographs may have been indexed as Miniature works.~%
:EXAMPLE  Draft 
          HN     Changed 11/1987 from COMPULSORY MILITARY SERVICE.~%~%")

:theme-type-category-reference
 #.(format nil
"Original TGM value \"TTCRef\".~%
:EXAMPLE
   Reference \(MARC 150\)~%
:NOTE Field added to TGM data in 2007.~%")

:theme-type-category-subdivision
 #.(format nil
"Original TGM value \"TTCSubd\". Subdivision (MARC 180+x/650+x).~%
:NOTE This filed ield added to TGM data in 2007.~%")

:theme-type-category-subject
 #.(format nil
"Original TGM value \"TTCSubj\". Subject (MARC 150/650).~%
:NOTE This field added to TGM data in 2007.~%")

:theme-type-category-genre
 #.(format nil
"Original TGM value \"TTCForm\". Genre/format \(MARC 155/655\).
The difference between genres and physical characteristics may be unclear, for
example, with themes like BROADSIDES, in which purpose is closely identified with
one physical manifestation. The form-genre field \(655\) is to be used for the
entire vocabulary.
:NOTE This field was added to TGM data in 2007.~%")

:former-usage-note
 #.(format nil
"Original TGM value \"FUN\". Clarifies TGM I & TGM II past history.~%
:EXAMPLE
   Formerly TGMI term \(nonpostable\).~%
:NOTE Field added to TGM data in 2007.~%")

:control-id-theme-entity-tgm-2-former-num
 #.(format nil
"Original TGM value \"FCNgmgpc\".~%
Former control number from TGM II in format gmgpc000001.~%
Applies only to terms established prior to 2007.~%
:NOTE This field added to TGM data in 2007.~%")

:control-id-theme-entity-tgm-1-former-num
 #.(format nil
"Original TGM value \"FCNlctgm\".~%
Former control number from TGM I in format: lctgm000001.~%
Applies only to terms established prior to 2007.~%
:NOTE This field added to TGM data in 2007.~%")

:control-id-theme-entity-loc-num
 #.(format nil
"Original TGM value \"TNR\".~%
Control number for merged TGM \(new numbers assigned in 2007 in format: tgm000001\).~%
:NOTE This field added to TGM data in 2007.~%")

:control-id-theme-entity-loc-uri
 #.(format nil
"A cannonical LOC TGM theme URI the form:~%
  <RESOURCE-PATH>/<CONTROL-ID-THEME-ENTITY-LOC-NUM>~%
  <RESOURCE-PATH> -> \"http://id.loc.gov/vocabulary/graphicMaterials/\";~%
  <CONTROL-ID-THEME-ENTITY-LOC-NUM> -> \"tgmNNNNNN\"~%
:NOTE Potentially useful to grab LOC skos/rdf-xml data.~%")

:image-coref
 #.(format nil
"List of parsed-theme-record `inventory-number' references \(strings\).~%
Field name from orignial dbc sql table was \"related_pic_num\".
When non-nil has the format:
 \(\"<ITEM-REF>\"* \)
Orignially, when non-nil, value of field `image-default-xref' would be present
as a member and `record-status-active' was T.
Orignially, when NIL, the value of `image-default-xref' was also NIL and value
of `record-status-active' was \"0000-00-00 00:00:00\".~%")

:image-default-xref
 #.(format nil
"Field name from orignial dbc sql table was \"display_pic\".~%
Nil if unassigned, else corresponds with inventory-number slot-value for
instance of class `parsed-inventory-record'. When non-nil value is also present
in list for slot `image-coref'.~%
Originally, when NIL, the value of `record-status-active' was also NIL and value
of `edit-timestamp'was be \"0000-00-00 00:00:00\".~%")

:record-status-active
 #.(format nil
"Field name from orignial dbc sql table was \"active\".~%
When T indicates the theme is active and mayb be made abvailable for end-user presentation.
When NIL indicates the theme is inactive and may not be made available for end-user presentations.
Originally, when NIL, value of `image-default-xref' and `image-coref' were also
be NIL, and value of `edit-timestamp' was be \"0000-00-00 00:00:00\".
Originally, when T value of `image-default-xref' and `image-coref' contained item reference(s).~%")

::edit-timestamp
 #.(format nil
"The date of the last date the theme was updated in the database.~%
Field name from orignial dbc sql table was \"date_edit\".~%
:EXAMPLE~%
  \"2008-09-20 22:33:51\"
  \"0000-00-00 00:00:00\"
  \"2008-09-20 22:30:25\" ; 7156~%
When present originally, this value indicates the last time the dbc database was
updated with relation data. When value was \"0000-00-00 00:00:00\", the
slot-values of `record-status-cative' `image-default-xref', `image-coref' were
NIL.~%")

:control-id-theme-entity-dbc-num 
 #.(format nil
"An integer value represented as a string identifying a TGM in the dbc database.~%
Field name from the orignal dbc SQL table was \"id\".~%
Originally, this was a unique integer \(represented now as a string\)
dereferncing a TGM theme in the dbd SQL database.~%
:NOTE We retain the existing value because it appeared in the originally
database and currently shares a coreference with values from the `thems_fr`
table, which is as yet unparsed and xrefd.! IOW, don't delete or modify it's
value unless/until that occurs!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!~%")

:class-doc
#.(format nil
          "Class for parsed LOC TGM XML `themes'file.~%~@
The Thesaurus of Graphic Materials \(TGM\) I is a thesaurus in alphabetical
format. TGM I conforms to the ANSI standard for structure and
syntax. \"Postable\" themes \(themes that are authorized for indexing\) and
\"non-postable\" themes \(cross references pointing from unauthorized to
authorized themes\) are interfiled. Under each authorized theme, the reference
structure includes unauthorized themes \(UF\), broader themes \(BT\), narrower
themes \(NT\), and related themes \(RT\). For each relationship that is
established in the thesaurus, its reciprocal relationship can be found at
another point in the thesaurus.~%
:EXAMPLE
          Building dedications           (authorized theme)

           UF  Dedication of buildings   (theme not authorized)
           BT  Dedications               (broader authorized theme)
           NT  Church dedications        (narrower authorized themes)
               Cornerstone laying
           RT  Buildings                 (related authorized themes)
               Groundbreaking ceremonies
               Toppings out~%
         Dedication of buildings~%
          USE  Building dedications     (cross reference from unauthorized
                                         theme to authorized theme)~%
TGHM structure is intended to help both catalogers and researchers select the
theme\(s\) most appropriate for indexing and retrieval. Themes appear in
alphabetical order and are listed in word-by-word filing sequence. Scope notes
\(here called \"public notes\"\) define the themes in the context of the
thesaurus. Associations between themes are indicated by the convention of
broader, narrower, related, and \"used for\" relationships. Themes listed under
a heading also appear in the alphabetical filing sequence with the reciprocal
relationship noted. For example, the theme EPHEMERA has LABELS listed as a
narrower theme, and the theme LABELS has EPHEMERA listed as its broader theme.~%~@
:NOTE Compound themes are established \(1\) when a single concept is expressed
by multiple words in natural language, \(2\) when it would be difficult or
unnecessary for an indexer to differentiate between two closely related
concepts, and \(3\) when splitting them into single themes to be placed in
separate fields would lead to retrieval of irrelevant material.~%~@
:EXAMPLE
          Artificial flowers
          Cattle ranches
          Educational organizations
          Real estate development
          Tobacco industry~%~@
Compound themes are always expressed in natural language order, never inverted:~%~@
:EXAMPLE~%  Protestant churches  NOT   Churches, Protestant~%~@
Compound themes which include the word \"and\" are used when two themes occur
together with such frequency that it would be undesirable to establish them
separately. Such themes are constructed with an ampersand \(&\) in order to
differentiate in retrieval systems between the use of \"and\" as a Boolean
operator and the use of \"&\" as part of an indexing theme:~%~@
:EXAMPLE
         Doors & doorways
         Good & evil~%~@
:NOTE Parenthetical qualifiers are used to differentiate between homographs.~%~@
:EXAMPLE  Camouflage \(Biology\)
          Camouflage \(Military science\)~%~@
:SEE \(URL \"https://www.loc.gov/rr/print/tgm1/tgm1.xml\"\)
     \(URL \"https://www.loc.gov/rr/print/tgm2/tgm2.xml\"\)
     \(URL \"https://www.loc.gov/rr/print/tgm1/downloadtgm1.html\"\)
     \(URL \"https://www.loc.gov/pictures/collection/tgm/fields.html\"\)
     \(URL \"https://www.loc.gov/rr/print/tgm1/ic.html\"\)~%~@
:NOTE Not to be confused with class `parsed-theme-record' which references
themes recorded to the orginal dbc SQL table!~%~@
:SEE-ALSO `*parsed-tgm-theme-output-dir*', `*parsed-tgm-theme-input-dir*',
`*parsed-tgm-theme-xml-source-pathname*', `*parsed-tgm-theme-xml-source*',
`*parsed-tgm-theme-field-to-accessor-table*',
`*parsed-tgm-theme-record-hash-table*',
`tgm-parse-concepts-set-source-xml-file', `tgm-parse-concepts-make-source',
`tgm-assoc-elt', `tgm-peeking', `tgm-peeking-get-val', `tgm-consume',
`tgm-characters-every-whitespace-p', `tgm-start-element-consume',
`%tgm-sec-helper', `tgm-peek-start-element-and-maybe-add-to-slot',
`tgm-parse-concept', `tgm-parse-concepts-in-stream',
`write-parsed-parsed-tgm-theme-record-parse-table-to-file',
`tgm-parse-concepts-update-unbound-slots',
`tgm-parse-concept-count-slot-value-list-length', `control-id-display-theme',
`non-descriptor', `use-theme', `facet-note', `scope-note', `used-for',
`broader-theme', `narrower-theme', `related-theme', `cataloger-note',
`history-note', `former-usage-note', `theme-type-category-reference',
`theme-type-category-subdivision', `theme-type-category-subject',
`theme-type-category-genre', `image-coref', `image-default-xref',
`record-status-active', `edit-timestamp',
`control-id-theme-entity-tgm-2-former-num',
`control-id-theme-entity-tgm-1-former-num', `control-id-theme-entity-loc-num',
`control-id-theme-entity-loc-uri', `control-id-theme-entity-dbc-num'.~%▶▶▶~%"))

) ;; close eval-when

;;; ==============================
;;; EOF
