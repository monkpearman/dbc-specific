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
`regexp-match-container-uuid', `regexp-matcher'.~%▶▶▶~%")))

(defgeneric regexp-match-entity-db (obj &key)
  (:documentation 
   #.(format nil
   "Return the entity-db lookup table for OBJ.~%~
:SEE-ALSO `entity-regexp-subclass-allocation', `entity-regexp',
`regexp-match-entity-class', `regexp-match-entity-db',
`regexp-match-matcher-db', `regexp-match-container-type',
`regexp-match-container-uuid', `regexp-matcher'.~%▶▶▶~%")))

(defgeneric regexp-match-matcher-db (obj &key)
  (:documentation 
   #.(format nil
      "Return the matcher-db lookup table for OBJ.~%~
:SEE-ALSO `entity-regexp-subclass-allocation', `entity-regexp', 
`regexp-match-entity-class', `regexp-match-entity-db',
`regexp-match-matcher-db', `regexp-match-container-type',
`regexp-match-container-uuid', `regexp-matcher'.~%▶▶▶~%")))

(defgeneric regexp-match-container-type (obj &key)
  (:documentation 
   #.(format nil 
"Return the container type for OBJ's matcher.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%▶▶▶~%")))

(defgeneric (setf regexp-match-container-type) (container-type obj &key)
  (:documentation 
   #.(format nil
"Set the CONTAINER-TYPE for OBJ matcher.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%▶▶▶~%")))

(defgeneric regexp-match-container-uuid (obj &key)
  (:documentation
   #.(format nil 
"Return the UUID of the container holding a matcher for OBJ.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%▶▶▶~%")))

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
`regexp-matcher'.~%▶▶▶~%")))

(defgeneric regexp-matcher (obj &key)
  (:documentation 
   #.(format nil
"Return OBJ's matcher.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%▶▶▶~%")))

(defgeneric (setf regexp-matcher) (matcher obj &key)
  (:documentation 
   #.(format nil
   "Set OBJ's matcher.~%~
    Speacializers should take care to verify that matcher can be contained of its~%~
    specified container type.~%
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%▶▶▶~%")))


;;; ==============================
;;; :CLASS-DEFINITIONS
;;; ==============================

(defclass base-regexp (base-dbc)
  ()
  (:documentation #.(classdoc 'base-regexp :class-doc)))

;;; ==============================
;; subclass-match-entity-class  <-> regexp-match-entity-class
;; subclass-match-entity-db     <-> regexp-match-entity-db
;; subclass-match-matcher-db    <-> regexp-match-matcher-db
(defclass entity-regexp-subclass-allocation (base-regexp)
  ((;; entity-regexp slot match-entity-class
    subclass-match-entity-class
    :initarg :subclass-match-entity-class
    :initform nil ;;
    :documentation #.(classdoc 'entity-regexp-subclass-allocation :subclass-match-entity-class))
   (;; entity-regexp slot match-entity-db 
    subclass-match-entity-db
    :initarg :subclass-match-entity-db
    :initform nil
    :documentation #.(classdoc 'entity-regexp-subclass-allocation :subclass-match-entity-db))
   (;; entity-regexp slot match-matcher-db
    subclass-match-matcher-db
    :initarg :subclass-match-matcher-db
    :initform nil
    :documentation #.(classdoc 'entity-regexp-subclass-allocation :subclass-match-matcher-db)))
  (:documentation #.(classdoc 'entity-regexp-subclass-allocation :class-doc)))

(defclass entity-regexp (base-regexp)
  (( ;; global-per-subclass access with regexp-match-entity-class
    ;; entity-regexp-subclass-allocation subclass-match-entity-class
    match-entity-class 
    :initform nil 
    :documentation #.(classdoc 'entity-regexp :match-entity-class))
   ( ;; global-per-subclass access with regexp-match-entity-db
    ;; entity-regexp-subclass-allocation subclasses-match-entity-db
    match-entity-db 
    :initform nil
    :documentation #.(classdoc 'entity-regexp :match-entity-db))
   ( ;; global-per-subclass, access with regexp-match-matcher-db
    ;; entity-regexp-subclass-allocation subclass-match-matcher-db
    match-matcher-db 
    :initform nil
    :documentation #.(classdoc 'entity-regexp :match-matcher-db))
   ( ;; local-per-instance, access with regexp-match-container-type
    match-container-type
    :initarg :match-container-type
    :initform nil
    :documentation #.(classdoc 'entity-regexp :match-container-type))
   ( ;; local-per-instance, access with regexp-match-container-id
    match-container-uuid :initarg :match-container-id :initform nil
    :documentation #.(classdoc 'entity-regexp :match-container-uuid))
   ( ;; local-per-instance, access with regexp-matcher
    match-entity-matcher :initarg :match-entity-matcher :initform nil
    :documentation  #.(classdoc 'entity-regexp :match-entity-matcher)))
  (:documentation  #.(classdoc 'entity-regexp :class-doc)))

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
(defvar *parsed-field-name-regexp-db* nil)

(defclass parsed-field-name-regexp (entity-regexp)
  ()
  (:documentation #.(classdoc 'parsed-field-name-regexp :class-doc)))


;;; ==============================
;;; :THEMES
;;; ==============================
(defvar *theme-entity-regexp-db* nil)

(defclass theme-entity-regexp (entity-regexp)
  ;; match-entity-class
  ;; match-container-uuid
  ;; match-container-type   
  ;; match-entity-db
  ;; match-matcher-db
  ()
  (:documentation #.(classdoc 'theme-entity-regexp :class-doc)))


;;; ==============================
;;; :CATERORIES
;;; ==============================
(defvar *category-entity-regexp-db* nil)

(defclass category-entity-regexp (entity-regexp)
  ;; match-entity-class
  ;; match-container-uuid
  ;; match-container-type   
  ;; match-entity-db
  ;; match-matcher-db
  ()
  (:documentation #.(classdoc 'category-entity-regexp :class-doc)))


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
  (:documentation #.(classdoc 'naf-entity-type-regexp :class-doc)))

(defclass naf-entity-control-name-regexp (naf-entity-type-regexp)
  ;; (match-entity-container-type :initform 'closure)
  ;; (match-entity-matcher
  ()
  (:documentation #.(classdoc 'naf-entity-control-name-regexp :class-doc)))

(defclass naf-entity-alt-name-regexp (naf-entity-type-regexp)
  ;;(match-entity-container-type :initform 'list)
  ()
  (:documentation #.(classdoc 'naf-entity-alt-name-regexp :class-doc)))

;;; ==============================

;;; ==============================
;;; :NAF-ARTIST
;;; ==============================
(defvar *naf-artist-entity-regexp-db* nil) ;;(make-hash-table))

;; :match-entity-class
(defclass naf-entity-artist-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-artist-control-regexp :class-doc)))

(defclass naf-entity-artist-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-artist-alt-regexp :class-doc)))

(defclass naf-entity-artist-regexp (naf-entity-type-regexp)
  ()
  )

;; (let ((base-naf-entity-regexp 
;;        (make-entity-regexp-subclass-allocation 
;;         :match-entity-class 'naf-entity-artist-regexp 
;;         :match-entity-db    entity-db
;;         :match-matcher-db   matcher-db)))
;;   (setf *naf-artist-entity-regexp-db* base-naf-entity-regexp))

;; (regexp-match-entity-db *naf-artist-entity-regexp-db*)
;; (slot-value *naf-artist-entity-regexp-db* 'subclass-match-entity-db)
;; (defmethod initialize-instance :after ((entity naf-entity-artist-regexp)

;;; ==============================
;;; :NAF-PERSON
;;; ==============================
(defvar *naf-person-entity-regexp-db* nil)

(defclass naf-entity-person-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-person-control-regexp :class-doc)))

(defclass naf-entity-person-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-person-alt-regexp :class-doc)))

;;; ==============================
;;; :NAF-AUTHOR
;;; ==============================
(defvar *naf-author-entity-regexp-db* nil)

(defclass naf-entity-author-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-author-control-regexp :class-doc)))

(defclass naf-entity-author-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-author-alt-regexp :class-doc)))

;;; ==============================
;;; :NAF-BRAND
;;; ==============================
(defvar *naf-brand-entity-regexp-db* nil)

(defclass naf-entity-brand-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-brand-control-regexp :class-doc)))

(defclass naf-entity-brand-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-brand-alt-regexp :class-doc)))

;;; ==============================
(defvar *naf-publication-entity-regexp-db* nil)

(defclass naf-entity-publication-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-publication-control-regexp :class-doc)))

(defclass naf-entity-publication-alt-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-publication-alt-regexp :class-doc)))


;; naf-entity-location
;; base-location-entity

;; base-media-entity
;; media-technique-entity




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
   ;; (or (boundp match-entity-db)
   ;;     (error "Arg MATCH-ENTITY-DB not `cl:boundp'"))
   ;; (or (hash-table-p (symbol-value match-entity-db))
   ;;     (error "Arg MATCH-ENTITY-DB not `cl:hash-table-p'"))
   ;; (or (boundp match-matcher-db)
   ;;     (error "Arg MATCH-MATCHER-DB not `cl:boundp'"))
   ;; (or (hash-table-p (symbol-value match-matcher-db))
   ;;     (error "Arg MATCH-MATCHER-DB not `cl:hash-table-p'"))
   (or (hash-table-p match-entity-db)
       (error "Arg MATCH-ENTITY-DB not `cl:hash-table-p'"))
   (or (hash-table-p match-matcher-db)
       (error "Arg MATCH-MATCHER-DB not `cl:hash-table-p'"))
   `(:subclass-match-entity-class ,match-entity-class
     :subclass-match-entity-db    ,match-entity-db 
     :subclass-match-matcher-db   ,match-matcher-db)))

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
    ;; (and (symbolp if-bnd)
    ;;      (setf then-get-hsh 
    ;;            (symbol-value if-bnd)))
    ;; (and then-get-hsh 
    ;;      (hash-table-p then-get-hsh)
    ;;      (values then-get-hsh if-bnd))))
    ;; (and (symbolp if-bnd)
    ;;      (setf then-get-hsh 
    ;;            (symbol-value if-bnd)))
    (and (hash-table-p if-bnd) if-bnd)))

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

(fundoc 'make-entity-regexp-subclass-allocation-if 
"Verify the keyword arguments for `make-entity-regexp-subclass-allocation'.~%~@
If any of the following constraints are not met signal an error.~%~@
Args MATCH-ENTITY-CLASS, MATCH-ENTITY-DB, and MATCH-MATCHER-DB must each be
non-nil.~%~@
Arg MATCH-ENTITY-CLASS must a class which returns non-nil when given as the
argument to `cl:find-class'.~%~@
Args MATCH-ENTITY-DB and MATCH-MATCHER-DB must each satisfy `cl:hash-table-p'.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

(fundoc 'make-entity-regexp-subclass-allocation
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
:SEE-ALSO `<XREF>'.~%▶▶▶")

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
