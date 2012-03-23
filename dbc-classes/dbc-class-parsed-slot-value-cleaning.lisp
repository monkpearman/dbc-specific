;;; :FILE-CREATED <Timestamp: #{2012-03-21T21:01:14-04:00Z}#{12123} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-slot-value-cleaning.lisp
;;; ==============================

;; :NOTE currently nothing in here is checking `slot-exists-p' or `slot-boundp'


;; always (or (null slot-v)
;;            (and (stringp slot-v) 
;;                 (string= slot-v "0"))))
;; unless (and (stringp slot-v) 
;;             (string= slot-v "0"))
;; collect (list obj-id slot-v))

(in-package #:dbc)


;; :PASTED #{2012-03-23T14:56:07-04:00Z}#{12125}
;; :PASTE-URL (URL `http://paste.lisp.org/display/128524')
;; :PASTE-TITLE `sort-unique-numeric-string-sequence'
;;
;; Return a copy of STRING-SEQUENCE  sorted according to TEST.
;; STRING-SEQUENCE is a list or simple-vector. 
;; When STRING-SEQUENCE has length zerop return it, else each element of
;; string-sequence must be a non-empty string with 0 every character satsifying
;; cl:digit-char-p such that the parse-integer representation of string is a unique
;; integer value for the set of parse-integer elements represented by
;; STRING-SEQUENCE, an error is signalled if not (possibly leaving
;; STRING-SEQUENCE in a corrupted state).
;;
;; Keyword TEST is a function either #'> or #'<. An error is signaled if not.
;; :EXAMPLE
;;  (parsed-class-slot-value-sort-unique-numeric-string-sequence  '("1" "1000" "100"  "0002") :test #'>)
;;  (parsed-class-slot-value-sort-unique-numeric-string-sequence  '("1" "1000" "100"  "0002") :test #'>)
;;  (parsed-class-slot-value-sort-unique-numeric-string-sequence  #("1" "1000" "100"  "0002") :test #'<)
;;  (parsed-class-slot-value-sort-unique-numeric-string-sequence  #("1" "1000" "100"  "0002") :test #'>)
;;  (parsed-class-slot-value-sort-unique-numeric-string-sequence  () :test #'<)
;;  (parsed-class-slot-value-sort-unique-numeric-string-sequence  #() :test #'<)
;; Following error succesfully:
;;  (parsed-class-slot-value-sort-unique-numeric-string-sequence  #("1" "1000" "100"  "0002") :test #'<=)
;;  (parsed-class-slot-value-sort-unique-numeric-string-sequence  '("" "1000" "100"  "0002") :test #'>)
;;  (parsed-class-slot-value-sort-unique-numeric-string-sequence  '("1.8" "1000" "100"  "0002") :test #'>)
;;  (parsed-class-slot-value-sort-unique-numeric-string-sequence  #("1" "1000" "100" "0001" "0002") :test #'>)
;; 
(defun parsed-class-slot-value-sort-unique-numeric-string-sequence (string-sequence &key (test #'<))
  (declare 
   ;; (sequence string-sequence)
   ((or list simple-vector) string-sequence)
   (optimize (speed 3) (safety 2)))
  (or (eql test #'<)
      (eql test #'>)
      (error ":FUNCTION `parsed-class-slot-value-sort-unique-numeric-string-sequence' ~
              -- arg TEST must be either #'> or #'<~% got: ~S" test))
  (if (zerop (length string-sequence))
      string-sequence
      (labels ((%string-not-empty-all-digit-char-p (seq-elt)
                 (or (and (stringp seq-elt)
                          (not (zerop (length seq-elt)))
                          (every #'digit-char-p (the string seq-elt))
                          seq-elt)
                     (error ":FUNCTION `parsed-class-slot-value-sort-unique-numeric-string-sequence' ~
                             -- element in return value not sortable as a numeric string~% got: ~S~%" seq-elt)))
               (%seq-elt-parse-integer (seq-elt)
                 (parse-integer (%string-not-empty-all-digit-char-p seq-elt)))
               (%intern-integer-and-string (seq-elt ht)
                 (declare (hash-table ht))
                 (let ((int-from-string (%seq-elt-parse-integer seq-elt)))
                   (or (and (gethash int-from-string ht)
                            (error ":FUNCTION `parsed-class-slot-value-sort-unique-numeric-string-sequence' ~
                                    -- elements in arg STRING-SEQUENCE have duplicate integer values~% ~
                                    elt ~S duplictes elt ~S~%" seq-elt (gethash int-from-string ht)))
                       (setf (gethash int-from-string ht) seq-elt))
                   int-from-string)))
        (declare ((or cons simple-vector) string-sequence))
        (let* ((seq-length (length string-sequence))
               (int-string-ht (make-hash-table :size seq-length :test #'eq))
               (seqtype (etypecase string-sequence
                          (cons           'list)
                          (simple-vector  'vector)))
               (maybe-coerced (or (and (eql seqtype 'list)
                                       ;; (apply 'vector string-sequence)
                                       (make-array seq-length :initial-contents (the cons string-sequence)))
                                  (copy-seq (the simple-vector string-sequence)))))
          (declare (hash-table int-string-ht)
                   (symbol seqtype)
                   (mon:index seq-length)
                   (simple-vector maybe-coerced))
          (loop 
            for integer-elt across (loop 
                                     for string-elt across maybe-coerced
                                     for sv-idx from 0 below seq-length
                                     do (setf (svref maybe-coerced sv-idx)
                                              (%intern-integer-and-string string-elt int-string-ht))
                                     finally (return (setf maybe-coerced (sort maybe-coerced test))))
            for sorted-idx from 0 below seq-length
            do (setf (svref maybe-coerced sorted-idx)
                     (gethash integer-elt int-string-ht))
            finally (return (or (and (eql seqtype 'list)
                                     (coerce maybe-coerced 'cons))
                                maybe-coerced)))))))

(defun parsed-class-slot-value-compare-count (class slot)
  (declare (symbol class slot))
  (loop 
    with ht = (parsed-class-parse-table class)
    for obj being the hash-values in ht
    for slot-v = (slot-value obj slot)
    if (null slot-v)
    counting (null slot-v) into cnt-null
    counting (and slot-v)  into cnt-non-null
    counting (stringp slot-v) into cnt-strings
    counting (not (stringp slot-v)) into cnt-not-strings
    finally (return (list :hash-count (hash-table-count ht) 
                          :strings cnt-strings
                          :not-strings cnt-not-strings
                          :non-null cnt-non-null 
                          :null cnt-null))))

;; (parsed-class-slot-value-count-null 'parsed-inventory-record 'title-ebay)
(defun parsed-class-slot-value-count-null (class slot)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (null slot-v) 
    count it))
;;
(defun parsed-class-slot-value-count-non-null (class slot)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (not (null slot-v) )
    count it))

;; (parsed-class-slot-value-count-string= 'parsed-inventory-record 'record-status-active "2")
(defun parsed-class-slot-value-count-string= (class slot match-string)
  (declare (symbol class slot)
           (string match-string))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (and (stringp slot-v) 
              (string= slot-v match-string))
    count it))

(defun parsed-class-slot-value-count-eql (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    count (eql slot-v match-value)))

(defun parsed-class-slot-value-count-equal (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    count (equal slot-v match-value)))

(defun parsed-class-slot-value-count-equalp (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    count (equalp slot-v match-value)))

;; (parsed-class-slot-value-count-string/= 'parsed-inventory-record 'price-sold-ebay "0")
(defun parsed-class-slot-value-count-string/= (class slot match-string)
  (declare (symbol class slot)
           (string match-string))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (and (stringp slot-v) 
              (string/= slot-v match-string))
    count it))

(defun parsed-class-slot-value-count-not-eql (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    count (not (eql slot-v match-value))))

(defun parsed-class-slot-value-count-not-equal (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    count (not (equal slot-v match-value))))

(defun parsed-class-slot-value-count-not-equalp (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    count (not (equalp slot-v match-value))))

;; (parsed-class-slot-value-always-string= 'parsed-inventory-record 'price-sold-ebay "0")
(defun parsed-class-slot-value-always-string= (class slot match-string)
  (declare (symbol class slot)
           (string match-string))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    always (and (stringp slot-v) 
                (string= slot-v match-string))))

(defun parsed-class-slot-value-always-null (class slot)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    always (null slot-v)))

(defun parsed-class-slot-value-always-eql (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    always (eql slot-v match-value)))

(defun parsed-class-slot-value-always-equal (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    always (equal slot-v match-value)))

(defun parsed-class-slot-value-always-equalp (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    always (equalp slot-v match-value)))

(defun parsed-class-slot-value-never-null (class slot)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    never (null slot-v)))

(defun parsed-class-slot-value-never-string= (class slot match-string)
  (declare (symbol class slot)
           (string match-string))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    never (and (stringp slot-v) 
               (string= slot-v match-string))))

(defun parsed-class-slot-value-never-eql (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    never (eql slot-v match-value)))

(defun parsed-class-slot-value-never-equal (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    never (equal slot-v match-value)))

(defun parsed-class-slot-value-never-equalp (class slot match-value)
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    never (equalp slot-v match-value)))

(defun parsed-class-slot-value-thereis-null (class slot)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    thereis (null slot-v)))

(defun parsed-class-slot-value-thereis-string= (class slot match-string)
  (declare (symbol class slot)
           (string match-string))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    thereis (and (stringp slot-v) 
                 (string= slot-v match-string))))

(defun parsed-class-slot-value-thereis-eql (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    thereis (eql slot-v match-value)))

(defun parsed-class-slot-value-thereis-equal (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    thereis (equal slot-v match-value)))

(defun parsed-class-slot-value-thereis-equalp (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    thereis (equalp slot-v match-value)))

(defun parsed-class-slot-value-collect-all (class slot)
  (declare (symbol class slot))
  (loop
    with ht = (parsed-class-parse-table class)
    for obj-id being the hash-keys in ht using (hash-value obj)
    for slot-v = (slot-value obj slot)
    collect (cons obj-id slot-v) into gthr
    if slot-v
    count slot-v into cnt-non-null
    else
    count slot-v into cnt-null
    finally (return (values gthr 
                            (list :hash-count (hash-table-count ht) 
                                  :non-null cnt-non-null 
                                  :null cnt-null)))))

(defun parsed-class-slot-value-collect-string= (class slot match-string &key (sort-object-ids nil))
  (declare (symbol class slot)
           (string match-string)
           ((or null (eql #'>) (eql #'<)) sort-object-ids))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (and (stringp slot-v) 
              (string= slot-v match-string))
    count slot-v into cnt and
    collect obj-id into gthr 
    finally (return (values (if sort-object-ids
                                (parsed-class-slot-value-sort-unique-numeric-string-sequence gthr :test sort-object-ids)
                                gthr)
                            cnt))))

;; (parsed-class-slot-value-collect-string/= 'parsed-inventory-record 'price-sold-ebay "0")
(defun parsed-class-slot-value-collect-string/= (class slot match-string)
  (declare (symbol class slot)
           (string match-string))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (and (stringp slot-v) 
              (string/= slot-v match-string))
    count slot-v into cnt and
    collect (cons obj-id slot-v) into gthr 
    finally (return (values gthr cnt))))

;; (parsed-class-slot-value-collect-null 'parsed-inventory-record 'title-ebay)
(defun parsed-class-slot-value-collect-null (class slot &key (sort-object-ids nil))
  (declare (symbol class slot)
           ((or null (eql #'>) (eql #'<)) sort-object-ids))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    count (null slot-v) into cnt
    unless slot-v
    collect obj-id into gthr 
    finally (return (values (if sort-object-ids
                                (parsed-class-slot-value-sort-unique-numeric-string-sequence gthr :test sort-object-ids)
                                gthr)
                            cnt))))

;; (parsed-class-slot-value-collect-non-null 'parsed-inventory-record 'title-ebay)
(defun parsed-class-slot-value-collect-non-null (class slot)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (not (null slot-v))
    count slot-v into cnt and
    collect (cons obj-id slot-v) into gthr 
    finally (return (values gthr cnt))))

(defun parsed-class-slot-value-collect-eql (class slot match-value &key (sort-object-ids nil))
  (declare (symbol class slot)
           ((or null (eql #'>) (eql #'<)) sort-object-ids))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (eql slot-v match-value)
    count slot-v into cnt and
    collect obj-id into gthr 
    finally (return (values (if sort-object-ids
                                (parsed-class-slot-value-sort-unique-numeric-string-sequence gthr :test sort-object-ids)
                                gthr)
                            cnt))))

(defun parsed-class-slot-value-collect-equal (class slot match-value &key (sort-object-ids nil))
  (declare (symbol class slot)
           ((or null (eql #'>) (eql #'<)) sort-object-ids))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (equal slot-v match-value)
    count slot-v into cnt and
    collect obj-id into gthr 
    finally (return (values (if sort-object-ids
                                (parsed-class-slot-value-sort-unique-numeric-string-sequence gthr :test sort-object-ids)
                                gthr)
                            cnt))))

(defun parsed-class-slot-value-collect-equalp (class slot match-value &key (sort-object-ids nil))
  (declare (symbol class slot)
           ((or null (eql #'>) (eql #'<)) sort-object-ids))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (equalp slot-v match-value)
    count slot-v into cnt and
    collect obj-id into gthr 
    finally (return (values (if sort-object-ids
                                (parsed-class-slot-value-sort-unique-numeric-string-sequence gthr :test sort-object-ids)
                                gthr)
                            cnt))))

(defun parsed-class-slot-value-collect-not-eql (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    unless (eql slot-v match-value)
    count slot-v into cnt and
    collect (cons obj-id slot-v) into gthr 
    finally (return (values gthr cnt))))

(defun parsed-class-slot-value-collect-not-equal (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    unless (equal slot-v match-value)
    count slot-v into cnt and
    collect (cons obj-id slot-v) into gthr 
    finally (return (values gthr cnt))))

(defun parsed-class-slot-value-collect-not-equalp (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    unless (equalp slot-v match-value)
    count slot-v into cnt and
    collect (cons obj-id slot-v) into gthr 
    finally (return (values gthr cnt))))

(defun parsed-class-slot-value-set-when-null (class slot replacement-value 
                                              &key (return-object-id t)
                                                   (sort-object-ids nil))
  (declare (symbol class slot)
           (boolean return-object-id)
           ((or null (eql #'>) (eql #'<)) sort-object-ids))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    unless slot-v
    count (null slot-v) into cnt and
    if return-object-id 
    collect obj-id into gthr
    end
    and do (setf (slot-value obj slot) replacement-value)
    finally (return
              (if return-object-id 
                  (values cnt 
                          (if sort-object-ids
                              (parsed-class-slot-value-sort-unique-numeric-string-sequence gthr
                                                                                           :test sort-object-ids)
                              gthr))
                  cnt))))

;; (parsed-class-slot-value-set-when-string= 'parsed-inventory-record 'title-ebay "0" nil) => 232 
(defun parsed-class-slot-value-set-when-string= (class slot match-string replacement-value 
                                                 &key (return-object-id t)
                                                      (sort-object-ids nil))
  (declare (symbol class slot)
           (string match-string)
           (boolean return-object-id)
           ((or null (eql #'>) (eql #'<)) sort-object-ids))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (and (stringp slot-v) 
              (string= slot-v match-string))
    count slot-v into cnt and
    if return-object-id 
    collect obj-id into gthr
    end
    and do (setf (slot-value obj slot) replacement-value)
    finally (return 
              (if return-object-id 
                  (values cnt 
                          (if sort-object-ids
                              (parsed-class-slot-value-sort-unique-numeric-string-sequence gthr 
                                                                                           :test sort-object-ids)
                              gthr))
                  cnt))))

(defun parsed-class-slot-value-set-when-eql (class slot match-value replacement-value 
                                             &key (return-object-id t)
                                                  (sort-object-ids nil))
  (declare (symbol class slot)
           (boolean return-object-id)
           ((or null (eql #'>) (eql #'<)) sort-object-ids))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (eql slot-v match-value)
    count slot-v into cnt and
    if return-object-id 
    collect obj-id into gthr
    end
    and do (setf (slot-value obj slot) replacement-value)
    finally (return 
              (if return-object-id 
                  (values cnt
                          (if sort-object-ids
                              (parsed-class-slot-value-sort-unique-numeric-string-sequence gthr :test sort-object-ids)
                              gthr))
                  cnt))))

(defun parsed-class-slot-value-set-when-equal (class slot match-value replacement-value &key (return-object-id t)
                                                                                             (sort-object-ids nil))
  (declare (symbol class slot)
           (boolean return-object-id)
           ((or null (eql #'>) (eql #'<)) sort-object-ids))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (equal slot-v match-value)
    count slot-v into cnt and
    if return-object-id 
    collect obj-id into gthr
    end
    and do (setf (slot-value obj slot) replacement-value)
    finally (return 
              (if return-object-id 
                  (values cnt 
                          (if sort-object-ids
                              (parsed-class-slot-value-sort-unique-numeric-string-sequence gthr :test sort-object-ids)
                              gthr))
                  cnt))))

(defun parsed-class-slot-value-set-when-equalp (class slot match-value replacement-value
                                                &key (return-object-id t)
                                                     (sort-object-ids nil))
  (declare (symbol class slot)
           (boolean return-object-id)
           ((or null (eql #'>) (eql #'<)) sort-object-ids))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (equalp slot-v match-value)
    count slot-v into cnt and
    if return-object-id 
    collect obj-id into gthr
    end
    and do (setf (slot-value obj slot) replacement-value)
    finally (return 
              (if return-object-id 
                  (values cnt 
                          (if sort-object-ids
                              (parsed-class-slot-value-sort-unique-numeric-string-sequence gthr :test sort-object-ids)
                              gthr))
                  cnt))))

(defun parsed-class-slot-value-set-when-string/= (class slot match-string replacement-value
                                                  &key (return-object-id t)
                                                       (sort-object-ids nil))
  (declare (symbol class slot)
           (boolean return-object-id)
           ((or null (eql #'>) (eql #'<)) sort-object-ids))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (and (stringp slot-v) 
              (string/= slot-v match-string))
    count slot-v into cnt and
    if return-object-id 
    collect obj-id into gthr
    end
    and do (setf (slot-value obj slot) replacement-value)
    finally (return 
              (if return-object-id 
                  (values cnt 
                          (if sort-object-ids
                              (parsed-class-slot-value-sort-unique-numeric-string-sequence gthr :test sort-object-ids)
                              gthr))
                  cnt))))

;; 
;; (fundoc 'parsed-class-set-slot-value-from-consed-pairs
;; HASH-KEY-AND-NEW-VALUE is a list of conses of the form:
;; (<HASH-KEY> . <NEW-VALUE>)
;; BE CAREFUL! This function does not check `slot-exists-p' `slot-boundp' and
;; does not discriminate wrt whether <NEW-VALUE> is appropriate for SLOT-NAME.
(defun parsed-class-set-slot-value-from-consed-pairs (parsed-class slot-name hash-key-and-new-value)
  (declare (symbol parsed-class slot-name)
           (cons hash-key-and-new-value))
  (loop 
    with ht = (parsed-class-parse-table parsed-class)
    for (hash-key . new-value) in hash-key-and-new-value
    for obj = (gethash hash-key ht)
    when obj
    do (setf (slot-value obj slot-name) new-value)))

;;; ==============================
;;; EOF
