
;;; :FILE ../dbc-specific/dbc-parse/dbc-xml-sql-parse.lisp
;;; ==============================



(in-package #:dbc)

;;; ==============================
;;; :REQUIRES klacks:peek klacks:with-open-source
;;;           klacks:get-attribute klacks:current-lname
;;;           klacks:current-characters klacks:consume
;;;           cxml:make-source
;;; :CHANGESET 1
;;; :CREATED <Timestamp: #{2010-09-02T20:38:51-04:00Z}#{10354} - by MON>
;;; 
;; 
;; (mon:ref-bind fep
;;     (fad:file-exists-p 
;;      (merge-pathnames (make-pathname :name "dump-artist-infos-xml")
;;                       (sub-path *xml-input-dir*)))
;;   (and fep (field-table-parse-out fep)))
;;
;;
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
;;; ==============================
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



;;; ==============================
;;; :DBC-XML-SQL-PARSE-DOCUMENTATION
;;; ==============================


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



;;; ==============================
;;; EOF

