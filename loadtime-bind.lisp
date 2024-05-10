;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/loadtime-bind.lisp
;;; ==============================


(in-package #:dbc)


(format nil "~%~%load-time-value pathname: ~S~%~%" (load-time-value *default-pathname-defaults*))

;; :SEE dbc-specific/dbc-parse/dbc-xml-refs-parse-work-scratch-2011-05-15.lisp
;; *xml-refs-match-table*
;; *xml-refs-match-list*
;; (setf *xml-refs-match-table* (make-ref-lookup-table *xml-refs-match-list*))

;; (field-to-accessor-table (gethash 'parsed-inventory-record *parsed-class-field-slot-accessor-mapping-table*))

;;; ==============================

;; `*system-path*'
(unless (not (null *system-path*))
  (setf *system-path* (make-instance 'system-path))
  (setf (system-base-path *system-path*) (find-system-path))
  (prog1 t (terpri))
  (system-described  *system-path* t))

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
(let* ((dbc-test-base 
         ;; :WAS (asdf:system-relative-pathname :dbc-test "") => #P"/Users/monkpearman/Documents/HG-Repos/CL-MON-CODE/dbc-specific/")
         (make-pathname :directory (pathname-directory (ASDF/SYSTEM-REGISTRY:SYSDEF-CENTRAL-REGISTRY-SEARCH :DBC))))
       (test-dir (and dbc-test-base 
                      (UIOP:DIRECTORY-EXISTS-P  ;; :WAS fad:directory-exists-p
                       (merge-pathnames (make-pathname :directory '(:relative "dbc-tests")) dbc-test-base)))) 
       (test-temp-dir (and test-dir 
                           (UIOP:DIRECTORY-EXISTS-P  ;; :WAS fad:directory-exists-p
                            (merge-pathnames (make-pathname :directory '(:relative "tests")) test-dir))))
       (path-tree (list dbc-test-base test-dir test-temp-dir)))
  (or 
   (and (loop 
           for paths in path-tree 
           always (pathnamep paths))
        (and (not (null *system-path*))
             (stringp *system-tests-dir*)
             (equal (MON:LAST-ELT (pathname-directory (elt path-tree 0)))
                    (MON:LAST-ELT (pathname-directory (system-base-path *system-path*))))
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

;; *parsed-class-table-csv-output-dir*
(prog1
    (system-subdir-init-w-var '*parsed-class-table-csv-output-dir*
                              :parent-path (dbc::sub-path dbc::*xml-output-dir*))
  (terpri))

;; `*parsed-class-table-output-dir*'
(prog1
    (system-subdir-init-w-var '*parsed-class-table-output-dir*
                              :parent-path (dbc::sub-path dbc::*xml-output-dir*))
  (terpri))

;; `*parsed-tgm-theme-output-dir*'
(prog1
    (system-subdir-init-w-var '*parsed-tgm-theme-output-dir*
                              :parent-path (dbc::sub-path dbc::*parsed-class-table-output-dir*))
   (terpri))

;; `*parsed-tgm-theme-input-dir*'
(prog1
    (system-subdir-init-w-var '*parsed-tgm-theme-input-dir*
                              :parent-path (dbc::sub-path dbc::*parsed-tgm-theme-output-dir*))
   (terpri))

;; `*parsed-tgm-theme-xml-source-pathname*'
(tgm-parse-concepts-set-source-xml-file (merge-pathnames
                                        (dbc::sub-path dbc::*parsed-tgm-theme-input-dir*)
                                        (make-pathname :name "tgm1" :type "xml")))

;; (system-described *system-notes-dir* t)
;; (let ((dbc-build-system::*dbc-build-system-reloading-system* t))
(when
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
;;)

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
;;
;; (setf *parsed-data-output-path*
;;       (merge-pathnames (make-pathname :directory `(:relative ,(sub-name *xml-output-dir*))
;;                                       :name (concatenate 'string "sax-refs-test-" (mon:time-string-yyyy-mm-dd))
;;                                       :type "lisp")
;;                        (system-base-path *system-path*)))

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

;; *parsed-class-parse-table*


;;; ==============================
;;; `parsed-inventory-record'
;;; ==============================

;; define the `parsed-inventory-record-<FOO>-lookup' functions/methods
(eval-when (:compile-toplevel :load-toplevel :execute)
  (%parsed-inventory-record-parse-table-lookup-slot-value-maybe-remove)
  (loop 
    for def-slot in (accessors-of-parsed-class 'parsed-inventory-record)
    collect (list 'def-parsed-inventory-record-parse-table-lookup-slot-value def-slot) into def-forms
    finally (return
              (values 
               (loop for form in def-forms collect (eval form))
               (CLOSER-MOP:GENERIC-FUNCTION-METHODS #'parsed-inventory-record-parse-table-lookup-slot-value)))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (let* ((slot-syms (accessors-of-parsed-class 'parsed-inventory-record))
        (pkg (find-package "DBC"))
        (slot-sym-to-function  
          (loop
            for sym in slot-syms
            for quoted-slot = (find-symbol (string (ALEXANDRIA:FORMAT-SYMBOL NIL "PARSED-INVENTORY-RECORD-~A-LOOKUP" sym)) pkg)
            collect quoted-slot)))
    (loop 
      for slot-sym in slot-syms
      for def-slot in slot-sym-to-function
      do (setf (documentation def-slot 'function)
               (format nil 
                      "Find slot value for :~S for instance of class `parsed-inventory-record' with HAShH-KEY in the associated hash-table for the class.~%~@
 HASH-KEY is a string unless keyword WITH-STRING-INTEGER-COERCION is non-nil~%~@
 :EXAMPLE~%~@
   \(~S  \"666\"\)~%~@
   \(~S  \"666\" :with-string-integer-coercion t\)~%~@
 :SEE-ALSO `parsed-inventory-record-parse-table-lookup',`parsed-inventory-record-parse-table-lookup-slot-value', 
`parsed-class-parse-table-lookup-slot-value', ~{~<~%~1,100:; `~(~S~)'~>~^,~}.~%▶▶▶" slot-sym def-slot def-slot slot-sym-to-function )))))


;;; ==============================
;; :NOTE following defined with macrology. Docstrings added at bottom of file.
;; `def-parsed-class-write-csv-file'  ;; MACRO
;; `write-parsed-inventory-record-parse-table-to-csv-file'
;; `write-parsed-inventory-sales-order-record-parse-table-to-csv-file'
;; `write-parsed-inventory-sales-sold-in-store-record-parse-table-to-csv-file'
;; `write-parsed-artist-record-parse-table-to-csv-file'
;; `write-parsed-author-record-parse-table-to-csv-file'
;; `write-parsed-brand-record-parse-table-to-csv-file'
;; `write-parsed-person-record-parse-table-to-csv-file'
;; `write-parsed-publication-record-parse-table-to-csv-file'
;; `write-parsed-technique-record-parse-table-to-csv-file'
;; `write-parsed-documentation-record-parse-table-to-csv-file'
;; `write-parsed-theme-record-parse-table-to-csv-file'
;; `write-parsed-translation-for-inventory-record-parse-table-to-csv-file'
;;
;; `def-parsed-class-load-default-parsed-file-to-hash' ;; MACRO
;; `load-parsed-inventory-record-default-file-to-parse-table'
;; `load-parsed-inventory-sales-order-record-default-file-to-parse-table''
;; `load-parsed-inventory-sales-sold-in-store-record-default-file-to-parse-table'
;; `load-parsed-artist-record-default-file-to-parse-table'
;; `load-parsed-author-record-default-file-to-parse-table'
;; `load-parsed-brand-record-default-file-to-parse-table'
;; `load-parsed-person-record-default-file-to-parse-table'
;; `load-parsed-publication-record-default-file-to-parse-table'
;; `load-parsed-technique-record-default-file-to-parse-table'
;; `load-parsed-documentation-record-default-file-to-parse-table'
;; `load-parsed-theme-record-default-file-to-parse-table'
;; `load-parsed-translation-for-inventory-record-default-file-to-parse-table'
;;
;; `def-parsed-class-write-parse-table-to-file' ;; MACRO
;; `write-parsed-inventory-record-parse-table-to-file''
;; `write-parsed-inventory-sales-order-record-parse-table-to-file'
;; `write-parsed-inventory-sales-sold-in-store-record-parse-table-to-file'
;; `write-parsed-artist-record-parse-table-to-file'
;; `write-parsed-author-record-parse-table-to-file'
;; `write-parsed-brand-record-parse-table-to-file'
;; `write-parsed-person-record-parse-table-to-file'
;; `write-parsed-publication-record-parse-table-to-file'
;; `write-parsed-technique-record-parse-table-to-file'
;; `write-parsed-documentation-record-parse-table-to-file'
;; `write-parsed-theme-record-parse-table-to-file'
;; `write-parsed-translation-for-inventory-record-parse-table-to-file'
;;
;; `def-parsed-class-record-xml-dump-file-and-hash' ;; MACRO
;; `parsed-inventory-record-xml-dump-file-and-hash'
;; `parsed-inventory-sales-order-record-xml-dump-file-and-hash'
;; `parsed-inventory-sales-sold-in-store-record-xml-dump-file-and-hash'
;; `parsed-artist-record-xml-dump-file-and-hash'
;; `parsed-author-record-xml-dump-file-and-hash'
;; `parsed-brand-record-xml-dump-file-and-hash'
;; `parsed-person-record-xml-dump-file-and-hash'
;; `parsed-publication-record-xml-dump-file-and-hash'
;; `parsed-technique-record-xml-dump-file-and-hash'
;; `parsed-documentation-record-xml-dump-file-and-hash'
;; `parsed-theme-record-xml-dump-file-and-hash'
;; `parsed-translation-for-inventory-record-xml-dump-file-and-hash'
;;
;;
;; `def-set-parsed-class-record-slot-value'    ;; MACRO
;; `set-parsed-inventory-record-slot-value'
;; `set-parsed-inventory-sales-order-record-slot-value'
;; `set-parsed-inventory-sales-sold-in-store-record-slot-value'
;; `set-parsed-artist-record-slot-value'
;; `set-parsed-author-record-slot-value'
;; `set-parsed-brand-record-slot-value'
;; `set-parsed-person-record-slot-value'
;; `set-parsed-publication-record-slot-value'
;; `set-parsed-technique-record-slot-value'
;; `set-parsed-documentation-record-slot-value'
;; `set-parsed-theme-record-slot-value'
;; `set-parsed-translation-for-inventory-record-slot-value'
;;
;;
;; Loaders:
;; (load-parsed-inventory-record-default-file-to-parse-table)
;; (load-parsed-artist-record-default-file-to-parse-table)
;; (load-parsed-author-record-default-file-to-parse-table)
;; (load-parsed-brand-record-default-file-to-parse-table)
;; (load-parsed-person-record-default-file-to-parse-table)
;; (load-parsed-publication-record-default-file-to-parse-table)
;; (load-parsed-theme-record-default-file-to-parse-table)
;; (load-parsed-technique-record-default-file-to-parse-table)
;; (load-parsed-documentation-record-default-file-to-parse-table)
;; (load-parsed-translation-for-inventory-record-default-file-to-parse-table)
;;
;; Writers:
;; (write-parsed-inventory-record-parse-table-to-file)
;; (write-parsed-artist-record-parse-table-to-file)
;; (write-parsed-author-record-parse-table-to-file)
;; (write-parsed-brand-record-parse-table-to-file)
;; (write-parsed-person-record-parse-table-to-file)
;; (write-parsed-publication-record-parse-table-to-file)
;; (write-parsed-theme-record-parse-table-to-file)
;; (write-parsed-technique-record-parse-table-to-file)
;; (write-parsed-documentation-record-parse-table-to-file)
;; (write-parsed-translation-for-inventory-record-parse-table-to-file)
;;
;; 
;;
;;  Follwoing writes all values of parsed-class-parse-table for class instances
;;  of `parsed-inventory-record' to directories beneath
;;  `*dbc-base-item-number-image-pathname*':
;; 
;; (when (>= (hash-table-count (parsed-class-parse-table 'parsed-inventory-record)) 8969)
;;   (write-sax-parsed-inventory-record-hash-to-zero-padded-directory 
;;    (parsed-class-parse-table 'parsed-inventory-record)))
;; 
;;  :NOTE inspect `*parsed-class-parse-table*' to understand schema and dispatch mechanisms around it.   
;;   (documentation '*parsed-class-parse-table* 'variable)
;;   (gethash 'parsed-inventory-record *parsed-class-parse-table*)
;;
;;; ==============================


;; `set-parsed-inventory-record-slot-value'
(def-set-parsed-class-record-slot-value
    parsed-inventory-record)

;; (parsed-inventory-record-xml-dump-file-and-hash)
;; `parsed-inventory-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash
    :parsed-class parsed-inventory-record
  :default-key-accessor inventory-number
  :default-input-pathname-name "dump-refs-DUMPING"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-records" "parsed-xml-inventory-records")
  :default-output-pathname-name "inventory-records")

;; (write-parsed-inventory-record-parse-table-to-file)
;; `write-parsed-inventory-record-parse-table-to-file'
(def-parsed-class-write-parse-table-to-file
    :parsed-class parsed-inventory-record
  :default-output-pathname-sub-directory "parsed-inventory-record"
  ;; :default-output-pathname-base-directory (merge-pathnames (make-pathname :directory '(:relative "parsed-class-table-dumps")) (sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (clrhash (parsed-class-parse-table 'parsed-inventory-record))
;; (load-parsed-inventory-record-default-file-to-parse-table)
;; (load-parsed-inventory-record-default-file-to-parse-table :load-verbose t)
;; (parsed-class-parse-table 'parsed-inventory-record)
;; `load-parsed-inventory-record-default-file-to-parse-table'
(def-parsed-class-load-default-parsed-file-to-hash
    :parsed-class parsed-inventory-record
  :default-key-accessor inventory-number
  :default-input-pathname-sub-directory "parsed-inventory-record"
  ;; :default-input-pathname-base-directory (merge-pathnames (make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-input-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; `write-parsed-inventory-record-parse-table-to-csv-file'
(def-parsed-class-write-csv-file
    :parsed-class parsed-inventory-record
  :default-prefix-for-file-name "inventory-records"
  :default-output-pathname-sub-directory "parsed-csv-inventory-records"
  ;; :default-output-pathname-base-directory (merge-pathnames (make-pathname :directory '(:relative "parsed-csv-records"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-csv-output-dir*))


;; :TEST `set-parsed-inventory-record-slot-value'
;; (let ((obj (make-instance 'parsed-inventory-record)))
;;   (set-parsed-inventory-record-slot-value "edit_history" "88" obj)
;;   (values obj (edit-history obj)))
;;
;; (let ((obj (make-instance 'parsed-inventory-record)))
;;   (accessor-to-field-table obj))
;;
;;; *parsed-class-field-slot-accessor-mapping-table*


;;; ==============================
;;; `parsed-inventory-sales-order-record'
;;; ==============================

;; `set-parsed-inventory-sales-order-record-slot-value'
(def-set-parsed-class-record-slot-value
    parsed-inventory-sales-order-record)

;; (parsed-inventory-sales-order-record-xml-dump-file-and-hash)
;; `parsed-inventory-sales-order-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash 
  :parsed-class parsed-inventory-sales-order-record
  :default-key-accessor order-number
  :default-input-pathname-name "dump-orders-xml" ;"orders-xml"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-records" "parsed-xml-inventory-sales-order-records")
  :default-output-pathname-name "order-records")

;; (write-parsed-inventory-record-parse-table-to-file)
;; `write-parsed-inventory-sales-order-record-parse-table-to-file'
(def-parsed-class-write-parse-table-to-file
    :parsed-class parsed-inventory-sales-order-record
  :default-output-pathname-sub-directory "parsed-inventory-sales-order-record"
  ;; :default-output-pathname-base-directory (merge-pathnames (make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (load-parsed-inventory-sales-order-record-default-file-to-parse-table)
;; `load-parsed-inventory-sales-order-record-default-file-to-parse-table'
(def-parsed-class-load-default-parsed-file-to-hash 
    :parsed-class parsed-inventory-sales-order-record
  :default-key-accessor order-number
  :default-input-pathname-sub-directory "parsed-inventory-sales-order-record"
  ;; :default-input-pathname-base-directory (merge-pathnames (make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-input-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (write-parsed-inventory-sales-order-record-parse-table-to-csv-file)
;; `write-parsed-inventory-sales-order-record-parse-table-to-csv-file'
(def-parsed-class-write-csv-file
    :parsed-class parsed-inventory-sales-order-record
  :default-prefix-for-file-name "inventory-sales-order-record"
  :default-output-pathname-sub-directory "parsed-csv-inventory-sales-order-records"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-csv-records"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-csv-output-dir*))


;;; ==============================

;; `set-parsed-inventory-sales-sold-record-slot-value'
;; (def-set-parsed-class-record-slot-value
;;     parsed-inventory-sales-sold-record)

;;; ==============================



;;; ==============================
;;; `parsed-inventory-sales-sold-in-store-record'
;;; ==============================

;; `set-parsed-inventory-sales-sold-in-store-record-slot-value'
(def-set-parsed-class-record-slot-value
    parsed-inventory-sales-sold-in-store-record)

;; (parsed-inventory-sales-sold-in-store-record-xml-dump-file-and-hash)
;; `parsed-inventory-sales-sold-in-store-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash 
  :parsed-class parsed-inventory-sales-sold-in-store-record
  :default-key-accessor inventory-number
  :default-input-pathname-name "dump-orders-xml" ;"orders-xml"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-records" "parsed-xml-inventory-sales-order-records")
  :default-output-pathname-name "order-records")

;; (write-parsed-inventory-sales-sold-in-store-record-parse-table-to-file)
;; `write-parsed-inventory-sales-sold-in-store-record-parse-table-to-file'
(def-parsed-class-write-parse-table-to-file
    :parsed-class parsed-inventory-sales-sold-in-store-record
  :default-output-pathname-sub-directory "parsed-inventory-sales-sold-in-store-record"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (load-parsed-inventory-sales-sold-in-store-record-default-file-to-parse-table)
;; `load-parsed-inventory-sales-sold-in-store-record-default-file-to-parse-table'
(def-parsed-class-load-default-parsed-file-to-hash 
    :parsed-class parsed-inventory-sales-sold-in-store-record
  :default-key-accessor inventory-number
  :default-input-pathname-sub-directory "parsed-inventory-sales-sold-in-store-record"
  ;; :default-input-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-input-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)


;; `write-parsed-inventory-sales-sold-in-store-record-parse-table-to-csv-file'
(def-parsed-class-write-csv-file
    :parsed-class parsed-inventory-sales-sold-in-store-record
  :default-prefix-for-file-name "inventory-sales-sold-in-store-record"
  :default-output-pathname-sub-directory "parsed-csv-parsed-inventory-sales-sold-in-store-records"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-csv-records"))(sub-path *xml-output-dir*)))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-csv-output-dir*))


;;; ==============================
;;; `parsed-artist-record'
;;; ==============================

;; `set-parsed-artist-record-slot-value'
(def-set-parsed-class-record-slot-value
    parsed-artist-record)

;; (parsed-artist-record-xml-dump-file-and-hash) => 1288
;;; `parsed-artist-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash
    :parsed-class parsed-artist-record
  :default-key-accessor control-id-entity-num-artist
  :default-input-pathname-name "dump-artist-infos-xml"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-records" "parsed-xml-artist-records")
  :default-output-pathname-name "artist-records")

;; (write-parsed-artist-record-parse-table-to-file)
;; `write-parsed-artist-record-parse-table-to-file'
(def-parsed-class-write-parse-table-to-file
    :parsed-class parsed-artist-record
  :default-output-pathname-sub-directory "parsed-artist-record"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (clrhash (parsed-class-parse-table 'parsed-author-record))
;; (load-parsed-artist-record-default-file-to-parse-table)
;; (load-parsed-artist-record-default-file-to-parse-table :load-verbose t)
;; `load-parsed-artist-record-default-file-to-parse-table'
(def-parsed-class-load-default-parsed-file-to-hash 
  :parsed-class parsed-artist-record
  :default-key-accessor control-id-entity-num-artist
  :default-input-pathname-sub-directory "parsed-artist-record"
  ;; :default-input-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-input-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; `write-parsed-artist-record-parse-table-to-csv-file'
(def-parsed-class-write-csv-file
  :parsed-class parsed-artist-record
  :default-prefix-for-file-name "artist-records"
  :default-output-pathname-sub-directory "parsed-csv-artist-records"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-csv-records"))(sub-path *xml-output-dir*)))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-csv-output-dir*))



;;; ==============================
;;; `parsed-author-record'
;;; ==============================

;; `set-parsed-author-record-slot-value'
(def-set-parsed-class-record-slot-value
    parsed-author-record)

;; (parsed-author-record-xml-dump-file-and-hash) => 471
;;; `parsed-author-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash
  :parsed-class parsed-author-record
  :default-key-accessor control-id-entity-num-author
  :default-input-pathname-name "dump-author-infos-xml"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-records" "parsed-xml-author-records")
  :default-output-pathname-name "author-records")

;; (write-parsed-author-record-parse-table-to-file)
;; `write-parsed-author-record-parse-table-to-file'
(def-parsed-class-write-parse-table-to-file
  :parsed-class parsed-author-record
  :default-output-pathname-sub-directory "parsed-author-record"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (naf-entity-author-display-name-coref (parsed-class-parse-table-lookup 'parsed-author-record "298"))
;; (naf-entity-author-display-name-coref (parsed-class-parse-table-lookup 'parsed-author-record "39"))
;; (clrhash (parsed-class-parse-table 'parsed-author-record))
;; (load-parsed-author-record-default-file-to-parse-table)
;; (load-parsed-author-record-default-file-to-parse-table :load-verbose t)
;; `load-parsed-author-record-default-file-to-parse-table'
(def-parsed-class-load-default-parsed-file-to-hash 
  :parsed-class parsed-author-record
  :default-key-accessor control-id-entity-num-author
  :default-input-pathname-sub-directory "parsed-author-record"
  ;; :default-input-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-input-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)                                                    

;; `write-parsed-author-record-parse-table-to-csv-file'
(def-parsed-class-write-csv-file
  :parsed-class parsed-author-record
  :default-prefix-for-file-name "author-records"
  :default-output-pathname-sub-directory "parsed-csv-author-records"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-csv-records"))(sub-path *xml-output-dir*)))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-csv-output-dir*))

;;; ==============================
;;; `parsed-brand-record'
;;; ==============================

;; `set-parsed-brand-record-slot-value'
(def-set-parsed-class-record-slot-value
    parsed-brand-record)

;; (parsed-brand-record-xml-dump-file-and-hash) => 660
;; `parsed-brand-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash
    :parsed-class parsed-brand-record
  :default-key-accessor control-id-entity-num-brand
  :default-input-pathname-name "dump-brand-infos-xml"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-records" "parsed-xml-brand-records")
  :default-output-pathname-name "brand-records")

;; (write-parsed-brand-record-parse-table-to-file)
;; `write-parsed-brand-record-parse-table-to-file'
(def-parsed-class-write-parse-table-to-file
    :parsed-class parsed-brand-record
  :default-output-pathname-sub-directory "parsed-brand-record"
  ;;:default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (maphash #'(lambda (k v) (print v)) (parsed-class-parse-table 'parsed-brand-record))
;; (clrhash (parsed-class-parse-table 'parsed-brand-record))
;; (load-parsed-person-record-default-file-to-parse-table)
;; (load-parsed-brand-record-default-file-to-parse-table :load-verbose t)
;; `load-parsed-brand-record-default-file-to-parse-table'
(def-parsed-class-load-default-parsed-file-to-hash 
    :parsed-class parsed-brand-record
  :default-key-accessor control-id-entity-num-brand
  :default-input-pathname-sub-directory "parsed-brand-record"
  ;;:default-input-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(dbc::sub-path dbc::*xml-output-dir*))
  :default-input-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)


;; `write-parsed-brand-record-parse-table-to-csv-file'
(def-parsed-class-write-csv-file
    :parsed-class parsed-brand-record
  :default-prefix-for-file-name "brand-records"
  :default-output-pathname-sub-directory "parsed-csv-brand-records"
  ;;:default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-csv-records"))(sub-path *xml-output-dir*)))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)
                                                          


;;; ==============================
;;; `parsed-person-record'
;;; ==============================

;; `set-parsed-person-record-slot-value'
(def-set-parsed-class-record-slot-value
    parsed-person-record)

;; (parsed-person-record-xml-dump-file-and-hash)
;; `parsed-person-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash
    :parsed-class parsed-person-record
  :default-key-accessor control-id-entity-num-person
  :default-input-pathname-name "dump-person-infos-xml"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-records" "parsed-xml-person-records")
  :default-output-pathname-name "person-records")

;; (write-parsed-person-record-parse-table-to-file)
;; `write-parsed-person-record-parse-table-to-file'
(def-parsed-class-write-parse-table-to-file
    :parsed-class parsed-person-record
  :default-output-pathname-sub-directory "parsed-person-record"
  ;;:default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (clrhash (parsed-class-parse-table 'parsed-person-record))
;; (load-parsed-person-record-default-file-to-parse-table)
;; (load-parsed-person-record-default-file-to-parse-table :load-verbose t)
;; `load-parsed-person-record-default-file-to-parse-table'
(def-parsed-class-load-default-parsed-file-to-hash 
    :parsed-class parsed-person-record
  :default-key-accessor control-id-entity-num-person
  :default-input-pathname-sub-directory "parsed-person-record"
  ;;:default-input-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(dbc::sub-path dbc::*xml-output-dir*))
  :default-input-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; `write-parsed-person-record-parse-table-to-csv-file'
(def-parsed-class-write-csv-file
    :parsed-class parsed-person-record
  :default-prefix-for-file-name "person-records"
  :default-output-pathname-sub-directory "parsed-csv-person-records"
  ;;:default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-csv-records"))(sub-path *xml-output-dir*)))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-csv-output-dir*))



;;; ==============================
;;; `parsed-publication-record'
;;; ==============================

;; `set-parsed-publication-record-slot-value'
(def-set-parsed-class-record-slot-value 
    parsed-publication-record)

;; (parsed-publication-record-xml-dump-file-and-hash) => 179 
;; `parsed-publication-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash
    :parsed-class parsed-publication-record
  :default-key-accessor control-id-entity-num-publication
  :default-input-pathname-name "dump-publication-infos-xml"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-records" "parsed-xml-publication-records")
  :default-output-pathname-name "publication-records")

;; (write-parsed-publication-record-parse-table-to-file)
;; `write-parsed-publication-record-parse-table-to-file'
(def-parsed-class-write-parse-table-to-file
    :parsed-class parsed-publication-record
  :default-output-pathname-sub-directory "parsed-publication-record"
  ;;:default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (control-id-display-publication-full (parsed-class-parse-table-lookup 'parsed-publication-record "39"))
;; (clrhash (parsed-class-parse-table 'parsed-publication-record))
;; (load-parsed-publication-record-default-file-to-parse-table)
;; (load-parsed-publication-record-default-file-to-parse-table :load-verbose t)
;; `load-parsed-publication-record-default-file-to-parse-table'
(def-parsed-class-load-default-parsed-file-to-hash 
    :parsed-class parsed-publication-record
  :default-key-accessor control-id-entity-num-publication
  :default-input-pathname-sub-directory "parsed-publication-record"
  ;;:default-input-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(dbc::sub-path dbc::*xml-output-dir*))
  :default-input-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; `write-parsed-publication-record-parse-table-to-csv-file'
(def-parsed-class-write-csv-file
    :parsed-class parsed-publication-record
  :default-prefix-for-file-name "publication-records"
  :default-output-pathname-sub-directory "parsed-csv-publication-records"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-csv-records"))(sub-path *xml-output-dir*)))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-csv-output-dir*))


;;; ==============================
;;; `parsed-technique-record'
;;; ==============================

;; `set-parsed-technique-record-slot-value'
(def-set-parsed-class-record-slot-value
    parsed-technique-record)

;; (parsed-technique-record-xml-dump-file-and-hash) ;=> 31
;; `parsed-technique-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash
    :parsed-class parsed-technique-record
  :default-key-accessor control-id-entity-num-technique
  :default-input-pathname-name "dump-technique-infos-xml"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-records" "parsed-xml-technique-records")
  :default-output-pathname-name "technique-records")

;; (write-parsed-technique-record-parse-table-to-file)
;; `write-parsed-technique-record-parse-table-to-file'
(def-parsed-class-write-parse-table-to-file
    :parsed-class parsed-technique-record
  :default-output-pathname-sub-directory "parsed-technique-record"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (load-parsed-technique-record-default-file-to-parse-table)
;; `load-parsed-technique-record-default-file-to-parse-table'
(def-parsed-class-load-default-parsed-file-to-hash 
    :parsed-class parsed-technique-record
  :default-key-accessor control-id-entity-num-technique
  :default-input-pathname-sub-directory "parsed-technique-record"
  ;;:default-input-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-input-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)
  

;; `write-parsed-technique-record-parse-table-to-csv-file'
(def-parsed-class-write-csv-file
    :parsed-class parsed-technique-record
  :default-prefix-for-file-name "technique-records"
  :default-output-pathname-sub-directory "parsed-csv-technique-records"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-csv-records"))(sub-path *xml-output-dir*)))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-csv-output-dir*))


;;; ==============================
;;; `parsed-documentation-record'
;;; ==============================

;; `set-parsed-documentation-record-slot-value'
(def-set-parsed-class-record-slot-value 
    parsed-documentation-record)

;; (parsed-documentation-record-xml-dump-file-and-hash) => 2185
;; `parsed-documentation-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash
    :parsed-class parsed-documentation-record
  :default-key-accessor control-id-documentation-record-document-page-id
  :default-input-pathname-name "dump-docs-xml"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-records" "parsed-xml-documentation-records")
  :default-output-pathname-name "documentation-records")

;; (write-parsed-documentation-record-parse-table-to-file)
;; `write-parsed-documentation-record-parse-table-to-file'
(def-parsed-class-write-parse-table-to-file
    :parsed-class parsed-documentation-record
  :default-output-pathname-sub-directory "parsed-documentation-record"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (clrhash (parsed-class-parse-table 'parsed-documentation-record))
;; (load-parsed-documentation-record-default-file-to-parse-table)
;; (load-parsed-documentation-record-default-file-to-parse-table :load-verbose t)
;; `load-parsed-documentation-record-default-file-to-parse-table'
(def-parsed-class-load-default-parsed-file-to-hash 
    :parsed-class parsed-documentation-record
  :default-key-accessor control-id-documentation-record-document-page-id
  :default-input-pathname-sub-directory "parsed-documentation-record"
  ;; :default-input-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(dbc::sub-path dbc::*xml-output-dir*))
  :default-input-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; `write-parsed-doc-record-parse-table-to-csv-file'
(def-parsed-class-write-csv-file
    :parsed-class parsed-documentation-record
  :default-prefix-for-file-name "documentation-records"
  :default-output-pathname-sub-directory "parsed-csv-documentation-records"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-csv-records"))(sub-path *xml-output-dir*)))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-csv-output-dir*))                                                      


;;; ==============================
;;; `parsed-theme-record'
;;; ==============================

;; `set-parsed-theme-record-slot-value'
(def-set-parsed-class-record-slot-value 
    parsed-theme-record)

;; (parsed-theme-record-xml-dump-file-and-hash)
;; `parsed-theme-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash
    :parsed-class parsed-theme-record
  :default-key-accessor control-id-theme-entity-num
  :default-input-pathname-name "dump-themes-DUMPING"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-records" "parsed-xml-theme-records")
  :default-output-pathname-name "theme-records")

;; (write-parsed-theme-record-parse-table-to-file)
;; `write-parsed-theme-record-parse-table-to-file'
(def-parsed-class-write-parse-table-to-file
    :parsed-class parsed-theme-record
  :default-output-pathname-sub-directory "parsed-theme-record"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (load-parsed-theme-record-default-file-to-parse-table)
;; `load-parsed-theme-record-default-file-to-parse-table'
(def-parsed-class-load-default-parsed-file-to-hash 
    :parsed-class parsed-theme-record
  :default-key-accessor control-id-theme-entity-num
  :default-input-pathname-sub-directory "parsed-theme-record"
  ;;:default-input-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(dbc::sub-path dbc::*xml-output-dir*))
  :default-input-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; `write-parsed-doc-record-parse-table-to-csv-file'
(def-parsed-class-write-csv-file
    :parsed-class parsed-theme-record
  :default-prefix-for-file-name "theme-records"
  :default-output-pathname-sub-directory "parsed-csv-theme-records"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-csv-records"))(sub-path *xml-output-dir*)))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-csv-output-dir*))


;;; ==============================
;;; `parsed-translation-for-inventory-record'
;;; ==============================

;; `set-parsed-translation-for-inventory-record-slot-value'
(def-set-parsed-class-record-slot-value
    parsed-translation-for-inventory-record)


;; (parsed-translation-for-inventory-record-xml-dump-file-and-hash)
;;; `parsed-translation-for-inventory-record-xml-dump-file-and-hash'
(def-parsed-class-record-xml-dump-file-and-hash
    :parsed-class parsed-translation-for-inventory-record
  :default-key-accessor inventory-number
  :default-input-pathname-name "dump-translations-xml"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-records" "parsed-xml-translation-for-inventory-records")
  :default-output-pathname-name "translation-for-inventory-records")

;; (write-parsed-translation-for-inventory-record-parse-table-to-file)
;; (parsed-class-parse-table 'parsed-translation-for-inventory-record)
;; (describe *)
;; `write-parsed-translation-for-inventory-record-parse-table-to-file'
(def-parsed-class-write-parse-table-to-file
    :parsed-class parsed-translation-for-inventory-record
  :default-output-pathname-sub-directory "parsed-translation-for-inventory-record"
  ;;:default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; (load-parsed-translation-for-inventory-record-default-file-to-parse-table)
;; `load-parsed-translation-for-inventory-record-default-file-to-parse-table'
(def-parsed-class-load-default-parsed-file-to-hash 
    :parsed-class parsed-translation-for-inventory-record
  :default-key-accessor inventory-number
  :default-input-pathname-sub-directory "parsed-translation-for-inventory-record"
  ;; :default-input-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-class-table-dumps"))(sub-path *xml-output-dir*))
  :default-input-pathname-base-directory (sub-path *parsed-class-table-output-dir*)
  :default-pathname-type *parsed-class-table-output-pathname-type*)

;; `write-parsed-translation-for-inventory-record-parse-table-to-csv-file'
(def-parsed-class-write-csv-file
    :parsed-class parsed-translation-for-inventory-record
  :default-prefix-for-file-name "translation-for-inventory-records"
  :default-output-pathname-sub-directory "parsed-csv-translation-for-inventory-records"
  ;; :default-output-pathname-base-directory (merge-pathnames(make-pathname :directory '(:relative "parsed-csv-records"))(sub-path *xml-output-dir*)))
  :default-output-pathname-base-directory (sub-path *parsed-class-table-csv-output-dir*))


;;; ==============================
;;; docstrings for loadtime-bind.lisp 
;;; ==============================

(eval-when (:compile-toplevel :load-toplevel :execute)
  (let* ((slot-syms '(parsed-inventory-record-xml-dump-file-and-hash
                      parsed-inventory-sales-order-record-xml-dump-file-and-hash
                      parsed-inventory-sales-sold-in-store-record-xml-dump-file-and-hash
                      parsed-artist-record-xml-dump-file-and-hash
                      parsed-author-record-xml-dump-file-and-hash
                      parsed-brand-record-xml-dump-file-and-hash
                      parsed-person-record-xml-dump-file-and-hash
                      parsed-publication-record-xml-dump-file-and-hash
                      parsed-technique-record-xml-dump-file-and-hash
                      parsed-documentation-record-xml-dump-file-and-hash
                      parsed-theme-record-xml-dump-file-and-hash
                      parsed-translation-for-inventory-record-xml-dump-file-and-hash))
         (pkg (find-package "DBC"))
        (slot-sym-to-function  (loop
                                 for sym in slot-syms
                                 for quoted-slot = (find-symbol (string sym) pkg)
                                 collect quoted-slot)))
    (loop 
      ;; for slot-sym in slot-syms
      for def-slot in slot-sym-to-function
      do (setf (documentation def-slot 'function)
            (format nil 
     "Function returned as per macro `def-parsed-class-record-xml-dump-file-and-hash' as defined with the following format:~%
 \(def-parsed-class-record-xml-dump-file-and-hash
    :parsed-class <PARSED-CLASS>
    :default-key-accessor <ACCESSOR>
    :default-input-pathname-name <PATHNAME-NAME>
    :default-output-pathname-base-directory \(sub-path *xml-output-dir*\)
    :default-output-pathname-sub-directory 
                                    \(list \"parsed-xml-records\" \"<SUB-PATHNAME-FOR-PARSED-CLASS>\"\)
    :default-output-pathname-name \"<PARSED-CLASS>\"\)~%
:SEE-ALSO ~{~<~%~1,100:; `~(~S~)'~>~^,~},`*xml-output-dir*' `def-parsed-class-record-xml-dump-file-and-hash',
`def-parsed-class-write-parse-table-to-file',`def-parsed-class-load-default-parsed-file-to-hash',
`def-parsed-class-write-csv-file'.~%▶▶▶" slot-syms )))))


(eval-when (:compile-toplevel :load-toplevel :execute)
  (let* ((slot-syms '(write-parsed-inventory-record-parse-table-to-file
                      write-parsed-inventory-sales-order-record-parse-table-to-file
                      write-parsed-inventory-sales-sold-in-store-record-parse-table-to-file
                      write-parsed-artist-record-parse-table-to-file
                      write-parsed-author-record-parse-table-to-file
                      write-parsed-brand-record-parse-table-to-file
                      write-parsed-person-record-parse-table-to-file
                      write-parsed-publication-record-parse-table-to-file
                      write-parsed-technique-record-parse-table-to-file
                      write-parsed-documentation-record-parse-table-to-file
                      write-parsed-theme-record-parse-table-to-file
                      write-parsed-translation-for-inventory-record-parse-table-to-file))
         (pkg (find-package "DBC"))
        (slot-sym-to-function  (loop
                                 for sym in slot-syms
                                 for quoted-slot = (find-symbol (string sym) pkg)
                                 collect quoted-slot)))
    (loop 
      ;; for slot-sym in slot-syms
      for def-slot in slot-sym-to-function
      do (setf (documentation def-slot 'function)
            (format nil 
     "Function returned as per macro `def-parsed-class-write-parse-table-to-file' as defined with the following format:~%
  \(def-parsed-class-write-parse-table-to-file
                :parsed-class <PARSED-CLASS>
                :default-output-pathname-sub-directory \"<SUB-DIR-FOR-PARSED-CLASS>\"
                :default-output-pathname-base-directory 
                \(merge-pathnames \(make-pathname :directory '\(:relative \"parsed-class-table-dumps\"\)\)
                                                           \(sub-path *xml-output-dir*\)\)
               :default-pathname-type \"pctd\"\)\)\)~%
:SEE-ALSO ~{~<~%~1,100:; `~(~S~)'~>~^,~},`*xml-output-dir*', `def-parsed-class-record-xml-dump-file-and-hash',~@
`def-parsed-class-write-parse-table-to-file',`def-parsed-class-load-default-parsed-file-to-hash',~@
 `def-parsed-class-write-csv-file'.~%▶▶▶" slot-syms )))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (let* ((slot-syms '(load-parsed-inventory-record-default-file-to-parse-table
                      load-parsed-inventory-sales-order-record-default-file-to-parse-table
                      load-parsed-inventory-sales-sold-in-store-record-default-file-to-parse-table
                      load-parsed-artist-record-default-file-to-parse-table
                      load-parsed-author-record-default-file-to-parse-table
                      load-parsed-brand-record-default-file-to-parse-table
                      load-parsed-person-record-default-file-to-parse-table
                      load-parsed-publication-record-default-file-to-parse-table
                      load-parsed-technique-record-default-file-to-parse-table
                      load-parsed-documentation-record-default-file-to-parse-table
                      load-parsed-theme-record-default-file-to-parse-table
                      load-parsed-translation-for-inventory-record-default-file-to-parse-table))
         (pkg (find-package "DBC"))
        (slot-sym-to-function  (loop
                                 for sym in slot-syms
                                 for quoted-slot = (find-symbol (string sym) pkg)
                                 collect quoted-slot)))
    (loop 
      ;; for slot-sym in slot-syms
      for def-slot in slot-sym-to-function
      do (setf (documentation def-slot 'function)
            (format nil 
     "Function returned as per macro `def-parsed-class-load-default-parsed-file-to-hash' as defined with the following format:~%
\(def-parsed-class-load-default-parsed-file-to-hash
         :parsed-class <PARSED-CLASS>
         :default-key-accessor <DEFAULT-KEY-ACCESSOR>
         :default-input-pathname-sub-directory \"<PARSED-CLASS>\"
         :default-input-pathname-base-directory \(default-input-pathname-base-directory
                                                 \(merge-pathnames
                                                  \(make-pathname :directory '\(:relative \"parsed-class-table-dumps\"\)\)
                                                  \(dbc::sub-path dbc::*xml-output-dir*\)\)\)
         :default-pathname-type \"pctd\"\)~%
:SEE-ALSO ~{~<~%~1,80:; `~(~S~)'~>~^,~},`*xml-output-dir*' `def-parsed-class-record-xml-dump-file-and-hash',
`def-parsed-class-write-parse-table-to-file',`def-parsed-class-load-default-parsed-file-to-hash',
`def-parsed-class-write-csv-file'.~%▶▶▶" slot-syms )))))


(eval-when (:compile-toplevel :load-toplevel :execute)
  (let* ((slot-syms '(write-parsed-inventory-record-parse-table-to-csv-file
                      write-parsed-inventory-sales-order-record-parse-table-to-csv-file
                      write-parsed-inventory-sales-sold-in-store-record-parse-table-to-csv-file
                      write-parsed-artist-record-parse-table-to-csv-file
                      write-parsed-author-record-parse-table-to-csv-file
                      write-parsed-brand-record-parse-table-to-csv-file
                      write-parsed-person-record-parse-table-to-csv-file
                      write-parsed-publication-record-parse-table-to-csv-file
                      write-parsed-technique-record-parse-table-to-csv-file
                      write-parsed-documentation-record-parse-table-to-csv-file
                      write-parsed-theme-record-parse-table-to-csv-file
                      write-parsed-translation-for-inventory-record-parse-table-to-csv-file))
         (pkg (find-package "DBC"))
        (slot-sym-to-function  (loop
                                 for sym in slot-syms
                                 for quoted-slot = (find-symbol (string sym) pkg)
                                 collect quoted-slot)))
    (loop 
      ;; for slot-sym in slot-syms
      for def-slot in slot-sym-to-function
      do (setf (documentation def-slot 'function)
            (format nil 
     "Function returned as per macro `def-parsed-class-write-csv-file' as defined with the following format:~%
 \(def-parsed-class-write-csv-file
         :parsed-class <PARSED-CLASS>
         :default-prefix-for-file-name \"<PARSED-CLASS-PREFIX>\"
         :default-output-pathname-sub-directory \"<PARSED-CLASS-SUBDIR>\"
         :default-output-pathname-base-directory 
                \(merge-pathnames 
                      \(make-pathname :directory '\(:relative \"<PARSED-CLASS-SUBDIR>\"\)\)
                      \(dbc::sub-path dbc::*xml-output-dir*\)\)\)~%
:SEE-ALSO ~{~<~%~1,80:; `~(~S~)'~>~^,~},~@
`*xml-output-dir*' `def-parsed-class-record-xml-dump-file-and-hash',`def-parsed-class-write-parse-table-to-file',~@
`def-parsed-class-load-default-parsed-file-to-hash',`def-parsed-class-write-csv-file'.~%▶▶▶" slot-syms )))))




;;; ==============================
;;; convenience functions likely temporary.
;;; ==============================
(defun %parsed-inventory-record-get-all-goulds ()
  "Convenience function. Returns a list of all instance of class `parsed-inventory-record' with slot-value CATEGORY-ENTITY-3-COREF
  matching one of the following:~%
 \"Century Himalayas\"  \"Birds of New Guinea\" \"Birds of Europe\"
 \"Birds of Great Britain\" \"Birds of Australia\"~%"
  (let ((results (ALEXANDRIA:MAPPEND #'(lambda (coref)
                          (parsed-class-slot-value-collect-string= 
                           'parsed-inventory-record 
                           'category-entity-3-coref coref))
                      (list "Century Himalayas" "Birds of New Guinea" "Birds of Europe"
                            "Birds of Great Britain" "Birds of Australia"))))
    (values results (length results))))


;;; ==============================
;;; :EOF
