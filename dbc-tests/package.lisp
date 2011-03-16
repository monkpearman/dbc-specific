;;; :FILE-CREATED <Timestamp: #{2011-03-12T19:03:47-05:00Z}#{11106} - by MON>
;;; :FILE dbc-tests/package.lisp
;;; ==============================


;; (in-package #:dbc-test) ;; for Slime

;; *package*

(defpackage #:dbc-test 
  (:use #:common-lisp) ;; #:mon-test)
  (:export
   ;;
 ;; dbc-tests/tests.lisp
   #:system-test-temp-dir-exists-p
   ;;
 ;; dbc-tests/dbc-uuid-profile.lisp
   #:make-v5-uuid-test
   ;;
   ))


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc-test
;; End:

;;; ==============================
;;; EOF

