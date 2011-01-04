;;; :FILE-CREATED <Timestamp: #{2011-01-03T21:36:45-05:00Z}#{11011} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/dbc-sql-lisp-convert-notes/dbc-klacks-parse-to-class-notes-2011-01-03.lisp
;;; ==============================

(setf *default-pathname-defaults* #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/mon-systems/")


(defpackage #:scratch (:use :cl :mon))

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
(defparameter *sql-art-tbl* (make-pathname :directory '(:absolute
							"home" 
							"sp" 
							"HG-Repos"
							"CL-repo-HG" 
							"CL-MON-CODE"
							"dbc-specific"
							"notes-versioned"
							"scratch-xml-for-parse")
					   :name "example-artist-table"
					   :type "out"))

(dbc-table-field-parse (make-pathname :directory '(:relative "notes")
				      :name "example"
				      :type "out"))


(defparameter *sql-dump* (cxml:make-source (make-pathname :directory '(:relative "notes")
				      :name "example"
				      :type "out")))

;; :KEYS
:start-element
:end-element
:characters
:end-document

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

;; this form will map over the attributes of the current :START-EVENT
(defun 
(let ((gthr '()))
  (klacks:map-attributes #'(lambda (&rest x)
			     (push x gthr)) *sql-dump*)
  (loop 
     :for x in gthr
     :for v =  '(:namespace :lname :qname :attribute :att-local-p)
     :collecting (nreverse (pairlis v x))))
  
cxml:make-source



(loop 
   :for x in '((NIL "name" "name" "name1" T) (NIL "name2" "name2" "name2" T))
   :for v =  '(:namespace :lname :qname :attribute :att-local-p)
   :collecting (pairlis v x))
(map (((NIL "name" "name" "name1" T) (NIL "name2" "name2" "name2" T))



(pairlis '(:namespace :lname :qname :attribute :att-local-p)
         '(NIL "name" "name" "id" T))


(nreverse (pairlis 
           '(:namespace :lname :qname :attribute :att-local-p)
           '(NIL "name" "name" "id" T)))

(defclass parse-artist-info ()
  ())

(make-instance field-attributes)

;; SB-PCL::ARGS = ((NIL "name" "name" "id" T))


;;; ==============================
;;; :TODO methods




;;; ==============================
;;; EOF
