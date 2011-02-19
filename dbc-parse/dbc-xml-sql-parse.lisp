
;;; :FILE ../dbc-specific/dbc-parse/dbc-xml-sql-parse.lisp
;;; ==============================

;; #:field-table-parse-out
;; #:field-str-cons
;; #:field-cln-x
;; #:split-naf-used-fors


(in-package #:dbc)

;;; ==============================
;;; :REQUIRES klacks:peek klacks:with-open-source
;;;           klacks:get-attribute klacks:current-lname
;;;           klacks:current-characters klacks:consume
;;;           cxml:make-source
;;; :CHANGESET 1
;;; :CREATED <Timestamp: #{2010-09-02T20:38:51-04:00Z}#{10354} - by MON>
;;; 
;; (field-table-parse-out 
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
;; (field-table-parse-out (make-pathname :directory '(:relative "notes")
;; 				      :name "example"
;; 				      :type "out"))
;;
;; (with-temp-file (s (make-pathname :directory '(:relative "notes")
;; 				  :name "example-dump"))
;;   (princ (field-table-parse-out (make-pathname :directory '(:relative "notes")
;; 						    :name "example"
;; 						    :type "out"))
;;    s))
;;
;;; :WORKS
(defun field-table-parse-out (sql-xml-dmp)
  (declare (pathname  sql-xml-dmp))
  (let ((ous (make-string-output-stream))  ;; use flexi?
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
			(or (and (eql (mon:string-trim-whitespace kcc) 0)
				 (format ous " "))
			    (format ous "~A" kcc))))
		     ;; (:comment <DO-SOMETHING-HERE???>) 
		     (:end-document
		      (format ous "~%~A~%;;; EOF"  (make-string 68 :initial-element #\;))))
	       (klacks:consume s))
	    (prog1 (setf ous-out (get-output-stream-string ous))
		(close ous))))))

(defun field-parse-attribs (curr-src)
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

(defun field-str-cons (field-str)
  (typecase field-str  
    ((or string array)
     (list (length field-str) (type-of field-str) field-str)) 
    ((and number (not float) (not ratio))
     (list 0 (type-of field-str) field-str))
    (cons
     (list (length field-str) (list (type-of field-str)) field-str))
    (t             (list 0 (list (type-of field-str)) field-str))))

(defun field-cln-x  (field-str-cons)
  (let ((chk (field-str-cons field-str-cons)))
    (unless (and (= (car chk) 1)
                 ;; (type-of '"bubba") (aref "bubba" 0) 
                 (eq (caadr chk) 'simple-array)
                 (eq (aref (caddr chk) 0) #\x))
      field-str-cons)))

(defun split-used-fors (used-for-string)
  ;; Is there a reason why we shouldn't be using this instead:
  ;; (declare (type (or null simple-string) used-for-string)) 
  (declare (type string used-for-string))
  (loop 
     :with split = (mon:string-split-on-chars used-for-string "|")
     :for x in split 
     :for y = (string-trim " " x)
     :unless (eql (length y) 0) 
     :collect y     
     ;; Do we need to check for #\Newline #\Return? 
     ;; If so maybe use `mon:string-trim-whitespace' here as well.
     ;; :collect (mon:string-trim-whitespace y)
     ;;
     ))
;;mon:string-
;; :NOTE This can be adapted if/when we ever split the found_in field to work on
;; the for "^Appeared-in:" fields there as well.
(defun split-appeared-in (appeared-in-string)
  (declare (type mon:string-or-null appeared-in-string))
  (unless (null appeared-in-string)
    (loop 
       :with split = (mon:string-split-on-chars appeared-in-string "|")
       :for x in split 
       :for y = (string-trim " " x)
       :unless (or (null y) (eql (length y) 0)) 
       :collect (mon:string-trim-whitespace y))))

(defun split-roles (role-string)
  (declare (type mon:string-or-null role-string))
  (unless (null role-string)
    (loop 
       :with split = (mon:string-split-on-chars role-string ",")
       :for x in split 
       :for y = (string-left-trim " " (string-right-trim  " ." x))
       :unless (eql (length y) 0)
       :collect (string-capitalize y))))

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
  (declare (type (or null simple-string) loc-string))
  (string-left-trim "n " (string-right-trim  " " loc-string)))

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

;; :NOTE Don't for get to use `cl:search', `cl:find', etc.!
;;; ==============================
(defun split-comma-field (seo-desc-str)
  (unless ;; (mon:simple-string-null-or-empty-p seo-desc-str)
      (mon:string-null-or-empty-p seo-desc-str)
    (loop 
       :with split-comma = (mon:string-split-on-chars (the string seo-desc-str) ",")
       :for x :in split-comma
       :for y = (mon:string-trim-whitespace (the string x))
       :unless (or 
                (eql (length y) 0) 
                (notany #'alpha-char-p y))
       :collect y)))

(defun field-convert-1-0-x (convert-field)
  ;; (declare (optimize (speed 3) (space 0) (safety 0)))
  (setf convert-field
        (if (and (simple-string-p convert-field)
                 (eql (length convert-field) 1))
            (char convert-field 0)
            convert-field))
  (typecase  convert-field
    (standard-char (case convert-field
                     (#\1 t)
                     ((#\0  #\x #\X) nil)
                     (t convert-field)))
    (bit (and (eql convert-field 1)))
    (symbol  (if (eql convert-field 'x) nil convert-field))
    (t convert-field)))



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
;;; :DBC-XML-SQL-PARSE-DOCUMENTATION
;;; ==============================

(mon:fundoc 'field-str-cons
  "Return a three element list according to the `type-of' FIELD-STR.~%~@
List has the form:~%
 \(<SEQ-LENGTH> \(<TYPE-SPEC>\) FIELD-STR\)~%
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `field-table-parse-out', `field-str-cons', `field-cln-x'.~%►►►")

(mon:fundoc 'field-cln-x
  "Return nil when FIELD-STR-CONS is a string of length 1 with char value #\\x.~%
Else return value of FIELD-STR-CONS.~%
This is a short-circuiting procedure, e.g. it does nothing on success.~%
:NOTE the \"x\" was used ind dbc sql fields to designate a null value.~%
:EXAMPLE~%~%\(field-cln-x \"x\"\)~%
\(field-cln-x 'sym\)~%
\(field-cln-x #\(x y z\)\)~%
\(field-cln-x '\(x y z\)\)~%
:SEE-ALSO `field-table-parse-out', `field-str-cons', `field-cln-x'.~%►►►")

(mon:fundoc  'field-table-parse-out
  "Return parsed results for MySQL xml dump file SQL-XML-DMP.~%
SQL-XML-DMP becomes a source as if by `klacks:with-open-source'.~%
It is a pathname or variable suitable for use with `cxml:make-source' e.g.:~%
 #P\"/some/file/pathname.xml\"~%
For each XML `<row>` element event convert each `<field>` event with attribute
`name` to a lispy keyword/value pair where a field element event has the form:~%
 <field name=\"`attribute_name`\">`field-value`</field>~%
return:~%
 :FIELD-NAME field-value~%
:SEE-ALSO `field-table-parse-out', `field-str-cons', `field-cln-x'.~%►►►")

(mon:fundoc 'field-parse-attribs
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
:EXAMPLE~%
 \(let \(\(src \(cxml:make-source \"<field name=\\\"name 1\\\" name2=\\\"name 2\\\">10</field>\"\)\)\)
   \(klacks:consume src\)
   \(field-parse-attribs src\)\)~%~@
:NOTE Like `klacks:list-attributes' but does not return a structure object.~%~@
:SEE-ALSO `klacks:map-attributes'.~%►►►")

(mon:fundoc 'split-used-fors
"Split USED-FOR-STRING on \"|\" barriers stripping leading and trailing whitespace~%~@
Return value is a list of strings.~%~@
:EXAMPLE~%
 \(split-used-fors \"Poinçon de la Blanchardière, Pierre | La Blanchardiere, Pierre Poin çon de | \"\)~%~@
:SEE-ALSO `mon:string-split-on-chars', `split-roles',
`split-appeared-in', `split-loc-pre', `split-lifespan'.~%►►►")

(mon:fundoc 'split-appeared-in
"Split APPEARED-IN-STRING on \"|\" barriers.~%~@
Return value is a list of strings.~%~@
Like `split-used-fors', but strip leading and trailing occurences of
`mon:*whitespace-chars*', e.g. #\\Newline #\\Return et al.~%~@
Signal an error if APPEARED-IN-STRING is neither `null' nor `simple-string-p'.~%~@
:EXAMPLE~%
 \(split-appeared-in \"Le Rire | Le Sourire | Femina | Printed Salesmanship |\"\)~%
 \(split-appeared-in \"    Le Rire | Le Sourire |~% Femina | La Rampe \"\)~%
 \(split-appeared-in \"\"\)~%
 \(split-appeared-in nil\)~%~@
:SEE-ALSO `split-roles', `split-used-fors', `split-loc-pre',
`split-lifespan'`mon:string-split-on-chars', `mon:string-trim-whitespace',
`mon:*whitespace-chars*'.~%►►►")
 
(mon:fundoc 'split-roles
"Split ROLE-STRING on \",\" barriers.~%~@
Strip leading/trailing whitespace and \".\". Capitalize all roles.~%~@
Return value is a list of strings.~%~@
Signal an error if ROLE-STRING is neither `null' nor `simple-string-p'.~%~@
:EXAMPLE~%
 \(split-roles
  \"Artist, Illustrator,  Designer, Fashion Illustrator, Fashion Designer.\"\)~%
 \(split-roles
  \"Artist, Illustrator,  designer, Fashion illustrator, Fashion Designer .\"\)~%
 \(split-roles \"Artist, \"\)~%~@
 \(split-roles nil\)~%~@
:SEE-ALSO `split-used-fors', `split-appeared-in', `split-loc-pre',
`split-lifespan'.~%►►►")

(mon:fundoc 'split-loc-pre
"Trim leading \"n \" prefix from loc-control fields.~%~@
:EXAMPLE~%
 \(split-loc-pre \"n 83043434\"\)~%
 \(split-loc-pre \"83043434\"\)~%~@
:NOTE This is actually a bad idea as the \"n 95121069\" is canonical...~%~@
:SEE-ALSO `split-roles', `split-used-fors', `split-appeared-in',
`split-lifespan'.~%►►►")

(mon:fundoc 'split-lifespan
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
 \(split-lifespan \"1848 -- ??\"\)~%
 \(split-lifespan \" 1848-?? \"\)~%~@
:NOTE Doesn't catch the #\\[ #\\] chars in \"[?]-1900\" or \"1900-[?]\".~%~@
:SEE-ALSO `split-roles', `split-used-fors', `split-appeared-in',
`split-loc-pre'.~%►►►")

(mon:fundoc 'split-lifespan-string-int-pairs
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

(mon:fundoc'split-comma-field
"Split a comma delitied dbc field.~%~@
Intended for use with SEO and \"keyword\" like fields in the `refs` table.~%~@
:EXAMPLE~%~@
 \(split-comma-field  \"air, plane, airplane, Biplane,, aircraft, expo, , dirigible,\"\)~%~@
:NOTE Do not call unless reasonably sure sure that there are never free commas
used in a non-delimiting position, e.g. the following string will not parse correctly:~% 
 \"Havell (Robert, Jr.), Havell (Robert, Sr.), Havell Lithograph, \"~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'field-convert-1-0-x
"Attept to CONVERT-FIELD to a boolean.~%~@
CONVERT-FIELD is a dbc field string value of length one satisfying 
`mon:simple-string-or-null'.~%~@
When CONVERT-FIELD is \"1\" return t.
When CONVERT-FIELD is \"x\" or \"0\" return nil.
When CONVERT-FIELD is some other character or \(> \(length CONVERT-FIELD\) 1\)
return CONVERT-FIELD.~%~@
:EXAMPLE~%
 \(field-convert-1-0-x  \"1\"\)~%
 \(field-convert-1-0-x  \"0\"\)~%
 \(field-convert-1-0-x  \"x\"\)~%
 \(field-convert-1-0-x  \"X\"\)~%
 \(field-convert-1-0-x #\\1\)~%
 \(field-convert-1-0-x #\\0\)~%
 \(field-convert-1-0-x #\\x\)~% 
 \(field-convert-1-0-x #\\X\)~%
 \(field-convert-1-0-x   1\)~%
 \(field-convert-1-0-x   0\)~%
 \(field-convert-1-0-x  #\\*\)
 \(field-convert-1-0-x \"Return Me\"\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'format-entity-role 
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


;;; ==============================
;;; EOF

