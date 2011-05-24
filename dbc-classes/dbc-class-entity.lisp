;;; :FILE-CREATED <Timestamp: #{2011-03-04T21:25:30-05:00Z}#{11095} - by MON>
;;; :FILE dbc-classes/dbc-class-entity.lisp
;;; ==============================


;;; ==============================
;;; :NOTE C-P-L for DBC entities
;;; base-dbc
;;; - base-entity
;;; -- base-category-entity
;;; -- base-theme-entity
;;; -- base-naf-entity
;;;     _________________ Below should have their own files
;;;
;;; --- naf-entity-person
;;; --- naf-entity-artist
;;; --- naf-entity-author
;;; --- naf-entity-brand
;;; --- naf-entity-publication 
;;;
;;; --- naf-entity-publisher ???
;;; --- naf-entity-linnaean  ???
;;;
;;; -- base-location-entity
;;; --- location-entity
;;; ---- location-entity-verified
;;; ---- location-entity-unverified
;;; ---- location-entity-imagined
;;;
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
external domain.~%
:EXAMPLE~% ~
 \(mon:class-subclasses \(find-class 'base-entity\)\)~%~@
:SEE-ALSO .~%►►►")))

(defclass base-theme-entity (base-entity)
  ()
  (:documentation 
   #.(format nil 
             "Base class for referencing DBC system theme entities.~%~@
             :EXAMPLE~% ~
             \(mon:class-subclasses \(find-class 'base-theme-entity\)\)~%~@
             :SEE-ALSO `theme-entity-regexp'.~%►►►")))

(defclass base-category-entity (base-entity)
  ()
  (:documentation 
   #.(format nil 
             "Base class for referencing DBC system category entities.~%~@
             :EXAMPLE~% ~
              \(mon:class-subclasses \(find-class 'base-category-entity\)\)
             :SEE-ALSO `category-entity-regexp'.~%►►►")))

(defclass base-naf-entity (base-entity)
  ()
  (:documentation 
   #.(format nil 
             "Base class for referencing DBC system NAF entities.~%~@
              :EXAMPLE~% ~
               \(mon:class-subclasses \(find-class 'base-naf-entity\)\)
             :SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp',~%~
             `naf-entity-alt-name-regexp'.~%►►►")))

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
             :SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp',~%~
             `naf-entity-alt-name-regexp'.~%►►►")))

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
`naf-entity-alt-name-regexp'.~%►►►")))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
