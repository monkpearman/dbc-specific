;;; :FILE-CREATED <Timestamp: #{2011-03-03T15:50:48-05:00Z}#{11094} - by MON>
;;; :FILE dbc-classes/dbc-class-description.lisp
;;; ==============================

;;; ==============================
;;; :NOTE
;;;
;;; ==============================


;;; ==============================
(in-package #:dbc)

;; *package*


(defclass base-description (base-dbc)
  ()
  (:documentation 
   #.(format nil "Base class for referencing dbc descriptions.~%~@
                  A description is like a document but smaller and with less attributes.~%~@
                  Examples of of descriptions include the item-ref slots:~%~% ~
                   description-title description-translation~% ~
                   description-english description-french~% ~
                   description-condition description-seo")))

;; 


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
