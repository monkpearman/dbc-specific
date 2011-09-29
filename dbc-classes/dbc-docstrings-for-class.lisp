;;; :FILE-CREATED <Timestamp: #{2011-03-25T17:55:20-04:00Z}#{11125} - by MON>
;;; :FILE dbc-classes/dbc-class-docstrings.lisp
;;; ==============================


(in-package #:dbc)
;; *package*

;; (setf mon:*default-class-documentation-table* (make-hash-table))

(eval-when (:compile-toplevel); :load-toplevel :execute)


;;; ==============================
;;; :FILE dbc-classes/dbc-class-paths.lisp

;;; ==============================
;;; system-base
(make-documented-class 'system-base
:class-doc
#.(format nil 
"Toplevel class for dbc system and system path related objects.~%▶▶▶~%"))

;;; ==============================
;;; system-path
(make-documented-class 'system-path 
:system-path 
#.(format nil 
"Slot holding the base or topmost paths for dbc system.~%~@
This slot is class allocated and all sub-systems in the dbc-system automatically
inherit its value.~%~@
This slot value is set automatically at loadtime and should not be rebound.~%~@
User code should not attempt setf the value of this slot!~%")
:class-doc
#.(format nil "Base class for storing dbc system paths.~%▶▶▶~%"))

;;; ==============================
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

;;; ==============================
;; base-regexp
(make-documented-class 'base-regexp
:class-doc
#.(format nil
"Base class for matching control names of DBC entity instances.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;;; ==============================
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

;;; ==============================

(make-documented-class 'entity-regexp
:match-entity-class
#.(format nil
"The class of entity regexp subclasses match.~%~@
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
However, where the latter maps to the UUID of a class instance, the values of in a~@
MATCH-MATCHER-DB pointo to a matcher which is held in a datastructure specified by~@
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
Its values is accessed by association with the MATCH-CONTAINER-UUID in the~@
applicable MATCH-MATCHER-DB.~%~@
It should match an entity with a UUID value in the applicable MATCH-ENTITY-DB
for the instances MATCH-ENTITY-CLASS.~%~@
This slot is local per subclass instance.~%~@
Subclasses should access slot-value with a method specialized on.~%~
`regexp-matcher'. This slot is setfable.~%")

:class-doc
#.(format nil
"Class implementing the core slots for implementatin of subtyped entity matchers.~%~@
Don't instantiate directly from this class.~%~@
:SEE-ALSO ~%▶▶▶~%"))

;;; ==============================
;; parsed-field-name-regexp
(make-documented-class 'parsed-field-name-regexp
:class-doc
 #.(format nil
"An `entity-regexp' subclass for matching XML-refs parsed field-names.~%~
:SEE-ALSO .~%▶▶▶~%"))

;;; ==============================
;; theme-entity-regexp
(make-documented-class 'theme-entity-regexp
:class-doc
 #.(format nil
"An `entity-regexp' sub-class for themes.~%~@
:SEE-ALSO `base-theme-entity'.~%▶▶▶"))

;;; ==============================
;; category-entity-regexp
(make-documented-class 'category-entity-regexp
:class-doc
 #.(format nil
"An `entity-regexp' sub-class for DBC categories.~%~
:SEE-ALSO `base-category-entity'.~%▶▶▶"))

;;; ==============================
;; naf-entity-type-regexp
(make-documented-class 'naf-entity-type-regexp
:class-doc
#.(format nil
"An `entity-regexp' sub-class for DBC NAF entities.~%~@
Instances subclassed from `base-naf-entity' with should instantiate instances of~%~
both `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp' to enable~%~
system wide xrefing/indexing of entity name-form occurences.~%~@
:SEE-ALSO .~%▶▶▶"))

;;; ==============================
;; naf-entity-control-name-regexp
(make-documented-class 'naf-entity-control-name-regexp
:class-doc
#.(format nil 
"A `naf-entity-type-regexp' subclass for matching primary NAF control-names.~%~@
Naf control-names are considered canonical and are _rarely_ mutated.~%~@
The matchers named by instances of this class should run _before_ other regexps.~%~@
The MATCH-ENTITY-CONTAINER-TYPE slot of this class is defaulted to 'closure with~@
the intent that the MATCH-ENTITY-MATCHER will be implemented as a CL-PPCRE closure.~%~@
:SEE-ALSO `base-naf-entity', `naf-entity-alt-name-regexp'.~%▶▶▶"))

;;; ==============================
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

;;; ==============================
;; naf-entity-artist-control-regexp
(make-documented-class 'naf-entity-artist-control-regexp
 :class-doc
 #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF artist entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;;; ==============================
;; naf-entity-artist-alt-regexp
(make-documented-class 'naf-entity-artist-alt-regexp
 :class-doc
 #.(format nil
"A `naf-entity-alt-name-regexp' subclass for DBC NAF artist entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;;; ==============================
;; naf-entity-person-control-regexp
(make-documented-class 'naf-entity-person-control-regexp
:class-doc
 #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF person entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;;; ==============================
;; naf-entity-person-alt-regexp
(make-documented-class 'naf-entity-person-alt-regexp
 :class-doc
 #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF person entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;;; ==============================
;;naf-entity-author-control-regexp
(make-documented-class 'naf-entity-author-control-regexp
 :class-doc
 #.(format nil
   "A `naf-entity-control-name-regexp' subclass for DBC NAF author entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;;; ==============================
;; naf-entity-author-alt-regexp
(make-documented-class 'naf-entity-author-alt-regexp
 :class-doc
 #.(format nil
           "A `naf-entity-alt-name-regexp' subclass for DBC NAF author entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))


;;; ==============================
;; naf-entity-brand-control-regexp
(make-documented-class 'naf-entity-brand-control-regexp
 :class-doc
 #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF brand entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;;; ==============================
;;naf-entity-brand-alt-regexp
(make-documented-class 'naf-entity-brand-alt-regexp
 :class-doc
 #.(format nil
"A `naf-entity-alt-name-regexp' subclass for DBC NAF brand entities.~%~@
:SEE-ALSO .~%▶▶▶~%"))

;;; ==============================
;; naf-entity-publication-control-regexp
(make-documented-class 'naf-entity-publication-control-regexp
 :class-doc
 #.(format nil
           "A `naf-entity-control-name-regexp' subclass for DBC NAF publication entities.~%~@
:SEE-ALSO `naf-entity-publication'.~%▶▶▶~%"))

;;; ==============================
;; naf-entity-publication-alt-regexp
(make-documented-class 'naf-entity-publication-alt-regexp
 :class-doc
 #.(format nil
"A `naf-entity-alt-name-regexp' subclass for DBC NAF publication entities.~%~@
:NOTE When intantiating objects this class should be careful to discriminate
among like named or similiarly prefixed publication names.~%~@
:SEE-ALSO `naf-entity-publication'.~%▶▶▶~%"))

) ;; :CLOSE EVAL-WHEN




;;; ==============================
;;; EOF
