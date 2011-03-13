;;; :FILE-CREATED <Timestamp: #{2011-03-12T12:46:39-05:00Z}#{11106} - by MON>
;;; :FILE dbc-uuid/dbc-uuid-profile.lisp
;;; ==============================


(in-package #:dbc-test)

;; *package*

(defun make-v5-uuid-test (n namespace)
  ;; :USAGE (dbc:make-v5-uuid-test 3 dbc:*uuid-namespace-dns* t)

  (let ((os (make-string-output-stream)))
    (unwind-protect
         (loop 
            initially (format os "~%;; evaluating `make-v5-uuid-test'~%~
                                      iterations: ~D~%~
                                      namespace: ~S~%" n namespace)
            repeat n
            for obj = (dbc:make-v5-uuid namespace (mon-test:make-random-string))
            do (print-object obj os)
              (terpri os)
            finally (return (princ (get-output-stream-string os) *standard-output*)))
      (close os))))
    
;; (format nil "~A" s)))
;; (dbc-test:make-v5-uuid-test 3 dbc:*uuid-namespace-dns*)

;; (dbc:uuid-print-bytes nil dbc:*uuid-namespace-dns*)
;; (dbc-test:make-v5-uuid-test 3 dbc:*uuid-namespace-dns*)

;; (let ((msos (make-string-output-stream)))
;;   (unwind-protect 
;;        (progn
;;          (sb-sprof:with-profiling (:max-samples 10
;;                                                 :mode :alloc
;;                                                 ;; :report :flat
;;                                                 :stream msos
;;                                                 )
;;            (dbc-test:make-v5-uuid-test 10 *uuid-namespace-dns*))
;;          (get-output-stream-string msos))
;;     (close msos)))


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc-test
;; End:

;;; ==============================
;;; EOF
