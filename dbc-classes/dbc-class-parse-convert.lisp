;;; :FILE-CREATED <Timestamp: #{2011-01-07T13:22:46-05:00Z}#{11015} - by MON>
;;; :FILE ../dbc-classes/dbc-class-parse-convert.lisp
;;; ==============================

;; :NOTE This is the base class from wich other converted dbc-classes inherit.
;;      The intent is that this class should allow auxillary :before :after :around
;;      methods to act on the primary-methods of `parsed-class' inheritors.
;;      IOW, this your basic mixin base class :)


(in-package #:dbc)

;; *package*


;;; ==============================
(defclass parsed-class ()
  ()
  (:documentation "base dbc parsed class."))


;; Which slots accessors and generics should this class establish?



;;; ==============================
;;; EOF
