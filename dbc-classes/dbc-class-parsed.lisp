;;; :FILE-CREATED <Timestamp: #{2011-10-10T19:11:04-04:00Z}#{11411} - by MON>
;;; :FILE dbc-classes/dbc-class-parsed.lisp
;;; ==============================

;; :NOTE Superclass `parsed-class' needs following generics specialized on it.
;; As they common to multiple naf-entity sub-classes:
;;  `parsed-artist-record' `parsed-author-record' `parsed-person-record'
;;  `parsed-brand-record' `parsed-publication-record'
;;
;;  GENERIC                        ->    CLASS-SLOT
;;  ---------------------------------------------------------------------------- 
;;
;; `naf-entity-gender-type'        -> `naf-entity-gender-type'
;; `lifespan-date'                 -> `lifespan-date'
;; `birth-date'                    -> `birth-date'
;; `death-date'                    -> `death-date'
;; `location-birth'                -> `location-birth'
;; `location-death'                -> `location-death'
;; `location-nationality'          -> `location-nationality'
;; `control-id-authority-0'        -> `control-id-authority-0'
;; `control-id-authority-1'        -> `control-id-authority-1'
;;
;; These are common to class `parsed-class' and its subclasses
;; `naf-entity-author-coref'       -> `naf-entity-author-coref'      ; parsed-class
;; `naf-entity-person-coref'       -> `naf-entity-author-coref'      ; parsed-class
;; `naf-entity-publication-coref'  -> `naf-entity-publication-coref' ; parsed-class
;; `naf-entity-brand-coref'        -> `naf-entity-brand-coref'       ; parsed-class
;;
;; `image-default-id'              -> `image-default-id'             ; parsed-class
;; `image-default-xref'            -> `image-default-xref'           ; parsed-class
;; `record-status-active'          -> `record-status-active'         ; parsed-class
;; `edit-by'                       -> `edit-by'                      ; parsed-class
;; `edit-by-creator'               -> `edit-by-creator'              ; parsed-class
;; `edit-timestamp-origin'              -> `edit-timestamp-origin'             ; parsed-class
;; `edit-timestamp'                     -> `edit-timestamp'                    ; parsed-class
;;
;; control-id-
;; `control-id-display-name-for-entity-type' -> | `control-id-display-artist'       ; parsed-naf-entity
;;                                              | `control-id-display-author'       ; parsed-naf-entity
;;                                              | `control-id-display-person'       ; parsed-naf-entity
;;                                              | `control-id-display-brand'        ; parsed-naf-entity
;;                                              | `control-id-display-publication'  ; parsed-naf-entity
;;                                              | `conrtol-id-display-technique'    ; parsed-class
;;                                              | `conrtol-id-display-theme'        ; parsed-class

;; this ia a used_for
;; `entity-display-name-coref'     -> | `technique-entity-display-name-coref'  ; parsed-class
;;                                    | `naf-entity-artist-display-name-coref' ; parsed-naf-entity
;;                                    |  theme-entity-display-name-coref       ; parsed-theme-record ???
;; 
;; `control-id-entity-num'         -> | `conrtol-id-entity-num-technique'   ; parsed-class
;;                                    | `control-id-entity-num-publication' ; parsed-naf-entity

;; `control-id-doc-num'            -> | `control-id-doc-num-artist'         ; parsed-naf-entity
;;                                    | `control-id-doc-num-author'         ; parsed-naf-entity
;;                                    | `control-id-doc-num-person'         ; parsed-naf-entity
;;                                    | `control-id-doc-num-brand'          ; parsed-naf-entity
;;                                    | `control-id-doc-num-publication'    ; parsed-naf-entity


;; `description-artist-note-general'
;; `description-artist-note-sale-appearance'
;; `base-description-entity-internal'

(in-package #:dbc)

(defgeneric %parsed-class-subtype-check (parsed-class-object))

(defgeneric field-to-accessor-table (object))

(defgeneric (setf field-to-accessor-table) (hash-table object))

(defgeneric accessor-to-field-table (object))
(defgeneric (setf accessor-to-field-table) (hash-table object))

(defgeneric parsed-class-mapped (object))
(defgeneric (setf parsed-class-mapped) (parsed-class-symbol parsed-class-mapped))

(defgeneric accessor-to-field-mapping (accessor object))

(defgeneric field-to-accessor-mapping (field object))

(defgeneric fields-of-parsed-class (object))

(defgeneric accessors-of-parsed-class (object))

(defgeneric initargs-of-parsed-class (object))

(defgeneric parsed-class-slot-dispatch-function (object))
;; (defgeneric (setf parsed-class-slot-dispatch-function) (parsed-class-symbol ))

(defgeneric parsed-class-parse-table (object))
(defgeneric (setf parsed-class-parse-table) (hash-table object))

;; parsed-class-table-lookup -> parsed-class-parse-table-lookup
(defgeneric parsed-class-table-lookup (parsed-class hash-key))

(defgeneric %parsed-class-slot-exists-for-parsed-class-check (object slot-name))

;; (defgeneric parsed-class-parse-table-lookup-slot-value (parsed-class slot-name hash-key))
;; (unless (member slot-name (accessors-of-parsed-class parsed-class))
;; slot-exists-p

;; (error ":method parsed-class-parse-table-lookup-slot-value
;; (let ((maybe-object (parsed-class-parse-table (parsed-class-mapped object))))
;;  (gethash hash-key (parsed-class-parse-table (parsed-class-mapped object))))

;; These are common to class `parsed-class' and its subclasses
(defgeneric naf-entity-author-coref (object))
(defgeneric (setf naf-entity-author-coref) (coref-value object))

(defgeneric naf-entity-person-coref (object))
(defgeneric (setf naf-entity-person-coref) (coref-value object))

(defgeneric naf-entity-publication-coref (object))
(defgeneric (setf naf-entity-publication-coref) (coref-value object))

(defgeneric naf-entity-brand-coref (object))
(defgeneric (setf naf-entity-brand-coref) (coref-value object))

(defgeneric image-default-id (object))
(defgeneric (setf image-default-id) (default-id-value object))

(defgeneric image-default-xref (object))
(defgeneric (setf image-default-xref) (xref-value object))

(defgeneric record-status-active (object))
(defgeneric (setf record-status-active) (active-value object))

(defgeneric edit-by (object))
(defgeneric (setf edit-by) (edit-by-value object))

(defgeneric edit-by-creator (object))
(defgeneric (setf edit-by-creator) (creator-value object))

(defgeneric edit-timestamp-origin (object))
(defgeneric (setf edit-timestamp-origin) (date-value object))

(defgeneric edit-timestamp (object))
(defgeneric (setf edit-timestamp) (date-value object))

(defgeneric naf-entity-gender-type (object))
(defgeneric (setf naf-entity-gender-type) (gender-type object))

(defgeneric lifespan-date (object))
(defgeneric (setf lifespan-date) (date-value object))

(defgeneric birth-date (object))
(defgeneric (setf birth-date) (date-value object))

(defgeneric death-date (object))
(defgeneric (setf death-date) (date-value object))

(defgeneric location-birth (object))
(defgeneric (setf location-birth) (location-value object))

(defgeneric location-death (object))
(defgeneric (setf location-death) (location-value object))

(defgeneric location-nationality (object))
(defgeneric (setf location-nationality) (nationality-value object))

(defgeneric control-id-authority-0 (object))
(defgeneric (setf control-id-authority-0) (db-id-value object))

(defgeneric control-id-authority-1 (object))
(defgeneric (setf control-id-authority-1) (db-id-value object))

;; :NOTE This is the base class from wich other converted dbc-classes inherit.
;;       The intent is that this class should allow auxillary :before :after :around
;;       methods to act on the primary-methods of `parsed-class' inheritors.
;;       IOW, this your basic mixin base class :)
(defclass parsed-class (base-dbc)
  ;; :NOTE Which other slots accessors and generics should this class establish?
  ()
  (:documentation "Base dbc parsed class. 
:NOTE variable *parsed-class-parse-table* holds hashes keyed to subclasses."))

(defclass parsed-naf-entity (parsed-class)
  ()
  (:documentation #.(format nil "Base class for parsing naf-entity records.~%~@
:SEE-ALSO `parsed-artist-record', `parsed-author-record',~%~
`parsed-person-record', `parsed-brand-record', `parsed-publication-record'.~%▶▶▶")))

;; (defun %parsed-class-mapped-with-known-key-helper (parsed-class-symbol)
;;   ;; (declare (symbol parsed-class-symbol))
;;   (when (eql parsed-class-symbol 'parsed-class)
;;     (error "Arg PARSED-CLASS-SYMBOL is cl:eql the symbol PARSED-CLASS.~% ~
;;           Arg must be a symbol designating a subclass of `parsed-class'~%"))
;;   (multiple-value-bind (key-val key-present) (gethash parsed-class-symbol *parsed-class-field-slot-accessor-mapping-table*)
;;     (if key-present
;;         (if (typep key-val 'parsed-class-field-slot-accessor-mapping)
;;             key-val
;;             (error ":FUNCTION `%parsed-class-mapped-with-known-key-helper'~% ~
;;                     Arg PARSED-CLASS-SYMBOL is a present hash-table-key with non-valid value in hash-table `~A'~% ~
;;                     hash-table-key: ~S~% ~
;;                     hash-table-value: ~S~%"
;;                    '*parsed-class-field-slot-accessor-mapping-table*
;;                    parsed-class-symbol key-val))
;;         (error ":FUNCTION `%parsed-class-mapped-with-known-key-helper'~% ~
;;                  Arg PARSED-CLASS-SYMBOL not a present hash-table-key in hash-table `~A'~% ~
;;                  hash-table-key: ~S~%"
;;                '*parsed-class-field-slot-accessor-mapping-table*
;;                parsed-class-symbol))))

(defmethod %parsed-class-subtype-check ((parsed-class-object (eql 'parsed-class)))
  (error "Arg PARSED-CLASS-OBJECT is cl:eql the symbol PARSED-CLASS.~% ~
          Arg must be a symbol designating a subclass of `parsed-class'~%"))

(defmethod %parsed-class-subtype-check ((parsed-class-object symbol))
  (let* (;;(the-class-parsed-class (find-class 'parsed-class))
         (the-class-of-parsed-class-object
          (or (find-class parsed-class-object nil)
              (error "Arg PARSED-CLASS-SYMBOL must be a symbol designating a subclass of `parsed-class'~% ~
                    got: ~S" parsed-class-object)))
         (subclass-check (if (subtypep the-class-of-parsed-class-object (find-class 'parsed-class))
                             parsed-class-object
                             (error ":METHOD `%parsed-class-subtype-check'~% ~
                                      PARSED-CLASS-OBJECT must be a subclass `parsed-class'~% got: ~S~% class-of: ~S~%"
                                    parsed-class-object (class-name the-class-of-parsed-class-object)))))
    subclass-check))

(defmethod %parsed-class-subtype-check ((parsed-class-object parsed-class))
  (let* ((the-class-parsed-class (find-class 'parsed-class))
         (objects-class  (class-of parsed-class-object))
         (subclass-check (cond ((eql the-class-parsed-class objects-class)
                                (error "The cl:class-of of arg PARSED-CLASS-OBJECT is cl:eq the class PARSED-CLASS.~% ~
                                        Arg must be a subclass of `parsed-class' or or symbol designating one~%"))
                               ((subtypep objects-class (find-class 'parsed-class))
                                (class-name objects-class))
                               (t
                                (error ":METHOD `%parsed-class-subtype-check'~% ~
                                         PARSED-CLASS-OBJECT must be a subclass `parsed-class' and not an instance of `parsed-class'~% ~
                                         got: ~S~% class-of: ~S~%" parsed-class-object (class-name objects-class))))))
    subclass-check))

;; :EXAMPLE
;;  (parsed-class-mapped (make-instance 'parsed-inventory-record))
;;
;; Following fail successfully:
;; (parsed-class-mapped (make-instance 'parsed-foo-record))
;; (parsed-class-mapped (make-instance 'parsed-class))
;; 
;; :NOTE function `%parsed-class-mapped-with-known-key-helper' defined in 
;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-field-slot-mapping.lisp b/c
;; compiler complains about an undefined class `parsed-class-field-slot-accessor-mapping' otherwise.
;;
;; (remove-method #'parsed-class-mapped (find-method #'parsed-class-mapped nil '(parsed-class)))
(defmethod parsed-class-mapped ((object parsed-class))
  (%parsed-class-mapped-with-known-key-helper (%parsed-class-subtype-check object)))

;; :EXAMPLE
;;  (parsed-class-mapped 'parsed-inventory-record)
;; Following fails successfully:
;;  (parsed-class-mapped 'parsed-foo-record)
(defmethod parsed-class-mapped ((object symbol))
  (%parsed-class-mapped-with-known-key-helper (%parsed-class-subtype-check object)))

(defmethod parsed-class-slot-dispatch-function ((object parsed-class))
  (parsed-class-slot-dispatch-function (parsed-class-mapped object)))

;; (parsed-class-slot-dispatch-function 'parsed-inventory-record)
;; (parsed-class-slot-dispatch-function 'foo)
(defmethod parsed-class-slot-dispatch-function ((object symbol))
  (parsed-class-slot-dispatch-function (parsed-class-mapped object)))

;; (%parsed-class-mapped-with-known-key-helper
;;  (%parsed-class-subtype-check (make-instance 'parsed-inventory-record)))

;; (accessor-to-field-table (parsed-class-mapped 'parsed-inventory-record))
(defmethod accessor-to-field-table ((object parsed-class))
  (accessor-to-field-table (parsed-class-mapped object)))

;; (field-to-accessor-table 'parsed-inventory-record)
;; fails successfully:
;; (field-to-accessor-table 'parsed-class)
;; (field-to-accessor-table 'parsed-foo-record)
(defmethod field-to-accessor-table ((object symbol))
  (field-to-accessor-table (parsed-class-mapped object)))

;; (accessor-to-field-table 'parsed-inventory-record)
;; fails successfully:
;; (accessor-to-field-table 'parsed-class)
;; (accessor-to-field-table 'parsed-foo-record)
(defmethod accessor-to-field-table ((object symbol))
  (accessor-to-field-table (parsed-class-mapped object)))

;; (field-to-accessor-mapping "ref" (make-instance 'parsed-inventory-record))
;; (field-to-accessor-mapping "id" (make-instance 'parsed-artist-record))
(defmethod field-to-accessor-mapping (field (object parsed-class))
  (gethash field (field-to-accessor-table  object)))

;; (field-to-accessor-mapping "id" 'parsed-artist-record)
(defmethod field-to-accessor-mapping (field (object symbol))
  (gethash field (field-to-accessor-table  object)))

;; (accessor-to-field-mapping 'inventory-number (make-instance 'parsed-inventory-record))
(defmethod accessor-to-field-mapping (accessor (object parsed-class))
  (gethash accessor (accessor-to-field-table  object)))

;; (accessor-to-field-mapping 'inventory-number 'parsed-inventory-record)
(defmethod accessor-to-field-mapping (accessor (object symbol))
  (gethash accessor (accessor-to-field-table object)))

(defmethod fields-of-parsed-class ((object symbol))
  (alexandria:hash-table-keys (field-to-accessor-table object)))

(defmethod fields-of-parsed-class ((object parsed-class))
  (alexandria:hash-table-keys (field-to-accessor-table object)))

(defmethod accessors-of-parsed-class ((object symbol))
  (alexandria:hash-table-keys (accessor-to-field-table object)))

(defmethod accessors-of-parsed-class ((object parsed-class))
  (alexandria:hash-table-keys (accessor-to-field-table object)))

;; (initargs-of-parsed-class 'parsed-inventory-record)
;; Following fails successfully:
;; (initargs-of-parsed-class 'parsed-class)
(defmethod initargs-of-parsed-class ((object symbol))
  (initargs-of-parsed-class (parsed-class-mapped object)))

;; (initargs-of-parsed-class (make-instance 'parsed-inventory-record))
;; Following fails successfully:
;; (initargs-of-parsed-class (make-instance 'parsed-class))
(defmethod initargs-of-parsed-class ((object parsed-class))
  (initargs-of-parsed-class (parsed-class-mapped object)))

(defmethod %parsed-class-slot-exists-for-parsed-class-check ((object parsed-class) (slot-name symbol))
  (%parsed-class-slot-exists-for-parsed-class-check (parsed-class-mapped object) slot-name))

(defmethod %parsed-class-slot-exists-for-parsed-class-check ((object symbol) (slot-name symbol))
  (%parsed-class-slot-exists-for-parsed-class-check (parsed-class-mapped object) slot-name))

;; (parsed-class-parse-table (make-instance 'parsed-inventory-record))
;; Following fails successfully:
;; (parsed-class-parse-table (make-instance 'parsed-class))
(defmethod parsed-class-parse-table ((object parsed-class))
  (parsed-class-parse-table (parsed-class-mapped object)))

;; (parsed-class-parse-table 'parsed-inventory-record)
;; Following fails successfully:
;;  (parsed-class-parse-table 'parsed-foo-record)
(defmethod parsed-class-parse-table ((object symbol))
  (parsed-class-parse-table (parsed-class-mapped object)))

(defmethod parsed-class-table-lookup ((object symbol) hash-key)
  (gethash hash-key (parsed-class-parse-table (parsed-class-mapped object))))

(defmethod parsed-class-table-lookup ((object parsed-class) hash-key)
  (gethash hash-key (parsed-class-parse-table (parsed-class-mapped object))))


;; (defmethod parsed-class-table-lookup-slot-value ((object parsed-class) slot-name hash-key)
;;  (gethash hash-key (parsed-class-parse-table (parsed-class-mapped object))))

;; (defgeneric (setf parsed-class-parse-table) (hash-table object))

;; (%parsed-class-parse-table-make-table)
(defun %parsed-class-parse-table-make-table (&key 
                                             ;; test should always be #'equal
                                             (size #+sbcl sb-impl::+min-hash-table-size+ #-sbcl 16)
                                             (rehash-size 1.5)
                                             (rehash-threshold 1.0)
                                             weakness
                                             synchronized)
  (make-hash-table :test #'equal 
                   :size size
                   :rehash-size rehash-size
                   :rehash-threshold rehash-threshold
                   :weakness weakness
                   :synchronized synchronized))

;; (setf (parsed-class-parse-table (make-instance 'parsed-artist-record)) 
;;       (%parsed-class-parse-table-make-table))
(defmethod (setf parsed-class-parse-table) (hash-table (object parsed-class))
  (setf (parsed-class-parse-table (parsed-class-mapped object)) hash-table))


;; (setf (parsed-class-parse-table 'parsed-artist-record) nil)
;;       (%parsed-class-parse-table-make-table))
(defmethod (setf parsed-class-parse-table) (hash-table (object symbol))
  (setf (parsed-class-parse-table (parsed-class-mapped object)) hash-table))


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:


;;; ==============================
;;; EOF

