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

(defgeneric regexp-match-entity-class (obj &key))

(defgeneric regexp-match-entity-db (obj &key))

(defgeneric regexp-match-matcher-db (obj &key))

(defgeneric regexp-match-container-type (obj &key))

(defgeneric (setf regexp-match-container-type) (container-type obj &key))

(defgeneric regexp-match-container-uuid (obj &key))

;; :NOTE This one probably needs additional options e.g. method-combination, etc.
;; It will almost certainly need an pre-emptive around method to prevent
;; inadverdent destruction of UUID's
(defgeneric (setf regexp-match-container-uuid) (container-id obj &key))

(defgeneric regexp-matcher (obj &key))

(defgeneric (setf regexp-matcher) (matcher obj &key))


;;; ==============================
;;; :CLASS-DEFINITIONS
;;; ==============================

(defclass base-regexp (base-dbc)
  ()
  (:documentation #.(classdoc 'base-regexp :class-doc)))

;;; ==============================
;; :NOTE 
;; `entity-regexp-subclass-allocation', `entity-regexp'
;; ,----
;; | The :default-initargs class option is followed by a list of
;; | alternating initialization argument names and default initial value
;; | forms.  If any of these initialization arguments does not appear in
;; | the initialization argument list supplied to ‘make-instance’, the
;; | corresponding default initial value form is evaluated, and the
;; | initialization argument name and the form's value are added to the
;; | end of the initialization argument list before the instance is
;; | created; see *Note Section 7.1 (Object Creation and
;; | Initialization): Object Creation and Initialization.  The default
;; | initial value form is evaluated each time it is used.  The lexical
;; | environment in which this form is evaluated is the lexical
;; | environment in which the ‘defclass’ form was evaluated.  The
;; | dynamic environment is the dynamic environment in which
;; | ‘make-instance’ was called.  If an initialization argument name
;; | appears more than once in a :default-initargs class option, an
;; | error is signaled.
;; `----
;; However, we may need to be carefull with :default-initargs with metaclasses...
;; :SEE C.L.L thread started by James Anderson (i.e. de.setf.resource) 
;;  entitled: "why does the mop handle default-initargs as persistent,"
;; :SEE (URL `http://groups.google.com/group/comp.lang.lisp/browse_thread/thread/fef6511f1cbb3bbd/99b5ea0f7a5ce4b6?lnk=gst&q=%22%3Adefault-initargs%22#99b5ea0f7a5ce4b6')

;;; ==============================
;; subclass-match-entity-class  <-> regexp-match-entity-class
;; subclass-match-entity-db     <-> regexp-match-entity-db
;; subclass-match-matcher-db    <-> regexp-match-matcher-db
(defclass entity-regexp-subclass-allocation (base-regexp)
  (( ;; entity-regexp slot match-entity-class
    subclass-match-entity-class
    :initarg :subclass-match-entity-class
    ;; :initform nil ;;
    :documentation #.(classdoc 'entity-regexp-subclass-allocation :subclass-match-entity-class))
   ( ;; entity-regexp slot match-entity-db 
    subclass-match-entity-db
    :initarg :subclass-match-entity-db
    ;; :initform nil
    :documentation #.(classdoc 'entity-regexp-subclass-allocation :subclass-match-entity-db))
   ( ;; entity-regexp slot match-matcher-db
    subclass-match-matcher-db
    :initarg :subclass-match-matcher-db
    ;; :initform nil
    :documentation #.(classdoc 'entity-regexp-subclass-allocation :subclass-match-matcher-db)))
  (:default-initargs :subclass-match-entity-class nil
                     :subclass-match-entity-db nil
                     :subclass-match-matcher-db nil)
  (:documentation #.(classdoc 'entity-regexp-subclass-allocation :class-doc)))

(defclass entity-regexp (base-regexp)
  ((;; global-per-subclass access with regexp-match-entity-class
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
    ;; :initform nil
    :documentation #.(classdoc 'entity-regexp :match-container-type))
   ( ;; local-per-instance, access with regexp-match-container-id
    match-container-uuid
    :initarg :match-container-id 
    ;; :initform nil
    :documentation #.(classdoc 'entity-regexp :match-container-uuid))
   ( ;; local-per-instance, access with regexp-matcher
    match-entity-matcher 
    :initarg :match-entity-matcher 
    ;;:initform nil
    :documentation  #.(classdoc 'entity-regexp :match-entity-matcher)))
  (:default-initargs :match-container-type nil
                     :match-container-id nil
                     :match-entity-matcher nil)
  (:documentation  #.(classdoc 'entity-regexp :class-doc)))

;; (make-instance 'entity-regexp 
;;                :match-entity-class 'liza-terry 
;;                :match-entity-db *liza-terry-db* 
;;                :match-matcher-db *liza-terry-matcher-db* 
;;                :match-container-type 'closure
;;                :match-container-uuid <GENERATE>
;;                :match-entity-matcher (cl-ppcre:create-scanner "liza-terry 342"))


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
;;; :MEDIA-ENTITY
;;; ==============================
(defvar *media-entity-regexp-db* nil)

(defclass media-entity-regexp (entity-regexp)
  ;; match-entity-class
  ;; match-container-uuid
  ;; match-container-type   
  ;; match-entity-db
  ;; match-matcher-db
  ()
  (:documentation #.(classdoc 'media-entity-regexp :class-doc)))

;;; ==============================
;;; :LOCATION-ENTITY
;;; ==============================

(defvar *location-entity-regexp-db* nil)

(defclass location-entity-regexp (entity-regexp)
  ;; match-entity-class
  ;; match-container-uuid
  ;; match-container-type   
  ;; match-entity-db
  ;; match-matcher-db
  ()
  (:documentation #.(classdoc 'location-entity-regexp :class-doc)))



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



;; (make-instance 'entity-regexp 
;;                :match-entity-class 'liza-terry 
;;                :match-entity-db *liza-terry-db* 
;;                :match-matcher-db *liza-terry-matcher-db* 
;;                :match-container-type 'closure
;;                :match-container-uuid <GENERATE>
;;                :match-entity-matcher (cl-ppcre:create-scanner "liza-terry 342"))
;; entity-regexp
;; |-> naf-entity-regexp
;;     |-> naf-entity-control-name-regexp
;;         |-> naf-entity-artist-control-regexp
;;     |-> naf-entity-alt-name-regexp
;;         |-> naf-entity-artist-alt-regexp
;;     |-> naf-entity-artist-regexp


;;; ==============================

;;; ==============================
;;; :NAF-ARTIST
;;; ==============================
(defvar *naf-entity-artist-regexp-db* nil) ;;(make-hash-table))

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

;; *naf-artist-entity-regexp-db*

;; (regexp-match-entity-db *naf-artist-entity-regexp-db*)
;; (slot-value *naf-artist-entity-regexp-db* 'subclass-match-entity-db)
;; (defmethod initialize-instance :after ((entity naf-entity-artist-regexp)

;;; ==============================
;;; :NAF-PERSON
;;; ==============================
(defvar *naf-entity-person-regexp-db* nil)

(defclass naf-entity-person-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-person-control-regexp :class-doc)))

(defclass naf-entity-person-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-person-alt-regexp :class-doc)))

;;; ==============================
;;; :NAF-AUTHOR
;;; ==============================
(defvar *naf-entity-author-regexp-db* nil)

(defclass naf-entity-author-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-author-control-regexp :class-doc)))

(defclass naf-entity-author-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-author-alt-regexp :class-doc)))

;;; ==============================
;;; :NAF-BRAND
;;; ==============================
(defvar *naf-entity-brand-regexp-db* nil)

(defclass naf-entity-brand-control-regexp (naf-entity-control-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-brand-control-regexp :class-doc)))

(defclass naf-entity-brand-alt-regexp (naf-entity-alt-name-regexp)
  ()
  (:documentation #.(classdoc 'naf-entity-brand-alt-regexp :class-doc)))

;;; ==============================
(defvar *naf-entity-publication-regexp-db* nil)

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
  ;; :NOTE We may have to declare these special if they aren't seen
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

(defun make-entity-regexp-subclass-allocation (&key match-entity-class
                                                    match-entity-db
                                                    match-matcher-db)
  (let ((chk-keys  (make-entity-regexp-subclass-allocation-if match-entity-class
                                                              match-entity-db
                                                              match-matcher-db)))
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
(defmethod regexp-match-entity-class ((object entity-regexp-subclass-allocation) &key)
  (let* (;; :NOTE `subclass-match-entity-class' has :default-initargs value NIL.
         (if-bound (and (slot-exists-p object 'subclass-match-entity-class)
                        (slot-boundp   object 'subclass-match-entity-class)
                        (slot-value    object 'subclass-match-entity-class)))
         (found-class (and if-bound (mon:ref-bind fc (find-class if-bound)
                                      (and (eql (class-name fc) if-bound)
                                           fc)))))
    (and if-bound
         found-class
         (values found-class if-bound))))

;; If OBJ's subclass-match-entity-db slot is bound and its slot-value is
;; `cl:hash-table-p' return as if by `cl:values' the hash-table object and the
;; symbol naming it.
;; (regexp-match-entity-db *base-test-entity-regexp-instance*)
;; (multiple-value-list (regexp-match-entity-db *base-test-entity-regexp-instance*))
(defmethod regexp-match-entity-db ((object entity-regexp-subclass-allocation) &key)
  (let (;; :NOTE `subclass-match-entity-db' has :default-initargs value NIL.
        (if-bound (and (slot-exists-p object 'subclass-match-entity-db)
                       (slot-boundp   object 'subclass-match-entity-db)
                       (slot-value    object 'subclass-match-entity-db)))
        (then-get-hash '()))
    ;; (and (symbolp if-bound)
    ;;      (setf then-get-hash 
    ;;            (symbol-value if-bound)))
    ;; (and then-get-hash 
    ;;      (hash-table-p then-get-hash)
    ;;      (values then-get-hash if-bound))))
    ;; (and (symbolp if-bound)
    ;;      (setf then-get-hash 
    ;;            (symbol-value if-bound)))
    (and (hash-table-p if-bound) if-bound)))

;; If OBJ's subclass-match-matcher-db slot is bound and its slot-value is
;; `cl:hash-table-p' return as if by `cl:values' the hash-table object and the
;; symbol naming it.
;; (regexp-match-matcher-db *base-test-entity-regexp-instance*)
;; (multiple-value-list (regexp-match-entity-db *base-test-entity-regexp-instance*))
(defmethod regexp-match-matcher-db ((object entity-regexp-subclass-allocation) &key)
  (let ( ;; :NOTE `subclass-match-matcher-db' has :default-initargs value NIL.
        (if-bound (and (slot-exists-p object 'subclass-match-matcher-db)
                       (slot-boundp   object 'subclass-match-matcher-db)
                       (slot-value    object 'subclass-match-matcher-db)))
        (then-get-hash '()))
    (and (symbolp if-bound)
         (setf then-get-hash (symbol-value if-bound)))
    (and then-get-hash 
         (hash-table-p then-get-hash)
         (values then-get-hash if-bound))))

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
;; match-entity-class    ;; The class of the the thing matched e.g. an NAF-ARTIST-ENTITY                   ;; :allocation :class (e.g. global per subclass)
;; match-entity-db       ;; A special variable of key/vals ( match-container-uuid . entity-instance-uuid ) ;; :allocation :class (e.g. global per subclass)
;; match-matcher-db      ;; A special variable of key/vals ( match-container-uuid . match-entity-matcher ) ;; :allocation :class (e.g. global per subclass)
;; match-container-uuid  ;; UUID of the container holding the `match-entity-matcher' object -- local per subclass instance
;;;                      ;;  specialize `regexp-match-container-uuid'
;; match-container-type  ;; the type-of the `match-entity-matcher'  [ closure | list | string | array | hash-table ]  -- local per subclass instance
;; match-entity-matcher  ;; a matcher object - it's type is identified by the slot-value of `match-container-type'    -- local per subclass instance
;;

;; (defun make-instance-naf-entity-artist-control-regexp 
;;     (&key 
;;      ;; match-entity-class ;; global-per-subclass
;;      ;; match-entity-db    ;; global-per-subclass
;;      ;; match-matcher-db   ;; global-per-subclass
;;      match-container-type  ;; local-per-instance
;;      match-container-uuid  ;; local-per-instance
;;      match-entity-matcher  ;; local-per-instance
;;      )

;; subclass-match-entity-class  <-> regexp-match-entity-class
;; subclass-match-entity-db     <-> regexp-match-entity-db
;; subclass-match-matcher-db    <-> regexp-match-matcher-db

;; match-entity-class     The class of the the thing matched e.g. an NAF-ARTIST-ENTITY
;; match-container-uuid   specialize `regexp-match-container-uuid' -- local-per-subclass
;; match-container-type   [ closure | list | string | array | hash-table ]  -- local-per-subclass
;; match-entity-db       :allocation :class -- variable holding match-container-uuid/entity-instance-uuid pairs
;; match-matcher-db      :allocation :class -- variable holding lookup table of match-container-uuid/matcher pairs
;; match-entity-class-type 



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
Keyword MATCH-ENTITY-CLASS is the class-name of an isntance that matchers of a
subclass of the ENTITY-REGEXP class will match.~%
Keyword MATCH-ENTITY-DB is a symbol naming a special variable the value of
which is a table mapping key/value pairs of the form:~%
 match-container-uuid entity-instance-uuid~%~@
Keyword MATCH-MATCHER-DB is a symbol naming a special variable the value of
which is a table mapping  key/value pairs of the form:~%
 match-container-uuid match-entity-matcher~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

(generic-doc #'regexp-match-entity-class
 "Get the entity-class for OBJ.~%~
:SEE-ALSO `entity-regexp-subclass-allocation', `entity-regexp',
`regexp-match-entity-class', `regexp-match-entity-db',
`regexp-match-matcher-db', `regexp-match-container-type',
`regexp-match-container-uuid', `regexp-matcher'.~%▶▶▶~%")

(generic-doc #'regexp-match-entity-db
   "Get the entity-db lookup table for OBJ.~%~
:SEE-ALSO `entity-regexp-subclass-allocation', `entity-regexp',
`regexp-match-entity-class', `regexp-match-entity-db',
`regexp-match-matcher-db', `regexp-match-container-type',
`regexp-match-container-uuid', `regexp-matcher'.~%▶▶▶~%")

(generic-doc #'regexp-match-matcher-db
             "Return the matcher-db lookup table for OBJ.~%~
:SEE-ALSO `entity-regexp-subclass-allocation', `entity-regexp', 
`regexp-match-entity-class', `regexp-match-entity-db',
`regexp-match-matcher-db', `regexp-match-container-type',
`regexp-match-container-uuid', `regexp-matcher'.~%▶▶▶~%")

(generic-doc  #'regexp-match-container-type
 "Get the container type for OBJ's matcher.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%▶▶▶~%")

(generic-doc #'(setf regexp-match-container-type)
 "Set the CONTAINER-TYPE for OBJ matcher.^~%~@
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%▶▶▶~%")

(generic-doc #'regexp-match-container-uuid
"Return the UUID of the container holding a matcher for OBJ.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%▶▶▶~%")

(generic-doc #'(setf regexp-match-container-uuid)
"Set the match-container-uuid for the container holding OBJ's matcher.~%~
Specializers should take special care to ensure that they don't overwrite an existing UUID.~%~
An OBJ's UUID should be treated as an immutable constant in almost all circumstances.~%~
Therefor, the intent of this function is to mediate generation of UUID's run~%~
:after initialize-instance and/or when an instance is obsoleted with~%~
`cl:make-instances-obsolete'.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%▶▶▶~%")

(generic-doc #'regexp-matcher
"Get OBJ's matcher.~%~
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%▶▶▶~%")

(generic-doc #'(setf regexp-matcher)
"Set OBJ's matcher.~%~
Speacializers should take care to verify that matcher can be contained of its~%~
specified container type.~%
:SEE-ALSO `entity-regexp', `regexp-match-entity-class',
`regexp-match-entity-db', `regexp-match-matcher-db',
`regexp-match-container-type', `regexp-match-container-uuid',
`regexp-matcher'.~%▶▶▶~%")

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
