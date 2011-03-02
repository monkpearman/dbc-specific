;;; :FILE-CREATED <Timestamp: #{2011-03-01T16:35:31-05:00Z}#{11092} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-regexps.lisp
;;; ==============================


;;; ==============================
(in-package #:dbc)

;; *package*

;;; ==============================

(defclass base-regexp (base-dbc)
  (:documentation "Base class for matching control names of dbc entity instances"))

(defclass entity-regexp (base-regexp)
  ((match-entity-class
    :initarg :match-enitity-class 
    :initform nil
    ;; :accessor regexp-match-entity-class ;
    :documentation 
    #.(format nil "The class of entity regexp subclasses match.~%~@
                  For example, regexp instances of a subclass which match artist NAFs by their
                  control name would share the same MATCH-ENTITY-CLASS.~%~@
                  Likewise, regexp instances of a subclass which match artist NAFs by their
                  alternative name forms would share the same MATCH-ENTITY-CLASS, but would
                  maintain a separate MATCH-ENTITY-DB.~%"))
   (match-entity-db
    :initarg :match-entity-db
    :initform nil
    ;; :accessor regexp-match-entity-db
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
                    preserve the integrity of the primary control-names."))
   (match-matcher-db
    :initarg :match-matcher-db
    :initform nil
    ;; :accessor regexp-match-matcher-db
    :documentation
    #.(format nil
              "Symbol holding a lookup table of match-container-uuid/matcher key value pairs.~%~@
               This likely names a special variable and is probably of type `cl:hash-table'.~%~@
               For each regexp subclass there is a corresponding MATCH-MATCHER-DB regardless of~@
               whether that subclass might share a MATCH-ENTITY-CLASS with other subclasses.~@
               The keys into the MATCH-MATCHER-DB are shared with the keys of the MATCH-ENTITY-DB.
               However, where the latter maps to the UUID of a class instance, the values of in a 
               MATCH-MATCHER-DB pointo to a matcher which is held in a datastructure specified by 
              MATCH-CONTAINER-TYPE."))
   (match-container-type
    :initarg :match-container-type
    :initform nil
    ;; :accessor regexp-match-container-type
    :documentation
    #.(format nil  "The type of matcher containing the regexp(s) of an instance.~%~@
                    Possible values might include:~%~% ~
                     closure list string array hash-table"))
   (match-container-uuid
    :initarg :match-container-id
    :initform nil
    ;; :accessor regexp-match-container-id
    :documentation
    #.(format nil "A UUID associated with a regexp matcher's container.~%~@
                  This UUID is the key in a key/value pair of the form:~%~% ~
                   <UUID> <CONTAINED-MATCHER>"))
   (match-entity-matcher 
    :initarg :match-entity-matcher
    :initform nil
    ;; :accessor regexp-matcher
    :documentation  
    #.(format nil 
              "A matcher object for matching an entity.~%~@
               Its type should should be as specified by MATCH-CONTAINER-TYPE.~%~@
               Its values is accessed by association with the MATCH-CONTAINER-UUID in the
               applicable MATCH-MATCHER-DB.~%~@
               It should match an entity with a UUID value in the applicable MATCH-ENTITY-DB
               for the instances MATCH-ENTITY-CLASS.~%~@")))
  (:documentation 
   #.(format nil
      "Class implementing the core slots for implementing subtyped entity matchers.
Don't instantiate directly from this class.")))



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
  (:documentation "An entity-regexp sub-class for themes."))

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
  (:documentation "An entity-regexp sub-class for categories."))



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
  (:documentation "An entity-regexp sub-class for NAFs."))

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
                  the intent that the MATCH-ENTITY-MATCHER will be implemented as a cl-ppcre closure.")))
  
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
                 always have precedence of an alternative name form.")))

;;; ==============================
;;; :NAF-ARTIST
;;; ==============================
(defvar *naf-artist-entity-control-regexp-matcher-db* nil) ;;(make-hash-table))

(defvar *naf-artist-entity-regexp-entity-db* nil) ;;(make-hash-table))

(defclass naf-entity-artist-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation "A `naf-entity-regexp' subclass for artists entities"))

(defclass naf-entity-artist-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation "A `naf-entity-regexp' subclass for artists entities"))


;;; ==============================
;;; NAF-PERSON
;;; ==============================
(defvar *naf-person-entity-control-regexp-matcher-db* nil) ;;(make-hash-table))

(defvar *naf-person-entity-regexp-entity-db* nil) ;;(make-hash-table))

(defclass naf-entity-person-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation "A `naf-entity-regexp' subclass for person entities."))

(defclass naf-entity-person-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation "A `naf-entity-regexp' subclass for person entities."))

;;; ==============================
;;; :NAF-AUTHOR
;;; ==============================

(defvar *naf-author-entity-control-regexp-matcher-db* nil) ;;(make-hash-table))

(defvar *naf-author-entity-regexp-entity-db* nil) ;;(make-hash-table))

(defclass naf-entity-author-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation "A `naf-entity-control-name-regexp' subclass for author entities."))

(defclass naf-entity-author-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation "A `naf-entity-regexp' subclass for author entities."))

;;; ==============================
;;; :NAF-BRAND
;;; ==============================

(defvar *naf-brand-entity-control-regexp-matcher-db* nil) ;;(make-hash-table))

(defvar *naf-brand-entity-regexp-entity-db* nil) ;;(make-hash-table))

(defclass naf-entity-brand-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation "A `naf-entity-regexp' subclass for brand entities."))

(defclass naf-entity-brand-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation "A `naf-entity-regexp' subclass for brand entities."))

;;; ==============================

(defvar *naf-publication-entity-control-regexp-matcher-db* nil) ;;(make-hash-table))

(defclass naf-entity-publication-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation "A `naf-entity-regexp' subclass for publication entities"))





;;; ==============================
;;; EOF
