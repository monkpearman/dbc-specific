
;; dbc-specific/specials.lisp


(in-package #:dbc)

;; *package*

;; :NOTE see class definition of `dbc-xml->clos-dump' in :FILE

(eval-when (:compile-toplevel :load-toplevel :execute)

(defparameter *dbc-system-path* nil
  "The base dbc-sytsem path.")

(defparameter *dbc-xml-dump-dir-name* "xml-class-dump-dir")

(defparameter *dbc-xml-dump-dir* nil)

(defgeneric dbc-base-path (dbc-system))

(defgeneric (setf dbc-base-path) (path dbc-system)
  (:documentation 
   "Set PATH for SYSTEM. Binds the class allocated slot system path for dbc-system-paths class."))

(defclass dbc-system-class ()
   ())

(defclass dbc-system-path (dbc-system-class)
  ((system-path 
    :initform '()
    :accessor dbc-base-path
    :allocation :class))
  (:documentation "Base class for storing dbc system paths"))

(defmethod dbc-base-path ((system dbc-system-path))
  (slot-value system 'system-path))

(defmethod (setf dbc-base-path) (path (system dbc-system-path))
  (setf (slot-value system 'system-path) path))

(setf *dbc-system-path* (make-instance 'dbc-system-path))

(setf (dbc-base-path *dbc-system-path*)

;; /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01

(defun find-dbc-sytem-path ()
  (let* ((dbc-sys-chk (mon:pathname-directory-system :dbc)) ;; *load-pathname*
	 (dbc-if (and dbc-sys-chk
		      (fad:directory-exists-p (make-pathname :directory dbc-sys-chk)))))
    (or (and dbc-if)
	(error 'mon:mon-error 
	       ;; :w-spec 
	       ;; :w-args
		 )
	 (setf *dbc-system-path* dbc-if))))

(defun ensure-dbc-xml-dump-dir-exists ()
  (declare (special *dbc-xml-dump-dir-name* *dbc-xml-dump-dir*))
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




;; (mon:pathname-directory-system :dbc)

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
