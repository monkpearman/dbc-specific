;;; :FILE dbc-specific/specials.lisp
;;; ==============================

(in-package #:dbc)
;; *package*

;; :NOTE see class definition of `dbc-xml->clos-dump' in :FILE :SPECIALS
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

(defvar *dbc-base-httpd-synced-item-number-image-pathname* #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/")

(defvar *dbc-wild-httpd-synced-item-number-image-pathname-list* '( ;; :NOTE Order is important here!!!
                                                                  "big"
                                                                  "frame"
                                                                  "small"
                                                                  "zoom_size"
                                                                  ("images" "backgrounds" "headers")
                                                                  ("flash_home" "gallery" :wild "large")
                                                                  ("flash_home" "gallery" :wild "tn")))

(defvar *dbc-item-number-string-mapping-old-image-path-table* nil)

(defvar *dbc-item-number-path-source-destination-vector* nil
  "Vector mapping item-numbers to to their original source paths and their
  directory under pathname named by `*dbc-base-item-number-image-pathname*'.
When CL:BOUNDP the vector is 1 indexed such that the object it indexes
corresponds to an item number e.g.:
 (aref *dbc-item-number-path-source-destination-vector* 8999) maps to item-number \"8999\".")

;; :NOTE we currently hardwire this as the default base-pathname for all dbc images.
;; This should maybe be some variant instance of class `system-path' but it
;; currently exists outside the dbc-specific source directory and is likely to remain so.
(defvar *dbc-base-item-number-image-pathname*  #P"/mnt/NEF-DRV-A/DBC-ITEM-IMAGES/"
        "Default base pathname under which dbc images are located.")

(defvar *parsed-class-parse-table* (make-hash-table))

(defvar *parsed-class-field-slot-accessor-mapping-table* (make-hash-table))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
