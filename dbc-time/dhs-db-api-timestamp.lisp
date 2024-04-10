;; :SOURCE dhs-db/dhs-db-api/timestamp.lisp
;; 
;; http://code.google.com/p/dhs-db/source/checkout
;; hg clone https://code.google.com/p/dhs-db/
;; 
;; author lokedhs
;; BSD 2 LICENSE
;; This project implements a database compatibility layer that sits on top of
;; existing libraries such as CLSQL and hu.dwim

(in-package :dhs-db)

(declaim #.*compile-decl*)

;;;
;;;  DATABASE-TIMESTAMP class
;;;
(defclass database-timestamp ()
  ((value :type integer
          :initarg :value
          :initform (error "~s missing when instantiating ~s" :value 'timestamp)
          :accessor timestamp-value
          :documentation "The universal time value for this timestamp"))
  (:documentation "Encapsulates a timestamp"))

(defmethod print-object ((obj database-timestamp) out)
  (print-unreadable-object (obj out :type t :identity t)
    (format out "~a" (format-date obj))))

(defgeneric format-date (value)
  (:documentation "Formats a date value in SQL form"))

(defun make-database-timestamp (v)
  (multiple-value-bind (matched values) (cl-ppcre:scan-to-strings "^([0-9]{4})-([0-9]{2})-([0-9]{2}) ([0-9]{2}):([0-9]{2}):([0-9]{2})(\\.[0-9]+)?$" v)
    (unless matched (error "Can't parse ~s as a timestamp" v))
    (make-instance 'database-timestamp :value (encode-universal-time (parse-integer (aref values 5))
                                                                     (parse-integer (aref values 4))
                                                                     (parse-integer (aref values 3))
                                                                     (parse-integer (aref values 2))
                                                                     (parse-integer (aref values 1))
                                                                     (parse-integer (aref values 0))))))

;;;
;;;  DATABASE-DATE class
;;;
(defclass database-date (database-timestamp)
  ()
  (:documentation "Specialisation of TIMESTAMP used to represent a date without a time"))

(defun make-database-date (v)
  (multiple-value-bind (matched values) (cl-ppcre:scan-to-strings "^([0-9]{4})-([0-9]{2})-([0-9]{2})$" v)
    (unless matched
      (error "Can't parse ~s as a date" v))
    (make-instance 'database-date :value (encode-universal-time 0 0 0
                                                                (parse-integer (aref values 2))
                                                                (parse-integer (aref values 1))
                                                                (parse-integer (aref values 0))))))

;;;
;;;  DATABASE-TIME class
;;;
(defclass database-time (database-timestamp)
  ()
  (:documentation "Specialisation of TIMESTAMP used to represent a time without a date"))

(defun make-database-time (v)
  (multiple-value-bind (matched values) (cl-ppcre:scan-to-strings "^([0-9]{2}):([0-9]{2}):([0-9]{2})(\\.[0-9]+)?$" v)
    (unless matched (error "Can't parse ~s as a time" v))
    (make-instance 'database-time :value (encode-universal-time (parse-integer (aref values 2))
                                                                (parse-integer (aref values 1))
                                                                (parse-integer (aref values 0))
                                                                1 1 2000))))

(defun format-integer-as-timestamp (value)
  (multiple-value-bind (sec min hour date month year) (decode-universal-time value)
    (format nil "~4,'0d-~2,'0d-~2,'0d ~2,'0d:~2,'0d:~2,'0d"
            year month date hour min sec)))

(defun format-integer-as-date (value)
  (multiple-value-bind (sec min hour date month year) (decode-universal-time value)
    (declare (ignore sec min hour))
    (format nil "~4,'0d-~2,'0d-~2,'0d" year month date)))

(defun format-integer-as-time (value)
  (multiple-value-bind (sec min hour date month year) (decode-universal-time value)
    (declare (ignore date month year))
    (format nil "~2,'0d:~2,'0d:~2,'0d" hour min sec)))

(defmethod format-date ((value database-timestamp))
  (format-integer-as-timestamp (timestamp-value value)))

(defmethod format-date ((value database-date))
  (format-integer-as-date (timestamp-value value)))

(defmethod format-date ((value database-time))
  (format-integer-as-time (timestamp-value value)))
