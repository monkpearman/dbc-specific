;;; :FILE ../dbc-specific/dbc-parse/dbc-xml-sql-parse.lisp
;;; ==============================


(in-package #:dbc)
;; *package*

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


(defun field-parse-attribs (curr-src)
  ;; :NOTE This declaration was moved higher up the class hierarchy b/c we
  ;; might also be using a tapping source. Not sure if this is relevant or not.
  ;; :WAS (declare (type cxml::cxml-source curr-src))
  (declare (type KLACKS:SOURCE curr-src))
  (when (start-element-p curr-src)
    ;; (multiple-value-bind (peek-key) 
    ;;     (KLACKS:PEEK curr-src)
    ;;   (eql peek-key :start-element))
    (let ((gthr-attribs '()))
      (KLACKS:MAP-ATTRIBUTES #'(lambda (&rest mapped-attribs)
                                 (push mapped-attribs gthr-attribs)) curr-src)
      (unless (null gthr-attribs)
        (loop 
           :with attrib-keys = '(:namespace-uri :local-name :qname :value :specified-p)
           :for curr-attrib in gthr-attribs
           :collect (nreverse (pairlis attrib-keys curr-attrib)) into rtn-attribs
           :finally  (setf gthr-attribs rtn-attribs)))
      gthr-attribs)))

;; (defun (field-parse-attribs-if (source if-element-local if-attrib-local

(defun start-element-p (source)
  ;; Whether current-event is :END-ELEMENT.
  ;; Return as if by `cl:values':
  ;;  - <BOOLEAN>
  ;;  - the current element (if any)
  (let ((peek-key (klacks:peek source)))
    (values (eql peek-key :start-element)  peek-key)))

(defun end-element-p (source)
  ;; Whether current-event is :END-ELEMENT.
  ;; Return as if by `cl:values':
  ;;  - <BOOLEAN>
  ;;  - the current element (if any)
  (let ((peek-key (klacks:peek source)))
    (values (eql peek-key :end-element) peek-key)))


(defun end-element-and-local-present-p (source &key (element-expect "row"))
  (declare (string element-expect))
  (when (end-element-p  source)
    (let ((chk-local (klacks:current-lname source)))
      (and chk-local ;; (stringp chk-local) ???
           (string= chk-local element-expect)
           chk-local))))


(fundoc 'end-element-and-local-present-p
"Whether current-event is :END-ELEMENT and its lname is `cl:string=' ELEMENT-EXPECT.~%~@
ELEMENT-EXPECT is a string. Default is \"row\".~%~@
:EXAMPLE~%
 \(end-element-and-local-present-p <SOURCE>\)
 \(end-element-and-local-present-p *tt-source* :element-expect \"field\"\)
:SEE-ALSO `<XREF>'.~%►►►")

;; (klacks:with-open-source (s (cxml:make-source "<row name=\"row\">row data</row>"))
;;   (let ((gthr '()))
;;     (push (klacks:consume s) gthr)
;;     (push (klacks:consume s) gthr )
;;     (push (klacks:consume s) gthr )
;;     (push (klacks:consume s) gthr )
;;     gthr))

(defun start-element-and-attribute-present-p (source &key (element-local "field")
                                              (attrib-local "name")
                                              attrib-expect)
  (declare (string element-local attrib-local attrib-expect))
  (when (start-element-p source)
    (multiple-value-bind (key nm-space local qualified) (klacks:peek source)
      (declare (ignore nm-space qualified))
      (let ((attrib-if (and (and key (eql key :start-element))
                            (and local (string= element-local local))
                            (klacks:get-attribute source attrib-local))))
        (and attrib-if (string= attrib-if attrib-expect) attrib-expect)))))

(declaim (inline field-attribs-find-normalize-names))
(defun field-attribs-find-normalize-names (enumerated-attrib-names)
  (declare ((or list vector hash-table) enumerated-attrib-names)
           (optimize (speed 3)))
  (when (mon:string-null-empty-or-all-whitespace-p enumerated-attrib-names)
    (return-from field-attribs-find-normalize-names nil))
  (let ((rtn-nrmlzd
         (etypecase enumerated-attrib-names
           (list   enumerated-attrib-names)
           (string (list enumerated-attrib-names))
           (vector (map 'list #'identity enumerated-attrib-names))
           (hash-table (mon:hash-get-keys enumerated-attrib-names)))))
    (declare (list rtn-nrmlzd))
    (remove-if-not #'mon:string-not-null-empty-or-all-whitespace-p rtn-nrmlzd)))


;; *xml-refs-match-list*
;; (declare (special *xml-refs-match-list*))
(defun field-attribs-find (src &key attrib-names)
  ;; Return => ":YEAR"
  ;; Keyword ATTRIB-NAMES is an object holding a string(s) each of which is a
  ;; valid value for an element's name attribute, e.g.:
  ;;  <field name="<ATTRIB-NAME>"> ... STUFF ... </field>
  ;; 
  ;; :NOTE Keyword ATTRIB-NAMES is normalized with `field-attribs-find-normalize-names'.
  ;; :SEE-ALSO `klacks:list-attributes', `klacks:get-attribute'."
  (declare ((or list vector hash-table) attrib-names)
           (inline field-attribs-find-normalize-names)
           (optimize (speed 3)))
  (let ((attrib-nms-nrmlz (field-attribs-find-normalize-names attrib-names)))
    (when (null attrib-nms-nrmlz)
      (return-from field-attribs-find nil))
    (locally (declare (mon:each-a-string attrib-nms-nrmlz))
      (let* ;; (klacks:list-attributes  *tt--xml-dmp*)
          ;; (klacks:get-attribute  *tt--xml-dmp* "name")
          ;; :NOTE Would be much better to use
          ;; `start-element-and-attribute-present-p' here.
          ((attribs     (field-parse-attribs src))
           (attribs-hd  (and attribs (car attribs)))
           (head-lname  (and attribs-hd (assoc :LOCAL-NAME attribs-hd)))
           (is-name     (and head-lname (string-equal (cdr head-lname) "name")))
           (attrib-valp (and attribs-hd (assoc :VALUE attribs-hd)))
           (attrib-mem  (and attrib-valp 
                             (member (cdr attrib-valp) attrib-nms-nrmlz :test #'string-equal)))
           (attrib-val  (and attrib-mem (car attrib-mem))))
        (declare (ignore is-name))
        (and attrib-val 
             ;; :WAS (setf attrib-val (substitute #\- #\_ (format nil ":~:@(~A~)" attrib-val))) ))) 
             (setf attrib-val (field-name-underscore-to-dash attrib-val t)) )))))

(defun field-attribs-consume-if (src &key attrib-names)
  ;; Return => (":YEAR" . "August, 10, 1895")
  ;; 
  (let* ((get-if (field-attribs-find src))
         (consume-it (and get-if (klacks:consume src)))
         (chars-if (and (eql consume-it :start-element) 
                        (eql (klacks:peek src) :characters)
                        (cadr (multiple-value-bind (chrs elt) (klacks:consume src)
                                (list chrs elt)))))
	 ;; (cln-if (gethash get-if *xml-refs-match-table*))
	 ;; (cln-with (or 
	 ;;             (and cln-if 
	 ;;               (... dispatch to cleaning function 
	 ;;               (funcall cln-if chars-if  ...)))
	 )

    (and chars-if (setf chars-if (cons get-if chars-if)))))



(defun end-document-find-and-close (source)
  ;; (typep *tt-source* 'cxml::cxml-source)
  ;; (RUNES:XSTREAM-P *tt-source*)
  ;;(or (not (typep source 'RUNES:XSTREAM ))
  ;; (runes:xstream-encoding (cxml::source-xstream  *tt-source*))
  ;; (runes:xstream-p (cxml::source-xstream  *tt-source*))
  ;; (cxml::source-stream-name *tt-source*)
  ;; (and (slot-exists-p source 'cxml::current-key)
  ;;      (slot-boundp source 'cxml::current-key)
  ;;      (slot-value source 'cxml::temporary-streams)
  ;; (not (typep *tt-source* 'CXML::CXML-SOURCE))
  ;; (eql (klacks:peek *tt-source*)
  ;; (eql (KLACKS:FIND-EVENT *tt-source* :end-document) :end-document)
  ;; (when (or (not (typep source 'CXML::CXML-SOURCE))
  ;;           (not (typep source 'KLACKS:TAPPING-SOURCE))
  ;;           (not (typep source 'KLACKS:SOURCE)))
  ;; (return-from end-document-find-and-close 
  ;; (values nil (type-of source)))) 
  ;;    "not type"))
  (typecase source 
    (cxml::cxml-source t)
    ;; (return-from end-document-find-and-close  "CXML::CXML-SOURCE"))
    (klacks:tapping-source  t)
    ;; (return-from end-document-find-and-close  "KLACKS:TAPPING-SOURCE"))
    (klacks:source  t)
    ;; (return-from end-document-find-and-close  "KLACKS:SOURCE"))
    (t (return-from end-document-find-and-close  "not-type")))
  (when (eql (klacks:peek source) :bogus) ;; :SEE cxml::fill-source 
    (return-from end-document-find-and-close 
      (values (klacks:peek source) source)))
  (unwind-protect
       (if (klacks:find-event source :end-document)
           (do ((i (klacks:consume source) 
                   (klacks:consume source)))
               ((null i) 
                (klacks:close-source source)))
           (do ((i (klacks:consume source) 
                   (klacks:consume source)))
               ((null i) 
                (klacks:close-source source))))
    (klacks:close-source source))
  (values (null (multiple-value-list (klacks:peek-value source))) source))

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


;;; ==============================
;;; :DBC-XML-SQL-PARSE-DOCUMENTATION
;;; ==============================


(fundoc  'field-table-parse-out
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

(fundoc 'field-parse-attribs
"Map the attributes of the current klacks event.~%~@
CURR-SRC is a klacks-source as per return value of `cxml:make-source'.~%~@
The current klacks event should be `:START-EVENT`, e.g.:~%
\(values \(klacks:peek CURR-SRC\)\)~%~@
 => :START-EVENT~%~@
If so retrun value is a list of elements each the form:~%
 \(\(:NAMESPACE-URI . <BOOLEAN>\)
  \(:LOCAL-NAME    . \"<LOCAL-NAME>\"\)
  \(:QNAME         . \"QNAME\"\)
  \(:VALUE         . \"<VALUE>\"\)
  \(:SPECIFIED-P   . <BOOLEAN>\)\)~%~@
:EXAMPLE~%
 \(klacks:with-open-source 
     \(s \(cxml:make-source \"<field name=\\\"name 1\\\" name2=\\\"name 2\\\" name3=\\\"\\\">10</field>\"\)\) 
   \(klacks:find-element s \"field\"\)
   \(field-parse-attribs s\)\)~%
 \(klacks:with-open-source 
     \(s \(cxml:make-source \"<field name=\\\"name 1\\\" name2=\\\"name 2\\\" name3=\\\"\\\">10</field>\"\)\) 
   \(klacks:find-element s \"field\"\)
   \(klacks:list-attributes s\)\)~%~@
:NOTE Like `klacks:list-attributes' but does not returns a list of conses
instead of structure object.~%~@
:SEE-ALSO `klacks:map-attributes'.~%►►►")

(fundoc 'field-attribs-find-normalize-names
"Convert ENUMERATED-ATTRIB-NAMES to a list of strings.~%~@
Helper function for `dbc:field-attribs-find'.~%~@
ENUMERATED-ATTRIB-NAMES is an object of type:~%
 list string vector hash-table~%
When object is of type `cl:hash-table' return value is a list of its keys.~%
Signal an error if not.~%~@
When elts of ENUMERATED-ATTRIB-NAMES do not satisfy
`mon:string-not-null-empty-or-all-whitespace-p' they will be removed as if by
`cl:remove-if-not' from return value.~%
:EXAMPLE~%
 \(field-attribs-find-normalize-names \"ref\"\)~%
 \(field-attribs-find-normalize-names \"\"\)~%
 \(field-attribs-find-normalize-names *xml-refs-match-table*\)~%
 \(field-attribs-find-normalize-names '\(\"ref\" \"price\" \"year\" \"artist\" \"condition\"\)\)~%
 \(field-attribs-find-normalize-names  '\(\"ref\" nil \"price\" 8 \"year\" \"\" \"artist\" \"condition\"\)\)~%
 \(field-attribs-find-normalize-names  #\(\"ref\" \"price\" \"year\" \"artist\" \"condition\"\)\)~%
 \(field-attribs-find-normalize-names  #\(\"ref\" nil \"price\" 8 \"year\" \"\" \"artist\" \"condition\"\)\)~%
:SEE-ALSO `mon:hash-get-keys'.~%►►►")

(fundoc 'start-element-and-attribute-present-p
"Whether current klacks event has an attribute with value matching ATTRIB-EXPECT.~%~@
Return ATTRIB-EXPECT when following constraints are met:~%
 - current event is :start-element~%
 - value of its `klacks:current-lname' matches ELEMENT-LOCAL~%
 - value of `klacks:get-attribute' for ATTRIB-LOCAL is `cl:string=' ATTRIB-EXPECT~%~@
Arg SOURCE is the current cxml-source being parsed.
It is an object suitable for use an argument to `klacks:peek'.~%~@
Keyword ELEMENT-LOCAL default is a string naming an elments lname \(Local Name\).
Default is \"field\".~%~@
Keyword ATTRIB-LOCAL is a string naming an attribute of element. 
Default is \"name\".~%~@
Keyword ATTRIB-EXPECT is a string naming an attribute value expected.~%~@
:EXAMPLE~%
 \(klacks:with-open-source \(s \(cxml:make-source \"<field name=\\\"ref\\\">2766</field>\"\)\)
   \(klacks:find-event s :start-element\) ;; :NOTE Usage of `klacks:find-event' ;
   \(start-element-and-attribute-present-p s
                                          :element-local \"field\" 
                                          :attrib-local \"name\"
                                          :attrib-expect \"ref\"\)\)~%
 \(klacks:with-open-source \(s \(cxml:make-source \"<field name=\\\"ref\\\">2766</field>\"\)\)
   \(start-element-and-attribute-present-p s
                                          :element-local \"field\" 
                                          :attrib-local \"name\"
                                          :attrib-expect \"ref\"\)\)~%~@
:SEE-ALSO `start-element-and-attribute-value-present-p'.~%►►►")

;;; 
;; (fundoc 'start-element-and-attribute-value-present-p
;; "Like `start-element-and-attribute-present-p' but also checks that
;; ATTRIB-LOCAL's value is `cl:string=' ATTRIB-EXPECT.~%~@
;; Return as if by cl:values:
;;  - <BOOLEAN> T when ATTRIB-EXPECT matched ATTRIB-LOCAL's value~%~@
;;  - [ ATTRIB-EXPECT | <WHAT-WAS-FOUND> ]~%~@
;; :EXAMPLE~%~@
;;  \(klacks:with-open-source \(s \(cxml:make-source \"<field name=\\\"ref\\\">2766</field>\"\)\)
;;    \(klacks:find-event s :start-element\)
;;    \(start-element-and-attribute-value-present-p s
;;                                           :element-local \"field\" 
;;                                           :attrib-local \"name\"
;;                                           :attrib-expect \"ref\"\)\)~%~@
;;  \(klacks:with-open-source \(s \(cxml:make-source \"<field name=\\\"ref\\\">2766</field>\"\)\)
;;    \(klacks:find-event s :start-element\)
;;    \(start-element-and-attribute-value-present-p s
;;                                           :element-local \"field\" 
;;                                           :attrib-local \"name\"
;;                                           :attrib-expect \"not-ref\"\)\)~%
;; :SEE-ALSO `<XREF>'.~%►►►")



(fundoc 'end-document-find-and-close
"Find SOURCE's :end-document event (if any) with `klacks:find-event'.~%~@
If event is found consume it with `klacks:consume' and evaluate
`klacks:close-source' making sure that source is close.~%~@
Return value when source is closed. is as if by the form: (values) e.g.:~%
 => ; No value 
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
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

