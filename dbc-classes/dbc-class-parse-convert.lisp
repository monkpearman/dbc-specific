;;; :FILE-CREATED <Timestamp: #{2011-01-07T13:22:46-05:00Z}#{11015} - by MON>
;;; :FILE ../dbc-classes/dbc-class-parse-convert.lisp
;;; ==============================

;; :NOTE This is the base class from wich other converted dbc-classes inherit.
;;      The intent is that this class should allow auxillary :before :after :around
;;      methods to act on the primary-methods of `parsed-class' inheritors.
;;      IOW, this your basic mixin base class :)


(in-package #:dbc)

;; *package*


;;; ==============================
;;; :FUNCTIONS
;;; ==============================
;; alexandria:symbolicate alexandria:format-symbol alexandria:make-keyword
(defun make-parsed-class-slot-init-accessor-name (named-class parsed-field &optional prefix-initarg-w)
  ;; (make-parsed-class-slot-init-accessor-name "parsed-fef" "keyword_type" "INIT")
  ;;  => ("KEYWORD-TYPE" "INIT-KEYWORD-TYPE" "PARSED-FEF-KEYWORD-TYPE")
  ;;     ( <SLOT>         <INIT>              <ACCESSOR> )
  (declare (string named-class parsed-field))
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
;; `make-ref-lookup-table'   ->  `make-pared-lookup-table'

;; (defun make-parsed-sym-slot-name (slot-string-name)
;; (alexandria:symbolicate 
;; (alexandria:symbolicate  (sb-int:sane-package)

;; (alexandria:symbolicate  "make-parsed-class-slot-init-accessor-name" 
;; (mon::find-package*
;; (mon:where-is-local "make-parsed-class-slot-init-accessor-name")

;;; ==============================
;; :TODO Use alexandria:symbolicate alexandria:format-symbol alexandria:make-keyword alexandria:symbolicate
;;  to process return value of make-parsed-class-slot-init-accessor-name at loadtime to generate 
;;  <slot> :initarg <ACCESSOR> 
;; symbols for <CLASS> in <PACKAGE> 
;; Define classe _AFTER_ pushing the return  values onto a hashtable.



;;; ==============================
;;; :CLASSES
;;; ==============================
(defclass parsed-class (base-dbc)
  ;; :NOTE Which other slots accessors and generics should this class establish?
  ()
  (:documentation "Base dbc parsed class."))



;;; ==============================
;;; :DBC-CLASS-PARSE-CONVERT-DOCUMENTATION
;;; ==============================

(mon:fundoc 'make-parsed-class-slot-init-accessor-name
 "Return 3 elt list strings suitable for interning as slot, initarg, and accessor.~%~@
NAMED-CLASS is a string naming a class which will subclass `dbc:parsed-class'.~%~@
PARSED-FIELD is a string field name in an xml table.~%~@
It is transformed with `dbc:field-name-underscore-to-dash'.~%~@
PREFIX-INITARG-W is a string to prefix a slot initarg name with. When ommited
defaults to processed value of PARSED-FIELD.~%
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
;;; EOF
