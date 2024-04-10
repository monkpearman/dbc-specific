;;; :FILE-CREATED <Timestamp: #{2011-03-17T18:23:25-04:00Z}#{11114} - by MON>
;;; :FILE dbc-translate/dbc-french-dates.lisp
;;; ==============================


(in-package #:dbc)

(defvar *french-weekday-names*
  #("Lundi" "Mardi" "Mercredi" "Jeudi" "Vendredi" "Samedi" "Dimanche"))

(defvar *french-month-names* 
  #("Janvier" "Février" "Mars" "Avril" "Mai" "Juin"
    "Juillet" "Août" "Septembre" "Octobre" "Novembre" "Décembre"))


;;; ==============================
;;; :FRENCH-DATES-VARIABLE-DOCUMENTATION
;;; ==============================

(vardoc '*french-weekday-names*
"(simple-vector 7)~%~@
:EXAMPLE~%
 \(type-of *french-weekday-names*\)~%
 \(svref *french-weekday-names* 6\)~%~@
:SEE-ALSO `*french-month-names*'.~%▶▶▶")

(vardoc '*french-month-names*
"Type of: \(simple-vector 12\)~%~@
:EXAMPLE~%
 \(type-of *french-month-names*\)~%
 \(svref *french-month-names* 11\)~%~@
:SEE-ALSO `*french-weekday-names*'.~%▶▶▶")



;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: DBC
;; End:


;;; ==============================
;;; EOF
