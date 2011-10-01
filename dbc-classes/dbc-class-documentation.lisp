;;; :FILE-CREATED <Timestamp: #{2011-03-03T16:09:02-05:00Z}#{11094} - by MON>
;;; :FILE dbc-classes/dbc-class-documentation.lisp
;;; ==============================

;;; ==============================
;;; :NOTE
;;;  documents objects should have:
;;;  - uuids
;;;  - indexed terms
;;;  - 
;;; ==============================


(in-package #:dbc)

;; *package*

(defclass base-documentation (base-dbc)
  ()
  (:documentation 
   #.(format nil "Base class for referencing documents in the dbc-system.")))


#|

(defclass doc-dbc (base-dbc)
  (doc-uuid 
   ;; :initform (generate-dbc-uuid) 
   :accessor doc-uuid)
  (doc-title
   :initform nil
   :initarg :doc-title
   :accessor doc-title)
  (doc-subtitle
   :initform nil
   :initarg :doc-title
   :accessor doc-title)
  (doc-xrefs 
   :initform nil
   :initarg :doc-xrefs
   :accessor doc-xrefs))
|#

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
