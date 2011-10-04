;;; :FILE-CREATED <Timestamp: #{2011-03-03T15:50:48-05:00Z}#{11094} - by MON>
;;; :FILE dbc-classes/dbc-class-description.lisp
;;; ==============================

;;; ==============================
;;; :NOTE
;;;
;;; ==============================


(in-package #:dbc)
;; *package*

;; base-description                        (base-dbc)
;; base-description-external               (base-description)
;; base-description-internal               (base-description)
;; base-description-entity                 (base-description)
;; base-description-entity-internal        (base-description-internal base-description-entity)
;; base-description-entity-external        (base-description-external base-description-entity)
;; base-description-entity-media-note      (base-description-entity-internal)
;; description-media-entity-technique-note (base-description-entity-media-note)
;; description-media-entity-material-note  (base-description-entity-media-note)
;; description-media-entity-mount-note     (base-description-entity-media-note)
;; base-description-entity-location-note   (base-description-entity-internal)

;; ABSTRACT-CLASS
(defclass base-description (base-dbc)
  ;; description-uuid ???
  ()
  (:documentation 
   #.(format nil 
             "ABSTRACT-CLASS~%~
              Base class for referencing dbc descriptions.~%~@
              A description is like a document but smaller and with less attributes.~%~@
             Examples of of descriptions include the item-ref slots:~%~% ~
               description-item-title        description-item-english~% ~
               description-item-french       description-item-quote~% ~
               description-item-translation  description-item-condition~%")))

;; ABSTRACT-CLASS
(defclass base-description-external (base-description)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS~%~
Instances of this class are used to provide public exerternally visible~%~
descriptions of some aspect of an object in the dbc system.~%")))

;; ABSTRACT-CLASS
(defclass base-description-internal (base-description)
  ()
  (:documentation 
   #.(format nil
             "ABSTRACT-CLASS~%~
Instance of this class are used internally to annotate or describe some~%~
aspect of a class, a class instance, or some slot(s) comprising a class instance.~%~@
The purpose of the class is distinct from the :documentation value for a slot or class~%~
b/c its instances provide descriptions about a particular state of a class~%~
instance or slot and not their global domain or range.~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")))

;; ABSTRACT-CLASS
(defclass base-description-entity (base-description)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS
Used to annotate some particular internal aspect about a subclass of `base-entity'.")))

;; ABSTRACT-CLASS
(defclass base-description-entity-internal (base-description-internal base-description-entity)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS
Used to annotate some particular internal aspect about a subclass of `base-entity'.")))

;; ABSTRACT-CLASS
(defclass base-description-location-entity-note (base-description-entity-internal)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS
Used to annotate some particular internal aspect about a subclass of `base-location-entity'.")))

;; ABSTRACT-CLASS
(defclass base-description-media-entity-note (base-description-entity-internal)
  ()
  (:documentation 
   #.(format nil
             "ABSTRACT-CLASS~%~
Used to annotate some particular internal aspect about a subclass of `base-media-entity'.")))

(defclass description-media-entity-technique-note (base-description-entity-media-note)
  ()
  (:documentation 
   #.(format nil
             "Used to annotate some particular internal aspect about a `media-technique-entity'.")))

(defclass description-media-entity-material-note (base-description-entity-media-note)
  ()
  (:documentation 
   #.(format nil
             "Used to annotate some particular internal aspect about a `media-material-entity'.")))

(defclass description-media-entity-mount-note (base-description-entity-media-note)
  ()
  (:documentation 
   #.(format nil
             "Used to annotate some particular internal aspect about a `media-mount-entity'.")))

;; (defclass description-publication-note-content ()) ;; internal
;; (defclass description-publication-note-general ()) ;; internal
;; (defclass description-publication-note-special ()) ;; internal
;; (defclass description-publication-note-sale-appearance ()) ;; internal

;; (defclass description-artist-note-general ())         ;; internal
;; (defclass description-artist-note-sale-appearance ()) ;; internal


;; The class `parse-ref' has the following external slots:
;;  description-item-title
;;  description-item-english
;;  description-item-french
;;  description-item-quote
;;  description-item-translation
;;  description-item-condition

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
