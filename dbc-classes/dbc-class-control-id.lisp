;;; :FILE-CREATED <Timestamp: #{2011-05-21T16:39:04-04:00Z}#{11206} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-control-id.lisp
;;; ==============================

#|

;; The class `base-control-id' is implemented to distinguish different
;; types of controlled identities in classes with slots having 
;; values used for identification puroposes.
;;
;; :NOTE subclasses of `base-control-id' are distinct from those of the class
;; `base-uuid' which defines _canonical_ identities for dbc system objects (as
;;   distinct from the values they are contained of).
;;
;; The class `control-id-display-name' records information for classes with
;; slots wich which record displayable control-ids which identify a namable thing.
;;
;; It does not not duplicate functionality of
;; `control-id-display-name-for-entity-type'.
;; An object might record a display name that is controlled but that object may not itself be an entity.
;;
;; However but some of its subclasses will likely
;;  involve complex interactions in the C-P-L around the
;;  `display-name-for-entity' and `display-name-for-entity-of-type' slot-values.

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

;; (defgeneric control-id-namespace-required (object)
;; (:documentation "Return non-nil when object requires a valid UUID namespace when initialized."))
;;
;; (defgeneric (setf control-id-namespace-required) (boolean object)
;; (:documentation "Return non-nil when object requires a valid UUID namespace upon initialization."))

;; (defgeneric control-id-namespace (object)
;; (:documentation #.(format nil "Access the namespace associted with OBJECT.")))
;;
;; (defgeneric (setf control-id-namespace) (namespace object)
;; (:documentation 
;; #.(format nil "Set the NAMESPACE associated with OBJECT.
;; NAMESPACE should satisfy `unicly:unique-universal-identifier-p'"))

;; (initialize-instance instance &rest initargs &key argument-precedence-order
;;                      lambda-list buffer-length initialization-vector padding
;;                      mode key callback compress-fun distance-fun length-fun
;;                      literal-fun doc-hash-table literal-char-code-limit uri
;;                      chained-handler &allow-other-keys)
;; (defmethod initialize-instance :before


(defclass base-control-id  (base-dbc) ;; base-uuid
  ((control-id-namespace-required
    :documentation 
    #.(format nil "Whether object requires a valid UUID namespace when initialized."))
   (control-id-namespace 
    :documentation
    #.(format nil "The namespace appropriate to the control-id for object.~%~@
It is used when generating v5 UUIDs assocated with a control-id."))
   )
  (:documentation
  #.(format nil
            "The class `base-control-id' is implemented to distinguish different~%~@
types of controlled identities in classes with slots whose specify~%~@
values used for identification puroposes.~%~@
:NOTE subclasses of `base-control-id' are distinct from those of the class
`base-uuid' which defines _canonical_ identities for dbc system objects \(as
distinct from the values they are contained of\).
:EXAMPLE~% ~
 \(mon:class-subclasses \(find-class 'base-control-id\)\)~%~@
:SEE-ALSO .~%▶▶▶")))

;;
(defclass control-id-display-name (base-control-id)
  ()
  (:documentation 
   #.(format nil
             "The class `control-id-display-name' records information for classes with slots
which record displayable control-ids which identify a nameable thing.~%~@
:NOTE A nameable thing is not necessarily an entity.~%~@
:EXAMPLE~%~@
 \(mon:class-subclasses \(find-class 'base-control-id-dis\)\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")))

;; 
(defclass control-id-display-name-for-entity-type (control-id-display-name)
  ((control-id-namespace-required :initform t))
  (display-name-for-entity
    ;; :initarg :display-name-for-entity
    ;; :initform  ;; Should satisfy `mon:string-not-null-empty-or-all-whitespace-p'
    ;; :documentation #.(format nil "")
    )
  (display-name-for-entity-of-type
   ;; :initarg :entity-type-for-display-name
   ;; :initform (find-class 
   :documentation 
   #.(format nil
             "The type of entity identified by the DISPLAY-NAME-FOR-ENTITY's slot-value.~%~@
This slot should be instantiated to a class-object sutibable for use as an~%~@
argument to `cl:find-class' and which returns a class or subclass which is a~%~@
member in the set of class-names returned by the following forms \(or their expansions\):~% ~
 \(mon:class-subclasses \(find-class 'base-entity\)\)~% ~
 \(member \(class-name \(find-class 'base-naf-entity\)\)
         \(mon:class-subclasses \(find-class 'base-entity\)\)\)~% ~
:NOTE There may be multiple different entities with a DISPLAY-NAME slot-value which are `cl:string='.~%~@
Likewise, such co-references may occur in both the same class and/or an entirely different class."))
  :documentation
  #.(format nil
            "Instances of this class hold information about an entities displayable name.~%~@
:EXAMPLE~% ~
 \(mon:class-subclasses \(find-class 'control-id-display-name-for-entity-type\)\)~%~@
:NOTE Instances which subclassed from the class `dbc:base-entity' _must_ have a display-name.~%~@
instantiated to an instance of the class `dbc:display-name-for-entity'.~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶"))

;; control-id-display-artist-namespace

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
;;; EOF
