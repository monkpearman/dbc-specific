;;; :FILE-CREATED <Timestamp: #{2011-03-16T14:42:38-04:00Z}#{11113} - by MON>
;;; :FILE dbc-specific/dbc-tests/tests.lisp
;;; ==============================

;; :NOTE The dbc package defines the parameters `dbc:*system-tests-dir*' and
;; `dbc:*system-tests-temp-dir*' in :FILE dbc-specific/specials.lisp
;; And sets their values at loadtime in :FILE dbc-specific/loadtime-bind.lisp
;; Initially these are set to the strings "dbc-tests" and "tests" respectively.
;; Once loadtime-bind.lisp is loaded they are set to instances of
;; `dbc:system-subdir' with a dbc-system relative path.
;;  The `cl:pathname-directory' of each is accessible with:
;;   (dbc:sub-path dbc::*system-tests-dir*)
;;   (dbc:sub-path dbc::*system-tests-temp-dir*)
;;
;; dbc-test path heirarchy:
;;
;; (let* ((dbc-test-base (asdf:system-source-directory (asdf:find-system :dbc-test)))
;;        (test-dir (and dbc-test-base 
;;                       (fad:directory-exists-p
;;                        (merge-pathnames (make-pathname :directory '(:relative "dbc-tests"))
;;                                         dbc-test-base))))
;;        (test-temp-dir (and test-dir 
;;                            (fad:directory-exists-p
;;                             (merge-pathnames (make-pathname :directory '(:relative "tests"))
;;                                              test-dir)))))
;;   (list dbc-test-base test-dir test-temp-dir))


(in-package #:dbc-test)

;; *package*

(defun system-test-temp-dir-exists-p ()
  (declare (special dbc:*system-tests-temp-dir*))
  (and (typep dbc:*system-tests-temp-dir* 'dbc:system-subdir)
       (fad:directory-exists-p (dbc:sub-path dbc:*system-tests-temp-dir*))))

;; :TEST `dbc:field-convert-1-0-x'
(sb-rt:deftest field-convert-1-0-x-TEST
    (values
     (dbc:field-convert-1-0-x  "1")
     (dbc:field-convert-1-0-x #\1)
     (dbc:field-convert-1-0-x t)
     (dbc:field-convert-1-0-x   1)
     (dbc:field-convert-1-0-x  "0")
     (dbc:field-convert-1-0-x  "x")
     (dbc:field-convert-1-0-x  "X")
     (dbc:field-convert-1-0-x #\0)
     (dbc:field-convert-1-0-x #\x)
     (dbc:field-convert-1-0-x #\X)
     (dbc:field-convert-1-0-x   0)
     (dbc:field-convert-1-0-x  #\*)
     (dbc:field-convert-1-0-x  #\t)
     (dbc:field-convert-1-0-x  "t")
     (dbc:field-convert-1-0-x "Return Me"))
  T T T T NIL NIL NIL NIL NIL NIL NIL #\* #\t "t" "Return Me")
;;
;; (sb-rt:do-test 'field-convert-1-0-x-TEST)

;; :TEST `dbc:field-convert-1-0-x-empty'
(sb-rt:deftest field-convert-1-0-x-empty-TEST.0
    (values-list
     (mapcar #'eval
             (mapcar #'(lambda (form) 
                         `(multiple-value-bind ,(car form) (,(caadr form) ,(cadadr form))
                            (list ,@(car form))))
                     '(((a b c d)
                        (dbc:field-convert-1-0-x-empty t))
                       ((a b c d)
                        (dbc:field-convert-1-0-x-empty nil))
                       ((a b c)
                        (dbc:field-convert-1-0-x-empty "x"))
                       ((a b c)
                        (dbc:field-convert-1-0-x-empty "1"))
                       ((a b c)
                        (dbc:field-convert-1-0-x-empty "0"))
                       ;; ::NOTE following has complicated destructoring
                       ;; ((a c)
                       ;;  (dbc:field-convert-1-0-x-empty 8))
                       ;; => (8 (INTEGER 0 536870911) 8 (INTEGER 0 536870911))
                       ((a)
                        (dbc:field-convert-1-0-x-empty 8))
                       ((a b c)
                        (dbc:field-convert-1-0-x-empty ""))
                       ((a b c)
                        (dbc:field-convert-1-0-x-empty "    "))))))

  (T BOOLEAN T BOOLEAN) (NIL NULL NIL NULL) (NIL NULL "x")
  (T BOOLEAN "1") (NIL NULL "0") (8) 
  (NIL MON:STRING-EMPTY "") (NIL MON:STRING-ALL-WHITESPACE "    "))

;;
;; (sb-rt:do-test 'field-convert-1-0-x-empty-TEST.0)

;; :TESTING `field-convert-1-0-x-empty' with keyword KNOWN-FIELD-HASHTABLE
(sb-rt:deftest field-convert-1-0-x-empty-TEST.1
    (values-list
     (mapcar #'eval
             (mapcar #'(lambda (form) 
                         `(multiple-value-bind ,(car form) ,(cadr form)
                            (list ,@(car form))))
                     '(((a b c)
                        (dbc:field-convert-1-0-x-empty "ref" :known-field-hashtable 'dbc:*xml-refs-match-table*))
                       ((a b c)
                        (dbc:field-convert-1-0-x-empty "ref" :known-field-hashtable dbc:*xml-refs-match-table*))
                       ((a)
                        (dbc:field-convert-1-0-x-empty "ref" :known-field-hashtable nil))
                       ((a)
                        (dbc:field-convert-1-0-x-empty "not-there" :known-field-hashtable 'not-a-valid-hashtable))
                       ((a)
                        (dbc:field-convert-1-0-x-empty "not-there" :known-field-hashtable '*xml-refs-match-table*))
                       ((a b c)
                        (dbc:field-convert-1-0-x-empty "" :known-field-hashtable 'dbc:*xml-refs-match-table*))
                       ((a b c)
                        (dbc:field-convert-1-0-x-empty "   " :known-field-hashtable 'dbc:*xml-refs-match-table*))
                       ((a)
                        (dbc:field-convert-1-0-x-empty  8 :known-field-hashtable 'dbc:*xml-refs-match-table*))
                       ((a b c)
                        (dbc:field-convert-1-0-x-empty "x" :known-field-hashtable 'dbc:*xml-refs-match-table*))
                       ((a b c)
                        (dbc:field-convert-1-0-x-empty "1" :known-field-hashtable 'dbc:*xml-refs-match-table*))
                       ((a b c)
                        (dbc:field-convert-1-0-x-empty "0" :known-field-hashtable 'dbc:*xml-refs-match-table*))))))
   (NIL NULL "ref")
   (NIL NULL "ref")
   ("ref")
   ("not-there")
   ("not-there")
   (NIL MON:STRING-EMPTY "")
   (NIL MON:STRING-ALL-WHITESPACE "   ")
   (8)
   (NIL NULL "x")
   (T BOOLEAN "1")
   (NIL NULL "0"))
;;
;; (sb-rt:do-test 'field-convert-1-0-x-empty-TEST.1)

;;; ==============================

;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc-test
;; End:

;;; ==============================
;;; EOF
