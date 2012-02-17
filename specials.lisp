;;; :FILE dbc-specific/specials.lisp
;;; ==============================

(in-package #:dbc)
;; *package*

;; :NOTE see class definition of `dbc-xml->clos-dump' in :FILE


;;; ==============================
;;; :SPECIALS
;;; ==============================
;; (defvar *dbc-reloading-system* nil)

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

(defvar *dbc-item-number-string-mapping-old-image-path-table* nil)

(defvar *dbc-item-number-path-source-destination-vector* nil
  "Vector mapping item-numbers to to their original source paths and their
  directory under pathname named by `*dbc-base-item-number-image-pathname*'.
When CL:BOUNDP the tector is 1 indexed such that the object it indexes
corresponds to an item number e.g.:
 (aref *dbc-item-number-path-source-destination-vector* 8999) maps to item-number \"8999\".")

;; :NOTE we currently hardwire this as the default base-pathname for all dbc images.
;; This should maybe be some variant instance of class `system-path' but it
;; currently exists outside the dbc-specific source directory and is likely to remain so.
(defvar *dbc-base-item-number-image-pathname*  #P"/mnt/NEF-DRV-A/DBC-ITEM-IMAGES/"
        "Default base pathname under which dbc images are located.")

;; (vardoc 
(defvar *parsed-class-parse-table* (make-hash-table))

(vardoc '*parsed-class-parse-table*
"Table mapping symbols which subclass `parsed-class' to a corresponding
hash-table of parsed xml-data for that subclass.~%~@
For use with `load-sax-parsed-xml-file-to-parsed-class-hash',
`write-sax-parsed-class-hash-to-files', and functions defined with
`def-parsed-class-record-xml-dump-file-and-hash'.~%~@
:EXAMPLE~%
 \(gethash 'parsed-inventory-record *parsed-class-parse-table*\)~%
 \(gethash 'parsed-inventory-sales-order-record *parsed-class-parse-table*\)~%~@
:SEE-ALSO `*parsed-class-field-slot-accessor-mapping-table*'.~%▶▶▶")

(defvar *parsed-class-field-slot-accessor-mapping-table* (make-hash-table)

(vardoc '*parsed-class-field-slot-accessor-mapping-table*
"Big table mapping parsed-class symbols to instances of class `parsed-class-field-slot-accessor-mapping'.~%~@
Its keys name object instances which subclass the class `parsed-class'.~%~@
Its values are an instance of three slots:~%~%  ~
 parsed-class-mapped -- is a sybmol namign a parsed-class~% ~
 field-to-accessor-table -- is a hash-table mapping field-names to slot-accessors~% ~
 accessor-to-field-table -- is a hash-table mapping slot-accessors to field-names~%~@
For use with the macro `def-set-parsed-class-record-slot-value' which is used to
define functions which map setf slot-value forms for use with `string-case:string-case'.~%~@
:SEE-ALSO `make-parsed-class-field-slot-accessor-mapping', `*parsed-class-parse-table*'.~%▶▶▶")

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
