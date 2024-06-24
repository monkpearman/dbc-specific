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
;; (parsed-class-slot-value-compare-count 'parsed-inventory-record 'title-ebay)
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

;; (parsed-class-slot-value-collect-non-null 'parsed-inventory-record 'title-ebay)
;; (parsed-class-slot-value-count-non-null 'parsed-inventory-record 'title-ebay)
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

;; (parsed-class-slot-value-count-eql 'parsed-inventory-record 'unit-height 12) 
(defun parsed-class-slot-value-count-eql (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    count (eql slot-v match-value)))

;; (parsed-class-slot-value-count-equal 'parsed-inventory-record 'category-entity-3-coref  "Birds of New Guinea")
(defun parsed-class-slot-value-count-equal (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    count (equal slot-v match-value)))

;; (parsed-class-slot-value-count-equalp 'parsed-inventory-record 'category-entity-3-coref  "Birds of New Guinea")
(defun parsed-class-slot-value-count-equalp (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    count (equalp slot-v match-value)))

;; (parsed-class-slot-value-count-string/= 'parsed-inventory-record 'price-sold-ebay "0")
;; (parsed-class-slot-value-count-non-null 'parsed-inventory-record 'price-sold-ebay)
(defun parsed-class-slot-value-count-string/= (class slot match-string)
  (declare (symbol class slot)
           (string match-string))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (and (stringp slot-v) 
              (string/= slot-v match-string))
    count it))

;; (parsed-class-slot-value-count-not-eql 'parsed-inventory-record 'inventory-seller :LAPP )
;; (parsed-class-slot-value-count-not-eql 'parsed-inventory-record 'price-ask 150)
(defun parsed-class-slot-value-count-not-eql (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    count (not (eql slot-v match-value))))

;; (parsed-class-slot-value-count-not-equal 'parsed-inventory-record 'category-entity-0-coref    "Advertising and Graphics")
(defun parsed-class-slot-value-count-not-equal (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    count (not (equal slot-v match-value))))

;; (parsed-class-slot-value-count-not-equalp 'parsed-inventory-record 'description-inventory-condition '(:RATING 9 :DESCRIPTION NIL))
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
;; (parsed-class-slot-value-always-null 'parsed-inventory-record 'job-complete)
(defun parsed-class-slot-value-always-null (class slot)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    always (null slot-v)))

;; (parsed-class-slot-value-always-eql 'parsed-inventory-record 'inventory-seller  :LAPP)
(defun parsed-class-slot-value-always-eql (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    always (eql slot-v match-value)))

;; (parsed-class-slot-value-always-equal 'parsed-inventory-record 'inventory-seller  :LAPP)
(defun parsed-class-slot-value-always-equal (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    always (equal slot-v match-value)))

;; (parsed-class-slot-value-always-equalp 'parsed-inventory-record 'inventory-seller  :LAPP)
(defun parsed-class-slot-value-always-equalp (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    always (equalp slot-v match-value)))

;; (parsed-class-slot-value-never-null 'parsed-inventory-record 'inventory-number)
(defun parsed-class-slot-value-never-null (class slot)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    never (null slot-v)))

;; (parsed-class-slot-value-never-string= 'parsed-inventory-record 'inventory-number "FOO")
(defun parsed-class-slot-value-never-string= (class slot match-string)
  (declare (symbol class slot)
           (string match-string))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    never (and (stringp slot-v) 
               (string= slot-v match-string))))
;; (parsed-class-slot-value-never-eql 'parsed-inventory-record 'unit-width  99)
(defun parsed-class-slot-value-never-eql (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    never (eql slot-v match-value)))

;; (parsed-class-slot-value-never-equal 'parsed-inventory-record 'media-entity-technique  "")
(defun parsed-class-slot-value-never-equal (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    never (equal slot-v match-value)))

;; (parsed-class-slot-value-never-equalp 'parsed-inventory-record 'unit-weight  "")
(defun parsed-class-slot-value-never-equalp (class slot match-value)
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    never (equalp slot-v match-value)))

;; (parsed-class-slot-value-thereis-null 'parsed-inventory-record 'record-status-active)
(defun parsed-class-slot-value-thereis-null (class slot)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    thereis (null slot-v)))

;; (parsed-class-slot-value-thereis-string= 'parsed-inventory-record 'record-status-active "0")
(defun parsed-class-slot-value-thereis-string= (class slot match-string)
  (declare (symbol class slot)
           (string match-string))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    thereis (and (stringp slot-v) 
                 (string= slot-v match-string))))

;; (parsed-class-slot-value-thereis-eql 'parsed-inventory-record 'price-ask          140)
(defun parsed-class-slot-value-thereis-eql (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    thereis (eql slot-v match-value)))

;; (parsed-class-slot-value-thereis-equal 'parsed-inventory-record 'publication-date  '(:YEAR 1932 :MONTH 12 :DAY NIL))
(defun parsed-class-slot-value-thereis-equal (class slot match-value)
  (declare (symbol class slot))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    for slot-v = (slot-value obj slot)
    thereis (equal slot-v match-value)))
;; (parsed-class-slot-value-thereis-equalp 'parsed-inventory-record 'publication-date  '(:YEAR 1932 :MONTH 12 :DAY NIL))
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
           (string match-string))
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
  (declare (symbol class slot))
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
  (declare (symbol class slot))
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
  (declare (symbol class slot))
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
  (declare (symbol class slot))
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

;; (parsed-class-slot-value-collect-slot-values-using-slot-list 'parsed-inventory-record '(keyword-sequenced-entity-coref
;;                                                                       keyword-seo-sequenced-entity-coref
;;                                                                       theme-entity-0-coref
;;                                                                       theme-entity-1-coref
;;                                                                       theme-entity-2-coref
;;                                                                       category-entity-precedence-list))
(defun parsed-class-slot-value-collect-slot-values-using-slot-list (class slot-list)
  ;; (declare (symbol class))
  (loop 
    with slot-key-mapping = (loop
                              for slot-sym in slot-list
                              collect (cons slot-sym (find-symbol (string slot-sym) (find-package "KEYWORD"))))
    for obj-id being the hash-keys in (parsed-class-parse-table class) using (hash-value obj)
    collect (loop 
              for (slot . slot-key) in slot-key-mapping
              for slot-val = (slot-value obj slot)
              collecting (cons slot-key slot-val) into gthr 
              finally (return (list obj-id gthr)))))

(defun parsed-class-slot-value-set-when-null (class slot replacement-value 
                                              &key (return-object-id t)
                                                   (sort-object-ids nil))
  (declare (symbol class slot)
           (boolean return-object-id))
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
           (boolean return-object-id))
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
           (boolean return-object-id))
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
           (boolean return-object-id))
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
           (boolean return-object-id))
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
;; (parsed-class-slot-value-collect-string/= 'parsed-inventory-record 'category-entity-0-coref "Natural History")
(defun parsed-class-slot-value-set-when-string/= (class slot match-string replacement-value
                                                  &key (return-object-id t)
                                                       (sort-object-ids nil))
  (declare (symbol class slot)
           (boolean return-object-id))
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

(defun parsed-class-set-slot-value-from-proper-list (parsed-class slot-name hash-key-and-new-value)
  (declare (symbol parsed-class slot-name)
           (cons hash-key-and-new-value))
  (loop 
    with ht = (parsed-class-parse-table parsed-class)
    for (hash-key  new-value) in hash-key-and-new-value
    for obj = (gethash hash-key ht)
    when obj
    do (setf (slot-value obj slot-name) new-value)))

;; (parsed-class-slot-value-collect-split-bag 'parsed-artist-record
;;                                            'naf-entity-artist-display-name-coref
;;                                            `(#\| ,@(remove #\ (symbol-value 'mon::*whitespace-chars*))))
(defun parsed-class-slot-value-collect-split-bag (parsed-class slot-name-for-split-bag char-or-char-bag)
  (declare (symbol parsed-class slot-name-for-split-bag)
           ((or character list) char-or-char-bag))
  (loop 
    for obj-id being the hash-keys in (parsed-class-parse-table parsed-class) using (hash-value obj)
    for splits  = (slot-value obj slot-name-for-split-bag) 
    for cleaned = (if (null splits) 
                      nil 
                      (split-bag 
                       splits
                       char-or-char-bag))
    when (null splits) count it into null-count
    when (not (null splits)) count it into not-null-count
    unless (null cleaned)
    collect (list obj-id cleaned) into gthr
    end
    finally (return (values 
                     ;; (pprint gthr)
                     gthr
                   (list :NULL-SLOT-VALUE null-count :NOT-SLOT-VALUE not-null-count)))))

;; :NOTE There is no longer any reason to call this it is left here as a
;; reminder of the idiom we used to clean up edit-history junk
(defun %parsed-inventory-record-processs-edit-history ()
  (let ((targets (parsed-class-slot-value-collect-non-null 'parsed-inventory-record 'edit-history))
        (month-names local-time:+month-names+))
    (labels ((month-to-int-string (month-thing)
               (princ-to-string (position month-thing month-names :test #'string=)))
             (reduce-date (year month day)
               (car (mon::string-reduce 
                     (list year "-" (month-to-int-string month) "-" day))))
             (convert-time-edit (y m d)
               (princ-to-string
                (local-time:parse-timestring (reduce-date y m d))))
             (dbind-edit-timestamp (edit)
               (when edit 
                 (destructuring-bind ((month day year) by) edit
                   (list :edit-by by 
                         :edit-timestamp (convert-time-edit year month day)))))
             (unspace-edit (space-thing)
               (list* (split-sequence:split-sequence #\SPACE (car space-thing) :remove-empty-subseqs t)
                      (cdr space-thing)))
             (undash-edit (dash-thing)
               (reverse (split-sequence:split-sequence #\- dash-thing :remove-empty-subseqs t)))
             (comma= (c)
               (char= c #\,))
             (uncomma-edit (comma-thing)
               (and (stringp (cdr comma-thing))
                    (remove-if #'comma= (cdr comma-thing))))
             (unpipe-edit (pipe-thing)
               (split-sequence:split-sequence #\| (uncomma-edit pipe-thing)
                                              :remove-empty-subseqs t))
             (dedup-edit (edits)
               (delete-duplicates edits :test #'equal))
             (process-edit (edit-thing)
               (let ((maybe-parsed (map 'list #'dbind-edit-timestamp
                                        (map 'list #'unspace-edit
                                             (map 'list #'undash-edit
                                                  (unpipe-edit edit-thing))))))
                 (when maybe-parsed (list (car edit-thing) 
                                          (dedup-edit maybe-parsed)))))
             (process-all-edits (all-edits)
               (map 'list #'process-edit all-edits)))
      (loop 
        with ht = (parsed-class-parse-table 'parsed-inventory-record)
        with big-edit-conversion = (process-all-edits targets)
        for edit in big-edit-conversion
        for obj-id = (car edit)
        for edit-hist = (cadr edit)
        for obj = (gethash obj-id ht)
        do (setf (edit-history obj) edit-hist)
        finally (return (values big-edit-conversion targets))))))

;;; ==============================
;;; EOF
