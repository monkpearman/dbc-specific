
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

;; (defgeneric (setf dbc-system-path-if) (object)
;;   (:documentation "Set the path for OBJECT if other slots are available and directory exists."))

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

(defmethod dbc-system-described ((obj dbc-system-path) stream)
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

(defmethod ensure-system-parent-path ((object dbc-system-subdir) &key)
  (with-accessors ((parent-path parent-path))
      object
    (when (null parent-path)
      (error 'system-path-error
             :w-sym 'ensure-system-parent-path
             :w-type 'method
             :w-system-slot 'parent-path
             :w-system-obj object
             :w-system-path parent-path
             :w-system-aux-msg "slot PARENT-PATH is null"))
    (let ((parent (fad:directory-exists-p parent-path)))
      (if (null parent)
          (error 'system-path-error
                 :w-sym 'ensure-system-parent-path
                 :w-type 'method
                 :w-system-slot 'parent-path
                 :w-system-obj object
                 :w-system-path parent-path
                 :w-system-aux-msg "slot PARENT-PATH names non-existent directory")
          parent))))

(defmethod dbc-system-path-if ((object dbc-system-subdir))
  (with-accessors ((parent-path parent-path)
                   (sub-name sub-name)
                   (sub-path sub-path))
      object
    (when (null sub-name)
      (error 'system-path-error
             :w-sym 'ensure-system-parent-path
             :w-type 'method
             :w-system-slot 'sub-name
             :w-system-obj object
             :w-system-path parent-path
             :w-system-aux-msg
             "slot SUB-NAME is null, not checking PARENT-PATH with fad:directory-exists-p"))
    (let ((chk-parent (ensure-system-parent-path object)))
      (setf chk-parent
            (merge-pathnames 
             (etypecase sub-name
                ;;(list (make-pathname :directory   `(:relative ,@sub-name)))
               (mon:each-a-string (make-pathname :directory   `(:relative ,@sub-name)))
               (string (make-pathname :directory `(:relative ,sub-name))))
             chk-parent))
      (mon::ref-bind chk-sub (fad:directory-exists-p chk-parent)
        (setf sub-path chk-sub)
        (error 'system-path-error
               :w-sym 'ensure-system-parent-path
               :w-type 'method
               :w-system-slot 'sub-path
               :w-system-obj object
               :w-system-path chk-parent
               :w-system-aux-msg (format nil "will not assign slot SUB-PATH to non-existent directory ~S" chk-parent)))
      sub-path)))


;; *dbc-xml-dump-dir*
;; *package*




;;; ==============================
;;; :FUNCTIONS
;;; ==============================

(defun find-dbc-system-path ()
  (let* ((dbc-sys-chk (or ;; :NOTE what about `cl:*load-pathname*'?
		       (mon:pathname-directory-system :dbc)
		       (mon:simple-error-mon  :w-sym  'find-dbc-system-path
					      :w-type 'function
					      :w-spec "mon:pathname-directory-system can not find system :DBC"
                                              :signal-or-only nil))) 
	 (dbc-if (or
		  (fad:directory-exists-p (make-pathname :directory dbc-sys-chk))
		  (mon:simple-error-mon  :w-sym  'find-dbc-system-path
					 :w-type 'function
					 :w-spec "calling `fad:directory-exists-p' but did not find pathname:~%~S"
					 :w-args `(,(make-pathname :directory dbc-sys-chk))
                                         :signal-or-only nil))))
    dbc-if))

(defun ensure-dbc-xml-dump-dir-exists ()
  (declare (special *dbc-system-path* *dbc-xml-dump-dir*))
  (unless (eql (class-of *dbc-xml-dump-dir*) (find-class 'dbc-system-subdir))
    (let ((pth-chk  (dbc-base-path *dbc-system-path*))
	  (dbc-dump (make-instance 'dbc-system-subdir :sub-name *dbc-xml-dump-dir*)))
      (or (and pth-chk
	       (setf (parent-path dbc-dump) pth-chk)
	       (setf (sub-path dbc-dump) 
		     (merge-pathnames (make-pathname :directory `(:relative ,(sub-name dbc-dump))) 
				      (parent-path dbc-dump)))
	       (ensure-directories-exist (sub-path dbc-dump) :verbose t)
	       (setf *dbc-xml-dump-dir* dbc-dump))
	  (warn ":FUNCTION `ensure-dbc-xml-dump-dir-exists' failed to initialize")))))

(defun make-system-subdir (w-var &key sub-name parent-path)  
  (and (or (and (not (symbolp w-var))
                (eql (class-of w-var)
                     (find-class 'dbc-system-subdir)))
           (and (symbolp w-var)
                (eql (class-of (symbol-value w-var))
                     (find-class 'dbc-system-subdir))))
       (mon:simple-error-mon :w-sym 'make-system-subdir
                             :w-type 'function
                             :w-spec '("W-VAR already instance of class DBC-SYSTEM-SUBDIR~%"
                                       "got-object: ~S~%object-specs:~%~A")
                             :w-args (let ((w-var-frobd (or (and (symbolp w-var)
                                                                 (symbol-value w-var))
                                                            w-var)))
                                       (list w-var-frobd
                                             (with-output-to-string (s)
                                               (dbc-system-described w-var-frobd s))))
                             :signal-or-only nil))
  (let ((tmp-ob (make-instance 'dbc-system-subdir
                               :sub-name (or sub-name (symbol-value w-var))
                               :parent-path parent-path
                               :var-name (cons (symbol-name (identity w-var))
                                               (identity w-var))))) 
    (and 
     (dbc-system-path-if tmp-ob)
     (setf (symbol-value w-var) tmp-ob)
     (prog1 (symbol-value w-var)
       (dbc-system-described (symbol-value w-var) t)))))


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

(mon:fundoc 'make-system-subdir
 "Make W-VAR an instance of class DBC-SYSTEM-SUBDIR.~%~@
Return value is as per `dbc-system-described'.~%~@
Keywords :SUB-NAME and :PARENT-PATH are as per DBC-SYSTEM-SUBDIR accessors.~%~@
When SUB-NAME is ommitted default to value of symbol W-VAR.~%~@
When W-VAR is already an instance of class DBC-SYSTEM-SUBDIR signal an error.~%~@
:EXAMPLE~%
 \(make-system-subdir '*dbc-notes-dir*
                     :parent-path \(dbc-base-path *dbc-system-path*\)\)~%~@
:SEE-ALSO `dbc-system-path-if'.~%►►►")


;;; ==============================
;;; EOF
