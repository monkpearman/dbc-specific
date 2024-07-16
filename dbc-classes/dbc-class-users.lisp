;;; :FILE-CREATED <Timestamp: #{2011-03-03T15:36:12-05:00Z}#{11094} - by MON>
;;; :FILE dbc-classes/dbc-class-users.lisp
;;; ==============================



(in-package #:dbc)


(defclass base-user (base-dbc)
  ()
  (:documentation  #.(classdoc 'base-user :class-doc)))


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
