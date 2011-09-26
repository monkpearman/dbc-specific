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


;; :NOTE Don't forget to use `cl:search', `cl:find', etc.!
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
;; :TODO finish or delete.
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


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:


;;; ==============================
;;; EOF
