
;; dbc-specific/specials.lisp


(in-package #:dbc)

;; *package*

;; :NOTE see class definition of `dbc-xml->clos-dump' in :FILE


;;; ==============================
;;; :SPECIALS
;;; ==============================

(defparameter *dbc-system-path* nil
  "The base dbc-sytsem path.")

(defparameter *dbc-xml-dump-dir-name* "xml-class-dump-dir")

(defparameter *dbc-xml-dump-dir* nil)

(defparameter *dbc-xml-parseables-dir* nil)


;;; ==============================
;;; :GENERIC-FUNCTIONS
;;; ==============================

(defgeneric dbc-base-path (dbc-system))

(defgeneric (setf dbc-base-path) (path dbc-system)
  (:documentation 
   "Set PATH for SYSTEM. Binds the class allocated slot system path for dbc-system-paths class."))

(defgeneric dbc-system-described  (obj stream)
  (:documentation "Describer for dbc-systems objects." ))

(defgeneric dbc-var-binding (obj)
  (:documentation "Names a variable bound to an object instance."))

(defgeneric (setf dbc-var-binding) (var obj)
  (:documentation "Set the name of  a variable bound to an object instance."))


;;; ==============================
;;; :CLASSES
;;; ==============================

(defclass dbc-system-class ()
   ())

(defclass dbc-system-path (dbc-system-class)
  ((system-path 
    :initform nil
    :accessor dbc-base-path
    :allocation :class))
  (:documentation "Base class for storing dbc system paths"))

(defclass dbc-system-subdir (dbc-system-path)
  ((sub-path 
    :initarg :sub-path
    :initform nil
    :accessor sub-path
    :documentation "An existing pathname with SUB-NAME in PARENT-PATH.")
   (sub-name
    :initarg :sub-name
    :initform nil
    :accessor sub-name
    :documentation "Name component of a subdir of PARENT-PATH.")
   (parent-path
    :initarg :parent-path
    :initform nil
    :accessor parent-path
    :documentation "The immediate PATHNAME containing the SUB-PATH with SUB-NAME.")
   (var-name
    :initarg :var-name
    :initform nil
    ;; :accessor ;var-name dbc-var-binding)
    ))
  (:documentation "Subdir in the dbc-system-path"))

;; (find-method #'var-name nil '(dbc-system-subdir))
;=> #<SB-MOP:STANDARD-READER-METHOD VAR-NAME, slot:VAR-NAME, (DBC-SYSTEM-SUBDIR) {D0ED001}>

;; (and (mon:instancep *dbc-xml-dump-dir*)
;;       (class-of *dbc-xml-dump-dir*)


;;; ==============================
;;; :METHODS
;;; ==============================

(defmethod dbc-var-binding ((obj dbc-system-subdir))
  (slot-value obj 'var-name))

(defmethod (setf dbc-var-binding) (var (obj dbc-system-subdir))
  (etypecase var
    (null (setf (slot-value obj 'var-name) nil))
    (symbol 
     (setf (slot-value obj 'var-name)  
	   (cons (string var) var)))))

(defmethod dbc-system-described ((obj dbc-system-subdir) stream)
  (format stream "~{:~14A~@S~^~%~}"
	  (mapcan #'(lambda (x) 
		      (list x (and (slot-boundp  obj x)
				   (slot-value obj x))))
		  (sort (mon:class-slot-list 'dbc-system-subdir) #'string-lessp))))

(defmethod dbc-base-path ((system dbc-system-path))
  (slot-value system 'system-path))

(defmethod (setf dbc-base-path) (path (system dbc-system-path))
  (setf (slot-value system 'system-path) path))


;;; ==============================
;;; :FUNCTIONS
;;; ==============================

(defun find-dbc-system-path ()
  (let* ((dbc-sys-chk (or ;; :NOTE what about `cl:*load-pathname*'?
		       (mon:pathname-directory-system :dbc)
		       (mon:simple-error-mon  :w-sym  'find-dbc-system-path
					      :w-type 'function
					      :w-spec "mon:pathname-directory-system can not find system :DBC"))) 
	 (dbc-if (or
		  (fad:directory-exists-p (make-pathname :directory dbc-sys-chk))
		  (mon:simple-error-mon  :w-sym  'find-dbc-system-path
					 :w-type 'function
					 :w-spec "calling `fad:directory-exists-p' but did not find pathname:~%~S"
					 :w-args `(,(make-pathname :directory dbc-sys-chk))))))
    
    dbc-if))

(defun ensure-dbc-xml-dump-dir-exists ()
  (declare (special *dbc-system-path* *dbc-xml-dump-dir-name* *dbc-xml-dump-dir*))
  (unless (not (null *dbc-xml-dump-dir*)) 
    (let ((pth-chk  (dbc-base-path *dbc-system-path*))
	  (dbc-dump (make-instance 'dbc-system-subdir :sub-name *dbc-xml-dump-dir-name*)))
      (or (and pth-chk
	       (setf (parent-path dbc-dump) pth-chk)
	       (setf (sub-path dbc-dump) 
		     (merge-pathnames (make-pathname :directory `(:relative ,(sub-name dbc-dump))) 
				      (parent-path dbc-dump)))
	       (ensure-directories-exist (sub-path dbc-dump) :verbose t)
	       (setf *dbc-xml-dump-dir* dbc-dump))
	  (warn ":FUNCTION `ensure-dbc-xml-dump-dir-exists' failed to initialize")
	  ))))

(unless (not (null *dbc-system-path*))
  (setf *dbc-system-path* (make-instance 'dbc-system-path))
  (setf (dbc-base-path *dbc-system-path*) (find-dbc-system-path))
  (ensure-dbc-xml-dump-dir-exists)  
  ;;(dbc-system-described *dbc-xml-dump-dir* nil)  
  (dbc-system-described *dbc-xml-dump-dir* *standard-output*))


(setf (dbc-var-binding *dbc-xml-dump-dir*) '*dbc-xml-dump-dir*)
(setf *dbc-xml-parseables-dir*
      (make-instance 'dbc-system-subdir 
		     :sub-name   "sql-file-per-table-2010-08-25"
		     :parent-path (merge-pathnames (make-pathname 
						    :directory  '(:relative "from-DBC-ARCH-2010-09-01"))
						   (dbc-base-path *dbc-system-path*))))
(setf (sub-path *dbc-xml-parseables-dir*)
      (merge-pathnames (make-pathname :directory `(:relative ,(sub-name *dbc-xml-parseables-dir*)))
		       (parent-path *dbc-xml-parseables-dir*)))
(setf (dbc-var-binding *dbc-xml-parseables-dir*) '*dbc-xml-parseables-dir*)
(dbc-system-described  *dbc-xml-parseables-dir* nil)



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

(mon:fundoc 'find-dbc-system-path
" <DOCSTR> ~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")


;;; ==============================
;;; EOF
