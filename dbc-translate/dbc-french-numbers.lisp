;;; :FILE-CREATED <Timestamp: #{2011-03-17T15:59:19-04:00Z}#{11114} - by MON>
;;; :FILE dbc-translate/dbc-french-numbers.lisp
;;; ==============================

;;; ==============================
;; :COURTESY Jean-Philippe Paradis hexstream@gmail.com
;; HexstreamSoft - Terrebonne (near Montréal), Québec, Canada
;; (URL `http://www.hexstreamsoft.com')
;; (URL `git://github.com/Hexstream/bigname.git')
;;
;; This library converts potentially very big integers and fractions into their
;; text representation.  At this time, only conversion to french cardinal and
;; ordinal is supported.
;;
;;  Example:
;;  (number-to-french -132894362727827234/19837298127)
;;   ==> "moins cent trente-deux billiards huit cent quatre-vingt-quatorze billions
;;        trois cent soixante-deux milliards sept cent vingt-sept millions huit cent
;;        vingt-sept mille deux cent trente-quatre dix-neuf milliards huit cent
;;        trente-sept millions deux cent quatre-vingt-dix-huit mille cent vingt-septième"
;;
;;; ==============================
;; :RENAMED
;;
;; :VARIABLES
;; `*below-20*'        -> `*number-to-french-below-20*'
;; `*tens*'            -> `*number-to-french-tens*'
;; `*thousands*'       -> `*number-to-french-thousands*'
;; `*big-prefix*'      -> `*number-to-french-big-prefix*'
;; `*bof*'             -> `*number-to-french-bof*'
;; `*denominators*'    -> `*number-to-french-denominators*'
;;
;; :FUNCTIONS
;; `ten-to-french'     -> `number-to-french-ten'
;; `hundred-to-french' -> `number-to-french-hundred'
;; `thousand-to-french'-> `number-to-french-thousand'
;; `big-to-french'     -> `number-to-french-big'
;; `big-designation'  -> `number-to-french-big-designation'
;;
;; :ADDED type declarations
;;
;; :WAS (in-package #:com.hexstreamsoft.bigname)
;; 
;; `number-to-french' and `number-to-french-ordinal' in com.hexstreamsoft.bigname
;; depend on`with-output-to-string-or-stream' from com.hexstreamsoft.lib  / lib.lisp 
;;; ==============================


;;; ==============================
(in-package #:dbc)
;; *package*

(defconst* *number-to-french-below-20* (simple-vector 20)
  #("zéro" "un" "deux" "trois" "quatre" "cinq"
    "six" "sept" "huit" "neuf"
    "dix" "onze" "douze" "treize" "quatorze" "quinze"
    "seize" "dix-sept" "dix-huit" "dix-neuf"))

(defconst* *number-to-french-tens* (simple-vector 10)
  #("zéro" "dix" "vingt" "trente" "quarante" "cinquante" 
    "soixante" "soixante-dix" "quatre-vingt" "quatre-vingt-dix"))

(defconst* *number-to-french-thousands* (simple-vector 9)
  #("m" "b" "tr" "quatr" "quint" "sext" "sept"  "oct" "non"))

(defconst* *number-to-french-denominators* (simple-vector 3)
  #("demi" "tiers" "quart"))

;; :NOTE doesn't apear to be getting used:
(defconst* *number-to-french-big-prefix* (simple-vector 10)
  #("" "un" "duo" "tre" "quattuor" "quin" "sex" "septen" "octo" "novem"))

;; :NOTE doesn't apear to be getting used:
(defconst* *number-to-french-bof* (simple-vector 9)
  #("dec" "vi" "tri" "quadra" "quinqua" "sexa" "septua" "octo" "nona"))

(defun number-to-french-ten (number stream)
  (declare ((simple-vector 10) *number-to-french-tens*)
           ((simple-vector 20) *number-to-french-below-20*)
           (type number number))
  (cond ((> number 80)
	 (write-string (svref *number-to-french-tens* 8) stream)
	 (write-char #\- stream)
	 (number-to-french (- number 80) stream))
	((= number 80)
	 (write-string (svref *number-to-french-tens* 8) stream)
	 (write-char #\s stream))
	((> number 70)
	 (let ((rest (- number 70)))
	   (write-string (svref *number-to-french-tens* 6) stream)
	   (write-string (if (= rest 1)
			     " et "
			     "-")
			 stream)
	   (write-string (svref *number-to-french-below-20* (+ rest 10)) stream)))
	(t (multiple-value-bind (main rest) (floor number 10)
	     (write-string (svref *number-to-french-tens* main) stream)
	     (when (not (zerop rest))
	       (write-string (if (= rest 1)
				 " et "
				 "-")
			     stream)
	       (number-to-french rest stream))))))

(defun number-to-french-hundred (number stream)
  (declare ((simple-vector 20) *number-to-french-below-20*)
           (number number))
  (multiple-value-bind (main rest) (floor number 100)
    (if (= main 1)
	(write-string "cent" stream)
	(progn (write-string (svref *number-to-french-below-20* main) stream)
	       (write-string " cent" stream)
	       (if (zerop rest)
		   (write-char #\s stream))))
    (when (not (zerop rest))
      (write-char #\Space stream)
      (number-to-french rest stream))))

(defun number-to-french-thousand (number stream)
  (declare (type number number))
  (multiple-value-bind (main rest) (floor number 1000)
    (when (> main 1)
      (number-to-french main stream)
      (write-char #\Space stream))
    (write-string "mille" stream)
    (when (not (zerop rest))
      (write-char #\Space stream)
      (number-to-french rest stream))))

;;; :NOTE There is apparently a bug in this per Hexstream on ERC
(defun number-to-french-big-designation (zeroes stream)
  (declare ((simple-vector 9)  *number-to-french-thousands*))
  (let ((groups (floor zeroes 3)))
    (write-string (svref *number-to-french-thousands* (1- (floor groups 2))) stream)
    (write-string (if (evenp groups)
		      "illion"
		      "illiard")
		  stream)))

(defun number-to-french-big (number stream)
  (declare (type number number))
  (let* ((zeroes (floor (log number 10)))
	 (lion (expt 10 (* (floor zeroes 3) 3)))
	 (main (floor number lion))
	 (rest (- number (* main lion))))
    (number-to-french main stream)
    (write-char #\Space stream)
    (number-to-french-big-designation zeroes stream)
    (if (> main 1)
	(write-char #\s stream))
    (when (not (zerop rest))
      (write-char #\Space stream)
      (number-to-french rest stream))))

(defun number-to-french (number &optional stream)
  (declare ((simple-vector 20) *number-to-french-below-20*)
           ((simple-vector 3)  *number-to-french-denominators*)
           (type number number))
  (mon:with-output-to-string-or-stream (stream)
    (etypecase number
      (integer (cond ((< number 0)
		      (write-string "moins " stream)
		      (number-to-french (- number) stream))
		     ((< number 20)
		      (write-string (svref *number-to-french-below-20* number) stream))
		     ((< number 100)
		      (number-to-french-ten number stream))
		     ((< number 1000)
		      (number-to-french-hundred number stream))
		     ((< number 1000000)
		      (number-to-french-thousand number stream))
		     (t (number-to-french-big number stream))))
      (ratio (number-to-french (numerator number) stream)
	     (write-char #\Space stream)
	     (let ((denominator (denominator number)))
	       (if (<= denominator 4)
		   (write-string (svref *number-to-french-denominators* (- denominator 2)) stream)
		   (number-to-french-ordinal denominator stream)))))))

(defun number-to-french-ordinal (number &optional stream)
  (declare ((integer 1) number))
  (check-type number (integer 1))
  (mon:with-output-to-string-or-stream (stream)
    (if (= number 1)
	(write-string "premier" stream)
	(if (= number 80)
	    (write-string "quatre-vingtième" stream)
	    (if (= number 81)
		(write-string "quatre-vingt et unième" stream)
		(let* ((base (number-to-french number))
		       (last-position (1- (length base)))
		       (last-character (char base last-position)))
		  (cond ((and (eql last-character #\f)
			      (= (mod number 10) 9))
			 (write-string base stream :end last-position)
			 (write-string "vième" stream))
			((and (eql last-character #\q)
			      (= (mod number 10) 5))
			 (write-string base stream)
			 (write-string "uième" stream))
			(t (write-string base stream
					 :end (if (eql last-character #\e)
						  last-position))
			   (write-string "ième" stream)))))))))


;;; ==============================
;;; :FRENCH-NUMBERS-VARIABLES-DOCUMENTATION
;;; ==============================

(vardoc '*number-to-french-below-20*
"Of type: \(simple-vector 20\)~%~@
:EXAMPLE~%
 \(type-of *number-to-french-below-20*\)~%
 \(svref *number-to-french-below-20* 19\)~%~@
:SEE-ALSO `number-to-french-ten', `*number-to-french-below-20*',
`*number-to-french-tens*', `*number-to-french-thousands*',
`*number-to-french-big-prefix*' `*number-to-french-bof*',
`*number-to-french-denominators*'.~%►►►")

(vardoc '*number-to-french-tens*
"Of type: \(simple-vector 10\)~%~@
:EXAMPLE~%
 \(type-of *number-to-french-tens*\)~%
 \(svref *number-to-french-tens* 9\)~%~@
:SEE-ALSO `number-to-french-ten', `number-to-french-hundred',
`*number-to-french-below-20*', `*number-to-french-tens*',
`*number-to-french-thousands*', `*number-to-french-big-prefix*'
`*number-to-french-bof*', `*number-to-french-denominators*'.~%►►►")

(vardoc '*number-to-french-thousands*
"Of type: \(simple-vector 9\)~%~@
:EXAMPLE~%
 \(type-of *number-to-french-thousands*\)~%
 \(svref *number-to-french-thousands* 8\)~%~@
:SEE-ALSO `number-to-french-hundred',
`number-to-french-thousand', `*number-to-french-below-20*',
`*number-to-french-tens*', `*number-to-french-thousands*',
`*number-to-french-big-prefix*', `*number-to-french-bof*',
`*number-to-french-denominators*'.~%►►►")

(vardoc '*number-to-french-big-prefix*
"Of type: \(simple-vector 10\)~%~@
:EXAMPLE~%
 \(type-of *number-to-french-big-prefix*\)~%
 \(svref *number-to-french-big-prefix* 9\)~%~@
:SEE-ALSO `number-to-french-big', `number-to-french-big-designation',
`*number-to-french-below-20*', `*number-to-french-tens*',
`*number-to-french-thousands*', `*number-to-french-big-prefix*',
`*number-to-french-bof*', `*number-to-french-denominators*'.~%►►►")

(vardoc '*number-to-french-bof*
"Of type: \(simple-vector 9\)~%~@
:EXAMPLE~%
 \(type-of *number-to-french-bof*\)~%
 \(svref *number-to-french-bof* 8\)~%~@
:SEE-ALSO `*number-to-french-below-20*', `*number-to-french-tens*',
`*number-to-french-thousands*', `*number-to-french-big-prefix*',
`*number-to-french-bof*', `*number-to-french-denominators*'.~%►►►")

(vardoc '*number-to-french-denominators*
"Of type: \(simple-vector 3\)~%~@
:EXAMPLE~%
 \(type-of *number-to-french-denominators*\)~%
 \(svref *number-to-french-denominators* 2\)~%~@
:SEE-ALSO `*number-to-french-below-20*', `*number-to-french-tens*',
`*number-to-french-thousands*', `*number-to-french-big-prefix*'
`*number-to-french-bof*', `*number-to-french-denominators*'.~%►►►")


;;; ==============================
;;; :FRENCH-NUMBERS-FUNCTIONS-DOCUMENTATION
;;; ==============================

(fundoc 'number-to-french
" <DOCSTR> ~%~@
:EXAMPLE~%~@
 \(number-to-french -132894362727827234/19837298127\)~%
:SEE-ALSO `number-to-french', `number-to-french-ten',
`number-to-french-hundred', `number-to-french-thousand', `number-to-french-big',
`number-to-french-big-designation', `number-to-french-ordinal'.~%►►►")

(fundoc 'number-to-french-ten
" <DOCSTR> ~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `number-to-french', `number-to-french-ten',
`number-to-french-hundred', `number-to-french-thousand', `number-to-french-big',
`number-to-french-big-designation', `number-to-french-ordinal',
`*number-to-french-below-20*', `*number-to-french-tens*'.~%►►►")

(fundoc 'number-to-french-hundred
" <DOCSTR> ~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `number-to-french', `number-to-french-ten',
`number-to-french-hundred', `number-to-french-thousand', `number-to-french-big',
`number-to-french-big-designation', `number-to-french-ordinal',
`*number-to-french-denominators*'.~%►►►")

(fundoc 'number-to-french-thousand
" <DOCSTR> ~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `number-to-french', `number-to-french-ten',
`number-to-french-hundred', `number-to-french-thousand', `number-to-french-big',
`number-to-french-big-designation', `number-to-french-ordinal',
`*number-to-french-thousands*'.~%►►►")

(fundoc 'number-to-french-big
" <DOCSTR> ~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `number-to-french', `number-to-french-ten',
`number-to-french-hundred', `number-to-french-thousand', `number-to-french-big',
`number-to-french-big-designation', `number-to-french-ordinal',
`*number-to-french-big-prefix*'.~%►►►")

(fundoc 'number-to-french-big-designation
" <DOCSTR> ~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `number-to-french', `number-to-french-ten',
`number-to-french-hundred', `number-to-french-thousand', `number-to-french-big',
`number-to-french-big-designation', `number-to-french-ordinal',
`*number-to-french-big-prefix*'.~%►►►")

(fundoc 'number-to-french-ordinal
" <DOCSTR> ~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `number-to-french', `number-to-french-ten',
`number-to-french-hundred', `number-to-french-thousand', `number-to-french-big',
`number-to-french-big-designation', `number-to-french-ordinal'.~%►►►")

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: DBC
;; End:


;;; ==============================
;;; EOF
