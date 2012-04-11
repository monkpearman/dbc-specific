;;; :FILE-CREATED <Timestamp: #{2011-01-01T14:14:51-05:00Z}#{11526} - by MON>
;;; :FILE dbc-specific/dbc.asd
;;; ==============================


;;; ==============================
;;; :LOGICAL-PATHNAMES
;;; ==============================
;;;
;;; (logical-pathname-translations "MON")
;;; (translate-logical-pathname  "MON:dbc-specific;")
;;;
;;; (push (translate-logical-pathname  "MON:dbc-specific;") asdf:*central-registry*)
;;;
;;; Finding current fasls:
;;; (logical-pathname-translations "FASL")
;;; (translate-logical-pathname "FASL:dbc-specific;")
;;;
;;; ==============================
;;;
;;; :NOTE While debugging per file:
;;; (declaim (optimize (debug 3)))
;;; Or, (sb-ext:restrict-compiler-policy 'debug 3)
;;;
;;; (setf *break-on-signals* t)
;;;
;;; (setf sb-debug:*show-entry-point-details* t)
;;;
;;; ==============================
;;; 
;;; To remove the compile fasls do:
;;;
;;; (asdf:clear-system :dbc)
;;; 
;;; ==============================
;;;
;;; (ql:quickload :dbc :verbose t :explain t)
;;;
;;; ==============================
;;;
;;; (let (des) (do-external-symbols (i :dbc des) (push i des)))
;;; 
;;; ==============================


(defpackage #:dbc-build-system (:use #:common-lisp #:asdf))

(in-package #:dbc-build-system)

(defvar *dbc-build-system-reloading-system* nil)

(defsystem #:dbc
  ;; :name ""
  :author  "MON KEY"
  :maintainer "MON KEY"
  :license "BSD"
  :description "DBC agglomerated."
  :version "1.0.0"
  :depends-on (:cxml
	       :closure-html
               :unicly
               :mon
               :mon-test
               :image-ops
               :csv-parser
               :puri
               :drakma 
               ;; :NOTE Following will be made available to system by :mon
	       ;; :split-sequence
               ;; :string-case
               ;; :alexandria
	       ;; :cl-ppcre
               ;; :flexi-streams 	       
	       ;; :ironclad
               ;; :cl-fad
               ;; :salza2
               ;; :chipz
               ;; :closer-mop
               ;; ==============================
               ;; :NOTE prob. better to use a separate system for drakma related dependencies. 
               
               ;; ==============================
               ;; :NOTE Time related dependencies should maybe use a separate
               ;; time dedicated system for these (and others). 
               ;; :SEE :FILE "dbc-french-dates.lisp" below.
	       ;; :local-time :chronicity
               ;; :parse-time ;; Not sure which version to use
               ;; :date-calc 
	       )
  :serial t    
  :components 
  ((:file "package")
   (:file "specials")
   ;;
   ;; (:module "dbc-uuid"
   ;;          :components
   ;;          ((:file "dbc-uuid-types")
   ;;           (:file "dbc-uuid-class" :depends-on ("dbc-uuid-types"))
   ;;           (:file "dbc-uuid"       :depends-on ("dbc-uuid-types" "dbc-uuid-class"))))
   ;;
   (:file "conditions")
   (:file "dbc-utils")
   (:module "dbc-time"
    :components
    ((:file "date-localtime-utils")))
   (:module "dbc-classes"
            :components                 
            ((:file "dbc-docstrings-for-class")
             (:file "dbc-class")
             (:file "dbc-class-paths")
             (:file "dbc-class-uuid")
             (:file "dbc-class-system-object-uuid")
             (:file "dbc-class-uuid-vars")
             (:file "dbc-class-record")
             (:file "dbc-class-inventory-record")
             (:file "dbc-class-inventory-publication-record")
             (:file "dbc-class-inventory-sales-record")
             (:file "dbc-class-authority-record")
             (:file "dbc-class-entity")
             (:file "dbc-class-control-id")
             (:file "dbc-class-edit")
             (:file "dbc-class-naf-entity")
             (:module "dbc-class-category-entities"
                      :components
                      ((:file "dbc-class-category-entity"))
                      )
             (:file "dbc-class-theme-entity")
             (:file "dbc-class-media-entity")
             (:file "dbc-class-location-entity")
             (:file "dbc-class-taxon-entity")
             (:file "dbc-class-regexps")
             (:file "dbc-class-users")
             (:file "dbc-class-description")
             (:file "dbc-class-documentation-record")
             (:file "dbc-class-parsed")
             (:file "dbc-class-parsed-slot-value-equal")
             (:file "dbc-class-parsed-field-slot-mapping")
             (:file "dbc-class-parsed-convert")
             (:file "dbc-class-parsed-slot-value-format")
             (:file "dbc-class-parsed-inventory-record")
             (:file "dbc-class-parsed-artist-record")
             (:file "dbc-class-parsed-author-record")
             (:file "dbc-class-parsed-person-record")
             (:file "dbc-class-parsed-brand-record")
             (:file "dbc-class-parsed-technique-record")
             (:file "dbc-class-parsed-publication-record")
             (:file "dbc-class-parsed-theme-record")
             (:file "dbc-class-parsed-documentation-record")
             (:file "dbc-class-parsed-translation-for-inventory-record")
             (:file "dbc-class-parsed-inventory-sales-order-record")
             (:file "dbc-class-parsed-inventory-sales-sold-record")
             (:file "dbc-class-parsed-inventory-sales-sold-in-store-record")
             ;; (:file "dbc-tgm")))
             ;;
             ;; (:file "dbc-class-symbol-construct-deprecated")
             ;;
             (:file "dbc-class-image")
             (:file "dbc-class-image-path-convert")
             (:file "dbc-class-image-path-inventory-record")
             (:file "dbc-class-parsed-csv-writer")
             (:file "dbc-class-parsed-slot-value-cleaning")
             ))
   (:module "dbc-parse"
	    :components
	    ((:file "dbc-cln-parse")
             (:file "dbc-xml-sql-parse")
             (:file "dbc-xml-refs-parse")
             (:file "dbc-xml-parse-sax")
	    ;; (:file "psa-parse-table.lisp")
	    ))
   (:module "dbc-translate"
            :components
            ((:file "dbc-french-numbers")
             (:file "dbc-french-dates")
             ))
   (:file "dbc-docs")
   ))

(defmethod asdf:perform :after ((op asdf:load-op) (system (eql (asdf:find-system :dbc))))
  ;; (pushnew :dbc cl:*features*)
  (let* ((chk-if 
         #-:is-mon (fad:file-exists-p 
                    (merge-pathnames (make-pathname :name "loadtime-bind" :type "lisp")
                                     (mon:pathname-directory-system :dbc)))
         #+:is-mon (probe-file (translate-logical-pathname "MON:DBC-SPECIFIC;loadtime-bind.lisp")))
         (chk-existing-feature (member :dbc *features*))
         (dbc-build-system::*dbc-build-system-reloading-system* 
          (or (and chk-existing-feature t) 
              dbc-build-system::*dbc-build-system-reloading-system*)))
    (and chk-if 
      (load  chk-if)))
  (pushnew :dbc cl:*features*)
  (asdf:operate 'asdf:load-op 'dbc-test))

;; (member :DBC cl:*features*)

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
