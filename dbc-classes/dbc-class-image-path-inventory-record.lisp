;;; :FILE-CREATED <Timestamp: #{2012-03-08T13:41:31-05:00Z}#{12104} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-image-path-inventory-record.lisp
;;; ==============================

;; (find-method #'inventory-record-image-directory-probe nil '(parsed-inventory-record))
;; (find-method #'inventory-record-image-jpg-probe nil '(parsed-inventory-record))

(in-package #:dbc)



;;; ==============================
;;; inventory-record-image-<FOO> generics
;;; ==============================

(defgeneric inventory-record-image-directory-probe (object &key base-image-directory-pathname))

(defgeneric inventory-record-image-jpg-probe (object &key image-suffix 
                                                          base-image-directory-pathname
                                                          pathname-return-style))

(defgeneric inventory-record-image-jpg-probe-all  (object &key base-image-directory-pathname 
                                                               pathname-return-style))


;;; ==============================
;;; inventory-record-image-directory-probe
;;; ==============================

(defmethod inventory-record-image-directory-probe ((object integer) 
                                                   &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  (%inventory-record-image-directory-probe object
                                           :base-image-directory-pathname base-image-directory-pathname))

(defmethod inventory-record-image-directory-probe ((object string) 
                                                   &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  (%inventory-record-image-directory-probe object
                                           :base-image-directory-pathname base-image-directory-pathname))


(defmethod inventory-record-image-directory-probe ((object parsed-inventory-record) 
                                                   &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  (%inventory-record-image-directory-probe object
                                           :base-image-directory-pathname base-image-directory-pathname))


;;; ==============================
;; inventory-record-image-jpg-probe
;;; ==============================

(defmethod inventory-record-image-jpg-probe ((object integer) 
                                             &key (image-suffix "")
                                                  (base-image-directory-pathname *dbc-base-item-number-image-pathname*)
                                                  (pathname-return-style :absolute))
  (%inventory-record-image-jpg-probe object 
                                     :image-suffix image-suffix 
                                     :base-image-directory-pathname base-image-directory-pathname
                                     :pathname-return-style pathname-return-style))

(defmethod inventory-record-image-jpg-probe ((object string) 
                                             &key (image-suffix "")
                                                  (base-image-directory-pathname *dbc-base-item-number-image-pathname*)
                                                  (pathname-return-style :absolute))
  (%inventory-record-image-jpg-probe object 
                                     :image-suffix image-suffix 
                                     :base-image-directory-pathname base-image-directory-pathname
                                     :pathname-return-style pathname-return-style))

(defmethod inventory-record-image-jpg-probe ((object parsed-inventory-record) 
                                             &key (image-suffix "")
                                                  (base-image-directory-pathname *dbc-base-item-number-image-pathname*)
                                                  (pathname-return-style :absolute))
  (%inventory-record-image-jpg-probe object 
                                      :image-suffix image-suffix 
                                      :base-image-directory-pathname base-image-directory-pathname
                                      :pathname-return-style pathname-return-style))

;;; ==============================
;;; inventory-record-image-jpg-probe-all
;;; ==============================

(defmethod inventory-record-image-jpg-probe-all ((object integer)
                                                 &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*)
                                                      (pathname-return-style :absolute))
  (%inventory-record-image-jpg-probe-all object 
                                         :base-image-directory-pathname base-image-directory-pathname
                                         :pathname-return-style pathname-return-style))

(defmethod inventory-record-image-jpg-probe-all ((object string)
                                             &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*)
                                                  (pathname-return-style :absolute))
  (%inventory-record-image-jpg-probe-all object 
                                         :base-image-directory-pathname base-image-directory-pathname
                                         :pathname-return-style pathname-return-style))

(defmethod inventory-record-image-jpg-probe-all ((object parsed-inventory-record) 
                                             &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*)
                                                  (pathname-return-style :absolute))
  (%inventory-record-image-jpg-probe-all object 
                                         :base-image-directory-pathname base-image-directory-pathname
                                         :pathname-return-style pathname-return-style))


;;; ==============================
;;; %inventory-record-image-<FOO> interface functions
;;; ==============================

(defun %inventory-record-image-directory-probe (item-number 
                                                &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*))
  ;; may be better to declare parsed-class instead of parsed-inventory-record??
  (declare (type (or integer string parsed-inventory-record) item-number)
           (mon:pathname-or-namestring base-image-directory-pathname)
           (optimize (speed 3)))
  (let* ((0-string      (control-id-indexed-number-zero-padded-string item-number))
         (0-sold-string (concatenate 'string 0-string "_SOLD"))
         (0-string-dir  (probe-file (merge-pathnames 
                                     (make-pathname :directory `(:relative ,0-string))
                                     base-image-directory-pathname)))
         (0-string-sold-dir  
           (and (null 0-string-dir)
                ;; osicat:directory-exists-p
                (probe-file (merge-pathnames 
                             (make-pathname :directory `(:relative ,0-sold-string))
                             base-image-directory-pathname)))))
    (declare (string 0-string 0-sold-string)
             (type (or null pathname) 0-string-dir 0-string-sold-dir))
    (cond (0-string-dir
           (values 0-string-dir 0-string))
          (0-string-sold-dir
           (values 0-string-sold-dir 0-string 0-sold-string))
          (t 
           (values nil 0-string))))) ;item-number

(defun %inventory-record-image-jpg-probe (item-number &key (image-suffix "")
                                                           (base-image-directory-pathname *dbc-base-item-number-image-pathname*)
                                                           (pathname-return-style :absolute))
  ;; may be better to declare parsed-class instead of parsed-inventory-record??
  (declare 
   (type (or integer string parsed-inventory-record) item-number)
   (type (or string (eql :all)) image-suffix)
   (type (member :absolute :relative :file-pathname) pathname-return-style)
   (mon:pathname-or-namestring base-image-directory-pathname))
  (let ((suffixe (list "" "-m" "-s" "-f" "-fs" "-fc" "-z" :all)))
    (unless (member image-suffix suffixe :test #'string=)
      (error ":FUNCTION `%inventory-record-image-jpg-probe' -- keyword arg IMAGE-SUFFIX not a valid suffix~% ~
            must be one of one of~% ~A~% got: ~S" suffixe image-suffix))
    (if (eql image-suffix :all)
        (inventory-record-image-jpg-probe-all item-number 
                                              :base-image-directory-pathname base-image-directory-pathname
                                              :pathname-return-style pathname-return-style)
        (multiple-value-bind (got-dir 0-number-string maybe-sold-dir) 
            (%inventory-record-image-directory-probe item-number :base-image-directory-pathname base-image-directory-pathname)
          (declare (type (or null pathname) got-dir)
                   (string 0-number-string)
                   (type (or null string) maybe-sold-dir))
          (if (null got-dir)
              (values nil nil 0-number-string)
              (let ((maybe-find-jpg
                      (probe-file (merge-pathnames 
                                   (make-pathname :name (concatenate 'string 0-number-string image-suffix)
                                                  :type "jpg")
                                   got-dir))))
                (declare ((or null pathname) maybe-find-jpg))
                (if (null maybe-find-jpg) 
                    (values maybe-find-jpg got-dir 0-number-string)
                    (locally 
                        (declare (pathname got-dir))
                      (ecase pathname-return-style
                        (:absolute 
                         (values maybe-find-jpg got-dir 0-number-string))
                        (:relative
                         (values (make-pathname :directory (list :relative (or maybe-sold-dir 0-number-string))
                                                :name (pathname-name maybe-find-jpg)
                                                :type (pathname-type maybe-find-jpg))
                                 base-image-directory-pathname
                                 0-number-string))
                        (:file-pathname
                         (values (make-pathname :name (pathname-name maybe-find-jpg)
                                                :type (pathname-type maybe-find-jpg))
                                 got-dir
                                 0-number-string)))))))))))

;; (defparameter *tt--regex* "^[0-9]{6}?((-[msz]{1}?)??|(-f[sc]??)??)??$")
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

(let ((wild-regex (cl-ppcre:create-scanner "^[0-9]{6}?((-[msz]{1}?)??|(-f[sc]??)??)??$")))
  (defun %inventory-record-image-jpg-probe-all (item-number &key (base-image-directory-pathname *dbc-base-item-number-image-pathname*)
                                                                 (pathname-return-style :absolute))
    (declare (type (or integer string parsed-inventory-record) item-number)
             (type (member :absolute :relative :file-pathname) pathname-return-style)
             (mon:pathname-or-namestring base-image-directory-pathname)
             (optimize (speed 3)))
    (multiple-value-bind (got-dir 0-number-string maybe-sold-dir) (inventory-record-image-directory-probe 
                                                                   item-number 
                                                                   :base-image-directory-pathname base-image-directory-pathname)
      (declare (type (or null pathname) got-dir)
               (string 0-number-string)
               (type (or null string) maybe-sold-dir))
      (if (null got-dir) 
          (values nil nil 0-number-string) ; directory wasn't found => NIL, NIL, <O-NUMBER-STRING>
          (let (;; (wild-regex (cl-ppcre:create-scanner (format nil "^~A((-[msz]{1}?)??|(-f[sc]??)??)??$" 0-number-string)))
                (maybe-image-list (directory (merge-pathnames (make-pathname :name :wild
                                                                             :type "jpg")
                                                              got-dir))))
            (declare (list maybe-image-list)
                     (pathname got-dir))
            (if (null maybe-image-list)
                ;; :NOTE normally wehn return style is :relative and we found an
                ;; existing diretory for ITEM-NUMBER we return the parent of
                ;; got-dir. However, when no matching files were found beneath
                ;; pathname we must return got-dir. The semantics for recovering a
                ;; parent dir from given a null pathname are such that this
                ;; returns a meaningful pathname:
                ;;  (merge-pathnames (make-pathname :name nil :type nil)
                ;;   #P"/<BASE-IMAGE-DIRECTORY-PATHNAME>/<GOT_DIR>/")
                ;; whereas this doesn't:
                ;;  (merge-pathnames (make-pathname :name nil :type nil)
                ;;   #P"/<BASE-IMAGE-DIRECTORY-PATHNAME>/")
                (values nil got-dir 0-number-string)
                (labels ((match-sufffixe (namestring-or-null)
                           (declare (type (or null string) namestring-or-null))
                           (cl-ppcre:scan wild-regex namestring-or-null))

                         (filter-matches ()
                           (setf maybe-image-list 
                                 (delete-if-not #'match-sufffixe maybe-image-list :key #'pathname-name)))
                     
                         (relative-pathname-enough (matched-pathname)
                           (declare (pathname matched-pathname))
                           (make-pathname :directory (list :relative (or maybe-sold-dir 0-number-string))
                                          :name (pathname-name matched-pathname)
                                          :type (pathname-type matched-pathname)))
                   
                         (file-pathname-from-namestring (matched-pathname)
                           (declare (pathname matched-pathname))
                           ;; (pathname (file-namestring matched-pathname))
                           (make-pathname :name (pathname-name matched-pathname)
                                          :type (pathname-type matched-pathname)))

                         ;; (%pathname-directory-namestring (first-pathname)
                         ;;   (declare (pathname first-pathname))
                         ;;   ;; (pathname (directory-namestring first-pathname))
                         ;;   (make-pathname :directory (pathname-directory first-pathname)))
                       
                         (mapping-matched-pathnames (map-function)
                           (declare (ftype (function (pathname) pathname) 
                                           file-pathname-from-namestring
                                           relative-pathname-enough))
                           (map 'list map-function maybe-image-list))
                     
                         (sort-return-values (maybe-mapped-pathnames nth-1-pathname)
                           (declare (pathname nth-1-pathname)
                                    (cons maybe-mapped-pathnames))
                           (values (sort maybe-mapped-pathnames #'string< :key #'pathname-name)
                                   nth-1-pathname
                                   0-number-string))
                       
                         (return-style-dispatch ()
                           (ecase pathname-return-style
                             (:absolute
                              (sort-return-values 
                               maybe-image-list 
                               ;; (%pathname-directory-namestring (car maybe-image-list))
                               got-dir))
                             (:relative 
                              (sort-return-values
                               (mapping-matched-pathnames #'relative-pathname-enough)
                               base-image-directory-pathname))
                             (:file-pathname
                              (sort-return-values
                               (mapping-matched-pathnames #'file-pathname-from-namestring)
                               ;(%pathname-directory-namestring (car maybe-image-list))
                               got-dir)))))
                  (if (filter-matches)
                      (return-style-dispatch)
                      (values nil got-dir 0-number-string)))))))))


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
