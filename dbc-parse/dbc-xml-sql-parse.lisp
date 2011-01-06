;;
;;
;;
;;; -*- mode: LISP -*-


;; #:dbc-table-field-parse
;; #:dbc-field-str-cons
;; #:dbc-field-cln-x
;; #:split-naf-used-fors


(in-package #:dbc)

;;; ==============================
;;; :CHANGESET 1
;;; :CREATED <Timestamp: #{2010-09-03T19:53:24-04:00Z}#{10355} - by MON>
(defun dbc-field-str-cons (field-str)
  (typecase field-str  
    ((or string array)
     (list (length field-str) (type-of field-str) field-str)) 
    ((and number (not float) (not ratio))
     (list 0 (type-of field-str) field-str))
    (cons
     (list (length field-str) (list (type-of field-str)) field-str))
    (t             (list 0 (list (type-of field-str)) field-str))))


;;; ==============================
;;; :CHANGESET 1
;;; :CREATED <Timestamp: #{2010-09-03T18:28:58-04:00Z}#{10355} - by MON>
(defun dbc-field-cln-x  (field-str-cons)
  (let ((chk (dbc-field-str-cons field-str-cons)))
    (unless (and (= (car chk) 1)
                 (eq (caadr chk) 'simple-array)
                 (eq (aref (caddr chk) 0) #\x))
      field-str-cons)))

;;; ==============================
;;; :REQUIRES klacks:peek klacks:with-open-source
;;;           klacks:get-attribute klacks:current-lname
;;;           klacks:current-characters klacks:consume
;;;           cxml:make-source
;;; :CHANGESET 1
;;; :CREATED <Timestamp: #{2010-09-02T20:38:51-04:00Z}#{10354} - by MON>
;;; 
;; (mon::dbc-table-field-parse 
;;  (make-pathname :directory '(:absolute 
;; 			     "home" 
;; 			     "sp" 
;; 			     "HG-Repos"
;; 			     "CL-repo-HG" 
;; 			     "CL-MON-CODE"
;; 			     "dbc-specific"
;; 			     "dbc-sql-lisp-convert-notes"
;; 			     "sql-file-per-table-2010-08-25"
;; 			     "from-DBC-ARCH-2010-09-01")
;; 		:name "dump-artist-infos-xml"))
;;
;; (dbc-table-field-parse (make-pathname :directory '(:relative "notes")
;; 				      :name "example"
;; 				      :type "out"))
;;
;; (with-temp-file (s (make-pathname :directory '(:relative "notes")
;; 				  :name "example-dump"))
;;   (princ (mon::dbc-table-field-parse (make-pathname :directory '(:relative "notes")
;; 						    :name "example"
;; 						    :type "out"))
;;    s))
;;
;;; :WORKS
(defun dbc-table-field-parse (sql-xml-dmp)
  (declare (pathname  sql-xml-dmp))
  (let ((ous (make-string-output-stream))
	(ous-out '()))
    ;; :TODO In the first case where `key` is :START-ELEMENT we should check
    ;; whether a set of desired attributes are present in the
    ;; `klacks:current-lname's and if so (and if we _know_ the next event is a
    ;; :CHARACTERS event then we can go ahead an read it too.  This will allow
    ;; the fall through check for :CHARACTERS events outside of the relevant
    ;; :START-ELEMENT events. If we do this, then we should maybe use one of the
    ;; `klacks:expect-*' routines to signal a recoverable error.  But, we will
    ;; still need to keep the existing behaviour around the :CHARACTERS case
    ;; below b/c we can't be _sure_ that some :CHARACTERS event won't happen.
     (unwind-protect
	  (klacks:with-open-source (s (cxml:make-source sql-xml-dmp))
	    (loop
	       :for key = (klacks:peek s)
	       :while key
	       
	       :do (case key
		     (:start-element
		      (let ((nm (klacks:get-attribute s "name")))
			(cond ((equal (klacks:current-lname s) "row")
			       (format ous "~%~A" 
				       (make-string 68 :initial-element #\;)))
			      ;; :NOTE What about when there are multiple attributes?
			      ;; This doesn't happen in the current case but it
			      ;; will if we ever try to generalize around this function.
			      ((equal (klacks:current-lname s) "field")
			       ;; Convert "ugly_sym" -> ":UGLY-SYM"
			       (format ous "~%:~A " (string-upcase (substitute  #\- #\_  nm))))
			      (t nil))))
		     (:end-element
		      (when (equal (klacks:current-lname s) "field")
			(format ous "~%")))
		     ;; Ideally these are only :CHARACTERS events related to
		     ;; formatting of the XML docs body, e.g. events occuring
		     ;; outside of any :START-ELEMENT/:END-ELEMENT event blocks.
		     (:characters 
		      (let ((kcc (klacks:current-characters s)))
			(or (and (eql (mon::string-trim-whitespace kcc) 0)
				 (format ous " "))
			    (format ous "~A" kcc))))
		     ;; (:comment <DO-SOMETHING-HERE???>) 
		     (:end-document
		      (format ous "~%~A~%;;; EOF"  (make-string 68 :initial-element #\;))))
	       (klacks:consume s))
	    (prog1 (setf ous-out (get-output-stream-string ous))
		(close ous))))))


(defun dbc-field-attribs-parse (curr-src)
  (declare (type cxml::cxml-source curr-src))
  ;; (assert (typep curr-src 'cxml::cxml-source))
  (and (multiple-value-bind (chk-ky) 
	   (klacks:peek curr-src)
	 (eql chk-ky :start-element))
       (let ((gthr '()))
	 (klacks:map-attributes #'(lambda (&rest x)
				    (push x gthr)) curr-src)
	 (unless (null gthr)
	   (loop 
	      :for x in gthr
	      :for v =  '(:namespace-uri :local-name :qname :value :specified-p)
	      :collect (nreverse (pairlis v x)) into z
	      :finally  (setf gthr z)
	      ))
	 gthr)))

(defun dbc-split-used-fors (used-for-string)
  ;; Is there a reason why we shouldn't be using this instead:
  ;; (declare (type (or null simple-string) used-for-string)) 
  (declare (type simple-string used-for-string))
  (loop 
     :with split = (mon:split-string-on-chars used-for-string "|")
     :for x in split 
     :for y = (string-trim " " x)
     :unless (eql (length y) 0) 
     :collect y     
     ;; Do we need to check for #\Newline #\Return? 
     ;; If so maybe use `mon:string-trim-whitespace' here as well.
     ;; :collect (mon:string-trim-whitespace y)
     ;;
     ))

;; :NOTE This can be adapted if/when we ever split the found_in field to work on
;; the for "^Appeared-in:" fields there as well.
(defun dbc-split-appeared-in (appeared-in-string)
  (declare (type (or null simple-string) appeared-in-string))
  (unless (null appeared-in-string)
    (loop 
       :with split = (mon:split-string-on-chars appeared-in-string "|")
       :for x in split 
       :for y = (string-trim " " x)
       :unless (or (null y) (eql (length y) 0)) 
       :collect (mon:string-trim-whitespace y))))

(defun dbc-split-roles (role-string)
  (declare (type (or null simple-string) role-string))
  (unless (null role-string)
    (loop 
       :with split = (mon:split-string-on-chars role-string ",")
       :for x in split 
       :for y = (string-left-trim " " (string-right-trim  " ." x))
       :unless (eql (length y) 0)
       :collect (string-capitalize y))))

;; :NOTE This is actually a bad idea as the "n 95121069" is canonical...
(defun dbc-split-loc-pre (loc-string)
  (declare (type (or null simple-string) loc-string))
  (string-left-trim "n " (string-right-trim  " " loc-string)))

(defun dbc-split-lifespan (lifespan-str)
  (declare (type (or null simple-string) lifespan-str))
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
				    (mon:split-string-on-chars frob "-"))))	    
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

(defun dbc-split-lifespan-string-int-pairs (lifespan-str-pair)
  (declare (type (cons (or null simple-string)
		       (or null simple-string))
		 lifespan-str-pair))
  (let ((cons-str lifespan-str-pair)
	(chk-digit (cons nil nil)))
    (and (stringp (car cons-str))
	 (stringp (cdr cons-str))
	 (setf chk-digit
	       (list (or (and 
			  (loop for chars across (car cons-str) always (digit-char-p chars))
			  (not (and (loop for chars across (car cons-str) always (char= #\0 chars))
				    (setf (car chk-digit) #\?))))
			 (car chk-digit)
			 (and (loop for chars across (car cons-str) thereis (char= #\? chars))
			      #\?)
			 (car chk-digit))
		     (or (and (loop for chars across (cdr cons-str) always (digit-char-p chars))
			      (not (and (loop for chars across (cdr cons-str) always (char= #\0 chars))
					(setf (cdr chk-digit) #\?))))
			 (cdr chk-digit)
			 (and (loop for chars across (cdr cons-str) thereis (char= #\? chars))
			      #\?)
			 (cdr chk-digit)))))
    (and (car chk-digit)
	 (not (characterp (car chk-digit)))
	 ;; By now there shouldn't be any way we are parsing a negative string, e.g. "-1843"
	 (setf (car chk-digit) (multiple-value-list (parse-integer (car cons-str))))
	 ;; And, we're only looking for entities in existing beyond the Middle Ages :)
	 (eql (cadar chk-digit) 4)
	 (setf (car chk-digit) (caar chk-digit)))
    (and (cadr chk-digit)
	 (not (characterp (cadr chk-digit)))
	 (setf (cadr chk-digit) (multiple-value-list (parse-integer (cdr cons-str))))
	 (eql (cadadr chk-digit) 4)
	 (setf (cadr chk-digit) (caadr chk-digit)))
    (setf chk-digit (cons (car chk-digit) (cadr chk-digit)))
    (or (and (integerp (car chk-digit)) (integerp (cdr chk-digit)))
	;; `chk-digit` is a cons of the form: (#\? . #\?)
	(and (characterp (car chk-digit)) (characterp (cdr chk-digit))
	     (setf chk-digit (cons nil nil)))
	;; ==============================
	;;
	;; This would imply a cons of the form (0 . 0) 
	;; Currently this can't actually happen because we're checking
	;; above that the length of `parse-integer' is 4 and didn't parse "0*"
	;; Is it possible that this could change?
	;;
	;; (not (and (zerop (car chk-digit)) (zerop (cdr chk-digit))))
	;;
	;; ==============================
	;;
	;; This would imply a cons of the form: (1843 . 1843) 
	;; The question is should/can it ever happen? 
	;; It certainly can if we extend should ever extend this
	;; function to other entity types which can terminate in the
	;; same year as its creation. 
	;; In which case, how to reason around which the birth date
	;; which is the death date?
	;; One option is to let it pass and allow reporting the
	;; lifespan as 0, e.g. with (- 1843 1843).
	;; Likewise, we could prevent erroneous inferences by
	;; returning (0 . 0) instead of (YYYY . YYYY)
	;;
	;; (not (= (car chk-digit) (cdr chk-digit)))
	;;
	;; ==============================
	;;
	;; This would imply a cons of the form: (1900 . 1843)
	;; IOW, the birthdate is after the deathdate.
	;; What to do? error?
	;;
	;; (not (>= (cdr chk-digit) (car chk-digit))))
	;;
	;; ============================== 
	;;
	;; When this branch is true we have a cons of the form: (1843 . #\?)
	;; We know that the string passed from `dbc-split-lifespan' was "1843-?"
	;; or equivalent and that birth date is known So, we return the deathdate
	;; as -1843 e.g. the lifespan will appear as: (1843 . -1844)
	;; This means inferences about an entities lifespan will always return an
	;; integer less than -1 e.g.  (- -1844 1843) => -3687 
	;; whereas (- 1900 1843) => 57 which is a valid lifespan.
	(and  (integerp (car chk-digit))
	      ;; Don't bother checking if its #\? 
	      ;; (and (characterp (cdr chk-digit)) (char= #\? (cdr chk-digit))
	      (characterp (cdr chk-digit))
	      (setf (cdr chk-digit) (lognot (car chk-digit))))
	;;
	;; When this branch is true we have a cons of the form: (#\? . 1900)
	;; We make it a cons of the form: (-1 . 1900)
	;; 
	;;  This allows a few nice to checks later on:
	;; (and (integerp (car '(-1 . 1900)))
	;; 	    (eql (signum (car '(-1 . 1900))) (car '(-1 . 1900)))
	;; 	    (not (< (- (cdr '(-1 . 1900)) (car '(-1 . 1900)))
	;; 		    (cdr '(-1 . 1900)))))
	;; IOW:
	;;
	;; (and (integerp -1)
	;; 	    (eql (signum -1) -1) 
	;; 	    (not (< (- 1900 -1) 1900)))
	;;
	(and (integerp (cdr chk-digit)) (characterp (car chk-digit))
	     (setf (car chk-digit) -1))
	;; Whatever is left... should be: (nil)
	)
    (setf cons-str (list cons-str chk-digit))
  ))



;;; ==============================
;;; :DBC-XML-SQL-PARSE-DOCUMENTATION
;;; ==============================

(setf (documentation 'dbc-field-str-cons 'function)
      #.(format nil
  "Return a three element list according to the `type-of' FIELD-STR.
List has the form:~%
\(<SEQ-LENGTH> \(<TYPE-SPEC>\) FIELD-STR\)~%
:EXAMPLE~%~% { ... <EXAMPLE> ... } ~%
:SEE-ALSO `dbc-table-field-parse', `dbc-field-str-cons', `dbc-field-cln-x'.~%►►►"))

(setf (documentation 'dbc-field-cln-x 'function)
      #.(format nil
  "Return nil when FIELD-STR-CONS is a string of length 1 with char value #\\x.~%
Else return value of FIELD-STR-CONS.~%
This is a short-circuiting procedure, e.g. it does nothing on success.~%
:NOTE the \"x\" was used ind dbc sql fields to designate a null value.~%
:EXAMPLE~%~%\(dbc-field-cln-x \"x\"\)~%
\(dbc-field-cln-x 'sym\)~%
\(dbc-field-cln-x #\(x y z\)\)~%
\(dbc-field-cln-x '\(x y z\)\)~%
:SEE-ALSO `dbc-table-field-parse', `dbc-field-str-cons', `dbc-field-cln-x'.~%►►►"))

(setf (documentation 'dbc-table-field-parse 'function)
      #.(format nil
  "Return parsed results for MySQL xml dump file SQL-XML-DMP.~%
SQL-XML-DMP becomes a source as if by `klacks:with-open-source'.~%
It is a pathname or variable suitable for use with `cxml:make-source' e.g.:~%
 #P\"/some/file/pathname.xml\"~%
For each XML `<row>` element event convert each `<field>` event with attribute
`name` to a lispy keyword/value pair where a field element event has the form:~%
 <field name=\"`attribute_name`\">`field-value`</field>~%
return:~%
 :FIELD-NAME field-value~%
:SEE-ALSO `dbc-table-field-parse', `dbc-field-str-cons', `dbc-field-cln-x'.~%►►►"))

(setf (documentation 'dbc-field-attribs-parse 'function)
      #.(format nil
"Map the attributes of the current klacks event.
CURR-SRC is a klacks-source as per return value of `cxml:make-source'
The current klacks event should be `:START-EVENT`, e.g. 
\(values \(klacks:peek CURR-SRC\)\)~%~@
 => :START-EVENT~%~@
If so retrun value is a list of elements each the form:~%
 \(\(:NAMESPACE-URI . <BOOLEAN>\)
  \(:LOCAL-NAME    . \"<LOCAL-NAME>\"\)
  \(:QNAME         . \"QNAME\"\)
  \(:VALUE         . \"<VALUE>\"\)
  \(:SPECIFIED-P   . <BOOLEAN>\)\)~%~@
:EXAMPLE~%~@
 \(let \(\(src \(cxml:make-source \"<field name=\\\"name 1\\\" name2=\\\"name 2\\\">10</field>\"\)\)\)
   \(klacks:consume src\)
   \(dbc-field-attribs-parse src\)\)~%~@
:NOTE Like `klacks:list-attributes' but does not return a structure object.~%~@
:SEE-ALSO `klacks:map-attributes'.~%►►►"))

(setf (documentation 'dbc-split-used-fors 'function)
      #.(format nil
"Split USED-FOR-STRING on \"|\" barriers stripping leading and trailing whitespace~%~@
Return value is a list of strings.~%~@
:EXAMPLE~%~@
 \(dbc-split-used-fors \"Poinçon de la Blanchardière, Pierre | La Blanchardiere, Pierre Poin çon de | \"\)~%~@
:SEE-ALSO `mon:split-string-on-chars', `dbc-split-roles',
`dbc-split-appeared-in', `dbc-split-loc-pre', `dbc-split-lifespan'.~%►►►"))

(setf (documentation 'dbc-split-appeared-in 'function)
      #.(format nil
"Split APPEARED-IN-STRING on \"|\" barriers.~%~@
Return value is a list of strings.~%~@
Like `dbc-split-used-fors', but strip leading and trailing occurences of
`mon:*whitespace-chars*', e.g. #\\Newline #\\Return et al.~%~@
Signal an error if APPEARED-IN-STRING is neither `null' nor `simple-string-p'.~%~@
:EXAMPLE~%~@
 \(dbc-split-appeared-in \"Le Rire | Le Sourire | Femina | Printed Salesmanship |\"\)~%~@
 \(dbc-split-appeared-in \"    Le Rire | Le Sourire |~% Femina | La Rampe \"\)~%~@
 \(dbc-split-appeared-in \"\"\)~%~@
 \(dbc-split-appeared-in nil\)~%~@
:SEE-ALSO `dbc-split-roles', `dbc-split-used-fors', `dbc-split-loc-pre',
`dbc-split-lifespan'`mon:split-string-on-chars', `mon:string-trim-whitespace',
`mon:*whitespace-chars*'.~%►►►"))

(setf (documentation 'dbc-split-roles 'function)
      #.(format nil
"Split ROLE-STRING on \",\" barriers.~%~@
Strip leading/trailing whitespace and \".\". Capitalize all roles.~%~@
Return value is a list of strings.~%~@
Signal an error if ROLE-STRING is neither `null' nor `simple-string-p'.~%~@
:EXAMPLE~%~@
 \(dbc-split-roles
  \"Artist, Illustrator,  Designer, Fashion Illustrator, Fashion Designer.\"\)~%~@
 \(dbc-split-roles
  \"Artist, Illustrator,  designer, Fashion illustrator, Fashion Designer .\"\)~%~@
 \(dbc-split-roles \"Artist, \"\)~%~@
 \(dbc-split-roles nil\)~%~@
:SEE-ALSO `dbc-split-used-fors', `dbc-split-appeared-in', `dbc-split-loc-pre',
`dbc-split-lifespan'.~%►►►"))

(setf (documentation 'dbc-split-loc-pre 'function)
      #.(format nil
"Trim leading \"n \" prefix from loc-control fields.~%~@
:EXAMPLE~%~@
 \(dbc-split-loc-pre \"n 83043434\"\)~%~@
 \(dbc-split-loc-pre \"83043434\"\)~%~@
:NOTE This is actually a bad idea as the \"n 95121069\" is canonical...~%~@
:SEE-ALSO `dbc-split-roles', `dbc-split-used-fors', `dbc-split-appeared-in',
`dbc-split-lifespan'.~%►►►"))

(setf (documentation 'dbc-split-lifespan 'function)
      #.(format nil
"Split LIFESPAN-STR into a consed pair.~%~@
LIFESPAN-STR should have one of the formats:~% 
 <YYYY>-<YYYY>~% -<YYYY>~% <YYYY>-~% <YYYY>-?~% ?-<YYYY>~%~@
LIFESPAN-STR is either `null' or `simple-string-p', signal an error if not.~%~@
Return value has the form:~% 
 \(\"<YYYY>\" . \"<YYYY>\"\)~% 
 \(\"<YYYY>\" . \"?\"\)~% 
 \(\"?\" . \"<YYYY>\"\)~% 
 \(NIL\)~%
:EXAMPLE~%~@
 \(dbc-split-lifespan \"1843-1908\"\)~%~@
 \(dbc-split-lifespan \"1848-\"\)~%~@
 \(dbc-split-lifespan \"-1848\"\)~%~@
 \(dbc-split-lifespan \"?-1848\"\)~%~@
 \(dbc-split-lifespan \"-1848-?\"\)~%~@
 \(dbc-split-lifespan \"-1848?\"\)~%~@
 \(dbc-split-lifespan \"-1848?\"\)~%~@
 \(dbc-split-lifespan \"1848 -- ??\"\)~%~@
 \(dbc-split-lifespan \" 1848-?? \"\)~%~@
:NOTE Doesn't catch the #\\[ #\\] chars in \"[?]-1900\" or \"1900-[?]\".~%~@
:SEE-ALSO `dbc-split-roles', `dbc-split-used-fors', `dbc-split-appeared-in',
`dbc-split-loc-pre'.~%►►►"))

(setf (documentation 'dbc-split-lifespan-string-int-pairs 'function)
      #.(format nil
"Attempt integer extraction from cons strings returned by `dbc-split-lifespan'.~%~@
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
 \(\(\"<0+>\"   . \"<YYYY>\"\)  \(-1      . YYYY\)\)~%
 \(\(\"<YYYY>\" . \"<0+>\"\)    \(YYYY-1  . \(lognot YYYY-1\)\)~%
:EXAMPLE~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"1843-1943\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"1843-\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"-1843\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"1843-??\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"??-1843\"\)\)~%~@
;; Following cases are pathological and reasonably acounted for:~% 
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"??-??\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"00-??\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"00-00\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"00-1843\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"1843-00\"\)\)~%~@
 ;; Following case is pathological and without a clear solution:~%
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"1843\"\)\)~%~@
When the car of LIFESPAN-STR-PAIR is a string indicating the beginning of
lifespan is an \"unknown\", the car of the second cons of return value is -1.
The intent in using a negative is to allow later callers the oppurtunity to
optimize their checks. For example:~%
 \(let* \(\(both-lifespan \(dbc-split-lifespan-string-int-pairs
			\(dbc-split-lifespan \"??-1843\"\)\)\)
	\(hd-ls \(caadr both-lifespan\)\)
	\(tl-ls \(cdadr both-lifespan\)\)\)
   \(and \(integerp hd-ls\)
	\(eql \(signum hd-ls\) hd-ls\)
	\(not \(< \(- tl-ls hd-ls\) tl-ls\)\)\)\)~%~@
Likewise, when the cdr of LIFESPAN-STR-PAIR is a string indicating the end of
lifespan is \"unknown\" the cdr of the second cons of return value is `lognot'
the integer value in the car cell. IOW, if there is a known beginning of
lifespan i.e. the string passed from `dbc-split-lifespan' was \"1843-?\", we
don't want inferences about an entities lifespan to return misleadingly. To
guard against that by making it difficult for forms such as:~% 
 \(- <END-LIFESPAN> <BEG-LIFESPAN>\)~%~@
to return a value that is `plusp'. For example:~% 
 \(let* \(\(both-lifespan \(dbc-split-lifespan-string-int-pairs
		       \(dbc-split-lifespan \"1843-??\"\)\)\)
       \(hd-ls \(caadr both-lifespan\)\)
       \(tl-ls \(cdadr both-lifespan\)\)\)
  \(and \(integerp tl-ls\)
       \(eql \(signum \(- tl-ls hd-ls\)\) -1\)\)\)~%~@
When coupled with the string values in the cons at the first elt in return value
we can be reasonably sure that are integer parses are correct.~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

;;; ==============================
;;; EOF

