;;; :FILE-CREATED <Timestamp: #{2012-03-21T21:01:14-04:00Z}#{12123} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-slot-value-cleaning.lisp
;;; ==============================

(in-package #:dbc)


;; (parsed-class-slot-value-count-matching-string= 'parsed-inventory-record 'record-status-active "2")
(defun parsed-class-slot-value-count-matching-string= (class slot match-string)
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (and (stringp slot-v) 
              (string= slot-v match-string))
    count it))

;; (parsed-class-slot-value-set-when-string= 'parsed-inventory-record 'title-ebay "0" nil) => 232 
(defun parsed-class-slot-value-set-when-string= (class slot match-string replacement-value)
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (and (stringp slot-v) 
              (string= slot-v match-string))
    count slot-v into cnt and
    do (setf (slot-value obj slot) replacement-value)
    finally (return cnt)))

;; (parsed-class-slot-value-count-null 'parsed-inventory-record 'title-ebay)
(defun parsed-class-slot-value-count-null (class slot)
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (null slot-v) 
    count it))

;; (parsed-class-slot-value-collect-non-null 'parsed-inventory-record 'title-ebay)
(defun parsed-class-slot-value-collect-non-null (class slot)
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (not (null slot-v))
    count slot-v into cnt and
    collect (cons obj-id slot-v) into gthr 
    finally (return (values gthr cnt))))


;;; ==============================
;;; EOF
