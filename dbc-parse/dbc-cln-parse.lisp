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
;; *package

       
(defun field-string-cons (field-str)
  (typecase field-str  
    ((or string array)
     (list (length field-str) (type-of field-str) field-str)) 
    ((and number (not float) (not ratio))
     (list 0 (type-of field-str) field-str))
    (cons
     (list (length field-str) (list (type-of field-str)) field-str))
    (t             (list 0 (list (type-of field-str)) field-str))))

(defun field-cln-x  (field-string-cons)
  (let ((chk (field-string-cons field-string-cons)))
    (unless (and (= (car chk) 1)
                 ;; (type-of '"bubba") (aref "bubba" 0) 
                 (eq (caadr chk) 'simple-array)
                 (eq (aref (caddr chk) 0) #\x))
      field-string-cons)))

(defun split-used-fors (used-for-string)
  ;; Is there a reason why we shouldn't be using this instead:
  ;; (declare (type (or null simple-string) used-for-string)) 
  ;; (declare (type string used-for-string))
  (declare (type mon:string-or-null used-for-string))
  (when (or (mon:string-null-or-empty-p used-for-string)
            (mon:string-all-whitespace-p used-for-string))
    (return-from split-used-fors (values nil used-for-string)))
  (loop 
     :with split = (mon:string-split-on-chars used-for-string "|")
     :for x in split 
     :for y = (string-trim " " x)
     :unless (or (null y) (eql (length y) 0)) 
     ;; Do we need to check for #\Newline #\Return? 
     ;; If so maybe use `mon:string-trim-whitespace' here as well.
     ;; :collect (mon:string-trim-whitespace y)
     :collect (mon:string-trim-whitespace y) into rtn
     :finally (return (values rtn used-for-string))))

;;mon:string-
;; :NOTE This can be adapted if/when we ever split the found_in field to work on
;; the for "^Appeared-in:" fields there as well.
(defun split-appeared-in (appeared-in-string)
  (declare (type mon:string-or-null appeared-in-string))
  (when (or (mon:string-null-or-empty-p appeared-in-string)
            (mon:string-all-whitespace-p appeared-in-string))
    (return-from split-appeared-in (values nil appeared-in-string)))
  (loop 
     :with split = (mon:string-split-on-chars appeared-in-string "|")
     :for x in split 
     :for y = (string-trim " " x)
     :unless (or (null y) (eql (length y) 0)) 
     :collect (mon:string-trim-whitespace y) into rtn
     :finally (return (values rtn appeared-in-string))))

(defun format-entity-role (entity-roles
                               &key 
                               (stream nil)
                               (entity-role-prefix ":ROLE")
                               (prefix-min-pad 14))
  (format stream (mon:make-string* nil "~{~" prefix-min-pad "A~A~^~%~}")
	  (loop
	     :for roles :in entity-roles
	     :for role = entity-role-prefix
	     :appending (list role roles) :into results
	     :finally (return results))))

;; :NOTE This is actually a bad idea as the "n 95121069" is canonical...
(defun split-loc-pre (loc-string)
  (declare (mon:string-or-null loc-string))
  (when (or (mon:string-null-or-empty-p loc-string)
            (mon:string-all-whitespace-p loc-string))
    (return-from split-loc-pre (values nil loc-string)))
  (values 
   (string-left-trim "n " (string-right-trim  " " loc-string))
   loc-string))


;; :NOTE Don't for get to use `cl:search', `cl:find', etc.!
;;; ==============================
(defun split-comma-field-if (comma-string &key keep-duplicates keep-first)
  (split-field-on-char-if comma-string #\, :keep-duplicates keep-duplicates :keep-first keep-first))

;; (split-comma-field-if "air, plane, airplane, Biplane,, aircraft, expo, , dirigible,")
;; (split-comma-field-if nil)

(defun split-comma-field (comma-string)
  ;;(split-comma-field-if comma-string)
  (unless ;; (mon:simple-string-null-or-empty-p comma-string)
      (mon:string-null-or-empty-p comma-string)
    (loop 
       :with split-comma = (mon:string-split-on-chars (the string comma-string) ",")
       :for x :in split-comma
       :for y = (mon:string-trim-whitespace (the string x))
       :unless (or 
                (eql (length y) 0) 
                (notany #'alpha-char-p y))
       :collect y)))

(defun split-roles (role-string)
  (declare (type mon:string-or-null role-string))
  (when (or (mon:string-null-or-empty-p role-string)
            (mon:string-all-whitespace-p role-string))
    (return-from split-roles (values nil role-string)))
  (loop 
     :with split = (mon:string-split-on-chars role-string ",")
     :for x in split 
     :for y = (string-left-trim " " (string-right-trim  " ." x))
     :unless (eql (length y) 0)
     :collect (string-capitalize y) into rtn
     :finally (return (values rtn role-string))))

(defun split-piped-field-if (piped-string &key keep-duplicates
                                               known-field-hashtable)
  (declare (mon:hash-table-or-symbol known-field-hashtable)
           (optimize (speed 3)))
  (split-field-on-char-if piped-string #\| 
                          :keep-duplicates keep-duplicates 
                          :known-field-hashtable known-field-hashtable))

;; (split-piped-field-if "ref" :known-field-hashtable *xml-refs-match-table*)
;; (split-piped-field-if "ref" :known-field-hashtable *xml-refs-match-table*)
;; => NIL, NULL, "ref", (SIMPLE-ARRAY CHARACTER (3))
;; (split-piped-field-if "ref")
;; => "ref", (SIMPLE-ARRAY CHARACTER (3)), "ref", (SIMPLE-ARRAY CHARACTER (3))


;; :NOTE has regression test `field-convert-1-0-x-TEST'
;; :NOTE Prefer `field-convert-1-0-x-empty' over `field-convert-1-0-x' which is
;; essentially a helper function.
(declaim (inline field-convert-1-0-x))
(defun field-convert-1-0-x (convert-field)
  (declare (optimize (speed 3)))
  (unless (typecase convert-field
            (string t)
            (standard-char t)
            (bit t)
            (symbol t))
    (return-from field-convert-1-0-x convert-field))
  (when (typep convert-field 'mon:string-null-empty-or-all-whitespace)
    (return-from field-convert-1-0-x nil))
  (let ((convert (if (and (stringp convert-field)
                          (eql (the mon:array-length (length convert-field)) 1))
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
   (mon:hash-table-or-symbol known-field-hashtable)
   (inline field-convert-1-0-x field-convert-1-0-x-empty-known)
   (optimize (speed 3)))
  (when known-field-hashtable
    (let ((ht (mon:hash-or-symbol-p known-field-hashtable :w-no-error t)))
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
  (declare (mon:hash-table-or-symbol known-field-hashtable)
           (optimize (speed 3)))
  (when (null string-field-maybe)
    (return-from field-convert-verify-string (values nil 'null)))
  (when (not (stringp string-field-maybe))
    (return-from field-convert-verify-string 
      (values string-field-maybe (type-of string-field-maybe))))
  (locally (declare (mon:string-not-null string-field-maybe))
    (when (mon:string-empty-p string-field-maybe)
      (return-from field-convert-verify-string 
        (values nil 'mon:string-empty)))
    (when (mon:string-all-whitespace-p string-field-maybe)
      (return-from field-convert-verify-string 
        (values nil 'mon:string-all-whitespace)))
    (when known-field-hashtable
      (let ((ht (mon:hash-or-symbol-p known-field-hashtable :w-no-error t)))
        (and ht (gethash string-field-maybe ht)
             ;; :NOTE It would be nice to indicate that nil was returned
             ;; b/c it was in the the hash-table known-field-hashtable
             (return-from field-convert-verify-string 
               (values nil string-field-maybe)))))
    (values string-field-maybe (type-of string-field-maybe))))

(declaim (inline field-convert-remove-duplicates))
(defun field-convert-remove-duplicates (string-list-maybe)
  (declare (optimize (speed 3)))
  (when (null string-list-maybe)
    (return-from field-convert-remove-duplicates
      (values nil 'null)))
  (unless (listp string-list-maybe)
    (return-from field-convert-remove-duplicates
      (values string-list-maybe (type-of string-list-maybe))))
  (unless (mon:each-a-string-or-null-p string-list-maybe)
    (return-from field-convert-remove-duplicates
      (values string-list-maybe (type-of string-list-maybe))))
  (let ((str-lst-trans 
         (remove-if #'mon:string-null-empty-or-all-whitespace-p string-list-maybe)))
    (when (null str-lst-trans)
      (return-from field-convert-remove-duplicates 
        (values nil string-list-maybe)))
    (locally (declare (mon:each-a-string str-lst-trans))
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
(defun split-field-on-char-if (split-string char &key keep-duplicates
                               keep-first
                               known-field-hashtable)
  (declare (character char)
           (mon:hash-table-or-symbol known-field-hashtable)
           (inline mon:whitespace-char-p 
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
        (let ((simple (copy-seq (the mon:string-not-null-or-empty v1))))
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
                                      (or (mon:whitespace-char-p  c)
                                          (char= c char)))
                                  simple))
                      (values 
                       (setf simple (mon:string-trim-whitespace simple))
                       (type-of simple)
                       v2
                       t2)
                      (loop 
                         :with split = (mon:string-split-on-chars simple (make-string 1 :initial-element char))
                         :for x simple-string in split ;; each elt of mon:string-split-on-chars is from a copy-seq.
                         :for y simple-string = (mon:string-trim-whitespace x)
                         ;; :unless (eql (the mon:array-length (length (the simple-string y))) 0)
                         :unless (zerop (the mon:array-length (length y)))
                         :collect y :into rtn
                         :finally (if keep-duplicates
                                      (return (values rtn (type-of rtn) v1 t1)) ;; v1 t1))
                                      (progn 
                                        (setf rtn (field-convert-remove-duplicates rtn))
                                        (return (values rtn (type-of rtn) v1 t1))))))))))))

(declaim (inline %field-name-underscore-to-dash-if))
(defun %field-name-underscore-to-dash-if (field-name)
  (declare ((or null string) field-name)
           (optimize (speed 3)))
  (when (or (mon:string-null-empty-or-all-whitespace-p field-name)
            (and (= (length field-name) 1)
                 (char= (char field-name 0) #\_))) 
    (return-from %field-name-underscore-to-dash-if (values nil field-name)))
  (locally (declare (mon:string-not-null-or-empty field-name))
    (let ((trim-field (the simple-string (mon:string-trim-whitespace (copy-seq field-name)))))
      (declare (simple-string trim-field))
      (when (and (= (length trim-field) 1)
                 (char= (schar trim-field 0) #\_))
        (return-from %field-name-underscore-to-dash-if (values nil field-name)))
      (locally 
          (declare (mon:simple-string-not-empty trim-field))
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
              (mon:string-empty-p no-under))
      (return-from field-name-underscore-to-dash (values nil no-under field-name)))
    (locally (declare (mon:simple-string-not-empty no-under))
      (or (and w-colon 
               (concatenate 'string (make-string 1 :initial-element #\:) no-under))
          no-under))))
;; 
;; (field-name-underscore-to-dash "_")
;; (%field-name-underscore-to-dash-if "__")

(defun field-name-convert-field-name (field-name field-value)
  (declare (string field-name))
  (when (mon:string-null-or-empty-p field-value) 
    (return-from field-name-convert-field-name))
  (when (not (stringp field-value)) 
    (return-from field-name-convert-field-name field-value))
  (if (string-equal field-name (mon:string-trim-whitespace field-value))
      nil
      field-value))

;; :NOTE use `field-convert-verify-string' instead.
(defun field-convert-empty-string-nil (empty-field &key w-no-error)
  (if (mon:string-null-or-empty-p empty-field)
      nil
      (if (stringp empty-field)
          empty-field
          (if w-no-error
              (values empty-field (type-of empty-field))
              (mon:simple-error-mon :w-sym 'field-convert-empty-string-nil
                                    :w-type 'function
                                    :w-spec "Arg EMPTY-FIELD not `cl:stringp'"
                                    :w-got  empty-field
                                    :w-type-of t
                                    :signal-or-only nil)))))

;; (field-convert-image-name-and-type ;; jpg | png | gif | tiff | bmp | nef

;;; ==============================
;; artist lifespan-date
;; 
(defun split-lifespan (lifespan-str)
  (declare (type mon:string-or-null lifespan-str))
  (or (and (or (null lifespan-str)
	       (eql (length lifespan-str) 0))
	   (cons nil nil))
      (let ((frob lifespan-str))
	(setf frob (mon:string-trim-whitespace frob))
	(when (char=  #\- (char frob 0))
	  (setf frob (mon:concat "?"  frob)))
	(when (char= #\- (char frob (1- (length frob))))
	  (setf frob (mon:concat frob "?")))
	(or (and (> (length frob) 0)
		 (setf frob (mapcar #'mon:string-trim-whitespace
				    (mon:string-split-on-chars frob "-"))))	    
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

(defun split-lifespan-string-int-pairs (lifespan-str-pair)
  (declare (type (cons mon:string-or-null mon:string-or-null)
		 lifespan-str-pair)
	   ;; (optimize (speed 3) (safety 1) (space 0) (compilation-speed 0))
	   )
  (let ((cons-str lifespan-str-pair)
	(chk-digit (cons nil nil)))
    (and (stringp (car cons-str))
	 (stringp (cdr cons-str))
	 (setf chk-digit
	       (list (or 
                      (and (loop 
                              :for chars :across (the string (car cons-str))
                              :always (digit-char-p chars))
                           (not (or 
                                 (and (loop 
                                         :for chars :across (the string (car cons-str)) 
                                         :always (char= #\0 chars))
                                      (setf (car chk-digit) #\?))
                                 (and (not (eql (length (car cons-str)) 4))
                                      (setf (car chk-digit) #\?)))))
                      (car chk-digit)
                      (and (loop 
                              :for chars :across (the string (car cons-str)) 
                              :thereis (char= #\? chars))
                           #\?)
                      (car chk-digit))
		     (or 
                      (and (loop 
                              :for chars :across (the string (cdr cons-str)) 
                              :always (digit-char-p chars))
                           (not (or 
                                 (and (loop 
                                         :for chars :across (the string (cdr cons-str)) 
                                         :always (char= #\0 chars))
                                      (setf (cdr chk-digit) #\?))
                                 (and (not (eql (length (cdr cons-str)) 4))
                                      (setf (cdr chk-digit) #\?)))))
                      (cdr chk-digit)
                      (and (loop 
                              :for chars :across (the string (cdr cons-str)) 
                              :thereis (char= #\? chars))
                           #\?)
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
(defun field-convert-preprocess-field (string-field-maybe)
  (if (stringp string-field-maybe)
      (let ((match (copy-seq string-field-maybe)))
        (setf match
              (string-case:string-case (match :default match)
                ("bubba"       (print "found bubba" *standard-output*))
                ("match-field" (string-upcase match))))
        (values match string-field-maybe (type-of match)))
      (values string-field-maybe nil (type-of string-field-maybe))))

(fundoc 'field-convert-preprocess-field
"Preprocess STRING-FIELD-MAYBE if it matches a `string-case:string-case' case form.
If STRING-FIELD-MAYBE is `cl:stringp' and matches apply the case body form to STRING-FIELD-MAYBE.
If STRING-FIELD-MAYBE is not `cl:stringp' return it.
Return three values as if by cl:values. Returned values will have one of the following formats:
<PROCESSED-STRING>, STRING-FIELD-MAYBE, <TYPE-OF-PROCESSED-STRING>
STRING-FIELD-MAYBE, NIL, <TYPE-OF-STRING-FIELD-MAYBE>
If STRING-FIELD-MAYBE is `cl:stringp' nth-value 0 is the p
:EXAMPLE~%
 \(field-convert-preprocess-field \"match-field\"\)
 \(field-convert-preprocess-field \"bubba\"\)
 \(field-convert-preprocess-field \"\"\)
 \(field-convert-preprocess-field 8\)
 \(field-convert-preprocess-field '\(\"\" \"bubba\"\)\)
:SEE-ALSO `<XREF>'.~%►►►")


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
;;   (mon:with-gensyms (match extent-var)
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
;;; :DBC-CLN-PARSE--DOCUMENTATION
;;; ==============================

(fundoc 'field-name-underscore-to-dash
 "Convert string FIELD-NAME with `cl:string-upcase'd removing any #\\_.~%~@
Return as if by `cl:values'.~%~@
FIELD-NAME is a string and should not be prefixed or suffixed by whitespace or #\\_.~%~@
When optional arg W-COLON is non-nil return prefixed with a colon.~%~@
:EXAMPLE~%
 \(field-name-underscore-to-dash \"keyword_seo\"\)~%
 \(field-name-underscore-to-dash \"keyword_seo\" t\)~%
:SEE-ALSO `preprocess-underscore-to-dash',
`dbc:preprocess-leading-trailing-dashes', `mon:string-underscore-to-dash',
`cl-ppcre:regex-replace-all'.~%►►►")

(fundoc 'field-string-cons
  "Return a three element list according to the `type-of' FIELD-STR.~%~@
List has the form:~%
 \(<SEQ-LENGTH> \(<TYPE-SPEC>\) FIELD-STR\)~%
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `field-table-parse-out', `field-string-cons', `field-cln-x'.~%►►►")

(fundoc 'field-cln-x
        "Return nil when FIELD-STRING-CONS is a string of length 1 with char value #\\x.~%
Else return value of FIELD-STRING-CONS.~%
This is a short-circuiting procedure, e.g. it does nothing on success.~%
:NOTE the \"x\" was used ind dbc sql fields to designate a null value.~%
:EXAMPLE~%~%\(field-cln-x \"x\"\)~%
 \(field-cln-x 'sym\)~%
 \(field-cln-x #\(x y z\)\)~%
 \(field-cln-x '\(x y z\)\)~%
:SEE-ALSO `field-table-parse-out', `field-string-cons', `field-cln-x'.~%►►►")

(fundoc 'split-used-fors
"Split USED-FOR-STRING on \"|\" barriers stripping leading and trailing whitespace~%~@
Return as if by cl:values:
 \(\"SPLIT\" \"USED\" \"FORS\" \"STRINGS\"\),USED-FOR-STRING.~%~@
When USED-FOR-STRING is either `mon:string-null-or-empty-p' or
`mon:string-all-whitespace-p' return as if by `cl:values':~%
 nil,USED-FOR-STRING~%~@
:EXAMPLE~%
 \(split-used-fors \"Poinçon de la Blanchardière, Pierre | La Blanchardiere, Pierre Poin çon de | \"\)~%
 \(split-used-fors \" | \"\)~%
 \(split-used-fors \"     \"\)~%
 \(split-used-fors \"\"\)~%
 \(split-used-fors nil\)~%~@
:SEE-ALSO `split-piped-field-if', `mon:string-split-on-chars', `split-roles',
`split-appeared-in', `split-loc-pre', `split-lifespan', `split-comma-field'.~%►►►")

(fundoc 'split-field-on-char-if
"SPLIT-STRING on CHAR returning a list of strings.~%~@
Do not return a list if no occurences of CHAR are found.~%~@
SPLIT-STRING may be an object of any type not just a `cl:string'.~%~@
Return 4 values as if by `cl:values' in a like manner as `dbc:field-convert-1-0-x-empty'.~%~@
When keyword KEEP-DUPLICATES is non-nil do not remove as if by the duplicate
elements from first value ruturned.  Default is to process nth-value 0 with
`field-convert-remove-duplicates' prior to returning.~%~@
When keyword KEEP-FIRST is non-nil do not return nil for nth-value 0 if string
is contained of only `mon:whitespace-char-p' and CHAR.~%~@
:NOTE The call chain is as follows:~%~@
 `split-field-on-char-if' :keep-first { T | NIL } :keep-duplicates { T | NIL }
  `- `field-convert-1-0-x-empty'
       `- `field-convert-verify-string' <SPLIT-STRING> :known-field-hashtable <KNOWN-FIELD-HASHTABLE>~%~@
:EXAMPLE~%
 \(split-field-on-char-if \" a | b | c | d | e\" #\\|\)~%
 \(split-field-on-char-if \" a | b | c | d | e | e | d | c | b | a | \" #\\|\)~%
 \(split-field-on-char-if \" a | b | c | d | e | e | d | c | b | a | \" #\\| :keep-duplicates t\)~%
 \(split-field-on-char-if \" , \" #\\,\)~%
 \(split-field-on-char-if \" , \" #\\, :keep-first t\)~%
 \(split-field-on-char-if \", \" #\\,  :keep-first t\)~%
 \(split-field-on-char-if \" ,\" #\\,  :keep-first t\)~%
 \(split-field-on-char-if \" ,   \" #\\,\)~%
 \(split-field-on-char-if \" ,      \" #\\, :keep-first t\)~%
 \(split-field-on-char-if \"8 ba \" #\\ \)~%
 \(split-field-on-char-if \"8 ba ba\" #\\  :keep-duplicates t\)~%
 \(split-field-on-char-if 8 #\\8\)~%
 \(split-field-on-char-if nil #\\8\)~%
 \(split-field-on-char-if t #\\8\)~%
 \(split-field-on-char-if #b0000 #\\8\)~%
 \(split-field-on-char-if #\\1 #\\1\)~%
 \(split-field-on-char-if \"1\" #\\1\)~%
 \(split-field-on-char-if \"\" #\\1\)~%
 \(split-field-on-char-if \"ref\" #\\1 :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \"x\" #\\1 :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \"1\" #\\1 :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \"0,\" #\\, :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \" ,\" #\\, :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \" , \" #\\, :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \" , \" #\\, :keep-first t :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \"ref , \" #\\, :known-field-hashtable *xml-refs-match-table*\)~%~@
:NOTE Corner case where `field-convert-1-0-x-empty' wins:~%~@
 \(split-field-on-char-if \"   \" #\\space :keep-first t\)~%~@
:NOTE Has regression tests:
 `split-field-on-char-if-TEST.0' `split-field-on-char-if-TEST.1'
 `split-field-on-char-if-TEST.2' `split-field-on-char-if-TEST.3'
:SEE-ALSO `split-piped-field-if'.~%►►►")

(fundoc 'split-piped-field-if
        "Like `split-used-fors' but do not return a list if no #\\| are found.~%~@
Unlike `split-used-fors' arg PIPED-STRING may be an object of any type not just a `cl:string'.~%~@
Return 4 values as if by `cl:values' in a like manner as `dbc:field-convert-1-0-x-empty'.~%~@
When keyword KEEP-DUPLICATES is non-nil do not remove as if by the duplicate
elements from first value ruturned.  Default is to process nth-value 0 with
`field-convert-remove-duplicates' prior to returning.~%~@
:EXAMPLE~%
 \(split-piped-field-if \" a | b | c | d | e\"\)~%
 \(split-piped-field-if \" a | b | c | d | e | e | d | c | b | a | \"\)~%
 \(split-piped-field-if \" a | b | c | d | e | e | d | c | b | a | \" :keep-duplicates t\)~%
 \(split-piped-field-if \" | \"\)~%
 \(split-piped-field-if \" | \"\)~%
 \(split-piped-field-if \"\"\)~%
 \(split-piped-field-if \"|\"\)~%
 \(split-piped-field-if  8\)~%
 \(split-piped-field-if \"8\"\)~%
 \(split-piped-field-if \"8 ba \"\)~%
 \(split-piped-field-if nil\)~%
 \(split-piped-field-if t\)~%
 \(split-piped-field-if #b0000\)~%
 \(split-piped-field-if \"ref\" :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-piped-field-if \"ref\"\)~%
 \(funcall \(complement #'equalp\)
          \(multiple-value-list 
           \(split-piped-field-if \"ref\"\)\) 
          \(multiple-value-list 
           \(split-piped-field-if \"ref\" 
                                 :known-field-hashtable *xml-refs-match-table*\)\)\)~%~@
:SEE-ALSO `split-used-fors', `split-roles', `split-appeared-in',
`split-loc-pre', `split-lifespan', `split-comma-field',
`mon:string-split-on-chars'.~%►►►")
 
(fundoc 'split-appeared-in
"Split APPEARED-IN-STRING on \"|\" barriers.~%~@
Return value is a list of strings.~%~@
Like `split-used-fors', but strip leading and trailing occurences of
`mon:*whitespace-chars*', e.g. #\\Newline #\\Return et al.~%~@
When APPEARED-IN-STRING is either `mon:string-null-or-empty-p' or
`mon:string-all-whitespace-p' return as if by `cl:values':~%
 nil,APPEARED-IN-STRING~%~@
:EXAMPLE~%
 \(split-appeared-in \"Le Rire | Le Sourire | Femina | Printed Salesmanship |\"\)~%
 \(split-appeared-in \"    Le Rire | Le Sourire |~% Femina | La Rampe \"\)~%
 \(split-appeared-in \"\"\)~%
 \(split-appeared-in nil\)~%
 \(split-appeared-in \"\"\)~%
 \(split-appeared-in \"     \"\)~%~@
:SEE-ALSO `split-roles', `split-used-fors', `split-loc-pre',
`split-lifespan'`mon:string-split-on-chars', `mon:string-trim-whitespace',
`mon:*whitespace-chars*'.~%►►►")
 
(fundoc 'split-roles
        "Split ROLE-STRING on \",\" barriers.~%~@
Strip leading/trailing whitespace and \".\". Capitalize all roles.~%~@
Return value is a list of strings.~%~@
When ROLE-STRING is either `mon:string-null-or-empty-p' or
`mon:string-all-whitespace-p' return as if by `cl:values':~%
 nil,ROLE-STRING~%~@
:EXAMPLE~%
 \(split-roles
  \"Artist, Illustrator,  Designer, Fashion Illustrator, Fashion Designer.\"\)~%
 \(split-roles
  \"Artist, Illustrator,  designer, Fashion illustrator, Fashion Designer .\"\)~%
 \(split-roles \"Artist, \"\)~%
 \(split-roles nil\)~%
 \(split-roles \"\"\)~%
 \(split-roles \"       \"\)~%~@
:SEE-ALSO `split-piped-field-if', `split-used-fors', `split-appeared-in',
`split-loc-pre', `split-lifespan', `split-comma-field'.~%►►►")

(fundoc 'split-loc-pre
        "Trim leading \"n \" prefix from loc-control fields.~%~@
Return as if by cl:values:~%~@
 <TRANSOFRMED-LOC-STRING>, LOC-STRING
When LOC-STRING is either `mon:string-null-or-empty-p' or
`mon:string-all-whitespace-p' return as if by `cl:values':~%
 nil,LOC-STRING~%~@
:EXAMPLE~%
 \(split-loc-pre \"n 83043434\"\)~%
 \(split-loc-pre \"83043434\"\)~%
 \(split-loc-pre \"\"\)~%
 \(split-loc-pre \"     \"\)~%
 \(split-loc-pre nil\)~%~@
:NOTE This is actually a bad idea as the \"n 95121069\" is canonical...~%~@
:SEE-ALSO `split-roles', `split-used-fors', `split-piped-field-if',
`split-appeared-in', `split-lifespan'.~%►►►")

(fundoc 'split-lifespan
"Split LIFESPAN-STR into a consed pair.~%~@
LIFESPAN-STR should have one of the formats:~% 
 <YYYY>-<YYYY>~% -<YYYY>~% <YYYY>-~% <YYYY>-?~% ?-<YYYY>~%~@
LIFESPAN-STR is either `null' or `simple-string-p', signal an error if not.~%~@
Return value has the form:~% 
 \(\"<YYYY>\" . \"<YYYY>\"\)~% 
 \(\"<YYYY>\" . \"?\"\)~% 
 \(\"?\" . \"<YYYY>\"\)~% 
 \(NIL\)~%
:EXAMPLE~%
 \(split-lifespan \"1843-1908\"\)~%
 \(split-lifespan \"1848-\"\)~%
 \(split-lifespan \"-1848\"\)~%
 \(split-lifespan \"?-1848\"\)~%
 \(split-lifespan \"-1848-?\"\)~%
 \(split-lifespan \"-1848?\"\)~%
 \(split-lifespan \"-1848?\"\)~%
 \(split-lifespan \"1848 - 1942\"\)
 \(split-lifespan \" 1848 - 1942 \"\)
 \(split-lifespan \"1848 -- ??\"\)~%
 \(split-lifespan \" 1848-?? \"\)~%~@
;; Pathological:~%
 \(split-lifespan \"1940s-60s\"\)~%
 \(split-lifespan \"Active 1940s-60s\"\)~%~@
:NOTE Doesn't catch the #\\[ #\\] chars in \"[?]-1900\" or \"1900-[?]\".~%~@
:SEE-ALSO `split-roles', `split-used-fors', `split-piped-field-if',
`split-appeared-in', `split-loc-pre'.~%►►►")

(fundoc 'split-lifespan-string-int-pairs
"Attempt integer extraction from cons strings returned by `split-lifespan'.~%~@
LIFESPAN-STR-PAIR is a consed pair with the value of each conscell satisfying
either null or `simple-stringp', signal an error if not.~%~@
First cons pair of return value is LIFESPAN-STR-PAIR second cons pair is its
interpolated parsed value.  Return value is a list of conses with the form:~% 
 \(<LIFESPAN-STR-PAIR>    <PARSED-VALUE>\)~% 
And should match one of the following patterns:~%
 \(\(\"<YYYY>\" . \"<YYYY>\"\)  \(YYYY   . YYYY\)\)~%
 \(\(\"<YYYY>\" . \"?\"\)       \(YYYY-1 . \(lognot YYYY-1\)\)\)~%
 \(\(\"<?+>\"   . \"<YYYY>\"\)  \(-1     . YYYY\)\)~%
 \(\(nil\)                  \(nil\)\)~%
 \(\(\"<YYYY>\"\)             \(nil\)\)~%
 \(\(\"<?+>\"   . \"<?+>\"\)    \(nil)\)~%
 \(\(\"<0+>\"   . \"<?+>\"\)    \(nil\)\)~%
 \(\(\"<?+>\"   . \"<0+>\"\)    \(nil\)\)~%
 \(\(\"<0+>\"   . \"<YYYY>\"\)  \(-1     . YYYY\)\)~%
 \(\(\"<YYYY>\" . \"<0+>\"\)    \(YYYY-1 . \(lognot YYYY-1\)\)~%
:EXAMPLE~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"1843-1943\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"1843-\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"-1843\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"1843-??\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"??-1843\"\)\)~%
;; Following cases are pathological and reasonably acounted for:~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"??-??\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"00-??\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"00-00\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"00-1843\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"1843-00\"\)\)~%
;; Following case is pathological and without a clear solution:~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"1843\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"3001-88\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"88-3001\"\)\)~%~@
When the car of LIFESPAN-STR-PAIR is a string indicating the beginning of
lifespan is an \"unknown\", the car of the second cons of return value is -1.
The intent in using a negative is to allow later callers the oppurtunity to
optimize their checks. For example:~%
 \(let* \(\(w-str \"1843-??\"\)
        \(both-lifespan \(split-lifespan-string-int-pairs
 		       \(split-lifespan w-str\)\)\)
        \(hd-ls \(caadr both-lifespan\)\)
        \(tl-ls \(cdadr both-lifespan\)\)\)
   \(and \(integerp tl-ls\)
        \(eql \(signum \(- tl-ls hd-ls\)\) -1\)\)
   \(format nil \(mon:concat
 	       \"~~2%With string: ~~20T~~S~~%Split to: ~~20T~~S~~%Beg-of-Life: \"
 	       \"~~20T~~S~~%End-of-Life: ~~20T~~S~~%Calcuation: ~~20t~~S ;=> ~~S~~%\")
     	  w-str both-lifespan hd-ls tl-ls
     	  \(list '- tl-ls hd-ls\) \(- tl-ls hd-ls\)\)\)~%~@
Likewise, when the cdr of LIFESPAN-STR-PAIR is a string indicating the end of 
lifespan is \"unknown\", the cdr of the second cons of return value is `lognot'
the integer value in the car cell. IOW, if there is a known beginning of
lifespan i.e. the string passed from `split-lifespan' was \"1843-?\", we
don't want inferences about an entities lifespan to return misleadingly and
guard against that by making it difficult for forms such as:~% 
 \(- <END-LIFESPAN> <BEG-LIFESPAN>\)~%~@
to return a value that is `plusp'. For example:~% 
 \(let* \(\(both-lifespan \(split-lifespan-string-int-pairs
			\(split-lifespan \"1843-??\"\)\)\)
	\(hd-ls \(caadr both-lifespan\)\)
	\(tl-ls \(cdadr both-lifespan\)\)\)
   \(and \(integerp tl-ls\)
	\(eql \(signum \(- tl-ls hd-ls\)\) -1\)\)\)~%~@
When coupled with the string values in the cons at the first elt in return value
we can be reasonably sure that the integer parse is correct.~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'split-comma-field
"Split a comma delimited string COMMA-STRING.~%~@
Intended for use with SEO and \"keyword\" like fields in the `refs` table.~%~@
:EXAMPLE~%
 \(split-comma-field \"air, plane, airplane, Biplane,, aircraft, expo, , dirigible,\"\)~%
 \(split-comma-field \",\"\)~%
 \(split-comma-field \",,\"\)~%
 \(split-comma-field \", ,\"\)~% 
 \(split-comma-field \"\"\)~%
 \(split-comma-field  \"   \"\)~%
 \(split-comma-field  nil\)~%
 \(split-comma-field  \(\)\)~%~@
:NOTE Do not call unless reasonably sure sure that there are never free commas
used in a non-delimiting position, e.g. the following string will not parse correctly:~% 
 \(split-comma-field  \"Havell \(Robert, Jr.\), Havell \(Robert, Sr.\), Havell Lithograph, \"\)~%~@
:SEE-ALSO `split-used-fors', `split-piped-field-if', `split-roles',
`split-appeared-in', `split-loc-pre', `split-lifespan', `split-comma-field',
`mon:string-split-on-chars'.~%►►►")

(fundoc 'format-entity-role
"Format dbc entity-roles list for presentation.~%~@
Arg ENTITY-ROLES is a list of strings with each string designating a role played
by a dbc entity, e.g. Artist, Author, Publisher, etc.~%~@
Keyword STREAM is destination stream for `cl:format'. Default is nil.~%~@
Keyword ENTITY-ROLE-PREFIX is a qualifier describing the type of entity role.
Default is \":ROLE\".
Keyword PREFIX-MIN-PAD is an integer designating the amount of padding which
should suffix ENTITY-ROLE-PREFIX.  Default is 14.~%~@
:EXAMPLE~%
 \(with-open-stream \(s \(make-string-output-stream\)\)
   \(format s \"Artist Name: Bubba \(Big\)~~%\"\)
   \(dbc-format-entity-rol
    \(dbc:split-roles
     \"Artist, Illustrator,  designer, Fashion illustrator, Fashion Designer .\"\)
    :entity-role-prefix \":ARTIST-ROLE\"
    :prefix-min-pad 15
    :stream s\)
   \(get-output-stream-string s\)\)
 ; => \"Artist Name: Bubba (Big)
 ;     :ARTIST-ROLE   Artist
 ;     :ARTIST-ROLE   Illustrator
 ;     :ARTIST-ROLE   Designer
 ;     :ARTIST-ROLE   Fashion Illustrator
 ;     :ARTIST-ROLE   Fashion Designer\"~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'field-convert-verify-string
"Return STRING-FIELD-MAYBE if it is a string and not null or empty.~%~@
Return as if by cl:values.~%~@
When optional arg KNOWN-FIELD-HASHTABLE is non-nil it is a hash-table the keys
of which are strings identifiying known fields. 
If a field is found as key in hash-table return nil, STRING-FIELD-MAYBE.~%~@
:EXAMPLE~%
 \(field-convert-verify-string nil\)~%
 \(field-convert-verify-string 8\)~%
 \(field-convert-verify-string \"\"\)~%
 \(field-convert-verify-string \"             \"\)~%
 \(field-convert-verify-string \"mma\"\)~%
 \(field-convert-verify-string \"ref\" *xml-refs-match-table*\)~%
 \(field-convert-verify-string \"ref\" *xml-refs-match-table*\)~%
 \(field-convert-verify-string \"ref\" '*xml-refs-match-table*\)~%
 \(field-convert-verify-string \"not-there\" *xml-refs-match-table*\)~%
 \(field-convert-verify-string \"not-there\" 'xml-refs-match-table*\)~%
 \(field-convert-verify-string \"ref\" '*not-xml-refs-match-table*\)~%
 \(field-convert-verify-string \"ref\" nil\)~%
 \(field-convert-verify-string \"ref\" t\)~%~@
:SEE-ALSO `field-convert-empty-string-nil'.~%►►►")

(fundoc 'field-convert-remove-duplicates
"Remove duplicate string= elements from STRING-LIST-MAYBE.~%~@
Return as if by cl:values:~%
 <TRANSFORMED-STRING-LIST-MAYBE>, STRING-LIST-MAYBE.~%~@
When STRING-LIST-MAYBE is not `mon:each-a-string-p' return:~%
 NIL, STRING-LIST-MAYBE~%~@
:EXAMPLE~%
 \(field-convert-remove-duplicates 
  \(split-appeared-in \"Le Rire | Le Sourire | Le Rire | Femina | ARTworld | Femina | femina | \"\)\)~%
 \(field-convert-remove-duplicates '\(\"   \" \"   \" \" a \" \" a \"\)\)~%
 \(field-convert-remove-duplicates \" \"\)~%
 \(field-convert-remove-duplicates  \(split-used-fors nil\)\)~%
 \(field-convert-remove-duplicates 42\)~%~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'field-convert-1-0-x
        "Attept to CONVERT-FIELD to a boolean.~%~@
CONVERT-FIELD is a dbc field string value of length one satisfying 
`mon:simple-string-or-null'.~%~@
When CONVERT-FIELD is any of the following  return T:~%
 \"1\" #\\1 1 T
When CONVERT-FIELD is any of the following return NIL:~%
 \"x\" \"X\" #\x #\X the symbol X \"0\" #\0 0 NIL
When CONVERT-FIELD is some other character or \(> \(length CONVERT-FIELD\) 1\)
return CONVERT-FIELD.~%~@
:EXAMPLE~%
 \(field-convert-1-0-x  \"1\"\)~%
 \(field-convert-1-0-x #\\1\)~%
 \(field-convert-1-0-x t\)~%
 \(field-convert-1-0-x   1\)~%
 \(field-convert-1-0-x  \"0\"\)~%
 \(field-convert-1-0-x  \"x\"\)~%
 \(field-convert-1-0-x  \"X\"\)~%
 \(field-convert-1-0-x #\\0\)~%
 \(field-convert-1-0-x #\\x\)~%
 \(field-convert-1-0-x #\\X\)~%
 \(field-convert-1-0-x   0\)~%
 \(field-convert-1-0-x  #\\*\)~%
 \(field-convert-1-0-x  #\\t\)~%
 \(field-convert-1-0-x  \"t\"\)~%
 \(field-convert-1-0-x \"Return Me\"\)~%~@
:NOTE Has regression test `field-convert-1-0-x-TEST'.~%~@
:SEE-ALSO `dbc:field-convert-1-0-x', `dbc:field-convert-1-0-x-empty',
`dbc:field-convert-1-0-x-empty-known', `dbc:field-convert-verify-string',
`dbc:field-convert-empty-string-nil', `dbc:field-cln-x'.~%►►►")

(fundoc 'field-convert-1-0-x-empty
        "Like `field-convert-1-0-x' but return 4 values as if by cl:values.~%~@
:EXAMPLE~%
 \(field-convert-1-0-x-empty \"    \"\)~%
 \(field-convert-1-0-x-empty \"\"\)~%
 \(field-convert-1-0-x-empty nil\)~%
 \(field-convert-1-0-x-empty \"1\"\)~%
 \(field-convert-1-0-x-empty #\\1\)~%
 \(field-convert-1-0-x-empty t\)~%
 \(field-convert-1-0-x-empty 1\)~%
 \(field-convert-1-0-x-empty \"0\"\)~%
 \(field-convert-1-0-x-empty \"x\"\)~%
 \(field-convert-1-0-x-empty \"X\"\)~%
 \(field-convert-1-0-x-empty #\\0\)~%
 \(field-convert-1-0-x-empty #\\x\)~%
 \(field-convert-1-0-x-empty #\\X\)~%
 \(field-convert-1-0-x-empty 0\)~%
 \(field-convert-1-0-x-empty #\\*\)~%
 \(field-convert-1-0-x-empty #\\t\)~%
 \(field-convert-1-0-x-empty \"t\"\)~%
 \(field-convert-1-0-x-empty \"Return Me\"\)~%
 \(field-convert-1-0-x-empty \"ref\" :known-field-hashtable *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"ref\" :known-field-hashtable '*xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"not-there\" :known-field-hashtable 'not-a-valid-hashtable\)~%
 \(field-convert-1-0-x-empty \"not-there\" :known-field-hashtable '*xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"\" :known-field-hashtable *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"   \" :known-field-hashtable *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty  8 :known-field-hashtable *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"x\" :known-field-hashtable *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"1\" :known-field-hashtable *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"0\" :known-field-hashtable *xml-refs-match-table*\)~%~@
:NOTE Has regression tests:~%
 `field-convert-1-0-x-empty-TEST.0' `field-convert-1-0-x-empty-TEST.0'~%~@
:SEE-ALSO `dbc:field-convert-1-0-x', `dbc:field-convert-1-0-x-empty',
`dbc:field-convert-1-0-x-empty-known', `dbc:field-convert-verify-string',
`dbc:field-convert-empty-string-nil', `dbc:field-cln-x'.~%►►►")

(fundoc 'field-convert-1-0-x-empty-known
"Like `field-convert-1-0-x-empty' but also check if CONVERT-FIELD is in
KNOWN-FIELD-HASHTABLE.~%~@
:EXAMPLE~%
 \(field-convert-1-0-x-empty-known \"ref\" *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty-known \"\" *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty-known \"   \" *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty-known 8 *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty-known \"x\" *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty-known \"1\" *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty-known \"0\" *xml-refs-match-table*\)~%~@
:SEE-ALSO `dbc:field-convert-1-0-x', `dbc:field-convert-1-0-x-empty',
`dbc:field-convert-1-0-x-empty-known', `dbc:field-convert-verify-string',
`dbc:field-convert-empty-string-nil', `dbc:field-cln-x'.~%►►►")

(fundoc 'field-convert-empty-string-nil
"If EMPTY-FIELD is null or `mon:string-empty-p' return nil.~%~@
If EMPTY-FIELD is `cl:stringp' return EMPTY-FIELD, else signal an error unless
keyword W-NO-ERROR is non-nil in which case do not signal an error and return
as if by `cl:values' first value is EMPTY-FIELD second is its `cl:type-of'.~%~@
:EXAMPLE~%~@
 (field-convert-empty-string-nil nil)~%
 (field-convert-empty-string-nil "")~%
 \(field-convert-empty-string-nil \"bubba\"\)~%
 (field-convert-empty-string-nil t)~%
 (field-convert-empty-string-nil t :w-no-error t)~%
 (field-convert-empty-string-nil t :w-no-error t)~%~@
:SEE-ALSO `dbc:field-convert-1-0-x', `dbc:field-convert-1-0-x-empty',
`dbc:field-convert-1-0-x-empty-known', `dbc:field-convert-verify-string',
`dbc:field-convert-empty-string-nil', `dbc:field-cln-x'.~%►►►")

(fundoc 'field-name-convert-field-name
"If FIELD-VALUE is null or `cl:string-equal' FIELD-NAME return nil, else FIELD-VALUE.~%~@
FIELD-NAME is a string.
FIELD-VALUE is some sort of object.
:EXAMPLE~%
 \(field-name-convert-field-name \"field_name\" \"not the same\"\)~%
 \(field-name-convert-field-name \"field_name\" \"field_name\"\)~%
 \(field-name-convert-field-name \"field_name\" \"FIELD_NAME\"\)~%
 \(field-name-convert-field-name \"field_name\" \"FIELD_NAME   \"\)~%
 \(field-name-convert-field-name \"field_name\" \"   fieLd_Name\"\)~%
 \(field-name-convert-field-name \"field_name\" nil\)~%
 \(field-name-convert-field-name \"field_name\" 8\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:


;;; ==============================
;;; EOF
