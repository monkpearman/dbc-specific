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
;; (dbc-table-field-parse 
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
;;   (princ (dbc-table-field-parse (make-pathname :directory '(:relative "notes")
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

;; :NOTE This can be adapted if/when we ever split the found_in field to work on
;; the for "^Appeared-in:" fields there as well.
(defun dbc-split-appeared-in (appeared-in-string)
  (declare (type (or null simple-string) appeared-in-string))
  (unless (null appeared-in-string)
    (loop 
       :with split = (mon:string-split-on-chars appeared-in-string "|")
       :for x in split 
       :for y = (string-trim " " x)
       :unless (or (null y) (eql (length y) 0)) 
       :collect (mon:string-trim-whitespace y))))

(defun dbc-split-roles (role-string)
  (declare (type (or null simple-string) role-string))
  (unless (null role-string)
    (loop 
       :with split = (mon:string-split-on-chars role-string ",")
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

(defun dbc-split-lifespan-string-int-pairs (lifespan-str-pair)
  (declare (type (cons (or null simple-string)
		       (or null simple-string))
		 lifespan-str-pair)
	   ;; (optimize (speed 3) (safety 1) (space 0) (compilation-speed 0))
	   )
  (let ((cons-str lifespan-str-pair)
	(chk-digit (cons nil nil)))
    (and (stringp (car cons-str))
	 (stringp (cdr cons-str))
	 (setf chk-digit
	       (list (or 
                      (and (loop for chars across (the simple-string (car cons-str)) always (digit-char-p chars))
                           (not (or (and (loop for chars across (the simple-string (car cons-str)) always (char= #\0 chars))
                                         (setf (car chk-digit) #\?))
                                    (and (not (eql (length (car cons-str)) 4))
                                         (setf (car chk-digit) #\?)))))
			 (car chk-digit)
			 (and (loop for chars across (the simple-string (car cons-str)) thereis (char= #\? chars))
			      #\?)
			 (car chk-digit))
		     (or 
                      (and (loop for chars across (the simple-string (cdr cons-str)) always (digit-char-p chars))
                           (not (or (and (loop for chars across (the simple-string (cdr cons-str)) always (char= #\0 chars))
                                         (setf (cdr chk-digit) #\?))
                                    (and (not (eql (length (cdr cons-str)) 4))
                                         (setf (cdr chk-digit) #\?)))))
                      (cdr chk-digit)
                      (and (loop for chars across (the simple-string (cdr cons-str)) thereis (char= #\? chars))
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
(defun dbc-split-comma-field (seo-desc-str)
  (unless (mon:string-null-or-empty-p seo-desc-str)
    (loop 
       :with split-comma = (mon:string-split-on-chars (the simple-string seo-desc-str) ",")
       :for x in split-comma
       :for y = (mon:string-trim-whitespace (the simple-string x))
       :unless (or (eql (length y) 0) (notany #'alpha-char-p y))
       :collect y)))

(defun dbc-convert-1-0-x-field (convert-field)
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
;; (defun dbc-convert-field-to-keyword (field-keyword-pairs &optional key-prefix)
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
alexandria:make-keyword

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
:SEE-ALSO `mon:string-split-on-chars', `dbc-split-roles',
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
`dbc-split-lifespan'`mon:string-split-on-chars', `mon:string-trim-whitespace',
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
 \(\(\"<0+>\"   . \"<YYYY>\"\)  \(-1     . YYYY\)\)~%
 \(\(\"<YYYY>\" . \"<0+>\"\)    \(YYYY-1 . \(lognot YYYY-1\)\)~%
:EXAMPLE~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"1843-1943\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"1843-\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"-1843\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"1843-??\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"??-1843\"\)\)~%~@
;; Following cases are pathological and reasonably acounted for:~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"??-??\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"00-??\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"00-00\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"00-1843\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"1843-00\"\)\)~%~@
;; Following case is pathological and without a clear solution:~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"1843\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"3001-88\"\)\)~%~@
 \(dbc-split-lifespan-string-int-pairs \(dbc-split-lifespan \"88-3001\"\)\)~%~@
When the car of LIFESPAN-STR-PAIR is a string indicating the beginning of
lifespan is an \"unknown\", the car of the second cons of return value is -1.
The intent in using a negative is to allow later callers the oppurtunity to
optimize their checks. For example:~%
\(let* \(\(w-str \"1843-??\"\)
       \(both-lifespan \(dbc-split-lifespan-string-int-pairs
		       \(dbc-split-lifespan w-str\)\)\)
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
lifespan i.e. the string passed from `dbc-split-lifespan' was \"1843-?\", we
don't want inferences about an entities lifespan to return misleadingly and
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
we can be reasonably sure that the integer parse is correct.~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(setf (documentation 'dbc-split-comma-field 'function)
      #.(format nil
"Split a comma delitied dbc field.~%~@
Intended for use with SEO and \"keyword\" like fields in the `refs` table.~%~@
:EXAMPLE~%~@
 \(dbc-split-comma-field  \"air, plane, airplane, Biplane,, aircraft, expo, , dirigible,\"\)~%~@
:NOTE Do not call unless reasonably sure sure that there are never free commas
used in a non-delimiting position, e.g. the following string will not parse correctly:~% 
 \"Havell (Robert, Jr.), Havell (Robert, Sr.), Havell Lithograph, \"~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(setf (documentation 'dbc-convert-1-0-x-field 'function)
      #.(format nil
"Attept to CONVERT-FIELD to a boolean.~%~@
CONVERT-FIELD is a dbc field string value of length one satisfying 
`mon:simple-string-or-null'.~%~@
When CONVERT-FIELD is \"1\" return t.
When CONVERT-FIELD is \"x\" or \"0\" return nil.
When CONVERT-FIELD is some other character or \(> \(length CONVERT-FIELD\) 1\)
return CONVERT-FIELD.~%~@
:EXAMPLE~%
 \(dbc-convert-1-0-x-field  \"1\"\)~%
 \(dbc-convert-1-0-x-field  \"0\"\)~%
 \(dbc-convert-1-0-x-field  \"x\"\)~%
 \(dbc-convert-1-0-x-field  \"X\"\)~%
 \(dbc-convert-1-0-x-field #\\1\)~%
 \(dbc-convert-1-0-x-field #\\0\)~%
 \(dbc-convert-1-0-x-field #\\x\)~% 
 \(dbc-convert-1-0-x-field #\\X\)~%
 \(dbc-convert-1-0-x-field   1\)~%
 \(dbc-convert-1-0-x-field   0\)~%
 \(dbc-convert-1-0-x-field  #\\*\)
 \(dbc-convert-1-0-x-field \"Return Me\"\)~%~@
:SEE-ALSO `<XREF>'.~%►►►"))


;;; ==============================
;;; EOF

