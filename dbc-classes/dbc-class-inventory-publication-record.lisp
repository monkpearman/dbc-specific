;;; :FILE-CREATED <Timestamp: #{2012-01-23T14:47:43-05:00Z}#{12041} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-inventory-publication-record.lisp
;;; ==============================

;; base-record (base-dbc)
;; base-inventory-publication-record (base-record)
;;
;; :NOTE The inverse corollary to the class `base-record' is the class `base-entity'.
;;
;; *control-id-inventory-publication-namespace*
;; control-id-inventory-publication-record                (control-id-inventory-record-type)
;; control-id-inventory-publication-record-indexed-number (control-id-inventory-publication-record control-id-indexed-number)
;;
;;; ==============================


(in-package #:dbc)

(defclass base-inventory-publication-record (base-record)
  ()
  (:documentation "Used for indexing individualy inventoried publications and/or periodical issues.
:NOTE The inverse corollary to the class `base-record' is the class `base-entity'."))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
