;;; :FILE-CREATED <Timestamp: #{2012-04-08T14:11:15-04:00Z}#{12147} - by MON>
;;; :FILE dbc-specific/dbc-time/date-localtime-utils.lisp
;;; ==============================

(in-package #:dbc)


;; (local-time::reread-timezone-repository)
;; local-time::*default-timezone-repository-path*

;; (defparameter local-time::+est5edt+
;;   ;; (local-time::define-timezone local-time::est5edt
;;   ;;     (merge-pathnames #p"EST5EDT" local-time::*default-timezone-repository-path*))
;;   (local-time:find-timezone-by-location-name "EST5EDT"))

;; (setf local-time::*default-timezone*
;;       local-time::+est5edt+)

;; (local-time::timestamp-subtimezone (local-time:now) local-time:*default-timezone*)
; => -14400, T, "EDT"
; (- (* 4 60 60)) => 14400


;;; ==============================

(define-condition invalid-timestamp-component (error)
  ((component :accessor component-of :initarg :component))
  (:report (lambda (condition stream)
             (format stream "Got bad timestamp component: ~S" 
                     (component-of condition)))))

(define-condition invalid-timestamp-component-day (invalid-timestamp-component)
  ((component :accessor component-of :initarg :component))
  (:report (lambda (condition stream)
             (format stream "Got invalid day/month/year timestamp component: ~S" 
                     (component-of condition)))))

;; (URL `https://gist.github.com/2340654')
;; (URL `git://gist.github.com/2340654.git')
(deftype nanosecond-range ()
 '(mod 1000000000))

(deftype second-minute-range ()
 '(mod 60))

(deftype hour-range ()
 '(mod 24))

(deftype day-range ()
 '(mod 32))

(deftype month-range ()
  '(integer 1 12))

(deftype year-range ()
  '(integer -1000000 1000000))

;; Following function will error instead of returning nil. It is meant to
;; account for certain anomalous behaviour exhibitted by the current
;; implementation of local-time::valid-timestamp-p when YEAR is outside the
;; integer range [-1000000,1000000] e.g.:
;;
;; (local-time::valid-timestamp-p 000001 0 0 0 28 2 most-positive-fixnum)
;;  => T
;; (local-time::valid-timestamp-p 000001 0 0 0 29 2 most-positive-fixnum)
;;  => NIL
;; (local-time:encode-timestamp 000001 0 0 0 29 2 most-positive-fixnum)
;;  => error
;; (local-time:encode-timestamp 000001 0 0 0 28 2 most-positive-fixnum)
;;  => error
;; 
;; (valid-timestamp-or-error 000001 0 0 0 29 2 2012)
;; => T
;; (valid-timestamp-or-error 000001 0 0 0 29 2 -1000000)
;; => T
;; (valid-timestamp-or-error 000001 0 0 0 29 2 1000000)
;;  => T
;;
;; Following error successfully:
;;
;; (valid-timestamp-or-error 000001 0 0 0 28 2 -1000001)
;; (valid-timestamp-or-error 000001 0 0 0 28 2 1000001)
;; (valid-timestamp-or-error 000001 0 0 0 28 2 most-positive-fixnum)
;; (valid-timestamp-or-error 000001 0 0 0 29 2 2011)
;;
(defun valid-timestamp-or-error (nsec sec minute hour day month year)
  "Returns T if the time values refer to a valid time, otherwise signals an
`invalid-timestamp-component' condition."
  (declare (optimize (speed 3)))
  (and (or (typep nsec 'nanosecond-range)
           (error 'invalid-timestamp-component
                  :component (list :nsec nsec)))
       (or (typep sec 'second-minute-range)
           (error 'invalid-timestamp-component
                  :component (list :sec sec)))
       (or (typep minute 'second-minute-range)
           (error 'invalid-timestamp-component
                  :component (list :min minute)))
       (or (typep hour 'hour-range)
           (error 'invalid-timestamp-component
                  :component (list :hour hour)))
       (or (typep month 'month-range)
           (error 'invalid-timestamp-component
                  :component (list :month month)))
       (and (or (typep day 'day-range)
                (error 'invalid-timestamp-component
                       :component (list :day day)))
            (or (<= 1 day (local-time:days-in-month month year))
                (error 'invalid-timestamp-component-day
                       :component (list :day day :month month :year year))))
       (or (and (typep year 'year-range)
                (not (zerop year)))
           (error 'invalid-timestamp-component
                  :component (list :year year)))))

;; Returns the decoded time as multiple values: nsec, ss, mm, hh, day, month, year, day-of-week
;; (timestamp-year-only-p (make-timestamp-year-only 2012))
;; (null (timestamp-year-only-p (make-timestamp-year-month-day 2012 1 1)))
(defun timestamp-year-only-p (timestamp)
  (declare (local-time:timestamp timestamp)) 
  (multiple-value-bind (nsec ss mm hh day month year day-of-week)
      (local-time:decode-timestamp timestamp)
    (declare (ignore day-of-week year))
    (and (every #'zerop (list ss mm hh))
         (= 1 nsec day month))))

;; (timestamp-year-month-only-p (make-timestamp-year-month-only 2012 3))
;; (timestamp-year-month-only-p (make-timestamp-year-only 2012))
;; (null (timestamp-year-month-only-p (make-timestamp-year-month-day 2012 1 1)))
(defun timestamp-year-month-only-p (timestamp)
  (declare (local-time:timestamp timestamp)) 
  (multiple-value-bind (nsec ss mm hh day month year day-of-week)
      (local-time:decode-timestamp timestamp)
    (declare (ignore day-of-week year month))
    (and (every #'zerop (list ss mm hh))
         (= 1 day)
         (= nsec 11))))

;; (timestamp-year-month-day-p (make-timestamp-year-month-day 2012 3 1))
;; (null (timestamp-year-month-day-p (make-timestamp-year-only 2012)))
;; (null (timestamp-year-month-day-p (make-timestamp-year-month-only 2012 1)))
;; (null (timestamp-year-month-only-p (make-timestamp-year-month-day 2012 1 1)))
(defun timestamp-year-month-day-p (timestamp)
  (declare (local-time:timestamp timestamp)) 
  (multiple-value-bind (nsec ss mm hh day month year day-of-week)
      (local-time:decode-timestamp timestamp)
    (declare (ignore day-of-week year month day))
    (and (every #'zerop (list ss mm hh))
         (= nsec 111))))

;; (local-time:timestamp-century (make-timestamp-year-only 2012))
;; (local-time:timestamp-century (make-timestamp-year-only 1895))
;; (local-time:timestamp-century (make-timestamp-year-only 1))
;; (local-time:timestamp-decade (make-timestamp-year-only 1895))
;; (local-time:timestamp-decade (make-timestamp-year-only 2012))
;; (local-time:timestamp-decade (make-timestamp-year-only 1))
;; (local-time:timestamp-month (make-timestamp-year-only 2012))
;; (local-time:timestamp-month (make-timestamp-year-only 1895))
;; (local-time:timestamp-day (make-timestamp-year-only 1895))
(defun make-timestamp-year-only (year)
  ;; we use the NSEC value 000001 to help us infer that no DAY or MONTH value
  ;; was provided `local-time:encode-timestamp'
  ;; SMHDMY
  ;; 000001
  (declare (type year-range year))
  (local-time:encode-timestamp 000001 0 0 0 1 1 year))

(defun make-timestamp-year-month-only (year month)
  ;; we use the NSEC value 000011 to help us infer that no DAY value was
  ;; provided `local-time:encode-timestamp'.
  ;; SMHDMY
  ;; 000011
  (declare (type year-range year)
           (type month-range month))
  (local-time:encode-timestamp 000011 0 0 0 1 month year))

(defun make-timestamp-year-month-day (year month day)
  ;; we use the NSEC value 000111 to help us infer DAY MONTH YEAR value
  ;; were provided `local-time:encode-timestamp'.
  ;; SMHDMY
  ;; 000111
  (declare (type year-range year)
           (type month-range month)
           (type day-range day))
  (local-time:encode-timestamp 000111 0 0 0 day month year))

;; (local-time:timestamp-year (make-timestamp-year-only 2012)) ; => 0, 1
;; (local-time:timestamp-month (make-timestamp-year-month-only 2012 3))
;; (local-time:timestamp-day (make-timestamp-year-month-day 2012 3 18))
;; (local-time:timestamp-microsecond (make-timestamp-year-only 2012)) ; => 0, 1
;; (local-time:timestamp-microsecond (make-timestamp-year-month-only 2012 3)) ;=> 0, 11
;; (local-time:timestamp-microsecond (make-timestamp-year-month-day 2012 2 29)) ;=> 0, 111
;; (local-time::timestamp-nanosecond (make-timestamp-year-month-day 2012 2 29))
(defun local-time::timestamp-nanosecond (timestamp)
  (local-time:nsec-of timestamp))

;; (local-time:days-in-month 2 2011)

;;; ==============================
;; (loop 
;;    for cent in (loop 
;;                   for x from 1300 below 2100 by 100
;;                   collect x)
;;    do (def-century-timestamp cent))

;; (map 'list
;;      #'(lambda (y) (def-century-timestamp y))
;;      (loop 
;;         for x from 1300 below 2100 by 100
;;         collect x))

;; (unintern *timestamp-century-1300*)
;; (def-century-timestamp 1300)

(defmacro def-century-timestamp (century)
  (let* ((maybe-generate  (or (and (integerp century)century)
                              (error "arg CENTURY not integerp, got: ~S" century)))
         (generated-name (intern (format nil "*TIMESTAMP-CENTURY-~D*" maybe-generate))))
    `(defparameter ,generated-name (make-timestamp-year-only ,century))))

;; (let ((time (local-time:make-timestamp)))
;;   (setf (local-time:day-of time) -100000)
;;   time)

;; (local-time:adjust-timestamp *tt--1300* (:offset :year 75))



;;; ==============================
;;; EOF
