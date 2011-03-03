;;; :FILE-CREATED <Timestamp: #{2011-03-03T14:13:59-05:00Z}#{11094} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-edit.lisp
;;; ==============================

;;; ==============================
;;; :NOTE
;;
;;; ==============================


;;; ==============================
(in-package #:dbc)

;; *package*

(defclass base-edit (base-dbc)
  (:documentation
   #.(format nil
             "The intended use for subclassed instances of the base-edit class is to record~@
              information re the alteration of a class instance or slot value of an instance.~%~@
              Not all instances and slots should record edit information. However, when it is~@
              important to record when/how the data of a slot/instance was made it should be~@
              done using the edit-class interface.")))

#| 

(edit-container-uuid 
 :initarg edit-container-uuid
 :initform nil
 ;; :accessor 
 ;; :documentation 
 ;; #.(format nil 
 ;; "An object may have an instance of an edit class atached to it.~%~@
 ;;  The attached edit instance has a uuid which may be used to refer to it by."
 )

 (edit-by 
  :initarg edit-by
  :initform nil
  ;; :accessor
  ;; :documentation #.(format nil "")
  )

#|


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
