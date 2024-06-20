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
;;; To set it back to default (debug 1):
;;; (sb-ext:restrict-compiler-policy 'debug 1)
;;;
;;; (setf *break-on-signals* t)
;;;
;;; sb-debug:
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


(defpackage #:dbc-build-system (:use #:common-lisp #:asdf )
            (:export #:*dbc-build-system-reloading-system*))

(in-package #:dbc-build-system)

(defvar *dbc-build-system-reloading-system* nil)

(defvar *author-maintainer-contact* (format nil "MON KEY -- ~A"
                                            (map 'string 'code-char
                                                 #(109 111 110 107 112 101 97 114 109 97 110
                                                       64 105 99 108 111 117 100 46 99 111 109))))

(asdf:defsystem #:dbc
  ;; :name ""
  :author  "MON KEY"
  :maintainer #.*author-maintainer-contact*
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
               ;; :local-time
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
               ;; #+sbcl :sb-ext ;; pretty sure :mon and :unicly already use this but....
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
            ;; dbc-docstrings-for-class.lisp interns docstrings for many of
            ;; classes below to a hashtable holding docstrings. Load it first
            ((:file "dbc-docstrings-for-class")
             (:file "dbc-class")       ; defines class `base-dbc'
             (:file "dbc-class-paths") ; defines class `system-base', `system-path'
             (:file "dbc-class-uuid")  ; defines class `base-uuid'
             (:file "dbc-class-system-object-uuid") ; defines class `system-object-uuid'
             (:file "dbc-class-uuid-vars") ; class namespace variables cached to var `*control-id-namespace-table*'
             (:file "dbc-class-record") ; defines class `base-record' subclass of `base-dbc'
             (:file "dbc-class-inventory-record") ; defines class `base-inventory-record' subclass of `base-record'
             (:file "dbc-class-inventory-publication-record")
             (:file "dbc-class-inventory-sales-record")
             (:file "dbc-class-authority-record")
             (:file "dbc-class-entity")
             ;; follwoing file "dbc-class-control-id" defines class definition scaffolding as follows:
             ;; defines class `base-entity' subclass of `base-dbc'
             ;; defines classes `base-control-id' & `control-id-type' subclass of `base-dbc'.
             ;; defines class `control-id-indexed-number' subclass of `base-control-id'
             ;; defines class `control-id-record-type' subclass of `control-id-type'
             ;; defines classes `control-id-<FOO>-record-type' subclasses of `control-id-record-type'
             ;; defines classes `control-id-<FOO>-indexed-number' subclasses of `control-id-indexed-number'
             ;; defines class `control-id-entity-type' subclass of `control-id-type'
             ;; defines classes `control-id-<FOO>-entity-type' subclasses of `control-id-entity-type'
             ;; defines class `control-id-display-name' subclass of `base-control-id'
             ;; defines class `control-id-display-name-for-entity-type' subclass of `control-id-display-name'
             ;; defines class `control-id-<FOO>-record' subclasses `control-id-inventory-record-type' `base-control-id'
             ;; defines class `control-id-indexed-<FOO>-record' subclasses `control-id-<FOO>-record' `control-id-record-indexed-number'
             ;; ... a bunch of other abstract classes ...
             (:file "dbc-class-control-id")
             (:file "dbc-class-edit")
             (:file "dbc-class-naf-entity")
             (:module "dbc-class-category-entities"
                      :components
                      ((:file "dbc-class-category-entity")))
             (:file "dbc-class-theme-entity")
             (:file "dbc-class-media-entity")
             (:file "dbc-class-location-entity")
             (:file "dbc-class-taxon-entity")
             (:file "dbc-class-regexps")
             (:file "dbc-class-users")
             (:file "dbc-class-description")
             (:file "dbc-class-documentation-record")
             (:file "dbc-class-parsed")  ; defines class `parsed-class' sublassed of `base-dbc'
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
             (:file "dbc-class-parsed-tgm-theme-record")
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
             (:file "dbc-french-dates")))
   (:file "dbc-docs"))
  :in-order-to ((test-op (test-op "dbc/dbc-test")))
)


;; dbc-test::make-v5-uuid-test
;; dbc-test::system-test-temp-dir-exists-p
;; (sb-rt:do-test 'dbc-test::field-convert-1-0-x-empty-TEST.0)
;; (sb-rt:do-test 'dbc-test::split-field-on-char-if-TEST.0)
;; (sb-rt:do-test 'split-field-on-char-if-TEST.2)


;;; (defpackage #:dbc-test-system (:use :common-lisp :asdf))
;; (in-package #:dbc-test-system)

(asdf:defsystem :dbc/dbc-test
  ;; :name ""
  ;; :author  "MON KEY"
  ;; :maintainer "MON KEY"
  ;; :license
  :description "DBC tests."
  :version "1.0.1"
  :pathname  "dbc-tests/"
  ;; :depends-on (:dbc)
  ;;  (make-pathname :name nil :type nil :defaults *load-truename*))
  :components
  ((:file "package")
   (:file "tests")
   (:file "dbc-uuid-profile"))
  :depends-on (:dbc :mon-test
                    #+sbcl :sb-rt
                    ;; :NOTE Need to add a package-nickname for :sb-rt for following:
                    #-sbcl :rt
                    )
  :perform #+sbcl(test-op (o c) (funcall (intern (symbol-name '#:do-tests)
		                                 (find-package '#:dbc/test))))
  )

;; is this needed anymore with ASDF3?
;; (defmethod asdf:perform :after ((op asdf:load-op) (system (eql (asdf:find-system :dbc-test))))
;;            (pushnew :dbc-test cl:*features*))


(defmethod asdf:perform :after ((op asdf:load-op) (system (eql (asdf:find-system :dbc))))
  ;; (pushnew :dbc cl:*features*)
  (let* (;; #-:IS-MON(chk-if(uiop:file-exists-p ;; :WAS cl-fad:file-exists-p
         ;;                  (merge-pathnames (make-pathname :name "loadtime-bind" :type "lisp")
         ;;                                   ;; :WAS (mon:pathname-directory-system :dbc)
         ;;                                   (make-pathname :directory (pathname-directory (asdf/system-registry:sysdef-central-registry-search :DBC))))))
         (chk-if (probe-file (translate-logical-pathname "MON:DBC-SPECIFIC;loadtime-bind.lisp")))
         (chk-existing-feature (member :dbc *features*))
         (dbc-build-system::*dbc-build-system-reloading-system*
          (or (and chk-existing-feature t) dbc-build-system::*dbc-build-system-reloading-system*)))
    (and chk-if
      (load  chk-if)))
  ;; Not sure if this is needany any longer with ASDF3
  (pushnew :dbc cl:*features*)
  ;;  Don't think this is needed any longer with ASDF3
  ;; (asdf:operate 'asdf:load-op 'dbc-test)
  )

;; (member :DBC cl:*features*)

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
