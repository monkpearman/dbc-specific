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

)



;;; ==============================
;; :file dbc-classes/dbc-class-entity.lisp
;;; ==============================

(eval-when (:compile-toplevel); :load-toplevel :execute)

(make-documented-class 'base-location-entity
:class-doc
   #.(format nil
             "Base class for referencing DBC system location entities.~%~@
              Location entities correspond with physical places.~%~@
A physical place may be \"real\", \"imagined\", \"unverified\".~%~@
Distinctions around whether a place is real, imagined, or unverified are broadly
understood as follows:~% ~%
 - A real place is one that is i.e. it is known to have existed in a given
   temporaral context.~% ~
 - An imagined place is one that is believed to never have existed in the known
   temporaral contexts of the DBC system.~% ~
 - An unverified place is one that is believed to have existed in some
   temporaral context (known or as yet undefined) but which can not be verified
   or corroborated as such.~%~@
:EXAMPLE~%~% ~
 \(mon:class-subclasses \(find-class 'base-location-entity\)\)~%
:SEE-ALSO `base-entity', `base-theme-entity', `base-category-entity'
`base-taxon-entity' `base-naf-entity' `base-media-entity'
`base-location-entity', `naf-entity-type-regexp',
`naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

(make-documented-class 'base-media-entity
:class-doc
#.(format nil
"Base class for referencing DBC system media entities.~%~@
Media entities include:~%~% ~
  - techniques~%   ~
    -- engraving, lithograph, photograph, offset, etc.~%~% ~
  - materials~%   ~
    -- paper, fabric, cardstock, etc.~%~% ~
  - mounts~%   ~
     -- linen backed, dry mounted, etc.~%~% ~
  - color~%   ~
    -- black and white, red, white, blue, etc.~%~%~@
:EXAMPLE~% ~
  \(mon:class-subclasses \(find-class 'base-media-entity\)\)~%
:SEE-ALSO `base-entity', `base-theme-entity', `base-category-entity'
`base-taxon-entity' `base-naf-entity', `base-media-entity',
`base-location-entity', `media-entity-technique',`media-entity-material',
`media-entity-mount', `media-entity-color', `base-description-media-entity-note',
`naf-entity-type-regexp', `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

(make-documented-class 'base-naf-entity
:class-doc
   #.(format nil
"Base class for referencing DBC system NAF entities.~%~@
:EXAMPLE~% ~
 \(mon:class-subclasses \(find-class 'base-naf-entity\)\)~%
:SEE-ALSO `base-entity', `base-theme-entity', `base-category-entity',
`base-taxon-entity', `base-naf-entity', `base-media-entity',
`base-location-entity'. `control-id-naf-entity-type', `control-id-naf-entity',
`control-id-naf-entity-display-name', `naf-entity-type-regexp',
`naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

(make-documented-class 'base-taxon-entity
:class-doc
 #.(format nil "Base class for referencing DBC taxonomic entitites.~%~% ~
 ,----~%~
 | taxon, \(pl. taxa\), n.~%~
 | taxonomic unit, whether named or not: i.e. a population, or group of populations~%~
 | of organisms which are usually inferred to be phylogenetically related and which~%~
 | have characters in common which differentiate \(q.v.\) the unit \(e.g. a geographic~%~
 | population, a genus, a family, an order\) from other such units. A taxon~%~
 | encompasses all included taxa of lower rank \(q.v.\) and individual organisms.~%~
 `---- The Glossary of the International Code of Zoological Nomenclature \(1999\).~%~@
Precedence list of taxonmic rank:~%~% ~
 life~% ~
 - domain~% ~
 -- kingdom~% ~
 --- phylum~% ~
 ---- class~% ~
 ----- order~% ~
 ------ family~% ~
 ------- genus~% ~
 -------- species~%~@
And more specifically we are concerned with the mapping from:~%~% ~
  historic-appellation -> modern-appellation~%~@
:NOTE the decision to use the sybmolic prefix ``taxon'' is because I can
 _NEVER_ remember how to spell Linnaeus/Linnaean...~%
:SEE-ALSO `base-entity', `base-theme-entity', `base-category-entity', `base-taxon-entity',
`base-naf-entity', `base-media-entity', `base-location-entity'.~%▶▶▶~%"))

(make-documented-class 'base-category-entity
:class-doc
 #.(format nil "Base class for referencing DBC system category entities.~%~@
:EXAMPLE~%
 \(mon:class-subclasses \(find-class 'base-category-entity\)\)~%
:SEE-ALSO `base-entity', `base-theme-entity', `base-category-entity', `base-taxon-entity',
`base-naf-entity', `base-media-entity', `base-location-entity', `category-entity-regexp'.~%▶▶▶~%"))

(make-documented-class 'base-theme-entity
:class-doc
 #.(format nil "Base class for referencing DBC system theme entities.~%
EXAMPLE~%
\(mon:class-subclasses \(find-class 'base-theme-entity\)\)~%
:SEE-ALSO `base-entity', `base-theme-entity', `base-category-entity', `base-taxon-entity',
`base-naf-entity', `base-media-entity', `base-location-entity', `theme-entity-regexp'.~%▶▶▶~%"))

(make-documented-class 'base-entity
:class-doc
 #.(format nil "Base class for referencing DBC system entities.~%
An entity is a \"non-abstract\" object capable of being represented by the DBC system.~%
An object is not abstract if it represents an object knowable outside the
context of the DBC system.~%~@
For an object to be characterized as of this type it should be a known~%
referenceable in common nomenclature or the nomenclature of its primary
external domain.~%
The inverse corollary to the class `base-entity' is the class `base-record'.~%
Clarke's Third Law:~%
\"Any sufficiently advanced technology is indistinguishable from magic.\"~%
An \"entity\" is something we want to treat as uniquely identifiable.
An entity is distinct from a \"record\".~%
Both an entity and a record are uniquely identifiable, the difference being
that where a record might uniquely identify some _thing_, the thing so
identified will not have an identity commonly recognized outside the context
of the thing it identifies.~%
For example, instances which subcclass `base-inventory-record' will identify
an inventory item, wheras instances of `base-theme-entity' will identify a
theme. A theme is knowable outside the context of the dbc system an inventory
item not so much so.~%
:EXAMPLE~%
 \(mon:class-subclasses \(find-class 'base-entity\)\)~%~@
:SEE-ALSO `base-entity', `base-theme-entity', `base-category-entity', `base-taxon-entity',
`base-naf-entity', `base-media-entity', `base-location-entity'.~%▶▶▶~%"))

) ; close eval-when


;;; ==============================
;; :file dbc-classes/dbc-class-control-id
;;; ==============================

(eval-when (:compile-toplevel)  ; :load-toplevel :execute)

(make-documented-class 'control-id-type
:class-doc
#.(format nil 
"The type of class represented by subclasses of `base-control-id'.~%~%"))

(make-documented-class 'base-control-id
:class-doc
#.(format nil
             "The class `base-control-id' is an abstract-class.~%~@
Its subclasses distinguish different types of controlled identities in classes~%~
with slots specifying persitable values used for identification puroposes.~%~@
The slot CONTROL-ID-UUID is a UUID generated as if by:~%
 \(make-v5-uuid \(slot-value <OBJ> 'control-id-namespace\)
               \(slot-value <OBJ> 'control-id-identifies\)\)~%
The slot CONTROL-ID-NAMESPACE is a UUID namespace appropriate to the gerneration
of a control-id-uuid slot-value applicable to a particlar object and it is used
as the NAMESPACE arg used when generating the v5 UUIDs.~%~@
The SLOT CONTROL-ID-IDENTIFIES is a string or symbol.~%~
It is used as the NAME arg used when generating the the v5 UUID the slot-value~%~
for control-id-uuid.~%~@
:EXAMPLE~% ~
 \(mon:class-subclasses \(%find-control-id-class-or-lose 'base-control-id\)\)~%~@
:NOTE subclasses of `base-control-id' are distinct from those of the class
`base-uuid' which defines _canonical_ identities for dbc system objects
\(as distinct from the values they are contained of\).~%~@
:SEE-ALSO .~%▶▶▶"))
  
(make-documented-class 'control-id-indexed-number
:class-doc
#.(format nil
          "The class `control-id-indexed-number' is an abstract-class.~%
Its subclasses distinguish different types of controlled identities which use
\(or did use\) a positive fixnum as an indexed identifier.~%
:NOTE Use of this class is deprecated. It is intended that subclassing instances
will instantiate this class where retention of an original indexed number is
important but where we expect and eventual migration to a more sophisticated approach.~%~@
:SEE-ALSO `control-id-record-indexed-number', `control-id-indexed-number',
`control-id-record-indexed-number', `control-id-media-entity-indexed-number',
`control-id-category-entity-indexed-number', `control-id-theme-entity-indexed-number',
`control-id-taxon-entity-indexed-number', `control-id-location-entity-indexed-number',
`control-id-naf-entity-indexed-number'.~%▶▶▶~%"))

(make-documented-class 'control-id-record-indexed-number
:class-doc
#.(format nil
":ABSTRACT-CLASS for control-id-<FOO>-record-type classes which are primarily indexed by number.~%
Usage of this class is roughly correllative with usage of
`control-id-display-name' for `control-id-entity-<FOO>-type's.~%
:SEE-ALSO `control-id-record-indexed-number', `control-id-indexed-number',
`control-id-record-indexed-number', `control-id-media-entity-indexed-number',
`control-id-category-entity-indexed-number', `control-id-theme-entity-indexed-number',
`control-id-taxon-entity-indexed-number', `control-id-location-entity-indexed-number',
`control-id-naf-entity-indexed-number'.~%▶▶▶~%"))

(make-documented-class 'control-id-record-type
 :control-id-of-class-type
 #.(format nil 
"A class object identified by the subclasses of class `base-control-id'.~%~@
:NOTE This slot is informally class-allocated e.g. it should be treated as if~%~
the following were specified:~%~% ~
 \(control-id-of-class-type :allocation :class\) ~%~%~
Its slot-value should not be instantiated via an initarg, nor should it be~%~
specialized by a setf accessor form.~%
:SEE-ALSO `control-id-record-type', `control-id-inventory-record-type',
`control-id-documentation-record-type', `control-id-authority-record-type',
`control-id-inventory-publication-record-type'.~%")
 :class-doc
  #.(format nil ":ABSTRACT-CLASS~%~@
A mixin for subclasses of which identify classes containing \"record\" like data, e.g.:
 `base-inventory-record', `base-authority-record', etc.
:NOTE The inverse corollary to the class `base-record' is the class `base-entity'.~%~%
:SEE-ALSO `control-id-inventory-record-type',`control-id-documentation-record-type',
`control-id-authority-record-type', `control-id-inventory-publication-record-type'.%▶▶▶~%"))

(make-documented-class 'control-id-inventory-record-type
:class-doc
#.(format nil "control-id for class instances which subclass `base-inventory-record'.~%
:SEE-ALSO `control-id-inventory-record-type',`control-id-documentation-record-type',
`control-id-authority-record-type',`control-id-inventory-publication-record-type',
`parsed-inventory-record', `base-inventory-publication-record',
`base-inventory-sales-record', `base-inventory-sales-order-record',
`base-inventory-sales-sold-record', `base-inventory-sales-sold-in-store-record'.~%%▶▶▶~%"))

(make-documented-class 'control-id-documentation-record-type
:class-doc
#.(format nil "control-id for class instances which subclass `base-documentation-record'.~%
:SEE-ALSO `parsed-documentation-record', `control-id-inventory-record-type',
`control-id-documentation-record-type', `control-id-authority-record-type',
`control-id-inventory-publication-record-type'.~%%▶▶▶~%"))

(make-documented-class 'control-id-authority-record-type
:class-doc 
   #.(format nil "control-id for class instances which subclass `base-authority-record'.~%
:SEE-ALSO `control-id-inventory-record-type',`control-id-documentation-record-type',
`control-id-authority-record-type',`control-id-inventory-publication-record-type'.~%%▶▶▶~%"))

(make-documented-class 'control-id-inventory-publication-record-type
:class-doc
#.(format nil
"control-id for class instances which subclass `dbc-class-inventory-publication-record'.~%
:NOTE control ids of this type are Intended for individual loose periodical issues
and/or publications. e.g. a loose issue of the periodical Femina is distinct
from the linen-backed cover pulled from that issue and is distinct from
instances of `control-id-inventory-record-type' because its individual leafs
will become inventory-record insances once disassembled/disbound.~%
:SEE-ALSO `control-id-inventory-record-type',`control-id-documentation-record-type',
`control-id-authority-record-type',`control-id-inventory-publication-record-type'.~%%▶▶▶~%"))

(make-documented-class 'control-id-entity-type
:control-id-of-class-type
    #.(format nil
              "A class object identified by the subclasses of class `base-control-id'.~%~@
:NOTE This slot is informally class-allocated e.g. it should be treated as if~%~
the following were specified:~%~% ~
 \(control-id-of-class-type  :allocation :class\) ~%~%~
Its slot-value should not be instantiated via an initarg, nor should it be~%~
specialized by a setf accessor form.~%")
 :class-doc
 #.(format nil ":ABSTRACT-CLASS~%~@
A mixin for subclasses of classes with symbol-names of the form:~%~% ~
control-id-<FOO>-entity-type~%
:NOTE The inverse corollary to the class `base-entity' is the class `base-record'.~%
:SEE-ALSO `control-id-naf-entity-type', `control-id-taxon-entity-type',
`control-id-media-entity-type', `control-id-theme-entity-type',
`control-id-category-entity-type',`control-id-location-entity-type'.~%%▶▶▶~%"))

(make-documented-class 'control-id-naf-entity-type
:class-doc
#.(format nil "control-id for class instances which subclass `base-naf-entity'.~%'
control-id's of this type provide an interface for uniquely referencing naf-entities.~%
:SEE-ALSO `control-id-entity-type', `control-id-naf-entity-type',
`control-id-location-entity-type', `control-id-category-entity-type',
`control-id-theme-entity-type', `control-id-taxon-entity-type'.~%%▶▶▶~%"))

(make-documented-class 'control-id-location-entity-type
:class-doc
   #.(format nil "control-id for class instances which subclass `base-location-entity'.~%
control-id's of this type provide an interface for uniquely referencing location entities.~%
:SEE-ALSO `control-id-entity-type', `control-id-naf-entity-type',
`control-id-location-entity-type', `control-id-category-entity-type',
`control-id-theme-entity-type', `control-id-taxon-entity-type'.~%▶▶▶~%"))

(make-documented-class 'control-id-category-entity-type
:class-doc
   #.(format nil "control-id for class instances which subclass `base-category-entity'.~%
control-id's of this type provide an interface for uniquely referencing category
instances which subclass `category-entity-top-level'.~%
:SEE-ALSO `control-id-entity-type', `control-id-naf-entity-type',
`control-id-location-entity-type', `control-id-category-entity-type',
`control-id-theme-entity-type', `control-id-taxon-entity-type'.~%▶▶▶~%"))

(make-documented-class 'control-id-theme-entity-type
:class-doc
  #.(format nil "control-id for class instances which subclass `base-theme-entity'.~%
control-id's of this type provide an interface for uniquely referencing 
:SEE-ALSO `control-id-entity-type', `control-id-naf-entity-type',
`control-id-location-entity-type', `control-id-category-entity-type',
`control-id-theme-entity-type', `control-id-taxon-entity-type'.~%~%▶▶▶~%"))

(make-documented-class 'control-id-media-entity-type
:class-doc
#.(format nil "control-id for class instances which subclass `base-media-entity'.~%
control-id's of this type provide an interface for uniquely referencing entities which comprise a type of media.~%
:SEE-ALSO `media-entity-technique', `media-entity-material',
`media-entity-paper', `media-entity-mount', `media-entity-color',
`control-id-entity-type', `control-id-naf-entity-type',
`control-id-location-entity-type', `control-id-category-entity-type',
`control-id-theme-entity-type', `control-id-taxon-entity-type'.~%▶▶▶~%"))

(make-documented-class 'control-id-taxon-entity-type
:class-doc
  #.(format nil "control-id for class instances which subclass `base-taxon-entity'.~%
control-id's of this type provide an interface for uniquely referencing  Linnean names.~%
:SEE-ALSO `taxon-entity-coref', `control-id-taxon-entity-display-name',
`*control-id-taxon-namespace*', `control-id-taxon-entity',
`control-id-taxon-entity-display-name', `control-id-display-taxon'
`control-id-entity-type', `control-id-naf-entity-type',
`control-id-location-entity-type', `control-id-category-entity-type',
`control-id-theme-entity-type'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-name
:class-doc
   #.(format nil
             "The class `control-id-display-name' records information for classes with slots
which record displayable control-ids which identify a nameable thing.~%~@
:NOTE A nameable thing is not necessarily an entity.~%~@
:EXAMPLE~%
 \(mon:class-subclasses \(%find-control-id-class-or-lose 'control-id-display-name\)\)~%~@
:SEE-ALSO `control-id-display-name', `control-id-naf-entity-display-name',
`control-id-location-entity-display-name', `control-id-taxon-entity-display-name',
`control-id-display-name-for-entity-type', `control-id-media-entity-display-name',
`control-id-theme-entity-display-name', `control-id-category-entity-display-name'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-name-for-entity-type
:class-doc
#.(format nil
             "Instances of this class hold information about an entities displayable name.~%~@
The slot CONTROL-ID-INSTANCE-CLASS is a symbol indicating the class of the
entity identified by the slot-value CONTROL-ID-IDENTIFIES.~%~@
rThis slot should be instantiated to a class-object suitable for use as an
argument to `cl:%find-control-id-class-or-lose' and which returns a class or subclass which is a
member in the set of class-names returned by the following forms \(or their expansions\):~%~% ~
 \(mon:class-subclasses \(%find-control-id-class-or-lose 'base-entity\)\)~%~% ~
 \(member \(class-name \(%find-control-id-class-or-lose 'base-naf-entity\)\))~%~% ~
 \(mon:class-subclasses \(%find-control-id-class-or-lose 'base-entity\)\)\)~%~% ~
:NOTE There may be multiple different entities with a `control-id-identifies'
slot-value which are `cl:string='.~%~@
Likewise, such co-references may occur in both the same class and/or an entirely different class.)~%
:EXAMPLE~%~% ~
 \(mon:class-subclasses \(%find-control-id-class-or-lose 'control-id-display-name-for-entity-type\)\)~%~@
:SEE-ALSO `base-control-id', `control-id-type', `control-id-record-type',
`control-id-entity-type', `control-id-display-name-for-entity-type',
`control-id-display-name', `control-id-indexed-number', `control-id-record-indexed-number'
`control-id-display-name', `control-id-naf-entity-display-name',
`control-id-location-entity-display-name', `control-id-taxon-entity-display-name',
`control-id-display-name-for-entity-type', `control-id-media-entity-display-name',
`control-id-theme-entity-display-name', `control-id-category-entity-display-name'.~%▶▶▶~%"))

(make-documented-class 'control-id-inventory-record
:class-doc
#.(format nil
"control-id for inventory reocrdss.~%
:SEE-ALSO `control-id-indexed-inventory-record', `control-id-indexed-inventory-publication-record',
`control-id-indexed-documentation-record', `control-id-indexed-authority-record'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-inventory-record
:class-doc
#.(format nil "See slot inventory-number of class `parsed-inventory-record'.~%
:SEE-ALSO `control-id-indexed-inventory-record', `control-id-indexed-inventory-publication-record',
`control-id-indexed-documentation-record', `control-id-indexed-authority-record'.~%▶▶▶~%"))

;; Publication Recrods
(make-documented-class 'control-id-inventory-publication-record
 :class-doc
 #.(format nil "
:SEE-ALSO `control-id-inventory-record', `control-id-inventory-publication-record',
`control-id-documentation-record', `control-id-authority-record'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-inventory-publication-record
:class-doc
 #.(format nil "See slot inventory-number of class `parsed-inventory-record'.~%
:SEE-ALSO `control-id-indexed-inventory-record', `control-id-indexed-inventory-publication-record',
`control-id-indexed-documentation-record', `control-id-indexed-authority-record'.~%▶▶▶~%"))

;; documentation records
(make-documented-class 'control-id-documentation-record
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-inventory-record', `control-id-indexed-inventory-publication-record',
`control-id-indexed-documentation-record', `control-id-indexed-authority-record'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-documentation-record
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-inventory-record', `control-id-indexed-inventory-publication-record',
`control-id-indexed-documentation-record', `control-id-indexed-authority-record'.~%▶▶▶~%"))

;; Authority Records
(make-documented-class 'control-id-authority-record
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-inventory-record', `control-id-indexed-inventory-publication-record',
`control-id-indexed-documentation-record', `control-id-indexed-authority-record'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-authority-record
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-inventory-record', `control-id-indexed-inventory-publication-record',
`control-id-indexed-documentation-record', `control-id-indexed-authority-record'.~%▶▶▶~%"))

;; Media Entities - these include Technique, Material, Paper, Mount
(make-documented-class 'control-id-media-entity
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-media-entity', `control-id-category-entity', `control-id-naf-entity'.~%▶▶▶~%"))

(make-documented-class 'control-id-media-entity-display-name
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-name', `control-id-naf-entity-display-name',
`control-id-location-entity-display-name', `control-id-taxon-entity-display-name',
`control-id-display-name-for-entity-type', `control-id-media-entity-display-name',
`control-id-theme-entity-display-name', `control-id-category-entity-display-name'.~%▶▶▶~%"))

(make-documented-class 'control-id-media-entity-indexed-number
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-number', `control-id-record-indexed-number',
`control-id-media-entity-indexed-number', `control-id-category-entity-indexed-number',
`control-id-theme-entity-indexed-number', `control-id-taxon-entity-indexed-number',
`control-id-location-entity-indexed-number', `control-id-naf-entity-indexed-number'.~%▶▶▶~%"))

;; Technique Entities
(make-documented-class 'control-id-technique
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-taxon', `control-id-theme', `control-id-technique',
`control-id-material', `control-id-mount', `control-id-paper'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-technique
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-technique
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-artist', `control-id-indexed-author',
`control-id-indexed-person', `control-id-indexed-brand',
`control-id-indexed-publication', `control-id-indexed-theme',
`control-id-indexed-category', `control-id-indexed-taxon',
`control-id-indexed-technique', `control-id-indexed-material',
`control-id-indexed-mount', `control-id-indexed-paper'.~%▶▶▶~%"))

;; Material Entities
(make-documented-class 'control-id-material
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-technique', `control-id-material',
 `control-id-mount', `control-id-paper'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-material
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-material
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-artist', `control-id-indexed-author',
`control-id-indexed-person', `control-id-indexed-brand',
`control-id-indexed-publication', `control-id-indexed-theme',
`control-id-indexed-category', `control-id-indexed-taxon',
`control-id-indexed-technique', `control-id-indexed-material',
`control-id-indexed-mount', `control-id-indexed-paper'.~%▶▶▶~%"))

;; Paper Entities
(make-documented-class 'control-id-paper
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-taxon', `control-id-theme', `control-id-technique',
`control-id-material', `control-id-mount', `control-id-paper'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-paper
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-paper
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-artist', `control-id-indexed-author',
`control-id-indexed-person', `control-id-indexed-brand',
`control-id-indexed-publication', `control-id-indexed-theme',
`control-id-indexed-category', `control-id-indexed-taxon',
`control-id-indexed-technique', `control-id-indexed-material',
`control-id-indexed-mount', `control-id-indexed-paper'.~%▶▶▶~%"))

;; Mount Entities
(make-documented-class 'control-id-mount
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-taxon', `control-id-theme', `control-id-technique',
`control-id-material', `control-id-mount', `control-id-paper'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-mount
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-mount
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-artist', `control-id-indexed-author',
`control-id-indexed-person', `control-id-indexed-brand',
`control-id-indexed-publication', `control-id-indexed-theme',
`control-id-indexed-category', `control-id-indexed-taxon',
`control-id-indexed-technique', `control-id-indexed-material',
`control-id-indexed-mount', `control-id-indexed-paper'.~%▶▶▶~%"))

;; Category Entities
(make-documented-class 'control-id-category-entity
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-media-entity',`control-id-naf-entity'.~%▶▶▶~%"))

(make-documented-class 'control-id-category-entity-display-name
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-name', `control-id-naf-entity-display-name',
`control-id-location-entity-display-name', `control-id-taxon-entity-display-name',
`control-id-display-name-for-entity-type', `control-id-media-entity-display-name',
`control-id-theme-entity-display-name', `control-id-category-entity-display-name'.~%▶▶▶~%"))

(make-documented-class 'control-id-category-entity-indexed-number
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-number', `control-id-record-indexed-number',
`control-id-media-entity-indexed-number', `control-id-category-entity-indexed-number',
`control-id-theme-entity-indexed-number', `control-id-taxon-entity-indexed-number',
`control-id-location-entity-indexed-number', `control-id-naf-entity-indexed-number'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-category
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-category
:class-doc
 #.(format nil "
:NOTE categories have corresponding document numbers so we _do_ want this class,
\(as opposed to location-entity where we don't\).~%
:SEE-ALSO `control-id-indexed-artist', `control-id-indexed-author',
`control-id-indexed-person', `control-id-indexed-brand',
`control-id-indexed-publication', `control-id-indexed-theme',
`control-id-indexed-category', `control-id-indexed-taxon',
`control-id-indexed-technique', `control-id-indexed-material',
`control-id-indexed-mount', `control-id-indexed-paper'.~%▶▶▶~%"))

(make-documented-class 'category-id-display-advertising-and-graphics
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-category',
`category-id-display-advertising-and-graphics',
`category-id-display-architecture-and-design',
`category-id-display-books-and-publications', `category-id-display-geography',
`category-id-display-historical-life-and-scenes',
`category-id-display-natural-history'.~%▶▶▶~%"))


(make-documented-class 'category-id-display-architecture-and-design
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-category',
`category-id-display-advertising-and-graphics',
`category-id-display-architecture-and-design',
`category-id-display-books-and-publications', `category-id-display-geography',
`category-id-display-historical-life-and-scenes',
`category-id-display-natural-history'.~%▶▶▶~%"))


(make-documented-class 'category-id-display-books-and-publications
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-category',
`category-id-display-advertising-and-graphics',
`category-id-display-architecture-and-design', `category-id-display-geography',
`category-id-display-historical-life-and-scenes',
`category-id-display-natural-history'.~%▶▶▶~%"))

(make-documented-class 'category-id-display-geography
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-category',
`category-id-display-advertising-and-graphics',
`category-id-display-architecture-and-design',
`category-id-display-books-and-publications',
`category-id-display-historical-life-and-scenes',
`category-id-display-natural-history'.~%▶▶▶~%"))

(make-documented-class 'category-id-display-historical-life-and-scenes
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-category',
`category-id-display-advertising-and-graphics',
`category-id-display-architecture-and-design',
`category-id-display-books-and-publications',
`category-id-display-geography',`category-id-display-natural-history'.~%▶▶▶~%"))

(make-documented-class 'category-id-display-natural-history
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-category',
`category-id-display-advertising-and-graphics',
`category-id-display-architecture-and-design',
`category-id-display-books-and-publications', `category-id-display-geography',
`category-id-display-historical-life-and-scenes'~%▶▶▶~%"))

;; theme entities
(make-documented-class 'control-id-theme-entity
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-media-entity', `control-id-category-entity', `control-id-naf-entity'.
`control-id-theme-entity', `control-id-taxon-entity'.~%▶▶▶~%"))

(make-documented-class 'control-id-theme-entity-display-name
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-name', `control-id-naf-entity-display-name',
`control-id-location-entity-display-name', `control-id-taxon-entity-display-name',
`control-id-display-name-for-entity-type', `control-id-media-entity-display-name',
`control-id-theme-entity-display-name', `control-id-category-entity-display-name'.~%▶▶▶~%"))

(make-documented-class 'control-id-theme-entity-indexed-number
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-number', `control-id-record-indexed-number',
`control-id-media-entity-indexed-number', `control-id-category-entity-indexed-number',
`control-id-theme-entity-indexed-number', `control-id-taxon-entity-indexed-number',
`control-id-location-entity-indexed-number', `control-id-naf-entity-indexed-number'.~%▶▶▶~%"))

(make-documented-class 'control-id-theme
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-taxon', `control-id-theme', `control-id-technique',
`control-id-material', `control-id-mount', `control-id-paper'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-theme
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-theme
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-artist', `control-id-indexed-author',
`control-id-indexed-person', `control-id-indexed-brand',
`control-id-indexed-publication', `control-id-indexed-theme',
`control-id-indexed-category', `control-id-indexed-taxon',
`control-id-indexed-technique', `control-id-indexed-material',
`control-id-indexed-mount', `control-id-indexed-paper'.~%▶▶▶~%"))

;;  taxon entities
(make-documented-class 'control-id-taxon-entity
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-media-entity', `control-id-category-entity', `control-id-naf-entity'.
`control-id-theme-entity', `control-id-taxon-entity'.~%▶▶▶~%"))

(make-documented-class 'control-id-taxon-entity-display-name
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-name', `control-id-naf-entity-display-name',
`control-id-location-entity-display-name', `control-id-taxon-entity-display-name',
`control-id-display-name-for-entity-type', `control-id-media-entity-display-name',
`control-id-theme-entity-display-name', `control-id-category-entity-display-name'.~%▶▶▶~%"))

(make-documented-class 'control-id-taxon-entity-indexed-number
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-number', `control-id-record-indexed-number',
`control-id-media-entity-indexed-number', `control-id-category-entity-indexed-number',
`control-id-theme-entity-indexed-number', `control-id-taxon-entity-indexed-number',
`control-id-location-entity-indexed-number', `control-id-naf-entity-indexed-number'.~%▶▶▶~%"))

(make-documented-class 'control-id-taxon
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-taxon', `control-id-theme', `control-id-technique',
`control-id-material', `control-id-mount', `control-id-paper'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-taxon
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-taxon
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-artist', `control-id-indexed-author',
`control-id-indexed-person', `control-id-indexed-brand',
`control-id-indexed-publication', `control-id-indexed-theme',
`control-id-indexed-category', `control-id-indexed-taxon',
`control-id-indexed-technique', `control-id-indexed-material',
`control-id-indexed-mount', `control-id-indexed-paper'.~%▶▶▶~%"))

;; location entities
(make-documented-class 'control-id-location-entity
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-media-entity', `control-id-category-entity', `control-id-naf-entity'.
`control-id-theme-entity', `control-id-taxon-entity'.~%▶▶▶~%"))

(make-documented-class 'control-id-location-entity-display-name
:class-doc
 #.(format nil "
:NOTE This can be tricky because for example \"New York\" and \"New York\" refer to two separate
location entities, e.g. one is a state the other is a city.~%
:SEE-ALSO `control-id-display-name', `control-id-naf-entity-display-name',
`control-id-location-entity-display-name', `control-id-taxon-entity-display-name',
`control-id-display-name-for-entity-type', `control-id-media-entity-display-name',
`control-id-theme-entity-display-name', `control-id-category-entity-display-name'.~%▶▶▶~%"))

(make-documented-class 'control-id-location-entity-indexed-number
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-number', `control-id-record-indexed-number',
`control-id-media-entity-indexed-number', `control-id-category-entity-indexed-number',
`control-id-theme-entity-indexed-number', `control-id-taxon-entity-indexed-number',
`control-id-location-entity-indexed-number', `control-id-naf-entity-indexed-number'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-location
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'~%▶▶▶~%"))

;; naf-entity display names

(make-documented-class 'control-id-naf-entity
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-media-entity', `control-id-category-entity'
`control-id-naf-entity', `control-id-naf-entity-artist',
`control-id-naf-entity-author', `control-id-naf-entity-person',
`control-id-naf-entity-brand', `control-id-naf-entity-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-naf-entity-display-name
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-name', `control-id-naf-entity-display-name',
`control-id-location-entity-display-name', `control-id-taxon-entity-display-name',
`control-id-display-name-for-entity-type', `control-id-media-entity-display-name',
`control-id-theme-entity-display-name', `control-id-category-entity-display-name'.~%▶▶▶~%"))

(make-documented-class 'control-id-naf-entity-indexed-number
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-number', `control-id-record-indexed-number',
`control-id-media-entity-indexed-number', `control-id-category-entity-indexed-number',
`control-id-theme-entity-indexed-number', `control-id-taxon-entity-indexed-number',
`control-id-location-entity-indexed-number', `control-id-naf-entity-indexed-number'.~%▶▶▶~%"))

;; Artist entities
(make-documented-class 'control-id-naf-entity-artist
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-naf-entity', `control-id-naf-entity-artist',
`control-id-naf-entity-author', `control-id-naf-entity-person',
`control-id-naf-entity-brand', `control-id-naf-entity-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-artist
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-artist
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-artist', `control-id-indexed-author',
`control-id-indexed-person', `control-id-indexed-brand',
`control-id-indexed-publication', `control-id-indexed-theme',
`control-id-indexed-category', `control-id-indexed-taxon',
`control-id-indexed-technique', `control-id-indexed-material',
`control-id-indexed-mount', `control-id-indexed-paper'.~%▶▶▶~%"))

;; Author entities
(make-documented-class 'control-id-naf-entity-author
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-naf-entity', `control-id-naf-entity-artist',
`control-id-naf-entity-author', `control-id-naf-entity-person',
`control-id-naf-entity-brand', `control-id-naf-entity-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-author
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-author
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-artist', `control-id-indexed-author',
`control-id-indexed-person', `control-id-indexed-brand',
`control-id-indexed-publication', `control-id-indexed-theme',
`control-id-indexed-category', `control-id-indexed-taxon',
`control-id-indexed-technique', `control-id-indexed-material',
`control-id-indexed-mount', `control-id-indexed-paper'.~%▶▶▶~%"))

;; Person entities
(make-documented-class 'control-id-naf-entity-person
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-naf-entity', `control-id-naf-entity-artist',
`control-id-naf-entity-author', `control-id-naf-entity-person',
`control-id-naf-entity-brand', `control-id-naf-entity-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-person
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-person
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-artist', `control-id-indexed-author',
`control-id-indexed-person', `control-id-indexed-brand',
`control-id-indexed-publication', `control-id-indexed-theme',
`control-id-indexed-category', `control-id-indexed-taxon',
`control-id-indexed-technique', `control-id-indexed-material',
`control-id-indexed-mount', `control-id-indexed-paper'.~%▶▶▶~%"))

;; Brad entities
(make-documented-class 'control-id-naf-entity-brand
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-naf-entity', `control-id-naf-entity-artist',
`control-id-naf-entity-author', `control-id-naf-entity-person',
`control-id-naf-entity-brand', `control-id-naf-entity-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-brand
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-brand
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-artist', `control-id-indexed-author',
`control-id-indexed-person', `control-id-indexed-brand',
`control-id-indexed-publication', `control-id-indexed-theme',
`control-id-indexed-category', `control-id-indexed-taxon',
`control-id-indexed-technique', `control-id-indexed-material',
`control-id-indexed-mount', `control-id-indexed-paper'.~%▶▶▶~%"))

;; Publication entities

(make-documented-class 'control-id-naf-entity-publication
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-naf-entity', `control-id-naf-entity-artist',
`control-id-naf-entity-author', `control-id-naf-entity-person',
`control-id-naf-entity-brand', `control-id-naf-entity-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-display-publication
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-display-technique', `control-id-display-material',
`control-id-display-mount', `control-id-display-paper',
`control-id-display-theme', `control-id-display-taxon',
`control-id-display-location', `control-id-display-artist',
`control-id-display-author', `control-id-display-person',
`control-id-display-brand', `control-id-display-publication'.~%▶▶▶~%"))

(make-documented-class 'control-id-indexed-publication
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-indexed-artist', `control-id-indexed-author',
`control-id-indexed-person', `control-id-indexed-brand',
`control-id-indexed-publication', `control-id-indexed-theme',
`control-id-indexed-category', `control-id-indexed-taxon',
`control-id-indexed-technique', `control-id-indexed-material',
`control-id-indexed-mount', `control-id-indexed-paper'.~%▶▶▶~%"))

) ;; close eval when


;;; ==============================
;; dbc-class-edit.lisp
;;; ==============================

(eval-when (:compile-toplevel); :load-toplevel :execute)
  
(make-documented-class 'base-edit
:class-doc
 #.(format nil "The intended use for subclassed instances of the base-edit class is to record
information re the alteration of a class instance or slot value of an instance.~%
Not all instances and slots should record edit information. However, when it is
important to record when/how the data of a slot/instance was made it should be
done using the edit-class interface.~%
:SEE-ALSO `base-entity', `base-theme-entity', `base-category-entity', `base-taxon-entity',
`base-naf-entity', `base-media-entity', `base-location-entity'.~%▶▶▶~%"))

) ;; close eval when

;;; ==============================
;; (:file "dbc-class-naf-entity")
;;; ==============================

(eval-when (:compile-toplevel); :load-toplevel :execute)

(make-documented-class 'naf-entity-publication
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-naf-entity-publication', `control-id-display-publication',
`control-id-indexed-publication', `base-naf-entity', `naf-entity-artist', `naf-entity-author',
`naf-entity-person', `naf-entity-brand', `naf-entity-publication'.~%▶▶▶~%"))

(make-documented-class 'naf-entity-brand
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-naf-entity-brand', `control-id-display-brand', `control-id-indexed-brand',
`base-naf-entity', `naf-entity-artist', `naf-entity-author',
`naf-entity-person', `naf-entity-brand', `naf-entity-publication'.~%▶▶▶~%"))

(make-documented-class 'naf-entity-person
:class-doc
 #.(format nil "
:SEE-ALSO`control-id-naf-entity-person', `control-id-display-person',
`control-id-indexed-person', `base-naf-entity', `naf-entity-artist',
`naf-entity-author', `naf-entity-person', `naf-entity-brand',
`naf-entity-publication'.~%▶▶▶~%"))

(make-documented-class 'naf-entity-author
:class-doc
 #.(format nil "
:SEE-ALSO`control-id-naf-entity-author', `control-id-display-author', `control-id-indexed-author',
`base-naf-entity', `naf-entity-artist', `naf-entity-author',
`naf-entity-person', `naf-entity-brand', `naf-entity-publication'.~%▶▶▶"))

(make-documented-class 'naf-entity-artist
:class-doc
 #.(format nil "
:SEE-ALSO `control-id-naf-entity-artist', `control-id-display-artist',
`control-id-indexed-artist', `base-naf-entity', `naf-entity-artist', `naf-entity-author',
`naf-entity-person', `naf-entity-brand', `naf-entity-publication'.~%▶▶▶~%"))

;; :FILE dbc-class-theme-entity.lisp
(make-documented-class 'theme-entity
:class-doc
#.(format nil "
:SEE-ALSO `base-naf-entity', `naf-entity-artist', `naf-entity-author',
`naf-entity-person', `naf-entity-brand', `naf-entity-publication'.~%▶▶▶~%"))

) ;; close eval when

;;; ==============================
;; :file dbc-classes/dbc-class-media-entity.lisp
;;; ==============================

(eval-when (:compile-toplevel); :load-toplevel :execute)

(make-documented-class 'media-entity-technique
:class-doc
 #.(format nil
"Instances of this class used to describe techniques used in the production of a
particular type of media.~%
Possible \(generalized\) examples of a technique include:~%
 engraving, lithograph, photography, offset, etc.~%
:SEE-ALSO `description-media-entity-technique-note', `base-media-entity',
`media-entity-technique', `media-entity-material', `media-entity-mount',
`media-entity-color', `control-id-media-entity-type'.~%▶▶▶~%"))

(make-documented-class 'media-entity-material
:class-doc
 #.(format nil
"Instances of this class used to describe materials used in the production of a particular type of media.~%~@
Slot values might be used to indicate the type of material \(i.e. paper, fabric,
plastic, etc.\) as well as various aspects of its composition, e.g. whether it
is glazed, cold-rolled, 10mil, etc.~%
:SEE-ALSO `description-media-entity-material-note', `base-media-entity',
`media-entity-technique', `media-entity-paper', `media-entity-mount',
`media-entity-color', `control-id-media-entity-type'.~%▶▶▶~%"))

(make-documented-class 'media-entity-paper
:class-doc
 #.(format nil
"Instances of this class used to describe materials generally construed as being of the type \"paper\".~%
:SEE-ALSO `description-media-entity-material-note', `base-media-entity',
`media-entity-technique', `media-entity-material', `media-entity-mount',
`media-entity-color', `control-id-media-entity-type'.~%▶▶▶~%"))

(make-documented-class 'media-entity-mount
:class-doc
 #.(format nil
"Instances of this class used to describe the mounting used in with a particular type of media.~%
Slot values might be used to indicate the type of mount and its
state,i.e. whether the media is linen backed, dry mounted, framed, etc.~%
:SEE-ALSO `base-media-entity',`description-media-entity-mount-note' `base-media-entity',
`media-entity-technique', `media-entity-material', `media-entity-mount',
`media-entity-color', `control-id-media-entity-type'.~%▶▶▶~%"))

(make-documented-class 'media-entity-color
:class-doc
#.(format nil
            "Instances of this class used to describe aspects of the color of a particular type of media.~%
Example uses include:~%~% ~
 - slots indicating whether a color is represented by an HSV, RGB, or CMYK value;~%
 - slot indicating a cannonical or standardized display name of a particular color value;~%
 - slot indicating corefs to a cannonical or standardized display name of a particular color value;~% 
 - slot indicating whether color has a generalized parent category, e.g. ruby-red is subsumed by red;~%
:SEE-ALSO `description-media-entity-color-note', `base-media-entity',
`media-entity-technique', `media-entity-material', `media-entity-mount',
`media-entity-color'.~%▶▶▶~%"))

) ; close eval when

;;; ==============================
;; :file dbc-classes/dbc-class-location-entity.lisp
;;; ==============================

(eval-when (:compile-toplevel); :load-toplevel :execute)

(make-documented-class 'location-entity
:display-name
 #.(format nil
"The default display-name for an entity.~%~%")
 :appellations-modern
 #.(format nil
           "Enumeration of appellations used in _modern_ parlance \(i.e. contemporary usage\).~%
Used to disambiguate identification of a geographic entity.~%~@
For example, \"India\" as opposed to \"Hindostan\" or \"Ganges\".~% ~
When non-nil slot-value is a [ <STRING> | <LIST-OF-STRINGS> ].~%~@
:EXAMPLE~%
 \"Republic of India\"~% ~
 \(\"India\" \"Republic of India\"\)~%~%")

 :appellations-historic
  #.(format nil
            "Enumeration of historic appellations used in _non-modern_ parlance \(i.e. non-contemporary\).~%~@
Used to disambiguate identification of a geographic entity.~%~@
For example, \"Hindostan\" as opposed to \"Republic of India\".~%~@
Enumeration of appellations used in _modern_ parlance \(i.e. contempory usage\).~%~@
Used to disambiguate identification of a geographic entity.~%~@
For example, India as opposed to Hindostan or Ganges.~% ~
When non-nil slot-value is a [ <STRING> | <LIST-OF-STRINGS> ].~%~@
:EXAMPLE~%
 \"Hindostan\"~% ~
 \(\"Hindostan\" \"Ganges\"\)~%~%")

 :class-doc
 #.(format nil
           "Top-level from which location-entity derive~%~@
:SEE-ALSO `base-location-entity', `location-entity', `location-entity-imagined',
`location-entity-verified' `control-id-display-location', `control-id-location-entity',
`control-id-location-entity-type', `control-id-location-entity-display-name',
`control-id-location-entity-indexed-number', `location-entity-regexp'.~%▶▶▶~%"))

(make-documented-class 'location-entity-verified
:class-doc
 #.(format nil "
:SEE-ALSO `base-location-entity', `location-entity', `location-entity-imagined',
`location-entity-verified', `location-entity-unverified',
`control-id-display-location', `control-id-location-entity',
`control-id-location-entity-type', `control-id-location-entity-display-name',
`control-id-location-entity-indexed-number', `location-entity-regexp'.~%▶▶▶~%"))

(make-documented-class 'location-entity-imagined
:class-doc
 #.(format nil
 "Location entities for which \(likely\) don't exist in the current
spacio-temporatl plane, e.g. \"Here there be dragons.\"~%
:SEE-ALSO `base-location-entity', `location-entity', `location-entity-imagined',
`location-entity-verified', `location-entity-unverified',
`control-id-display-location', `control-id-location-entity',
`control-id-location-entity-type', `control-id-location-entity-display-name',
`control-id-location-entity-indexed-number', `location-entity-regexp'.~%▶▶▶~%"))

(make-documented-class 'location-entity-unverified
:class-doc
 #.(format nil
"Location entities for which can not be verified as actually existing.
As opposed to `location-entity-verified' for which ther is a consensus agreement that the place actually exist.~%
Likewise, as opposed to `location-entity-imagined' which \(likely\) don't exist
in the current spacio-temporatl plane.~%
:SEE-ALSO `base-location-entity', `location-entity', `location-entity-imagined',
`location-entity-verified', `location-entity-unverified',
`control-id-display-location', `control-id-location-entity',
`control-id-location-entity-type', `control-id-location-entity-display-name',
`control-id-location-entity-indexed-number', `location-entity-regexp'.~%▶▶▶~%"))

;;; ==============================
;; /dbc-classes/dbc-class-taxon-entity.lisp
;;; ==============================

(make-documented-class 'taxon-entity
:class-doc
 #.(format nil
  "A taxonomic entity.~%
Life
- Domain
-- Kingdom
--- Phylum
---- Class
----- Order
------ Family
------- Genus
-------- Species~%
:SEE-ALSO `base-taxon-entity', `control-id-taxon-entity-type',
`taxon-entity-coref', `*control-id-taxon-namespace*', `control-id-taxon-entity',
`control-id-taxon-entity-type', `control-id-taxon-entity-display-name',
`control-id-display-taxon'.~%%▶▶▶~%"))

) ; close eval when

;;; ==============================
;; :file dbc-classes/dbc-class-location-entity.lisp
;;; ==============================

(eval-when (:compile-toplevel); :load-toplevel :execute)

;; base-regexp
(make-documented-class 'base-regexp
:class-doc
#.(format nil
"Base class for matching control names of DBC entity instances.~%~@
:SEE-ALSO `base-regexp', `entity-regexp-subclass-allocation', `entity-regexp',
`theme-entity-regexp', `category-entity-regexp', `media-entity-regexp',
`location-entity-regexp', `naf-entity-type-regexp',
`naf-entity-control-name-regexp', `naf-entity-alt-name-regexp',
`naf-entity-artist-control-regexp', `naf-entity-artist-alt-regexp',
`naf-entity-author-control-regexp', `naf-entity-author-alt-regexp',
`naf-entity-person-alt-regexp', `naf-entity-person-control-regexp',
`naf-entity-brand-control-regexp', `naf-entity-brand-alt-regexp',
`naf-entity-publication-control-regexp', `naf-entity-publication-alt-regexp',
`regexp-match-entity-class', `regexp-match-entity-db',
`regexp-match-matcher-db', `regexp-match-container-type',
`regexp-match-container-uuid', `regexp-matcher'.~%▶▶▶~%"))

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
:SEE-ALSO `*parsed-field-name-regexp-db*'.~%▶▶▶~%"))

;; theme-entity-regexp
(make-documented-class 'theme-entity-regexp
:class-doc
 #.(format nil
"An `entity-regexp' sub-class for themes.~%~@
:SEE-ALSO `base-theme-entity'.~%▶▶▶~%"))

;; category-entity-regexp
(make-documented-class 'category-entity-regexp
:class-doc
 #.(format nil
"An `entity-regexp' sub-class for DBC categories.~%~
:SEE-ALSO `*category-entity-regexp-db*', `base-category-entity'.~%▶▶▶~%"))

;; media-entity-regexp
(make-documented-class 'media-entity-regexp
:class-doc
 #.(format nil
"An `entity-regexp' sub-class for DBC media types.~%~
:SEE-ALSO `*media-entity-regexp-db*',`base-media-entity'.~%▶▶▶~%"))

;; location-entity-regexp
(make-documented-class 'location-entity-regexp
:class-doc
 #.(format nil
"An `entity-regexp' sub-class for DBC location entities.~%~
:SEE-ALSO `*location-entity-regexp-db*', `base-location-entity'.~%▶▶▶~%"))

;; naf-entity-type-regexp
(make-documented-class 'naf-entity-type-regexp
:class-doc
#.(format nil
"An `entity-regexp' sub-class for DBC NAF entities.~%~@
Instances subclassed from `base-naf-entity' should instantiate instances of~%~
both `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp' to enable~%~
system wide xrefing/indexing of entity name-form occurences.~%~@
:SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

;; naf-entity-control-name-regexp
(make-documented-class 'naf-entity-control-name-regexp
:class-doc
#.(format nil 
"A `naf-entity-type-regexp' subclass for matching primary NAF control-names.~%~@
NAF control-names are considered canonical and are _rarely_ mutated.~%~@
The matchers named by instances of this class should run _before_ other regexps.~%~@
The MATCH-ENTITY-CONTAINER-TYPE slot of this class is defaulted to 'closure with~@
the intent that the MATCH-ENTITY-MATCHER will be implemented as a CL-PPCRE closure.~%~@
:SEE-ALSO `base-naf-entity', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

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
:SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

;; naf-entity-artist-alt-regexp
(make-documented-class 'naf-entity-artist-alt-regexp
 :class-doc
 #.(format nil
"A `naf-entity-alt-name-regexp' subclass for DBC NAF artist entities.~%~@
:SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp' .~%▶▶▶~%"))

(make-documented-class 'naf-entity-artist-regexp
 :class-doc
 #.(format nil
"A 'naf-entity-artist-regexp DBC NAF artist entities.~%~@
:SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp' .~%▶▶▶~%"))

;; naf-entity-person-control-regexp
(make-documented-class 'naf-entity-person-control-regexp
:class-doc
 #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF person entities.~%~@
:SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

;; naf-entity-person-alt-regexp
(make-documented-class 'naf-entity-person-alt-regexp
 :class-doc
 #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF person entities.~%~@
:SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

;;naf-entity-author-control-regexp
(make-documented-class 'naf-entity-author-control-regexp
 :class-doc
 #.(format nil
   "A `naf-entity-control-name-regexp' subclass for DBC NAF author entities.~%~@
:SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

;; naf-entity-author-alt-regexp
(make-documented-class 'naf-entity-author-alt-regexp
 :class-doc
 #.(format nil
           "A `naf-entity-alt-name-regexp' subclass for DBC NAF author entities.~%~@
:SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

;; naf-entity-brand-control-regexp
(make-documented-class 'naf-entity-brand-control-regexp
 :class-doc
 #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF brand entities.~%~@
:SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

;;naf-entity-brand-alt-regexp
(make-documented-class 'naf-entity-brand-alt-regexp
 :class-doc
 #.(format nil
"A `naf-entity-alt-name-regexp' subclass for DBC NAF brand entities.~%~@
:SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

;; naf-entity-publication-control-regexp
(make-documented-class 'naf-entity-publication-control-regexp
 :class-doc
 #.(format nil
           "A `naf-entity-control-name-regexp' subclass for DBC NAF publication entities.~%~@
:SEE-ALSO `naf-entity-publication', `naf-entity-type-regexp',
`naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

;; naf-entity-publication-alt-regexp
(make-documented-class 'naf-entity-publication-alt-regexp
 :class-doc
 #.(format nil
"A `naf-entity-alt-name-regexp' subclass for DBC NAF publication entities.~%~@
:NOTE When instantiating objects of this class be careful to discriminate
among like named or similiarly prefixed publication names.~%~@
:SEE-ALSO `naf-entity-publication' `naf-entity-type-regexp',
`naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶~%"))

;; :FILE dbc-classes/dbc-class-users.lisp
(make-documented-class 'base-user
:class-doc
 #.(format nil
"Base class for referencing users of the dbc-system.~%~@
Types of users might include:~%~% ~
 user-name, user-seller-name, user-client-name, etc.~%
:SEE-ALSO `<XREF>'.~%▶▶▶~%"))

) ; close eval when 

;;; ==============================
;; :file dbc-classes/dbc-class-documentation-record.lisp
;;; ==============================

(eval-when (:compile-toplevel); :load-toplevel :execute)

(make-documented-class 'base-documentation-record
:class-doc
 #.(format nil
"Base class for referencing documents in the dbc-system.~%
:NOTE The inverse corollary to the class `base-record' is the class `base-entity'.~%))
:SEE-ALSO `documentation-record-sitedoc'.~%▶▶▶~%"))

(make-documented-class 'documentation-record-sitedoc
:class-doc
 #.(format nil
"Base class for referencing documents from the file sitedoc.xml~%
:SEE-ALSO `base-documentation-record'.~%▶▶▶~%"))

) ; close eval when   

;;; ==============================
;; :file dbc-classes//dbc-class-parsed.lisp
;;; ==============================

(eval-when (:compile-toplevel); :load-toplevel :execute)
  
(make-documented-class 'parsed-class
:class-doc
 #.(format nil
"Base dbc parsed class.~%
:NOTE variable `*parsed-class-parse-table*' holds hashes keyed to subclasses of parsed-class.~%
:NOTE This is the base class from wich other converted dbc-classes inherit.~%
The intent is that this class should allow auxillary :before :after :around methods
to act on the primary-methods of `parsed-class' inheritors.~%
IOW, this your basic mixin base class :)~%
:SEE-ALSO `base-dbc', `parsed-naf-entity'.~%▶▶▶~%"))

(make-documented-class 'parsed-naf-entity
:class-doc
 #.(format nil
"Base class for parsing naf-entity records.~%~@
:SEE-ALSO `parsed-artist-record', `parsed-author-record',~%
`parsed-person-record', `parsed-brand-record', `parsed-publication-record'.~%▶▶▶~%"))

) ; close eval-when

;;; ==============================
;; :file dbc-classes/dbc-class-parsed-field-slot-mapping
;;; ==============================

(eval-when (:compile-toplevel); :load-toplevel :execute)

(make-documented-class 'parsed-class-field-slot-accessor-mapping
:class-doc
 #.(format nil
"Object for holding a mappings of field-names with slot-accessors.~%~@
slot parsed-class-mapped is symbol designating the parse-class whose slots are
mapped by hash-tables in slots accessor-to-field-table and
slot-accessor-field-name-table.~%~@
Slot field-to-accessor-table is a hash-table mapping from:~%~% ~
  field-name (a string) to slot-accessor \(a symbol)
Its `cl:hash-table-test' is `cl:equal'.~%~@
Slot accessor-to-field-table is a hash-table with an inverse mapping from:~%~% ~
 symbol to field-name~%~
Its `cl:hash-table-test' is `cl:eql'.~%~@
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%▶▶▶~%"))
  
(make-documented-class 'base-image :class-doc
#.(format nil "Base class for dbc image insances.~%
:SEE-ALSO `<XREF>'.~%▶▶▶~%"))

) ; close eval-when


;; parsed-tgm-theme-record
(eval-when (:compile-toplevel); :load-toplevel :execute)

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

