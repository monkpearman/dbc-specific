;;; :FILE-CREATED <Timestamp: #{2011-05-21T12:51:43-04:00Z}#{11206} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-entity-location.lisp
;;; ==============================

;;; ==============================
;;; :NOTES 
;;; Class definitions, methods, variables for location entities
;;;
;;; base-dbc
;;; - base-entity
;;; -- base-location-entity
;;; --- location-entity
;;; ---- location-entity-verified
;;; ---- location-entity-unverified
;;; ---- location-entity-imagined
;;;
;;; Some form of the following is necessary, but it isn't yet clear where they go:
;;; location-entity-nationality (location-entity-????)
;;; location-entity-birth       (location-entity-????)
;;; location-entity-death       (location-entity-????) 
;;; location-entity-published   (location-entity-????)
;;;
;;; Are they: 
;;;
;;; - subclasses of base-entity
;;; - subclasses of location-entity
;;; - slot-values of location-entity
;;; - slot-values/sub-classes of some naf-entity specific subclass of location-entity
;;;   e.g. naf-location-entity
;;;
;;; ==============================
;;;
;;; :NOTE How to handle situations when an instance of
;;; `location-entity-unverified' becomes verified IOW how best to convert it to
;;; `location-entity-verified'
;;;
;;; Obv. we can `cl:change-class' it but what are the specifics we need to take
;;; into consideration esp. w/r/t persistence?
;;; 
;;; :SEE (info "(ansicl)change-class")
;;; :SEE (info "(ansicl)Changing the Class of an Instance")
;;; :SEE (info "(ansicl)shared-initialize")
;;; :SEE (info "(ansicl)update-instance-for-different-class)")
;;; :SEE (info "(ansicl)update-instance-for-redefined-class)")
;;; :SEE Keene: 
;;;      Section 8.4  "Changing The Class of An Instance" pg 151
;;;      Section 10.6 "Declaring Initarg Names As Valid" pg 170 
;;;
;;; ==============================


(in-package #:dbc)
;; *package*

(defclass location-entity (base-location-entity)
  ((display-name
    :initarg :display-name 
    ;; :initform 
    ;; (make-instance 'base-display-name-for-entity-type  
    ;;                :display-name-for-entity <DISPLAY-NAME>
    ;;                :display-name-for-entity-type '<location-entity-???>)
    ;; 
    ;; :initform  ;; (or (and (mon:string-not-empty <FORM>) <FORM>) (error "String 
    ;; :documentation "The default display-name for an entity. Its")
   (appellations-modern
    :initarg :appellations-modern
    :initform nil
    :documentation 
    #.(format nil
              "Enumeration of appellations used in _modern_ parlance \(i.e. contemporary usage\).~%~@
Used to disambiguate identification of a geographic entity.~%~@
For example, \"India\" as opposed to \"Hindostan\" or \"Ganges\".~% ~
When non-nil slot-value is a [ <STRING> | <LIST-OF-STRINGS> ].~%~@
:EXAMPLE~%
 \"Republic of India\"~% ~
 \(\"India\" \"Republic of India\"\)~%"))
   (appellations-historic
    :initarg :appellations-historic
    :initform nil
    :documentation 
    #.(format nil
              "Enumeration of historic appellations used in _non-modern_ parlance \(i.e. non-contemporary\).~%~@
Used to disambiguate identification of a geographic entity.~%~@
For example, \"Hindostan\" as opposed to \"Republic of India\".~%~@
Enumeration of appellations used in _modern_ parlance \(i.e. contempory usage\).~%~@
Used to disambiguate identification of a geographic entity.~%~@
For example, India as opposed to Hindostan or Ganges.~% ~
When non-nil slot-value is a [ <STRING> | <LIST-OF-STRINGS> ].~%~@
:EXAMPLE~%
 \"Hindostan\"~% ~
 \(\"Hindostan\" \"Ganges\"\)~%"))
   )
  :documentation 
  #.(format nil
            "Top-level from which location-entity~%~@
:SEE-ALSO `<XREF>'.~%►►►"))
  )


;; 
(defclass location-entity-verified (location-entity)
  ()
  (:documentation 
   #.(format nil 
             "
:SEE-ALSO `<XREF>'.~%►►►"
             )))

(defclass location-entity-imagined (location-entity)
  ()
  (:documentation 
   #.(format nil 
             "
e.g. \"Here there be dragons.\"
:SEE-ALSO `<XREF>'.~%►►►"
             )))

(defclass location-entity-unverified (location-entity)
  ()
  (:documentation 
   #.(format nil 
             "
:SEE-ALSO `<XREF>'.~%►►►"
             )))


;;; ==============================
;;; EOF
