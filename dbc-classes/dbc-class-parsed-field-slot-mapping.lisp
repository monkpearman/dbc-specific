;;; :FILE-CREATED <Timestamp: #{2011-10-10T19:16:58-04:00Z}#{11411} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-field-slot-mapping.lisp
;;; ==============================


(in-package #:dbc)
;; *package*


;;; ==============================
;;; :CLASSES
;;; ==============================

(defgeneric field-to-accessor-table (object)
  (:documentation "Return a hash-table mapping field-names to slot-accessor for object.~%"))

(defgeneric accessor-to-field-table (object)
  (:documentation "Return a hash-table mapping field-names to slot-accessor for object.~%"))

(defgeneric parsed-class-mapped (object)
  (:documentation 
   "Return a symbol naming the class mapped by the hash-tables of slots:~%~% ~
accessor-to-field-table and field-to-accessor-table."))

(defclass parsed-class-field-slot-accessor-mapping (base-dbc)
  ((parsed-class-mapped
    :reader parsed-class-mapped)
   (field-to-accessor-table
    :reader field-to-accessor-table)
   (accessor-to-field-table
    :reader accessor-to-field-table))
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
:SEE-ALSO `<XREF>'.~%▶▶▶")))


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
    (format stream "HASH-MAPPED-CLASS ~S" (slot-value object 'parsed-class-mapped))))


;; Return an instance of class `parsed-class-field-slot-accessor-mapping'.~%~@
;; Arg PARSED-CLASS-MAPPED is a symbol designating a class which subclasses `parsed-class'.
;; Arg FIELD-TO-ACCESSOR-ALIST is an alist used to map the hash-tables of slots
;; field-to-accessor-table and accessor-to-field-table.
;; The car of each elt of FIELD-TO-ACCESSOR-ALIST is a string designating a field-name.
;; The cdr is a symbol designating an slot-accessor of class PARSED-CLASS-MAPPED.~%~@
;; :EXAMPLE
;; (let ((example-object (make-parsed-class-field-slot-accessor-mapping
;;                        'parsed-naf-entity
;;                        '(("categ" . category-entity-0-coref)))))
;;   (values
;;    (gethash
;;     (gethash "categ" (field-to-accessor-table example-object))
;;     (accessor-to-field-table example-object))
;;    (gethash
;;     (gethash 'category-entity-0-coref (accessor-to-field-table example-object))
;;     (field-to-accessor-table example-object))
;;    (parsed-class-mapped example-object)))
;;
;; :NOTE As above, the are GLOBAL-HASH-TABLE-VAR will always be `*parsed-class-field-slot-accessor-mapping-table*'
;; *parsed-class-field-slot-accessor-mapping-table*
(defun make-parsed-class-field-slot-accessor-mapping (parsed-class-mapped field-to-accessor-alist); global-hash-table-var)
  (unless (and (not (typep parsed-class-mapped 'boolean))
               (subtypep (find-class parsed-class-mapped) (find-class 'parsed-class)))
    (error "Arg PARSED-CLASS-MAPPED not a valid subtype of class `parsed-class'"))
  (let* ((mapping            (make-instance 'parsed-class-field-slot-accessor-mapping))
         (table-length-maybe (mon:prime-or-next-greatest  (length field-to-accessor-alist)))         
         (table-size         (if (> table-length-maybe sb-impl::+min-hash-table-size+)
                                 table-length-maybe
                                 sb-impl::+min-hash-table-size+))
         (f2a-table  (setf (slot-value mapping 'field-to-accessor-table)
                           (make-hash-table :test #'equal :size table-size)))
         (a2f-table  (setf (slot-value mapping 'accessor-to-field-table)
                           (make-hash-table :size table-size))))
    (dolist (pair field-to-accessor-alist (mon:hash-invert-key-val f2a-table a2f-table))
      (setf (gethash (car pair) f2a-table) (cdr pair)))
    ;; Bind slot-value of parsed-class-mapped last. No reason binding it earler
    ;; as the hash-mapping stuff above might error.
    ;; If PARSED-CLASS-MAPPED is already in our big global table we remove it as
    ;; it may non longer be current.
    (remhash (setf (slot-value mapping 'parsed-class-mapped) parsed-class-mapped)
             *parsed-class-field-slot-accessor-mapping-table*)
    ;;(setf (gethash parsed-class-mapped global-hash-table-var) mapping)))
    (setf (gethash parsed-class-mapped *parsed-class-field-slot-accessor-mapping-table*) mapping)))


;; :NOTE Arg HASH-TABLE will always be `*parsed-class-field-slot-accessor-mapping-table*'
;; But, lets not hardwire a global variable just in case!
;; :EXAMPLE
;; (%parsed-class-record-setf-slot-value-forms 'parsed-inventory-record *parsed-class-field-slot-accessor-mapping-table*)
(defun %parsed-class-record-setf-slot-value-forms (parsed-class-lookup); hash-table)
    ;; :NOTE This version with explicit call to HASH-TABLE and with backquoted template.
    ;; (let ((setf-forms ()))
    ;;   (maphash #'(lambda (k v) (push `(,k (setf (,v object) field-value)) setf-forms ))
    ;;            (field-to-accessor-table (gethash parsed-class-lookup *parsed-class-field-slot-accessor-mapping-table*)))
    ;;   (setf setf-forms (nreverse setf-forms))))
    (let ((setf-forms ()))  
      (maphash #'(lambda (k v)
                   (push (list k (list (quote setf) (list v (quote object)) (quote field-value))) setf-forms))
               (field-to-accessor-table (gethash parsed-class-lookup 
                                                 *parsed-class-field-slot-accessor-mapping-table*)))
                                                 ;; hash-table)))
      (setf setf-forms (nreverse setf-forms))))


;;; ==============================
;; :EXAMPLE
;; (def-set-parsed-class-record-slot-value
;;     set-parsed-inventory-record-slot-value              ; FUN-NAME
;;     parsed-inventory-record                             ; PARSED-CLASS 
;;   *parsed-class-field-slot-accessor-mapping-table*) ; GLOBAL-HASH-TABLE-VAR
;;
;; :TODO incorporate original fundoc of `set-parsed-inventory-record-slot-value' with new macro.
;;
;; (fundoc 'set-parsed-inventory-record-slot-value
;; "Map orginal sql tables FIELD-STRING name to OBJECT's CLOS slot equivalent setting its slot-value to FIELD-VALUE.~%~@
;; Return as if by `cl:values':~%
;;  - nth-value 0 is the setf'd FIELD-VALUE as set with slot accessor corresponding to FIELD-STRING.
;;  - nth-value 1 is OBJECT~%~@
;; For use with `load-sax-parsed-xml-file-to-parsed-class-hash' after reading in
;; XML files parsed with `write-sax-parsed-xml-refs-file'.~%~@
;; OJBECT is an instance of class `parsed-inventory-record'.~%~@
;; Original FIELD-STRING is the car of the the consed key/value pairs in one of the alists 
;; written to an output file by `write-sax-parsed-xml-refs-file' FIELD VALUE is
;; the corresponding cdr of the consed key/value pair.~%~@
;; The slot documentation of the class `parsed-inventory-record' provides indication of the
;; mapping from the original field name to our new slot name.~%~@
;; :EXAMPLE
;;  (set-parsed-inventory-record-slot-value "ref" "13000" (make-instance 'parsed-inventory-record))
;;
;; :SEE-ALSO `<XREF>'.~%▶▶▶")
;; 
;; :NOTE The setf of the accessor ensures we always populate the slot-value with nil
;; so as to avoid errors when slot is not `slot-boundp'.
;; 
;; :TODO Currently these accessor methods are defined automagically at class creation.
;; We need to unify common routines and symbol-names to appropriate generic
;; functions and where the behavior is generalized across all class specialize
;; them on the class `parsed-class'.
;;
(defmacro def-set-parsed-class-record-slot-value (fun-name parsed-class) ; global-hash-table-var)
  ;; (let ((body-forms (%expand-parsed-class-record-setf-slot-value-forms parsed-class global-hash-table-var)))
  ;; (%expand-parsed-class-record-setf-slot-value-forms parsed-class global-hash-table-var)  
  (let ((body-forms (%parsed-class-record-setf-slot-value-forms parsed-class)))
    `(defun ,fun-name (field-string field-value object)
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
