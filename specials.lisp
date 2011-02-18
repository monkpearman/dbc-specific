
;; dbc-specific/specials.lisp


(in-package #:dbc)

;; *package*

;; :NOTE see class definition of `dbc-xml->clos-dump' in :FILE


;;; ==============================
;;; :SPECIALS
;;; ==============================

(defparameter *dbc-system-path* nil
  "The base dbc-sytsem path.")

(defparameter *dbc-notes-dir*    "notes-versioned")


;;; ==============================
;; XML Parsing INPUT/OUTUPT paths and paths names
;; `*dbc-notes-dir*'
;; `*dbc-xml-dump-dir*'                   ---> OUTPUT
;; `*dbc-xml-dump-file-refs-name*'        ---> OUTPUT
;; `*dbc-xml-dump-file-refs-out*'         ---> OUTPUT
;; `*dbc-xml-source-dir*'                 <--- INPUT
;; `*dbc-xml-source-file-refs*'           <--- INPUT
;; `*dbc-xml-source-file-refs-temp-name*' <--- INPUT
;; 

;;; ---> PARSED OUTPUT
(defparameter *dbc-xml-dump-dir* "xml-class-dump-dir")
;;
(defparameter *dbc-xml-dump-file-refs-name* nil)
;;
(defparameter *dbc-xml-dump-file-refs-out* nil)
;;
;;; <--- PARSED INPUT
(defparameter *dbc-xml-source-dir* (list "sql-file-per-table-2010-08-25" "from-DBC-ARCH-2010-09-01"))
 ;; <--- INPUPT XML parsing file REAL
(defparameter *dbc-xml-source-file-refs* nil)
;; <--- XML parsing input file TEMP
(defparameter *dbc-xml-source-file-refs-temp-name*  nil )

;;; ==============================
(defparameter *dbc-xml-refs-match-table* nil)

(defparameter *dbc-xml-refs-match* 
  ;; before adding the hashtable pre NEW YORK.
  (list "ref" "price" "year" ;; "year_year"
        "artist" "condition"))




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

(setf (documentation '*dbc-xml-dump-file-refs-name* 'variable)
      #.(format nil
"---> Output file name with directory components.~%~@
Use when dumping parsed dbc XML files.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(setf (documentation '*dbc-xml-dump-file-refs-out* 'variable)
      #.(format nil
"---> Output file name extension with directory components.~%~@
Use when dumping parsed dbc XML files.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(setf (documentation '*dbc-xml-source-file-refs* 'variable)
      #.(format nil
"<--- Input file.~%~@
Use when parsing XML full dbc refs table.~%~@
Tweaked to remove non-valid portions at head of document.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(setf (documentation '*dbc-xml-source-file-refs-temp-name* 'variable)
      #.(format nil
"<--- Input file.~%~@
Temporary file for parsing XML refs before handling the whole shebang.~%~@
Use `*dbc-xml-source-file-refs*' when ready.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))


(setf (documentation '*dbc-xml-refs-match-table* 'variable)
      #.(format nil
  "A hash-table mapping field name to parsing-function for use when parsing dbc-xml-refs.~%~@
Bound with `dbc:make-ref-lookup-table' to values of variable `dbc:*dbc-xml-refs-match*'.~%~@
:EXAMPLE~%
 \(gethash \"ref\" *dbc-xml-refs-match-table*\)~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(setf (documentation '*dbc-xml-refs-match* 'variable)
      #.(format nil
"list of fields needed when parsing dbc-xml-refs.~%~@
Bound with `dbc:make-ref-lookup-table' as key values in hasthable of variable `dbc:*dbc-xml-refs-match-table*'.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))


;;; ==============================
;;; EOF
