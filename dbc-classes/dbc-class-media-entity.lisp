;;; :FILE-CREATED <Timestamp: #{2011-10-04T14:37:50-04:00Z}#{11402} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-media-entity.lisp
;;; ==============================

(in-package #:dbc)

;; base-entity               (base-dbc)
;; - base-media-entity       (base-entity)
;; -- media-entity-technique (base-media-entity)
;; -- media-entity-material  (base-media-entity)
;; -- media-entity-mount     (base-media-entity)
;; -- media-entity-color     (base-media-entity)

(defclass media-entity-technique (base-media-entity)
  ()
  (:documentation #.(format nil "Instances of this class used to describe techniques used in the production of a particular type of media.")))

(defclass media-entity-material (base-media-entity)
  ()
  (:documentation #.(format nil "Instances of this class used to describe materials used in the production of a particular type of media.")))

(defclass media-entity-mount (base-media-entity)
  ()
  (:documentation #.(format nil "Instances of this class used to describe the mounting used in with a particular type of media.")))

(defclass media-entity-color (base-media-entity)
  ()
  (:documentation 
   #.(format nil 
             "Instances of this class used to describe aspects of the color of a particular type of media.~%~@
              Example uses include:~%~% ~
              - slots indicating whether a color is represented by an HSV, RGB, or CMYK value;~% ~
              - slot indicating a cannonical or standardized display name of a particular color value;~% ~
              - slot indicating corefs to a cannonical or standardized display name of a particular color value;~% ~
              - slot indicating whether color has a generalized parent category, e.g. ruby-red is subsumed by red;~% ~")))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
