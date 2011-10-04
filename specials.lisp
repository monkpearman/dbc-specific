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
 ;; <--- INPUPT XML parsing file REAL
(defparameter *xml-input-refs-name* nil)
;; <--- XML parsing input file TEMP
(defparameter *xml-input-refs-name-temp*  nil )

;;; ==============================
(defvar *parsed-inventory-record-class-name* "PARSED-INVENTORY-RECORD")

;; (find-symbol "PARSED-INVENTORY-RECORD")
;; (find-symbol "PARSED-INVENTORY-RECORD")

;; (class-name (find-class 'parsed-inventory-record)
;; (mon:class-instance-p 'parsed-inventory-record)
;; (
;; (find-class-name 
;; (mon:class-name-of (format nil "~S" (class-name (find-class 'parsed-inventory-record)))
;; "parsed-inventory-record"
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


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
