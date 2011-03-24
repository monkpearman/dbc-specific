;;; :FILE-CREATED <Timestamp: #{2011-03-01T16:35:31-05:00Z}#{11092} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-regexps.lisp
;;; ==============================

;;; ==============================
;; :NOTES
;; cl-ppcre::case-sensitive
;; (let ((scanner (cl-ppcre:create-scanner "abc")))
;;    (type-of scanner))
;; (cl-ppcre:create-scanner "abc")
;;; ==============================
;; :NOTE Consider use of `fare-matcher' for matching name-forms??? 
;; from fare-matcher
;; letm pattern form lexical-scoped-body
;; (letm 
;;  ;; <PATTERN>
;;  (values (accessor* ((like-when msg (keywordp msg)) command))
;;          err?) 
;;  ;; <FORM>
;;  (read-command)
;;  ;; <LEXICAL-SCOPED-BODY>
;;  (if err?
;;      "ouch"
;;    (list msg)))
;;; ==============================



;;; ==============================
(in-package #:dbc)
;; *package*


;;; ==============================
;;; :GENERIC-FUNCTIONS
;;; ==============================

(defgeneric regexp-match-entity-class (obj &key)
  (:documentation
   #.(format nil
 "Return the entity-class for OBJ.~%~
:SEE-ALSO `entity-regexp-subclass-allocation', `entity-regexp',
`regexp-match-entity-class', `regexp-match-entity-db',
`regexp-match-matcher-db', `regexp-match-container-type',
`regexp-match-container-uuid', `regexp-matcher'.~%►►►~%")))

(defgeneric regexp-match-entity-db (obj &key)
  (:documentation 
   #.(format nil
   "Return the entity-db lookup table for OBJ.~%~
:SEE-ALSO `entity-regexp-subclass-allocation', `entity-regexp',
`regexp-match-entity-class', `regexp-match-entity-db',
`regexp-match-matcher-db', `regexp-match-container-type',
`regexp-match-container-uuid', `regexp-matcher'.~%►►►~%")))

(defgeneric regexp-match-matcher-db (obj &key)
  (:documentation 
   #.(format nil
      "Return the matcher-db lookup table for OBJ.~%~
:SEE-ALSO `entity-regexp-subclass-allocation', `entity-regexp', 
`regexp-match-entity-class', `regexp-match-entity-db',
`regexp-match-matcher-db', `regexp-match-container-type',
`regexp-match-container-uuid', `regexp-matcher'.~%►►►~%")))

(defgeneric regexp-match-container-type (obj &key)
  (:documentation 
   #.(format nil 
"Return the container type for OBJ's matcher.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%►►►~%")))

(defgeneric (setf regexp-match-container-type) (container-type obj &key)
  (:documentation 
   #.(format nil
"Set the CONTAINER-TYPE for OBJ matcher.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%►►►~%")))

(defgeneric regexp-match-container-uuid (obj &key)
  (:documentation
   #.(format nil 
"Return the UUID of the container holding a matcher for OBJ.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%►►►~%")))

;; :NOTE This one probably needs additional options e.g. method-combination, etc.
;; It will almost certainly need an pre-emptive around method to prevent
;; inadverdent destruction of UUID's
(defgeneric (setf regexp-match-container-uuid) (container-id obj &key)
  (:documentation 
   #.(format nil
   "Set the match-container-uuid for the container holding OBJ's matcher.~%~
    Specializers should take special care to ensure that they don't overwrite an existing UUID.~%~
    An OBJ's UUID should be treated as an immutable constant in almost all circumstances.~%~
    Therefor, the intent of this function is to mediate generation of UUID's run~%~
    :after initialize-instance and/or when an instance is obsoleted with~%~
    `cl:make-instances-obsolete'.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%►►►~%")))

(defgeneric regexp-matcher (obj &key)
  (:documentation 
   #.(format nil
"Return OBJ's matcher.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%►►►~%")))

(defgeneric (setf regexp-matcher) (matcher obj &key)
  (:documentation 
   #.(format nil
   "Set OBJ's matcher.~%~
    Speacializers should take care to verify that matcher can be contained of its~%~
    specified container type.~%
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%►►►~%")))


;;; ==============================
;;; :CLASS-DEFINITIONS
;;; ==============================

(defclass base-regexp (base-dbc)
  ()
  (:documentation 
   #.(format nil
"Base class for matching control names of DBC entity instances.~%~@
:SEE-ALSO .~%►►►~%")))

;;; ==============================
;; subclass-match-entity-class  <-> regexp-match-entity-class
;; subclass-match-entity-db     <-> regexp-match-entity-db
;; subclass-match-matcher-db    <-> regexp-match-matcher-db
(defclass entity-regexp-subclass-allocation (base-regexp)
  ((;; entity-regexp slot match-entity-class
    subclass-match-entity-class
    :initarg :subclass-match-entity-class
    :initform nil ;;
    :documentation
    #.(format nil 
       "Instantiate to a corresponding global class allocated variable value per~%~
        subclass of base-regexp.~%~@
        This slot corresponds to the MATCH-MATCHER-CLASS slot of ENTITY-REGEXP class.~%~@
        Subclasses should access slot-value with a method specialized on~%~
        `regexp-match-entity-class' and should not establish direct or indirect setf~%~
        methods on the slot-value.~%"))
   (;; entity-regexp slot match-entity-db 
    subclass-match-entity-db
    :initarg :subclass-match-entity-db
    :initform nil
    :documentation
    #.(format nil 
       "Instantiate to a corresponding global class allocated variable value per~%~
        subclass of base-regexp.~%~@
        This slot corresponds to the MATCH-MATCHER-DB slot of ENTITY-REGEXP class.~%
        Subclasses should access slot-value with a method specialized on~%~
        `regexp-match-entity-db' and should not establish direct or indirect setf~%~
        methods on the slot-value.~%"))
   (;; entity-regexp slot match-matcher-db
    subclass-match-matcher-db
    :initarg :subclass-match-matcher-db
    :initform nil
    :documentation
    #.(format nil 
       "Instantiate to a corresponding global class allocated variable value per~%~
        subclass of base-regexp.~%~@
        This slot corresponds to the MATCH-MATCHER-DB slot of ENTITY-REGEXP class.~%~
        Subclasses should access slot-value with a method specialized on~%~
        `regexp-match-matcher-db' and should not establish direct or indirect setf~%~
        methods on the slot-value.~%")))
  (:documentation 
   #.(format nil 
      "Instances of this class hold the class allocated slot values that subclasses of~%~
       the ENTITY-REGEXP class should indirect access through.~%~
       The intent of this class is to obfuscate access and instantiation of the global~%~
       variables that ENTITY-REGEXP subclasses must instantatiate and access but should~%~
       not expose via direct :reader :write :accesor methods.~%")))

(defclass entity-regexp (base-regexp)
  ((;; global-per-subclass access with regexp-match-entity-class
    ;; entity-regexp-subclass-allocation subclass-match-entity-class
    match-entity-class
    :initarg :match-entity-class 
    :initform nil
    :documentation 
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
                  methods on this slot.~%"))
   (;; global-per-subclass access with regexp-match-entity-db
    ;; entity-regexp-subclass-allocation subclasses-match-entity-db
    match-entity-db
    :initarg :match-entity-db
    :initform nil
    :documentation
    #.(format nil "The symbol holding a lookup table of match-container-uuid/entity-instance-uuid pairs.~%~@
                  This likely names a special variable and prob. of type `cl:hash-table'.~%~@
                  For each regexp subclass there is a corresponding MATCH-ENTITY-DB regardless of~@
                  whether that subclass might share a MATCH-ENTITY-CLASS with other subclasses.~%~%~@
                  For example, two sibling subclsses R-1 and R-2 might both match artist NAF~@
                  entities and share the same MATCH-ENTITY-CLASS:~%~@
                  - R-1 has a MATCH-CONTAINER which is an CL-PPCRE closure matching artist NAFs~@
                    by their control name;~%~@
                  - R-2 has a MATCH-CONTAINER which is a list of strings to map as regexps with~@
                    each string matching an artist enity by a known alternative name forms.~%~@
                  R-1 and R-2 will maintain a separate MATCH-ENTITY-DB because:~%~@
                  - It makes dispatching on the keyed UUID value type of a matcher easier.~@
                    For example, R-1 matchers are likely more efficient per their~@
                    match-container-type than those of R-2.~%~@
                  - It ensures any potential destrucive actions made in lieu of a match may~@
                    occur in the correct order.~%~@
                    For example, R-1 matchers are likely more specific than those of R-2 and~@
                    likely it is important that all R-1 matchers sharing the same~@
                    MATCH-ENTITY-CLASS be invoked before any of the R-2 matchers in order to~@
                    preserve the integrity of the primary control-names.~%~@
                    This slot is global-per-subclass.~%
                    Subclasses should instantiate this slot with :allocation class.~%~@
                    Its class allocated value should be indirected through~
                    access to the SUBCLASS-MATCH-ENTITY-DB slot of an instance
                    of ENTITY-REGEXP-SUBCLASS-ALLOCATION class.~%~@
                 Subclasses should access slot-value with a method specialized on~%~
                 `regexp-match-entity-db' and should not establish direct or indirect setf~%~
                 methods on this slot.~%"))
   (;; global-per-subclass, access with regexp-match-matcher-db
    ;; entity-regexp-subclass-allocation subclass-match-matcher-db
    match-matcher-db
    :initarg :match-matcher-db
    :initform nil
    :documentation
    #.(format nil
              "Symbol holding a lookup table of match-container-uuid/matcher key value pairs.~%~@
               This likely names a special variable and is probably of type `cl:hash-table'.~%~@
               For each regexp subclass there is a corresponding MATCH-MATCHER-DB regardless of~@
               whether that subclass might share a MATCH-ENTITY-CLASS with other subclasses.~@
               The keys into the MATCH-MATCHER-DB are shared with the keys of the MATCH-ENTITY-DB.
               However, where the latter maps to the UUID of a class instance, the values of in a 
               MATCH-MATCHER-DB pointo to a matcher which is held in a datastructure specified by 
               MATCH-CONTAINER-TYPE.~%~@
               This slot is global per subclass.~%
               Subclasses should instantiate this slot with :allocation class.~%~@
               Its class allocated value should be indirected through
               access to the SUBCLASS-MATCH-MATCHER-DB slot of an instance
               of ENTITY-REGEXP-SUBCLASS-ALLOCATION class.~%
               Subclasses should access slot-value with a method specialized on~%~
               `regexp-match-matcher-db' and should not establish direct or indirect setf~%~
               methods on this slot.~%"))
   (match-container-type             ;; local-per-instance, access with regexp-match-container-type
    :initarg :match-container-type
    :initform nil
    :documentation
    #.(format nil  "The type of matcher containing the regexp(s) of an instance.~%~@
                    Possible values might include:~%~% ~
                     closure list string array hash-table~%~@
                    This slot is local per subclass instance.~%
                    Subclasses should access slot-value with a method specialized on.~%~
                    `regexp-match-container-type'. This slot is setfable.~%"))
   (match-container-uuid         ;; local-per-instance, access with regexp-match-container-id
    :initarg :match-container-id
    :initform nil
    :documentation
    #.(format nil "A UUID associated with a regexp matcher's container.~%~@
                   This UUID is the key in a key/value pair of the form:~%~% ~
                   <UUID> <CONTAINED-MATCHER>~%~@
                   This slot is local per subclass instance.~%~
                   Subclasses should access slot-value with a method specialized on~%~
                   `regexp-match-container-uuid'.~%~
                   This slot is setfable. Specializers should take special care to ensure that~%~
                   they don't overwrite an existing UUID.  An OBJ's UUID should be treated as an~%~
                   immutable constant in almost all circumstances.  Therefor, the intent of this~%~
                   function is to mediate generation of UUID's run :after initialize-instance~%~
                   and/or when an instance is obsoleted with `cl:make-instances-obsolete'.~%"))
   (match-entity-matcher           ;; local-per-instance, access with regexp-matcher
    :initarg :match-entity-matcher
    :initform nil
    :documentation  
    #.(format nil 
              "A matcher object for matching an entity.~%~@
               Its type should should be as specified by MATCH-CONTAINER-TYPE.~%~@
               Its values is accessed by association with the MATCH-CONTAINER-UUID in the~@
               applicable MATCH-MATCHER-DB.~%~@
               It should match an entity with a UUID value in the applicable MATCH-ENTITY-DB
               for the instances MATCH-ENTITY-CLASS.~%~@
               This slot is local per subclass instance.~%~
               Subclasses should access slot-value with a method specialized on.~%~
               `regexp-matcher'. This slot is setfable.~%")))
  (:documentation 
   #.(format nil
      "Class implementing the core slots for implementatin of subtyped entity matchers.~%~@
       Don't instantiate directly from this class.~%~@
:SEE-ALSO ~%►►►~%")))

;; (make-instance 'entity-regexp 
;;                :match-entity-class 'liza-terry 
;;                :match-entity-db *liza-terry-db* 
;;                :match-matcher-db *liza-terry-matcher-db* 
;;                :match-container-type 'closure
;;                :match-container-uuid <GENERATE>
;;                :match-entity-matcher (cl-ppcre:create-scanner "liza-terry 342"))

;;; ==============================
;;; 
;;; ==============================
;; #:*parsed-field-name-regexp-matcher-db*
;; #:parsed-field-name-regexp
(defvar *parsed-field-name-regexp-matcher-db* nil) ;; (make-hash-table)

(defclass parsed-field-name-regexp (entity-regexp)
  ()
  (:documentation 
   #.(format nil
"An `entity-regexp' subclass for matching XML-refs parsed field-names.~%~
:SEE-ALSO .~%►►►~%")))



;;; ==============================
;;; :THEMES
;;; ==============================
(defvar *theme-entity-regexp-matcher-db* nil) ;;(make-hash-table))

(defvar *theme-entity-regexp-entity-db* nil) ;;(make-hash-table))

(defclass theme-entity-regexp (entity-regexp)
  ;; match-entity-class
  ;; match-container-uuid
  ;; match-container-type   
  ;; match-entity-db
  ;; match-matcher-db
  ()
  (:documentation 
   #.(format nil
"An `entity-regexp' sub-class for themes.~%~@
:SEE-ALSO `base-theme-entity'.~%►►►")))


;;; ==============================
;;; :CATERORIES
;;; ==============================

(defvar *category-entity-regexp-matcher-db* nil) ;;(make-hash-table))

(defvar *category-entity-regexp-entity-db* nil) ;;(make-hash-table))

(defclass category-entity-regexp (entity-regexp)
  ;; match-entity-class
  ;; match-container-uuid
  ;; match-container-type   
  ;; match-entity-db
  ;; match-matcher-db
  ()
  (:documentation
   #.(format nil
             "An `entity-regexp' sub-class for DBC categories.~%~
:SEE-ALSO `base-category-entity'.~%►►►")))


;;; ==============================
;;; :NAFS
;;; ==============================
(defclass naf-entity-type-regexp (entity-regexp)
  ;; match-entity-class
  ;; match-container-uuid
  ;; match-container-type   
  ;; match-entity-db
  ;; match-matcher-db
  ;; match-entity-class-type 
  ()
  (:documentation 
   #.(format nil
             "An `entity-regexp' sub-class for DBC NAF entities.~%~@
              Instances subclassed from `base-naf-entity' with should instantiate instances of~%~
              both `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp' to enable~%~
              system wide xrefing/indexing of entity name-form occurences.~%~@
              :SEE-ALSO .~%►►►")))

(defclass naf-entity-control-name-regexp (naf-entity-type-regexp)
  (
   ;; (match-entity-container-type :initform 'closure)
   ;; (match-entity-matcher
   )
  (:documentation 
   #.(format nil "A `naf-entity-type-regexp' subclass for matching primary NAF control-names.~%~@
                  Naf control-names are considered canonical and are _rarely_ mutated.~%~@
                  The matchers named by instances of this class should run _before_ other regexps.~%~@
                  The MATCH-ENTITY-CONTAINER-TYPE slot of this class is defaulted to 'closure with~@
                  the intent that the MATCH-ENTITY-MATCHER will be implemented as a CL-PPCRE closure.~%~@
                 :SEE-ALSO `base-naf-entity', `naf-entity-alt-name-regexp'.~%►►►")))

(defclass naf-entity-alt-name-regexp (naf-entity-type-regexp)
  ( 
   ;;(match-entity-container-type :initform 'list)
   )
  (:documentation 
   #.(format nil "A `naf-entity-type-regexp' subclass for NAFs with matchable alternative name forms.~%~@
                  Alternative name forms might include:~%~% ~
                   pseudonyms, also knowns, used-fors, variant spellings, rotated name forms, etc.~%~@
                 The matchers named by instances of this class should be run _only_after_all_~
                 control name matchers have had a chance to run and should _never_ destructively~
                 modify the things they match.~%~@
                 This constraint is intented to prevent corruption of control-names which should~
                 always have precedence of an alternative name form.~%~@
                 :SEE-ALSO `base-naf-entity', `naf-entity-control-name-regexp'.~%►►►~%")))

;;; ==============================
;;; :NAF-ARTIST
;;; ==============================
(defvar *naf-artist-entity-control-regexp-matcher-db* nil) ;;(make-hash-table))

(defvar *naf-artist-entity-regexp-entity-db* nil) ;;(make-hash-table))

;; *package*
;; (defparameter  *tt--eg-neacr*
;;   (make-instance 'naf-entity-artist-control-regexp))

;; :match-entity-class
(defclass naf-entity-artist-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation 
   #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF artist entities.~%~@
:SEE-ALSO .~%►►►~%")))

(defclass naf-entity-artist-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation 
   #.(format nil
"A `naf-entity-alt-name-regexp' subclass for DBC NAF artist entities.~%~@
:SEE-ALSO .~%►►►~%")))


;;; ==============================
;;; NAF-PERSON
;;; ==============================
(defvar *naf-person-entity-control-regexp-matcher-db* nil) ;;(make-hash-table))

(defvar *naf-person-entity-regexp-entity-db* nil) ;;(make-hash-table))

(defclass naf-entity-person-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation 
   #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF person entities.~%~@
:SEE-ALSO .~%►►►~%")))

(defclass naf-entity-person-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation
   #.(format nil
 "A `naf-entity-control-name-regexp' subclass for DBC NAF  person entities.~%~@
:SEE-ALSO .~%►►►~%")))

;;; ==============================
;;; :NAF-AUTHOR
;;; ==============================

(defvar *naf-author-entity-control-regexp-matcher-db* nil) ;;(make-hash-table))

(defvar *naf-author-entity-regexp-entity-db* nil) ;;(make-hash-table))

(defclass naf-entity-author-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation 
   #.(format nil
   "A `naf-entity-control-name-regexp' subclass for DBC NAF author entities.~%~@
:SEE-ALSO .~%►►►~%")))

(defclass naf-entity-author-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation
   #.(format nil
             "A `naf-entity-alt-name-regexp' subclass for DBC NAF author entities.~%~@
:SEE-ALSO .~%►►►~%")))

;;; ==============================
;;; :NAF-BRAND
;;; ==============================

(defvar *naf-brand-entity-control-regexp-matcher-db* nil) ;;(make-hash-table))

(defvar *naf-brand-entity-regexp-entity-db* nil) ;;(make-hash-table))

(defclass naf-entity-brand-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation 
   #.(format nil
"A `naf-entity-control-name-regexp' subclass for DBC NAF brand entities.~%~@
:SEE-ALSO .~%►►►~%")))

(defclass naf-entity-brand-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation 
   #.(format nil
   "A `naf-entity-alt-name-regexp' subclass for DBC NAF brand entities.~%~@
:SEE-ALSO .~%►►►~%")))

;;; ==============================

(defvar *naf-publication-entity-control-regexp-matcher-db* nil) ;;(make-hash-table))
(defvar *naf-publication-entity-regexp-entity-db* nil) ;;(make-hash-table))

(defclass naf-entity-publication-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation 
   #.(format nil
             "A `naf-entity-control-name-regexp' subclass for DBC NAF publication entities.~%~@
:SEE-ALSO `naf-entity-publication'.~%►►►~%")))



;;; ==============================
;;; :FUNCTIONS
;;; ==============================
(defun make-entity-regexp-subclass-allocation-if (match-entity-class
                                                  match-entity-db
                                                  match-matcher-db)
  ;; :NOTE We may have to declare these special if they aren't seen in the 
  ;;  outside the lexical enverionment 
  ;;(declare (special match-entity-db match-matcher-db ))
  (and
   (or match-entity-class
       (error "must supply value for keyword MATCH-ENTITY-CLASS"))
   (or match-entity-db
       (error "must supply value for keyword MATCH-ENTITY-DB"))
   (or match-matcher-db
       (error "must supply value for keyword MATCH-MATCHER-DB"))
   (or (find-class match-entity-class)
       (error "Arg MATCH-ENTITY-CLASS does not return for `cl:find-class'"))
   (or (boundp match-entity-db)
       (error "Arg MATCH-ENTITY-DB not `cl:boundp'"))
   (or (hash-table-p (symbol-value match-entity-db))
       (error "Arg MATCH-ENTITY-DB not `cl:hash-table-p'"))
   (or (boundp match-matcher-db)
       (error "Arg MATCH-MATCHER-DB not `cl:boundp'"))
   (or (hash-table-p (symbol-value match-matcher-db))
       (error "Arg MATCH-MATCHER-DB not `cl:hash-table-p'"))
   `(:subclass-match-entity-class ,match-entity-class
     :subclass-match-entity-db    ,match-entity-db 
     :subclass-match-matcher-db ,match-matcher-db)))

(defun make-entity-regexp-subclass-allocation (&key
                                               match-entity-class
                                               match-entity-db
                                               match-matcher-db)
  (let ((chk-keys 
         (make-entity-regexp-subclass-allocation-if 
          match-entity-class match-entity-db match-matcher-db)))
    (apply #'make-instance 'entity-regexp-subclass-allocation
           chk-keys)))

;;; ==============================
;; :TODO Following three should signal an error if they don't find a value b/c
;; these are intended to run interception for the entity-regexp subclasses
;; They should be called before/after/around??? the first instance of an
;; entity-regexp class is initialized to set the class allocated slots
;; e.g. entity-regexp sub-classes defined as:
;; ((match-entity-class :allocation 'class)
;;  (match-entity-db    :allocation 'class)
;;  (match-matcher-db   :allocation 'class))
;;
;; If OBJ's subclass-match-entity-class slot is bound and its slot-value finds
;; an existing class with the same class name eq that slot-value return as if by
;; `cl:values' the class object and the symbol naming it.
;;
;; (regexp-match-entity-class *base-test-entity-regexp-instance*)
;; (multiple-value-list (regexp-match-entity-class *base-test-entity-regexp-instance*))
(defmethod regexp-match-entity-class ((obj entity-regexp-subclass-allocation) &key)
  (let* ((if-bnd
          (and (slot-boundp obj 'subclass-match-entity-class)
               (slot-value obj  'subclass-match-entity-class)))
         (fnd-class (and if-bnd 
                         (mon:ref-bind fc (find-class if-bnd)
                           (and (eql (class-name fc) if-bnd)
                                fc)))))
    (and if-bnd fnd-class
         (values fnd-class if-bnd))))

;; If OBJ's subclass-match-entity-db slot is bound and its slot-value is
;; `cl:hash-table-p' return as if by `cl:values' the hash-table object and the
;; symbol naming it.
;; (regexp-match-entity-db *base-test-entity-regexp-instance*)
;; (multiple-value-list (regexp-match-entity-db *base-test-entity-regexp-instance*))
(defmethod regexp-match-entity-db ((obj entity-regexp-subclass-allocation) &key)
  (let ((if-bnd
         (and (slot-boundp obj 'subclass-match-entity-db)
              (slot-value obj 'subclass-match-entity-db)))
        (then-get-hsh nil))
    (and (symbolp if-bnd)
         (setf then-get-hsh 
               (symbol-value if-bnd)))
    (and then-get-hsh 
         (hash-table-p then-get-hsh)
         (values then-get-hsh if-bnd))))

;; If OBJ's subclass-match-matcher-db slot is bound and its slot-value is
;; `cl:hash-table-p' return as if by `cl:values' the hash-table object and the
;; symbol naming it.
;; (regexp-match-matcher-db *base-test-entity-regexp-instance*)
;; (multiple-value-list (regexp-match-entity-db *base-test-entity-regexp-instance*))
(defmethod regexp-match-matcher-db ((obj entity-regexp-subclass-allocation) &key)
  (let ((if-bnd
         (and (slot-boundp obj 'subclass-match-matcher-db)
              (slot-value obj  'subclass-match-matcher-db)))
        (then-get-hsh nil))
    (and (symbolp if-bnd)
         (setf then-get-hsh 
               (symbol-value if-bnd)))
    (and then-get-hsh 
         (hash-table-p then-get-hsh)
         (values then-get-hsh if-bnd))))

;;; ==============================


;;; ==============================
;; (make-instance 'entity-regexp 
;;                :match-entity-class 'liza-terry 
;;                :match-entity-db *liza-terry-db* 
;;                :match-matcher-db *liza-terry-matcher-db* 
;;                :match-container-type 'closure
;;                :match-container-uuid <GENERATE>
;;                :match-entity-matcher (cl-ppcre:create-scanner "liza-terry 342"))
;;; ==============================
;; match-entity-class    ;; The class of the the thing matched e.g. an NAF-ARTIST-ENTITY
;; match-entity-db       ;; A special variable of key/vals (match-container-uuid . entity-instance-uuid)
;; match-matcher-db      ;; A special variable of key/vals (match-container-uuid . match-entity-matcher)
;; match-container-type  ;; the type-of the match-entity-matcher 
;; match-container-uuid  ;; uuid of the container holding the match-entity-matcher object
;; match-entity-matcher  ;; a matcher object


;; (defun make-instance-naf-entity-artist-control-regexp 
;;     (&key 
;;      ;; match-entity-class ;; global-per-subclass
;;      ;; match-entity-db    ;; global-per-subclass
;;      ;; match-matcher-db   ;; global-per-subclass
;;      match-container-type  ;; local-per-instance
;;      match-container-uuid  ;; local-per-instance
;;      match-entity-matcher  ;; local-per-instance
;;      )



;;; ==============================
;;; :CLASS-REGEXPS-GENERICS-DOCUMENTATION
;;; ==============================


;;; ==============================
;;; :CLASS-REGEXPS-CLASS-DOCUMENTATION
;;; ==============================


;;; ==============================
;;; :CLASS-REGEXPS-VARIABLES-DOCUMENTATION
;;; ==============================

 
;;; ==============================
;;; :CLASS-REGEXPS-FUNCTION-DOCUMENTATION
;;; ==============================

(mon:fundoc 'make-entity-regexp-subclass-allocation-if 
"Verify the keyword arguments for `make-entity-regexp-subclass-allocation'.~%~@
If any of the following constraints are not met signal an error.~%~@
Args MATCH-ENTITY-CLASS, MATCH-ENTITY-DB, and MATCH-MATCHER-DB must each be
non-nil.~%~@
Arg MATCH-ENTITY-CLASS must a class which returns non-nil when given as the
argument to `cl:find-class'.~%~@
Args MATCH-ENTITY-DB and MATCH-MATCHER-DB must each satisfy `cl:hash-table-p'.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'make-entity-regexp-subclass-allocation
"Instantiate an instance of the ENTITY-REGEXP-SUBCLASS-ALLOCATION class.~%
Keyword MATCH-ENTITY-CLASS is the class-name of that matchers of a subclass of
the ENTITY-REGEXP class will match.~%
Keyword MATCH-ENTITY-DB is a symbol naming a special variable the value of
which is a table mapping key/value pairs of the form:~%
 match-container-uuid entity-instance-uuid~%~@
Keyword MATCH-MATCHER-DB is a symbol naming a special variable the value of
which is a table mapping  key/value pairs of the form:~%
 match-container-uuid match-entity-matcher~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
