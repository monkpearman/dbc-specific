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
			      ((equal (klacks:current-lname s) "field")
			       ;; convert "ugly_sym" -> ":UGLY-SYM"
			       (format ous "~%:~A " (string-upcase (substitute  #\- #\_  nm))))
			      (t nil))))
		     (:end-element
		      (when (equal (klacks:current-lname s) "field")
			(format ous "~%")))
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

;; :NOTE Should work for Appeared-in as well.
(defun dbc-split-used-fors (used-for-string)
  ;; (declare (type (or null simple-string) used-for-string))
  (declare (type simple-string used-for-string))
  (loop 
     :with split = (mon:split-string-on-chars used-for-string "|")
     :for x in split 
     :for y = (string-trim " " x)
     :unless (eql (length y) 0) 
     :collect y))

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
:SEE-ALSO `mon:split-string-on-chars'.~%►►►"))

(setf (documentation 'dbc-split-roles 'function)
      #.(format nil
"Split ROLE-STRING on \",\" barriers. Stripp leading/trailing whitespace and \".\"~%~@
Return value is a list of strings.~%~@
Signal an error if ROLE-STRING is neither `null' nor `simple-string-p'.~%~@
:EXAMPLE~%~@
 \(dbc-split-roles
  \"Artist, Illustrator,  Designer, Fashion Illustrator, Fashion Designer.\"\)~%~@
 \(dbc-split-roles
  \"Artist, Illustrator,  Designer, Fashion Illustrator, Fashion Designer .\"\)~%~@
 \(dbc-split-roles \"Artist, \"\)~%~@
 \(dbc-split-roles nil\)~%~@
:SEE-ALSO `dbc-split-used-fors'.~%►►►"))

(setf (documentation 'dbc-split-loc-pre 'function)
      #.(format nil
"Trim leading \"n \" prefix from loc-control fields.~%~@
:EXAMPLE~%~@
 \(dbc-split-loc-pre \"n 83043434\"\)~%~@
 \(dbc-split-loc-pre \"83043434\"\)~%~@
:NOTE This is actually a bad idea as the \"n 95121069\" is canonical...~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

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
:SEE-ALSO `<XREF>'.~%►►►"))

;;; ==============================
;;; EOF

