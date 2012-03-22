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
;; *package*

(defclass base-entity (base-dbc)
  ;; :NOTE this is prob. the best place to provide a UUID for entities.
  () 
  (:documentation 
   #.(format nil 
             "Base class for referencing DBC system entities.~%~@
An entity is a \"non-abstract\" object capable of being represented by the DBC
 system.~%~@
An object is not abstract if it represents an object knowable outside the~%~
context of the DBC system.~%~@
For an object to be characterized as of this type it should be a known~%~
referenceable in common nomenclature or the nomenclature of its primary
external domain.~%~@
The inverse corollary to the class `base-entity' is the class `base-record'.~%~@
:EXAMPLE~% ~
 \(mon:class-subclasses \(find-class 'base-entity\)\)~%~@
:SEE-ALSO .~%▶▶▶")))

(defclass base-theme-entity (base-entity)
  ()
  (:documentation 
   #.(format nil 
             "Base class for referencing DBC system theme entities.~%~@
             :EXAMPLE~% ~
             \(mon:class-subclasses \(find-class 'base-theme-entity\)\)~%~@
             :SEE-ALSO `theme-entity-regexp'.~%▶▶▶")))

(defclass base-category-entity (base-entity)
  ()
  (:documentation 
   #.(format nil 
             "Base class for referencing DBC system category entities.~%~@
             :EXAMPLE~% ~
              \(mon:class-subclasses \(find-class 'base-category-entity\)\)
             :SEE-ALSO `category-entity-regexp'.~%▶▶▶")))


(defclass base-taxon-entity (base-entity)
  ()
  (:documentation #.(format nil
                            "Base class for referencing DBC taxonomic entitites.~%~% ~
 ,----~%~
 | taxon, \(pl. taxa\), n.~%~
 | taxonomic unit, whether named or not: i.e. a population, or group of populations~%~
 | of organisms which are usually inferred to be phylogenetically related and which~%~
 | have characters in common which differentiate \(q.v.\) the unit \(e.g. a geographic~%~
 | population, a genus, a family, an order\) from other such units. A taxon~%~
 | encompasses all included taxa of lower rank \(q.v.\) and individual organisms.~%~
 `---- The Glossary of the International Code of Zoological Nomenclature \(1999\).~%~@
Precedence list of taxonmic rank:~%~% ~
 life~% ~
 - domain~% ~
 -- kingdom~% ~
 --- phylum~% ~
 ---- class~% ~
 ----- order~% ~
 ------ family~% ~
 ------- genus~% ~
 -------- species~%~@
And more specifically we are concerned with the mapping from:~%~% ~
  historic-appellation -> modern-appellation~%~@
:NOTE the decision to use the sybmolic prefix ``taxon'' is because i can
 _NEVER_ remember how to spell Linnaeus/Linnaean...~%")))

(defclass base-naf-entity (base-entity)
  ()
  (:documentation 
   #.(format nil 
             "Base class for referencing DBC system NAF entities.~%~@
              :EXAMPLE~% ~
               \(mon:class-subclasses \(find-class 'base-naf-entity\)\)
              :SEE-ALSO `control-id-naf-entity-type', `control-id-naf-entity',~%~
              `control-id-naf-entity-display-name', `naf-entity-type-regexp',~%~
              `naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶")))

;; base-entity               (base-dbc)
;; - base-media-entity       (base-entity)
;; -- media-entity-technique (base-media-entity)
;; -- media-entity-material  (base-media-entity)
;; -- media-entity-mount     (base-media-entity)
;; -- media-entity-color     (base-media-entity)
(defclass base-media-entity (base-entity)
  ()
  (:documentation 
   #.(format nil 
             "Base class for referencing DBC system media entities.~%~@
              Media entities include:~% ~
               - techniques~%   ~
                 -- engraving, lithograph, photograph, offset, etc.~% ~
               - materials~%   ~
                 -- paper, fabric, cardstock, etc.~% ~
               - mounts~%   ~
                  -- linen backed, dry mounted, etc.~% ~
               - color~%   ~
                 -- black and white, red, white, blue, etc.~%~@
             :EXAMPLE~% ~
              \(mon:class-subclasses \(find-class 'base-media-entity\)\)
:SEE-ALSO `media-entity-technique',`media-entity-material',
`media-entity-mount', `media-entity-color',
`base-description-media-entity-note', `naf-entity-type-regexp',
`naf-entity-control-name-regexp', `naf-entity-alt-name-regexp'.~%▶▶▶")))

;; base-entity                    (base-dbc)
;; - base-location-entity         (base-entity)
;; -- location-entity             (base-location-entity)
;; --- location-entity-verified   (location-entity)
;; --- location-entity-unverified (location-entity)
;; --- location-entity-imagined   (location-entity)
(defclass base-location-entity (base-entity)
   ()
  (:documentation 
   #.(format nil 
             "Base class for referencing DBC system location entities.~%~@
              Location entities correspond with physical places.~%~@
A physical place may be \"real\", \"imagined\", \"unverified\".~%~@
Distinctions around whether a place is real, imagined, or unverified are broadly
understood as follows:~% ~%
 - A real place is one that is i.e. it is known to have existed in a given
   temporaral context.~% ~
 - An imagined place is one that is believed to never have existed in the known
   temporaral contexts of the DBC system.~% ~
 - An unverified place is one that is believed to have existed in some
   temporaral context (known or as yet undefined) but which can not be verified
   or corroborated as such.~%~@
:EXAMPLE~% ~
 \(mon:class-subclasses \(find-class 'base-location-entity\)\)
:SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp',~%~
`naf-entity-alt-name-regexp'.~%▶▶▶")))


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
