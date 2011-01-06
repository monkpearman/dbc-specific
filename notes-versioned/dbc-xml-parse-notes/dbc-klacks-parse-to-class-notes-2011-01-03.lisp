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

(every #'ascii-char-p "1843")

"1843"
#\0 #\1 #\2 #\3

(string-to-number "1843")



(dbc-split-lifespan "1843-1943")
=> ("1843" . "1943")




(defun tt-dbc-split-lifespan-string-int-pairs (lifespan-str-pair)
  (declare (type (cons (or null simple-string)
		     (or null simple-string))
	       lifespan-str-pair))
  (let ((cons-str lifespan-str-pair) ;; (dbc-split-lifespan lifespan-str-pair)) 
	(chk-digit (cons nil nil)))
    (and (stringp (car cons-str))
	 (stringp (cdr cons-str))
	 (setf chk-digit
	       (list (or (and (loop for chars across (car cons-str) always (digit-char-p chars))
			      (not (loop for chars across (car cons-str) always (char= #\0 chars))))
			 (and (loop for chars across (car cons-str) thereis (char= #\? chars))
			      #\?))
		     (or (and (loop for chars across (cdr cons-str) always (digit-char-p chars))
			      (not (loop for chars across (cdr cons-str) always (char= #\0 chars))))
			 (and (loop for chars across (cdr cons-str) thereis (char= #\? chars))
			      #\?)))))
    (and (car chk-digit)
	 (not (characterp (car chk-digit)))
	 ;; There shouldn't be anyway we are parsing a negative string, e.g. "-1843"
	 (setf (car chk-digit) (multiple-value-list (parse-integer (car cons-str))))
	 ;; And, we're only looking for entities in existing beyond the Middle Ages :)
	 (eql (cadar chk-digit) 4)
	 (setf (car chk-digit) (caar chk-digit)))
    (and (cadr chk-digit)
	 (not (characterp (cadr chk-digit)))
	 (setf (cadr chk-digit) (multiple-value-list (parse-integer (cdr cons-str))))
	 (eql (cadadr chk-digit) 4)
	 (setf (cadr chk-digit) (caadr chk-digit)))
    (setf chk-digit (cons (car chk-digit) (cadr chk-digit)))
    (setf chk-digit
	  (or (and (integerp (car chk-digit))
		   (integerp (cdr chk-digit))
		   chk-digit)
              ;; ==============================
              ;; (not (and (zerop (car chk-digit)) (zerop (cdr chk-digit))))               
              ;;
              ;; This would imply a cons of the form (0 . 0) 
              ;; Currently this prob. can't actually happen because we're checking
              ;; above that the length of parse-integer is 4 and didn't parse "0*"
              ;; Is it possible that this could change?
              ;;
              ;; ==============================
              ;; 
              ;; (not (= (car chk-digit) (cdr chk-digit)))
              ;;
              ;; This would imply a cons of the form: (1843 . 1843) 
              ;; The question is should/can it ever happen? 
              ;; It certainly can if we extend should ever extend this
              ;; function to other entity types which can terminate in the
              ;; same year as its creation. 
              ;; In which case, how to reason around which the birth date
              ;; which is the death date?
              ;; One option is to let it pass and allow reporting the
              ;; lifespan as 0, e.g. with (- 1843 1843).
              ;; Likewise, we could prevent erroneous inferences by
              ;; returning (0 . 0) instead of (YYYY . YYYY)
              ;;
              ;; ==============================
              ;;
              ;; (and (not (minusp (cdr chk-digit))) 
              ;;      (not (minusp (car chk-digit)))
              ;;    (not (>= (cdr chk-digit) (car chk-digit))))
              ;;
              ;; This would imply a cons of the form: (1900 . 1843)
              ;; IOW, the birthdate is after the deathdate.
              ;; What to do? error?
              ;; ============================== 
	      ;;
	      (and 
	       ;; When this branch is true we have a cons of the form: (1843 . #\?)
	       ;; We know that the string passed from `dbc-split-lifespan' was "1843-?"
	       ;; or equivalent and that birth date is known So, we return the deathdate
	       ;; as -1843 e.g. the lifespan will appear as: (1843 . -1844)
	       ;; This means inferences about an entities lifespan will always return an
	       ;; integer less than -1 e.g.  (- -1844 1843) => -3687 
	       ;; whereas (- 1900 1843) => 57 which is a valid lifespan.
	       (integerp (car chk-digit))
	       ;; Don't bother checking if its #\?
	       ;; (and (characterp (cdr chk-digit)) (char= #\? (cdr chk-digit))
	       (characterp (cdr chk-digit))
	       (setf (cdr chk-digit) (lognot (car chk-digit)))
	       chk-digit)
	      
	      (and 
	       ;; When this branch is true we have a cons of the form: (#\? . 1900)
	       ;; We make it a cons of the form: (-1 . 1900)
	       ;; 
	       ;;  This allows a few nice to checks later on:
	       ;; (and (integerp (car '(-1 . 1900)))
	       ;; 	    (eql (signum (car '(-1 . 1900))) (car '(-1 . 1900)))
	       ;; 	    (not (< (- (cdr '(-1 . 1900)) (car '(-1 . 1900)))
	       ;; 		    (cdr '(-1 . 1900)))))
	       ;; IOW:
	       ;;
	       ;; (and (integerp -1)
	       ;; 	    (eql (signum -1) -1) 
	       ;; 	    (not (< (- 1900 -1) 1900)))
	       ;;
	       (integerp (cdr chk-digit))
	       (characterp (car chk-digit))
	       (progn (setf (car chk-digit) -1)
		      chk-digit))
	      chk-digit))
    (setf cons-str (list cons-str chk-digit))))






;;; ==============================
(dbc-split-lifespan-string-int-pairs (dbc-split-lifespan ""))
((NIL) (NIL))

(dbc-split-lifespan-string-int-pairs (dbc-split-lifespan "1843-1943"))
(("1843" . "1943") (1843 . 1943))

(dbc-split-lifespan-string-int-pairs (dbc-split-lifespan "1843-"))
(("1843" . "?") (1843 . -1844))

(dbc-split-lifespan-string-int-pairs (dbc-split-lifespan "-1843"))
(("?" . "1843") (-1 . 1843))



       (setf (car chk-digit) (caar chk-digit))
(typep  1843 (integer 1844))
(assert 1843  (integer 1844))
)
  chk-digit)

(caadr '(1843 (1943 4)))


(caar '((1843 4) T))

(caar '((1843 4) T))
     



  (

;;; ==============================
;;; EOF
