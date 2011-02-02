
;;; :FILE-CREATED <Timestamp: #{2011-01-31T22:43:22-05:00Z}#{11051} - by MON>
;;; ==============================

(in-package #:dbc)
;; *package*

(defgeneric dbc-system-path-if (object)
  (:documentation "Set the path for OBJECT if other slots are available and directory exists."))

(defgeneric (setf dbc-system-path-if) (object)
  (:documentation "Set the path for OBJECT if other slots are available and directory exists."))

(defgeneric ensure-system-parent-path (object &key)
  (:documentation "Ensure the specified parent path for object exists"))

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
               ;; finish me :SEE ./conditions.lisp system-path-error
               (mon:simple-error-mon :w-sym 'ensure-system-parent-path
                                     :
                                     )
           ))))

(defun ensure-dbc-parent-path-exists ()
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
;; ensure-dbc-xml-dump-dir-exists

;;; ==============================
;;; EOF
