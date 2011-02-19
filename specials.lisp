
;; dbc-specific/specials.lisp


(in-package #:dbc)

;; *package*

;; :NOTE see class definition of `dbc-xml->clos-dump' in :FILE


;;; ==============================
;;; :SPECIALS
;;; ==============================

(defparameter *system-path* nil)

(defparameter *system-notes-dir*    "notes-versioned")


;;; ==============================
;; XML Parsing INPUT/OUTUPT paths and paths names
;; `*system-notes-dir*'
;; `*xml-output-dir*'                   ---> OUTPUT
;; `*xml-output-refs-name*'        ---> OUTPUT
;; `*xml-output-refs-ext*'         ---> OUTPUT
;; `*xml-input-dir*'                 <--- INPUT
;; `*xml-input-refs-name*'           <--- INPUT
;; `*xml-input-refs-name-temp*' <--- INPUT
;; 

;;; ---> PARSED OUTPUT
(defparameter *xml-output-dir* "xml-class-dump-dir")
;;
(defparameter *xml-output-refs-name* nil)
;;
(defparameter *xml-output-refs-ext* nil)
;;
;;; <--- PARSED INPUT
(defparameter *xml-input-dir* (list "sql-file-per-table-2010-08-25" "from-DBC-ARCH-2010-09-01"))
 ;; <--- INPUPT XML parsing file REAL
(defparameter *xml-input-refs-name* nil)
;; <--- XML parsing input file TEMP
(defparameter *xml-input-refs-name-temp*  nil )

;;; ==============================
(defparameter *xml-refs-match-table* nil)

(defparameter *xml-refs-match-list* 
  ;; before adding the hashtable pre NEW YORK.
  (list "ref" "price" "year" ;; "year_year"
        "artist" "condition"))




;;; ==============================
;;; :SPECIALS-DOCUMENTATION
;;; ==============================

(setf (documentation '*system-path* 'variable)
      #.(format nil
"The base dbc-sytsem path.~%~@
An instance of the system-path class holds the class allocated slot system-path
:EXAMPLE~%
 \(and \(eql \(mon:class-name-of *system-path*\) 
          \(class-name \(find-class 'system-path\)\)\)
     \(system-base-path *system-path*\)\)~%~@
:SEE-ALSO `dbc:system-path'.~%►►►"))

(setf (documentation '*xml-output-dir* 'variable)
      #.(format nil
"System relative directory pathname object for storing dbc-xml-dump files.~%~@
Evaluated when system is loaded.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(setf (documentation '*xml-output-refs-name* 'variable)
      #.(format nil
"---> Output file name with directory components.~%~@
Use when dumping parsed dbc XML files.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(setf (documentation '*xml-output-refs-ext* 'variable)
      #.(format nil
"---> Output file name extension with directory components.~%~@
Use when dumping parsed dbc XML files.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(setf (documentation '*xml-input-refs-name* 'variable)
      #.(format nil
"<--- Input file.~%~@
Use when parsing XML full dbc refs table.~%~@
Tweaked to remove non-valid portions at head of document.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(setf (documentation '*xml-input-refs-name-temp* 'variable)
      #.(format nil
"<--- Input file.~%~@
Temporary file for parsing XML refs before handling the whole shebang.~%~@
Use `*xml-input-refs-name*' when ready.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(setf (documentation '*xml-refs-match-table* 'variable)
      #.(format nil
  "A hash-table mapping field name to parsing-function for use when parsing dbc-xml-refs.~%~@
Bound with `dbc:make-ref-lookup-table' to values of variable `dbc:*xml-refs-match-list*'.~%~@
:EXAMPLE~%
 \(gethash \"ref\" *xml-refs-match-table*\)~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(setf (documentation '*xml-refs-match-list* 'variable)
      #.(format nil
"List of fields needed when parsing dbc-xml-refs.~%~@
Bound at loadtime with `dbc:make-ref-lookup-table' as key values in hasthable of
variable `dbc:*xml-refs-match-table*'.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))


;;; ==============================
;;; EOF
