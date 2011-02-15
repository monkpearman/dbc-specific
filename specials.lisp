
;; dbc-specific/specials.lisp


(in-package #:dbc)

;; *package*

;; :NOTE see class definition of `dbc-xml->clos-dump' in :FILE


;;; ==============================
;;; :SPECIALS
;;; ==============================

(defparameter *dbc-system-path* nil
  "The base dbc-sytsem path.")

(defparameter *dbc-xml-dump-dir* "xml-class-dump-dir")

(defparameter *dbc-notes-dir*    "notes-versioned")

(defparameter *dbc-xml-source-dir* nil)

;; (setf *dbc-notes-dir* "notes-versioned")
;; (setf *dbc-xml-source-dir* "sql-file-per-table-2010-08-25")



;;; ==============================
;;; :SPECIALS-DOCUMENTATION
;;; ==============================

(setf (documentation '*dbc-xml-dump-dir* 'variable)
      #.(format nil
"System relative directory pathname object for storing dbc-xml-dump files.~%~@
Evaluated when system is loaded.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))



;;; ==============================
;;; EOF
