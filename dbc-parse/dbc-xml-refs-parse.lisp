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


(defun make-ref-maker-sym-name (ref-parse-field)
  ;; (make-ref-maker-sym-name "ref") => "REF-PARSED-REF"
  (and (mon:string-not-null-or-empty-p ref-parse-field)
       (nth 0 (make-parsed-class-slot-accessor-name ref-parse-field "parsed-ref"))))

(defun make-ref-maker-symbol (sym-name)
  ;; (make-ref-maker-symbol "ref")
  ;; (symbolp (make-ref-maker-symbol "ref"))
  (let ((mk-sym (make-ref-maker-sym-name sym-name)))
    (and mk-sym (read-from-string (make-ref-maker-sym-name sym-name)))))

(defun make-ref-lookup-table (ref-list)
  ;; (make-ref-lookup-table (list "ref" "price" "year" "artist" "condition"))
  (let ((ref-hash (make-hash-table :test 'equal)))
    (loop
       :for ref :in ref-list
       :collecting (cons ref (make-ref-maker-symbol ref)) into tbl
       :finally (loop
                   :for (key . val) :in tbl
                   :do (setf (gethash key ref-hash) val)))
    ref-hash))

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
;;; ==============================

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
;;; EOF
