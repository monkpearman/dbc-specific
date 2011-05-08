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
;;; --- naf-entity-location  ???
;;;
;;; ==============================



(in-package #:dbc)

;; *package*

(defclass base-entity (base-dbc)
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
:SEE-ALSO .~%►►►")))

(defclass base-theme-entity (base-entity)
  ()
  (:documentation 
   #.(format nil 
             "Base class for referencing DBC system theme entities.~%~@
             :SEE-ALSO `theme-entity-regexp'.~%►►►")))

(defclass base-category-entity (base-entity)
  ()
  (:documentation 
   #.(format nil 
             "Base class for referencing DBC system category entities.~%~@
:SEE-ALSO `category-entity-regexp'.~%►►►")))

(defclass base-naf-entity (base-entity)
  ()
  (:documentation 
   #.(format nil 
             "Base class for referencing DBC system NAF entities.~%~@
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
             :SEE-ALSO `naf-entity-type-regexp', `naf-entity-control-name-regexp',~%~
             `naf-entity-alt-name-regexp'.~%►►►")))

;;; ==============================

;; 

;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
