;;; :FILE-CREATED <Timestamp: #{2011-03-03T14:13:59-05:00Z}#{11094} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-edit.lisp
;;; ==============================


(in-package #:dbc)

(defclass base-edit (base-dbc)
  ()
  (:documentation  #.(classdoc 'base-edit :class-doc)))

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

|#




;;; ==============================

;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
