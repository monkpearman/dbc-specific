;;; :FILE-CREATED <Timestamp: #{2011-05-21T12:51:43-04:00Z}#{11206} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-location-entity.lisp
;;; ==============================

;;; ==============================
;; :NOTE
;; Class definitions, methods, variables for location entities
;;
;; base-dbc
;; - base-entity
;; -- base-location-entity
;; --- location-entity
;; ---- location-entity-verified
;; ---- location-entity-unverified
;; ---- location-entity-imagined
;;
;; *control-id-display-location-namespace*
;; --- control-id-location-entity-type           (control-id-entity-type)
;; ---- control-id-location-entity               (control-id-location-entity-type)
;; ----- control-id-location-entity-display-name (control-id-location-entity control-id-display-name-for-entity-type)
;; ------ control-id-display-location            (control-id-location-entity-display-name)
;;
;;
;; Some form of the following is necessary, but it isn't yet clear where they go:
;; location-entity-nationality (location-entity-????)
;; location-entity-birth       (location-entity-????)
;; location-entity-death       (location-entity-????)
;; location-entity-published   (location-entity-????)
;;
;; Are they:
;;
;; - subclasses of base-entity
;; - subclasses of location-entity
;; - slot-values of location-entity
;; - slot-values/sub-classes of some naf-entity specific subclass of location-entity
;;   e.g. naf-location-entity
;;
;;
;; :NOTE How do we partition Country, Region, Province, City, Street-address etc.?
;;
;;
;; Related classes:
;; control-id-display-location (control-id-display-name-for-entity-type control-id-display-name base-control-id base-dbc)
;; Slots
;; `location-nation'       <- parsed-brand-record
;; `location-nationality'  <- parsed-artist-record, parsed-author-record, parsed-person-record,

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

(defclass location-entity (base-location-entity)
  ((display-name
    ;; control-id-display-location
    :initarg :display-name
    ;; :initform
    ;; (make-instance 'base-display-name-for-entity-type
    ;;                :display-name-for-entity <DISPLAY-NAME>
    ;;                :display-name-for-entity-type '<location-entity-???>)
    ;;
    ;; :initform  ;; (or (and (mon:string-not-empty <FORM>) <FORM>) (error "String
    :documentation #.(classdoc 'location-entity :display-name))
   (appellations-modern
    :initarg :appellations-modern
    :initform nil
    :documentation #.(classdoc 'location-entity :appellations-modern))
   (appellations-historic
    :initarg :appellations-historic
    :initform nil
   :documentation #.(classdoc 'location-entity :appellations-historic)))
  (:default-initargs :display-name nil
                     :appellations-modern nil
                     :appellations-historic nil)
  (:documentation  #.(classdoc 'location-entity :class-doc)))

;; (mon:class-subclasses (find-class 'location-entity-verified))

(defclass location-entity-verified (location-entity)
  ()
  (:documentation  #.(classdoc 'location-entity-verified :class-doc)))

(defclass location-entity-imagined (location-entity)
  ()
  (:documentation  #.(classdoc 'location-entity-imagined :class-doc)))

(defclass location-entity-unverified (location-entity)
  ()
  (:documentation  #.(classdoc 'location-entity-unverified :class-doc)))


;;; ==============================

;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
