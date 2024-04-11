;;
;;
;;-*- Mode: LISP; Syntax: COMMON-LISP; Package: MON; Encoding: utf-8; Base: 10 -*-
;;; :FILE-CREATED <Timestamp: #{2010-07-03T11:38:16-04:00Z}#{10266} - by MON>
;;; :FILE /home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/PSA-table-parse-notes-2010-07-03.lisp
;;; ==============================

;;; :NOTES 
;;; " " -> (code-char 160) ->  (format nil "~c" #\No-Break-Space)

;; (in-package #:cl-user)

;; (asdf:oos 'asdf:load-op :cxml)
;; (asdf:oos 'asdf:load-op :cxml-stp)
;; (asdf:oos 'asdf:load-op :closure-html)
;; (asdf:oos 'asdf:load-op :arnesi)
;; (asdf:oos 'asdf:load-op :split-sequence)

;; (cl:defpackage #:psa-parse
;;   (:use #:common-lisp #:cxml)) 

;; (in-package #:psa-parse)


(in-package #:dbc)

(eval-when-all

(defvar *psa-fl* nil)

;; (setf *psa-fl*  #P"/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/quick.xml")

(defvar *tr-gthr* nil)

(defvar *curr-src* nil)

) ;; :CLOSE eval-when-all


(defclass psa-handler (sax:default-handler)
  ((tr :accessor tr 
       :initform '() ;; nil
       :documentation "")
   (caption :accessor caption
	    :initform '() ;; nil
	    :documentation 
	    "Holds the parsed table caption.")
   (hdr-col :accessor hdr-col
	    :initform '() ;; nil
	    :documentation "")
   (chars :accessor chars
  	  :initform '() ;; nil
	  :documentation "")
   (gthr :accessor gthr
	 :initform '() ;; nil
	 :documentation "Holder for the SAX gathered events.")
   (in-hdr-col :accessor in-hdr-col
	       :initform '() ;; nil
	       :documentation 
	       "T when we're parsing a SAX element matching the form: <tr class=\"HeaderColumn\">" )
   (in-th-elt :accessor in-th-elt
	      :initform '() ;; nil
	      :documentation 
	      "T when we're parsing a SAX element matching the form: ")
   (in-cptn :accessor in-cptn
	    :initform '() ;; nil
	    :documentation 
	    "T when we're parsing a SAX element matching the form: ")
   (in-td-ttl :accessor in-td-ttl
	      :initform '() ;;nil
	      :documentation 
	      "T when we're parsing a SAX element matching the form: <td class=\"Totals\" { ... }")))

(defmethod sax:start-element ((handler psa-handler)
			      uri local-name qname attributes)
  (let ((cur-elt local-name))
    
    ;; :NOTE does `*tr-gthr*' need to be declared special?
    (when (string-equal "tr" cur-elt)
      (setf *tr-gthr* nil)) 

    (when (and (string-equal "tr" cur-elt)
	       (string-equal "class" sax:attribute-local-name)
	       (string-equal "HeaderColumn" sax:attribute-value))
      (setf (in-hdr-col handler) t))

    (when (and (string-equal "th" cur-elt)
	       (in-hdr-col handler))
      (setf (in-th-elt handler) t))

    (when (string-equal "caption" cur-elt)
      (setf (in-cptn handler) t))))

(defmethod sax:end-element  ((handler psa-handler) uri local-name qname)
  (let ((cur-lnm local-name))
    ;; toggle in-cptn slot
    (when (string-equal "caption" cur-lnm)
      (setf (in-cptn handler) nil))
    ;; :NOTE does `*tr-gthr*' need to be declared special?
    (when (string-equal "tr" cur-lnm)
      (setf *tr-gthr* (nreverse *tr-gthr*))
      (push *tr-gthr* (gthr handler)))
    ;; toggle in-hdr-col slot
    (when (and (string-equal "tr" cur-lnm)
	       (string-equal "class" sax:attribute-local-name)
	       (string-equal "HeaderColumn" sax:attribute-value))
      (setf (in-hdr-col handler) nil))
    ;; toggle in-th-elt slot
    (when (and (string-equal "th" cur-lnm)
	       (in-th-elt handler))
      (setf (in-th-elt handler) nil))))
    
(defmethod sax:characters   ((handler psa-handler) schars)
  (let ((cln-chars schars))
    (cond (;; (when (string-equal "caption" (sax:attribute-local-name ) ;klacks:current-lname current-lname
	   ;;   (push local-name )
	   ( ;;(in-cptn handler)
	    (and ;; (slot-value in-cptn handler)
	     (slot-boundp handler in-cptn)
	     (not (null (in-cptn handler)))
	     (string-equal cln-chars #\NEWLINE)) nil)
 	   ((string-equal cln-chars #\NO-BREAK_SPACE)
	   (progn  (setf cln-chars nil)
		    (push cln-chars *tr-gthr*))) ;; (gthr handler)))
	  (t (progn 
	       (setf cln-chars (string-left-trim '(#\Space) cln-chars))
	       (push (format nil "~a" cln-chars) *tr-gthr*)))))))
(defmethod sax:end-document ((handler psa-handler))
  (setf *tr-gthr* nil)
  (nreverse (gthr handler))
  ;; (push (caption handler) (gthr handler))
  )

(defun html2xhtml (file &key (if-exists :error))
  (with-open-file (out (make-pathname :type "xml" :defaults file)
                     :element-type '(unsigned-byte 8)
                     :if-exists if-exists
                     :direction :output)
     (chtml:parse  (pathname file)
		   (cxml:make-octet-stream-sink out))))


;;; ==============================
;; (defun p/totals-strip-whitespace (strip-str)
;;   #.(format nil "
;; ")

(defun p/totals-strip-commas (maybe-str)
  (if (or (null maybe-str)
	  (funcall (complement #'stringp) maybe-str))
      maybe-str
      (remove #\COMMA maybe-str :test #'char=)))

(defun p/sax-integer-string (str)
  ;;(parse-integer str :junk-allowed t))
  (string-to-number str))

;; (map 'list #'code-char '(#x9 #xa #xd #x20))

(defun p/sax-float-string (str)
  ;;(arnesi:parse-float str))
  (string-to-number str))

(defun p/sax-extract-tr (parse-src)
  ;;  (cxml:parse parse-src (make-instance 'psa-handler)))
  (declare (special *curr-src*))
  (let ((*curr-src* parse-src))
    (cxml:parse *curr-src* (make-instance 'psa-handler))))

;;  (cxml:parse *curr-src* (make-instance 'psa-handler))
;;  (klacks:close-source *curr-src*)))
;;  (chtml:parse parse-src (make-instance 'psa-handler))))


;; (p/sax-extract-tr *psa-fl*)
;; (cxml:parse-file  *psa-fl* (make-instance 'psa-handler))
;; :pars

;;; ==============================
;; <tr class="HeaderColumn"> do once then skip
;; "class" "HeaderColumn"
;; slot-dst <- hdr-col
(defun filter-tr (filter-attr w-attr-value in-attr-list push-key slot-dst) 
  (let ((chk-attr (find filter-attr in-attr-list
			:key #'sax:attribute-local-name
			:test #'string-equal)))
    (when (and chk-attr (string-equal sax:attribute-value w-attr-value))
      (push push-key (slot-dst handler)))))

;; (when (null (hdr-col handler))
;;   (filter-tr "class" "HeaderColumn" attributes ':header-col hdr-col))


;(position "Total" (hdr-col handler) ;;:test #'string-equal :from-end t)

;; (string-equal "Total" 
;; 	      (car (last (assoc :header-col
;; 				'((:header-col "Card No." "Name" "Variety" "Auth" "1Q" "1" "1.5Q" "1.5" "2Q" "2" "2.5" "3Q"
;; 				   "3" "3.5" "4Q" "4" "4.5" "5Q" "5" "5.5" "6Q" "6" "6.5" "7Q" "7" "7.5" "8Q"
;; 				   "8" "8.5" "9Q" "9" "10" "Total"))))))

;;   (when hdr-col
;; )

;; (when (string-equal "table" local-name)
;;   (when (klacks:find-element *curr-src* "caption")
;;     (when (klacks:current-characters *curr-src*)
;; 	(push  (string-trim '(#\NEWLINE #\TAB) 
;; 			    (klacks:current-characters *curr-src*))
;; 	       (caption handler)))))


;;; ==============================
;;; :PSA-PARSE-TABLE-DOCUMENTATION
;;; ==============================

(setf (documentation '*psa-fl* 'variable)
      #.(format nil
  "A file namestring.~%
:EXAMPLE~%~% { ... <EXAMPLE> ... } ~%
:SEE-ALSO `*tr-gthr*', `*curr-src*'.~%▶▶▶"))

(setf (documentation '*tr-gthr* 'variable)
      #.(format nil
"Temporary holder for `sax-extract-tr'.~%
:EXAMPLE~%~% { ... <EXAMPLE> ... } ~%
:SEE-ALSO `*psa-fl*', `*curr-src*'.~%▶▶▶"))

(setf (documentation '*curr-src* 'variable)
      #.(format nil
"The current source-being parsed.~%
Declared special when evaluated in inside `sax-extract-tr'. ~%
:EXAMPLE~%~% { ... <EXAMPLE> ... } ~%
:SEE-ALSO `*tr-gthr*', `*psa-fl*'.~%▶▶▶"))


(setf (documentation 'html2xhtml 'function)
      #.(format nil
"Parse an HTML file and serialize it to XHTML cleaning it on the way.~%
:NOTE From the chtml tutorial.~%
:EXAMPLE~%~% { ... <EXAMPLE> ... } ~%
:SEE-ALSO `<XREF>'.~%▶▶▶"))


(setf (documentation 'p/sax-integer-string 'function)
      #.(format nil
"Parse a string integer value to integer~%
:EXAMPLE~%~%\(p/sax-integer-string \"3.3\"\) => 3~%
\(p/sax-integer-string \"03\"\) => 3~%
:SEE-ALSO `p/sax-float-string', `mon:string-to-number', `arnesi:parse-float',
`parse-integer'.~%▶▶▶"))

(setf (documentation 'p/sax-float-string 'function)
      #.(format nil
 "Parse a \"string float\" value to float.~%
:EXAMPLE~%~%\(p/sax-integer-string \"3.3\"\)~%
\(p/sax-integer-string 3.3\)~%
\(p/sax-integer-string \"03\"\)~%
:SEE-ALSO `p/sax-integer-string', `mon:string-to-number', `arnesi:parse-float'.~%▶▶▶"))

(setf (documentation 'p/totals-strip-commas 'function)
      #.(format nil 
 "If MAYBE-STR is a string remove #\\COMMA chars from MAYBE-STR.~%
Unconditionally returns MAYBE-STR regardless of MAYBE-STR's type and/or whether
#\\COMMA chars were removed.~%
:EXAMPLE~%~%\(p/totals-strip-commas \"3,34\"\)~%
\(p/totals-strip-commas '\(334\)\)~%
\(p/sax-integer-string \(p/totals-strip-commas \"3,34\"\)\)~%
:SEE-ALSO `p/sax-integer-string'.~%▶▶▶"))

(setf (documentation 'p/sax-extract-tr 'function)
      #.(format nil
 "Extract the \"tr\" elements in PARSE-SRC as if by `cxml:parse'.~%
Dynamically binds parse-src to special variable `*curr-src*'.~%
:EXAMPLE~%~% { ... <EXAMPLE> ... } ~%
:SEE-ALSO `<XREF>'.~%▶▶▶"))


;;; ==============================
;;; EOF
