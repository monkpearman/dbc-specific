;;
;;
;;
;;; -*- mode: LISP -*-

;; (defpackage  #:dbc-parse-sql (:use #:cl #:cxml))
;; (in-package  :dbc-parse-sql)
;; *package*

;; #:dbc-table-field-parse
;; #:dbc-field-str-cons
;; #:dbc-field-cln-x


;; (in-package #:mon-system)
(in-package #:mon)

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
  (declare (type pathname sql-xml-dmp))
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
			;; :WAS 
			;; (cond ((eq (length (string-trim '(#\Page #\Space #\Tab #\Newline #\Return) kcc)) 0)
			;; 	 (format ous " "))
			;; 	(t (format ous "~A" kcc))) ))			
			(or (and (eql (mon::string-trim-whitespace kcc) 0)
				 (format ous " "))
			    (format ous "~A" kcc))))
		     (:end-document
		      (format ous "~%~A~%;;; EOF"  (make-string 68 :initial-element #\;))))
	       (klacks:consume s))
	      ;; (unwind-protect
	      ;; 	   (setf ous-out (get-output-stream-string ous))
	      ;; 	(close ous))
	      ;; ous-out)))
	      (prog1 (setf ous-out (get-output-stream-string ous))
		(close ous))
	      ))))
      

(defun dbc-field-attribs-parse (curr-elt curr-src)
  ;; curr-elt is the current klacks event :start-element
  ;; curr-src is a klacks-source as per return value of `cxml:make-source'
  ;; this is like `klacks:list-attributes' but does not return a structure object.
  (let ((gthr '()))
    (klacks:map-attributes #'(lambda (&rest x)
			     (push x gthr)) *sql-dump*)
    (unless (null gthr)
      (loop 
	 :for x in gthr
	 :for v =  '(:namespace-uri :local-name :qname :value :specified-p)
	 :collecting (nreverse (pairlis v x))))))


(defun split-naf-used-fors (used-for-string)
  (declare (type simple-string used-for-string))
  (loop 
     :with split = (split-string-on-chars used-for-string "|")
     :for x in split 
     :for y = (string-trim " " x)
     :unless (eql (length y) 0) 
     :collect y))

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


;;; ==============================
;;; EOF

