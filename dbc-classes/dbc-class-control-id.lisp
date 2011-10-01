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

 Because we intend that all objects in the DBC system will be referenced by
 thier UUID we need a way to _de-reference_ the to a non-uuid display name in
 day to day use.

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

 (make-v5-uuid *artist-namespace*             "Chanel (Gabrielle, \"Coco\"))
 (make-v5-uuid *fashion-designer-namespace*   "Chanel (Gabrielle, \"Coco\"))

 ; ==============================

- base-control-id                           (base-dbc)
-- control-id-display-name                  (base-control-id) ;; String based identity
--- control-id-display-name-for-entity-type (control-id-display-name)
---- control-id-display-artist              (control-id-display-name-for-entity-type)
---- control-id-display-brand               (control-id-display-name-for-entity-type)
---- control-id-display-author              (control-id-display-name-for-entity-type)
---- control-id-display-person              (control-id-display-name-for-entity-type)
---- control-id-display-publication         (control-id-display-name-for-entity-type)
---- control-id-display-location            (control-id-display-name-for-entity-type)
---- control-id-display-technique           (control-id-display-name-for-entity-type)

;; Item refs id-nums should be obfuscated with a UUID and are deprecated!
;; Entity id-nums may occure congruently and are deprecated!
;; Documentation id-nums for entities may occure congruently and are deprecated!
;; The deprecated entity specific slot namespaces should be
;; transformed to their superclass slot equivalent once parsing is finished.
;; e.g. "control-id-doc-num-artist"    -> "control-id-doc-uuid"
;; e.g. "control-id-entity-num-artist" -> "control-id-entity-uuid"

-- control-id-deprecated                 (base-control-id)

--- control-id-item-num                  (control-id-deprecated)

--- control-id-doc-num                   (control-id-deprecated)
---- control-id-doc-num-artist           (control-id-doc-num)
---- control-id-doc-num-brand            (control-id-doc-num)
---- control-id-doc-num-author           (control-id-doc-num)
---- control-id-doc-num-person           (control-id-doc-num)
---- control-id-doc-num-publication      (control-id-doc-num)
---- control-id-display-publication-full (control-id-doc-num)

--- control-id-entity-num                (control-id-deprecated)
---- control-id-entity-num-artist        (control-id-entity-num)
---- control-id-entity-num-author        (control-id-entity-num)
---- control-id-entity-num-brand         (control-id-entity-num)
---- control-id-entity-num-person        (control-id-entity-num)
---- control-id-entity-num-publication   (control-id-entity-num)


-- control-id-db                     (base-control-id)
--- control-id-db-loc                (control-id-db) ;; nb2007017414 | n 98028882 | no 99021790
--- control-id-db-ulan               (control-id-db) ;; 500013504
--- control-id-db-bnf                (control-id-db) ;; FRBNF40421659
--- control-id-db-oclc               (control-id-db) ;; 

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
;; (defgeneric control-id-namespace (object))
;; (generic-doc #'control-id-namespace
;; "Get the namespace associted with OBJECT.
;; :SEE-ALSO `<XREF>'.~%")
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


;; Abstract class
(defclass base-control-id  (base-dbc) ;; base-uuid
  ((control-id-uuid)    
   (control-id-namespace)
   (control-id-identifies)
   ;; Storing class data in conjunctions with UUIDs is prob. a bad idea.
   ;; (control-id-of-instance)
   ;; :NOTE storing these last to may imply that we estable methods which account for updated/changed/redefined instances
   ;; (control-id-instance-class)
   ;; (control-id-class-uuid))
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
It is used as the NAME arg used when generating the the v5 UUID the slot-value.~%~
for control-id-uuid.~%~@
The slot CONTROL-ID-OF-INSTANCE is the UUID of the class instance being identified.~%~@
The slot CONTROL-ID-INSTANCE-CLASS is a symbol designating a class object.~%~@
The slot CONTROL-ID-CLASS-UUID is the UUID of class instance of the entity
identified (e.g. the entity's class-of).~%~@
:EXAMPLE~% ~
 \(mon:class-subclasses \(find-class 'base-control-id\)\)~%~@
:NOTE subclasses of `base-control-id' are distinct from those of the class
`base-uuid' which defines _canonical_ identities for dbc system objects
\(as distinct from the values they are contained of\).~%~@
:SEE-ALSO .~%▶▶▶")))

;; We've extended `control-id-display-name-for-entity-type' because the domain
;; of typed entites is mostly known e.g.:
;;  artists, brands, authors, person, publication, location
;; Other types of objects which will need control-ids may include:
;;  product-items, documentation-items, edit-items, image-items, data-containers etc.
;; These types of things do not really have meaningfull names but they will
;; none-the-less require an interface that allows us to refer to them
;; independent of their UUID identity..
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
 \(mon:class-subclasses \(find-class 'control-id-display-name\)\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")))

;; (defclass control-id-display-name-for-class (control-id-display-name)
;;   ;; control-id-uuid
;;   ;; control-id-namespace
;;   ;; control-id-identifies     -- symbol
;;   ;; control-id-of-instance    -- bad idea
;;   ;; control-id-instance-class -- bad idea
;;   ;; control-id-class-uuid     -- bad idea
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

;; (class-name (find-class 'control-id-display-name-for-entity-type))

(defclass control-id-display-name-for-entity-type (control-id-display-name)
  ;; control-id-uuid
  ;; control-id-namespace
  ;; control-id-identifies  -- string maybe specialized for display. Should satisfy `mon:string-not-null-empty-or-all-whitespace-p'
  ;; control-id-of-instance
  ;; control-id-instance-class
  ;; control-id-class-uuid
  ()
  (:documentation 
   #.(format nil
             "Instances of this class hold information about an entities displayable name.~%~@
The slot CONTROL-ID-INSTANCE-CLASS is a symbol indicating the class of the entity identified by the slot-value CONTROL-ID-IDENTIFIES.~%~@
This slot should be instantiated to a class-object suitable for use as an~%~@
argument to `cl:find-class' and which returns a class or subclass which is a~%~@
member in the set of class-names returned by the following forms \(or their expansions\):~% ~
 \(mon:class-subclasses \(find-class 'base-entity\)\)~% ~
 \(member \(class-name \(find-class 'base-naf-entity\)\)
         \(mon:class-subclasses \(find-class 'base-entity\)\)\)~% ~
:NOTE There may be multiple different entities with a CONTROL-ID-IDENTIFIES slot-value which are `cl:string='.~%~@
Likewise, such co-references may occur in both the same class and/or an entirely different class.
:EXAMPLE~% ~
 \(mon:class-subclasses \(find-class 'control-id-display-name-for-entity-type\)\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")))

;; (find-class (class-name (class-of *control-id-display-artist-namespace*)))

;; control-id-display-artist-namespace

;; :TESTING
;; (defparameter *tt--cida* (make-instance 'control-id-display-artist))
;; (defclass control-id-display-artist (control-id-display-name-for-entity-type)  
;;   ((control-id-namespace 
;;     :initarg :control-id-namespace
;;     :allocation :class))
;;   (:default-initargs :control-id-namespace (symbol-value '*control-id-display-artist-namespace*)))

;; (defmethod initialize-instance 

;; (defun make-control-id-display-artist (display-name entity-of-type)
;; DISPLAY-NAME is a string identifying entity ENTITY-OF-TYPE is the class of the entity.


(defclass control-id-display-artist (control-id-display-name-for-entity-type)  
  ()
  )

(defclass control-id-display-brand  (control-id-display-name-for-entity-type)
  ()
  )

(defclass control-id-display-author (control-id-display-name-for-entity-type)
  ()
  )

(defclass control-id-display-person (control-id-display-name-for-entity-type)
  ()
  )

(defclass control-id-display-publication (control-id-display-name-for-entity-type)
  ()
  )

(defclass control-id-display-location (control-id-display-name-for-entity-type)
  ()
  )

(defclass control-id-display-technique (control-id-display-name-for-entity-type)
  ()
  )

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
;;; EOF
