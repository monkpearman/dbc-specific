;;; :FILE-CREATED <Timestamp: #{2011-03-03T15:50:48-05:00Z}#{11094} - by MON>
;;; :FILE dbc-classes/dbc-class-description.lisp
;;; ==============================



(in-package #:dbc)

;; base-description                        (base-dbc)
;; base-description-external               (base-description)
;; base-description-internal               (base-description)
;; base-description-entity                 (base-description)
;; base-description-entity-internal        (base-description-internal base-description-entity)
;; base-description-entity-external        (base-description-external base-description-entity)
;; base-description-media-entity-note      (base-description-entity-internal)
;; description-media-entity-technique-note (base-description-media-entity-note)
;; description-media-entity-material-note  (base-description-media-entity-note)
;; description-media-entity-mount-note     (base-description-media-entity-note)
;; description-media-entity-color-note     (base-description-media-entity-note)
;; base-description-entity-location-note   (base-description-entity-internal)

;; base-description-naf-entity             (base-description-entity)  ;; (base-description base-dbc)
;; base-description-naf-entity-internal    (base-description-naf-entity base-description-entity-internal) 

;; naf-entity (base-description base-dbc)
;; entity-internal
;; (base-description-internal base-description-entity)
;; base-description          | base-description

;;; ==============================
;; `parsed-technique-record'
;; description-media-entity-technique-note      ; <INTERNAL>
;;
;; `parsed-artist-record'
;; description-artist-note-general              ; <INTERNAL>
;; description-artist-note-sale-appearance      ; <INTERNAL>
;; ignorable-special-note                       ; <INTERNAL>
;;
;; `parsed-author-record'
;; description-author-note-general              ; <INTERNAL>
;;
;; `parsed-brand-record'
;; description-brand-note-general               ; <INTERNAL>
;;
;; `parsed-person-record'
;; description-person-note-general              ; <INTERNAL>
;;
;; `parsed-publication-record'
;; description-publication-note-content         ; <INTERNAL>
;; description-publication-note-general         ; <INTERNAL>
;; description-publication-note-special         ; <INTERNAL>
;; description-publication-note-sale-appearance ; <INTERNAL>
;;
;; `parsed-inventory-record'
;; description-inventory-condition              ; <EXTERNAL>
;; description-inventory-title                  ; <EXTERNAL>
;; description-inventory-french                 ; <EXTERNAL>
;; description-inventory-english                ; <EXTERNAL>
;; description-inventory-quote                  ; <EXTERNAL>
;; description-inventory-translation            ; <EXTERNAL>
;; description-inventory-seo-title              ; <INTERNAL>
;; description-inventory-seo                    ; <INTERNAL>
;; keyword-sequenced-entity-coref               ; <INTERNAL>
;; keyword-seo-sequenced-entity-coref           ; <INTERNAL>
;; ignorable-notes                              ; <INTERNAL>
;; ignorable-history-french                     ; <INTERNAL>
;; ignorable-history-english                    ; <INTERNAL>
;; ignorable-keywords-type                      ; <INTERNAL>
;;
;;; ==============================


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
descriptions of some aspect of an object in the dbc system.~%~@
:SEE-ALSO `base-description-internal'.~%")))

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
:SEE-ALSO `base-description-external'.~%")))

;; ABSTRACT-CLASS
;; ;; `base-description-item' a bad name
;; (defclass base-description-inventory-record (base-description)
;;   ()
;;   (:documentation
;;    #.(format nil
;;              "ABSTRACT-CLASS
;; Used to annotate some particular internal aspect about a subclass of `base-entity'.~%")))

;; ABSTRACT-CLASS
(defclass base-description-entity (base-description)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS~%~
Used to annotate some particular internal aspect about a subclass of `base-entity'.~%")))

;; ABSTRACT-CLASS
(defclass base-description-entity-internal (base-description-internal base-description-entity)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS~%~
Used to annotate some particular internal aspect about a subclass of `base-entity'.~%")))

(defclass base-description-entity-external (base-description-external base-description-entity)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS~%~
Used to annotate some particular external aspect about a subclass of `base-entity' for external display.~%")))

;; ABSTRACT-CLASS
(defclass base-description-location-entity-note (base-description-entity-internal)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS~%~
Used to annotate some particular internal aspect about a subclass of `base-location-entity'.~%")))

(defclass base-description-taxon-entity-note (base-description-entity-internal)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS~%~
Used to annotate some particular internal aspect about a subclass of `base-taxon-entity'.~%")))

;; base-description-media-entity-note

;; ABSTRACT-CLASS
(defclass base-description-media-entity-note (base-description-entity-internal)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS~%~
Used to annotate some particular internal aspect about a subclass of `base-media-entity'.~%")))

(defclass description-media-entity-technique-note (base-description-media-entity-note)
  ()
  (:documentation
   #.(format nil
             "Used to annotate some particular internal aspect about a `media-entity-technique'.~%")))

(defclass description-media-entity-material-note (base-description-media-entity-note)
  ()
  (:documentation
   #.(format nil
             "Used to annotate some particular internal aspect about a `media-entity-material'.~%")))

(defclass description-media-entity-mount-note (base-description-media-entity-note)
  ()
  (:documentation
   #.(format nil
             "Used to annotate some particular internal aspect about a `media-entity-mount'.~%")))

(defclass description-media-entity-color-note (base-description-media-entity-note)
  ()
  (:documentation
   #.(format nil
             "Used to annotate some particular internal aspect about a `media-entity-color'.~%")))

(defclass base-description-naf-entity (base-description-entity)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS~%~
Used to annotate some particular aspect about a subclass of `base-entity'.~%")))

;; :ABSTRACT-CLASS
(defclass base-description-naf-entity-internal (base-description-naf-entity base-description-entity-internal)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS~%~
Used to annotate some particular internal aspect about a subclass of `base-naf-entity'.~%")))

;; :ABSTRACT-CLASS
(defclass base-description-naf-entity-external (base-description-naf-entity base-description-entity-external)
  ()
  (:documentation
   #.(format nil
             "ABSTRACT-CLASS~%~
Used to annotate some particular external aspect about a subclass of `base-naf-entity'.~%")))


;; thes have too much commonality so we need
;; (defclass description-naf-entity-note ()

;; (defclass description-publication-note-content ()) ;; internal
;; (defclass description-publication-note-general ()) ;; internal
;; (defclass description-publication-note-special ()) ;; internal
;; (defclass description-publication-note-sale-appearance ()) ;; internal

;; (defclass description-artist-note-general ())         ;; internal
;; (defclass description-artist-note-sale-appearance ()) ;; internal


;; The class `parsed-inventory-record' has the following external slots:
;;  description-inventory-title
;;  description-inventory-english
;;  description-inventory-french
;;  description-inventory-quote
;;  description-inventory-translation
;;  description-inventory-condition

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
