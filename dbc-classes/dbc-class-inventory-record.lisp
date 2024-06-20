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

;; (system-identity *control-id-inventory-namespace*)
;=>  *CONTROL-ID-INVENTORY-NAMESPACE*

;; (system-identity-uuid *control-id-inventory-namespace*)
;=> 2c16a3f7-8f23-5e88-9ff3-d58507355127

;; (system-identity-parent-uuid *control-id-inventory-namespace*)
;=> a348d6ac-5a81-5d66-b2fe-67fea1abd53d


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
