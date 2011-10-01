;;; :FILE-CREATED <Timestamp: #{2011-01-01T14:10:05-05:00Z}#{11526} - by MON>
;;; :FILE dbc-classes/dbc-class.lisp
;;; ==============================


(in-package #:dbc)
;; *package*

;; (defclass dbc-xml->clos-dump ()
;;   ((base-dir :initarg :base-dir ))
;;   (:documentation "Base class for DBC to XML dump files directories.
;; Subclasses inherit their base pathname from this guy.
;; :SEE-ALSO `dbc:*dbc-xml-dump-dir*', `*dbc-xml-dump-dir-name*'
;; `dbc:ensure-dbc-xml-dump-dir-exists'.▶▶▶"))

;;; ==============================

(defclass base-dbc () ;; persistent, rucsack, component, etc.
  ()
  (:documentation "Base class for dbc objects."))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
