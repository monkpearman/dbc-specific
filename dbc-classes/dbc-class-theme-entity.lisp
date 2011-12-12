;;; :FILE-CREATED <Timestamp: #{2011-10-11T15:53:58-04:00Z}#{11412} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-theme-entity.lisp
;;; ==============================

;; :NOTE there is a per them XML file from db's php parse from the old dbc here:
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/tgm.tar
;;
;; Also, for a later Lisp parse see: 
;; :FILE dbc-specific/dbc-classes/dbc-tgm.lisp
;;
;; The newest TGM parse of the existing dbc related sql data is here:
;; dbc-specific/dbc-classes/dbc-class-parsed-theme-record.lisp

;;; ==============================
;;
;; base-theme-entity (base-entity)
;;
;; *control-id-theme-namespace*
;;
;; --- control-id-theme-entity-type              (control-id-entity-type)
;; ---- control-id-theme-entity                  (control-id-theme-entity-type)
;; ----- control-id-theme-entity-display-name    (control-id-theme-entity control-id-display-name-for-entity-type)
;; ------ control-id-display-theme               (control-id-theme-entity-display-name)
;;
;;; ==============================


(in-package #:dbc)

;; :NOTE Should we treat MT, RT, BT, NT, USE, USED-FOR as distinct instances of a theme?
;;  Also, what about translated theme display names?
;; 
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
