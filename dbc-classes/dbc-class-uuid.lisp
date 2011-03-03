;;; :FILE-CREATED <Timestamp: #{2011-03-03T15:58:19-05:00Z}#{11094} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-uuid.lisp
;;; ==============================

;;; ==============================
;;; :NOTE
;;;
;;; ==============================

;; (uuid:make-v4-uuid) => 9CEA357D-470C-42D2-9CC8-298F6A27C04F
;; (uuid:make-uuid-from-string "9CEA357D-470C-42D2-9CC8-298F6A27C04F")
;; 

;; (uuid:make-v5-uuid (uuid:make-uuid-from-string "9CEA357D-470C-42D2-9CC8-298F6A27C04F") "Cappiello (Leonetto)")
;; 5B12B7DA-FF63-5FA2-98A3-D2483E627B7D


(in-package #:dbc)

;; *package*


(defclass base-uuid (base-dbc)
  ()
  (:documentation 
   #.(format nil "Base class for referencing dbc system objects by UUID.")))

;;; ==============================
;;
;; This was originally in dbc-class.lisp we don't need it anymore.
;; (defclass system-uuid (base-uuid)
;;   ((uuid-type)
;;    ;; :initform :initarg :accessor
;;    (read-only :initform nil :initarg :read-only)) ;;:reader)
;;   ;; :documentation "a base uuid class")
;;   :documentation "UUID fo subclasses of class base-dbc")

;;; ==============================

#|

(uuid-class-namespace
 :initarg uuid-class-namespace
 :initform nil
 ;; :accessor 
 ;; :allocation class ;; Its likely classes will want to share this
 :documentation
 #.(format nil "The namespace UUID slots of a class instance should be instantiated in.~%~@
                This is likely always a class-allocated slot.~%~@
                It should evaluate to a global variables whose value is read from a file upon~@
                system initialization.~%~@
                :SEE `uuid:make-v5-uuid'."))

 (uuid:make-v5-uuid 

|#

;; 

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
