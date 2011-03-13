;;; :FILE-CREATED <Timestamp: #{2011-03-12T12:46:39-05:00Z}#{11106} - by MON>
;;; :FILE dbc-uuid/dbc-uuid-profile.lisp
;;; ==============================


(in-package #:dbc-test)

;; *package*

(defun make-v5-uuid-test (n namespace &optional stream)
  ;; :USAGE (dbc:make-v5-uuid-test 3 dbc:*uuid-namespace-dns* t)
  (loop 
     initially (format (or stream t) "~%;; evaluating `make-v5-uuid-test'~%~
                                      iterations: ~D~%~
                                      namespace: ~S~%" n namespace)
     repeat n
     do 
     (print-object (dbc:make-v5-uuid namespace (mon-test:make-random-string)) (or stream t))
     (terpri (or stream t))))




;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc-test
;; End:

;;; ==============================
;;; EOF
