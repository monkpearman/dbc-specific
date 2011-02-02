;;; :FILE-CREATED <Timestamp: #{2011-02-02T10:45:42-05:00Z}#{11053} - by MON>
;;; ==============================


(defparameter *dbc-xml-refs-match* 
  (list "ref"
        "price"
        "year" ;; "year_year"
        "artist"
        "condition")
  "fields needed  when parsing dbc-xml-refs for new york.")

(in-package :dbc)
;; *package*

(defparameter *dbc-xml-source-dir*
  (merge-pathnames
   (make-pathname :directory'(:relative "notes-versioned"
                              "sql-file-per-table-2010-08-25"
                              "from-DBC-ARCH-2010-09-01"
                              ))
   (dbc-base-path *dbc-system-path*)))
;;; #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01/"

(defparameter *dbc-xml-source-file-refs*
  (fad:file-exists-p
   (merge-pathnames
    (make-pathname :name "dump-refs-DUMPING")
    *dbc-xml-source-dir*)))
;; *DBC-XML-SOURCE-FILE-REFS*
;;; #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01/dump-refs-xml"


(defparameter *dbc-xml-dump-file-refs-name*
  (merge-pathnames
   (make-pathname :name "parsed-refs-xml")
   (sub-path *dbc-xml-dump-dir*)))
;; *DBC-XML-DUMP-FILE-REFS-NAME*
;; #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/xml-class-dump-dir/parsed-refs-xml"

(defparameter *dbc-xml-dump-file-refs-temp-name*
  (truename
   (merge-pathnames
    (make-pathname :directory '(:relative "notes-versioned" "scratch-xml-for-parse")
                   ;; :name "example-refs"
                   :name "example-refs-in-short"
                   :type "in")
    (dbc-base-path *dbc-system-path*)))
  "Temporary file for parsing xml refs before handling the whole shebang.~
   Use *dbc-xml-dump-file-refs-name* when ready.")
;; *DBC-XML-DUMP-FILE-REFS-TEMP-NAME*
;; #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/scratch-xml-for-parse/example-refs.in"

(defparameter *dbc-xml-dump-file-refs-out*
  (merge-pathnames 
   (make-pathname :type "out")
   *dbc-xml-dump-file-refs-name*)
  "filename for dumping parsed xml refs file.")

;; *dbc-xml-dump-file-refs-out*

(fmakunbound 'with-new-version-file)


(defmacro with-new-file-renaming-old ((stream file) &body body)
  `(with-open-file (,stream ,file
                            :direction :output
                            :if-exists :rename
                            :if-does-not-exist :create)
     ;;(let ((*print-case* :downcase))
     ,@body))

(let ((mp *dbc-xml-dump-file-refs-out*))
  (with-new-file-renaming-old (s mp)
    (princ "bubba" s)))


(dbc-table-field-parse *dbc-xml-dump-file-refs-temp-name*)

;; (dbc-field-attribs-parse *dbc-xml-dump-file-refs-temp-name*)

;; (and *sql-dump-file* (cxml:make-source *sql-dump-file*)))
;;; ==============================
;; (dbc-table-field-parse *dbc-xml-dump-file-refs-temp-name*)
(defparameter *tt--xml-dmp* nil)
(setf *tt--xml-dmp* (cxml:make-source *dbc-xml-dump-file-refs-temp-name*))

(defun dbc-field-attribs-find (src)
  ;; Return => ":YEAR"
  ;; *tt--xml-dmp*
  (let* ;; (klacks:list-attributes  *tt--xml-dmp*)
        ;; (klacks:get-attribute  *tt--xml-dmp* "name")
      ((attribs     (dbc-field-attribs-parse src))
       (attribs-hd  (and attribs (car attribs)))
       (head-lname  (and attribs-hd (assoc :LOCAL-NAME attribs-hd)))
       (is-name     (and head-lname (string-equal (cdr head-lname) "name")))
       (attrib-valp (and attribs-hd (assoc :VALUE attribs-hd)))
       (attrib-mem  (and attrib-valp 
                         (member (cdr attrib-valp) *dbc-xml-refs-match* :test #'string-equal)))
       (attrib-val  (and attrib-mem (car attrib-mem))))
    (declare (ignore is-name))
    (and attrib-val 
         (setf attrib-val (substitute #\- #\_ (format nil ":~:@(~A~)" attrib-val))))))

;; (dbc-field-attribs-find *tt--xml-dmp*)

(defun dbc-field-attribs-consume-if (src)
  ;; Return => (":YEAR" . "August, 10, 1895") 
  (let* ((get-if (dbc-field-attribs-find  src))
         (consume-it (and get-if (klacks:consume src)))
         (chars-if (and (eql consume-it :start-element)
                        (eql (klacks:peek src) :characters)
                        (cadr (multiple-value-bind (chrs elt) (klacks:consume src)
                                (list chrs elt))))))
    (and chars-if (setf chars-if (cons get-if chars-if)))))


;;; ==============================
(mon:with-new-file (dump-strm *dbc-xml-dump-file-refs-name*)
  (write-string (dbc-xml-refs-field-parse *dbc-xml-source-file-refs*) dump-strm))
;; input <-- *dbc-xml-source-file-refs*
;; #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01/dump-refs-xml"
;; output -->  *dbc-xml-dump-file-refs-name*


;;; ==============================
(defun dbc-xml-refs-field-parse (sql-xml-dmp)
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
			       ;; Convert "ugly_sym" -> ":UGLY-SYM"
                               (let ((conspair (dbc-field-attribs-consume-if s)))
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

(dbc-xml-refs-field-parse *dbc-xml-dump-file-refs-temp-name*)

;;; ==============================
;;; (dbc-field-attribs-parse *dbc-xml-dump-file-refs-temp-name*)
;;; (dbc-field-attribs-consume-if *tt--xml-dmp*)

(values (klacks:consume *tt--xml-dmp*))
(multiple-value-bind (chrs elt) (klacks:consume *tt--xml-dmp*)
  elt)
(klacks:peek *tt--xml-dmp*)
:START-ELEMENT
NIL
"field"
"field"

:END-ELEMENT
NIL
"mysqldump"
"mysqldump"

(klacks:current-lname *tt--xml-dmp*)

(dbc-field-attribs-parse *tt--xml-dmp*)
(step (dbc-field-attribs-find *tt--xml-dmp*))

(string-equal (cdr (assoc :LOCAL-NAME (car (dbc-field-attribs-parse *tt--xml-dmp*)))) "name")
(assoc :VALUE (car (dbc-field-attribs-parse *tt--xml-dmp*)))
(member (cdr (assoc :VALUE (car (dbc-field-attribs-parse *tt--xml-dmp*)))) *dbc-xml-refs-match* :test #'string-equal)

(dbc-field-attribs-find *tt--xml-dmp*)
(dbc-field-attribs-consume-if *tt--xml-dmp*)



;;;; BELOW NOT WORKING/FINISHED 
;;; ==============================

;; (dbc-field-attribs-consume-if *tt--xml-dmp*)

(defun dbc-field-attribs-consume-if (src)
  (let 
      (klacks:with-open-source (s (cxml:make-source *dbc-xml-dump-file-refs-temp-name*)) ;; (cxml:make-source ;;sql-xml-dmp))
        (loop 
           :for key = (klacks:peek s)
           :for gthr-all = ()
           :while key
           :do (loop 
                  :for check-key = (klacks:current-lname s)
                  :for attrib = (dbc-field-attribs-consume-if src)
                  :while (not (or (and (eql check-key :end-element)
                                       (eql (klacks:current-lname s) "row"))
                                  (eql check-key :end-document)))
                  if attrib 
                     collect attrib into gthr-all
                  (klacks:consume s))
                              
                  
                  i
collecting (and get-if
                  :for gthr-row
                  :while (not (or (and (eql (klacks:consume s) :end-element)
                                       (eql (klacks:current-lname s) "row"))
                                  (eql (klacks:current-lname s) "row") :end-document))
                  :if attrib 
                  collect attrib into gthr-row

                  finally (push gthr-row gthr-all))))

           :do (case key 
                 (:start-element 
                  (and (string-equal (klacks:current-lname s) "row")
                       (loop 
                          :for attrib = (dbc-field-attribs-consume-if src)
                          :for gthr-row
                          :while (not (or (and (eql (klacks:consume s) :end-element)
                                               (eql (klacks:current-lname s) "row"))
                                          (eql (klacks:current-lname s) "row") :end-document))
                          :if attrib 
                          collect attrib into gthr-row
                          finally (push gthr-row gthr-all)))))
           :finally (return gthr-all)))
                                       
                                       
                                       
                                   (and (eql (klacks:consume s) :end-document)
                                        (eql (klacks:current-lname s) "row"))
                           
                                           
                                                 
"row"
                           :if (and attrib)
                           (push attrib gthr-row)
                           (if (eql (klacks:consume s) :end-element)
                                       
(loop 
     while (klacks:consume *tt--xml-dmp*))

   :for key = 
(klacks:close-source *tt--xml-dmp*)
:for matched   
                             
                        
                   (and (string-equal (klacks:current-lname *tt--xml-dmp*) "field")
                        
            (klacks:consume src)
              (while dbc-field-attribs-consume-if


(klacks:current-lname *tt--xml-dmp*)

;;; ==============================
;;; EOF
