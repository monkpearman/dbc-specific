;;; :FILE-CREATED <Timestamp: #{2011-03-03T15:36:12-05:00Z}#{11094} - by MON>
;;; :FILE dbc-classes/dbc-class-users.lisp
;;; ==============================



(in-package #:dbc)


(defclass base-user (base-dbc)
  ()
  (:documentation
   #.(format nil "Base class for referencing users of the dbc-system.~%~@
                  Types of users might include:~%~% ~
                   user-name, user-seller-name, user-client-name, etc.")))


;;; ==============================
#|

;; Slots to implement

 (user-uuid
  :initarg user-uuid
  :initform nil 
  ;; :accessor
  ;; :documentation #.(format nil "")
  )

|#



;;; ==============================

;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
