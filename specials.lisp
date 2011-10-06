;;; :FILE dbc-specific/specials.lisp
;;; ==============================

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


;;; ==============================

(defvar *big-parsed-class-field-slot-accessor-mapping-table* (make-hash-table))

(vardoc '*big-parsed-class-field-slot-accessor-mapping-table*
"Big table of mapping parsed-class symbols to instances of class `parsed-class-field-slot-accessor-mapping'.
Its keys name object instances which subclass the class `parsed-class'.
Its values are an instance of three slots:~%~%  ~
 parsed-class-mapped -- is a sybmol namign a parsed-class~% ~
 field-to-accessor-table -- is a hash-table mapping field-names to slot-accessors~% ~
 accessor-to-field-table -- is a hash-table mapping slot-accessors to field-names~%~@
For use with the macro `def-set-parsed-class-record-slot-value' which is used to
define functions which map setf slot-value forms for use with
`string-case:string-case'.
:SEE-ALSO `make-parsed-class-field-slot-accessor-mapping'.~%▶▶▶")


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
