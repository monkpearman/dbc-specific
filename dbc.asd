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
	       ;; :drakma 
               ;; ==============================
               ;; :NOTE Time related dependencies should maybe use a separate
               ;; time dedicated system for these (and others). 
               ;; :SEE :FILE "dbc-french-dates.lisp" below.
	       ;; :local-time
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
   (:module "dbc-classes"
            :components                 
            ((:file "dbc-docstrings-for-class")
             (:file "dbc-class")
             (:file "dbc-class-paths")
             (:file "dbc-class-uuid")
             (:file "dbc-class-system-object-uuid")
             (:file "dbc-class-control-id")
             (:file "dbc-class-edit")
             (:file "dbc-class-entity")
             (:file "dbc-class-media-entity")
             (:file "dbc-class-regexps")
             (:file "dbc-class-users")
             (:file "dbc-class-description")
             (:file "dbc-class-documentation")
             (:file "dbc-class-parse-convert")
             (:file "dbc-class-refs-convert")
             ;; (:file "dbc-class-entity-location")
             ;; (:file "dbc-class-artist-convert")
             ;; (:file "dbc-class-themes-convert")
             ;; (:file "dbc-tgm")))
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
   (:file "uuids-loadtime-bind")
   ))

(defmethod asdf:perform :after ((op asdf:load-op) (system (eql (asdf:find-system :dbc))))
  (pushnew :dbc cl:*features*)
  (let ((chk-if 
         #-:is-mon (fad:file-exists-p 
                    (merge-pathnames (make-pathname :name "loadtime-bind" :type "lisp")
                                     (mon:pathname-directory-system :dbc)))
         #+:is-mon (probe-file (translate-logical-pathname "MON:DBC-SPECIFIC;loadtime-bind.lisp"))))
    (and chk-if (load  chk-if)))
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
