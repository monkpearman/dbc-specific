;;; :FILE-CREATED <Timestamp: #{2011-10-12T18:29:28-04:00Z}#{11413} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-authority-record.lisp
;;; ==============================

;; - base-record (base-dbc)
;; -- base-authority-record (base-record)

;; *control-id-authority-namespace*
;; -- control-id-authority-record          (base-record)  ;; :NOTE we have fields `control-id-authority-0' `control-id-authority-1'
;; --- control-id-authority-loc            (control-id-authority-record) ;; nb2007017414 | n 98028882 | no 99021790
;; --- control-id-authority-ulan           (control-id-authority-record) ;; 500013504
;; --- control-id-authority-bnf            (control-id-authority-record) ;; FRBNF40421659
;; --- control-id-authority--oclc          (control-id-authority-record) ;;
;;; ==============================


(in-package #:dbc)

(defclass base-authority-record (base-record)
  ()
  (:documentation ":NOTE The inverse corollary to the class `base-record' is the class `base-entity'.~%~@"))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
