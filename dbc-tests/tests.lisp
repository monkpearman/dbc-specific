;;; :FILE-CREATED <Timestamp: #{2011-03-16T14:42:38-04:00Z}#{11113} - by MON>
;;; :FILE dbc-specific/dbc-tests/tests.lisp
;;; ==============================


;; :TODO fix sb-rt:deftest field-convert-1-0-x-empty-TEST.1 and sb-rt:deftest split-field-on-char-if-TEST.3
;; To use one of the hash-table's in `*big-parsed-class-field-slot-accessor-mapping-table*' instead.

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


;;; ==============================
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


;;; ==============================
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
                       ;; ::NOTE following has complicated destructoring:
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
;; (sb-rt:deftest field-convert-1-0-x-empty-TEST.1
;;     (values-list
;;      (mapcar #'eval
;;              (mapcar #'(lambda (form) 
;;                          `(multiple-value-bind ,(car form) ,(cadr form)
;;                             (list ,@(car form))))
;;                      '(((a b c)
;;                         (dbc:field-convert-1-0-x-empty "ref" :known-field-hashtable 'dbc:*xml-refs-match-table*))
;;                        ((a b c)
;;                         (dbc:field-convert-1-0-x-empty "ref" :known-field-hashtable dbc:*xml-refs-match-table*))
;;                        ((a)
;;                         (dbc:field-convert-1-0-x-empty "ref" :known-field-hashtable nil))
;;                        ((a)
;;                         (dbc:field-convert-1-0-x-empty "not-there" :known-field-hashtable 'not-a-valid-hashtable))
;;                        ((a)
;;                         (dbc:field-convert-1-0-x-empty "not-there" :known-field-hashtable '*xml-refs-match-table*))
;;                        ((a b c)
;;                         (dbc:field-convert-1-0-x-empty "" :known-field-hashtable 'dbc:*xml-refs-match-table*))
;;                        ((a b c)
;;                         (dbc:field-convert-1-0-x-empty "   " :known-field-hashtable 'dbc:*xml-refs-match-table*))
;;                        ((a)
;;                         (dbc:field-convert-1-0-x-empty  8 :known-field-hashtable 'dbc:*xml-refs-match-table*))
;;                        ((a b c)
;;                         (dbc:field-convert-1-0-x-empty "x" :known-field-hashtable 'dbc:*xml-refs-match-table*))
;;                        ((a b c)
;;                         (dbc:field-convert-1-0-x-empty "1" :known-field-hashtable 'dbc:*xml-refs-match-table*))
;;                        ((a b c)
;;                         (dbc:field-convert-1-0-x-empty "0" :known-field-hashtable 'dbc:*xml-refs-match-table*))))))
;;    (NIL NULL "ref")
;;    (NIL NULL "ref")
;;    ("ref")
;;    ("not-there")
;;    ("not-there")
;;    (NIL MON:STRING-EMPTY "")
;;    (NIL MON:STRING-ALL-WHITESPACE "   ")
;;    (8)
;;    (NIL NULL "x")
;;    (T BOOLEAN "1")
;;    (NIL NULL "0"))
;;
;; (sb-rt:do-test 'field-convert-1-0-x-empty-TEST.1)


;;; ==============================
;; :TESTING `split-field-on-char-if' withot keywords
(sb-rt:deftest split-field-on-char-if-TEST.0
    (values-list
     (mapcar #'eval
             (mapcar #'(lambda (form) 
                      `(multiple-value-bind ,(car form) ,@(cdr form)
                         (list ,@(car form))))
  '(
    ((a b c)
     (dbc:split-field-on-char-if " a | b | c | d | e" #\VERTICAL_LINE))
    ((a b c)
     (dbc:split-field-on-char-if " a | b | c | d | e | e | d | c | b | a | " #\VERTICAL_LINE))
    ((a b c)
     (dbc:split-field-on-char-if " , " #\COMMA))
    ((a b c)
     (dbc:split-field-on-char-if " ,   " #\COMMA))
    ((a b c)
     (dbc:split-field-on-char-if "8 ba " #\SPACE ))
    ((a b c)
     (dbc:split-field-on-char-if "8 ba ba" #\SPACE))
    ((a)
     (dbc:split-field-on-char-if 8 #\DIGIT_EIGHT))
    ((a b c d)
     (dbc:split-field-on-char-if nil #\DIGIT_EIGHT))
    ((a b c d)
     (dbc:split-field-on-char-if t #\DIGIT_EIGHT))
    ((a b c d)
     (dbc:split-field-on-char-if #b0000 #\DIGIT_EIGHT))
    ((a b c d)
     (dbc:split-field-on-char-if #\DIGIT_ONE #\DIGIT_ONE))
    ((a b c)
     (dbc:split-field-on-char-if "1" #\DIGIT_ONE))
    ((a b c)
     (dbc:split-field-on-char-if "" #\DIGIT_ONE))))))
  (("a" "b" "c" "d" "e") CONS " a | b | c | d | e")
  (("a" "b" "c" "d" "e") CONS " a | b | c | d | e | e | d | c | b | a | ")
  (NIL NULL " , ")
  (NIL NULL " ,   ")
  (("8" "ba") CONS "8 ba ")
  (("8" "ba") CONS "8 ba ba")
  (8)
  (NIL NULL NIL NULL)
  (T BOOLEAN T BOOLEAN)
  (NIL NULL 0 BIT)
  (T BOOLEAN #\DIGIT_ONE STANDARD-CHAR)
  (T BOOLEAN "1")
  ;; :FAIL (NIL MON:STRING-EMPTY "but not really")
  (NIL MON:STRING-EMPTY ""))
;;
;; (sb-rt:do-test 'split-field-on-char-if-TEST.0)


;;; ==============================
;; :TESTING `dbc:split-field-on-char-if' with keyword KEEP-FIRST 
(sb-rt:deftest split-field-on-char-if-TEST.1
    (values-list
     (mapcar #'eval
             (mapcar #'(lambda (form) 
                         `(multiple-value-bind ,(car form) ,(cadr form)
                            (list ,@(car form))))
      '(((a b c)
         (dbc:split-field-on-char-if " , " #\COMMA :keep-first nil))
        ((a) 
         (dbc:split-field-on-char-if " , " #\COMMA :keep-first t))

        ((a b c)
         (dbc:split-field-on-char-if ", " #\COMMA  :keep-first nil))
        ((a)
         (dbc:split-field-on-char-if ", " #\COMMA  :keep-first t))
     
        ((a b c)
         (dbc:split-field-on-char-if " ," #\COMMA  :keep-first nil))
        ((a)
         (dbc:split-field-on-char-if " ," #\COMMA  :keep-first t))
        ;; ((a b c) 
        ;;   (dbc:split-field-on-char-if `(,@(coerce '(#\  #\, #\  #\RETURN #\  #\NEWLINE  #\  #\TAB  #\ ) 'string))
        ;;    #\COMMA :keep-first nil))
        ;; ((a)
        ;;  (dbc:split-field-on-char-if `(,@(coerce '(#\  #\, #\  #\RETURN #\  #\NEWLINE  #\  #\TAB  #\ ) 'string))
        ;;   #\COMMA :keep-first t))
        ((a b c)
         (dbc:split-field-on-char-if " ,      " #\COMMA :keep-first nil))         
        ((a)
         (dbc:split-field-on-char-if " ,      " #\COMMA :keep-first t))
        ;; :NOTE Corner case where `field-convert-1-0-x-empty' wins:
        ((a b c)
         (dbc:split-field-on-char-if "   " #\SPACE :keep-first nil))
        ((a b c)
         (dbc:split-field-on-char-if "   " #\SPACE :keep-first t))
        ))))
  (NIL NULL " , ")
  (",")
  (NIL NULL ", ")
  (",")
  (NIL NULL " ,")
  (",")
  (NIL NULL " ,      ")
  (",")
  (NIL MON:STRING-ALL-WHITESPACE "   ")
  (NIL MON:STRING-ALL-WHITESPACE "   "))
;;
;; (sb-rt:do-test 'split-field-on-char-if-TEST.1)

;; :TESTING `dbc:split-field-on-char-if' with keyword KEEP-DUPLICATES
(sb-rt:deftest split-field-on-char-if-TEST.2
    (values-list
     (mapcar #'eval
             (mapcar #'(lambda (form) 
                         `(multiple-value-bind ,(car form) ,(cadr form)
                            (list ,@(car form))))
     '(((a b c)
        (dbc:split-field-on-char-if " a | b | c | d | e | e | d | c | b | a | " #\VERTICAL_LINE :keep-duplicates nil))
       ((a b c)
        (dbc:split-field-on-char-if " a | b | c | d | e | e | d | c | b | a | " #\VERTICAL_LINE :keep-duplicates t))
       ((a b c)
        (dbc:split-field-on-char-if "8 ba ba" #\SPACE  :keep-duplicates nil))
       ((a b c)
        (dbc:split-field-on-char-if "8 ba ba" #\SPACE  :keep-duplicates t))))))
  (("a" "b" "c" "d" "e") CONS " a | b | c | d | e | e | d | c | b | a | ")
  (("a" "b" "c" "d" "e" "e" "d" "c" "b" "a") CONS " a | b | c | d | e | e | d | c | b | a | ")
  (("8" "ba") CONS "8 ba ba")
  ;; :FAIL (("8" "ba" "ba") CONS "8 ba ba black-sheep"))
  (("8" "ba" "ba") CONS "8 ba ba"))
;;
;; (sb-rt:do-test 'split-field-on-char-if-TEST.2)


;; :TODO fix sb-rt:deftest field-convert-1-0-x-empty-TEST.1 and sb-rt:deftest split-field-on-char-if-TEST.3
;; To use one of the hash-table's in `*big-parsed-class-field-slot-accessor-mapping-table*' instead.
;;
;; :TESTING `dbc:split-field-on-char-if' with keyword KNOWN-FIELD-HASHTABLE
;; (sb-rt:deftest split-field-on-char-if-TEST.3
;;     (values-list
;;      (mapcar #'eval
;;              (mapcar #'(lambda (form) 
;;                          `(multiple-value-bind ,(car form) ,(cadr form)
;;                             (list ,@(car form))))
;;      '(((a b c)
;;         (dbc:split-field-on-char-if "ref" #\DIGIT_ONE :known-field-hashtable dbc:*xml-refs-match-table*))
;;        ((a b c)
;;         (dbc:split-field-on-char-if "x" #\DIGIT_ONE :known-field-hashtable 'dbc:*xml-refs-match-table*))
;;        ((a b c)
;;         (dbc:split-field-on-char-if "1" #\DIGIT_ONE :known-field-hashtable dbc:*xml-refs-match-table*))
;;        ((a b c)
;;         (dbc:split-field-on-char-if "0," #\COMMA :known-field-hashtable 'dbc:*xml-refs-match-table*))
;;        ((a b c)
;;         (dbc:split-field-on-char-if " ," #\COMMA :known-field-hashtable dbc:*xml-refs-match-table*))
;;        ((a b c)
;;         (dbc:split-field-on-char-if " , " #\COMMA :known-field-hashtable 'dbc:*xml-refs-match-table*))
;;        ((a)
;;         (dbc:split-field-on-char-if " , " #\COMMA :keep-first t :known-field-hashtable dbc:*xml-refs-match-table*))
;;        ((a b c)
;;         (dbc:split-field-on-char-if "ref , " #\COMMA :known-field-hashtable 'dbc:*xml-refs-match-table*))
;;        ((a b c)
;;         (dbc:split-field-on-char-if "ref , ref" #\COMMA :known-field-hashtable 'dbc:*xml-refs-match-table*))
;;        ((a b c)
;;         (dbc:split-field-on-char-if "ref , ref" #\COMMA :keep-duplicates  t :known-field-hashtable 'dbc:*xml-refs-match-table*))))))
;;   (NIL NULL "ref")
;;   (NIL NULL "x")
;;   (T BOOLEAN "1")
;;   (("0") CONS "0,")
;;   (NIL NULL " ,")
;;   (NIL NULL " , ")
;;   (",")
;;   (("ref") CONS "ref , ")
;;   (("ref") CONS "ref , ref")
;;   ;; :FAIL (("ref" "ref") CONS "ref , should not be here")
;;   (("ref" "ref") CONS "ref , ref"))
;;
;; (sb-rt:do-test 'split-field-on-char-if-TEST.3)

;;; ==============================

;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc-test
;; End:

;;; ==============================
;;; EOF
