;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/loadtime-bind.lisp

(in-package #:dbc)
;; *package*

(format nil "~%~%load-time-value pathname: ~S~%~%" (load-time-value *default-pathname-defaults*))

(setf *xml-refs-match-table* (make-ref-lookup-table *xml-refs-match-list*))

;;; ==============================
;;; dbc-uuid.lisp
(setf *uuid-namespace-dns*  (make-uuid-from-string "6ba7b810-9dad-11d1-80b4-00c04fd430c8"))
(setf *uuid-namespace-url*  (make-uuid-from-string "6ba7b811-9dad-11d1-80b4-00c04fd430c8"))
(setf *uuid-namespace-oid*  (make-uuid-from-string "6ba7b812-9dad-11d1-80b4-00c04fd430c8"))
(setf *uuid-namespace-x500* (make-uuid-from-string "6ba7b814-9dad-11d1-80b4-00c04fd430c8"))
;;; ==============================


;; `*system-path*'
(unless (not (null *system-path*))
  (setf *system-path* (make-instance 'system-path))
  (setf (system-base-path *system-path*) (find-system-path))
  (prog1 t (terpri))
  (system-described *system-path* t))

;; `*system-tests-dir*' `*system-tests-temp-dir*'
(let* ((dbc-test-base (asdf:system-source-directory (asdf:find-system :dbc-test)))
       (test-dir (and dbc-test-base 
                      (fad:directory-exists-p
                       (merge-pathnames (make-pathname :directory '(:relative "dbc-tests"))
                                        dbc-test-base))))
       (test-temp-dir (and test-dir 
                           (fad:directory-exists-p
                            (merge-pathnames (make-pathname :directory '(:relative "tests"))
                                             test-dir))))
       (path-tree (list dbc-test-base test-dir test-temp-dir)))
  (or 
   (and (loop 
           for paths in path-tree 
           always (pathnamep paths))
        (and (not (null dbc:*system-path*))
             (stringp dbc::*system-tests-dir*)
             (equal (mon:last-elt (pathname-directory (elt path-tree 0)))
                    (mon:last-elt (pathname-directory (dbc:system-base-path dbc:*system-path*))))
             (dbc:system-subdir-init-w-var 'dbc::*system-tests-dir*
                                           :parent-path (elt path-tree 0)))
        (when (and (typep dbc::*system-tests-dir* 'dbc:system-subdir)
                   (dbc:sub-path dbc::*system-tests-dir*)
                   (stringp dbc::*system-tests-temp-dir*)
                   (string= (namestring (merge-pathnames 
                                         (make-pathname :directory `(:relative ,dbc::*system-tests-temp-dir*))
                                         (dbc:sub-path dbc::*system-tests-dir*)))
                            (namestring (elt path-tree 2))))
          (dotimes (i 3) (terpri))
          (dbc:system-subdir-init-w-var 'dbc::*system-tests-temp-dir*
                                        :parent-path (dbc:sub-path dbc::*system-tests-dir*))
          (terpri)))
   (warn "~%At loadtime a pathname did not satisfy `fad:directory-exists-p'~%~
            declining to set value of variables:~% ~
           `dbc:*system-tests-dir*' or `dbc:*system-tests-temp-dir*'~%~
            got:~% ~S~%"
         path-tree)))

;; `*xml-output-dir*'
(and (not (null *system-path*))
     (system-path-xml-dump-dir-ensure)
     (setf (system-path-var-binding *xml-output-dir*) '*xml-output-dir*)
     (prog1 t (terpri))
     (system-described *xml-output-dir* t))

(progn
  ;; `*system-notes-dir*'
  (system-subdir-init-w-var '*system-notes-dir* 
                            :parent-path (system-base-path *system-path*))
  (when (sub-path *system-notes-dir*)
    ;; :NOTE `system-subdir-init-w-var' should take care of describing to *standard-output*
    ;; (system-described *system-notes-dir* nil)
    ;; We terpri so as to delimit the descriptions.
    (dotimes (i 3) (terpri))
    ;; `*xml-input-dir*'
    (system-subdir-init-w-var '*xml-input-dir*
                        :parent-path (sub-path *system-notes-dir*))
    ;; :NOTE `system-subdir-init-w-var' should take care of describing to *standard-output*
    ;; (when (sub-path *xml-input-dir*)
    ;;   (system-described *xml-input-dir* nil))
    ))

(and (sub-path *xml-input-dir*)
     (let (;; *xml-input-refs-name*
           (chk-sfr-if (fad:file-exists-p
                        (make-pathname :directory (pathname-directory (sub-path *xml-input-dir*))
                                       :name "dump-refs-DUMPING")))
           ;; *xml-input-refs-name-temp*
           (chk-nts-if
            (and 
             (sub-path *system-notes-dir*)
             (merge-pathnames (make-pathname :directory '(:relative "scratch-xml-for-parse")
                                             ;; :NOTE When really parsing use *xml-input-refs-name*
                                             ;;       when testing use "example-refs-in-short" and/or "example-refs"
                                             :name "example-refs-in-short"
                                             :type "in")
                              (sub-path *system-notes-dir*)))))
       ;; ---> OUTPUT
       (setf *xml-output-refs-name*
             (make-pathname :directory (pathname-directory (sub-path *xml-output-dir*))
                            ;; :NOTE When really parsing use "parsed-refs-xml" 
                            ;;       when testing use "parsed-refs-xml-SCRATCH"
                            :name "parsed-refs-xml-SCRATCH"))
       (and *xml-output-refs-name*
            (setf *xml-output-refs-ext*
                  (merge-pathnames  (make-pathname :type "out") *xml-output-refs-name*)))
       ;; <--- INPUT
       (and chk-sfr-if (setf *xml-input-refs-name* chk-sfr-if))
       (and chk-nts-if (setf *xml-input-refs-name-temp* chk-nts-if))))

;;; ==============================
;;; :LOADTIME-BIND-DOCUMENTATION
;;; ==============================


;;; ==============================
;;; :EOF
