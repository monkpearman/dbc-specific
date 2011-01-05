;;; :FILE-CREATED <Timestamp: #{2011-01-01T14:14:51-05:00Z}#{11526} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/dbc.asd
;;; ==============================
;;; -*- mode: lisp -*-


;; (push #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/" asdf:*central-registry*)

;; :NOTE While debugging per file:
;; (declaim (optimize (debug 3)))
;; Or, (sb-ext:restrict-compiler-policy 'debug 3)

;; To remove the compile fasls do
;; (asdf:clear-system :mon)

;; (ql:quickload :dbc :verbose t :explain t)

;; (dired "/home/sp/.cache/common-lisp/sbcl-1.0.45.3-linux-x86/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/")


(defpackage #:dbc-build-system (:use :common-lisp :asdf))

(in-package #:dbc-build-system)

(defsystem :dbc
  ;; :name ""
  ;; :author  "MON KEY"
  ;; :maintainer "MON KEY"
  ;; :license 
  :description "DBC agglomerated."
  :version "1.0.0"
  :depends-on (:cxml
	       :closure-html
	       :split-sequence
	       :mon
	       ;; :arnesi ;; arnesi:parse-float
	       ;; :alexandria
	       ;; :cl-ppcre
	       ;; :local-time
	       ;; :cl-fad
	       ;; :drakma
	       )

  ;; :perform (load-op :after (op mon) (pushnew :mon *features*))
  :serial t    
  :components 
  ((:file "packageg")
   (:module "dbc-parse"
	    :components
	    ((:file "dbc-xml-sql-parse")
	    ;; (:file "psa-parse-table.lisp")
	    ))
   ;; (:module "dbc-classes"
   ;; 	    :components ((:file "dbc-classes")
   ;; 			 (:file "dbc-class-artist-convert.lisp")
   ;; 			 (:file "dbc-tgm.lisp")))
   ))

;; (defmethod asdf:perform :after
;;     ((op asdf:load-op) (system (eql (asdf:find-system :dbc))))
;;   (pushnew :dbc cl:*features*))


;;; ==============================
;;; EOF
