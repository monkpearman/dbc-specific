;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/loadtime-bind.lisp

(in-package #:dbc)
;; *package*

(format nil "~%~%load-time-value pathname: ~S~%~%" (load-time-value *default-pathname-defaults*))

(setf *dbc-xml-refs-match-table* (make-ref-lookup-table *dbc-xml-refs-match*))

;; `*dbc-system-path*'
(unless (not (null *dbc-system-path*))
  (setf *dbc-system-path* (make-instance 'dbc-system-path))
  (setf (dbc-base-path *dbc-system-path*) (find-dbc-system-path))
  (prog1 t (terpri))
  (dbc-system-described *dbc-system-path* t))

;; `*dbc-xml-dump-dir*'
(and (not (null *dbc-system-path*))
     (ensure-dbc-xml-dump-dir-exists)
     (setf (dbc-var-binding *dbc-xml-dump-dir*) '*dbc-xml-dump-dir*)
     (prog1 t (terpri))
     (dbc-system-described *dbc-xml-dump-dir* t))

(progn
  ;; `*dbc-notes-dir*'
  (make-system-subdir '*dbc-notes-dir* 
                      :parent-path (dbc-base-path *dbc-system-path*))
  (when (sub-path *dbc-notes-dir*)
    ;; :NOTE `make-system-subdir' should take care of describing to *standard-output*
    ;; (dbc-system-described *dbc-notes-dir* nil)
    ;; We terpri so as to delimit the descriptions.
    (dotimes (i 3) (terpri))
    ;; `*dbc-xml-source-dir*'
    (make-system-subdir '*dbc-xml-source-dir*
                        :parent-path (sub-path *dbc-notes-dir*))
    ;; :NOTE `make-system-subdir' should take care of describing to *standard-output*
    ;; (when (sub-path *dbc-xml-source-dir*)
    ;;   (dbc-system-described *dbc-xml-source-dir* nil))
    ))

(and (sub-path *dbc-xml-source-dir*)
     (let (;; *dbc-xml-source-file-refs*
           (chk-sfr-if (fad:file-exists-p
                        (make-pathname :directory (pathname-directory (sub-path *dbc-xml-source-dir*))
                                       :name "dump-refs-DUMPING")))
           ;; *dbc-xml-source-file-refs-temp-name*
           (chk-nts-if
            (and 
             (sub-path *dbc-notes-dir*)
             (merge-pathnames (make-pathname :directory '(:relative "scratch-xml-for-parse")
                                             ;; :NOTE When really parsing use *dbc-xml-source-file-refs*
                                             ;;       when testing use "example-refs-in-short" and/or "example-refs"
                                             :name "example-refs-in-short"
                                             :type "in")
                              (sub-path *dbc-notes-dir*)))))
       ;; ---> OUTPUT
       (setf *dbc-xml-dump-file-refs-name*
             (make-pathname :directory (pathname-directory (sub-path *dbc-xml-dump-dir*))
                            ;; :NOTE When really parsing use "parsed-refs-xml" 
                            ;;       when testing use "parsed-refs-xml-SCRATCH"
                            :name "parsed-refs-xml-SCRATCH"))
       (and *dbc-xml-dump-file-refs-name*
            (setf *dbc-xml-dump-file-refs-out*
                  (merge-pathnames  (make-pathname :type "out") *dbc-xml-dump-file-refs-name*)))
       ;; <--- INPUT
       (and chk-sfr-if (setf *dbc-xml-source-file-refs* chk-sfr-if))
       (and chk-nts-if (setf *dbc-xml-source-file-refs-temp-name* chk-nts-if))))

;;; ==============================
;;; :LOADTIME-BIND-DOCUMENTATION
;;; ==============================


;;; ==============================
;;; :EOF
