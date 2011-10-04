;;; :FILE-CREATED <Timestamp: #{2011-10-04T17:24:44-04:00Z}#{11402} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-taxon-entity.lisp
;;; ==============================

;; base-dbc
;; - base-entity          (base-dbc) 
;; -- base-taxon-entity   (base-entity)

;; control-id-display-taxon (control-id-display-name-for-entity-type)
;; *control-id-display-taxon-namespace*
;;
;; :NOTE don't delete this file we _will_ need it.
;; So for example we have `taxon-entity-coref' in class `parsed-inventory-record'

;; The big challenge is to figure out how much of the taxonomy we want to
;; reproduce and of that how much we want to model as with class-precedence:
;; life
;; - domain
;; -- kingdom
;; --- phylum
;; ---- class
;; ----- order
;; ------ family
;; ------- genus
;; -------- species


;;; ==============================
(in-package #:dbc)

;; *package*

;; taxon-display-name
;; taxon-historic-appellation
;; taxon-modern-appellation

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
