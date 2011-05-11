
(defpackage #:dbc-test-system (:use :common-lisp :asdf))

(in-package #:dbc-test-system)

(asdf:defsystem :dbc-test
  ;; :name ""
  ;; :author  "MON KEY"
  ;; :maintainer "MON KEY"
  ;; :license 
  :description "DBC tests."
  :version "1.0.0"
  :pathname  "dbc-tests/"
  ;;  (make-pathname :name nil :type nil :defaults *load-truename*))
  :components 
  ((:file "package")
   (:file "tests")
   (:file "dbc-uuid-profile"))
  :depends-on (:dbc :mon-test
                    #+sbcl :sb-rt
                    ;; :NOTE Need to add a package-nickname for :sb-rt for following:
                    #-sbcl :rt
                    ))

(defmethod asdf:perform :after ((op asdf:load-op) (system (eql (asdf:find-system :dbc-test))))
  (pushnew :dbc-test cl:*features*))


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF

