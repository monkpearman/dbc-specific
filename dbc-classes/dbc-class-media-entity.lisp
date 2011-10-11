;;; :FILE-CREATED <Timestamp: #{2011-10-04T14:37:50-04:00Z}#{11402} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-media-entity.lisp
;;; ==============================

(in-package #:dbc)

;; base-entity               (base-dbc)
;; - base-media-entity       (base-entity)
;; -- media-entity-technique (base-media-entity)
;; -- media-entity-material  (base-media-entity)
;; --- media-entity-paper    (media-entity-material)
;; -- media-entity-mount     (base-media-entity)
;; -- media-entity-color     (base-media-entity)

;; --- control-id-media-entity-type              (control-id-entity-type)
;; ---- control-id-media-entity                  (control-id-media-entity-type) 
;; ----- control-id-media-entity-display-name    (control-id-media-entity control-id-display-name-for-entity-type)
;; ------ control-id-display-technique           (control-id-media-entity-display-name)
;; ------ control-id-display-mount               (control-id-media-entity-display-name)
;; ------ control-id-display-material            (control-id-media-entity-display-name)
;; ****** control-id-display-color               (control-id-media-entity-display-name) ;; inactive

;; *control-id-display-technique-namespace*
;; *control-id-display-material-namespace*
;; *control-id-display-mount-namespace*
;; *control-id-display-color-namespace*

(defclass media-entity-technique (base-media-entity)
  ()
  (:documentation 
   #.(format nil 
             "Instances of this class used to describe techniques used in the production of a
particular type of media.~%~@
Possible (generalized) examples of a technique include:~% ~
 engraving, lithograph, photography, offset, etc.~%~@
:SEE-ALSO `description-media-entity-technique-note', `base-media-entity',~%~
`media-entity-technique', `media-entity-material', `media-entity-mount',~%~
`media-entity-color'.~%▶▶▶")))

(defclass media-entity-material (base-media-entity)
  ()
  (:documentation
   #.(format nil 
"Instances of this class used to describe materials used in the production of a particular type of media.~%~@
Slot values might be used to indicate the type of material \(i.e. paper, fabric,
plastic, etc.\) as well as various aspects of its composition, e.g. whether it
is glazed, cold-rolled, 10mil, etc.~%~@
:SEE-ALSO `description-media-entity-material-note', `base-media-entity',~%~
`media-entity-technique', `media-entity-paper', `media-entity-mount',~%~
`media-entity-color'.~%▶▶▶")))

(defclass media-entity-paper (media-entity-material)
  ()
  (:documentation 
   #.(format nil
             "Instances of this class used to describe materials generally construed as being of the type \"paper\".
:SEE-ALSO `description-media-entity-material-note', `base-media-entity',~%~
`media-entity-technique', `media-entity-material', `media-entity-mount',~%~
`media-entity-color'.~%▶▶▶")))

;; ("paper"             . media-entity-paper) ; media-entity-material

(defclass media-entity-mount (base-media-entity)
  ()
  (:documentation 
   #.(format nil 
             "Instances of this class used to describe the mounting used in with a particular type of media.~%~@
              Slot values might be used to indicate the type of mount and its state,~%~
              i.e. whether the media is linen backed, dry mounted, framed, etc.~%~
              :SEE-ALSO `description-media-entity-mount-note' `base-media-entity',~%~
              `media-entity-technique', `media-entity-material', `media-entity-mount',~%~
              `media-entity-color'.~%▶▶▶")))

(defclass media-entity-color (base-media-entity)
  ()
  (:documentation 
   #.(format nil 
             "Instances of this class used to describe aspects of the color of a particular type of media.~%~@
              Example uses include:~%~% ~
              - slots indicating whether a color is represented by an HSV, RGB, or CMYK value;~% ~
              - slot indicating a cannonical or standardized display name of a particular color value;~% ~
              - slot indicating corefs to a cannonical or standardized display name of a particular color value;~% ~
              - slot indicating whether color has a generalized parent category, e.g. ruby-red is subsumed by red;~%~
             :SEE-ALSO `description-media-entity-color-note', `base-media-entity',~%~
             `media-entity-technique', `media-entity-material', `media-entity-mount',~%~
             `media-entity-color'.~%▶▶▶")))


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
