;;; :FILE-CREATED <Timestamp: #{2011-02-18T19:33:01-05:00Z}#{11075} - by MON>
;;; :FILE dbc-parse/dbc-cln-parse.lisp
;;; ==============================

;;; ==============================
;;; :NOTE Use cl-ppcre !!!
;;;
;;; :NOTE Use SPLIT-SEQUENCE !!!!!
;;; * (split-sequence #\; "a;;b;c")
;;; -> ("a" "" "b" "c"), 6
;;;
;;; * (split-sequence #\; "a;;b;c" :from-end t)
;;; -> ("a" "" "b" "c"), 0
;;;
;;; * (split-sequence #\; "a;;b;c" :from-end t :count 1)
;;; -> ("c"), 4
;;;
;;; * (split-sequence #\; "a;;b;c" :remove-empty-subseqs t)
;;; -> ("a" "b" "c"), 6
;;;
;;; * (split-sequence-if (lambda (x) (member x '(#\a #\b))) "abracadabra")
;;; -> ("" "" "r" "c" "d" "" "r" ""), 11
;;;
;;; * (split-sequence-if-not (lambda (x) (member x '(#\a #\b))) "abracadabra")
;;; -> ("ab" "a" "a" "ab" "a"), 11 
;;;
;;; * (split-sequence #\; ";oo;bar;ba;" :start 1 :end 9)
;;; -> ("oo" "bar" "b"), 9
;;; ==============================


(in-package #:dbc)

;; (defun split-bag (string-or-null char-or-char-bag)
;;   (mapcar #'(lambda (bag)
;;             (if (null bag) 
;;                 bag
;;                 (mon:string-trim-whitespace bag)))
;;         (remove-if #'mon:string-all-whitespace-p 
;;                    (split-sequence:split-sequence-if #'(lambda (y) (member y char-or-char-bag))
;;                                                      string-or-null
;;                                                      :remove-empty-subseqs t))))
; mon:split-bag
(defun split-bag (string-or-null char-or-char-bag)
  (declare (or (string null) string-or-null)
           (or (character list) char-or-char-bag))
 (labels ((map-trim-whitespace (bag)
             (mapcar #'(lambda (thing)
                         (if (null thing) 
                             thing
                             (mon:string-trim-whitespace thing)))
                     bag))
           (rmv-if (seq) (remove-if #'mon:string-all-whitespace-p  seq))
           (char-or-bag-if (cobi) (if (characterp cobi)
                                      (list cobi)
                                      (if (or (null cobi)
                                              (not (and (listp cobi)
                                                         (every #'characterp cobi))))
                                     (error ":FUNCTION `split-bag', argument CHAR-OR-CHAR-BAG is not a character or list of characters'~%:GOT ~S~%"  cobi)
                                        cobi)))
           (mem-split (y) (member y (char-or-bag-if char-or-char-bag)))
           (split-if (son) (split-sequence:split-sequence-if #'mem-split
                                                             son
                                                             :remove-empty-subseqs t)))
   (if (null string-or-null)
       nil
       (progn
        (unless (stringp string-or-null)
          (error ":FUNCTION `split-bag', argument STRING-OR-NULL does not satisfy `cl:stringp'~%:GOT ~S~%"  string-or-null))
        (map-trim-whitespace (rmv-if (split-if string-or-null)))))))
;; 
(defun field-string-cons (field-str)
  (typecase field-str  
    ((or string array)
     (list (length field-str) (type-of field-str) field-str)) 
    ((and number (not float) (not ratio))
     (list 0 (type-of field-str) field-str))
    (cons
     (list (length field-str) (list (type-of field-str)) field-str))
    (t
     (list 0 (list (type-of field-str)) field-str))))

(defun field-cln-x  (field-string-cons)
  (let ((chk (field-string-cons field-string-cons)))
    (unless (and (= (car chk) 1)
                 ;; (type-of '"bubba") (aref "bubba" 0) 
                 (eq (caadr chk) 'simple-array)
                 (eq (aref (caddr chk) 0) (the character #\x)))
      field-string-cons)))

(defun split-used-fors (used-for-string &key (split-on "|"))
  ;; Is there a reason why we shouldn't be using this instead:
  ;; (declare (type (or null simple-string) used-for-string)) 
  ;; (declare (type string used-for-string))
  (declare (type MON:STRING-OR-NULL used-for-string))
  (if (or (MON:STRING-NULL-OR-EMPTY-P used-for-string)
          (MON:STRING-ALL-WHITESPACE-P used-for-string))
      (values nil used-for-string)
      (flet ((%trimmer (x)
               (declare (string x))
               (string-trim (the (simple-vector 1) #(#\SPACE)) x)))
        (loop 
          with split = (MON:STRING-SPLIT-ON-CHARS used-for-string split-on)
          for x in split 
          for y = (%trimmer x)
          unless (or (null y)
                     (eql (length y) 0)) 
          ;; Do we need to check for #\Newline #\Return? 
          ;; If so maybe use `mon:string-trim-whitespace' here as well.
          ;; :collect (mon:string-trim-whitespace y)
          collect (MON:STRING-TRIM-WHITESPACE y) into rtn
          finally (return (values rtn used-for-string))))))

;; :NOTE This can be adapted if/when we ever split the found_in field to work on
;; the for "^Appeared-in:" fields there as well.
(defun split-appeared-in (appeared-in-string &key (split-on "|"))
  (declare (type MON:STRING-OR-NULL appeared-in-string))
  (if (or (MON:STRING-NULL-OR-EMPTY-P appeared-in-string)
          (MON:STRING-ALL-WHITESPACE-P appeared-in-string))
      (values nil appeared-in-string)
      (loop 
        with split = (MON:STRING-SPLIT-ON-CHARS appeared-in-string split-on)
        for x in split 
        for y = (string-trim (the (simple-vector 1) #(#\SPACE)) x)
        unless (or (null y) (eql (length y) 0)) 
        collect (MON:STRING-TRIM-WHITESPACE y) into rtn
        finally (return (values rtn appeared-in-string)))))

(defun format-entity-role (entity-roles
                           &key 
                           (stream nil)
                           (entity-role-prefix ":ROLE")
                           (prefix-min-pad 14))
  (format stream (mon:make-string* nil "~{~" prefix-min-pad "A~A~^~%~}")
	  (loop
            for roles in entity-roles
            for role = entity-role-prefix
            appending (list role roles) into results
            finally (return results))))

;; :NOTE This is actually a bad idea as the "n 95121069" is canonical...
(defun split-loc-pre (loc-string)
  (declare (MON:STRING-OR-NULL loc-string))
  (if (or (MON:STRING-NULL-OR-EMPTY-P loc-string)
          (MON:STRING-ALL-WHITESPACE-P loc-string))
      (values nil loc-string)
      (values 
       (string-left-trim (the (simple-vector 2) #(#\n #\SPACE)) 
                         (string-right-trim  (the (simple-vector 1) #(#\SPACE))
                                             loc-string))
       loc-string)))


;; :NOTE Don't forget to use `cl:search', `cl:find', etc.!

;; (split-comma-field-if "air, plane, airplane, Biplane,, aircraft, expo, , dirigible,")
;; (split-comma-field-if nil)
;; (split-comma-field "air, plane, airplane, Biplane,, aircraft, expo, , dirigible,")
;; (split-comma-field-if "0 , 0 ," :keep-duplicates t)
(defun split-comma-field-if (comma-string &key (keep-duplicates nil)
                                               (keep-first nil))
  (declare (boolean keep-duplicates keep-first))
  (split-field-on-char-if comma-string
                          (the character #\,)
                          :keep-duplicates keep-duplicates
                          :keep-first keep-first))

(defun split-comma-field (comma-string)
  ;;(split-comma-field-if comma-string)
  (unless ;; (MON:SIMPLE-STRING-NULL-OR-EMPTY-P comma-string)
      (MON:STRING-NULL-OR-EMPTY-P comma-string)
    (loop 
      with split-comma = (MON:STRING-SPLIT-ON-CHARS (the string comma-string)
                                                    (the character #\,))
      for x in split-comma
      for y = (MON:STRING-TRIM-WHITESPACE (the string x))
      unless (or 
              (eql (length y) 0) 
              (notany #'alpha-char-p y))
      collect y)))

(defun split-roles (role-string)
  (declare (type MON:STRING-OR-NULL role-string))
  (if (or (MON:STRING-NULL-OR-EMPTY-P role-string)
          (MON:STRING-ALL-WHITESPACE-P role-string))
      (values nil role-string)
      (loop 
        with split = (MON:STRING-SPLIT-ON-CHARS role-string (the character #\,))
        for x in split 
        for y = (string-left-trim (the (simple-vector 1) #(#\SPACE)) 
                                  (string-right-trim (the (simple-vector 2) #(#\SPACE #\.))
                                                     x))
        unless (eql (length y) 0)
        collect (string-capitalize y) into rtn
        finally (return (values rtn role-string)))))

;; (split-piped-field-if "ref" :known-field-hashtable *xml-refs-match-table*)
;; (split-piped-field-if "ref" :known-field-hashtable *xml-refs-match-table*)
;; => NIL, NULL, "ref", (SIMPLE-ARRAY CHARACTER (3))
;; (split-piped-field-if "ref")
;; => "ref", (SIMPLE-ARRAY CHARACTER (3)), "ref", (SIMPLE-ARRAY CHARACTER (3))
(defun split-piped-field-if (piped-string &key (keep-duplicates nil)
                                               known-field-hashtable)
  (declare (boolean keep-duplicates)
           (MON:HASH-TABLE-OR-SYMBOL known-field-hashtable)
           (optimize (speed 3)))
  (split-field-on-char-if piped-string (the character #\|)
                          :keep-duplicates keep-duplicates 
                          :known-field-hashtable known-field-hashtable))

;; :NOTE has regression test `field-convert-1-0-x-TEST'
;; :NOTE Prefer `field-convert-1-0-x-empty' over `field-convert-1-0-x' which is
;; essentially a helper function.
(declaim (inline field-convert-1-0-x))
(defun field-convert-1-0-x (convert-field) ;
  (declare (optimize (speed 3)))
  (unless (typecase convert-field
            (string t)
            (standard-char t)
            (bit t)
            (symbol t))
    (return-from field-convert-1-0-x convert-field))
  (when (typep convert-field 'MON:STRING-NULL-EMPTY-OR-ALL-WHITESPACE)
    (return-from field-convert-1-0-x nil))
  (let ((convert (if (and (stringp convert-field)
                          (eql (the MON:ARRAY-LENGTH (length convert-field)) 1))
                     (case (char (the (array character (1)) convert-field) 0)
                       (#\1 t)
                       ((#\0  #\x #\X) nil)
                       (t convert-field))
                     convert-field)))
    (typecase convert
      (standard-char (case convert
                       (#\1 t)
                       ((#\0 #\x #\X) nil)
                       ;; Probably not a good idea:
                       ;; (#\t t) 
                       (t convert)))
      (bit (and (eql convert 1)))
      (symbol  (if (eql convert 'x) nil convert))
      (t convert))))

(declaim (inline field-convert-1-0-x-empty-known))
(defun field-convert-1-0-x-empty-known (convert-field known-field-hashtable)
  (declare (hash-table known-field-hashtable)
           (optimize (speed 3)))
  (multiple-value-bind (val type) (field-convert-verify-string convert-field known-field-hashtable)
    ;;(list val type)))
    (if (null val)
        ;;(return-from field-convert-1-0-x-empty-known 
        (values nil 
                ;; type 
                (if (and (stringp type) (string= type convert-field))
                    ;; (if (string= type convert-field)
                    'null               ;nil 
                    ;; convert-field)
                    type)
                ;; type
                convert-field
                (type-of convert-field))
        (let* ((val1 type)
               (rtn (field-convert-1-0-x val))
               (val2 (type-of rtn)))
          (values rtn val2 convert-field val1)))))

;; :NOTE Has regression tests: 
;; field-convert-1-0-x-empty-TEST.0 field-convert-1-0-x-empty-TEST.0
(declaim (inline field-convert-1-0-x-empty))
(defun field-convert-1-0-x-empty (convert-field &key known-field-hashtable)
  (declare 
   (MON:HASH-TABLE-OR-SYMBOL known-field-hashtable)
   (inline field-convert-1-0-x field-convert-1-0-x-empty-known)
   (optimize (speed 3)))
  (when known-field-hashtable
    (let ((ht (MON:HASH-OR-SYMBOL-P known-field-hashtable :w-no-error t)))
      (and ht 
           (return-from field-convert-1-0-x-empty
             (field-convert-1-0-x-empty-known convert-field (the hash-table ht))))))
  (multiple-value-bind (val type) (field-convert-verify-string convert-field)
    (if (null val)
        (return-from field-convert-1-0-x-empty 
          (values nil type convert-field (type-of convert-field)))
        (let* ((val1 type)
               (rtn  (field-convert-1-0-x val))
               (val2 (type-of rtn)))
          (values rtn val2 convert-field val1)))))

(defun field-convert-verify-string (string-field-maybe &optional known-field-hashtable)
  (declare (MON:HASH-TABLE-OR-SYMBOL known-field-hashtable)
           (optimize (speed 3)))
  (when (null string-field-maybe)
    (return-from field-convert-verify-string (values nil 'null)))
  (when (not (stringp string-field-maybe))
    (return-from field-convert-verify-string 
      (values string-field-maybe (type-of string-field-maybe))))
  (locally (declare (MON:STRING-NOT-NULL string-field-maybe))
    (when (mon:string-empty-p string-field-maybe)
      (return-from field-convert-verify-string 
        (values nil 'mon:string-empty)))
    (when (MON:STRING-ALL-WHITESPACE-P string-field-maybe)
      (return-from field-convert-verify-string 
        (values nil 'mon:string-all-whitespace)))
    (when known-field-hashtable
      (let ((ht (MON:HASH-OR-SYMBOL-P known-field-hashtable :w-no-error t)))
        (and ht (gethash string-field-maybe ht)
             ;; :NOTE It would be nice to indicate that nil was returned
             ;; b/c it was in the the hash-table known-field-hashtable
             (return-from field-convert-verify-string 
               (values nil string-field-maybe)))))
    (values string-field-maybe (type-of string-field-maybe))))

(let ((edit-timestamp-regex 
        (CL-PPCRE:CREATE-SCANNER "^([0-9]{4})-([0-9]{2})-([0-9]{2}) ([0-9]{2}):([0-9]{2}):([0-9]{2})$")))
  (defun field-convert-edit-timestamp (maybe-timestamp)
    (multiple-value-bind (maybe-string of-type) (field-convert-verify-string maybe-timestamp)
      (cond ((null maybe-string) 
             (values nil nil nil of-type))
            ((stringp maybe-string)
             (if (string= maybe-string "0000-00-00 00:00:00")
                 (values nil nil nil maybe-string)
                 (multiple-value-bind (matched values) (CL-PPCRE:SCAN-TO-STRINGS edit-timestamp-regex maybe-string)
                   (unless matched (error "Can't parse ~s as a timestamp" maybe-string))
                   (let* ((encoded
                            (encode-universal-time  (parse-integer (aref values 5))
                                                    (parse-integer (aref values 4))
                                                    (parse-integer (aref values 3))
                                                    (parse-integer (aref values 2))
                                                    (parse-integer (aref values 1))
                                                    (parse-integer (aref values 0))))
                          (lt-timestamp (local-time:universal-to-timestamp encoded))
                          (lt-timestamp-string (princ-to-string lt-timestamp)))
                     (values 
                      lt-timestamp-string
                      lt-timestamp
                      encoded
                      maybe-string)))))))))

(defun field-convert-edit-timestamp-origin-14 (maybe-valid-time-string &key (hour-offset 0))
  (if (and (stringp maybe-valid-time-string) 
           (eql (length maybe-valid-time-string) 14)
           (every #'digit-char-p maybe-valid-time-string))
      (labels ((pi-subseq (start end range-expected);(args)
                 (declare ((unsigned-byte 4) start end))
                 (let ((expect-len (- end start)))
                   (multiple-value-bind (parsed-int parsed-len) (parse-integer 
                                                                 (subseq maybe-valid-time-string start end)
                                                                 :junk-allowed t)
                     (and (eql expect-len parsed-len)
                          (typep parsed-int range-expected)
                          parsed-int))))
               (pi-subseq-apply (args)
                 (apply #'pi-subseq args))
               (pi-all-subseqs ()
                 (let* ((pi-subseq-applied
                          (map 'list #'pi-subseq-apply
                               `((12 14 (integer 0 60)) ; second
                                 (10 12 (integer 0 60)) ; minute
                                 (8 10  (integer 0 24)) ; hour
                                 (6 8   (integer 1 31)) ; day 
                                 (4 6   (integer 1 13)) ; month
                                 (0 4   (integer 2004   ; year between 2004 and current-year
                                                 ,(1+ (nth-value 5 (get-decoded-time)))))))) 
                        (maybe-encoded-pi 
                          (and (notany #'null pi-subseq-applied)
                               ;; allow for manually fixing a weird off by N
                               ;; errors in the hour field due to poor timezone
                               ;; conversions occuring prior.
                               (or (and hour-offset 
                                        (incf (elt pi-subseq-applied 2) hour-offset))
                                   t)
                               ;; account for a timezone offset
                               ;; (apply #'encode-universal-time `(,@pi-subseq-applied 4)))
                               (apply #'encode-universal-time pi-subseq-applied)))
                        (lt-timestamp (and maybe-encoded-pi
                                           (LOCAL-TIME:UNIVERSAL-TO-TIMESTAMP maybe-encoded-pi)))
                        (lt-timestamp-string (and lt-timestamp (princ-to-string lt-timestamp))))
                   (values 
                    lt-timestamp-string         ; local-time as string
                    lt-timestamp                ; local-time object
                    maybe-encoded-pi            ; universal-time
                    maybe-valid-time-string)))) ; the timestring unparsed
        (pi-all-subseqs))
      (values nil nil nil maybe-valid-time-string)))

;; (defun %field-convert-timestamp-edit-timestamp-origin ()

(declaim (inline field-convert-remove-duplicates))
(defun field-convert-remove-duplicates (string-list-maybe)
  (declare (optimize (speed 3)))
  (when (null string-list-maybe)
    (return-from field-convert-remove-duplicates
      (values nil 'null)))
  (unless (listp string-list-maybe)
    (return-from field-convert-remove-duplicates
      (values string-list-maybe (type-of string-list-maybe))))
  (unless (MON:EACH-A-STRING-OR-NULL-P string-list-maybe)
    (return-from field-convert-remove-duplicates
      (values string-list-maybe (type-of string-list-maybe))))
  (let ((str-lst-trans 
          (remove-if #'MON:STRING-NULL-EMPTY-OR-ALL-WHITESPACE-P string-list-maybe)))
    (when (null str-lst-trans)
      (return-from field-convert-remove-duplicates 
        (values nil string-list-maybe)))
    (locally (declare (MON:EACH-A-STRING str-lst-trans))
      (values 
       (delete-duplicates str-lst-trans :test #'string= :from-end t) 
       ;; (remove-duplicates str-lst-trans :test #'string=) 
       string-list-maybe))))
 
;;; ==============================
;;
;; `split-field-on-char-if'
;;  `-> `field-convert-1-0-x-empty'
;;     `-> `field-convert-verify-string'
;; (split-field-on-char-if #\1 #\1)
;; (split-field-on-char-if "1" #\1)
;; (split-field-on-char-if "" #\1)
;; (split-field-on-char-if "ref" #\1 :known-field-hashtable *xml-refs-match-table*)
;; (split-field-on-char-if "x" #\1 :known-field-hashtable *xml-refs-match-table*)
;; (split-field-on-char-if "1" #\1 :known-field-hashtable *xml-refs-match-table*)
;; (split-field-on-char-if "0," #\, :known-field-hashtable *xml-refs-match-table*)
;; (split-field-on-char-if " ," #\, :known-field-hashtable *xml-refs-match-table*)
;; (split-field-on-char-if " , " #\, :known-field-hashtable *xml-refs-match-table*)
;; (split-field-on-char-if " , " #\, :keep-first t :known-field-hashtable *xml-refs-match-table*)
;; (split-field-on-char-if "ref , " #\, :known-field-hashtable *xml-refs-match-table*)
;; (split-piped-field-if (field-convert-1-0-x-empty "1"))
;; (split-piped-field-if (field-convert-1-0-x-empty (field-convert-verify-string #\x)))
;; (split-piped-field-if (field-convert-1-0-x-empty "x"));; 
;; 
;; :NOTE has regression tests:
;; split-field-on-char-if-TEST.0 split-field-on-char-if-TEST.1
;; split-field-on-char-if-TEST.2 split-field-on-char-if-TEST.3
(defun split-field-on-char-if (split-string char &key (keep-duplicates nil)
                                                      (keep-first nil)
                                                      known-field-hashtable)
  (declare (character char)
           (boolean keep-duplicates keep-first)
           (MON:HASH-TABLE-OR-SYMBOL known-field-hashtable)
           (inline MON:WHITESPACE-CHAR-P 
                   field-convert-1-0-x-empty)
           (optimize (speed 3)))
  (multiple-value-bind (v1 t1 v2 t2) (field-convert-1-0-x-empty split-string 
                                                                :known-field-hashtable known-field-hashtable)
    (if (or 
         (null v1) 
         (not (stringp v1))
         (notany #'(lambda (x) (char= char x)) (the string v1)))
        (return-from split-field-on-char-if (values v1 t1 v2 t2))
        ;; :NOTE The local var SIMPLE is only b/c its type can be declared simple-string
        (let ((simple (copy-seq (the MON:STRING-NOT-NULL-OR-EMPTY v1))))
          (declare (simple-string simple))
          (if (position char simple)
              (if (string= simple (make-string 1 :initial-element char))
                  (if keep-first 
                      ;; :NOTE We don't return this: 
                      ;;  (values simple (type-of simple) v2 t2)
                      ;; b/c we haven't modified simple yet, nothing has changed
                      ;; so v1 and t1 are still valid.
                      (values v1 t1 v2 t2)
                      (values nil 'standard-char v2 t2))
                  (if (and keep-first
                           (every #'(lambda (c) 
                                      (declare (character c))
                                      (or (MON:WHITESPACE-CHAR-P  c)
                                          (char= c char)))
                                  simple))
                      (values 
                       (setf simple (MON:STRING-TRIM-WHITESPACE simple))
                       (type-of simple)
                       v2
                       t2)
                      (loop 
                        with split = (MON:STRING-SPLIT-ON-CHARS simple (make-string 1 :initial-element char))
                        for x simple-string in split ;; each elt of mon:string-split-on-chars is from a copy-seq.
                        for y simple-string = (MON:STRING-TRIM-WHITESPACE x)
                        ;; unless (eql (the mon:array-length (length (the simple-string y))) 0)
                        unless (zerop (the MON:ARRAY-LENGTH (length y)))
                        collect y into rtn
                        ;; :WAS
                        ;; finally (if keep-duplicates
                        ;;             (values rtn (type-of rtn) v1 t1) ;; v1 t1))
                        ;;             (progn 
                        ;;               (setf rtn (field-convert-remove-duplicates rtn))
                        ;;               (return (values rtn (type-of rtn) v1 t1))))))))))))
                        finally (return (if keep-duplicates
                                            (values rtn (type-of rtn) v1 t1) ;; v1 t1))
                                            (progn 
                                              (setf rtn (field-convert-remove-duplicates rtn))
                                              (values rtn (type-of rtn) v1 t1))))))))))))

(declaim (inline %field-name-underscore-to-dash-if))
(defun %field-name-underscore-to-dash-if (field-name)
  (declare ((or null string) field-name)
           (optimize (speed 3)))
  (when (or (MON:STRING-NULL-EMPTY-OR-ALL-WHITESPACE-P field-name)
            (and (= (length field-name) 1)
                 (char= (char field-name 0) (the character #\_)))) 
    (return-from %field-name-underscore-to-dash-if (values nil field-name)))
  (locally (declare (MON:STRING-NOT-NULL-OR-EMPTY field-name))
    (let ((trim-field (the simple-string (MON:STRING-TRIM-WHITESPACE (copy-seq field-name)))))
      (declare (simple-string trim-field))
      (when (and (= (length trim-field) 1)
                 (char= (schar trim-field 0) (the character #\_)))
        (return-from %field-name-underscore-to-dash-if (values nil field-name)))
      (locally 
          (declare (MON:SIMPLE-STRING-NOT-EMPTY trim-field))
        (setf trim-field (string-trim 
                          (the (simple-vector 1)  #(#\-))
                          (the simple-string (nsubstitute #\- #\_ (string-upcase trim-field)))))
        (values trim-field field-name)))))

;; (%field-name-underscore-to-dash-if "_bubba_bobby__")
;; (type-of  #(#\_)) '(simple-array character ))

(defun field-name-underscore-to-dash (field-name &optional w-colon)
  (declare (string field-name)
           (boolean w-colon)
           (inline %field-name-underscore-to-dash-if)
           (optimize (speed 3)))
  (let ((no-under (%field-name-underscore-to-dash-if field-name)))
    (declare ((or null simple-string) no-under))
    (when (or (null no-under)
              (MON:STRING-EMPTY-P no-under))
      (return-from field-name-underscore-to-dash (values nil no-under field-name)))
    (locally (declare (MON:SIMPLE-STRING-NOT-EMPTY no-under))
      (or (and w-colon 
               (concatenate 'string (make-string 1 :initial-element #\:) no-under))
          no-under))))
;; 
;; (field-name-underscore-to-dash "_")
;; (%field-name-underscore-to-dash-if "__")

(defun field-name-convert-field-name (field-name field-value)
  (declare (string field-name))
  (when (MON:STRING-NULL-OR-EMPTY-P field-value) 
    (return-from field-name-convert-field-name))
  (when (not (stringp field-value)) 
    (return-from field-name-convert-field-name field-value))
  (if (string-equal field-name (MON:STRING-TRIM-WHITESPACE field-value))
      nil
      field-value))

;; :NOTE use `field-convert-verify-string' instead.
(defun field-convert-empty-string-nil (empty-field &key w-no-error)
  (if (MON:STRING-NULL-OR-EMPTY-P empty-field)
      nil
      (if (stringp empty-field)
          empty-field
          (if w-no-error
              (values empty-field (type-of empty-field))
              (MON:SIMPLE-ERROR-MON :w-sym 'field-convert-empty-string-nil
                                    :w-type 'function
                                    :w-spec "Arg EMPTY-FIELD not `cl:stringp'"
                                    :w-got  empty-field
                                    :w-type-of t
                                    :signal-or-only nil)))))

;; (field-convert-image-name-and-type ;; jpg | png | gif | tiff | bmp | nef

;;; ==============================
;; artist lifespan-date

;; :NOTE Is this the desired behavior?
;; (split-date-range "-1840--")
;; => ("?" . "1840?")
(defun split-date-range (lifespan-str)
  (declare (type MON:STRING-OR-NULL lifespan-str))
  (or (and (or (null lifespan-str)
	       (eql (length lifespan-str) 0))
	   (cons nil nil))
      (let ((frob lifespan-str)
            (concat-char #\-)
            (question-char #\?))
        (declare (character concat-char question-char))
	(setf frob (MON:STRING-TRIM-WHITESPACE frob))
	(when (char= (char frob 0) concat-char)
	  (setf frob (MON:CONCAT question-char  frob)))
	(when (char= (char frob (1- (length frob))) concat-char)
	  (setf frob (MON:CONCAT frob question-char)))
	(or (and (> (length frob) 0)
		 (setf frob (mapcar #'MON:STRING-TRIM-WHITESPACE
				    (MON:STRING-SPLIT-ON-CHARS frob concat-char))))
	    (setf frob (cons nil nil)))
	(if (and (null (car frob))
		 (null (cdr frob)))
	    frob
	    (or (and (eql (length frob) 1) frob)
                (and (eql (length frob) 2)
		     (stringp (car frob))
		     (stringp (cadr frob))
		     (setf frob (cons (car frob) (cadr frob))))
		(and (> (length frob) 2)
		     (stringp (car frob))
		     (setf frob (cons (car frob)
				      (apply #'concatenate 'string (cdr frob)))))
		frob)))))

(defun split-date-range-string-int-pairs (lifespan-str-pair)
  (declare (type (cons MON:STRING-OR-NULL MON:STRING-OR-NULL)
		 lifespan-str-pair)
	   ;; (optimize (speed 3) (safety 1) (space 0) (compilation-speed 0))
	   )
  (let ((cons-str lifespan-str-pair)
	(chk-digit (cons nil nil))
        (question-char #\?)
        (zero-char #\0))
    (declare (character question-char zero-char))
    (and (stringp (car cons-str))
	 (stringp (cdr cons-str))
	 (setf chk-digit
	       (list (or 
                      (and (loop 
                             for chars across (the string (car cons-str))
                             always (digit-char-p chars))
                           (not (or 
                                 (and (loop 
                                        for chars across (the string (car cons-str)) 
                                        always (char= chars zero-char))
                                      (setf (car chk-digit) question-char))
                                 (and (not (eql (length (car cons-str)) 4))
                                      (setf (car chk-digit) question-char)))))
                      (car chk-digit)
                      (and (loop 
                             for chars across (the string (car cons-str)) 
                             thereis (char= chars question-char))
                           question-char)
                      (car chk-digit))
		     (or 
                      (and (loop 
                             for chars across (the string (cdr cons-str)) 
                             always (digit-char-p chars))
                           (not (or 
                                 (and (loop 
                                        for chars across (the string (cdr cons-str)) 
                                        always (char= chars zero-char))
                                      (setf (cdr chk-digit) question-char))
                                 (and (not (eql (length (cdr cons-str)) 4))
                                      (setf (cdr chk-digit) question-char)))))
                      (cdr chk-digit)
                      (and (loop 
                             for chars across (the string (cdr cons-str)) 
                             thereis (char= chars question-char))
                           question-char)
                      (cdr chk-digit)))))

    (and (car chk-digit)
         (not (characterp (car chk-digit)))
	 ;; By now there shouldn't be any way we are parsing a negative string, e.g. "-1843"
	 (setf (car chk-digit) (multiple-value-list (parse-integer (car cons-str))))
	 ;; And, we're only looking for entities in existing beyond the Middle Ages :)
	 ;; This check prob. isn't required any longer now that we are looking for only strings of length 4
         (eql (cadar chk-digit) 4)             
	 (setf (car chk-digit) (caar chk-digit)))

    (and (cadr chk-digit)
	 (not (characterp (cadr chk-digit)))
	 (setf (cadr chk-digit) (multiple-value-list (parse-integer (cdr cons-str))))
	 (eql (cadadr chk-digit) 4)
	 (setf (cadr chk-digit) (caadr chk-digit)))
    
    (setf chk-digit (cons (car chk-digit) (cadr chk-digit)))
    
    (or (and (integerp (car chk-digit)) 
	     (integerp (cdr chk-digit)))
	;; `chk-digit` is a cons of the form: (#\? . #\?)
	(and (characterp (car chk-digit)) 
	     (characterp (cdr chk-digit))
	     (setf chk-digit (cons nil nil)))
	(and  (integerp (car chk-digit))
	      ;; Don't bother checking if its #\? 
	      ;; (and (characterp (cdr chk-digit)) (char= #\? (cdr chk-digit))
	      (characterp (cdr chk-digit))
	      (setf (cdr chk-digit) (lognot (car chk-digit))))
	(and (integerp (cdr chk-digit)) (characterp (car chk-digit))
	     (setf (car chk-digit) -1))
	;; Whatever is left... should be: (nil)-ish :)
	)
    (setf cons-str (list cons-str chk-digit))))

;;; ==============================
;; :TODO finish or delete.
(defun field-convert-preprocess-field (string-field-maybe)
  (if (stringp string-field-maybe)
      (let ((match (copy-seq string-field-maybe)))
        (setf match
              (STRING-CASE:STRING-CASE (match :default match)
                ("bubba"       (print "found bubba" *standard-output*))
                ("match-field" (string-upcase match))))
        (values match string-field-maybe (type-of match)))
      (values string-field-maybe nil (type-of string-field-maybe))))

(fundoc 'field-convert-preprocess-field
"Preprocess STRING-FIELD-MAYBE if it matches a `string-case:string-case' case form.
If STRING-FIELD-MAYBE is `cl:stringp' and matches apply the case body form to STRING-FIELD-MAYBE.
If STRING-FIELD-MAYBE is not `cl:stringp' return it.~%~@
Return three values as if by `cl:values'. Returned values will have one of the
following formats:~%~@
 <PROCESSED-STRING>, STRING-FIELD-MAYBE, <TYPE-OF-PROCESSED-STRING>
 STRING-FIELD-MAYBE, NIL, <TYPE-OF-STRING-FIELD-MAYBE>
If STRING-FIELD-MAYBE is `cl:stringp' nth-value 0 is the p
:EXAMPLE~%
 \(field-convert-preprocess-field \"match-field\"\)
 \(field-convert-preprocess-field \"bubba\"\)
 \(field-convert-preprocess-field \"\"\)
 \(field-convert-preprocess-field 8\)
 \(field-convert-preprocess-field '\(\"\" \"bubba\"\)\)
:SEE-ALSO `<XREF>'.~%▶▶▶")

;; (field-convert-preprocess-field "match-field")
;; => "MATCH-FIELD", "match-field", (SIMPLE-ARRAY CHARACTER (11))

;; (field-convert-preprocess-field "bubba")
;; => "found bubba" "found bubba", "bubba", (SIMPLE-ARRAY CHARACTER (11))

;; (field-convert-preprocess-field "")
;; "", "", (SIMPLE-ARRAY CHARACTER (0))

;; (field-convert-preprocess-field 8)
;; => 8, NIL, (INTEGER 0 536870911)

;; (field-convert-preprocess-field '("" "bubba"))
;; => ("" "bubba"), NIL, CONS

;; I'd like the macro form to allow to this:
;; (tt--field-convert-preprocess-field  "match-field" s
;;    ("bubba"       (format nil "found ~S" s)) 
;;    ("match-field" (string-upcase s)))

;; (defmacro tt--field-convert-preprocess-field (string-field-maybe var &rest cases)
;;   (MON:WITH-GENSYMS (match extent-var)
;;     `(if (stringp ,string-field-maybe)
;;          (let ((,match (copy-seq ,string-field-maybe))
;;                (,extent-var ,var))
;;            (setf ,extent-var ,match)
;;            (setf ,extent-var
;;                  (string-case:string-case (,match :default ,match)


;;                    `(,@`(mapcar #'macroexpand ,,cases))))
;;            ;;(values ,match ,string-field-maybe (type-of ,match)))
;;            (values ,extent-var ,string-field-maybe (type-of ,extent-var)))
;;          (values ,string-field-maybe nil (type-of ,string-field-maybe)))))

;; (print "found bubba" *standard-output*)) 

;; (tt--field-convert-preprocess-field  "match-field" s
;;                                      ("bubba"       (format nil "found ~S" s)
;;                                                     (format nil "still formatting ~" s)) 
;;                                      ("match-field" (string-upcase s)))


;; (tt--field-convert-preprocess-field 8
;;                                     ("bubba"       (print "found bubba" *standard-output*))
;;                                     ("match-field" (string-upcase match)))



;;; ==============================
;; :TODO
;; (defun dbc-split-ref-multi-naf (naf-multi-ref)
;; Split the simple-string NAF-MULTI-REF on #\& and elide surrounding whitespace for each element.
;; 

;;; ==============================
;; :TODO
;; (defun field-convert-to-keyword (field-keyword-pairs &optional key-prefix)
;; FIELD-KEYWORD-PAIRS a list conses each car is a dbc field name cdr is the
;; keyword to translate to as if by `assoc'
;; When KEY-PREFIX is non-nil it is a simple-string to prefix to each generated keyword.
;;
;; ("title" .   "item-title") => :item-title
;; ("ref"   .   "item-ref")   => :item-ref
;; With KEY-PREFIX "item"
;;
;; ("title" .   "title") => :item-title
;; ("ref"   .   "ref")   => :item-title
;;
;; (assoc "title" '(("title" . "item-title")) :test #'string=) ;; Use `string=' for case sensitivity.

;; alexandria:
;; alexandria:make-keyword
;;; ==============================


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:


;;; ==============================
;;; EOF
