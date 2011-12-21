;;; :FILE-CREATED <Timestamp: #{2011-12-20T10:40:13-05:00Z}#{11512} - by MON>
;;; :FILE dbc-specific/dbc-utils.lisp
;;; ==============================

(in-package #:dbc)

(defun every-digit-char-p (string)
  (declare (string string)
           (optimize (speed 3)))
  (unless (zerop (length string))
    (every #'digit-char-p string)))

;; (every-digit-char-p "0")
;; (every-digit-char-p "0")
;; (notevery-digit-char-p "aaiac")
;; (notevery-digit-char-p "")

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

;;; ==============================
;;; EOF
