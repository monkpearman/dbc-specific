;;; :FILE-CREATED <Timestamp: #{2011-10-05T22:49:49-04:00Z}#{11403} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-symbol-construct-deprecated.lisp
;;; ==============================

(in-package #:dbc)

(defparameter *parsed-inventory-record-field-name-slot-transform* (make-hash-table :test 'equal))

(defparameter *xml-refs-match-table* nil)
(defparameter *xml-refs-match-list*
  ;; before adding the hashtable pre NEW YORK.
  (list "ref" "price" "year" ;; "year_year"
        "artist" "condition"))

(defvar *parsed-inventory-record-class-name* "PARSED-INVENTORY-RECORD")

;; :TODO We don't need these anymore either generalize them callers to use
;; `*xml-input-parsed-class-pathname*' or remove!
;;
;; <--- INPUPT XML parsing file REAL
(defparameter *xml-input-refs-name* nil)
;; <--- XML parsing input file TEMP
(defparameter *xml-input-refs-name-temp*  nil )

;; *xml-refs-match-table*


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


;; (make-parsed-class-slot-init-accessor-name "parsed-class" "ref" )

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


;;; ==============================
;; Following used to be located in:
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-inventory-record.lisp
;;; ==============================

;;; ==============================
;; :NOTE the idea behind `*parsed-inventory-record-field-name-slot-transform*'
;; `make-ref-maker-sym-name', `make-ref-maker-symbol', `make-ref-lookup-table'
;;  Was to let us control construction of the slot-names and slot-accessor symbols for the class `parsed-inventory-record'
;; This would allow us to define generic functions much earlier than doing so
;; automagically at class defininition time and by extensio would give us
;; greater control over the method dispatch on the subclasses of the class `parsed-class'.
;; So, for example certain slots will have generic functions shared over many different subclasses, e.g.:
;; `edit-timestamp-origin' `edit-timestamp'
;; `naf-entity-person-coref' `naf-entity-artist-coref'
;; `naf-entity-author-coref' `naf-entity-brand-coref'
;; `naf-entity-publication-coref'
;;
;;  We aren't currently pre-defining generics for these accessors but _we should be_...
;;; ==============================



;; :UNUSED
(defun make-ref-maker-sym-name (ref-parse-field)
  ;; (make-ref-maker-sym-name "ref") => "REF-PARSED-INVENTORY-RECORD"
  (and (mon:string-not-null-or-empty-p ref-parse-field)
       (make-parsed-class-slot-init-accessor-name "parsed-inventory-record" ref-parse-field)))

;; (caddr (make-ref-maker-sym-name "artist"))
;; (make-parsed-class-slot-init-accessor-name  "parsed-inventory-record" "ref")
;; (nth 0 (make-parsed-class-slot-init-accessor-name "dbc-ref" "keywords_type") "PFX"))
;; (nth 2 (make-parsed-class-slot-init-accessor-name "parsed-inventory-record" "keywords_type"))

;; :UNUSED
(defun make-ref-maker-symbol (sym-name)
  ;; (make-ref-maker-symbol "ref")
  ;; (symbolp (make-ref-maker-symbol "ref"))
  (let ((mk-sym (make-ref-maker-sym-name sym-name)))
    (and mk-sym (read-from-string (nth 2 (make-ref-maker-sym-name sym-name))))))

;; :UNUSED
(defun make-ref-lookup-table (ref-list)
  ;; (make-ref-lookup-table (list "ref" "price" "year" "artist" "condition"))
  (let ((ref-hash (make-hash-table :test 'equal)))
    (loop
       :for ref :in ref-list
       :collecting (cons ref (make-ref-maker-symbol ref)) :into tbl
       :finally (loop
                   :for (key . val) :in tbl
                   :do (setf (gethash key ref-hash) val)))
    ref-hash))

;;; ==============================
;; :TODO `make-parsed-class-slot-init-accessor-name'
;;  - Separate the slot init-arg frobbing into a dedicated function
;;  - Change optional arg PREFIX-INITARG-W should be a keyword PREFIX-INIT-W
;;  - Add additional keyword SUFFFIX-INIT-W
;;  - Add additional keyword TRANSFORM (or NORMALIZE ???) when non-nil should
;;    rename from PARSED-FIELD to TRANSFORM
;; - Return value should have the format:
;;    <SLOT>  <TRANSFORM>  |  (<INIT> {INIT-PFX | INIT-SFX} )  <ACCESSOR>
;;
;; :SEE make-parsed-class-slot-accessor-name etc.
;;
;; --
;;  Current signature is:
;;   (make-parsed-class-slot-init-accessor-name named-class parsed-field &optional prefix-initarg-w)
;;
;; Current return values have the format:
;;  <SLOT>  ( <INIT-PFX> <FIELD-NAME> ) <ACCESSOR>
;;
;; Current return values are:
;;  (make-parsed-class-slot-init-accessor-name "parsed-inventory-record"  "artist"  "p")
;;   => ("ARTIST" "P-ARTIST" "PARSED-INVENTORY-RECORD-ARTIST")
;;
;;  (make-parsed-class-slot-init-accessor-name "parsed-inventory-record" "keywords_type")
;;  => ("KEYWORDS-TYPE" "KEYWORDS-TYPE" "PARSED-INVENTORY-RECORD-KEYWORDS-TYPE")
;;  
;;
;;; ==============================

;;; ==============================

(vardoc '*parsed-inventory-record-field-name-slot-transform*
        "Hashtable of field-name/transform pairs.~%~@
To be populated with `dbc:preprocess-slot-transform' prior to constructing the
slots for the class `parsed-inventory-record'.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")


(vardoc '*parsed-inventory-record-class-name*
"String naming the class \"PARSED-INVENTORY-RECORD\"
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

(vardoc '*xml-refs-match-table*
        "A hash-table mapping XML field names to corresponding parsing-function for use when parsing dbc-xml-refs.~%~@
The hash-table's keys are strings identifying XML field names i.e. attribute events.~%~@
The hash-table's vaules are symbols identifying a slot accessor for the class `parsed-inventory-record'.~%~@
Bound with `dbc:make-ref-lookup-table' to values of variable `dbc:*xml-refs-match-list*'.~%~@
:EXAMPLE~%
 \(gethash \"ref\" *xml-refs-match-table*\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

(vardoc '*xml-refs-match-list*
"List of fields needed when parsing dbc-xml-refs.~%~@
Bound at loadtime with `dbc:make-ref-lookup-table' as key values in hasthable of
variable `dbc:*xml-refs-match-table*'.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

(vardoc '*xml-input-refs-name*
"<--- Input file.~%~@
Use when parsing XML full dbc refs table.~%~@
Tweaked to remove non-valid portions at head of document.~%~@
:EXAMPLE~%
 \(pathname-directory *xml-input-refs-name*\)~%
 \(pathname-name *xml-input-refs-name*\)~%
 \(namestring *xml-input-refs-name*\)~%~@
:SEE-ALSO `*xml-output-dir*', `*xml-output-refs-name*', `*xml-output-refs-ext*',
`*xml-input-dir*', `*xml-input-refs-name*', `*xml-input-refs-name-temp*'.~%▶▶▶")

(vardoc '*xml-input-refs-name-temp*
"<--- Input file.~%~@
Temporary file for parsing XML refs before handling the whole shebang.~%~@
Use `*xml-input-refs-name*' when ready.~%~@
:EXAMPLE~%
 \(pathname-directory *xml-input-refs-name-temp*\)~%
 \(pathname-name *xml-input-refs-name-temp*\)~%
 \(namestring *xml-input-refs-name-temp*\)~%~@
:SEE-ALSO `*xml-output-dir*', `*xml-output-refs-name*', `*xml-output-refs-ext*',
`*xml-input-dir*', `*xml-input-refs-name*', `*xml-input-refs-name-temp*'.~%▶▶▶")



;;; ==============================
;;; :DBC-CLASS-PARSE-CONVERT-DOCUMENTATION
;;; dbc-classes/dbc-class-parse-convert.lisp
;;; ==============================

(vardoc '*regexp-whitespace-chars*
"Regular expression for finding whitespace characters.~%~@
:SEE-ALSO `mon:*whitespace-chars*', `make-parsed-name-preprocess',
`preprocess-whitespace', `preprocess-leading-trailing-dashes',
`preprocess-underscore-to-dash', `preprocess-string-case',
`*regexp-whitespace-chars*'.~%▶▶▶")

(fundoc 'preprocess-string-case
        "Convert FIELD-NAME to an upper-case string.~%~@
:EXAMPLE~%
  \(preprocess-string-case \"LoTS-OF-undeRSCOrES\"\)~%~@
:SEE-ALSO `make-parsed-name-preprocess', `preprocess-whitespace',
`preprocess-leading-trailing-dashes', `preprocess-underscore-to-dash',
`preprocess-string-case', `*regexp-whitespace-chars*'.~%▶▶▶")

(fundoc 'preprocess-whitespace
"Remove whitepspace characters occuring anywhere in FIELD-NAME.~%~@
FIELD-NAME is an object of type `cl:simple-string'.~%
 :EXAMPLE~%
  \(preprocess-whitespace \" -LoTS_OF_ undeRSCOrES_ \"\)~%
  \(string= \(preprocess-whitespace \" -LoTS_OF_ undeRSCOrES_ \"\) \"-LoTS_OF_undeRSCOrES_\"\)~%~@
:SEE-ALSO `make-parsed-name-preprocess', `preprocess-whitespace',
`preprocess-leading-trailing-dashes', `preprocess-underscore-to-dash',
`preprocess-string-case', `*regexp-whitespace-chars*'.~%▶▶▶")

(fundoc 'preprocess-leading-trailing-dashes
        "Remove leading and trailing underscore and dash characters #\\_ #\\-.~%~@
FIELD-NAME is an object of type `cl:simple-string'.~%~@
:EXAMPLE~%
 \(preprocess-leading-trailing-dashes \"-LoTS_OF_undeRSCOrES_\"\)
:SEE-ALSO `make-parsed-name-preprocess', `preprocess-whitespace',
`preprocess-leading-trailing-dashes', `preprocess-underscore-to-dash',
`preprocess-string-case', `*regexp-whitespace-chars*'.~%▶▶▶")

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
`preprocess-string-case', `*regexp-whitespace-chars*'.~%▶▶▶")

(fundoc 'make-parsed-name-preprocess
        "Preprocess FIELD-NAME for generation of slot-name and/or :initarg :reader :writer :accessor.
FIELD-NAME is an object of type `cl:simple-string'.~%
KEYWORD PREFIX-W is a string to prefix FIELD-NAME with.~%~@
KEYWORD SUFFIX-W is a string to suffix FIELD-NAME with.~%~@
:EXAMPLE~%
 \(make-parsed-name-preprocess \" -LoTS_OF_undeRSCOrES_\"\)
 ;=> \"LOTS-OF-UNDERSCORES\"~%
 \(string= \(make-parsed-name-preprocess \" -LoTS_OF_undeRSCOrES_\"\) \"LOTS-OF-UNDERSCORES\"\)
 ;=> T~%
 \(make-parsed-name-preprocess \" -LoTS_OF_undeRSCOrES_\" :prefix-w \"prefix\" \)
 ;=> \"PREFIX-LOTS-OF-UNDERSCORES\"~%
 \(make-parsed-name-preprocess \" -LoTS_OF_undeRSCOrES_\" :suffix-w \"and-suffix\"\)
 ;=> \"LOTS-OF-UNDERSCORES-AND-SUFFIX\"~%
 \(make-parsed-name-preprocess \" -LoTS_OF_undeRSCOrES_\"
                              :prefix-w \"__-_not-prefixed-W \"
                              :suffix-w \"    or-suffixed-with-whitespace      \"\)
 ;=> \"NOT-PREFIXED-W-LOTS-OF-UNDERSCORES-OR-SUFFIXED-WITH-WHITESPACE\"~%~@
:SEE-ALSO `make-parsed-name-preprocess', `preprocess-whitespace',
`preprocess-leading-trailing-dashes', `preprocess-underscore-to-dash',
`preprocess-string-case', `*regexp-whitespace-chars*'.~%▶▶▶")

(fundoc 'preprocess-slot-transform
        "Find FIELD-NAME in FIELD-NAME-TRANSFORM-TABLE and preprocess it with `make-parsed-name-preprocess'.~%~@
FIELD-NAME is a string.~%~@
FIELD-NAME-TRANSFORM-TABLE is an object of type hash-table or a symbol which evaluates to one. 
Its `cl:hash-table-test' should be return equal. An error is signaled if not.~%~@
If FIELD-NAME is not present in FIELD-NAME-TRANSFORM-TABLE put it there after
preprocessing with make-parsed-name-preprocess.~%~@
Keywords PREFIX-W and SUFFIX-W are as per `make-parsed-name-preprocess'.~%~@
:EXAMPLE~%
 \(preprocess-slot-transform \"field-name\" *parsed-inventory-record-field-name-slot-transform*\)
 ;=> \"FIELD-NAME\"
 \(gethash \"field-name\" *parsed-inventory-record-field-name-slot-transform*\)
 ;=> \"FIELD-NAME\", T~%
 \(preprocess-slot-transform \"field-name2\" *parsed-inventory-record-field-name-slot-transform*\)
 ;=> \"FIELD-NAME2\"
 \(gethash \"field-name2\" *parsed-inventory-record-field-name-slot-transform*\)
 ;=> \"FIELD-NAME2\", T~%
 \(preprocess-slot-transform \"field-name2\" *parsed-inventory-record-field-name-slot-transform* :prefix-w \"prefix\"\)
 ;=> \"PREFIX-FIELD-NAME2\"
 \(gethash \"field-name2\" *parsed-inventory-record-field-name-slot-transform*\)
 ;=> \"PREFIX-FIELD-NAME2\", T~%
 \(preprocess-slot-transform \"field-name2\" *parsed-inventory-record-field-name-slot-transform* :suffix-w \"suffix\"\)
 ;=> \"FIELD-NAME2-SUFFIX\"
 \(gethash \"field-name2\" *parsed-inventory-record-field-name-slot-transform*\)
 ;=> \"FIELD-NAME2-SUFFIX\", T~%
 \(preprocess-slot-transform \"field-name2\" *parsed-inventory-record-field-name-slot-transform* :prefix-w \"prefix\" :suffix-w \"suffix\"\)
 ;=> \"PREFIX-FIELD-NAME2-SUFFIX\"
 \(gethash \"field-name2\" *parsed-inventory-record-field-name-slot-transform*\)
 ;=> \"PREFIX-FIELD-NAME2-SUFFIX\", T~%
 \(progn
   \(remhash \"field-name\" *parsed-inventory-record-field-name-slot-transform*\)
   \(remhash \"field-name2\" *parsed-inventory-record-field-name-slot-transform*\)\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

;; this interface has changes pending 2011-09-26
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
 ;;                                          <NAMED-CLASS>  <PARSED-FIELD> &OPTIONAL <PREFIX-INITARG-W>
 \(make-parsed-class-slot-init-accessor-name  \"parsed-inventory-record\"   \"ref\"\)~%
 \(make-parsed-class-slot-init-accessor-name  \"parsed-inventory-record\"   \"year_year\"\)~%
 \(make-parsed-class-slot-init-accessor-name  \"parsed-inventory-record\"   \"ref\"                     \"init\"\)~%
 \(make-parsed-class-slot-init-accessor-name  \"parsed-inventory-record\"   \"ref\"                     \"init\"\)
 => \(\"REF\"                     ; <PARSED-FIELD>                    ; -> slot in class
     \"INIT-REF\"                ; <PREFIX-INITARG-W>-<PARSED-FIELD> ; -> slot initarg
     \"PARSED-INVENTORY-RECORD-REF\"\)         ; <PARSED-FIELD>-<NAMED-CLASS>      ; -> slot accessor~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")



;;; ==============================
;;; EOF
