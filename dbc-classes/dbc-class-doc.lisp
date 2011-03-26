;;; :FILE-CREATED <Timestamp: #{2011-03-25T17:55:20-04:00Z}#{11125} - by MON>
;;; :FILE dbc-classes/dbc-class-doc.lisp
;;; ==============================


(in-package #:dbc)
;; *package*

(eval-when (:compile-toplevel :load-toplevel :execute)
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
#.(format nil "The class of entity regexp subclasses match.~%~@
For example, regexp instances of a subclass which match artist NAFs by their
control name would share the same MATCH-ENTITY-CLASS.~%~@
Likewise, regexp instances of a subclass which match artist NAFs by their
alternative name forms would share the same MATCH-ENTITY-CLASS, but would
maintain a separate MATCH-ENTITY-DB.~%~@
This slot is global per subclass.~%
Subclasses should instantiate this slot with :allocation class.~%~@
Its class allocated value should be indirected through
access to the SUBCLASS-MATCH-ENTITY-CLASS slot of an instance
of ENTITY-REGEXP-SUBCLASS-ALLOCATION class.~%~
Subclasses should access slot-value with a method specialized on~%~
`regexp-match-entity-class' and should not establish direct or indirect setf~%~
methods on this slot.~%")

:match-entity-db
#.(format nil 
"The symbol holding a lookup table of match-container-uuid/entity-instance-uuid pairs.~%~@
 This likely names a special variable and prob. of type `cl:hash-table'.~%~@
 For each regexp subclass there is a corresponding MATCH-ENTITY-DB regardless of~@
 whether that subclass might share a MATCH-ENTITY-CLASS with other subclasses.~%~%~@
 For example, two sibling subclsses R-1 and R-2 might both match artist NAF~@
 entities and share the same MATCH-ENTITY-CLASS:~%~@
 - R-1 has a MATCH-CONTAINER which is an CL-PPCRE closure matching artist NAFs~%~
   by their control name;~%~@
 - R-2 has a MATCH-CONTAINER which is a list of strings to map as regexps with~%~
   each string matching an artist enity by a known alternative name forms.~%~@
 R-1 and R-2 will maintain a separate MATCH-ENTITY-DB because:~%~@
 - It makes dispatching on the keyed UUID value type of a matcher easier.~%~
   For example, R-1 matchers are likely more efficient per their~%~
   match-container-type than those of R-2.~%~@
 - It ensures any potential destrucive actions made in lieu of a match may~%~
   occur in the correct order.~%~@
   For example, R-1 matchers are likely more specific than those of R-2 and~@
   likely it is important that all R-1 matchers sharing the same~@
   MATCH-ENTITY-CLASS be invoked before any of the R-2 matchers in order to~@
   preserve the integrity of the primary control-names.~%~@
   This slot is global-per-subclass.~%~@
   Subclasses should instantiate this slot with :allocation class.~%~@
   Its class allocated value should be indirected through ~
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
This slot is local per subclass instance.~%~
Subclasses should access slot-value with a method specialized on~%~
`regexp-match-container-uuid'.~%~
This slot is setfable. Specializers should take special care to ensure that~%~
they don't overwrite an existing UUID.  An OBJ's UUID should be treated as an~%~
immutable constant in almost all circumstances.  Therefor, the intent of this~%~
function is to mediate generation of UUID's run :after initialize-instance~%~
and/or when an instance is obsoleted with `cl:make-instances-obsolete'.~%")

:match-entity-matcher
#.(format nil 
"A matcher object for matching an entity.~%~@
Its type should should be as specified by MATCH-CONTAINER-TYPE.~%~@
Its values is accessed by association with the MATCH-CONTAINER-UUID in the~@
applicable MATCH-MATCHER-DB.~%~@
It should match an entity with a UUID value in the applicable MATCH-ENTITY-DB
for the instances MATCH-ENTITY-CLASS.~%~@
This slot is local per subclass instance.~%~
Subclasses should access slot-value with a method specialized on.~%~
`regexp-matcher'. This slot is setfable.~%")

:class-doc
#.(format nil
"Class implementing the core slots for implementatin of subtyped entity matchers.~%~@
Don't instantiate directly from this class.~%~@
:SEE-ALSO ~%►►►~%")))

;;; ==============================


;;; ==============================



;;; ==============================
;;; EOF
