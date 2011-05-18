;;; :FILE-CREATED <Timestamp: #{2011-02-14T13:27:28-05:00Z}#{11071} - by MON>
;;; :FILE ../dbc-parse/dbc-xml-refs-parse.lisp
;;; ==============================

;;; ==============================
;; An event is a thing that represents parser state. 
;; Most events are open/closing of elements and denote state changes.
;; An event is _not_ the element itself i.e. it doesn't identify the element.
;; , e.g.: 
;; <field   ;; opens field  :START-ELEMENT
;; </field> ;; closes field :END-ELEMENT
;; In both of the cases the element name/identity is "field". 
;; The events are the respecive opening and closing of the element
;; events include:
;; :start-element :end-element
;; :start-document :end-document
;; :characters 
;; :comment
;; :dtd
;; :processing-instruction ???
;;
;; An attribute is a property of an event e.g.:
;; <field name=""
;;        ^^^-- Attribute
;; An attribute value is the property's value, e.gl:
;; <field name="some thing"
;;              ^^^^^^^^^^-- Attribute value

;;; ==============================

(in-package #:dbc)
; *package*

;;; ==============================
;; `*dbc-notes-dir*'
;; `*xml-output-dir*'           ---> OUTPUT
;; `*xml-output-refs-name*'     ---> OUTPUT
;; `*xml-output-refs-ext*'      ---> OUTPUT
;; `*xml-input-dir*'            <--- INPUT
;; `*xml-input-refs-name*'      <--- INPUT
;; `*xml-input-refs-name-temp*' <--- INPUT
;; 
;; ---> OUTPUT
;; *xml-output-refs-name*
;; "../dbc-specific/xml-class-dump-dir/parsed-refs-xml"
;;
;; *xml-output-refs-ext*
;; (fad:file-exists-p *xml-output-refs-ext*)

;;; ==============================
;; <--- INPUT
;; *xml-input-refs-name*
;; "../dbc-specific/notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01/dump-refs-xml"
;;
;; *xml-input-refs-name-temp*
;; "../dbc-specific/notes-versioned/scratch-xml-for-parse/"
;; "../notes-versioned/scratch-xml-for-parse/example-refs.in"
;; "../dbc-specific/notes-versioned/scratch-xml-for-parse/example-refs-in-short.in"

;; (field-parse-attribs *xml-input-refs-name-temp*)

;;; ==============================
;; XML Parsing INPUT/OUTUPT paths and paths names
;; `*system-notes-dir*'
;; `*xml-output-dir*'              ---> OUTPUT
;; `*xml-output-refs-name*'        ---> OUTPUT
;; `*xml-output-refs-ext*'         ---> OUTPUT
;; `*xml-input-dir*'               <--- INPUT
;; `*xml-input-refs-name*'         <--- INPUT
;; `*xml-input-refs-name-temp*'    <--- INPUT
;;
;; (system-described *system-tests-dir* t)
;; (system-described *system-tests-temp-dir* t)
;; (system-described *system-path* t)
;; (system-described *system-notes-dir* t)
;; (system-base-path *system-path*)
;; (sub-path *system-notes-dir*))
;; (sub-path *xml-input-dir*)
;; (system-described *xml-input-dir* nil)
;; (sub-path *xml-output-dir*)
;; (system-described *xml-input-dir* nil)
;; *xml-output-refs-name*
;; *xml-input-refs-name*
;; *xml-input-refs-name-temp*
;;; ==============================

;;; ==============================
;;; ==============================
(defun start-element-and-attribute-present-p (source &key (element-local "field")
                                              (attrib-local "name")
                                              attrib-expect )
  ;; Whether current klacks event has an attribute with value matching ATTRIB-EXPECT.
  ;; Return ATTRIB-EXPECT when following constraints are met:
  ;; current event is :start-element 
  ;; the value of its klacks:current-lname matches ELEMENT-LOCAL
  ;; The value of klacks:get-attribute for ATTRIB-LOCAL is `cl:string=' ATTRIB-EXPECT.
  ;; SOURCE is the current cxml-source being parsed. 
  ;; It is an object suitable for use an argument to klacks:peek.
  ;; Keyword ELEMENT-LOCAL default is a string naming an elmenets lname. default is "field"
  ;; Keyword ATTRIB-LOCAL is a string naming an attribute of element.  default is "name"
  ;; Keyword ATTRIB-EXPECT is a string naming an attribute value expected.
  ;; :EXAMPLE
  ;; (klacks:with-open-source (s (cxml:make-source "<field name=\"ref\">2766</field>"))
  ;;   (klacks:find-event s :start-element)
  ;;   (start-element-and-attribute-present-p s
  ;;                                          :element-local "field" 
  ;;                                          :attrib-local "name"
  ;;                                          :attrib-expect "ref"))
  ;; (klacks:with-open-source (s (cxml:make-source "<field name=\"ref\">2766</field>"))
  ;;   (start-element-and-attribute-present-p s
  ;;                                          :element-local "field" 
  ;;                                          :attrib-local "name"
  ;;                                          :attrib-expect "ref"))
  (declare (string element-local attrib-local attrib-expect))
  (multiple-value-bind (key nm-space local qualified) (klacks:peek *tt-source*)
    (declare (ignore nm-space qualified))
    ;;(list key nm-space local qualified))
    (let ((attrib-if (and (and key (eql key :start-element))
                          (and local (string= element-local local))
                          (klacks:get-attribute source attrib-local))))
      (and attrib-if (string= attrib-if attrib-expect) attrib-expect))))

(defun end-document-find-and-close (source)
  ;; Find SOURCE's :end-document event (if any) with klacks:find-event.  consume
  ;; it with `klacks:consume' then evaluate `klacks:close-source' making sure that
  ;; source is close. Return value is as if by (values) e.g. => ; No value when
  ;; source is closed.
  ;;
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
    (CXML::CXML-SOURCE t)
    ;; (return-from end-document-find-and-close  "CXML::CXML-SOURCE"))
    (KLACKS:TAPPING-SOURCE  t)
    ;; (return-from end-document-find-and-close  "KLACKS:TAPPING-SOURCE"))
    (KLACKS:SOURCE  t)
    ;; (return-from end-document-find-and-close  "KLACKS:SOURCE"))
    (t (return-from end-document-find-and-close  "not-type")))
  (when (eql (KLACKS:PEEK source) :bogus) ;; :SEE cxml::fill-source 
    (return-from end-document-find-and-close 
      (values (KLACKS:PEEK source) source)))
  (unwind-protect
       (if (KLACKS:FIND-EVENT source :end-document)
           (do ((i (KLACKS:CONSUME source) 
                   (KLACKS:CONSUME source)))
               ((null i) 
                (KLACKS:CLOSE-SOURCE source)))
           (do ((i (KLACKS:CONSUME source) 
                   (KLACKS:CONSUME source)))
               ((null i) 
                (KLACKS:CLOSE-SOURCE source))))
    (KLACKS:CLOSE-SOURCE source))
  (values (null (multiple-value-list (KLACKS:PEEK-VALUE source))) source))

(defun field-attribs-find (src)
  ;; Return => ":YEAR"
  (declare (special *xml-refs-match-list*))
  (let* ;; (klacks:list-attributes  *tt--xml-dmp*)
      ;; (klacks:get-attribute  *tt--xml-dmp* "name")
      ((attribs     (field-parse-attribs src))
       (attribs-hd  (and attribs (car attribs)))
       (head-lname  (and attribs-hd (assoc :LOCAL-NAME attribs-hd)))
       (is-name     (and head-lname (string-equal (cdr head-lname) "name")))
       (attrib-valp (and attribs-hd (assoc :VALUE attribs-hd)))
       (attrib-mem  (and attrib-valp 
                         (member (cdr attrib-valp) *xml-refs-match-list* :test #'string-equal)))
       (attrib-val  (and attrib-mem (car attrib-mem))))
    (declare (ignore is-name))
    (and attrib-val 
         ;; :WAS (setf attrib-val (substitute #\- #\_ (format nil ":~:@(~A~)" attrib-val))) ))) 
         (setf attrib-val (field-name-underscore-to-dash attrib-val t)) )))

(defun field-attribs-consume-if (src)
  ;; Return => (":YEAR" . "August, 10, 1895") 
  (let* ((get-if (field-attribs-find  src))
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


(defun field-parse-refs (sql-xml-dmp)
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
		      ;;(let ((nm (klacks:get-attribute s "name")))
                      (cond ((equal (klacks:current-lname s) "row")
			       (format ous "~A~%" (make-string 68 :initial-element #\;)))
                            ;; :NOTE What about when there are multiple attributes?
                            ;; This doesn't happen in the current case but it
                            ;; will if we ever try to generalize around this function.
			      ((equal (klacks:current-lname s) "field")
			       ;; :NOTE Parsing happens here with `field-attribs-consume-if'
			       (let ((conspair (field-attribs-consume-if s)))
                                 (and conspair
                                      (format ous "~A~14T~A~% " (car conspair) (cdr conspair)))))
			      (t nil)))
		     ;;; Don't do so much whitespace.
                     ;; (:end-element
		     ;;  (when (equal (klacks:current-lname s) "field")
		     ;;    (format ous "~%")))
                     ;; ==============================
		     ;; Ideally these are only :CHARACTERS events related to
		     ;; formatting of the XML docs body, e.g. events occuring
		     ;; outside of any :START-ELEMENT/:END-ELEMENT event blocks.
		     ;; Don't need for parsing xml refs for show:
                     ;; (:characters 
		     ;;  (let ((kcc (klacks:current-characters s)))
		     ;;    (or (and (eql (mon:string-trim-whitespace kcc) 0)
		     ;;    	 (format ous " "))
		     ;;        (format ous "~A" kcc))))
		     ;; (:comment <DO-SOMETHING-HERE???>) 
		     (:end-document
		      (format ous "~%~A~%;;; EOF"  (make-string 68 :initial-element #\;))))
	       (klacks:consume s))
	    (prog1 (setf ous-out (get-output-stream-string ous))
              (close ous))))))

;; (field-parse-refs *dbc-xml-dump-file-refs-temp-name*)


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
