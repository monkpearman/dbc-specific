;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/loadtime-bind.lisp

(in-package #:dbc)
;; *package*

(unless (not (null *dbc-system-path*))
  (setf *dbc-system-path* (make-instance 'dbc-system-path))
  (setf (dbc-base-path *dbc-system-path*) (find-dbc-system-path))
  (dbc-system-described *dbc-system-path* *standard-output*))

(and (not (null *dbc-system-path*))
     (ensure-dbc-xml-dump-dir-exists)
     (setf (dbc-var-binding *dbc-xml-dump-dir*) '*dbc-xml-dump-dir*)
     (dbc-system-described *dbc-xml-dump-dir* *standard-output*))

;;; ==============================
(setf *dbc-xml-source-dir*
      (make-instance 'dbc-system-subdir 
		     :sub-name   *dbc-xml-source-dir*
		     :parent-path (merge-pathnames 
                                   (make-pathname :directory  '(:relative "from-DBC-ARCH-2010-09-01"))
                                   (dbc-base-path *dbc-system-path*))))

(setf (sub-path *dbc-xml-source-dir*)
      (merge-pathnames (make-pathname :directory `(:relative ,(sub-name *dbc-xml-source-dir*)))
		       (parent-path *dbc-xml-source-dir*)))
(setf (dbc-var-binding *dbc-xml-source-dir*) '*dbc-xml-source-dir*)
(dbc-system-described  *dbc-xml-source-dir* nil)


;; *dbc-xml-source-dir*
;; (merge-pathnames
;;    (make-pathname :directory '(:relative "notes-versioned"
;; 			       "sql-file-per-table-2010-08-25"
;; 			       "from-DBC-ARCH-2010-09-01"))
;;    (dbc-base-path *dbc-system-path*))

(setf *dbc-xml-source-dir*
      (make-instance 'dbc-system-subdir 
		     :sub-name   "sql-file-per-table-2010-08-25"
		     :parent-path (merge-pathnames (make-pathname 
						    :directory  '(:relative "from-DBC-ARCH-2010-09-01"))
						   (dbc-base-path *dbc-system-path*))))
(setf (sub-path *dbc-xml-source-dir*)
      (merge-pathnames (make-pathname :directory `(:relative ,(sub-name *dbc-xml-source-dir*)))
		       (parent-path *dbc-xml-source-dir*)))
(setf (dbc-var-binding *dbc-xml-source-dir*) '*dbc-xml-source-dir*)
(dbc-system-described  *dbc-xml-source-dir* nil)

;;; ==============================
;;; :LOADTIME-BIND-DOCUMENTATION
;;; ==============================


;;; ==============================
;;; :EOF
