
;; dbc-specific/specials.lisp


(in-package #:dbc)

;; *package*

;; :NOTE see class definition of `dbc-xml->clos-dump' in :FILE

(eval-when (:compile-toplevel :load-toplevel :execute)

(defparameter *dbc-xml-dump-dir-name* "xml-class-dump-dir")

(defparameter *dbc-xml-dump-dir* nil)

(defun ensure-dbc-xml-dump-dir-exists ()
  (let ((pth-chk (mon:pathname-directory-system :dbc))
	(dbc-dump nil))
    (and (setf dbc-dump (fad:directory-exists-p (make-pathname :directory pth-chk)))
	 (setf dbc-dump
               (ensure-directories-exist 
                (merge-pathnames
                 (make-pathname :directory `(:relative ,*dbc-xml-dump-dir-name*))
                 dbc-dump)
                :verbose t))
	 (setf *dbc-xml-dump-dir* dbc-dump))))

(ensure-dbc-xml-dump-dir-exists))

;;; ==============================
;;; :SPECIALS-DOCUMENTATION
;;; ==============================

(setf (documentation '*dbc-xml-dump-dir-name* 'variable)
      #.(format nil
"System relative directory pathname component of `dbc:*dbc-xml-dump-dir*'.~%~@
Its value is evaluated by asdf with `dbc:ensure-dbc-xml-dump-dir-exists' after
the dbc system is loaded.~%~@
:EXAMPLE~%
 \(equal *dbc-xml-dump-dir-name* \"xml-class-dump-dir\"\) ~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(mon:fundoc 'ensure-dbc-xml-dump-dir-exists
"Verify, bind, create a base system relative directory for dbc xml->CLOS.~%~@
Evaluated after the dbc system is loaded. 
Binds value of `*dbc-xml-dump-dir*' according to `*dbc-xml-dump-dir-name*'.
Return non-nil on success.~%~@
:EXAMPLE~%
 \(ensure-dbc-xml-dump-dir\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")


;;; ==============================
;;; EOF
