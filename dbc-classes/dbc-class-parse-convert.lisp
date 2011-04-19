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
;;; :DBC-CLASS-PARSE-CONVERT-DOCUMENTATION
;;; ==============================

(vardoc '*regexp-whitespace-chars*
"Regular expression for finding whitespace characters.~%~@
:SEE-ALSO `mon:*whitespace-chars*', `make-parsed-name-preprocess',
`preprocess-whitespace', `preprocess-leading-trailing-dashes',
`preprocess-underscore-to-dash', `preprocess-string-case',
`*regexp-whitespace-chars*'.~%►►►")

(fundoc 'preprocess-string-case
        "Convert FIELD-NAME to an upper-case string.~%~@
:EXAMPLE~%
  \(preprocess-string-case \"LoTS-OF-undeRSCOrES\"\)~%~@
:SEE-ALSO `make-parsed-name-preprocess', `preprocess-whitespace',
`preprocess-leading-trailing-dashes', `preprocess-underscore-to-dash',
`preprocess-string-case', `*regexp-whitespace-chars*'.~%►►►")

(fundoc 'preprocess-whitespace
"Remove whitepspace characters occuring anywhere in FIELD-NAME.~%~@
FIELD-NAME is an object of type `cl:simple-string'.~%
 :EXAMPLE~%
  \(preprocess-whitespace \" -LoTS_OF_ undeRSCOrES_ \"\)~%
  \(string= \(preprocess-whitespace \" -LoTS_OF_ undeRSCOrES_ \"\) \"-LoTS_OF_undeRSCOrES_\"\)~%~@
:SEE-ALSO `make-parsed-name-preprocess', `preprocess-whitespace',
`preprocess-leading-trailing-dashes', `preprocess-underscore-to-dash',
`preprocess-string-case', `*regexp-whitespace-chars*'.~%►►►")

(fundoc 'preprocess-leading-trailing-dashes
        "Remove leading and trailing underscore and dash characters #\\_ #\\-.~%~@
FIELD-NAME is an object of type `cl:simple-string'.~%~@
:EXAMPLE~%
 \(preprocess-leading-trailing-dashes \"-LoTS_OF_undeRSCOrES_\"\)
:SEE-ALSO `make-parsed-name-preprocess', `preprocess-whitespace',
`preprocess-leading-trailing-dashes', `preprocess-underscore-to-dash',
`preprocess-string-case', `*regexp-whitespace-chars*'.~%►►►")

(fundoc 'preprocess-underscore-to-dash
"Convert internal occurences of underscore character #\\_ to dash character #\\-.~%~@
FIELD-NAME is an object of type `cl:simple-string'.~%
:EXAMPLE~%
 \(preprocess-underscore-to-dash  \"Lots_of_underscores_\"\)~%
 \(string= \(preprocess-underscore-to-dash \"Lots_of_underscores_\"\) \"Lots-of-underscores\"\)~%~@
:NOTE Declared as of type `cl:simple-string' and using `cl:nsubstitute',
call after a `cl:copy-seq' of string.
:SEE-ALSO `mon:string-underscore-to-dash', `dbc:field-name-underscore-to-dash',
`make-parsed-name-preprocess', `preprocess-whitespace',
`preprocess-leading-trailing-dashes', `preprocess-underscore-to-dash',
`preprocess-string-case', `*regexp-whitespace-chars*'.~%►►►")

(fundoc 'make-parsed-name-preprocess
        "Preprocess FIELD-NAME for generation of slot-name and/or :initarg :reader :writer :accessor.
FIELD-NAME is an object of type `cl:simple-string'.~%
KEYWORD PREFIX-W is a string to prefix FIELD-NAME with.~%~@
KEYWORD SUFFIX-W is a string to suffix FIELD-NAME with.~%~@
:EXAMPLE~%
 \(make-parsed-name-preprocess \" -LoTS_OF_undeRSCOrES_\"\)~%
 \(string= \(make-parsed-name-preprocess \" -LoTS_OF_undeRSCOrES_\"\) \"LOTS-OF-UNDERSCORES\"\)~%~@
 \(make-parsed-name-preprocess \" -LoTS_OF_undeRSCOrES_\" :prefix-w \"prefix\" \)~%
 \(make-parsed-name-preprocess \" -LoTS_OF_undeRSCOrES_\" :suffix-w \"and-suffix\"\)~%
 \(make-parsed-name-preprocess \" -LoTS_OF_undeRSCOrES_\" 
                               :prefix-w \"__-_not-prefixed-W \" 
                               :suffix-w \"    or-suffixed-with-whitespace      \"\)~%~@
:SEE-ALSO `make-parsed-name-preprocess', `preprocess-whitespace',
`preprocess-leading-trailing-dashes', `preprocess-underscore-to-dash',
`preprocess-string-case', `*regexp-whitespace-chars*'.~%►►►")

(fundoc 'preprocess-slot-transform
        "Find FIELD-NAME in FIELD-NAME-TRANSFORM-TABLE and preprocess it with `make-parsed-name-preprocess'.~%~@
FIELD-NAME is a string.~%~@
FIELD-NAME-TRANSFORM-TABLE is an object of type hash-table or a symbol which evaluates to one. 
Its `cl:hash-table-test' should be return equal. An error is signaled if not.~%~@
If FIELD-NAME is not present in FIELD-NAME-TRANSFORM-TABLE put it there after
preprocessing with make-parsed-name-preprocess.~%~@
Keywords PREFIX-W and SUFFIX-W are as per `make-parsed-name-preprocess'.~%~@
:EXAMPLE~%
 \(preprocess-slot-transform \"field-name\" *parsed-ref-field-name-slot-transform*\)~%
 \(preprocess-slot-transform \"field-name2\" *parsed-ref-field-name-slot-transform*\)~%
 \(preprocess-slot-transform \"field-name2\" *parsed-ref-field-name-slot-transform* :prefix-w \"prefix\"\)~%
 \(preprocess-slot-transform \"field-name2\" *parsed-ref-field-name-slot-transform* :suffix-w \"suffix\"\)~%
 \(remhash \"field-name\" *parsed-ref-field-name-slot-transform*\)~%
 \(remhash \"field-name2\" *parsed-ref-field-name-slot-transform*\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'make-parsed-class-slot-init-accessor-name
 "Return 3 elt list strings suitable for interning as slot, initarg, and accessor.~%~@
NAMED-CLASS is a string naming a class which will subclass `dbc:parsed-class'.~%~@
PARSED-FIELD is a string field name in an xml table.~%~@
It is transformed with `dbc:field-name-underscore-to-dash'.~%~@
PREFIX-INITARG-W is a string to prefix a slot initarg name with. When ommited
defaults to processed value of PARSED-FIELD.~%~@
Return value has the form:~%
  \( \"<PARSED-FIELD>\"  ;; Post cleaning.
     \"<PREFIX-INITARG-W>-<PARSED-FIELD>\"
     \"<PARSED-FIELD>-<NAMED-CLASS>\" \)~%~@
:EXAMPLE~%
 \(make-parsed-class-slot-init-accessor-name \"parsed-ref\" \"ref\"\)~%
 \(make-parsed-class-slot-init-accessor-name \"parsed-ref\" \"year_year\"\)~%
 \(make-parsed-class-slot-init-accessor-name \"parsed-ref\" \"ref\" \"init\"\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
