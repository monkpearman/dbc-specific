;;; :FILE-CREATED <Timestamp: #{2011-10-04T15:20:38-04:00Z}#{11402} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-inventory-record.lisp
;;; ==============================

;; base-record (base-dbc)
;; base-inventory-record (base-record)
;;
;; :NOTE The inverse corollary to the class `base-record' is the class `base-entity'.

;; *control-id-inventory-namespace*
;; control-id-inventory-record                (control-id-inventory-record-type)
;; control-id-inventory-record-indexed-number (control-id-inventory-record control-id-indexed-number)
;;; ==============================


(in-package #:dbc)

(defclass base-inventory-record (base-record)
  ()
  (:documentation ":NOTE The inverse corollary to the class `base-record' is the class `base-entity'."))



;;; ==============================

;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
