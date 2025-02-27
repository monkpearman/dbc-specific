;;; :FILE-CREATED <Timestamp: #{2011-01-01T14:10:05-05:00Z}#{11526} - by MON>
;;; :FILE dbc-classes/dbc-class.lisp
;;; ==============================

(in-package #:dbc)

(defclass base-dbc () ;; persistent, rucsack, component, etc.
  ()
  (:documentation #.(format nil "Base class for dbc-specific sub-class objects.~%
:EXAMMPLE~%~@
 \(mon:class-subclasses \(find-class 'base-dbc\)\)~%")))


;;; ==============================

;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
