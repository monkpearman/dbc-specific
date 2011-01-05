;;; :FILE-CREATED <Timestamp: #{2011-01-03T21:36:45-05:00Z}#{11011} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/dbc-sql-lisp-convert-notes/dbc-klacks-parse-to-class-notes-2011-01-03.lisp
;;; ==============================

(setf *default-pathname-defaults* #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/mon-systems/")


(defpackage #:scratch (:use :cl :mon :dbc))

(in-package :scratch)

*package*

(mon::dbc-table-field-parse 
 (make-pathname :directory '(:absolute 
			     "home" 
			     "sp" 
			     "HG-Repos"
			     "CL-repo-HG" 
			     "CL-MON-CODE"
			     "dbc-specific"
			     "dbc-sql-lisp-convert-notes"
			     "sql-file-per-table-2010-08-25"
			     "from-DBC-ARCH-2010-09-01")
		:name "dump-artist-infos-xml"))

;; (fad:file-exists-p 
;;  #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/scratch-xml-for-parse/example-artist-table.out")
(defparameter *sql-art-tbl-file* 
  (merge-pathnames  
   (make-pathname :name "example-artist-table" :type "out")
   #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/scratch-xml-for-parse/"))

(defparameter *sql-art-tbl*  (and (fad:file-exists-p *sql-art-tbl-file*)
				  (cxml:make-source *sql-art-tbl-file*))


(defparameter *sql-dump-file*
  (fad:file-exists-p
    (merge-pathnames 
     (make-pathname :name "example" :type "out")
     #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/scratch-xml-for-parse/")))

(defparameter *sql-dump*
  (and *sql-dump-file* (cxml:make-source *sql-dump-file*)))


(cxml:parse-file *sql-dump-file* (cxml-xmls:make-xmls-builder))

(defparameter *sql-simp* 
  (cxml:make-source "<field name=\"name 1\" name2=\"name 2\">10</field>"))

;; fields that need 0/1 to be converted to t/nil

"online"
"also_author"
"also_people"


;; fields which need 0 ignored
;; "ULAN_control"
;; "death_location"
;; "bio"
;; "cancel_num"

;;; ============================== 
;; :KEYS
:start-element
:end-element
:characters
:end-document
:comment

<row>

(klacks:get-attribute *sql-dump* (klacks:current-qname *sql-dump*))
labels

klacks:source

;; The class `cxml-source' subclasses `klacks:source' e.g.:
(type-of *sql-dump*) ;=> cxml::cxml-source


(klacks:peek              *sql-dump*)
(klacks:peek-value        *sql-dump*)
;; this one consumes
(klacks:peek-next         *sql-dump*)
(klacks:consume           *sql-dump*)
(klacks:find-element *sql-dump*)
(klacks:find-element *sql-dump* "field")
(klacks:find-event *source* :end-document)
(klacks:current-qname *sql-dump*)
(klacks:current-lname *sql-dump*)
(klacks:current-lname     *sql-dump*)
(klacks:current-characters *sql-dump*)
(klacks:get-attribute *sql-dump* "name")
(klacks:list-attributes *sql-dump*)
(car (klacks:list-attributes *sql-dump*))

(klacks:serialize-source *sql-simp* (cxml-xmls:make-xmls-builder))
(klacks:serialize-source *sql-dump* (cxml-xmls:make-xmls-builder))

(loop :while (klacks:consume *tt-xsi*) :finall (klacks:close-source *tt-xsi*))

(multiple-value-list (klacks:peek *sql-dump*))

(multiple-value-bind (chk-ky) 
    (klacks:peek *sql-dump*)
  (eql chk-ky :characters))

(multiple-value-list  (klacks:peek *sql-dump*))

(slot-value *sql-dump* 'klacks:current-attributes)

(klacks:current-qname)
(let ((source *sql-dump*)
      )
  (dolist (a (slot-value source 'current-attributes))

(slot-value *sql-dump* 

cxml:CLOSE-XSTREAM
cxml:XSTREAM/CLOSE
cxml:MAKE-STRING-SINK
(cxml::source-stream-name *sql-dump*)

(with-temp-file (s (make-pathname :directory '(:relative "notes")
 				  :name "example-dump"))
  (princ (mon::dbc-table-field-parse (make-pathname :directory '(:relative "notes")
 						    :name "example"
 						    :type "out"))
	 s))


;;; loop to the end of doc:
(loop :while (and (klacks:peek *sql-dump*)
		  (klacks:consume  *sql-dump*)))

(make-instance field-attributes)


;; SB-PCL::ARGS = ((NIL "name" "name" "id" T))


Painter, Illustrator.

(dbc-split-roles "Artist, Illustrator, Painter, Designer, Fashion Illustrator, Fashion Designer.")

;;; ==============================


;;; ==============================

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
		     (:end-document
		      (format ous "~%~A~%;;; EOF"  (make-string 68 :initial-element #\;))))
	       (klacks:consume s))
	    (prog1 (setf ous-out (get-output-stream-string ous))
		(close ous))))))

;;; ==============================
;;; EOF
