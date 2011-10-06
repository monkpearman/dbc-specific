;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/loadtime-bind.lisp

(in-package #:dbc)
;; *package*

(format nil "~%~%load-time-value pathname: ~S~%~%" (load-time-value *default-pathname-defaults*))

;; (setf *xml-refs-match-table* (make-ref-lookup-table *xml-refs-match-list*))


;;; ==============================

;; `*system-path*'
(unless (not (null *system-path*))
  (setf *system-path* (make-instance 'system-path))
  (setf (system-base-path *system-path*) (find-system-path))
  (prog1 t (terpri))
  (system-described *system-path* t))

;; so what is the asdf magic for simple locating the 
;; basically i have a top-level loadtime form that _was_ doing this:
;;  (asdf:system-source-directory (asdf:find-system :FOO-test))
;; That form is inside a file loadtime-bind.lisp that is loaded inside and asdf:perform :after
;; `*system-tests-dir*' `*system-tests-temp-dir*'
;; (asdf:system-relative-pathname 'dbc-test "dbc-tests/tests" :type "lisp")
;; (make-pathname :directory '(:relative "dbc-tests" "tests"))
;; (asdf:system-relative-pathname 'dbc-test "dbc-tests/tests")
;; (asdf:find-component 
;; (asdf:component-name-to-pathname-components
(let* ((dbc-test-base (asdf:system-relative-pathname :dbc-test ""))
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
        (and (not (null *system-path*))
             (stringp *system-tests-dir*)
             (equal (mon:last-elt (pathname-directory (elt path-tree 0)))
                    (mon:last-elt (pathname-directory (system-base-path *system-path*))))
             (progn 
               (dotimes (i 3) (terpri))
               (system-subdir-init-w-var '*system-tests-dir*
                                         :parent-path (elt path-tree 0))
               t))
        (when (and (typep *system-tests-dir* 'dbc:system-subdir)
                   (sub-path *system-tests-dir*)
                   (stringp *system-tests-temp-dir*)
                   (string= (namestring (merge-pathnames 
                                         (make-pathname :directory `(:relative ,*system-tests-temp-dir*))
                                         (sub-path *system-tests-dir*)))
                            (namestring (elt path-tree 2))))
          (progn
            (dotimes (i 3) (terpri))
            (system-subdir-init-w-var '*system-tests-temp-dir* 
                                      :parent-path (sub-path *system-tests-dir*))
            (terpri)
            t)))
   (warn "~%At loadtime a pathname did not satisfy `fad:directory-exists-p'~%~
            declining to set value of variables:~% ~
           `dbc:*system-tests-dir*' or `dbc:*system-tests-temp-dir*'~%~
            got:~% ~S~%"
         path-tree)))

;; `*xml-output-dir*'
(and (not (null *system-path*))
     (system-path-xml-dump-dir-ensure)
     (or (terpri) (terpri) t)
     (setf (system-path-var-binding *xml-output-dir*) '*xml-output-dir*)
     (prog1 t (terpri) (terpri))
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
    (terpri)
    ;; :NOTE `system-subdir-init-w-var' should take care of describing to *standard-output*
    ;; (when (sub-path *xml-input-dir*)
    ;;   (system-described *xml-input-dir* nil))
    ))

;; (and (sub-path *xml-input-dir*)
;;      (let (;; *xml-input-refs-name*
;;            (chk-sfr-if (fad:file-exists-p
;;                         (make-pathname :directory (pathname-directory (sub-path *xml-input-dir*))
;;                                        :name "dump-refs-DUMPING")))
;;            ;; *xml-input-refs-name-temp*
;;            (chk-nts-if
;;             (and 
;;              (sub-path *system-notes-dir*)
;;              (merge-pathnames (make-pathname :directory '(:relative "scratch-xml-for-parse")
;;                                              ;; :NOTE When really parsing use *xml-input-refs-name*
;;                                              ;;       when testing use "example-refs-in-short" and/or "example-refs"
;;                                              :name "example-refs-in-short"
;;                                              :type "in")
;;                               (sub-path *system-notes-dir*)))))
;;        ;; ---> OUTPUT
;;        (setf *xml-output-refs-name*
;;              (make-pathname :directory (pathname-directory (sub-path *xml-output-dir*))
;;                             ;; :NOTE When really parsing use "parsed-inventory-records-xml" 
;;                             ;;       when testing use "parsed-inventory-records-xml-SCRATCH"
;;                             :name "parsed-inventory-records-xml-SCRATCH"))
;;        (and *xml-output-refs-name*
;;             (setf *xml-output-refs-ext*
;;                   (merge-pathnames  (make-pathname :type "out") *xml-output-refs-name*)))
;;        ;; <--- INPUT
;;        (and chk-sfr-if (setf *xml-input-refs-name* chk-sfr-if))
;;        (and chk-nts-if (setf *xml-input-refs-name-temp* chk-nts-if))))

(setf *parsed-data-output-path*
      (merge-pathnames (make-pathname :directory `(:relative ,(sub-name *xml-output-dir*))
                                      :name (concatenate 'string "sax-refs-test-" (mon:time-string-yyyy-mm-dd))
                                      :type "lisp")
                       (system-base-path *system-path*)))

;;; ==============================
;; XML Parsing INPUT/OUTUPT paths and paths names
;; `*system-notes-dir*'
;; `*xml-output-dir*'              ---> OUTPUT
;; `*xml-output-refs-name*'        ---> OUTPUT
;; `*xml-output-refs-ext*'         ---> OUTPUT
;; `*xml-input-dir*'               <--- INPUT
;; `*xml-input-refs-name*'         <--- INPUT
;; `*xml-input-refs-name-temp*'    <--- INPUT
;;
;; (system-described *system-tests-dir* t)
;; (system-described *system-tests-temp-dir* t)
;; (system-described *system-path* t)
;; (system-described *system-notes-dir* t)
;; (system-base-path *system-path*)
;; (sub-path *system-notes-dir*))
;; (sub-path *xml-input-dir*)
;; (system-described *xml-input-dir* nil)
;; (sub-path *xml-output-dir*)
;; (system-described *xml-input-dir* nil)
;; *xml-output-refs-name*
;; *xml-input-refs-name*
;; *xml-input-refs-name-temp*
;;; ==============================


;; :TEST `set-parsed-inventory-record-slot-value'
;; (let ((obj (make-instance 'parsed-inventory-record)))
;;   (set-parsed-inventory-record-slot-value "edit_history" "88" obj)
;;   (values obj (edit-history obj)))
;;
;; (let ((obj (make-instance 'parsed-inventory-record)))
;;   (accessor-to-field-table obj))
;;
;;; *big-parsed-class-field-slot-accessor-mapping-table*

(def-set-parsed-class-record-slot-value 
    set-parsed-inventory-record-slot-value
    parsed-inventory-record)


;;; ==============================
;;; :EOF
