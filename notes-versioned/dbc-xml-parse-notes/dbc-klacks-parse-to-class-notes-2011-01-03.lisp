;;; :FILE-CREATED <Timestamp: #{2011-01-03T21:36:45-05:00Z}#{11011} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/dbc-sql-lisp-convert-notes/dbc-klacks-parse-to-class-notes-2011-01-03.lisp
;;; ==============================

;;; ==============================
;; "/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/"
;; notes-versioned/dbc-xml-parse-notes/dbc-klacks-parse-to-class-notes-2011-01-03.lisp
;;
;; (setf *default-pathname-defaults* #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/mon-systems/")
;;; ==============================

;; (in-package :dbc)

;; (defpackage #:scratch (:use :cl :mon :dbc))

;;(in-package :scratch)

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

(split-roles "Artist, Illustrator, Painter, Designer, Fashion Illustrator, Fashion Designer.")

;;; ==============================

*package*
(subseq 

;;; ==============================
;; :Note this is here to make adjustments using the `dbc-split-*' funs
;; :TODO In the first case where `key` is :START-ELEMENT we should check
;; whether a set of desired attributes are present in the
;; `klacks:current-lname's and if so (and if we _know_ the next event is a
;; :CHARACTERS event then we can go ahead an read it too.  This will allow
;; the fall through check for :CHARACTERS events outside of the relevant
;; :START-ELEMENT events. If we do this, then we should maybe use one of the
;; `klacks:expect-*' routines to signal a recoverable error.  But, we will
;; still need to keep the existing behaviour around the :CHARACTERS case
;; below b/c we can't be _sure_ that some :CHARACTERS event won't happen.
;;
(defun tt-dbc-table-field-parse (sql-xml-dmp)
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
renamed in mon


"Unknown", "No Signature" "Anonymous"
*package*
string-upcase

year_year
(search-forward-regexp "\"year_year\">[0-9]\{4}" nil t)

;;; ==============================


	      ;; (:bit-13 :byte 2 :2^ 12 :bit-weight 4096 :bit-oct #o10000 :bit-hex #x1000 :max-int 8191 :max-uint (-4096 . 4095))
; in: DEFUN DBC-SPLIT-LIFESPAN-STRING-INT-PAIRS
;     (LOGNOT (CAR DBC::CHK-DIGIT))
; 
; note: forced to do full call
;       unable to do inline fixnum arithmetic (cost 1) because:
;       The first argument is a INTEGER, not a FIXNUM.
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES FIXNUM &REST T).
;       unable to do inline (signed-byte 32) arithmetic (cost 2) because:
;       The first argument is a INTEGER, not a (SIGNED-BYTE 32).
;       The result is a (VALUES INTEGER &OPTIONAL), not a (VALUES
;                                                          (SIGNED-BYTE 32) &REST
;                                                          T).
	      ;; (locally  

(let ((bubba 2999))
  (declare (type (integer 1000 3000) bubba))
  bubba)

(let ((bubba 2999))
  (declare ((mod 12) bubba))
  bubba)





;;; ==============================
;;; EOF
