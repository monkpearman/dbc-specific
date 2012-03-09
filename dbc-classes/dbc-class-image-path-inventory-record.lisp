;;; :FILE-CREATED <Timestamp: #{2012-03-08T13:41:31-05:00Z}#{12104} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-image-path-inventory-record.lisp
;;; ==============================

;; (find-method #'inventory-record-image-directory-probe nil '(parsed-inventory-record))
;; (find-method #'inventory-record-image-jpg-probe nil '(parsed-inventory-record))

(in-package #:dbc)


(defgeneric inventory-record-image-directory-probe (object &key base-image-directory-pathname))

(defgeneric inventory-record-image-jpg-probe (object &key image-suffix base-image-directory-pathname))

;; (defgeneric inventory-record-image-jpg-probe-all  (object &key base-image-directory-pathname))

(defmethod inventory-record-image-directory-probe ((object integer) 
                                                   &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  (%inventory-record-image-directory-probe object :base-image-directory-pathname base-image-directory-pathname))

(defmethod inventory-record-image-directory-probe ((object string) 
                                                   &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  (%inventory-record-image-directory-probe object :base-image-directory-pathname base-image-directory-pathname))


(defmethod inventory-record-image-directory-probe ((object parsed-inventory-record) 
                                                   &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  (%inventory-record-image-directory-probe object :base-image-directory-pathname base-image-directory-pathname))

(defmethod inventory-record-image-jpg-probe ((object integer) 
                                              &key (image-suffix "")
                                                   (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  (%inventory-record-image-jpg-probe object 
                                      :image-suffix image-suffix 
                                      :base-image-directory-pathname base-image-directory-pathname))

(defmethod inventory-record-image-jpg-probe ((object string) 
                                              &key (image-suffix "")
                                                   (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  (%inventory-record-image-jpg-probe object 
                                      :image-suffix image-suffix 
                                      :base-image-directory-pathname base-image-directory-pathname))

(defmethod inventory-record-image-jpg-probe ((object parsed-inventory-record) 
                                              &key (image-suffix "")
                                                   (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  (%inventory-record-image-jpg-probe object 
                                      :image-suffix image-suffix 
                                      :base-image-directory-pathname base-image-directory-pathname))

(defun %inventory-record-image-directory-probe (item-number 
                                               &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  ;; may be better to declare parsed-class instead of parsed-inventory-record??
  (declare (type (or integer string parsed-inventory-record) item-number)
           (mon:pathname-or-namestring base-image-directory-pathname))
  (let* ((0-string      (control-id-indexed-number-zero-padded-string item-number))
         (0-sold-string (concatenate 'string 0-string "_SOLD"))
         (0-string-dir  (or 
                         ;; osicat:directory-exists-p
                         (probe-file (merge-pathnames 
                                      (make-pathname :directory `(:relative ,0-string))
                                      base-image-directory-pathname))
                         ;; osicat:directory-exists-p
                         (probe-file (merge-pathnames 
                                      (make-pathname :directory `(:relative ,0-sold-string))
                                      base-image-directory-pathname)))))
    (and 0-string-dir 
         (values 0-string-dir 0-string))))

(defun %inventory-record-image-jpg-probe (item-number &key (image-suffix "")
                                                           (base-image-directory-pathname *dbc-base-item-number-image-pathname*)
                                                           (pathname-return-style :absolute))
  ;; may be better to declare parsed-class instead of parsed-inventory-record??
  (declare 
   (type (or integer string parsed-inventory-record) item-number)
   (type (or string (eql :all)) image-suffix)
   (type (member :absolute :relative :file-pathname) pathname-return-style)
   (mon:pathname-or-namestring base-image-directory-pathname))
  (let ((suffixe '(list "" "-m" "-s" "-f" "-fs" "-fc" "-z" :all)))
    (unless (member image-suffix suffixe :test #'string=)
      (error ":FUNCTION `%inventory-record-image-jpg-probe' -- keyword arg IMAGE-SUFFIX not a valid suffix~% ~
            must be one of one of~% ~A~% got: ~S" suffixe image-suffix)))
  (let* ((0-string       (control-id-indexed-number-zero-padded-string item-number))
         (maybe-return
           (if (eql image-suffix :all)
               (return-from %inventory-record-image-jpg-probe
                 (values 
                  (%inventory-record-image-jpg-probe-all item-number 
                                                         :base-image-directory-pathname base-image-directory-pathname
                                                         :pathname-return-style pathname-return-style)
                  0-string
                  item-number))))
         (0-string-dir   
           (%inventory-record-image-directory-probe 0-string 
                                                    :base-image-directory-pathname 
                                                    base-image-directory-pathname))
         (0-img-pathname (and 0-string-dir
                              (probe-file 
                               (merge-pathnames (make-pathname :name (concatenate 'string 0-string image-suffix) :type "jpg")
                                                0-string-dir)))))
    (declare (ignorable maybe-return))
    (values 
     (setf 0-img-pathname
           (and 0-img-pathname
                (ecase pathname-return-style
                  (:absolute 0-img-pathname)
                  (:relative (pathname (enough-namestring 0-img-pathname base-image-directory-pathname)))
                  (:file-pathname  (pathname (file-namestring 0-img-pathname))))))
     0-string 
     item-number)))

;; (defparameter "^003566((-[msz]{1}?)??|(-f[sc]??)??)??$")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566-m")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566-s")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566-z")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566-f")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566-fs")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566-fc")
;; (cl-ppcre:scan-to-strings *tt--regex* "")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566-")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566-ms")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566-fm")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566-ff")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566-f0")
;; (cl-ppcre:scan-to-strings *tt--regex* "003566-mm")
;; (%inventory-record-image-jpg-probe-all 001893 :pathname-return-style :absolute)
;;
;; (multiple-value-bind (matches base) (%inventory-record-image-jpg-probe-all 001893 :pathname-return-style :relative)
;;   (when matches 
;;     (map 'list #'(lambda (x) (merge-pathnames x base)) matches)))  
;;
;; (%inventory-record-image-jpg-probe-all "1893" :pathname-return-style :file-pathname)
;; (multiple-value-bind (matches base) (%inventory-record-image-jpg-probe-all 001893 :pathname-return-style :file-pathname)
;;   (when matches 
;;     (map 'list #'(lambda (x) (merge-pathnames x base)) matches)))
(defun %inventory-record-image-jpg-probe-all (item-number &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*)
                                                               (pathname-return-style :absolute))
  (declare (type (member :absolute :relative :file-pathname)
                 pathname-return-style)) 
  (multiple-value-bind (got-dir 0-number) (inventory-record-image-directory-probe 
                                           item-number 
                                           :base-image-directory-pathname base-image-directory-pathname)
    (when got-dir 
      (let ((wild-regex (cl-ppcre:create-scanner (format nil "^~A((-[msz]{1}?)??|(-f[sc]??)??)??$" 0-number)))
            (maybe-image-list (directory 
                               (merge-pathnames (make-pathname :name :wild
                                                               :type "jpg")
                                                got-dir))))
        (when maybe-image-list
          (flet ((match-sufffixe (x)
                   (cl-ppcre:scan wild-regex x)))
            (setf maybe-image-list (delete-if-not #'match-sufffixe maybe-image-list :key #'pathname-name))
            (and maybe-image-list
                 (ecase pathname-return-style
                   (:absolute 
                    (sort maybe-image-list #'string< :key #'pathname-name))
                   (:relative 
                    (values
                     (sort (map 'list #'(lambda (x) 
                                          (pathname (enough-namestring x base-image-directory-pathname)))
                                maybe-image-list)
                           #'string< :key #'pathname-name)
                     base-image-directory-pathname))
                   (:file-pathname
                    ;; when we return only the pathnames we want the absolute and parent directory as well
                    (let ((directory-name (pathname (directory-namestring (car maybe-image-list)))))
                      (values
                       (sort (map 'list #'(lambda (x) (pathname (file-namestring x))) maybe-image-list)
                             #'string< :key #'pathname-name)
                       directory-name)))))))))))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
