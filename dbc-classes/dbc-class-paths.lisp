
;;; :FILE-CREATED <Timestamp: #{2011-01-31T22:43:22-05:00Z}#{11051} - by MON>
;;; ==============================

(in-package #:dbc)
;; *package*



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

(defgeneric dbc-system-path-if (object)
  (:documentation "Set the path for OBJECT if other slots are available and directory exists."))

(defgeneric (setf dbc-system-path-if) (object)
  (:documentation "Set the path for OBJECT if other slots are available and directory exists."))

(defgeneric ensure-system-parent-path (object &key)
  (:documentation "Ensure the specified parent path for object exists."))


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
  (:documentation "Base class for storing dbc system paths."))

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
  (:documentation "Subdir in the dbc-system-path."))

;; (find-method #'var-name nil '(dbc-system-subdir))
;=> #<SB-MOP:STANDARD-READER-METHOD VAR-NAME, slot:VAR-NAME, (DBC-SYSTEM-SUBDIR) {D0ED001}>

;; (and (mon:instancep *dbc-xml-dump-dir*)
;;       (class-of *dbc-xml-dump-dir*)


;;; ==============================
;;; :METHODS
;;; ==============================

(defmethod dbc-base-path ((system dbc-system-path))
  (slot-value system 'system-path))

(defmethod (setf dbc-base-path) (path (system dbc-system-path))
  (setf (slot-value system 'system-path) path))

(defmethod dbc-var-binding ((obj dbc-system-subdir))
  (slot-value obj 'var-name))

(defmethod (setf dbc-var-binding) (var (obj dbc-system-subdir))
  (etypecase var
    (null (setf (slot-value obj 'var-name) nil))
    (symbol 
     (setf (slot-value obj 'var-name)  
	   (cons (string var) var)))))

(defmethod dbc-system-described ((obj (eql *dbc-system-path*)) stream)
  (format stream "~{:~14A~@S~^~%~}"
	  (mapcan #'(lambda (x) 
		      (list x (and (slot-boundp  obj x)
				   (slot-value obj x))))
		  (sort (mon:class-slot-list (class-of obj)) #'string-lessp))))

(defmethod dbc-system-described ((obj dbc-system-subdir) stream)
  (format stream "~{:~14A~@S~^~%~}"
	  (mapcan #'(lambda (x) 
		      (list x (and (slot-boundp  obj x)
				   (slot-value obj x))))
		  (sort (mon:class-slot-list 'dbc-system-subdir) #'string-lessp))))



;; UNFINISHED
(defmethod ensure-system-parent-path ((object dbc-system-subdir) &key stream)
  (with-accessors ((sub-name sub-name)
                   (parent-path parent-path))
      object
    (if (null sub-name)
        (let ((object *dbc-xml-dump-dir*))
          (error 'simple-error 
                 :format-control "With class: DBC-SYSTEM-SUBDIR ~%~
                                  object: ~S has null slot SUB-NAME ~%~
                                  declining verification of fad:directory-exists-p ~%~
                                  with PARENT-PATH value: ~A" 
                 :format-arguments  (list object (parent-path object))))
        (let ((parent (and parent-path (fad:directory-exists-p parent-path))))
          (and parent 
               (setf parent
                     (merge-pathnames 
                            (make-pathname :directory `(:relative ,sub-name))
                            parent-path))
                     (setf do-sub (fad:directory-exists-p do-sub))))

           (or (and do-sub (setf sub-name do-sub))
               (dbc-system-described object nil)
               ;; finish me :SEE ./conditions.lisp system-path-error system-path-error
               ;; (mon:simple-error-mon :w-sym 'ensure-system-parent-path
               ;;                       :w-type 'function
               ;;                       :w-spec
               ;;                       :w-args
               ;;                       )
           ))))


(let ((object *dbc-xml-dump-dir*))
  (with-accessors ((sub-name sub-name)
                   (sub-path sub-path)
                   (parent-path parent-path))
      object
    (if (null sub-name)
        (error 'simple-error 
                 :format-control "With class: DBC-SYSTEM-SUBDIR ~%~
                                  object: ~S has null slot SUB-NAME ~%~
                                  declining verification of fad:directory-exists-p ~%~
                                  with PARENT-PATH value: ~A" 
                 :format-arguments  (list object (parent-path object)))
        (list parent-path sub-path sub-name))))


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
  (unless (eql (class-of *dbc-xml-dump-dir*) (find-class 'dbc-system-subdir))
    (let ((pth-chk  (dbc-base-path *dbc-system-path*))
	  (dbc-dump (make-instance 'dbc-system-subdir :sub-name *dbc-xml-dump-dir-name*)))
      (or (and pth-chk
	       (setf (parent-path dbc-dump) pth-chk)
	       (setf (sub-path dbc-dump) 
		     (merge-pathnames (make-pathname :directory `(:relative ,(sub-name dbc-dump))) 
				      (parent-path dbc-dump)))
	       (ensure-directories-exist (sub-path dbc-dump) :verbose t)
	       (setf *dbc-xml-dump-dir* dbc-dump))
	  (warn ":FUNCTION `ensure-dbc-xml-dump-dir-exists' failed to initialize")))))

;;; ==============================
;;; 


;;; ==============================



;;; ==============================
;; :SOURCE (URL `http://paste.lisp.org/+2K7Q')
;; (eval-when (:load-toplevel)
;;   (defun default-document-directory (&optional sub-directory)
;;     (ignore-errors (merge-pathnames (if sub-directory
;;                                         (merge-pathnames sub-directory "www/")
;;                                         "www/")
;;                                     (asdf:system-source-directory (asdf:find-system :hunchentoot))))))

;;; ==============================
;;; :DBC-CLASS-PATHS-DOCUMENTATION
;;; ==============================

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
