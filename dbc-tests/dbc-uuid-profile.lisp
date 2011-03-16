;;; :FILE-CREATED <Timestamp: #{2011-03-12T12:46:39-05:00Z}#{11106} - by MON>
;;; :FILE dbc-uuid/dbc-uuid-profile.lisp
;;; ==============================


(in-package #:dbc-test)

;; *package*

;; :NOTE The dbc package defines the parameters `dbc:*system-tests-dir*' and
;; `dbc:*system-tests-temp-dir*' at loadtime and sets them to instances of
;; `dbc:system-subdir' a system relative path at loadtime.
;;  The `cl:pathname-directory' of each is accessible with:
;;  (dbc:sub-path dbc::*system-tests-dir*)
;;  (dbc:sub-path dbc::*system-tests-temp-dir*)

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

;; (mon-test:make-random-string)

;; (dbc:uuid-print-bytes nil dbc:*uuid-namespace-dns*)
;; (dbc-test:make-v5-uuid-test 3 dbc:*uuid-namespace-dns*)

;; (dotimes (i 100000)
;;   (dbc:make-v5-uuid dbc:*uuid-namespace-dns* (mon-test:make-random-string)))


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


(defun uuid-get-namespace-bytes-TEST (uuid)
  ;; used to erify the lenth of each elt of array returned from `uuid-number-to-byte-array'
  ;; in particular look at the 5 elt of return value
  ;; (elt '((4 . #(107 167 184 16))
  ;;        (2 . #(157 173))
  ;;        (2 . #(17 209))
  ;;        (1 . #(128))
  ;;        (1 . #(180)) 
  ;;        (5 . #(192 79 212 48 200))) ;; <- This should aways be a 6 elt array 
  ;;       5)  
  (declare (type unique-universal-identifier uuid))
  (with-slots (%uuid_time-low
               %uuid_time-mid
               %uuid_time-high-and-version
               %uuid_clock-seq-and-reserved
               %uuid_clock-seq-low
               %uuid_node)
      uuid
    ;; *uuid-namespace-dns*
    (declare (type uuid-ub32 %uuid_time-low)
             (type uuid-ub16 %uuid_time-mid %uuid_time-high-and-version)
             (type uuid-ub8  %uuid_clock-seq-and-reserved %uuid_clock-seq-low)
             (type uuid-ub48 %uuid_node))
    (loop 
       for slots in `(,%uuid_time-low ,%uuid_time-mid ,%uuid_time-high-and-version
                                      ,%uuid_clock-seq-and-reserved ,%uuid_clock-seq-low ,%uuid_node)
       for (a b) = (multiple-value-list (uuid-number-to-byte-array slots))
       collect  (cons b a) )))

;; 
;; (loop 
;;   repeat 10
;;   for uuid = (make-v4-uuid)
;;   collect  (uuid-get-namespace-bytes-TEST uuid))
;;
;; (uuid-get-namespace-bytes-TEST *uuid-namespace-dns*)
;; (uuid-get-namespace-bytes-TEST *uuid-namespace-url*)
;; (uuid-get-namespace-bytes-TEST *uuid-namespace-oid*)
;; (uuid-get-namespace-bytes-TEST *uuid-namespace-x500*)
;;
;;

  
(and (pathnamep (dbc:sub-path dbc::*system-tests-temp-dir*))

(let ((gthr '())
      (pthnm (merge-pathnames (make-pathname :name "1000-uuids") 
                              (dbc:sub-path dbc::*system-tests-temp-dir*))
              )))

  (setf gthr 
        (loop
           repeat 10000 
           collect (nth-value 1 (sb-ext:get-time-of-day))))
  (setf gthr (sort gthr #'>))
  (with-file-overwritten (s pthnm)
    (loop 
       for num in gthr
       do (print num s))))



;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc-test
;; End:

;;; ==============================
;;; EOF
