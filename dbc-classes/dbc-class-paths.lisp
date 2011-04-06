;;; :FILE-CREATED <Timestamp: #{2011-01-31T22:43:22-05:00Z}#{11051} - by MON>
;;; :FILE dbc-classes/dbc-class-paths.lisp
;;; ==============================


(in-package #:dbc)
;; *package*



;;; ==============================
;;; :GENERIC-FUNCTIONS
;;; ==============================

(defgeneric system-base-path (dbc-system)
  (:documentation 
   #.(format nil
"Access the class allocated slot value `system-path' of DBC-SYSTEM.~%~@
The value of the `system-path' slot affects _all_ instances of `system-path' and~@
subclassed instances.
User code should not specialize methods on this function use system-path instead.~%►►►~%")))

(defgeneric (setf system-base-path) (path dbc-system)
  (:documentation 
   #.(format nil
"Set class allocated slot `system-path' to PATH for DBC-SYSTEM.~%~@
Setting the `system-path' slot affects _all_ instances of `system-path' class and
subclassing instances.~%~@
The intent is that this slot be bound _once_ at system loadtime.
IOW not intendend for user code method specializers!~%►►►~%")))

(defgeneric system-path (dbc-system)
  (:documentation 
   #.(format nil
"Access the class allocated slot value `system-path' of DBC-SYSTEM.~%~@
The value of the the `system-path' slot affects _all_ instances of `system-path' and~@
subclassed instances. It is not intendend that this slot be setfable.
User code should specialize methods on this function.~%►►►~%")))

;; :SEE (URL `http://paste.lisp.org/+2L12/1')
(defgeneric (setf system-path) (var dbc-system)
  (:documentation 
   #.(format nil
"A no-op when attempting to set class allocated slot value `system-path' of DBC-SYSTEM.~%~@
The value of the the `system-path' slot affects _all_ instances of `system-path' and~@
subclassed instances. It is not intendend that this slot be directly setfable!~%►►►~%")))

;; :NOTE What about specializing on the GF `cl:describe' instead??
(defgeneric system-described  (obj stream)
  (:documentation
   #.(format nil "Describer for instances of subclasses of `system-base'.~%►►►~%" )))

(defgeneric system-path-var-binding (obj)
  (:documentation
   #.(format nil "Names a variable bound to an object instance.~%►►►~%")))

(defgeneric (setf system-path-var-binding) (var obj)
  (:documentation
   #.(format nil "Set the name of  a variable bound to an object instance.~%►►►~%")))

(defgeneric system-path-if (object)
  (:documentation
   #.(format nil"Set the path for OBJECT if other slots are available and directory exists.~%►►►~%")))

;; (defgeneric (setf system-path-if) (object)
;;   (:documentation "Set the path for OBJECT if other slots are available and directory exists."))

(defgeneric system-parent-path-ensure (object &key)
  (:documentation
   #.(format nil "Ensure the specified parent path for object exists.~%►►►~%")))


;;; ==============================
;;; :CLASSES
;;; ==============================

(defclass system-base (base-dbc)
  ()
  (:documentation #.(classdoc 'system-base :class-doc)))

(defclass system-path (system-base)
  ((system-path 
    :initform nil
    :accessor system-base-path
    :allocation :class
    :documentation #.(classdoc 'system-path :system-path)))
  (:documentation  #.(classdoc 'system-path :class-doc)))

(defclass system-subdir (system-path)
  ((sub-path 
    :initarg :sub-path
    :initform nil
    :accessor sub-path
    :documentation #.(classdoc 'system-subdir :sub-path))
   (sub-name
    :initarg :sub-name
    :initform nil
    :accessor sub-name
    :documentation #.(classdoc 'system-subdir :sub-name))
   (parent-path
    :initarg :parent-path
    :initform nil
    :accessor parent-path
    :documentation #.(classdoc 'system-subdir :parent-path))
   (var-name
    :initarg :var-name
    :initform nil
    ;; :accessor ;var-name system-path-var-binding)
    :documentation #.(classdoc 'system-subdir :var-name)))
  (:documentation  #.(classdoc 'system-subdir :class-doc)))


;; (find-method #'var-name nil '(system-subdir))
;=> #<SB-MOP:STANDARD-READER-METHOD VAR-NAME, slot:VAR-NAME, (SYSTEM-SUBDIR) {D0ED001}>

;; (and (mon:instancep *xml-output-dir*)
;;       (class-of *xml-output-dir*)


;;; ==============================
;;; :METHODS
;;; ==============================

(defmethod system-base-path ((system system-path))
  (slot-value system 'system-path))

(defmethod (setf system-base-path) (path (system system-path))
  (setf (slot-value system 'system-path) path))

(defmethod system-path ((system system-path))
  (system-base-path system))

;; Make sure a primary (setf system-path) method exists or SBCL complains:
;; There is no primary method for the generic function {...}
;; [Condition of type SB-PCL::NO-PRIMARY-METHOD]
(defmethod (setf system-path) (path (system system-path))
  path)

;; Don't violate expectations of the `setf' protocol.
;; The (setf system-path) :around method should return PATH.
(defmethod (setf system-path) :around (path (system system-path))
  ;; (declare (ignore path))
  (progn 
    (setf (slot-value system 'system-path) (slot-value system 'system-path))
    path))

(defmethod system-path-var-binding ((obj system-subdir))
  (slot-value obj 'var-name))

(defmethod (setf system-path-var-binding) (var (obj system-subdir))
  (etypecase var
    (null (setf (slot-value obj 'var-name) nil))
    (symbol 
     (setf (slot-value obj 'var-name)  
	   (cons (string var) var)))))

(defmethod system-described ((obj system-path) stream)
  (format stream "~{:~14A~@S~^~%~}"
	  (mapcan #'(lambda (x) 
		      (list x (and (slot-boundp  obj x)
				   (slot-value obj x))))
		  (sort (mon:class-slot-list (class-of obj)) #'string-lessp))))

(defmethod system-described ((obj system-subdir) stream)
  (format stream "~{:~14A~@S~^~%~}"
	  (mapcan #'(lambda (x) 
		      (list x (and (slot-boundp  obj x)
				   (slot-value obj x))))
		  (sort (mon:class-slot-list 'system-subdir) #'string-lessp))))

(defmethod system-parent-path-ensure ((object system-subdir) &key)
  (with-accessors ((parent-path parent-path))
      object
    (when (null parent-path)
      (error 'system-path-error
             :w-sym 'system-parent-path-ensure
             :w-type 'method
             :w-system-slot 'parent-path
             :w-system-obj object
             :w-system-path parent-path
             :w-system-aux-msg "slot PARENT-PATH is null"))
    (let ((parent (fad:directory-exists-p parent-path)))
      (if (null parent)
          (error 'system-path-error
                 :w-sym 'system-parent-path-ensure
                 :w-type 'method
                 :w-system-slot 'parent-path
                 :w-system-obj object
                 :w-system-path parent-path
                 :w-system-aux-msg "slot PARENT-PATH names non-existent directory")
          parent))))

(defmethod system-path-if ((object system-subdir))
  (with-accessors ((parent-path parent-path)
                   (sub-name sub-name)
                   (sub-path sub-path))
      object
    (when (null sub-name)
      (error 'system-path-error
             :w-sym 'system-parent-path-ensure
             :w-type 'method
             :w-system-slot 'sub-name
             :w-system-obj object
             :w-system-path parent-path
             :w-system-aux-msg
             "slot SUB-NAME is null, not checking PARENT-PATH with fad:directory-exists-p"))
    (let ((chk-parent (system-parent-path-ensure object)))
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
               :w-sym 'system-parent-path-ensure
               :w-type 'method
               :w-system-slot 'sub-path
               :w-system-obj object
               :w-system-path chk-parent
               :w-system-aux-msg (format nil "will not assign slot SUB-PATH to non-existent directory ~S" chk-parent)))
      sub-path)))


;;; ==============================
;;; :FUNCTIONS
;;; ==============================

;; :NOTE As currently written, the let-binding of dbc-sys-chk with the
;; conditional on `mon:pathname-directory-system' is likely damn near impossible
;; to signal, esp. as we only intend that it be invoked at loadtime in a top level
;; form from a file `cl:load'ed by way of an `asdf:perform' :after method
;; specialized on `asdf:load-op'. IOW by the time the `dbc:find-system-path'
;; form is evaluated the :dbc system _must_ present. And, if it isn't
;; `mon:pathname-directory-system' will make it so...
;; However, `mon:pathname-directory-system' may eventually be rewritten because I misunderstood the semantics of which asdf:find-system
(defun find-system-path ()
  (let* ((dbc-sys-chk 
          (or ;; :NOTE what about `cl:*load-pathname*'?
           (pathname-directory (mon:pathname-directory-system :dbc))
           (mon:simple-error-mon  :w-sym  'find-system-path
                                  :w-type 'function
                                  :w-spec "mon:pathname-directory-system can not find system :DBC"
                                  :signal-or-only nil))) 
	 (dbc-if (or
		  (fad:directory-exists-p (make-pathname :directory dbc-sys-chk)) ;; Paranoia
		  (mon:simple-error-mon  :w-sym  'find-system-path
					 :w-type 'function
					 :w-spec "calling `fad:directory-exists-p' but did not find pathname:~%~S"
					 :w-args `(,(make-pathname :directory dbc-sys-chk))
                                         :signal-or-only nil))))
    dbc-if))

(defun system-path-xml-dump-dir-ensure ()
  (declare (special *system-path* *xml-output-dir*))
  (unless (eql (class-of *xml-output-dir*) (find-class 'system-subdir))
    (let ((pth-chk  (system-base-path *system-path*))
	  (dbc-dump (make-instance 'system-subdir :sub-name *xml-output-dir*)))
      (or (and pth-chk
	       (setf (parent-path dbc-dump) pth-chk)
	       (setf (sub-path dbc-dump) 
		     (merge-pathnames (make-pathname :directory `(:relative ,(sub-name dbc-dump))) 
				      (parent-path dbc-dump)))
	       (ensure-directories-exist (sub-path dbc-dump) :verbose t)
	       (setf *xml-output-dir* dbc-dump))
	  (warn ":FUNCTION `system-path-xml-dump-dir-ensure' failed to initialize")))))

;; :TODO Needs to be renamed system-subdir-init-w-var -> 
(defun system-subdir-init-w-var (w-var &key sub-name parent-path)  
  (and (or (and (not (symbolp w-var))
                (eql (class-of w-var)
                     (find-class 'system-subdir)))
           (and (symbolp w-var)
                (eql (class-of (symbol-value w-var))
                     (find-class 'system-subdir))))
       (mon:simple-error-mon :w-sym 'system-subdir-init-w-var
                             :w-type 'function
                             :w-spec '("W-VAR already instance of class SYSTEM-SUBDIR~%"
                                       "got-object: ~S~%object-specs:~%~A")
                             :w-args (let ((w-var-frobd (or (and (symbolp w-var)
                                                                 (symbol-value w-var))
                                                            w-var)))
                                       (list w-var-frobd
                                             (with-output-to-string (s)
                                               (system-described w-var-frobd s))))
                             :signal-or-only nil))
  (let ((tmp-ob (make-instance 'system-subdir
                               :sub-name (or sub-name (symbol-value w-var))
                               :parent-path parent-path
                               :var-name (cons (symbol-name (identity w-var))
                                               (identity w-var))))) 
    (and 
     (system-path-if tmp-ob)
     (setf (symbol-value w-var) tmp-ob)
     (prog1 (symbol-value w-var)
       (system-described (symbol-value w-var) t)))))


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
;; `dbc:system-path-xml-dump-dir-ensure'
;; `dbc:find-system-path'
;; `dbc:system-subdir-init-w-var'

(fundoc 'system-path-xml-dump-dir-ensure
"Verify, bind, create a base system relative directory for dbc xml->CLOS.~%~@
Evaluated after the dbc system is loaded.~%~@
Binds value of `dbc:*xml-output-dir*' according to `dbc:*dbc-xml-dump-dir-name*'.
Return non-nil on success.~%~@
:EXAMPLE~%
 \(ensure-dbc-xml-dump-dir\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'find-system-path
"Return the pathname-directory of the system.~%~@
Signal an error if system can not be found or its directory does not exist.~%~@
:EXAMPLE~%
 \(find-system-path\)~%~@
:SEE-ALSO `dbc:system-path-if'.~%►►►")

(fundoc 'system-subdir-init-w-var
 "Make W-VAR an instance of class SYSTEM-SUBDIR.~%~@
Return value is as per `system-described'.~%~@
Keywords :SUB-NAME and :PARENT-PATH are as per SYSTEM-SUBDIR accessors.~%~@
When SUB-NAME is ommitted default to value of symbol W-VAR.~%~@
When W-VAR is already an instance of class SYSTEM-SUBDIR signal an error.~%~@
:EXAMPLE~%
 \(system-subdir-init-w-var '*dbc-notes-dir*
                     :parent-path \(system-base-path *system-path*\)\)~%~@
:SEE-ALSO `system-path-if'.~%►►►")

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
