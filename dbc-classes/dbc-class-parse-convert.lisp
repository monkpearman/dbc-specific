;;; :FILE-CREATED <Timestamp: #{2011-01-07T13:22:46-05:00Z}#{11015} - by MON>
;;; :FILE ../dbc-classes/dbc-class-parse-convert.lisp
;;; ==============================


(in-package #:dbc)

;; *package*


;;; ==============================
;;; :FUNCTIONS
;;; ==============================

(defvar *regexp-whitespace-chars*
  #.(format nil "[~{~C~}]" mon:*whitespace-chars*))

;; (deftype preprocess-simple-string (&optional size)
;;   ;; (typep "string" '(preprocess-simple-string 6))
;;   ;; (typep "string" 'preprocess-simple-string)
;;   (let ((sz (list (or size '*))))
;;     `(simple-array character ,sz)))

(defun preprocess-whitespace (field-name)
  (declare (type simple-string field-name))
  (cl-ppcre:regex-replace-all (the (simple-array character (9)) *regexp-whitespace-chars*)  field-name ""))

(declaim (inline preprocess-leading-trailing-dashes))
(defun preprocess-leading-trailing-dashes (field-name)
  (declare (type simple-string field-name)
           (optimize speed))
  ;;(mon:string-replace-all  field-name  "_" "" )
  (string-trim "_- " field-name))

(declaim (inline preprocess-underscore-to-dash))
(defun preprocess-underscore-to-dash (field-name)
  (declare (type simple-string field-name)
           (optimize speed))
  (setf field-name (preprocess-leading-trailing-dashes field-name))
  (nsubstitute #\- #\_ field-name))

;; (string= (preprocess-underscore-to-dash "Lots_of_underscores_") "Lots-of-underscores")

(declaim (inline preprocess-string-case))
(defun preprocess-string-case (field-name)
  (declare (type simple-string field-name)
           (optimize speed))
  ;; :NOTE using `cl:nstring-upcase', call after something that returns a copy of string.
  (nstring-upcase field-name))

(defun make-parsed-name-preprocess (field-name &key prefix-w suffix-w)
  (declare (type string field-name)
           ((or null string)  prefix-w suffix-w)
           (inline preprocess-underscore-to-dash
                   preprocess-leading-trailing-dashes
                   preprocess-string-case))
  (let ( ;; CL:COPY-SEQ so we're sure we don't destructively modidfy eslewhere.
        (rslt (copy-seq field-name))
        (pfx  (and prefix-w 
                   (mon:string-not-empty-p prefix-w )
                   (concatenate 'string (make-parsed-name-preprocess prefix-w) "-")))
        (sfx  (and suffix-w 
                   (mon:string-not-empty-p suffix-w)
                   (concatenate 'string "-" (make-parsed-name-preprocess suffix-w)))))
    (declare (type simple-string field-name))
    (setf rslt (preprocess-whitespace rslt))
    (setf rslt (preprocess-underscore-to-dash rslt))
    (setf rslt (preprocess-leading-trailing-dashes rslt))
    (setf rslt (preprocess-string-case rslt))
    (setf rslt (concatenate 'string pfx rslt sfx))))

;; (defun preprocess-slot-to-defclass-slot () (...) )
(defun preprocess-slot-transform (field-name field-name-transform-table &key prefix-w suffix-w)
  (declare (string field-name))
  (let* ((chk-is-hash (mon:hash-or-symbol-p field-name-transform-table))
         (chk-hash (ecase (hash-table-test chk-is-hash)
                     (equal chk-is-hash)))
         (get-transform (gethash field-name (the hash-table chk-hash))))
    (declare (hash-table chk-hash))
    (or (and get-transform 
             (or (and (string= get-transform
                               (make-parsed-name-preprocess field-name :prefix-w prefix-w :suffix-w suffix-w))
                      get-transform)
                 (setf get-transform (make-parsed-name-preprocess field-name :prefix-w prefix-w :suffix-w suffix-w)))
             (setf (gethash field-name chk-hash) get-transform))
        (setf (gethash field-name chk-hash) 
              (make-parsed-name-preprocess field-name :prefix-w prefix-w :suffix-w suffix-w)))))

;;; ==============================
;; :SOURCE quicklisp/quicklisp/dist.lisp :WAS `config-file-initargs'
;; Modeled after `config-file-initargs' but use functions frome mon: package instead of quicklisp centric ones.
;; Useful for reading in key value pairs from file by line use `mon:make-keyword-sanely'
;; (defun read-key-val-args-from-file (file)
;;   (let ((key-val-prs '())) 
;;     (for-each-line (line file)
;;       (unless (ignorable-line line)
;;         (destructure-line (key-word val)
;;             line
;;           (let ((keyword (initarg-keyword (string-right-trim ":" key-word))))
;;             (push value key-val-pr)
;;             (push keyword key-val-pr)))))
;;     key-val-prs))

;;; ==============================
;; alexandria:symbolicate alexandria:format-symbol alexandria:make-keyword
(defun make-parsed-class-slot-init-accessor-name (named-class parsed-field &optional prefix-initarg-w)
  ;; (make-parsed-class-slot-init-accessor-name "parsed-fef" "keyword_type" "INIT")
  ;;  => ("KEYWORD-TYPE" "INIT-KEYWORD-TYPE" "PARSED-FEF-KEYWORD-TYPE")
  ;;     ( <SLOT>         <INIT>              <ACCESSOR> )
  (declare (string named-class parsed-field)
           ((or null string) prefix-initarg-w))
  (let* ((slot     (field-name-underscore-to-dash parsed-field))
         (init
          (or (and (stringp prefix-initarg-w)
                   (concatenate 'string (string-upcase prefix-initarg-w) "-" slot))
              slot))
         (access   (format nil "~A-~A" (string-upcase named-class) slot)))
    (list slot init access)))


;; (               <TRANSFORM> 
;; ( <FIELD-NAME>  <RENAME-TO>  (<INITP> <INIT-PFX>) )

;; These need to something more generalized versions:
;; `make-ref-maker-sym-name' ->  `make-parsed-sym-slot-name'
;; `make-ref-maker-symbol'   ->  `make-parse-slot-symbol'    ;; using `alexandria:symbolicate'/`alexandria:make-keyword'
;; `make-ref-lookup-table'   ->  `make-parsed-lookup-table'

;; (defun make-parsed-sym-slot-name (slot-string-name)
;; (alexandria:symbolicate 
;; (alexandria:symbolicate  (sb-int:sane-package)

;; (alexandria:symbolicate  "make-parsed-class-slot-init-accessor-name" 
;; (mon::find-package*
;; (mon:where-is-local "make-parsed-class-slot-init-accessor-name")

;;; (unintern 'is-bubba)
;; (read-from-string "is-bubba")
;; (mon:where-is-local "is-bubba")


;;; ==============================
;; :TODO Use alexandria:symbolicate alexandria:format-symbol alexandria:make-keyword alexandria:symbolicate
;;  to process return value of make-parsed-class-slot-init-accessor-name at loadtime to generate 
;;  <slot> :initarg <ACCESSOR> 
;; symbols for <CLASS> in <PACKAGE> 
;; Define classe _AFTER_ pushing the return  values onto a hashtable.
;;
;; :NOTE Use `mon:string-case' for this.


;;; ==============================
;;; :CLASSES
;;; ==============================

;; :NOTE This is the base class from wich other converted dbc-classes inherit.
;;      The intent is that this class should allow auxillary :before :after :around
;;      methods to act on the primary-methods of `parsed-class' inheritors.
;;      IOW, this your basic mixin base class :)

(defclass parsed-class (base-dbc)
  ;; :NOTE Which other slots accessors and generics should this class establish?
  ()
  (:documentation "Base dbc parsed class."))


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
