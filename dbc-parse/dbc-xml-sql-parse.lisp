;;; :FILE ../dbc-specific/dbc-parse/dbc-xml-sql-parse.lisp
;;; ==============================


(in-package #:dbc)

;; :SOURCE cl-ace-6_5/util.lis
(defmacro with-namespaces (bindings &body body)
  (if (endp bindings) `(progn ,@body)
    (destructuring-bind ((prefix uri) &rest bindings) bindings
      (if (endp bindings)
        `(cxml:with-namespace (,prefix ,uri)
           ,@body)
        `(cxml:with-namespace (,prefix ,uri)
           (with-namespaces ,bindings
             ,@body))))))

;; :SOURCE cl-ace-6_5/util.lisp
;; :NOTE This macro kept here for example purposes.
;; :NOTE documented in :FILE dbc-specific/dbc-docs.lisp
(defmacro with-soap-envelope ((prefix &rest bindings) &body body)
  (let ((pre (gensym (string '#:prefix-))))
    `(let ((,pre ,prefix))
       (cxml:with-xml-output (cxml:make-rod-sink)
         (cxml:with-namespace (,pre "http://schemas.xmlsoap.org/soap/envelope/")
           (with-namespaces ,bindings 
             (cxml:with-element* (,pre "Envelope")
               (cxml:with-element* (,pre "Body")
                 ,@body))))))))


;; :SOURCE cl-rdfxml-20110418-svn/rdfxml.lisp
;; with comment "thanks to Red Daly, reddaly@gmail.com"
(defun peek-skipping-comments (source)
  (loop
     while (eq :comment (klacks:peek source))
     do (klacks:consume source)
     finally (return (klacks:peek source))))

(defun xml-whitespace-p (string)
  (and (stringp string)
       (mon:string-all-whitespace-p  string)))

;; :NOTE In an ideal world we would also check for presence of xml:space
;; attribute and _not_ consume when it is PRESERVE.  However, as this attribute
;; is applicable to child descendants (unless overridden) keeping track of when
;; the preserve attribute is in effect is a PITA...
;;
;;
;; ,----
;; | For some applications, the values of the three data points matter more than the
;; | pretty-printing. For document-oriented XML applications, white space
;; | preservation can be critical.
;; | 
;; | Document authors can use the xml:space attribute to identify portions of
;; | documents where white space is considered important. Style sheets can also use
;; | the xml:space attribute as a hook to preserve white space in
;; | presentation. However, because many XML applications do not understand the
;; | xml:space attribute, its use is considered advisory.
;; | 
;; | The xml:space attribute accepts two values:
;; | 
;; |  - default  -- This value allows the application to handle white space as
;; |                necessary. Not including an xml:space attribute produces the same
;; |                result as using the default value.
;; |  - preserve -- This value instructs the application to maintain white space as
;; |                is, suggesting that it might have meaning.
;; | 
;; | The values of xml:space attributes apply to all descendants of the element
;; | containing the attribute unless overridden by one of the child elements.
;; |
;; | <poem xml:space="default">
;; |   <author>
;; |     <givenName>Alix</givenName>
;; |     <familyName>Krakowski</familyName>
;; |   </author>
;; |   <verse xml:space="preserve">
;; |     <line>Roses   are  red,</line>
;; |     <line>Violets  are  blue.</line>
;; |     <signature xml:space="default">-Alix</signature>
;; |   </verse>
;; | </poem>
;; |
;; `----  :SOURCE (URL `http://msdn.microsoft.com/en-us/library/ms256097.aspx')
;;
(defun consume-whitespace (source &key (consume-comment t)
                                       (consume-dtd t) 
                                       (consume-start-document t))
  (declare (optimize (speed 3))
           (boolean consume-dtd consume-start-document consume-comment))
  (let ((last-consumed '()))
    (labels ((register-consumed ()
               (push (klacks:consume source) last-consumed))
             (consume-if () 
               (let ((event (klacks:peek source)))
                 (or (and (eq :characters event)
                          (xml-whitespace-p (klacks:peek-value source))
                          (register-consumed))
                     (and consume-comment
                          (eq :comment event)
                          (register-consumed))
                     (and consume-dtd 
                          (eq :dtd event)
                          (register-consumed))
                     (and consume-start-document 
                          (eq :start-document event)
                          (register-consumed))))))
      (loop 
         for x  = (consume-if)
         while x
         do    (consume-if)
         finally (return (if last-consumed 
                             (values t (nreverse last-consumed))
                             (values nil nil)))))))


;;; ==============================
;;; :REQUIRES klacks:peek klacks:with-open-source
;;;           klacks:get-attribute klacks:current-lname
;;;           klacks:current-characters klacks:consume
;;;           cxml:make-source
;;; :CREATED <Timestamp: #{2010-09-02T20:38:51-04:00Z}#{10354} - by MON>
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
  (let ((peek-key (klacks:peek source)))
    (values (eql peek-key :start-element)  peek-key)))

(defun end-element-p (source)
  (let ((peek-key (klacks:peek source)))
    (values (eql peek-key :end-element) peek-key)))

(defun end-element-and-local-present-p (source &key (element-expect "row"))
  (declare (string element-expect))
  (when (end-element-p  source)
    (let ((chk-local (klacks:current-lname source)))
      (and chk-local ;; (stringp chk-local) ???
           (string= chk-local element-expect)
           chk-local))))

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

;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:


;;; ==============================
;;; EOF

