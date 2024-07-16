;;; :FILE-CREATED <Timestamp: #{2011-03-04T21:25:30-05:00Z}#{11095} - by MON>
;;; :FILE dbc-classes/dbc-class-entity.lisp
;;; ==============================

;; Clarke's Third Law:
;; "Any sufficiently advanced technology is indistinguishable from magic."
;;
;;
;; An "entity" is something we want to treat as uniquely identifiable.
;; An entity is distinct from a "record".
;; Both an entity and a record are uniquely identifiable, the difference being
;; that where a record might uniquely identify some _thing_, the thing so
;; identified will not have an identity commonly recognized outside the context
;; of the thing it identifies.
;; For example, instances which subcclass `base-inventory-record' will identify
;; an inventory item, wheras instances of `base-theme-entity' will identify a
;; theme. A theme is knowable outside the context of the dbc system an inventory
;; item not so much so.

;;; ==============================
;; :NOTE C-P-L for DBC entities
;; base-dbc
;; - base-entity
;; -- base-theme-entity
;; -- base-category-entity
;; -- base-naf-entity
;; -- base-media-entity
;; -- base-location-entity
;; -- base-taxon-entity
;;
;;     _________________ Below should have their own files
;;
;; --- naf-entity-person
;; --- naf-entity-artist
;; --- naf-entity-author
;; --- naf-entity-brand
;; --- naf-entity-publication
;;
;; --- naf-entity-publisher ???
;;
;; dbc-classes/dbc-class-media-entity.lisp
;; --- media-entity-technique (base-media-entity)
;; --- media-entity-material  (base-media-entity)
;; --- media-entity-mount     (base-media-entity)
;; --- media-entity-color     (base-media-entity)
;;
;; dbc-classes/dbc-class-location-entity.lisp
;; --- location-entity             (base-location-entity)
;; ---- location-entity-verified   (location-entity)
;; ---- location-entity-unverified (location-entity)
;; ---- location-entity-imagined   (location-entity)
;;
;;
;;; ==============================
;; The naming scheme we try to abide when referencing <FOO>-entity-<BAR>:
;; base-media-entity
;;  -> media-entity-<FOO>
;;
;; base-naf-entity
;;  -> naf-entity-<FOO>
;;
;; base-category-entity
;;  -> category-entity-<FOO>
;;
;; base-theme-entity
;;  -> theme-enity-<FOO>
;;
;; base-location-entity
;;  -> location-entity-<FOO>

;;; ==============================



(in-package #:dbc)


(defclass base-entity (base-dbc)
  ;; :NOTE this is prob. the best place to provide a UUID for entities.
  ()
  (:documentation  #.(classdoc 'base-entity :class-doc)))

(defclass base-theme-entity (base-entity)
  ()
  (:documentation  #.(classdoc 'base-theme-entity :class-doc)))

(defclass base-category-entity (base-entity)
  ()
  (:documentation  #.(classdoc 'base-category-entity :class-doc)))

(defclass base-taxon-entity (base-entity)
  ()
  (:documentation  #.(classdoc 'base-taxon-entity :class-doc)))

(defclass base-naf-entity (base-entity)
  ()
  (:documentation  #.(classdoc 'base-naf-entity :class-doc)))

;; base-entity               (base-dbc)
;; - base-media-entity       (base-entity)
;; -- media-entity-technique (base-media-entity)
;; -- media-entity-material  (base-media-entity)
;; -- media-entity-mount     (base-media-entity)
;; -- media-entity-color     (base-media-entity)
(defclass base-media-entity (base-entity)
  ()
  (:documentation  #.(classdoc 'base-media-entity :class-doc)))

;; base-entity                    (base-dbc)
;; - base-location-entity         (base-entity)
;; -- location-entity             (base-location-entity)
;; --- location-entity-verified   (location-entity)
;; --- location-entity-unverified (location-entity)
;; --- location-entity-imagined   (location-entity)
(defclass base-location-entity (base-entity)
   ()
   (:documentation  #.(classdoc 'base-location-entity :class-doc)))


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
