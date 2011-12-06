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
;; `edit-date-origin'              -> `edit-date-origin'             ; parsed-class
;; `edit-date'                     -> `edit-date'                    ; parsed-class
;;

;; `control-id-display-name-for-entity-type' -> | `control-id-display-artist'       ; parsed-naf-entity
;;                                              | `control-id-display-author'       ; parsed-naf-entity
;;                                              | `control-id-display-person'       ; parsed-naf-entity
;;                                              | `control-id-display-brand'        ; parsed-naf-entity
;;                                              | `control-id-display-publication'  ; parsed-naf-entity
;;                                              | `conrtol-id-display-technique'    ; parsed-class

;; this ia a used_for
;; `entity-display-name-coref'     -> | `technique-entity-display-name-coref'  ; parsed-class
;;                                    | `naf-entity-artist-display-name-coref' ; parsed-naf-entity

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

(defgeneric edit-date-origin (object))
(defgeneric (setf edit-date-origin) (date-value object))

(defgeneric edit-date (object))
(defgeneric (setf edit-date) (date-value object))

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
  (:documentation "Base dbc parsed class."))

;; (remove-method #'parsed-class-mapped (find-method #'parsed-class-mapped nil '(parsed-class)))
(defmethod parsed-class-mapped ((object parsed-class))
  ;; (let* ((objects-class  (class-of object))
  ;;        (subclass-check (or (subtypep objects-class (find-class 'parsed-class))
  ;;                            (error "OBJECT must be a subclass `parsed-class'"))))
  ;;   (and subclass-check 
  ;;        (setf subclass-check (class-name subclass-check)))
  ;;   (gethash subclass-check *parsed-class-field-slot-accessor-mapping-table*)
  ;;   )
  (let* ((the-class-parsed-class (find-class 'parsed-class))
         (objects-class  (class-of object))
         (subclass-check (or (and (not (eq the-class-parsed-class objects-class))
                                  (subtypep objects-class (find-class 'parsed-class))
                                  (class-name objects-class))
                             (error "OBJECT must be a subclass `parsed-class' and not an instance of `parsed-class'"))))
    (gethash subclass-check *parsed-class-field-slot-accessor-mapping-table*)))

;; :EXAMPLE
;;  (accessor-to-field-table (make-instance 'parsed-inventory-record))
;;  (accessor-to-field-table (make-instance 'parsed-artist-record))
;;  (accessor-to-field-table (make-instance 'parsed-technique-record))
(defmethod accessor-to-field-table ((object parsed-class))
  (accessor-to-field-table (parsed-class-mapped object)))

;; :EXAMPLE
;;  (field-to-accessor-table (make-instance 'parsed-inventory-record))
;;  (field-to-accessor-table (make-instance 'parsed-artist-record))
;;  (field-to-accessor-table (make-instance 'parsed-technique-record))
(defmethod field-to-accessor-table ((object parsed-class))
  (field-to-accessor-table (parsed-class-mapped object)))

(defclass parsed-naf-entity (parsed-class)
  ()
  (:documentation #.(format nil "Base class for parsing naf-entity records.~%~@
:SEE-ALSO `parsed-artist-record', `parsed-author-record',~%~
`parsed-person-record', `parsed-brand-record', `parsed-publication-record'.~%▶▶▶")))



;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:


;;; ==============================
;;; EOF
