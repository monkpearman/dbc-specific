;;; :FILE-CREATED <Timestamp: #{2011-03-17T15:59:19-04:00Z}#{11114} - by MON>
;;; :FILE dbc-translate/dbc-french-numbers.lisp
;;; ==============================

;;; ==============================
;; :COURTESY Jean-Philippe Paradis hexstream@gmail.com
;; HexstreamSoft - Terrebonne (near Montréal), Québec, Canada
;; (URL `http://www.hexstreamsoft.com')
;; (URL `git://github.com/Hexstream/bigname.git')
;;; ==============================

;; (in-package #:com.hexstreamsoft.bigname)

(in-package #:dbc)
;; *package*

;;; ==============================
;; :RENAMED
;;
;; :VARIABLES
;; `*below-20*'        -> `*number-to-french-below-20*'      !
;; `*tens*'            -> `*number-to-french-tens*'          !
;; `*thousands*'       -> `*number-to-french-thousands*'     !
;; `*big-prefix*'      -> `*number-to-french-big-prefix*'    !
;; `*bof*'             -> `*number-to-french-bof*'           !
;; `*denominators*'    -> `*number-to-french-denominators*'  !
;;
;; :FUNCTIONS
;; `ten-to-french'     -> `number-to-french-ten'              !
;; `hundred-to-french' -> `number-to-french-hundred'          !
;; `thousand-to-french'-> `number-to-french-thousand'         !
;; `big-to-french'     -> `number-to-french-big'              !
;; `big-designationp'  -> `number-to-french-big-designationp' !
;;
;;; ==============================


(defparameter *number-to-french-below-20* #("zéro" "un" "deux" "trois" "quatre" "cinq"
                                            "six" "sept" "huit" "neuf"
                                            "dix" "onze" "douze" "treize" "quatorze" "quinze"
                                            "seize" "dix-sept" "dix-huit" "dix-neuf"))

(defparameter *number-to-french-tens* #("zéro" "dix" "vingt" "trente" "quarante" "cinquante" 
                                        "soixante" "soixante-dix" "quatre-vingt" "quatre-vingt-dix"))

(defparameter *number-to-french-thousands* #("m" "b" "tr" "quatr" "quint" "sext" "sept"  "oct" "non"))

(defparameter *number-to-french-denominators* #("demi" "tiers" "quart"))

;; :NOTE doesn't apear to be getting used:
(defparameter *number-to-french-big-prefix* #("" "un" "duo" "tre" "quattuor" "quin" "sex" "septen" "octo" "novem"))
;;
;; :NOTE doesn't apear to be getting used:
(defparameter *number-to-french-bof* #("dec" "vi" "tri" "quadra" "quinqua" "sexa" "septua" "octo" "nona"))

(defun number-to-french-ten (number stream)
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
  (multiple-value-bind (main rest) (floor number 1000)
    (when (> main 1)
      (number-to-french main stream)
      (write-char #\Space stream))
    (write-string "mille" stream)
    (when (not (zerop rest))
      (write-char #\Space stream)
      (number-to-french rest stream))))


(defun number-to-french-big-designationp (zeroes stream)
  (let ((groups (floor zeroes 3)))
    (write-string (svref *number-to-french-thousands* (1- (floor groups 2))) stream)
    (write-string (if (evenp groups)
		      "illion"
		      "illiard")
		  stream)))

(defun number-to-french-big (number stream)
  (let* ((zeroes (floor (log number 10)))
	 (lion (expt 10 (* (floor zeroes 3) 3)))
	 (main (floor number lion))
	 (rest (- number (* main lion))))
    (number-to-french main stream)
    (write-char #\Space stream)
    (big-designation zeroes stream)
    (if (> main 1)
	(write-char #\s stream))
    (when (not (zerop rest))
      (write-char #\Space stream)
      (number-to-french rest stream))))

(defun number-to-french (number &optional stream)
  (with-output-to-string-or-stream (stream)
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
  (check-type number (integer 1))
  (with-output-to-string-or-stream (stream)
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
;;; 
;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: DBC
;; End:


;;; ==============================
;;; EOF
