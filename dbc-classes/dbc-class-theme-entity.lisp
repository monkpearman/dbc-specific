;;; :FILE-CREATED <Timestamp: #{2011-10-11T15:53:58-04:00Z}#{11412} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-theme-entity.lisp
;;; ==============================

;;; ==============================
;;
;; *control-id-display-theme-namespace*
;;
;; --- control-id-theme-entity-type              (control-id-entity-type)
;; ---- control-id-theme-entity                  (control-id-theme-entity-type)
;; ----- control-id-theme-entity-display-name    (control-id-theme-entity control-id-display-name-for-entity-type)
;; ------ control-id-display-theme               (control-id-theme-entity-display-name)
;;
;;; ==============================

(in-package #:dbc)

;; :NOTE Should we treat MT, RT, BT, NT, USE, USED-FOR as distinct instances of a theme?
(defclass theme-entity (base-theme-entity)
  ()
  )

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
