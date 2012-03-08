;;; :FILE-CREATED <Timestamp: #{2012-03-08T13:41:31-05:00Z}#{12104} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-image-path-inventory-record.lisp
;;; ==============================


(in-package #:dbc)

(defgeneric inventory-record-image-directory-probe (object &key base-image-directory-pathname))

(remove-method #'inventory-record-image-jpeg-probe
               (find-method #'inventory-record-image-jpeg-probe nil '(parsed-inventory-record)))

(defgeneric inventory-record-image-jpg-probe (object &key image-suffix base-image-directory-pathname))

;; (defgeneric inventory-record-image-jpg-probe-all  (object &key base-image-directory-pathname))

(defmethod inventory-record-image-directory-probe ((object integer) 
                                                   &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  (%inventory-record-image-directory-probe object :base-image-directory-pathname base-image-directory-pathname))

(defmethod inventory-record-image-directory-probe ((object string) 
                                                   &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  (%inventory-record-image-directory-probe object :base-image-directory-pathname base-image-directory-pathname))

;; (find-method #'inventory-record-image-directory-probe nil '(parsed-inventory-record))
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
                                                           (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  ;; may be better to declare parsed-class instead of parsed-inventory-record??
  (declare 
   (type (or integer string parsed-inventory-record) item-number)    
   (string image-suffix)
   (mon:pathname-or-namestring base-image-directory-pathname))
  (let ((suffixe '(list "" "-m" "-s" "-f" "-fs" "-fc" "-z")))
    (unless (member image-suffix suffixe :test #'string=)
      (error ":FUNCTION `inventory-record-image-jpg-probe' -- keyword arg IMAGE-SUFFIX not a valid suffix~% ~
            must be one of one of~% ~A~% got: ~S" suffixe image-suffix)))
  (let* ((0-string       (control-id-indexed-number-zero-padded-string item-number))
         (0-string-dir   (inventory-record-image-directory-probe 0-string 
                                                                 :base-image-directory-pathname 
                                                                 base-image-directory-pathname))
         (0-img-pathname (and 0-string-dir
                              (probe-file 
                               (merge-pathnames (make-pathname :name (concatenate 'string 0-string image-suffix) :type "jpg")
                                                0-string-dir)))))
    (values (and 0-img-pathname) 0-string item-number)))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
