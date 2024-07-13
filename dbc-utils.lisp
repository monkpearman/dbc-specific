;;; :FILE-CREATED <Timestamp: #{2011-12-20T10:40:13-05:00Z}#{11512} - by MON>
;;; :FILE dbc-specific/dbc-utils.lisp
;;; ==============================


(in-package #:dbc)

(defun every-digit-char-p (string)
  (declare (string string)
           (optimize (speed 3)))
  (unless (zerop (length string))
    (every #'digit-char-p string)))

(defun notevery-digit-char-p (string)
  (declare (string string)
           (optimize (speed 3)))
  (notevery #'digit-char-p string))

(defun %not-every-char-zero-p (string)
  (declare (string string))
  (labels ((char-zero-p (x)
             (declare (character x))
             (char= x #\0))
           (every-char-zero-p (string)
             (declare (string string))
             (every #'char-zero-p string)))
    (not (every-char-zero-p string))))

(defun make-hash-table-sync (&key (test 'eql)
                                  (size 7)
                                  (rehash-size 1.5)
                                  (rehash-threshold 1)
                                  ;; (hash-function nil user-hashfun-p) 
                                  (weakness nil))
  #+:sbcl (make-hash-table :test test
                           :size size 
                           :rehash-size rehash-size
                           :rehash-threshold rehash-threshold 
                           :weakness weakness
                           ;; :hash-function hash-function
                           :synchronized t)
  #-:sbcl (make-hash-table :test test
                           :size size 
                           :rehash-size rehash-size
                           :rehash-threshold rehash-threshold 
                           :weakness weakness
                           ;; :hash-function hash-function
                           :synchronized t)) 
                   

(defmacro with-locked-hash-table ((table) &body body)
  #+lispworks
  `(progn ,@body)
  #+ccl
  `(progn ,@body)
  #+sbcl
  `(sb-ext:with-locked-hash-table (,table)
     (progn ,@body)))



;;; ==============================
;;; EOF
