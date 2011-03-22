
;; dbc-specific/specials.lisp


(in-package #:dbc)

;; *package*

;; :NOTE see class definition of `dbc-xml->clos-dump' in :FILE


;;; ==============================
;;; :SPECIALS
;;; ==============================

(defparameter *system-path* nil)

(defparameter *system-notes-dir*    "notes-versioned")

(defparameter *system-tests-dir*      "dbc-tests") ;; the dir for dbc-tests package

(defparameter *system-tests-temp-dir* "tests") ;; dir to write results of dbc-test:<TEST-FNCN> to


;;; ==============================
;; XML Parsing INPUT/OUTUPT paths and paths names
;; `*system-notes-dir*'
;; `*xml-output-dir*'              ---> OUTPUT
;; `*xml-output-refs-name*'        ---> OUTPUT
;; `*xml-output-refs-ext*'         ---> OUTPUT
;; `*xml-input-dir*'               <--- INPUT
;; `*xml-input-refs-name*'         <--- INPUT
;; `*xml-input-refs-name-temp*'    <--- INPUT
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
(defvar *parsed-ref-class-name* "PARSED-REF")

;; (find-symbol "PARSED-REF")
;; (find-symbol "PARSED-REF")

;; (class-name (find-class 'parsed-ref)
;; (mon:class-instance-p 'parsed-ref)
;; (
;; (find-class-name 
;; (mon:class-name-of (format nil "~S" (class-name (find-class 'parsed-ref)))
;; "parsed-ref"
;; (class

(defparameter *xml-refs-match-table* nil)

;; (defparameter *tt--rmt* (make-ref-lookup-table *xml-refs-match-list*))

(defparameter *xml-refs-match-list* 
  ;; before adding the hashtable pre NEW YORK.
  (list "ref" "price" "year" ;; "year_year"
        "artist" "condition"))
;; ("ref" "bar_code" "title" "Plate_number" "price" "desc_fr" "desc_en" "condition"
;;  "histo_fr" "histo_en" "categ" "c1" "c2" "c3" "c4" "theme" "keywords" "issue"
;;  "year" "artist" "author" "book" "publisher" "publish_location" "w" "h"
;;  "technique" "paper" "color" "onlinen" "av_repro" "latin_name" "nbre" "online"
;;  "seller" "people" "related_doc" "brand" "translation" "date" "user_name" "done"
;;  "job_name" "locked" "keywords_type" "text_quote" "theme3" "theme2" "c6" "weight"
;;  "c5" "composer" "uri" "year_year" "notes" "volume" "edition" "page" "bct"
;;  "categ_doc" "c1_doc" "c2_doc" "c3_doc" "ebay_final" "ebay_price" "ebay_title"
;;  "ebay_id" "seo_title" "description_seo" "keywords_seo" "date_edit"
;;  "edit_history")

;; (substitute #\- #\_ (format nil "~:@(~A~)" "keywords_seo"))


(eval-when (:compile-toplevel :load-toplevel :execute)
  (defvar *uuid-random-state* (make-random-state t)))

(defparameter *uuid-namespace-dns*  nil) ;; (make-uuid-from-string "6ba7b810-9dad-11d1-80b4-00c04fd430c8")
(defparameter *uuid-namespace-url*  nil) ;; (make-uuid-from-string "6ba7b811-9dad-11d1-80b4-00c04fd430c8")
(defparameter *uuid-namespace-oid*  nil) ;; (make-uuid-from-string "6ba7b812-9dad-11d1-80b4-00c04fd430c8")
(defparameter *uuid-namespace-x500* nil) ;; (make-uuid-from-string "6ba7b814-9dad-11d1-80b4-00c04fd430c8")


;;; ==============================
;;; :SPECIALS-DOCUMENTATION
;;; ==============================

(vardoc '*system-path*
"The base dbc-sytsem path.~%~@
An instance of the system-path class holds the class allocated slot system-path
:EXAMPLE~%
 \(and \(eql \(mon:class-name-of *system-path*\) 
          \(class-name \(find-class 'system-path\)\)\)
     \(system-base-path *system-path*\)\)~%~@
:SEE-ALSO `dbc:system-path'.~%►►►")

;;; ==============================
;;; :SPECIALS-DBC-TEST-PATHS-DOCUMENTATION
;;; ==============================

(vardoc '*system-tests-dir*
"Initially set to the string \"dbc-tests\".~%~@
The dbc package defines this parameter and `dbc:*system-tests-temp-dir*' in
:FILE dbc-specific/specials.lisp~%~@
Its value is set at loadtime from :FILE dbc-specific/loadtime-bind.lisp~%~@
Once set the parameter is an instance of `dbc:system-subdir' with a parent-path
as if by the return value of `dbc:find-system-path', e.g.:~%
 \(equal \(dbc:parent-path dbc:*system-tests-dir*\)
        \(dbc:find-system-path\)\)~%~@
Its pathname is accessible with the `dbc:sub-path' accessor.~%~@
:EXAMPLE~%
  \(dbc:sub-path dbc:*system-tests-dir*\)~%
  \(pathname-directory \(dbc:sub-path dbc:*system-tests-dir*\)\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(vardoc '*system-tests-temp-dir*
"Initially set to the string \"tests\".
The dbc package defines this parameter and `dbc:*system-tests-temp-dir*' in
:FILE dbc-specific/specials.lisp~%~@
Its value is set at loadtime from :FILE dbc-specific/loadtime-bind.lisp~%~@
Once set the parameter is an instance of `dbc:system-subdir' with a parent-path
relative to `dbc:*system-tests-dir*' which has a parent-path relative to return
value of `dbc:find-system-path', e.g.:~%
 \(equal \(find-system-path\)
   \(and \(equal 
         \(dbc:parent-path dbc::*system-tests-temp-dir*\)
         \(dbc:sub-path dbc::*system-tests-dir*\)\)
        \(slot-value dbc::*system-tests-temp-dir* 'system-path\)\)\)~%~@
Its pathname is accessible with the `dbc:sub-path' accessor.~%~@
:EXAMPLE~%
  \(dbc:sub-path dbc::*system-tests-temp-dir*\)~%
  \(pathname-directory \(dbc:sub-path dbc::*system-tests-temp-dir*\)\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

;;; ==============================

(vardoc '*parsed-ref-class-name*
"String naming the class \"PARSED-REF\"
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")


;;; ==============================
;;; :SPECIALS-XML-PATHS-DOCUMENTATION
;;; ==============================

(vardoc '*xml-output-dir*
"System relative directory pathname object for storing dbc-xml-dump files.~%~@
Evaluated when system is loaded.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(vardoc '*xml-output-refs-name*
"---> Output file name with directory components.~%~@
Use when dumping parsed dbc XML files.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(vardoc '*xml-output-refs-ext*
"---> Output file name extension with directory components.~%~@
Use when dumping parsed dbc XML files.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(vardoc '*xml-input-refs-name*
"<--- Input file.~%~@
Use when parsing XML full dbc refs table.~%~@
Tweaked to remove non-valid portions at head of document.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(vardoc '*xml-input-refs-name-temp*
"<--- Input file.~%~@
Temporary file for parsing XML refs before handling the whole shebang.~%~@
Use `*xml-input-refs-name*' when ready.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(vardoc '*xml-refs-match-table*
  "A hash-table mapping field name to parsing-function for use when parsing dbc-xml-refs.~%~@
Bound with `dbc:make-ref-lookup-table' to values of variable `dbc:*xml-refs-match-list*'.~%~@
:EXAMPLE~%
 \(gethash \"ref\" *xml-refs-match-table*\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(vardoc '*xml-refs-match-list*
"List of fields needed when parsing dbc-xml-refs.~%~@
Bound at loadtime with `dbc:make-ref-lookup-table' as key values in hasthable of
variable `dbc:*xml-refs-match-table*'.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")


;;; ==============================
;;; :SPECIALS-UUID-DOCUMENTATION
;;; ==============================

(vardoc '*uuid-random-state*
"A random-state objet for use when generating UUIDv4 UUIDs.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(vardoc '*uuid-namespace-dns*
  "The DNS namespace as provided by RFC-4122.~%~@
Bound at system loadtime with `dbc:make-uuid-namespace-loadtime-vars'.~%~@
May be used for generating UUIDv3 and UUIDv5~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `dbc:make-v3-uuid', `dbc:make-v5-uuid', `dbc:make-v4-uuid'.~%►►►")
 
(vardoc '*uuid-namespace-url*
  "The URL namespace as provided by RFC-4122.~%~@
Bound at system loadtime with `dbc:make-uuid-namespace-loadtime-vars'.~%~@
May be used for generating UUIDv3 and UUIDv5.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `dbc:make-v3-uuid', `dbc:make-v5-uuid', `dbc:make-v4-uuid'.~%►►►")

(vardoc '*uuid-namespace-oid*
"The OID namespace as provided with RFC-4122 appendix C.~%~@
Bound at system loadtime with `dbc:make-uuid-namespace-loadtime-vars'.~%~@
May be used for generating UUIDv3 and UUIDv5.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `dbc:make-v3-uuid', `dbc:make-v5-uuid', `dbc:make-v4-uuid'.~%►►►")

(vardoc '*uuid-namespace-x500*
"The x500+ namespace as provided by RFC-4122 appendix C.~%~@
Bound at system loadtime with `dbc:make-uuid-namespace-loadtime-vars'.~%~@
May be used for generating UUIDv3 and UUIDv5.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `dbc:make-v3-uuid', `dbc:make-v5-uuid', `dbc:make-v4-uuid'.~%►►►")


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
