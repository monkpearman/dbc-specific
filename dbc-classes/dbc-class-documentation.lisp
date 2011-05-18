;;; :FILE-CREATED <Timestamp: #{2011-03-03T16:09:02-05:00Z}#{11094} - by MON>
;;; :FILE dbc-classes/dbc-class-documentation.lisp
;;; ==============================

;;; ==============================
;;; :NOTE
;;;  documents objects should have:
;;;  - uuids
;;;  - indexed terms
;;;  - 
#("Definitions for: buffer

" 0 16 (face gg-def-base) 17 23 (face gg-def-defined))
object xrefs, e.g. the principal

;;; ==============================


(in-package #:dbc)

;; *package*

(defclass base-documentation (base-dbc)
  ()
  (:documentation 
   #.(format nil "Base class for referencing documents in the dbc-system.")))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
