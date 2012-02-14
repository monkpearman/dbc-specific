;;; :FILE-CREATED <Timestamp: #{2011-05-21T16:39:04-04:00Z}#{11206} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-control-id.lisp
;;; ==============================

#|

 ,----
 | She wields a sure power that extends in all directions on hairlike wires too
 | small for anybody's eye but mine; I see her sit in the center of this web of
 | wires like a watchful robot, tend her network with mechanical insect skill, know
 | every second which wire runs where and just what current to send up to get the
 | results she wants.
 `---- One Flew Over the Cuckoo's Nest

 We make some attempt to implement an interface which will allow integration
 with the the CDWA Lite meta-model CDWA Lite is an XML schema to describe core
 records for works of art and material culture based on the Categories for the
 Description of Works of Art (CDWA) and Cataloging Cultural Objects: A Guide to
 Describing Cultural Works and Their Images (CCO). A goal of CDWA is to enable
 contributing records via the OAI Harvesting Protocol (Version 1.0).

:SEE (URL `http://www.getty.edu/research/publications/electronic_publications/cdwa/cdwalite.html')
:SEE (URL `http://www.getty.edu/research/publications/electronic_publications/cdwa/cdwalite.pdf')
:SEE (URL `http://www.getty.edu/CDWA/CDWALite/CDWALite-xsd-public-v1-1.xsd')

 More generally we intend the system to potentially integrate with the
 International Committee for Documentation (CIDOC) Conceptual Reference Model
 (CRM) i.e. CIDOC-CRM.

 :SEE (URL `http://www.cidoc-crm.org/working_editions_cidoc.html')
 :SEE (URL `http://www.cidoc-crm.org/docs/cidoc_crm_version_3_4_7.pdf')
 :SEE (URL `http://www.cidoc-crm.org/docs/paper16.pdf')
 :SEE (URL `http://www.cidoc-crm.org/docs/xml_to_rdfs/CIDOC_v3.3.2.rdfs')

 and its revised extensions/modifications as harmonized under International
 Federation of Library Associations and Institututions (IFLA) Functional
 Requirements for Bibliographic Records (FRBR) as FRBRoo (Object Oriented) and
 FRBRer (Entity Relation)

:SEE (URL `http://www.cidoc-crm.org/frbr_inro.html')
:SEE (URL `http://www.cidoc-crm.org/docs/frbr_oo/frbr_docs/FRBRoo_V1.0.2.pdf')

 As a general interface for maintaining and enabling such integration we intend
 that all objects in the DBC system will be canonically referenced by thier
 UUID.  Abstractly we would like to integrate our UUIDs in lieu of the IFLA's
 Working Group on Functional Requirements and Numbering of Authority Records
 (FRANAR) which discussed a scheme for International Standard Authority Data
 Numbers (ISADN) in their September 2008 paper entitled: 

  "A Review of the Feasibility of an International Authority Data Number"

 More specifically we are interested in the discussion from section 3 of that
 paper which suggests tracking developments of ISO Project 27729
 "International Standard Name Identifier (ISNI)" which charged a Working Group
 to:

  "define specifications for the syntax, assignment, registration, and
   administration of an international standard identifier for parties (persons
   and corporate bodies) involved in the creation and production of content
   entities (e.g., authors, composers, performers, groups of performers such as
   orchestras, music publishers, music producers, book publishers, audiovisual
   producers, producers of sound recordings, broadcasters, etc.)".

:SEE (URL `http://archive.ifla.org/VII/d4/wg-franar.htm')
:SEE (URL `http://archive.ifla.org/VII/d4/franar-numbering-paper.pdf') 
:SEE (URL `http://archive.ifla.org/VII/s29/wgfrsar.htm')

 To ease interaction with the system we need a way to _de-reference_ the to a
 non-UUID display name in day to day use.
 
 The class `base-control-id' is implemented to distinguish different
 types of controlled identities in classes with slots having 
 values used for identification puroposes. 

 :NOTE subclasses of `base-control-id' are distinct from those of the class
 `base-uuid' which defines _canonical_ identities for dbc system objects and
 (as distinct from the class objects they dereference).

 The class `control-id-display-name' does not not duplicate functionality of
 `control-id-display-name-for-entity-type'.  An object might record a display
 name that is controlled but that object may not itself be an entity.

 However, some of its subclasses will likely involve complex interactions in
 the C-P-L around the `display-name-for-entity' and
 `display-name-for-entity-of-type' slot-values.

 The class `control-id-display-name-for-entity-type' records information for
 class instances with slots which record displayable control-ids which
 identify a namable thing.  So, instances of the class `naf-entity-artist'
 will identify a specific artist but that entity (the artist) may have many
 different identities in different contexts, e.g. Gabrielle "Coco" Chanel was
 an artist but also a brand.  The display-name for ``Chanel (Gabrielle,
 "Coco")'' the artist is different than that of ``Chanel'' the brand which is
 likewise different from ``Chanel No. 5'' the product of that brand.

 Each is a string identifying an entity and in this case each entity has a
 semi-opaque relation with one another. In order to disambiguate the relation
 among the three we need a mechanism to simultaneously identify when these
 entities share commonality. It is not enough to simply do string comparisons
 b/c we also have pseudonyms and variant forms to contend with. IOW we need a
 way to index against our "controlled ID display names" :)
 So, the basic idea is to store our context identities to a hash-table index
 and resolve non-controlled identies against the indexes:

 (make-v5-uuid *control-id-artist-namespace*  "Chanel (Gabrielle, \"Coco\"))
 (make-v5-uuid *fashion-designer-namespace*   "Chanel (Gabrielle, \"Coco\"))

 ; ==============================

;;; CPL's 
;; (control-id-entity-type control-id-type base-dbc)
;; (control-id-display-name-for-entity-type control-id-display-name base-control-id base-dbc)

base-uuid                                     (base-dbc)
- system-object-uuid                          (base-uuid)

- base-control-id                             (base-dbc)
-- control-id-display-name                    (base-control-id) ;; String based identity
--- control-id-display-name-for-entity-type   (control-id-display-name)

- control-id-type                             (base-dbc)
-- control-id-record-type                     (control-id-type)
--- control-id-inventory-record-type          (control-id-record-type)
---- control-id-inventory-record              (control-id-inventory-record-type)
--- control-id-inventory-publication-record-type (control-id-record-type)
---- control-id-inventory-publication-record  (control-id-inventory-publication-record-type)
--- control-id-documentation-record-type      (control-id-record-type)
---- control-id-documentation-record          (control-id-inventory-record-type)
--- control-id-authority-record-type          (control-id-record-type)
---- control-id-authority-record              (control-id-authority-record-type)
;; control-id-documentation-record-num        ;; reference to the id of the meta-doc
;; control-id-documentation-record-sub-num
-- control-id-entity-type                     (control-id-type)
--- control-id-naf-entity-type                (control-id-entity-type)
---- control-id-naf-entity                    (control-id-naf-entity-type)
----- control-id-naf-entity-display-name      (control-id-naf-entity control-id-display-name-for-entity-type)
------ control-id-display-artist              (control-id-naf-entity-display-name)
------ control-id-display-author              (control-id-naf-entity-display-name)
------ control-id-display-person              (control-id-naf-entity-display-name)
------ control-id-display-brand               (control-id-naf-entity-display-name)
------ control-id-display-publication         (control-id-naf-entity-display-name)

--- control-id-location-entity-type           (control-id-entity-type)
---- control-id-location-entity               (control-id-location-entity-type)
----- control-id-location-entity-display-name (control-id-location-entity control-id-display-name-for-entity-type)
------ control-id-display-location            (control-id-location-entity-display-name)

--- control-id-category-entity-type                    (control-id-entity-type) 
---- control-id-category-entity                        (control-id-category-entity-type)
----- control-id-category-entity-display-name          (control-id-category-entity control-id-display-name-for-entity-type)
------ control-id-display-category                     (control-id-category-entity-display-name)
------- category-id-display-advertising-and-graphics   (control-id-display-category)
------- category-id-display-architecture-and-design    (control-id-display-category)
------- category-id-display-books-and-publications     (control-id-display-category)
------- category-id-display-geography                  (control-id-display-category)
------- category-id-display-historical-life-and-scenes (control-id-display-category)
------- category-id-display-natural-history            (control-id-display-category)

--- control-id-theme-entity-type              (control-id-entity-type)
---- control-id-theme-entity                  (control-id-theme-entity-type)
----- control-id-theme-entity-display-name    (control-id-theme-entity control-id-display-name-for-entity-type)
------ control-id-display-theme               (control-id-theme-entity-display-name)
----- control-id-indexed-theme (control-id-theme control-id-theme-entity-indexed-number)

--- control-id-media-entity-type              (control-id-entity-type)
---- control-id-media-entity                  (control-id-media-entity-type) 
----- control-id-media-entity-display-name    (control-id-media-entity control-id-display-name-for-entity-type)
------ control-id-display-technique           (control-id-media-entity-display-name)
------ control-id-display-mount               (control-id-media-entity-display-name)
------ control-id-display-material            (control-id-media-entity-display-name)
------- control-id-display-paper              (control-id-media-material)
****** control-id-display-color               (control-id-media-entity-display-name) ;; inactive

--- control-id-taxon-entity-type              (control-id-entity-type)
---- control-id-taxon-entity                  (control-id-taxon-entity-type)
----- control-id-taxon-entity-display-name    (control-id-taxon-entity control-id-display-name-for-entity-type)
------ control-id-display-taxon               (control-id-taxon-entity-display-name)

;; Item refs id-nums should be obfuscated with a UUID and are deprecated!
;; Entity id-nums may occure congruently and are deprecated!
;; Documentation id-nums for entities may occure congruently and are deprecated!
;; The deprecated entity specific slot namespaces should be
;; transformed to their superclass slot equivalent once parsing is finished.
;; e.g. "control-id-doc-num-artist"    -> "control-id-doc-uuid"
;; e.g. "control-id-entity-num-artist" -> "control-id-entity-uuid"


- control-id-indexed-number                 (base-control-id)    
-- control-id-record-indexed-number         (control-id-indexed-number)
--- control-id-indexed-inventory-record     (control-id-record-indexed-number)
--- control-id-indexed-inventory-publication-record (control-id-record-indexed-number)
--- control-id-indexed-documentation-record (control-id-record-indexed-number)
--- control-id-indexed-authority-record     (control-id-record-indexed-number)

---- control-id-doc-num                  
----- control-id-doc-num-artist          (control-id-doc-num)
----- control-id-doc-num-brand           (control-id-doc-num)
----- control-id-doc-num-author          (control-id-doc-num)
----- control-id-doc-num-person          (control-id-doc-num)
----- control-id-doc-num-publication     (control-id-doc-num)

--- control-id-entity-num                (control-id-deprecated-indexed-number)
---- control-id-entity-num-artist        (control-id-entity-num)
---- control-id-entity-num-author        (control-id-entity-num)
---- control-id-entity-num-brand         (control-id-entity-num)
---- control-id-entity-num-person        (control-id-entity-num)
---- control-id-entity-num-publication   (control-id-entity-num)

;; *control-id-authority-namespace*
-- control-id-authority-record          (base-control-id)  ;; :NOTE we have fields `control-id-authority-0' `control-id-authority-1'
--- control-id-authority-loc            (control-id-authority-record) ;; nb2007017414 | n 98028882 | no 99021790
--- control-id-authority-ulan           (control-id-authority-record) ;; 500013504
--- control-id-authority-bnf            (control-id-authority-record) ;; FRBNF40421659
--- control-id-authority-oclc          (control-id-authority-record) ;; 

;;; 

:NOTE the BKNR metaclass indexed-class implements much of what we're doing here and prob. does so better. 
It may be best to either adapt the code to use it or incorporate it in whole...

see for example 

the metaclasses 

 indexed-class (standard-class) 
 index-direct-slot-definition (standard-direct-slot-definition)
 index-effective-slot-definition (standard-effective-slot-definition) 

the slots:

 index-type
 index-reader
 index-keys
 index-var

the function 
 
 create-index-access-functions

and the following methods specialized on the classes:
  
 - slot-index
 -- hash-index
 --- class-index
 -- hash-list-index
 -- unique-index 
 --- string-unique-index
 - arrray-index
 - skip-list-index
 - class-skip-index

 index-add
 index-get
 index-remove
 index-keys
 index-values
 index-values-cursor
 index-keys-cursor
 index-mapvalues
 index-reinitialize
 index-clear
 index-create
 cursor-next
 cursor-previous

;;; ==============================

;; (URL `http://groups.google.com/group/comp.lang.lisp/msg/addeedd997199097')
(defun get-control-id-table (object)
  (gethash (class-name (class-of object))
           (slot-value object 'control-id-table))) 

;; (mon:where-is "class-prototype")

;; (sb-mop:class-prototype  (find-class 'control-id-type))
;; (sb-mop:class-prototype  (find-class 'control-id-naf-entity-artist))



|#
;;; ==============================

(in-package #:dbc)
;; *package*

;; :NOTE I think this is probabably a bad idea as we've decided that every
;; entity in the system will have an UUID we should assume that each of them will
;; also require a parent NAMESPACE at instance initialization
;; (defgeneric control-id-namespace-required (object))
;; (generic-doc #'control-id-namespace-required
;; "Return non-nil when object required a valid UUID namespace during initialization.
;; :SEE-ALSO `<XREF>'.~%")
;;
;; :NOTE We have left this definition here but currently my feeling is that it
;; is not a good idea to actually define it b/c we need to be doing this type of
;; work either in the initialization of subclasses of `base-control-id' or when
;; the it is updated/changed/redefined etc. and direct setf is likely a bad
;; idea which might come back to bite us in the ass later...
;; (defgeneric (setf control-id-namespace-required) (boolean object))
;; (generic-doc #'(setf control-id-namespace-required)
;; "Return non-nil when object requires a valid UUID namespace upon initialization.
;; :SEE-ALSO `<XREF>'.~%")
;;
;;
;; ;; :NOTE Not sure yet if we should expose this or not.
;; (defgeneric (setf control-id-namespace) (namespace object))
;; (generic-doc #'(setf control-id-namespace) 
;;  "Set the NAMESPACE associated with OBJECT.~%~@
;; NAMESPACE should satisfy `unicly:unique-universal-identifier-p'.
;; :SEE-ALSO `<XREF>'.~%")

;; make-instance
;; -- initialize-instance
;; --- shared-initialize  


;; slot-missing (class instance slot-name operation &optional new-value)
;; `slot-boundp', `slot-makunbound', `slot-value', (setf slot-value),
;; (defmethod slot-missing (class (object <CLASS-OF-OBJECT>) (slot (eql '<SLOT>)) <OPERATION> &optional <NEW-VALUE>)
;; You may choose to provide specialized methods for each operation with
;; (eql 'slot-boundp)
;; Or, one method for all operations, if you want e.g.: 
;;  (defmethod slot-missing ((c..) (i..) (s..) operation))
;; The one-method-for all the relevant protion of the signature is:
;; (operation t)
;; But, following is enough, b/c T specializer is implied
;;  (defmethod slot-missing ((c..) (i..) (s..) operation)) 
(defgeneric control-id-slot-missing-error (class object slot operation)) ;; &optional new-value)

(defgeneric control-id-slot-unbound-error (class object slot))
(defgeneric control-id-slot-value-null-error (object slot))

(defgeneric control-id-of-class-type-null-error (object))
(defgeneric control-id-of-class-type (class-symbol))

(defgeneric control-id-namespace-null-error (object))  
(defgeneric control-id-namespace  (object))

(defgeneric control-id-identifies-null-error (object))
(defgeneric control-id-identifies (object))

(defgeneric control-id-uuid-null-error (object))
(defgeneric control-id-uuid       (object))

;; (generic-doc #'control-id-namespace
;; "Get the namespace associted with OBJECT.
;; :SEE-ALSO `<XREF>'.~%")

(defun %find-control-id-class-or-lose (class-symbol)
  (if (find-class class-symbol)
      class-symbol
      (error "Could not cl:find-class for arg CLASS-SYMBOL, got: ~S" class-symbol)))


;; (%control-id-namespace-prefetch-uuid-table 'control-id-indexed-theme)
;; | => 386c2fdb-a3b3-5513-be98-f530639a0380
;; |    #<HASH-TABLE :TEST UUID-EQL :COUNT 0 {B541471}>
;;
;; (multiple-value-bind (namespace-uuid namespace-hash) (%control-id-namespace-prefetch-uuid-table 'control-id-indexed-theme)
;;   (let* ((indexed-id "88")
;;          (indexing-uuid (make-v5-uuid namespace-uuid indexed-id))
;;          (maybe-already-indexed (gethash indexing-uuid namespace-hash)))
;;     (if maybe-already-indexed
;;         (values maybe-already-indexed T)
;;         (values (setf (gethash indexing-uuid namespace-hash) indexed-id) nil))))
;;
;; fails successfully:
;; (%control-id-namespace-prefetch-uuid-table 'base-taxon-entity)
(defun %control-id-namespace-prefetch-uuid-table (class) ;; a symbol
  (let* ((ensure-found-class (find-class class))
         (maybe-finalize-class
          (or (sb-mop:class-finalized-p ensure-found-class)
              ;; (sb-mop:finalize-inheritance ensure-found-class)
              (make-instance class)))
         (maybe-initfunction
          (and maybe-finalize-class
               (funcall
                (or (loop
                       for effective-slot in (sb-mop:class-slots (find-class class)) ;; 'dbc::control-id-indexed-theme
                       for name = (sb-mop:slot-definition-name effective-slot)
                       when (and (eql name 'control-id-namespace) ;; dbc::control-id-namespace
                                 (sb-mop:slot-definition-initform effective-slot)
                                 (sb-mop:slot-definition-initfunction effective-slot)) return it)
                    (constantly nil)))))
         (maybe-gethash 
          (if maybe-initfunction 
              (gethash maybe-initfunction  *control-id-namespace-table*)
              (error "failed to find valid sb-mop:slot-definition-initfunction for class slot`control-id-indexed-theme'"))))
    (values maybe-initfunction maybe-gethash)))

;; (fundoc 'dbc-class-with-slot-unbound-error
;; Generalized procedure for signaling dbc-related `cl:slot-unbound' errors.~%~@
;; Arg CLASS is a class-object as per return return value of either `cl:find-class'/`cl:class-of'.~%~@
;; Arg OBJECT is an instance of class-object CLASS.~%~@
;; Arg slot is a symbol designating the unbound slot of OBJECT.~%~@
;; :EXAMPLE~%
;;  \(let* \(\(obj \(make-instance 'control-id-type\)\)
;;         \(obj-class \(class-of obj\)\)\)
;;    \(dbc-class-with-slot-unbound-error obj-class obj 'control-id-of-class-type\)\)~%~@
;; :SEE-ALSO `dbc-class-with-slot-value-null-error'.~%▶▶▶")
(defun dbc-class-with-slot-unbound-error (class object slot)
  (error "Instance of class: ~S~%with unbound slot: ~S~%in the object:~,,V,@S~%"
         (class-name class) slot 5 object))

;; (fundoc 'dbc-class-with-slot-value-null-error
;; Generalized procedure for signaling dbc-class related errors when cl:slot-value is null.~%~@
;; Arg OBJECT is an instance of class-object CLASS.~%~@
;; Arg slot is a symbol designating the unbound slot of OBJECT.~%~@
;; :EXAMPLE~%
;;  \(let \(\(obj \(make-instance 'control-id-type\)\)\)
;;    \(dbc-class-with-slot-value-null-error  obj 'control-id-of-class-type\)\)~%
;; :SEE-ALSO `dbc-class-with-slot-unbound-error'.~%▶▶▶"))
(defun dbc-class-with-slot-value-null-error (object slot)
  (error "Slot ~S with null cl:slot-value~%Instance of class: ~S~%in the object:~,,V,@S~%"
         slot (class-name (class-of object)) 5 object))

(defun dbc-class-with-slot-missing-error (class object slot operation)
  (error "Slot operation:  ~S~%on missing slot: ~S~%for the class:   ~S~%in the object:   ~S~%"
         operation slot (class-name class) object))


;;; ==============================
;;; control-id types
;;; ==============================

;; :ABSTRACT-CLASS
(defclass control-id-type (base-dbc)
  ((control-id-of-class-type))
  (:documentation
   #.(format nil "The type of class represented by subclasses of `base-control-id'.")))

(defmethod control-id-slot-missing-error (class (object control-id-type) (slot (eql 'control-id-of-class-type)) operation)
  (dbc-class-with-slot-missing-error class object slot operation))

(defmethod slot-missing (class (object control-id-type) (slot (eql 'control-id-of-class-type)) operation &optional new-value)
  (declare (ignore new-value))
  (control-id-slot-missing-error class object slot operation))

(defmethod control-id-slot-unbound-error (class
                                          (object control-id-type)
                                          (slot (eql 'control-id-of-class-type)))
  (dbc-class-with-slot-unbound-error class slot object))

(defmethod slot-unbound (class (object control-id-type) (slot (eql 'control-id-of-class-type)))
  (control-id-slot-unbound-error class object slot))

(defmethod control-id-slot-value-null-error ((object control-id-type)
                                             (slot (eql 'control-id-of-class-type)))
  (dbc-class-with-slot-value-null-error object slot))

(defmethod control-id-of-class-type-null-error ((object control-id-type))
  (control-id-slot-value-null-error object 'control-id-of-class-type))

;; :NOTE not sure if this is right and/or at the right place
(defmethod control-id-of-class-type ((object control-id-type))
  (find-class
   (or (and (slot-value object 'control-id-of-class-type))
       (control-id-of-class-type-null-error object))))

;;; ==============================
;; It is likely that touching some of these slots will need to trigger
;; specialized auxiliary methods:
;;
;; control-id-uuid
;; control-id-namespace
;; control-id-identifies
;; control-id-of-instance
;; control-id-instance-class
;; control-id-class-uuid


;; :ABSTRACT-CLASS
(defclass base-control-id  (base-dbc) ;; base-uuid
  ((control-id-uuid)    
   (control-id-namespace)
   (control-id-identifies)
   ;; Storing class data in conjunctions with UUIDs is prob. a bad idea.
   ;; implies that we establish _really_ complicated methods which account for
   ;; updated/changed/redefined instances.
   ;; The only way we can make this work is to let Rucksack handle the heavy lifting...
   ;; See comments at `add-class-uuid-and-identity-to-hash' for additional discussion.
   ;; 
   ;; The slot CONTROL-ID-OF-INSTANCE is the UUID of the class instance being identified.~%~@
   ;; (control-id-of-instance)    ; -- bad idea
   ;;
   ;; The slot CONTROL-ID-INSTANCE-CLASS is a symbol designating a class object.~%~@
   ;; (control-id-instance-class) ; -- bad idea
   ;;
   ;; The slot CONTROL-ID-CLASS-UUID is the UUID of class instance of the entity
   ;; identified (e.g. the entity's class-of).~%~@
   ;; (control-id-class-uuid))    ; -- bad idea
   )
  (:documentation
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
:SEE-ALSO .~%▶▶▶")))

(defmethod control-id-slot-unbound-error (class
                                          (object base-control-id)
                                          slot)
  (dbc-class-with-slot-unbound-error class object slot))

(defmethod control-id-slot-value-null-error ((object base-control-id)
                                             slot)
  (dbc-class-with-slot-value-null-error object slot))

;;; control-id-namespace
(defmethod control-id-slot-missing-error (class (object base-control-id) (slot (eql 'control-id-namespace)) operation)
  (dbc-class-with-slot-missing-error class object slot operation))

(defmethod slot-missing (class (object base-control-id) (slot (eql 'control-id-namespace)) operation &optional new-value)
  (declare (ignore new-value))
  (control-id-slot-missing-error class object slot operation))

(defmethod slot-unbound (class (object base-control-id) (slot (eql 'control-id-namespace)))
  (control-id-slot-unbound-error class object slot))

(defmethod control-id-namespace-null-error  ((object base-control-id))
  (control-id-slot-value-null-error object 'control-id-namespace))

(defmethod control-id-namespace ((object base-control-id))
  ;;(slot-value object 'control-id-namespace))
  (or (and (slot-value object 'control-id-namespace))
      (control-id-namespace-null-error object)))

;;; control-id-uuid
(defmethod control-id-slot-missing-error (class (object base-control-id) (slot (eql 'control-id-uuid)) operation)
  (dbc-class-with-slot-missing-error class object slot operation))
;;
(defmethod slot-missing (class (object base-control-id) (slot (eql 'control-id-uuid)) operation &optional new-value)
  (declare (ignore new-value))
  (control-id-slot-missing-error class object slot operation))
;;
(defmethod slot-unbound (class (object base-control-id) (slot (eql 'control-id-uuid)))
  (control-id-slot-unbound-error class object slot))
;;
(defmethod control-id-uuid-null-error ((object base-control-id))
  (control-id-slot-value-null-error object 'control-id-uuid))
;;
(defmethod control-id-uuid ((object base-control-id))
  (slot-value object 'control-id-uuid))

;;; control-id-identifies
(defmethod control-id-slot-missing-error (class (object base-control-id) (slot (eql 'control-id-identifies)) operation)
  (dbc-class-with-slot-missing-error class object slot operation))
;;
(defmethod slot-missing (class (object base-control-id) (slot (eql 'control-id-control-identifies)) operation &optional new-value)
  (declare (ignore new-value))
  (control-id-slot-missing-error class object slot operation))
;;
(defmethod slot-unbound (class (object base-control-id) (slot (eql 'control-id-identifies)))
  (control-id-slot-unbound-error class object slot))
;;
(defmethod control-id-identifies-null-error  ((object base-control-id))
  (control-id-slot-value-null-error object 'control-id-identifies))
;;
(defmethod control-id-identifies ((object base-control-id))
  (slot-value object 'control-id-identifies))


;; :ABSTRACT-CLASS
(defclass control-id-indexed-number (base-control-id)
  ()
  (:documentation 
   #.(format nil
             "The class `control-id-indexed-number' is an abstract-class.~%~@
Its subclasses distinguish different types of controlled identities which use
\(or did use\) a positive fixnum as an indexed identifier.~%~@
:NOTE Use of this class is deprecated. It is intended that subclassing instances
will instantiate this class where retention of an original indexed number is
important but where we expect and eventual migration to a more sophisticated
approach.~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")))

;; (control-id-uuid)
;; (control-id-namespace)
;; (control-id-identifies)

;; :ABSTRACT-CLASS
;; (defclass control-id-deprecated-indexed-number (base-control-id)
;;   ()
;;   )

;; - control-id-indexed-number             (base-control-id)    
;; ---- control-id-inventory-num            (control-id-indexed-number)
;; ---- control-id-doc-num                  (control-id-indexed-number)
;; ----- control-id-doc-num-artist          (control-id-doc-num)
;; ----- control-id-doc-num-brand           (control-id-doc-num)
;; ----- control-id-doc-num-author          (control-id-doc-num)
;; ----- control-id-doc-num-person          (control-id-doc-num)
;; ----- control-id-doc-num-publication     (control-id-doc-num)

;; --- control-id-entity-num                (control-id-indexed-number)
;; ---- control-id-entity-num-artist        (control-id-entity-num)
;; ---- control-id-entity-num-author        (control-id-entity-num)
;; ---- control-id-entity-num-brand         (control-id-entity-num)
;; ---- control-id-entity-num-person        (control-id-entity-num)
;; ---- control-id-entity-num-publication   (control-id-entity-num)

;; (defclass control-id-enitity-doc-num (base-control-id))
;; (defclass control-id-entity-num      (base-control-id))

;;; ==============================
;; controlled record types
;;; ==============================
;; :NOTE Where a class record is one defined in files with names of the form:
;;  dbc-class-<FOO>-record.lisp
;; as distinct from thos with names of the form:
;; dbc-class-parsed-<FOO>-record.lisp
;;
(defclass control-id-record-type (control-id-type)
  ((control-id-of-class-type
    :documentation
    #.(format nil
              "A class object identified by the subclasses of class `base-control-id'.~%~@
:NOTE This slot is informally class-allocated e.g. it should be treated as if~%~
the following were specified:~%~% ~
 \(control-id-of-class-type :allocation :class\) ~%~%~
Its slot-value should not be instantiated via an initarg, nor should it be~%~
specialized by a setf accessor form.~%")))
  (:documentation
   #.(format nil ":ABSTRACT-CLASS~%~@
A mixin for subclasses of which identify classes containing \"record\" like data, e.g.:
 `base-inventory-record', `base-authority-record', etc.
:NOTE The inverse corollary to the class `base-record' is the class `base-entity'.~%~%")))

;; control-idcontrol-id-namespace-null-error

;; `parsed-inventory-record'
(defclass control-id-inventory-record-type (control-id-record-type)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'base-inventory-record))))

;; `parsed-doc-record' 
;; control-id-documentation-record-num, control-id-documentation-record-sub-num
(defclass control-id-documentation-record-type (control-id-record-type)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'base-documentation-record))))
;;
(defclass control-id-authority-record-type (control-id-record-type)
  ((control-id-of-class-type 
    :initform (%find-control-id-class-or-lose 'base-authority-record))))
;;
(defclass control-id-inventory-publication-record-type (control-id-record-type)
  ((control-id-of-class-type 
    :initform (%find-control-id-class-or-lose 'dbc-class-inventory-publication-record)))
  (:documentation 
   #.(format nil
"control-id for individual loose periodical issues and/or publications.~%~
e.g. an loose issue of the periodical Femina is distinct from the linen-backed cover pulled~%~
from that issue and is distinct from instances of `control-id-inventory-record-type'~%~
because its individual leafs will become inventory-record insances once disassembled/disbound.")))

;; :ABSTRACT-CLASS
(defclass control-id-record-indexed-number (control-id-indexed-number)
  ()
  (:documentation 
   #.(format nil
   ":ABSTRACT-CLASS for control-id-<FOO>-record-type classes which are primarily indexed by number.~% 
Usage of this class is roughly correllative with usage of control-id-display-name for control-id-entity-<FOO>-types")))


;;; ==============================
;; controlled entity types
;;; ==============================
              
(defclass control-id-entity-type (control-id-type)
  ;; (control-id-of-class-type  :initform (%find-control-id-class-or-lose 'base-entity))
  ((control-id-of-class-type 
    :documentation 
    #.(format nil
              "A class object identified by the subclasses of class `base-control-id'.~%~@
:NOTE This slot is informally class-allocated e.g. it should be treated as if~%~
the following were specified:~%~% ~
 \(control-id-of-class-type  :allocation :class\) ~%~%~
Its slot-value should not be instantiated via an initarg, nor should it be~%~
specialized by a setf accessor form.~%")))
  (:documentation
   #.(format nil ":ABSTRACT-CLASS~%~@
A mixin for subclasses of classes with symbol-names of the form:~%~% ~
control-id-<FOO>-entity-type~%
:NOTE The inverse corollary to the class `base-entity' is the class `base-record'.~%~%")))

(defclass control-id-naf-entity-type (control-id-entity-type)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'base-naf-entity))))

(defclass control-id-location-entity-type (control-id-entity-type)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'base-location-entity))))

(defclass control-id-category-entity-type (control-id-entity-type)
  ((control-id-of-class-type 
    :initform (%find-control-id-class-or-lose 'base-category-entity))))

(defclass control-id-theme-entity-type (control-id-entity-type)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'base-theme-entity))))

(defclass control-id-media-entity-type (control-id-entity-type)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'base-media-entity))))

(defclass control-id-taxon-entity-type (control-id-entity-type)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'base-taxon-entity))))


;;; ==============================
;;; display-names
;;; :NOTE The `control-id-display-name-<FOO>' interface is for congruence with
;;; CDWA-LITE elements of the form:
;;;    <cdwalite:displayFOO
;;;
;;; ==============================

;; We've extended `control-id-display-name-for-entity-type' because the domain
;; of typed entites is mostly known e.g.:
;;  artists, brands, authors, person, publication, location
;; Other types of objects which will need control-ids may include:
;;  product-items, documentation-items, edit-items, image-items, data-containers etc.
;; These types of things do not really have meaningful names but they will
;; none-the-less require an interface that allows us to refer to them
;; independent of their UUID identity..
;; :ABSTRACT-CLASS
(defclass control-id-display-name (base-control-id) ;; base-uuid
  ;; control-id-uuid
  ;; control-id-namespace
  ;; control-id-identifies
  ;; control-id-of-instance     -- bad idea
  ;; control-id-instance-class  -- bad idea
  ;; control-id-class-uuid      -- bad idea
  ()
  (:documentation 
   #.(format nil
             "The class `control-id-display-name' records information for classes with slots
which record displayable control-ids which identify a nameable thing.~%~@
:NOTE A nameable thing is not necessarily an entity.~%~@
:EXAMPLE~%
 \(mon:class-subclasses \(%find-control-id-class-or-lose 'control-id-display-name\)\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")))

;; (defclass control-id-display-name-for-class (control-id-display-name)
;;   ;; control-id-uuid
;;   ;; control-id-namespace
;;   ;; control-id-identifies     -- symbol
;;   ()
;;   (:documentation "Identifies class objects.
;; The slot control-id-identifies is a symbol.
;; Currently slot-values for the slots:
;;  control-id-of-instance, control-id-instance-class, control-id-class-uuid
;; are not considered applicable.
;; :NOTE Should we eventually decide to instantiate them we will need to decide how
;; to handle class-precedence lists and what to do when a class is redefined."))

;; (defgeneric control-id-of-entity (entity-object)
;; (generic-doc #'display-name-for-entity 
;; "Get the control-id-of-entity ENTITY-OBJECT
;; Return value is UUID which identifies ENTITY-OBJECT uniquely within the
;; namespace specified by the slot-value control-id-namespace.")

;; (defgeneric display-name-for-entity (entity-object) 
;; (generic-doc #'display-name-for-entity 
;; "Get the display-name for ENTITY-OBJECT.")

;; (defgeneric display-name-for-entity-of-type (entity-object)
;; (generic-doc #'display-name-for-entity-of-type
;; "Get the entity-type of ENTITY-OBJECT."

;; (class-name (%find-control-id-class-or-lose 'control-id-display-name-for-entity-type))

;; :ABSTRACT-CLASS
(defclass control-id-display-name-for-entity-type (control-id-display-name)
  ;; control-id-uuid
  ;; control-id-namespace
  ;; control-id-identifies  -- string maybe specialized for display. Should satisfy `mon:string-not-null-empty-or-all-whitespace-p'
  ()
  (:documentation 
   #.(format nil
             "Instances of this class hold information about an entities displayable name.~%~@
The slot CONTROL-ID-INSTANCE-CLASS is a symbol indicating the class of the entity identified by the slot-value CONTROL-ID-IDENTIFIES.~%~@
This slot should be instantiated to a class-object suitable for use as an~%~@
argument to `cl:%find-control-id-class-or-lose' and which returns a class or subclass which is a~%~@
member in the set of class-names returned by the following forms \(or their expansions\):~% ~
 \(mon:class-subclasses \(%find-control-id-class-or-lose 'base-entity\)\)~% ~
 \(member \(class-name \(%find-control-id-class-or-lose 'base-naf-entity\)\)
         \(mon:class-subclasses \(%find-control-id-class-or-lose 'base-entity\)\)\)~% ~
:NOTE There may be multiple different entities with a CONTROL-ID-IDENTIFIES slot-value which are `cl:string='.~%~@
Likewise, such co-references may occur in both the same class and/or an entirely different class.
:EXAMPLE~% ~
 \(mon:class-subclasses \(%find-control-id-class-or-lose 'control-id-display-name-for-entity-type\)\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")))

;; (%find-control-id-class-or-lose (class-name (class-of *control-id-artist-namespace*)))

;; control-id-display-artist-namespace

;; :TESTING
;; (defparameter *tt--cida* (make-instance 'control-id-display-artist))
;; (defclass control-id-display-artist (control-id-display-name-for-entity-type)  
;;   ((control-id-namespace 
;;     :initarg :control-id-namespace
;;     :allocation :class))
;;   (:default-initargs :control-id-namespace (symbol-value '*control-id-artist-namespace*)))

;; (defmethod initialize-instance 

;; (defun make-control-id-display-artist (display-name entity-of-type)
;; DISPLAY-NAME is a string identifying entity ENTITY-OF-TYPE is the class of the entity.


;;; ==============================
;;; :RECORDS -- control ids for classes derived from class `base-record'.
;;; ==============================

;;; The inverse corollary to the class `base-record' is the class `base-entity'.

;;; :NOTE it is not likely that instances of the control-id-record-<FOO> classes
;;; will share a subclass `control-id-display-name-for-entity-type' but we
;;; reserve the right to change our mind.

;;; ==============================
;; inventory-record 
;;; ==============================


;; base-record (base-dbc)
;; base-inventory-record (base-record)
(defclass control-id-inventory-record (control-id-inventory-record-type base-control-id)
  ;; *control-id-inventory-namespace*
  ;; control-id-of-class-type
  ;; control-id-identifies
  ;; control-id-uuid
  ((control-id-namespace 
   :initform  (system-identity-uuid *control-id-inventory-namespace*))))

;; (defmethod control-id-namespace ((object control-id-inventory-record))
;; (control-id-namespace-null-error

(defclass control-id-indexed-inventory-record (control-id-inventory-record control-id-record-indexed-number)
  ()
  ;; (:documentation "See slot inventory-number of class `parsed-inventory-record'")
  )

;;; ==============================
;; publication-inventory-record 
;;; ==============================

(defclass control-id-inventory-publication-record (control-id-inventory-publication-record-type base-control-id)
  ;; *control-id-inventory-publication-namespace*
  ;; control-id-of-class-type
  ;; control-id-identifies
  ;; control-id-uuid
  ((control-id-namespace 
    :initform  (system-identity-uuid *control-id-inventory-publication-namespace*))))

(defclass control-id-indexed-inventory-publication-record (control-id-inventory-publication-record control-id-record-indexed-number)
  ()
  ;; (:documentation "See slot inventory-number of class `parsed-inventory-record'")
  )


;;; ==============================
;; documentation-record
;;; ==============================

(defclass control-id-documentation-record (control-id-documentation-record-type base-control-id)
  ;; *control-id-documentation-namespace*
  ((control-id-namespace 
   :initform  (system-identity-uuid *control-id-documentation-namespace*))))

(defclass control-id-indexed-documentation-record (control-id-documentation-record control-id-record-indexed-number)
  ()
  )

;;; ==============================
;; authority-record
;;; ==============================

(defclass control-id-authority-record (control-id-authority-record-type base-control-id)
  ((control-id-namespace 
   :initform  (system-identity-uuid *control-id-authority-namespace*))))

(defclass control-id-indexed-authority-record (control-id-authority-record control-id-record-indexed-number)
  ()
  )

;;
;; *control-id-authority-namespace*
;; control-id-authority-0, control-id-authority-1, 
;; control-id-db-loc, control-id-db-ulan, control-id-db-bnf, control-id-db-oclc,
;; (defclass control-id-db-record-type (control-id-type)
;;   ())
;;   

;; *control-id-image-namespace*
;; (defclass control-id-image-type (control-id-type)
;;   ())
;;   


;;; ==============================
;;; :ENTITIES -- control ids for classes derived from class `base-entity'.
;;; ==============================

;;; The inverse corollary to the class `base-entity'  is the class `base-record'.


;;; ==============================
;; media-entity
;;; ==============================

(defclass control-id-media-entity (control-id-media-entity-type base-control-id)
  ())

;; :ABSTRACT-CLASS
(defclass control-id-media-entity-display-name (control-id-display-name-for-entity-type)
  ())
(defclass control-id-media-entity-indexed-number (control-id-indexed-number)
  ())

(defclass control-id-technique (control-id-media-entity)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'media-entity-technique))
   (control-id-namespace 
    :initform  (system-identity-uuid *control-id-technique-namespace*))))

(defclass control-id-display-technique (control-id-technique control-id-media-entity-display-name)
  ())

(defclass control-id-indexed-technique (control-id-technique control-id-media-entity-indexed-number)
  ())

(defclass control-id-material (control-id-media-entity)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'media-entity-material))
   (control-id-namespace 
    :initform  (system-identity-uuid *control-id-material-namespace*))))

(defclass control-id-display-material (control-id-material control-id-media-entity-display-name)
  ())

(defclass control-id-indexed-material (control-id-material control-id-media-entity-indexed-number)
  ())

(defclass control-id-paper (control-id-material)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'media-entity-paper))
   (control-id-namespace 
    :initform  (system-identity-uuid *control-id-paper-namespace*))))

(defclass control-id-display-paper (control-id-display-material)
  ())

(defclass control-id-indexed-paper (control-id-indexed-material)
  ())

(defclass control-id-mount (control-id-media-entity)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'media-entity-mount))
   (control-id-namespace 
    :initform  (system-identity-uuid *control-id-mount-namespace*))))

(defclass control-id-display-mount (control-id-mount control-id-media-entity-display-name)
  ())
(defclass control-id-indexed-mount  (control-id-mount control-id-media-entity-indexed-number)
  ())

;; (defclass control-id-color (control-id-media-entity)
;;   ((control-id-of-class-type
;;     :initform (%find-control-id-class-or-lose 'media-entity-color))
;;    (control-id-namespace 
;;     :initform  (system-identity-uuid *control-id-color-namespace*))))
;;
;; (defclass control-id-display-color (control-id-color control-id-media-entity-display-name)
;;   ())
;; (defclass control-id-indexed-color (control-id-color control-id-media-entity-indexed-number)
;;   ())



;;; ==============================
;;; category-entity
;;; ==============================

(defgeneric control-id-display-category (object)
  (:documentation "This method should be specialized by subclasses of `category-entity-top-level'.~%"))

;; :NOTE What this is tricky because there may be multiple categories with the
;; same display name each of which refer to a separate category entity, e.g.:
;; 
(defclass control-id-category-entity (control-id-category-entity-type)
  ())

;; :ABSTRACT-CLASS
(defclass control-id-category-entity-display-name (control-id-category-entity control-id-display-name-for-entity-type)
  ())

(defclass control-id-category-entity-indexed-number  (control-id-category-entity control-id-indexed-number)
  ())

(defclass control-id-display-category (control-id-category-entity-display-name)
  ;; control-id-uuid
  ;; control-id-identifies
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'category-entity-top-level))
   (control-id-namespace 
    :initform (system-identity-uuid *control-id-category-namespace*))))

;; (%find-control-id-class-or-lose
;;  (%find-control-id-class-or-lose 'category-entity-top-level))
;; (defparameter *tt--cida* (make-instance 'control-id-display-category))
;; (control-id-of-class-type *tt--cida*) => #<STANDARD-CLASS CATEGORY-ENTITY-TOP-LEVEL>
;; (control-id-namespace *tt--cida*) => bcca712d-5688-5a23-b2fd-f3db1434fa0b
;; 
(defmethod initialize-instance :after ((object control-id-display-category) &key)
  ;; (unless (eql (class-name (class-of object)) 'control-id-display-category)
  (unless (eql (control-id-of-class-type object) 'control-id-display-category)
    (setf (slot-value object 'control-id-namespace)
          (make-v5-uuid (slot-value object 'control-id-namespace)
                        (string (class-name (find-class (slot-value object 'control-id-of-class-type))))))))

;; :NOTE categories have corresponding document numbers so we _do_ want this
;; class (as opposed to location-entity where we don't)
(defclass control-id-indexed-category (control-id-category-entity-indexed-number)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'category-entity-top-level))
   (control-id-namespace 
    :initform (system-identity-uuid *control-id-category-namespace*))))

(defmethod initialize-instance :after ((object control-id-indexed-category) &key)
  (unless (eql (control-id-of-class-type object) 'control-id-indexed-category)
    (setf (slot-value object 'control-id-namespace)
          (make-v5-uuid (slot-value object 'control-id-namespace)
                        (string (class-name (find-class (slot-value object 'control-id-of-class-type))))))))

(defclass category-id-display-advertising-and-graphics (control-id-display-category)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'category-entity-advertising-and-graphics))))

(defclass category-id-display-architecture-and-design (control-id-display-category)
  ((control-id-of-class-type 
    :initform (%find-control-id-class-or-lose 'category-entity-architecture-and-design))))

(defclass category-id-display-books-and-publications (control-id-display-category)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'category-entity-books-and-publications))))

(defclass category-id-display-geography (control-id-display-category)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'category-entity-geography))))

(defclass category-id-display-historical-life-and-scenes (control-id-display-category)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'category-entity-historical-life-and-scenes))))

(defclass category-id-display-natural-history (control-id-display-category)
  ((control-id-of-class-type 
    :initform (%find-control-id-class-or-lose 'category-entity-natural-history))))

;; (control-id-uuid)
;; (control-id-namespace)
;; (control-id-identifies)

;; (slot-value (make-instance 'category-id-display-natural-history) 'control-id-namespace)

;; (control-id-of-class-type (make-instance 'category-id-display-natural-history))
;; (slot-value (make-instance 'category-id-display-natural-history) 'control-id-of-class-type)


;;; ==============================
;;; theme-entity display names
;;; ==============================

;; :NOTE Should we treat MT, RT, BT, NT, USE, USED-FOR as distinct themes?
(defclass control-id-theme-entity (control-id-theme-entity-type base-control-id)
  ())

;; (defmethod control-id-of-class-type ((object control-id-theme-entity))

;; ;; :ABSTRACT-CLASS
(defclass control-id-theme-entity-display-name (control-id-theme-entity control-id-display-name-for-entity-type)
  ())
(defclass control-id-theme-entity-indexed-number (control-id-theme-entity control-id-indexed-number)
  ())

(defclass control-id-theme (control-id-theme-entity)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'theme-entity))
   (control-id-namespace
    :initform  (system-identity-uuid *control-id-theme-namespace*))))

(defclass control-id-display-theme (control-id-theme control-id-theme-entity-display-name)
  ())

;; (control-id-of-class-type (make-instance 'control-id-display-theme))

;; (make-instance 'control-id-indexed-theme)

(defclass control-id-indexed-theme (control-id-theme control-id-theme-entity-indexed-number)
  ())

;; (defclass tt--indexed-theme ()
;;   (entity-num
;;    :initarg entity-num
;;    :initform (error "must provided a entity-num"))
 ;;   )


;; (defun make-tt--indexed-theme (&key entity-num)
;;   (make-instance 'tt--indexed-theme
;;                  :entity-num "88")

;; control-id-identifies    = #<unbound>
;; control-id-namespace     = 386c2fdb-a3b3-5513-be98-f530639a0380
;; control-id-of-class-type = dbc::theme-entity
;; control-id-uuid          = #<unbound>

;; 


;;; ==============================
;; taxon-entity
;;; ==============================

;; :ABSTRACT-CLASS
(defclass control-id-taxon-entity (control-id-taxon-entity-type base-control-id)
  ())

;; ;; :ABSTRACT-CLASS
(defclass control-id-taxon-entity-display-name (control-id-taxon-entity control-id-display-name-for-entity-type)
  ())
(defclass control-id-taxon-entity-indexed-number (control-id-taxon-entity control-id-indexed-number)
  ())

(defclass control-id-taxon (control-id-taxon-entity)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'taxon-entity))
   (control-id-namespace  
    :initform  (system-identity-uuid *control-id-taxon-namespace*))))

(defclass control-id-display-taxon (control-id-taxon control-id-taxon-entity-display-name)
  ())

(defclass control-id-indexed-taxon (control-id-taxon control-id-taxon-entity-indexed-number)
  ())


;;; ==============================
;; location-entity
;;; ==============================

;; (make-instance 'control-id-location-entity)

(defclass control-id-location-entity (control-id-location-entity-type base-control-id)
  ((control-id-namespace  
    :initform  (system-identity-uuid *control-id-location-namespace*))))

;; :NOTE This is tricky because "New York" and "New York" refer to two separate
;; location entities, e.g. one is a state the other is a city.
;; :ABSTRACT-CLASS
(defclass control-id-location-entity-display-name (control-id-location-entity control-id-display-name-for-entity-type)
   ())
;;   
;; :ABSTRACT-CLASS
(defclass control-id-location-entity-indexed-number (control-id-location-entity control-id-indexed-number)
  ())

;; :TODO finish the subclasses
(defclass control-id-display-location (control-id-location-entity control-id-display-name-for-entity-type)
  ;; *control-id-location-namespace*
  ;; ((control-id-of-class-type  :initform (%find-control-id-class-or-lose 'location-entity)))
  ;; ((control-id-of-class-type  :initform (%find-control-id-class-or-lose 'location-entity-unverified)))
  ;; ((control-id-of-class-type  :initform (%find-control-id-class-or-lose 'location-entity-verified)))
  ;; ((control-id-of-class-type  :initform (%find-control-id-class-or-lose 'location-entity-imagined)))
  ()
  )

;; :NOTE The location class is new so we realy don't need this class and should add it unless needed.
;; (defclass control-id-indexed-location (control-id-location-entity control-id-indexed-number)
;;   ())

;; ((control-id-of-class-type
;;   :initform (%find-control-id-class-or-lose 'location-entity-verified)))



;;; ==============================
;; naf-entity display names
;;; ==============================
;;

(defclass control-id-naf-entity (control-id-naf-entity-type base-control-id)
  ())

;; :ABSTRACT-CLASS
(defclass control-id-naf-entity-display-name (control-id-naf-entity control-id-display-name-for-entity-type)
  ())
(defclass control-id-naf-entity-indexed-number (control-id-naf-entity control-id-indexed-number)
  ())

(defclass control-id-naf-entity-artist (control-id-naf-entity)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'naf-entity-artist))
   (control-id-namespace  
    :initform  (system-identity-uuid *control-id-artist-namespace*))))

(defclass control-id-display-artist (control-id-naf-entity-artist control-id-naf-entity-display-name)
  ())

(defclass control-id-indexed-artist (control-id-naf-entity-artist control-id-naf-entity-indexed-number)
  ())

(defclass control-id-naf-entity-author (control-id-naf-entity)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'naf-entity-author))
   (control-id-namespace  
    :initform  (system-identity-uuid *control-id-author-namespace*))))

(defclass control-id-display-author (control-id-naf-entity-author control-id-naf-entity-display-name)
  ())

(defclass control-id-indexed-author (control-id-naf-entity-author control-id-naf-entity-indexed-number)
  ())

(defclass control-id-naf-entity-person (control-id-naf-entity)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'naf-entity-person))
   (control-id-namespace  
    :initform  (system-identity-uuid *control-id-person-namespace*))))

(defclass control-id-display-person (control-id-naf-entity-person control-id-naf-entity-display-name)
  ())

(defclass control-id-indexed-person (control-id-naf-entity-person control-id-naf-entity-indexed-number)
  ())

(defclass control-id-naf-entity-brand (control-id-naf-entity)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'naf-entity-brand))
   (control-id-namespace  
    :initform  (system-identity-uuid *control-id-brand-namespace*))))

(defclass control-id-display-brand (control-id-naf-entity-brand control-id-naf-entity-display-name)
  ())

(defclass control-id-indexed-brand (control-id-naf-entity-brand control-id-naf-entity-indexed-number)
  ())

(defclass control-id-naf-entity-publication (control-id-naf-entity)
  ((control-id-of-class-type
    :initform (%find-control-id-class-or-lose 'naf-entity-publication))
   (control-id-namespace  
    :initform  (system-identity-uuid *control-id-publication-namespace*))))

(defclass control-id-display-publication (control-id-naf-entity-publication control-id-naf-entity-display-name)
  ())

(defclass control-id-indexed-publication (control-id-naf-entity-publication control-id-naf-entity-indexed-number)
  ())

;; :NOTE or subclass control-id-display-publication
;; (defclass control-id-display-publication-full (control-id-naf-entity-display-name)
;;   ()
;;   )

;;; ==============================
;;
;; FAILED idea - 2011-09-30
;; (defun add-class-uuid-and-identity-to-hash (class-symbol)
;;   ;; :NOTE This works, but it has a problem in that if we ever change the 
;;   ;; `cl:class-name' of CLASS-SYMBOL we loose!
;;   ;;  We could signal an error :around (setf class-name) or we could just
;;   ;;  manipulate (setf class-name) to not actually do anything
;;   ;; The problem is that we take teh string identity of a symbol to generate 
;;   ;; the UUID but that UUID will no longer remain valid if we alter the
;;   ;; print-name of the CLASS-SYMBOL
;;   ;;
;;   ;; (defvar *tt--dbc-class->uuids-lookup* (make-hash-table :test 'eq)
;;   ;; "mapping of class-symbol -> system-identity-uuid objects")
;;   ;; 
;;   ;; (defvar *tt--dbc-global* (unicly:make-hash-table-uuid))
;;   ;;
;;   ;; (add-class-uuid-and-identity-to-hash 'base-entity)
;;   ;;
;;   ;; (gethash (make-v5-uuid (system-identity-uuid *system-object-uuid-base-namespace*) (string 'base-entity))
;;   ;;          *tt--dbc-global*)
;;   ;; => BASE-ENTITY, T
;;   ;;
;;   ;; (gethash
;;   ;;  (gethash (make-v5-uuid (system-identity-uuid *system-object-uuid-base-namespace*) (string 'base-entity))
;;   ;;          *tt--dbc-global*)
;;   ;;  *tt--dbc-class->uuids-lookup*)
;;   ;;
;;   ;; #<SYSTEM-OBJECT-UUID 
;;   ;;     :SYSTEM-IDENTITY             BASE-ENTITY
;;   ;;     :SYSTEM-IDENTITY-UUID        d8aef455-ebb6-54e6-873d-174b49c4bf64 >  
;;   (let* ((the-class-base-entity  (make-instance class-symbol))
;;          (sym-for-base-entity    (class-name (class-of the-class-base-entity)))
;;          (sys-obj-uuid           (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
;;                                                           :control-id      sym-for-base-entity))
;;          (inverter '()))
;;     (setf inverter
;;           (setf (gethash (system-identity sys-obj-uuid) *tt--dbc-class->uuids-lookup* )
;;                 sys-obj-uuid))
;;     (setf (gethash (system-identity-uuid inverter)  *tt--dbc-global*)
;;           (system-identity inverter))))
;;
;;; ==============================

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
