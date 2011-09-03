;;; :FILE-CREATED <Timestamp: #{2011-05-23T20:18:33-04:00Z}#{11211} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-uuid-namespace-for-control-id.lisp
;;; ==============================


(in-package #:dbc)
;; *package*

(defgeneric uuid-namespace-for-control-id-class (object)
  (:documentation "Accessor for OBJECTs uuid namespace."))

(defgeneric (setf uuid-namespace-for-control-id-class) (coercable-uuid object)
  (:documentation "Set uuid namespace for OBJECT with COERCABLE-UUID
COERCABLE-UUID is a representation of a uuid in some form, e.g.:
 string, byte-array, bit-vector, unique-universal-identifier
currently only string is specialized."))

(defgeneric uuid-namespace-byte-array-for-control-id-class (object)
  (:documentation "Accessor for OBJECT's uuid-namespace-byte-array-for-control-id-class slot-value."))

(defgeneric (setf uuid-namespace-byte-array-for-control-id-class) (byte-array object)
  (:documentation "Set OBJECTs UUID namespace byte-array representation with BYTE-ARRAY.
BYTE-ARRAY is an object of type `unicly:uuid-byte-array-16'."))

(defgeneric uuid-namespace-bit-vector-for-control-id-class (object)
 (:documentation "Accessor for OBJECTs uuid namespace bit-vector representation."))

(defgeneric (setf uuid-namespace-bit-vector-for-control-id-class) (bv object)
 (:documentation "Set OBJECTs UUID namespace bit-vector representation with BV.
BV is an object of type `unicly:uuid-bit-vector-128'."))

(defgeneric uuid-namespace-version-for-control-id-class (object)
  (:documentation "Accessor for OBJECT's uuid-namespace-version-for-control-id-class slot-value."))

(defgeneric (setf uuid-namespace-version-for-control-id-class) (bv-or-string object)
  (:documentation "Set OBJECT's uuid version with BV-OR-STRING.
BV-OR-STRING is either an object of type `unicly:uuid-bit-vector-128' or an
integer in the range [1,5]"))

(defgeneric uuid-namespace-for-control-id-class-description (object stream)
  (:documentation "Print OBJECT's to  uuid-namespace-for-control-id-class slot-values STREAM."))


;;;; The class UUID-NAMESPACE-CONTROL-ID
(defclass uuid-namespace-control-id (base-uuid)
  ((uuid-namespace-for-control-id-class
    :documentation  
    #.(format nil
              "An object of type `unicly:unique-universal-identifier'.~%~@
               Value of this slot is suitable for use as a namespace argument to~%~@
               `unicly:make-v*-uuid'."))
   (uuid-namespace-byte-array-for-control-id-class
    :documentation  
    #.(format nil
              "An object of type `unicly:uuid-byte-array-16'.~%~@
               Value of this slot is the byte-array representation of the object in slot~%~@
               uuid-namespace-for-control-id-class."))
   (uuid-namespace-bit-vector-for-control-id-class
    :documentation  
    #.(format nil
              "An object of type `unicly:uuid-byte-array-128'.~%~@
               Value of this slot is the bit-vector representation of the object in slot~%~@
               uuid-namespace-for-control-id-class."))
   (uuid-namespace-version-for-control-id-class
    :documentation 
    #.(format nil 
              "The UUID version of the uuid namespace object in slot~%~@
               uuid-namespace-for-control-id-class.")))
  (:documentation 
   #.(format nil
             "Instances of this class hold namespace metadata for classes whose instances~%~@
              share a common UUID namespace."))) 

(defun make-uuid-namespace-control-id (&key base-namespace control-id)
  (declare (unicly:unique-universal-identifier base-namespace)
           ((or mon:string-not-null-empty-or-all-whitespace mon:symbol-not-null)
            control-id))
           ;; (or unicly:uuid-string-36 unicly:unique-universal-identifier)
           ;; control-id))
  ;; #-sbcl
  ;; (unless (or (unicly:uuid-string-36-p base-namespace)
  ;;             (unicly:unique-universal-identifier-p base-namespace))
  ;; (error ":FUNCTION `make-uuid-namespace-control-id' --~%~@
  ;;         arg NAMESPACE not of type `unicly:uuid-string-36-p'~%~@
  ;;         nor of type `unicly:unique-universal-identifier-p'~%~@
  ;;         got: ~S type-of: ~S" base-namespace (type-of base-namespace))
  (let ((new-obj
         (make-instance 'uuid-namespace-control-id))
        (new-nmspc (unicly:make-v5-uuid base-namespace 
                                        (or (and (symbolp control-id) 
                                                 (string control-id))
                                            control-id))))
    (setf (uuid-namespace-for-control-id-class new-obj)
          new-nmspc)
    new-obj))
    
;; (make-uuid-namespace-control-id :namespace *uuid-namespace-control-id-base-namespace*

;;;; UUID-NAMESPACE-FOR-CONTROL-ID-CLASS METHODS

(defmethod uuid-namespace-for-control-id-class ((object uuid-namespace-control-id))
  (when (slot-boundp object 'uuid-namespace-for-control-id-class)
    (slot-value object 'uuid-namespace-for-control-id-class)))

(defmethod (setf uuid-namespace-for-control-id-class) ((uuid-string string) 
                                                       (object uuid-namespace-control-id))
  ;; (if (unicly:uuid-hex-string-36-p uuid-string)
  ;; (setf (slot-value object 'uuid-namespace-for-control-id-class)
  ;;   (unicly:make-uuid-from-string uuid-string))
  ;; (error "Arg UUID-STRING did not satisfy `unicly:uuid-hex-string-36-p'.~%~
  ;;    Declining to set slot UUID-NAMESPACE-FOR-CONTROL-ID-CLASS.~%~
  ;;    got: ~S" uuid-string)
  (declare (unicly:uuid-hex-string-36 uuid-string))
  (let ((uuid-from-string (unicly:make-uuid-from-string uuid-string)))
    (declare (unicly:unique-universal-identifier uuid-from-string))
    (setf (slot-value object 'uuid-namespace-for-control-id-class)
          uuid-from-string)))

(defmethod (setf uuid-namespace-for-control-id-class) ((uuid unicly:unique-universal-identifier) 
                                                       (object uuid-namespace-control-id))
  ;; :NOTE `unicly:make-uuid-from-string' already coerces a uuid object with
  ;; `unicly:uuid-copy-uuid' we keep the method dispatch b/c we can check string
  ;; validity earlier.
  (setf (slot-value object 'uuid-namespace-for-control-id-class)
        (uuid-copy-uuid uuid)))

(defmethod (setf uuid-namespace-for-control-id-class) ((uuid-byte-array array) 
                                                       (object uuid-namespace-control-id))
  ;; :NOTE `unicly:make-uuid-from-string' already coerces a uuid object with
  ;; `unicly:uuid-copy-uuid' we keep the method dispatch b/c we can check string
  ;; validity earlier.
  (declare (unicly:uuid-byte-array-16 uuid-byte-array))
  (let ((uuid-from-byte-array (uuid-from-byte-array uuid-byte-array)))
    (declare (unicly:unique-universal-identifier uuid-from-byte-array))
    (setf (slot-value object 'uuid-namespace-for-control-id-class)
          uuid-from-byte-array)))

;; Make sure all other slots get propogated. 
(defmethod (setf uuid-namespace-for-control-id-class) :after ((uuid-arg t)
                                                              (object uuid-namespace-control-id))
  (let* ((uuid-bytes (unicly:uuid-get-namespace-bytes 
                      (uuid-namespace-for-control-id-class object)))
         ;; (uuid-bv (unicly:uuid-to-bit-vector (uuid-namespace-for-control-id-class object)))
         (uuid-bv   (uuid-byte-array-to-bit-vector (the unicly:uuid-byte-array-16 uuid-bytes))))
    (declare (unicly:uuid-byte-array-16 uuid-bytes)
             (unicly:uuid-bit-vector-128 uuid-bv))
    (setf (uuid-namespace-byte-array-for-control-id-class object)
          uuid-bytes)
    (setf (uuid-namespace-bit-vector-for-control-id-class object)
          uuid-bv)))


;;;; UUID-NAMESPACE-BYTE-ARRAY-FOR-CONTROL-ID-CLASS METHODS

(defmethod uuid-namespace-byte-array-for-control-id-class ((object uuid-namespace-control-id))
  (when (slot-boundp object 'uuid-namespace-byte-array-for-control-id-class)
    (slot-value  object 'uuid-namespace-byte-array-for-control-id-class)))

(defmethod (setf uuid-namespace-byte-array-for-control-id-class) ((byte-array array) 
                                                                 (object uuid-namespace-control-id))
  (declare (unicly:uuid-byte-array-16 byte-array))
  (setf (slot-value  object 'uuid-namespace-byte-array-for-control-id-class)
        byte-array))


;;;; UUID-NAMESPACE-BIT-VECTOR-FOR-CONTROL-ID-CLASS METHODS

(defmethod uuid-namespace-bit-vector-for-control-id-class ((object uuid-namespace-control-id))
  (when (slot-boundp object 'uuid-namespace-bit-vector-for-control-id-class)
    (slot-value object 'uuid-namespace-bit-vector-for-control-id-class)))

(defmethod (setf uuid-namespace-bit-vector-for-control-id-class) ((uuid-bit-vector bit-vector) ;; simple-bit-vector
                                                                  (object uuid-namespace-control-id))
  (declare (unicly:uuid-bit-vector-128 uuid-bit-vector))
  (setf (slot-value object 'uuid-namespace-bit-vector-for-control-id-class)
        uuid-bit-vector))

(defmethod (setf uuid-namespace-bit-vector-for-control-id-class) :after ((uuid-bit-vector bit-vector) ;; simple-bit-vector
                                                                         (object uuid-namespace-control-id))
  (declare (unicly:uuid-bit-vector-128 uuid-bit-vector))
  (let ((slot-value-if (uuid-namespace-version-for-control-id-class object))
        (version-if    (unicly:uuid-bit-vector-version uuid-bit-vector)))
    (declare ((mod 6) version-if))
    (when (zerop version-if)
      (error "Declining to set value for slot UUID-NAMESPACE-VERSION-FOR-CONTROL-ID-CLASS ~
             to non-valid uuid version.~%~
             Likely the source UUID is corrupted or a null-uuid!~%~
             got bit-vector: ~S"
             uuid-bit-vector))
    (if (and slot-value-if (eql slot-value-if version-if))
        version-if
        (setf (uuid-namespace-version-for-control-id-class object) version-if))))

;;;; UUID-NAMESPACE-VERSION-FOR-CONTROL-ID-CLASS METHODS

(defmethod uuid-namespace-version-for-control-id-class ((object uuid-namespace-control-id))
  (when (slot-boundp object 'uuid-namespace-version-for-control-id-class)
    (slot-value object 'uuid-namespace-version-for-control-id-class)))

(defmethod (setf uuid-namespace-version-for-control-id-class) ((integer integer) 
                                                               (object uuid-namespace-control-id))
  (declare ((mod 6) integer))
  (when (zerop integer)
    (error "Declining to set value for slot UUID-NAMESPACE-VERSION-FOR-CONTROL-ID-CLASS ~
            to non-valid uuid version. Likely the source UUID is corrupted!"))
  (setf (slot-value object 'uuid-namespace-version-for-control-id-class)
        integer))

(defmethod (setf uuid-namespace-version-for-control-id-class) ((uuid-bit-vector bit-vector) 
                                                               (object uuid-namespace-control-id))
  (declare (unicly:uuid-bit-vector-128 uuid-bit-vector))
  (let ((bv-version (unicly:uuid-bit-vector-version  uuid-bit-vector)))
    (declare ((mod 6) bv-version))
    (when (zerop bv-version)
      (error "Declining to set value for slot UUID-NAMESPACE-VERSION-FOR-CONTROL-ID-CLASS~
            to non-valid uuid version. Likely the source UUID is corrupted!"))
    (setf (slot-value object 'uuid-namespace-version-for-control-id-class)
          (unicly:uuid-bit-vector-version  uuid-bit-vector))))

(defmethod uuid-namespace-for-control-id-class-description ((object uuid-namespace-control-id) stream)
  (let* ((unbound "#<UNBOUND>")
         (namespace  (or (uuid-namespace-for-control-id-class object)
                         unbound))
         (byte-array  (or 
                       (uuid-namespace-byte-array-for-control-id-class object)
                       unbound))
         (bit-vector (or (uuid-namespace-bit-vector-for-control-id-class object)
                         unbound))
         (version-if (uuid-namespace-version-for-control-id-class object) )
         (version    (or (and version-if (format nil "~D" version-if))
                         unbound)))
    (format stream "~%~{~4T~16A~A~%~}"
            (list ;; "TYPE-OF:"    (type-of object)
             "NAMESPACE:"  namespace
             "VERSION:"    version 
             "BYTE-ARRAY:" byte-array 
             "BIT-VECTOR:" bit-vector))))

(defmethod print-object ((object uuid-namespace-control-id) stream)
  ;; (print-unreadable-object (object stream :type t) ;; :identity t)
  (print-unreadable-object (object stream :type t)
    (uuid-namespace-for-control-id-class-description object stream)))

;; (print-object  *tt--uuid-namespace-control-id-display* *standard-output*)


;;; ==============================
;;; EOF
