;;; :FILE-CREATED <Timestamp: #{2011-01-31T22:43:22-05:00Z}#{11051} - by MON>
;;; :FILE dbc-classes/dbc-class-paths.lisp
;;; ==============================


(in-package #:dbc)



;;; ==============================
;;; :GENERIC-FUNCTIONS
;;; ==============================

;; User code should not specialize methods on this function use system-path instead.
(defgeneric system-base-path (dbc-system))

;; :NOTE The intent is that this slot be bound _once_ at system loadtime and not
;; intendend for user code method specializers!
(defgeneric (setf system-base-path) (path dbc-system))

;; :NOTE User code should specialize methods on this function.
(defgeneric system-path (dbc-system))

;; :SEE (URL `http://paste.lisp.org/+2L12/1')
;; :NOTE A no-op when attempting to set class allocated slot value `system-path' of DBC-SYSTEM.~%~@
;; The value of the the `system-path' slot affects _all_ instances of `system-path' and~@
;; subclassed instances. It is not intendend that this slot be directly setfable!
(defgeneric (setf system-path) (var dbc-system))
 
;; :NOTE What about specializing on the GF `cl:describe' instead??
(defgeneric system-described  (obj stream))

(defgeneric system-path-var-binding (obj))

(defgeneric (setf system-path-var-binding) (var obj))

(defgeneric system-path-if (object))

;; (defgeneric (setf system-path-if) (object)
;;   (:documentation "Set the path for OBJECT if other slots are available and directory exists."))

(defgeneric system-parent-path-ensure (object &key))


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

;; (and (mon:instancep *xml-output-dir*) (class-of *xml-output-dir*)



;;; ==============================
;;; :METHODS
;;; ==============================

(defmethod system-base-path ((system system-path))
  (slot-value system 'system-path))

(defmethod (setf system-base-path) (path (system system-path))
  (setf (slot-value system 'system-path) path))
;; method-combination
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
		  (sort (MON:CLASS-SLOT-LIST (class-of obj)) #'string-lessp))))

(defmethod system-described ((obj system-subdir) stream)
  (format stream "~{:~14A~@S~^~%~}"
	  (mapcan #'(lambda (x)
		      (list x (and (slot-boundp  obj x)
				   (slot-value obj x))))
		  (sort (MON:CLASS-SLOT-LIST 'system-subdir) #'string-lessp))))

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
    ;; :WAS (let ((parent (FAD:DIRECTORY-EXISTS-P parent-path)))
    (let ((parent (UIOP:DIRECTORY-EXISTS-P parent-path)))
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
             "slot SUB-NAME is null, not checking PARENT-PATH with uiop:directory-exists-p"))
    (let ((chk-parent (system-parent-path-ensure object)))
      (setf chk-parent
            (merge-pathnames
             (etypecase sub-name
                ;;(list (make-pathname :directory   `(:relative ,@sub-name)))
               (MON:EACH-A-STRING (make-pathname :directory   `(:relative ,@sub-name)))
               (string (make-pathname :directory `(:relative ,sub-name))))
             chk-parent))
      ;;(MON::REF-BIND chk-sub (FAD:DIRECTORY-EXISTS-P chk-parent)
      (MON::REF-BIND chk-sub (UIOP:DIRECTORY-EXISTS-P chk-parent)
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
;; However, `mon:pathname-directory-system' may eventually be rewritten because
;; I misunderstood the semantics of which asdf:find-system
(defun find-system-path ()
  (let* ((dbc-sys-chk
          (or ;; :NOTE what about `cl:*load-pathname*'?
           ;; :WAS (pathname-directory (mon:pathname-directory-system :dbc))
           (pathname-directory (ASDF/SYSTEM-REGISTRY:SYSDEF-CENTRAL-REGISTRY-SEARCH :DBC))
           (MON:SIMPLE-ERROR-MON  :w-sym  'find-system-path
                                  :w-type 'function
                                  :w-spec "asdf/system-registry:sysdef-central-registry-search can not find system :DBC"
                                  :signal-or-only nil)))
	 (dbc-if (or
                  ;;:WAS (fad:directory-exists-p (make-pathname :directory dbc-sys-chk)) ;; Paranoia
                  (UIOP:DIRECTORY-EXISTS-P (make-pathname :directory dbc-sys-chk)) ;; Paranoia
		  (MON:SIMPLE-ERROR-MON  :w-sym  'find-system-path
					 :w-type 'function
					 :w-spec "calling `uiop:directory-exists-p' but did not find pathname:~%~S"
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

;; :TODO This needs to have a restart that won't signal when we're simply reloading the system.
(defun system-subdir-init-w-var (w-var &key sub-name parent-path)
  (unless dbc-build-system::*dbc-build-system-reloading-system*
    (and (or (and (not (symbolp w-var))
                  (eql (class-of w-var)
                       (find-class 'system-subdir)))
             (and (symbolp w-var)
                  (eql (class-of (symbol-value w-var))
                       (find-class 'system-subdir))))
         (MON:SIMPLE-ERROR-MON :w-sym 'system-subdir-init-w-var
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
         (system-described (symbol-value w-var) t))))))


;;; ==============================
;; :SOURCE (URL `http://paste.lisp.org/+2K7Q')
;; (eval-when (:load-toplevel)
;;   (defun default-document-directory (&optional sub-directory)
;;     (ignore-errors (merge-pathnames (if sub-directory
;;                                         (merge-pathnames sub-directory "www/")
;;                                         "www/")
;;                                     (asdf:system-source-directory (asdf:find-system :hunchentoot))))))



;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: nil
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
