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
;;
;;; ==============================


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
;; "../dbc-specific/xml-class-dump-dir/parsed-inventory-records-xml"
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


(in-package #:dbc)

(defun field-parse-refs (sql-xml-dmp)
  (declare (pathname  sql-xml-dmp))
  ;; Should ous use flexi instead of CL:MAKE-STRING-OUTPUT-STREAM?  No, probably
  ;; not b/c the docs for CXML does its own UTF-8 conversion around SOURCE and
  ;; has interesting things to say about what happens w/r/t UTF-8 data when
  ;; SOURCE is string-like and explicitly warns that care should be taken to
  ;; when additional encoding conversions may occur or have occured.  Look into
  ;; this further. -- 2011-05-20
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
         (klacks:with-open-source (s (CXML:MAKE-SOURCE sql-xml-dmp))
           (loop
	       :for key = (KLACKS:PEEK s)
	       :while key
	       :do (case key
		     (:start-element
		      ;;(let ((nm (klacks:get-attribute s "name")))
                      (cond ((equal (KLACKS:CURRENT-LNAME s) "row")
			       (format ous "~A~%" (make-string 68 :initial-element #\;)))
                            ;; :NOTE What about when there are multiple attributes?
                            ;; This doesn't happen in the current case but it
                            ;; will if we ever try to generalize around this function.
			      ((equal (KLACKS:CURRENT-LNAME s) "field")
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
	       (KLACKS:CONSUME s))
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
