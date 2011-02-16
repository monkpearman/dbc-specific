;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/loadtime-bind.lisp

(in-package #:dbc)
;; *package*

;; `*dbc-system-path*'
(unless (not (null *dbc-system-path*))
  (setf *dbc-system-path* (make-instance 'dbc-system-path))
  (setf (dbc-base-path *dbc-system-path*) (find-dbc-system-path))
  (dbc-system-described *dbc-system-path* nil))

;; `*dbc-xml-dump-dir*'
(and (not (null *dbc-system-path*))
     (ensure-dbc-xml-dump-dir-exists)
     (setf (dbc-var-binding *dbc-xml-dump-dir*) '*dbc-xml-dump-dir*)
     (dbc-system-described *dbc-xml-dump-dir* nil))

;;

(progn
  ;; `*dbc-notes-dir*'
  (make-system-subdir '*dbc-notes-dir* 
                      :parent-path (dbc-base-path *dbc-system-path*))
  (when (sub-path *dbc-notes-dir*)
    (dotimes (i 3) (terpri))
    ;; `*dbc-xml-source-dir*'
    (make-system-subdir '*dbc-xml-source-dir*
                        :parent-path (sub-path *dbc-notes-dir*))))

;;; ==============================
;;; :LOADTIME-BIND-DOCUMENTATION
;;; ==============================


;;; ==============================
;;; :EOF
