;;; :FILE-CREATED <Timestamp: #{2011-10-10T19:16:58-04:00Z}#{11411} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-field-slot-mapping.lisp
;;; ==============================


(in-package #:dbc)
;; *package*


;;; ==============================
;;; :CLASSES
;;; ==============================

(defclass parsed-class-field-slot-accessor-mapping (base-dbc)
  ((parsed-class-mapped)     ; :reader parsed-class-mapped)
   (field-to-accessor-table) ; :reader field-to-accessor-table)
   (accessor-to-field-table)  ; :reader accessor-to-field-table)
   ;; a function for use with load-sax-parsed-xml-file-to-parsed-class-hash 
   ;; genearted with def-set-parsed-class-record-slot-value
   (parsed-class-slot-dispatch-function
    :reader parsed-class-slot-dispatch-function))
  (:documentation 
   #.(format nil
             "Object for holding a mappings of field-names with slot-accessors.~%~@
slot parsed-class-mapped is symbol designating the parse-class whose slots are
mapped by hash-tables in slots accessor-to-field-table and
slot-accessor-field-name-table.~%~@
Slot field-to-accessor-table is a hash-table mapping from:~%~% ~
  field-name (a string) to slot-accessor \(a symbol)
Its `cl:hash-table-test' is `cl:equal'.~%~@
Slot accessor-to-field-table is a hash-table with an inverse mapping from:~%~% ~
 symbol to field-name~%~
Its `cl:hash-table-test' is `cl:eql'.~%~@
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%▶▶▶")))

;; Returns a symbol designating a subclass of class `parsed-class'
;; :EXAMPLE
;; (parsed-class-mapped (gethash 'parsed-inventory-record *parsed-class-field-slot-accessor-mapping-table*))
(defmethod parsed-class-mapped ((object parsed-class-field-slot-accessor-mapping))
  ;; :WAS (slot-value object 'parsed-class-mapped))
  object)

;; (defmethod (setf parsed-class-mapped) (parsed-class-symbol (object parsed-class-field-slot-accessor-mapping))
;;   (setf (slot-value object 'parsed-class-mapped) parsed-class-symbol))

(defmethod accessor-to-field-table ((object parsed-class-field-slot-accessor-mapping))
  (slot-value object 'accessor-to-field-table))

(defmethod (setf accessor-to-field-table) (hash-table (object parsed-class-field-slot-accessor-mapping))
  (setf (slot-value object 'accessor-to-field-table) hash-table))

;; (field-to-accessor-table (make-instance 'parsed-class-field-slot-accessor-mapping))
(defmethod field-to-accessor-table ((object parsed-class-field-slot-accessor-mapping))
  (slot-value object 'field-to-accessor-table))

(defmethod (setf field-to-accessor-table) (hash-table (object parsed-class-field-slot-accessor-mapping))
  (setf (slot-value object 'field-to-accessor-table) hash-table))

(defmethod accessor-to-field-mapping (accessor (object parsed-class-field-slot-accessor-mapping))
  (gethash accessor (accessor-to-field-table object)))

(defmethod field-to-accessor-mapping (field (object parsed-class-field-slot-accessor-mapping))
  (gethash field (field-to-accessor-table object)))

(defmethod fields-of-parsed-class ((object parsed-class-field-slot-accessor-mapping))
  (alexandria:hash-table-keys (field-to-accessor-table object)))

(defmethod accessors-of-parsed-class ((object parsed-class-field-slot-accessor-mapping))
  (alexandria:hash-table-keys (accessor-to-field-table object)))

(defmethod parsed-class-slot-dispatch-function ((object parsed-class-field-slot-accessor-mapping))
  (or (and (slot-boundp object 'parsed-class-slot-dispatch-function)
           (slot-value object 'parsed-class-slot-dispatch-function))
      (error ":METHOD `parsed-class-slot-dispatch-function' specialized on class `parsed-class-field-slot-accessor-mapping' with unbound slot~%")))

;; (setf (slot-value (parsed-class-mapped 'parsed-inventory-record) 'parsed-class-slot-dispatch-function)(parsed-class-slot-dispatch-function (parsed-class-mapped 'parsed-inventory-record))

;; (defun print-parsed-class-field-slot-accessor-mapping (object stream)
;;   (format stream "~%:PARSED-CLASS-MAPPED     ~S ~S~%:FIELD-TO-ACCESSOR-TABLE ~S~%:ACCESSOR-TO-FIELD-TABLE ~S~%"
;;           (slot-value object 'parsed-class-mapped)
;;           (find-class (slot-value object 'parsed-class-mapped))
;;           (field-to-accessor-table object)
;;           (accessor-to-field-table object)))
;;
(defmethod print-object ((object parsed-class-field-slot-accessor-mapping) stream)
  ;;(remove-method  #'print-object (find-method #'print-object nil '(parsed-class-field-slot-accessor-mapping t)))
  (print-unreadable-object (object stream) ; :type t) 
    (format stream "HASH-MAPPED-CLASS ~S" 
            ;; (class-name (slot-value object 'parsed-class-mapped))
            (slot-value object 'parsed-class-mapped)
            )))

;; :NOTE As above, the arg GLOBAL-HASH-TABLE-VAR will always be `*parsed-class-field-slot-accessor-mapping-table*'
(defun make-parsed-class-field-slot-accessor-mapping (parsed-class-subclass field-to-accessor-alist); global-hash-table-var)
  (let ((the-class-parsed-class-subclass
         (or (find-class parsed-class-subclass nil)
             (error ":FUNCTION `make-parsed-class-field-slot-accessor-mapping'~% ~
                      Arg PARSED-CLASS-SUBCLASS does not exist.~% ~
                      It should be a symbol designating a subclass of `parsed-class'~% got: ~S~%" parsed-class-subclass))))
    (unless (and (not (typep parsed-class-subclass 'boolean))
                 (subtypep the-class-parsed-class-subclass (find-class 'parsed-class)))
      (error "Arg PARSED-CLASS-MAPPED not a valid subtype of class `parsed-class'~% got: ~S~%" 
             parsed-class-subclass))
    (let* ((mapping            (make-instance 'parsed-class-field-slot-accessor-mapping))
           (table-length-maybe (mon:prime-or-next-greatest  (length field-to-accessor-alist)))
           (table-size         (if (> table-length-maybe sb-impl::+min-hash-table-size+)
                                   table-length-maybe
                                   sb-impl::+min-hash-table-size+))
           (f2a-table  (setf (field-to-accessor-table mapping) (make-hash-table :test #'equal :size table-size)))
           (a2f-table  (setf (accessor-to-field-table mapping) (make-hash-table :size table-size)))
           (slot-dispatch-function (%parsed-class-set-slot-value-format-and-intern-symbol 
                                    parsed-class-subclass)))
      (setf (slot-value mapping 'parsed-class-slot-dispatch-function) slot-dispatch-function)
      (dolist (pair field-to-accessor-alist (mon:hash-invert-key-val f2a-table a2f-table))
        (setf (gethash (car pair) f2a-table) (cdr pair)))
      ;; Bind slot-value of parsed-class-mapped last. No reason binding it earlier
      ;; as the hash-mapping stuff above might error.
      ;; If PARSED-CLASS-MAPPED is already in our big global table we remove it as
      ;; it may no longer be current.
      (setf (slot-value mapping 'parsed-class-mapped) the-class-parsed-class-subclass)
      (remhash parsed-class-subclass *parsed-class-field-slot-accessor-mapping-table*)
      (setf (gethash parsed-class-subclass *parsed-class-field-slot-accessor-mapping-table*) mapping))))

;; (setf (gethash *parsed-class-field-slot-accessor-mapping-table*

;; :EXAMPLE
;;  (%parsed-class-record-setf-slot-value-forms 'parsed-inventory-record)
;; :NOTE Arg HASH-TABLE will always be `*parsed-class-field-slot-accessor-mapping-table*'
;; But, lets not hardwire a global variable just in case!
(defun %parsed-class-record-setf-slot-value-forms (parsed-class-lookup) ; hash-table)
  ;; :NOTE This version with explicit call to HASH-TABLE and with backquoted template.
  ;; (let ((setf-forms ()))
  ;;   (maphash #'(lambda (k v) (push `(,k (setf (,v object) field-value)) setf-forms ))
  ;;            (field-to-accessor-table (gethash parsed-class-lookup *parsed-class-field-slot-accessor-mapping-table*)))
  ;;   (setf setf-forms (nreverse setf-forms))))
  (let ((setf-forms ()))
    (maphash #'(lambda (k v)
                 (push (list k (list (quote setf) (list v (quote object)) (quote field-value))) setf-forms))
             ;; (field-to-accessor-table (gethash parsed-class-lookup *parsed-class-field-slot-accessor-mapping-table*))) ; hash-table)))
             (field-to-accessor-table parsed-class-lookup))
    (setf setf-forms (nreverse setf-forms))))

(defun %parsed-class-set-slot-value-format-and-intern-symbol (parsed-class)
  (alexandria:format-symbol (find-package "DBC") "~:@(SET-~A-SLOT-VALUE~)" parsed-class))

;; :NOTE The setf of the accessor ensures we always populate the slot-value with nil
;; so as to avoid errors when slot is not `slot-boundp'.
;; 
;; :TODO Currently these accessor methods are defined automagically at class creation.
;; We need to unify common routines and symbol-names to appropriate generic
;; functions and where the behavior is generalized across all class specialize
;; them on the class `parsed-class'.
;;
;; :EXAMPLE-USAGE
;; (def-set-parsed-class-record-slot-value
;;     set-parsed-inventory-record-slot-value              ; <FUN-NAME>
;;     parsed-inventory-record)                            ; <PARSED-CLASS> 
;;   *parsed-class-field-slot-accessor-mapping-table*)     ; <GLOBAL-HASH-TABLE-VAR> currently unused!
;;
;; (defmacro def-set-parsed-class-record-slot-value (fun-name for-parsed-class) ; global-hash-table-var)
(defmacro def-set-parsed-class-record-slot-value (for-parsed-class) ; global-hash-table-var)
  ;; (let ((body-forms (%expand-parsed-class-record-setf-slot-value-forms parsed-class global-hash-table-var)))
  ;; (%expand-parsed-class-record-setf-slot-value-forms parsed-class global-hash-table-var)  
  (let ((generated-name (%parsed-class-set-slot-value-format-and-intern-symbol for-parsed-class))
        (body-forms (%parsed-class-record-setf-slot-value-forms for-parsed-class)))
    ;; :WAS `(defun ,fun-name (field-string field-value object)
    `(defun ,generated-name (field-string field-value object)
       (values 
        (string-case:string-case (field-string)
          ,@body-forms)
          object))))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
