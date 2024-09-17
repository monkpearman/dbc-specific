;;; :FILE dbc-specific/specials.lisp
;;; ==============================

(in-package #:dbc)



;;; :SPECIALS
;;; ==============================

;; (defvar *dbc-reloading-system* nil)

(defparameter *system-path* nil)

;; (system-described *system-notes-dir* nil)
(defparameter *system-notes-dir*    "notes-versioned")

;; The directory for dbc-tests package
(defparameter *system-tests-dir*      "dbc-tests") 

;; The directory to write results of dbc-test:<TEST-FNCN> to.
(defparameter *system-tests-temp-dir* "tests") 

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

(defparameter *parsed-class-table-csv-output-dir* "parsed-csv-records")

(defparameter *parsed-class-table-output-dir* "parsed-class-table-dumps")

(defparameter *parsed-class-table-output-pathname-type* "pctd")

;;; ---> PARSED OUTPUT
;; (system-described *xml-output-dir* nil)
(defparameter *xml-output-dir* "xml-class-dump-dir")
;; doesn't seem to have any callers we only used this when converting from SQL->XML->HASH
;; now we just load the pctd files in directories benath (sub-path *parsed-class-table-output-dir*)
(defparameter *xml-output-refs-name* nil)
;; same as above
(defparameter *xml-output-refs-ext* nil)
;;
;;; <--- PARSED INPUT
(defparameter *xml-input-dir* (list "sql-file-per-table-2010-08-25" "from-DBC-ARCH-2010-09-01"))

;;; ==============================
;; :FIXME DARWIN we no longer have access to the items located here as the drive is missing.
;; Also. who dereferences this path because we really probably don't want to hose it???
(defvar *dbc-base-httpd-synced-item-number-image-pathname*
  #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/")

(defvar *dbc-wild-httpd-synced-item-number-image-pathname-list* '( ;; :NOTE Order is important here!!!
                                                                  "big"
                                                                  "frame"
                                                                  "small"
                                                                  "zoom_size"
                                                                  ("images" "backgrounds" "headers")
                                                                  ("flash_home" "gallery" :wild "large")
                                                                  ("flash_home" "gallery" :wild "tn")))

(defvar *dbc-item-number-string-mapping-old-image-path-table* nil)

(defvar *dbc-item-number-path-source-destination-vector* nil)

;; Also, this is a big directory so we should probably probe if it exists before frobbing it.
;;
;; Which functions dereference this variable? Alot including dispatching methods.
;;
;; :NOTE we currently hardwire this as the default base-pathname for all dbc images.
;; This should maybe be some variant instance of class `system-path' but it
;; currently exists outside the dbc-specific source directory and is likely to remain so.
;;
;; :WAS (defvar *dbc-base-item-number-image-pathname*  #P"/mnt/NEF-DRV-A/DBC-ITEM-IMAGES/"
;;   "Default base pathname under which dbc images are located.")
;; 
;; Size of content of directory named by *dbc-base-item-number-image-pathname*  -> 3.13 GB
(defvar *dbc-base-item-number-image-pathname*
  #.(let* ((base (or (SB-POSIX:GETENV "DEVHOME")
                     (concatenate 'string
                                  (namestring (user-homedir-pathname))
                                  "Documents/HG-Repos/")))
           (full (pathname (concatenate 'string base "/LOCAL-NEF-DRV-A/DBC-ITEM-IMAGES/"))))
      full))

(defvar *parsed-class-parse-table* (make-hash-table :synchronized t))

(defvar *parsed-class-field-slot-accessor-mapping-table* (make-hash-table :synchronized t))

(defvar *parsed-inventory-record-image-pathname-regex* 
  (CL-PPCRE:CREATE-SCANNER "^([0-9]{6}?)(-??)(([smzh]{1}?)??|(f[sc]??)??)??$"))


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: nil
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
