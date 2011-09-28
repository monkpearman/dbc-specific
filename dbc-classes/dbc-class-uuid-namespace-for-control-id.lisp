;;; :FILE-CREATED <Timestamp: #{2011-05-23T20:18:33-04:00Z}#{11211} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-uuid-namespace-for-control-id.lisp
;;; ==============================

;;; ==============================
;; uuid-namespace-for-control-id-class
;;
;; (defparameter *tt--name-control*
;;   (make-uuid-namespace-control-id :base-namespace unicly:*uuid-namespace-dns*
;;                                   :control-id "bubba"))
;;

;; (let ((new-obj (make-instance 'uuid-namespace-control-id)))
;;   (setf (uuid-namespace-for-control-id-identity new-obj)
;;         (list unicly:*uuid-namespace-dns* "bubba")))

;; (uuid-namespace-for-control-id-class *tt--name-control*)
;; (uuid-namespace-for-control-id-class *tt--name-control*)
;;
;; (setf (uuid-namespace-version-for-control-id *tt--name-control*)
;;       (unicly::uuid-version-bit-vector (uuid-namespace-bit-vector-for-control-id *tt--name-control*)))
;;
;; (uuid-namespace-version-for-control-id *tt--name-control*)
;; (setf *tt--name-control* 
;;       (uuid-namespace-bit-vector-for-control-id *tt--name-control*)
;;       )
;;
;; (unicly:uuid-from-byte-array (uuid-namespace-byte-array-for-control-id *tt--name-control*))
;; => eea1105e-3681-5117-99b6-7b2b5fe1f3c7
;;
;; (uuid-namespace-for-control-id-class *tt--name-control*)
;; => eea1105e-3681-5117-99b6-7b2b5fe1f3c7
;;
;; (uuid-namespace-for-control-id-class-description *tt--name-control* nil)
;; (print-object  *tt--uuid-namespace-control-id-display* *standard-output*)
;;
;;
;; (let ((new-obj (make-instance 'uuid-namespace-control-id)))
;;   (setf (uuid-namespace-for-control-id-identity new-obj)
;;         (list unicly:*uuid-namespace-dns* "bubba"))
;;   new-obj)
;;
;; (make-uuid-namespace-control-id :base-namespace unicly:*uuid-namespace-dns* 
;;                                  :control-id "bubba")
;;
;; (let ((new-obj (make-instance 'uuid-namespace-control-id)))
;;   (setf (uuid-namespace-for-control-id-base-namespace new-obj)
;;         unicly:*uuid-namespace-dns*))
;;
;; (defparameter *tt--control* 
;;    (make-uuid-namespace-control-id :base-namespace unicly:*uuid-namespace-dns* 
;;                                    :control-id 'bubba))
;;
;;    (make-uuid-namespace-control-id :base-namespace unicly:*uuid-namespace-dns* 
;;                                    :control-id "bubba"))
;;
;; (setf (uuid-namespace-for-control-id-identity *tt--control*)
;;       (list (make-v4-uuid) "new-bubba"))
;;
;;; ==============================

;;
;; (defclass tt--unbound ()
;;   (stupid ))
;; (slot-makunbound (make-instance 'tt--unbound) 'stupid)
;; (unintern 'tt--unbound)


(in-package #:dbc)
;; *package*


(defgeneric uuid-namespace-for-control-id-identity (object)
  (:documentation "Accessor for OBJECT's uuid-namespace-for-control-id-identity slot-value."))

(defgeneric (setf uuid-namespace-for-control-id-identity) (namespace-and-identity object)
  (:documentation "Set OBJECT's uuid-namespace-for-control-id-identity slot-value to IDENTITY"))

(defgeneric uuid-namespace-for-control-id-base-namespace (object)
  (:documentation "Return the base-namespace UUID for OBJECT'S uuid-namespace-for-control-id-base-namespace slot-value."))

(defgeneric (setf uuid-namespace-for-control-id-base-namespace) (uuid object)
  (:documentation "Set UUID as OBJECT's uuid-namespace-for-control-id-base-namespace slot-value."))

(defgeneric uuid-namespace-for-control-id-class (object)
  (:documentation "Accessor for OBJECT's uuid-namespace-for-control-id-class slot-value."))

(defgeneric (setf uuid-namespace-for-control-id-class) (coercable-uuid object)
  (:documentation "Set uuid namespace for OBJECT with COERCABLE-UUID
COERCABLE-UUID is a representation of a Unicly UUID in some form, e.g.:
 hex-string-36, byte-array-16, bit-vector-128, unique-universal-identifier"))

(defgeneric uuid-namespace-byte-array-for-control-id (object)
  (:documentation "Accessor for OBJECT's uuid-namespace-byte-array-for-control-id slot-value."))

(defgeneric (setf uuid-namespace-byte-array-for-control-id) (byte-array object)
  (:documentation "Set OBJECT's UUID namespace byte-array representation with BYTE-ARRAY.
BYTE-ARRAY is an object of type `unicly:uuid-byte-array-16'."))

(defgeneric uuid-namespace-bit-vector-for-control-id (object)
 (:documentation "Accessor for OBJECTs uuid namespace bit-vector representation."))

(defgeneric (setf uuid-namespace-bit-vector-for-control-id) (bv object)
 (:documentation "Set OBJECT's UUID namespace bit-vector representation with BV.
BV is an object of type `unicly:uuid-bit-vector-128'."))

(defgeneric uuid-namespace-integer-for-control-id (object)
  (:documentation "Accessor for OBJECT's uuid-namespace-integer-for-control-id slot-value."))

(defgeneric (setf uuid-namespace-integer-for-control-id) (uuid-integer-128 object)
  (:documentation "Set OBJECT's 128bit integer  representation with UUID-INTEGER-128."))

(defgeneric uuid-namespace-hex-string-36-for-control-id (object)
  (:documentation "Accessor for OBJECT's uuid-namespace-hex-string-36-for-control-id slot-value."))

(defgeneric (setf uuid-namespace-hex-string-36-for-control-id) (uuid-hex-string-36 object)
  (:documentation "Set OBJECT's `unicly::uuid-hex-string-36' representation with UUID-HEX-STRING-36."))  

(defgeneric uuid-namespace-version-for-control-id (object)
  (:documentation "Accessor for OBJECT's uuid-namespace-version-for-control-id slot-value."))

(defgeneric (setf uuid-namespace-version-for-control-id) (bv-or-string object)
  (:documentation "Set OBJECT's uuid version with BV-OR-STRING.
BV-OR-STRING is either an object of type `unicly:uuid-bit-vector-128' or an
integer in the range [1,5]"))

(defgeneric uuid-namespace-for-control-id-class-description (object stream)
  (:documentation "Print slot-values of OBJECT to STREAM."))


;;;; The class UUID-NAMESPACE-CONTROL-ID
(defclass uuid-namespace-control-id (base-uuid)
  (
   (uuid-namespace-for-control-id-identity
    :documentation  
    #.(format nil
              "An object identified by the `unicly:unique-universal-identifier'~%~
              by slot-value of uuid-namespace-for-control-id-class."))
   (uuid-namespace-for-control-id-base-namespace
    :documentation  
    #.(format nil
              "An object of type `unicly:unique-universal-identifier' which acts~%~
              as the NAMESPACE arg to `unicly:make-v5-uuid' in conjunction with~%~
              slot-value of uuid-namespace-for-control-id-identity as the NAME arg."))
   (uuid-namespace-for-control-id-class
    :documentation  
    #.(format nil
              "An object of type `unicly:unique-universal-identifier'.~%~@
               Value of this slot is suitable for use as a namespace argument to~%~@
               `unicly:make-v*-uuid'."))
   (uuid-namespace-byte-array-for-control-id
    :documentation  
    #.(format nil
              "An object of type `unicly:uuid-byte-array-16'.~%~@
               Value of this slot is the byte-array representation of the object in slot~%~@
               uuid-namespace-for-control-id-class."))
   (uuid-namespace-bit-vector-for-control-id
    :documentation  
    #.(format nil
              "An object of type `unicly:uuid-byte-array-128'.~%~@
               Value of this slot is the bit-vector representation of the object in slot~%~@
               uuid-namespace-for-control-id-class."))
   (uuid-namespace-integer-for-control-id
    :documentation  
    #.(format nil
              "An object of type `unicly::uuid-integer-128'.~%~@
               Value of this slot is the 128bit integer representation of the object in slot~%~@
               uuid-namespace-for-control-id-class."))
   (uuid-namespace-hex-string-36-for-control-id
    :documentation  
    #.(format nil
              "An object of type `unicly::uuid-hex-string-36'.~%~@
               Value of this slot is the hecadecimal integer representation of the object in slot~%~@
               uuid-namespace-for-control-id-class."))
   (uuid-namespace-version-for-control-id
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
    (setf (uuid-namespace-for-control-id-identity new-obj)
          (list base-namespace control-id))
    (setf (uuid-namespace-for-control-id-class new-obj)
           new-nmspc)
    new-obj))

(defun %verify-valid-string-or-symbol-for-identity (verify-identity)
  (declare (mon:symbol-not-null-or-string-not-empty verify-identity))
  (unless (mon:symbol-not-null-or-string-not-empty-p verify-identity)
    (error "arg IDENTITY did not satisfy `mon:symbol-not-null-or-string-not-empty-p'"))
  (if (stringp verify-identity)
      (if (mon::%fast-string-all-whitespace-p verify-identity)
          (error "arg IDENTITY must not be contained of all whitespace characters")
          verify-identity)
      verify-identity))

(defmethod uuid-namespace-for-control-id-base-namespace ((object uuid-namespace-control-id))
  (when (slot-boundp object 'uuid-namespace-for-control-id-base-namespace)
    (slot-value object 'uuid-namespace-for-control-id-base-namespace)))

(defmethod (setf uuid-namespace-for-control-id-base-namespace) ((uuid unicly:unique-universal-identifier)
                                                                (object uuid-namespace-control-id))
  (setf (slot-value object 'uuid-namespace-for-control-id-base-namespace)
        uuid))

(defmethod uuid-namespace-for-control-id-identity ((object uuid-namespace-control-id))
  (when (slot-boundp object 'uuid-namespace-for-control-id-identity)
    (slot-value object 'uuid-namespace-for-control-id-identity)))

;; In order to store the Identity as a slot-value of the class we need to run in an :around method.
(defmethod (setf uuid-namespace-for-control-id-identity) ((namespace-and-identity t) 
                                                          (object uuid-namespace-control-id))
  ;;(destructuring-bind (namespace identity) namespace-and-identity
  ;; (let ((symbol-check (cadr namespace-and-identity)))
    ;; (unless (stringp symbol-check)
    ;;   (setf symbol-check (string symbol-check)))
    (setf (slot-value object 'uuid-namespace-for-control-id-identity)
          ;;symbol-check)))
          (cadr namespace-and-identity)))


(defmethod (setf uuid-namespace-for-control-id-identity) :around ((namespace-and-identity t) 
                                                                  (object uuid-namespace-control-id))
  ;; (remove-method #'(setf uuid-namespace-for-control-id-identity) 
  ;; (find-method #'(setf uuid-namespace-for-control-id-identity) '(:around) '(t uuid-namespace-control-id)))
  (declare (type list namespace-and-identity))
  (destructuring-bind (namespace identity) namespace-and-identity ;; (list (make-v4-uuid)  "<IDENTITY>")
    (declare ((and (or string symbol) (not null)) identity)
             (unicly:unique-universal-identifier namespace))
    (%verify-valid-string-or-symbol-for-identity identity)
    (let ((new-namespace       (unicly:make-v5-uuid namespace (or (and (symbolp identity) 
                                                                       (string identity))
                                                                  identity)))
          (old-id-slot         (uuid-namespace-for-control-id-identity       object))
          (old-base-namespace  (uuid-namespace-for-control-id-base-namespace object))
          ;; We might not have any slots set or only some, so get all of them.
          (old-namespace-slot  (uuid-namespace-for-control-id-class          object))
          (old-byte-array-slot (uuid-namespace-byte-array-for-control-id     object))
          (old-bit-vector-slot (uuid-namespace-bit-vector-for-control-id     object))
          (old-integer-slot    (uuid-namespace-integer-for-control-id        object))
          (old-hex-string-slot (uuid-namespace-hex-string-36-for-control-id  object))
          ;;(old-version-slot    (uuid-namespace-version-for-control-id        object))
          (new-namespace-slot  '()))
      (unwind-protect 
           (progn 
             (setf new-namespace-slot 
                   (ignore-errors 
                     (setf (uuid-namespace-for-control-id-class object)
                           new-namespace)))
             ;; if we didn't error we can safeley set the base-namespace slot
             ;; else unset what we just set...
             
             ;; (uuid-namespace-for-control-id-base-namespace object)
             ;; (call-next-method)
             ;; namespace-and-identity
             (when new-namespace-slot 
               (list 
                (setf (uuid-namespace-for-control-id-base-namespace object)
                      namespace)
                (call-next-method))
               ))
        (unless new-namespace-slot
          (let ((slot-val-for-rollback (or old-bit-vector-slot
                                           old-namespace-slot
                                           old-byte-array-slot
                                           old-integer-slot
                                           old-hex-string-slot)))

            (when slot-val-for-rollback
              ;; this will clear the existing control-identity and and
              ;; base-namespace slots with slot-makunbound and we set them back
              ;; to their previous state afterwards.
              (setf (uuid-namespace-for-control-id-base-namespace object)
                    slot-val-for-rollback))
            (if (and old-base-namespace old-id-slot)
                (progn
                  (setf (uuid-namespace-for-control-id-base-namespace object) old-base-namespace)
                  ;; we set the slot-value explicitly instead of using the method
                  ;; specialized because it would land us right back here!
                  (setf (slot-value object 'uuid-namespace-control-id-identity) old-id-slot))
                ;; if either the control-identity or base-namespace slots is
                ;; null or unbound the the other should be as well.
                (progn 
                  (slot-makunbound object 'uuid-namespace-for-control-id-base-namespace)
                  (slot-makunbound object 'uuid-namespace-for-control-id-identity)))))))))


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
  (declare (unicly::uuid-hex-string-36 uuid-string))
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

(defmethod (setf uuid-namespace-for-control-id-class) ((uuid-bit-vector bit-vector) 
                                                       (object uuid-namespace-control-id))
  ;; :NOTE `unicly:make-uuid-from-string' already coerces a uuid object with
  ;; `unicly:uuid-copy-uuid' we keep the method dispatch b/c we can check string
  ;; validity earlier.
  (declare (unicly::uuid-bit-vector-128 uuid-bit-vector))
  (let ((uuid-from-bv (unicly::uuid-from-bit-vector uuid-bit-vector)))
    (declare (unicly:unique-universal-identifier uuid-from-bv))
    (setf (slot-value object 'uuid-namespace-for-control-id-class)
          uuid-from-bv)))

(defmethod (setf uuid-namespace-for-control-id-class) ((uuid-byte-array array) 
                                                       (object uuid-namespace-control-id))
  ;; :NOTE `unicly:make-uuid-from-string' already coerces a uuid object with
  ;; `unicly:uuid-copy-uuid' we keep the method dispatch b/c we can check string
  ;; validity earlier.
  (declare (unicly::uuid-byte-array-16 uuid-byte-array))
  (let ((uuid-from-byte-array (uuid-from-byte-array uuid-byte-array)))
    (declare (unicly:unique-universal-identifier uuid-from-byte-array))
    (setf (slot-value object 'uuid-namespace-for-control-id-class)
          uuid-from-byte-array)))

(defmethod (setf uuid-namespace-for-control-id-class) ((integer-128 bignum) 
                                                       (object uuid-namespace-control-id))
  ;; (if (unicly:uuid-hex-string-36-p uuid-string)
  ;; (setf (slot-value object 'uuid-namespace-for-control-id-class)
  ;;   (unicly:make-uuid-from-string uuid-string))
  ;; (error "Arg UUID-STRING did not satisfy `unicly:uuid-hex-string-36-p'.~%~
  ;;    Declining to set slot UUID-NAMESPACE-FOR-CONTROL-ID-CLASS.~%~
  ;;    got: ~S" uuid-string)
  (declare (unicly::uuid-ub128 integer-128))
  (let ((uuid-from-int 
         (unicly::uuid-from-bit-vector
          (unicly::uuid-integer-128-to-bit-vector integer-128))))
    (declare (unicly:unique-universal-identifier uuid-from-int))
    (setf (slot-value object 'uuid-namespace-for-control-id-class)
          uuid-from-int)))

;; (make-uuid-namespace-control-id :base-namespace unicly:*uuid-namespace-dns* 
;;                                 :control-id "bubba")

;; Make sure all other slots get propagated whenever a slot containing a uuid
;; representation gets touched.
(defmethod (setf uuid-namespace-for-control-id-class) :after ((uuid-arg t)
                                                              (object uuid-namespace-control-id))
  (let* ((uuid-bv-prevent (unicly:uuid-to-bit-vector 
                           (uuid-namespace-for-control-id-class object)))
         (uuid-bv    (if (unicly:uuid-bit-vector-128-p uuid-arg)
                         ;; if the uuid-arg is the same bv128 as the conversion don't re-trigger
                         (if (unicly:uuid-bit-vector-eql uuid-arg uuid-bv-prevent)
                             nil
                             uuid-arg)
                         uuid-bv-prevent))
         (uuid-bytes (if (unicly:uuid-byte-array-16-p uuid-arg)
                         (let* ((existing-slot    (uuid-namespace-byte-array-for-control-id object))
                                (existing-slot-bv (when existing-slot 
                                                    (unicly:uuid-byte-array-to-bit-vector existing-slot)))
                                (ba-to-bv         (if existing-slot-bv
                                                      nil
                                                      (unicly:uuid-byte-array-to-bit-vector uuid-arg))))
                           (if existing-slot-bv
                               (if (unicly:uuid-bit-vector-eql existing-slot-bv uuid-bv-prevent)
                                   nil
                                   uuid-arg)
                               (if (unicly:uuid-bit-vector-eql ba-to-bv uuid-bv-prevent)
                                   nil
                                   uuid-arg)))
                         (unicly:uuid-bit-vector-to-byte-array uuid-bv-prevent)))
         (uuid-int   (if (typep uuid-arg 'bignum)
                         (let* ((existing-slot    (uuid-namespace-integer-for-control-id object))
                                (existing-slot-bv (when existing-slot 
                                                    (unicly::uuid-integer-128-to-bit-vector existing-slot)))
                                (int-to-bv         (if existing-slot-bv
                                                       nil
                                                       (unicly::uuid-integer-128-to-bit-vector uuid-arg))))
                           (if existing-slot-bv
                               (if (unicly:uuid-bit-vector-eql existing-slot-bv uuid-bv-prevent)
                                   nil
                                   uuid-arg)
                               (if (unicly:uuid-bit-vector-eql int-to-bv uuid-bv-prevent)
                                   nil
                                   uuid-arg)))
                         (unicly::uuid-bit-vector-to-integer uuid-bv-prevent)))
         (uuid-hex-36   (if (unicly::uuid-hex-string-36-p uuid-arg)
                            (let* ((existing-slot    (uuid-namespace-hex-string-36-for-control-id object))
                                   (existing-slot-bv (when existing-slot 
                                                       (unicly::uuid-to-bit-vector (make-uuid-from-string existing-slot))))
                                   (hex-to-bv         (if existing-slot-bv
                                                          nil
                                                          (unicly::uuid-to-bit-vector (make-uuid-from-string uuid-arg)))))
                              (if existing-slot-bv
                                  (if (unicly:uuid-bit-vector-eql existing-slot-bv uuid-bv-prevent)
                                      nil
                                      uuid-arg)
                                  (if (unicly:uuid-bit-vector-eql hex-to-bv uuid-bv-prevent)
                                      nil
                                      uuid-arg)))
                            (unicly:uuid-princ-to-string (uuid-namespace-for-control-id-class object)))))
    (declare (type (or unicly::uuid-byte-array-16 null)  uuid-bytes)
             (type (or unicly::uuid-bit-vector-128 null) uuid-bv)
             (type (or unicly::uuid-ub128 null)          uuid-int)
             (type (or unicly::uuid-hex-string-36 null)  uuid-hex-36))
    ;; (setf (uuid-namespace-version-for-control-id object)
    ;;       uuid-bv)
    (when uuid-bv
      (setf (uuid-namespace-bit-vector-for-control-id object)
            uuid-bv))
    (when uuid-bytes
      (setf (uuid-namespace-byte-array-for-control-id object)
            uuid-bytes))
    (when uuid-hex-36
      (setf (uuid-namespace-hex-string-36-for-control-id object)
            uuid-hex-36))
    (when uuid-int
      (setf (uuid-namespace-integer-for-control-id object)
            uuid-int))
    (if (uuid-namespace-for-control-id-identity object)
        (if (uuid-namespace-for-control-id-base-namespace object)
            ;; make sure that the namespace and identity evaluate to the
            ;; namespace we just set, and if not remove them.
            (unless (unicly::uuid-bit-vector-eql
                     (uuid-namespace-bit-vector-for-control-id object)
                     (uuid-to-bit-vector
                      (make-v5-uuid
                       (uuid-namespace-for-control-id-base-namespace object)
                       (string (uuid-namespace-for-control-id-identity object)))))
              (slot-makunbound object 'uuid-namespace-for-control-id-identity)
              (slot-makunbound object 'uuid-namespace-for-control-id-base-namespace))
            (slot-makunbound object 'uuid-namespace-for-control-id-identity))
        ;; the control-identity isn't present, so if the base-namespace is as
        ;; well it shouldn't be
        (when (uuid-namespace-for-control-id-base-namespace object)
          (slot-makunbound object 'uuid-namespace-for-control-id-base-namespace)))
    uuid-arg))


;;;; UUID-NAMESPACE-BYTE-ARRAY-FOR-CONTROL-ID METHODS

(defmethod uuid-namespace-byte-array-for-control-id ((object uuid-namespace-control-id))
  (when (slot-boundp object 'uuid-namespace-byte-array-for-control-id)
    (slot-value  object 'uuid-namespace-byte-array-for-control-id)))

(defmethod (setf uuid-namespace-byte-array-for-control-id) ((byte-array array) 
                                                            (object uuid-namespace-control-id))
  (declare (unicly::uuid-byte-array-16 byte-array))
  (setf (slot-value  object 'uuid-namespace-byte-array-for-control-id)
              byte-array))


;;; UUID-NAMESPACE-HEX-STRING-36-FOR-CONTROL-ID METHODS

(defmethod uuid-namespace-hex-string-36-for-control-id ((object uuid-namespace-control-id))
  (when (slot-boundp object 'uuid-namespace-hex-string-36-for-control-id)
    (slot-value  object 'uuid-namespace-hex-string-36-for-control-id)))


(defmethod (setf uuid-namespace-hex-string-36-for-control-id) ((uuid-hex-string-36 string)
                                                               (object uuid-namespace-control-id))
  (declare (unicly::uuid-hex-string-36 uuid-hex-string-36))
  (setf (slot-value object 'uuid-namespace-hex-string-36-for-control-id)
              uuid-hex-string-36))


;;; UUID-NAMESPACE-INTEGER-FOR-CONTROL-ID METHODS

(defmethod uuid-namespace-integer-for-control-id ((object uuid-namespace-control-id))
  (when (slot-boundp object 'uuid-namespace-integer-for-control-id)
    (slot-value object 'uuid-namespace-integer-for-control-id)))

(defmethod (setf uuid-namespace-integer-for-control-id) ((uuid-integer-128 bignum)
                                                         (object uuid-namespace-control-id))
  (declare (unicly::uuid-ub128 uuid-integer-128))
  (setf (slot-value object 'uuid-namespace-integer-for-control-id)
        uuid-integer-128))


;;;; UUID-NAMESPACE-BIT-VECTOR-FOR-CONTROL-ID METHODS

(defmethod uuid-namespace-bit-vector-for-control-id ((object uuid-namespace-control-id))
  (when (slot-boundp object 'uuid-namespace-bit-vector-for-control-id)
    (slot-value object 'uuid-namespace-bit-vector-for-control-id)))

(defmethod (setf uuid-namespace-bit-vector-for-control-id) ((uuid-bit-vector bit-vector) ;; simple-bit-vector
                                                            (object uuid-namespace-control-id))
  (declare (unicly::uuid-bit-vector-128 uuid-bit-vector))
  (setf (slot-value object 'uuid-namespace-bit-vector-for-control-id)
              uuid-bit-vector))

(defmethod (setf uuid-namespace-bit-vector-for-control-id) :after ((uuid-bit-vector bit-vector) ;; simple-bit-vector
                                                                   (object uuid-namespace-control-id))
  (declare (unicly::uuid-bit-vector-128 uuid-bit-vector))
  (let ((slot-value-if (uuid-namespace-version-for-control-id object))
        (version-if    (unicly::uuid-version-bit-vector uuid-bit-vector)))
    (declare ((mod 6) version-if))
    (when (zerop version-if)
      (error "Declining to set value for slot UUID-NAMESPACE-VERSION-FOR-CONTROL-ID ~
             to non-valid uuid version.~%~
             Likely the source UUID is corrupted or a null-uuid!~%~
             got bit-vector: ~S"
             uuid-bit-vector))
    (if (and slot-value-if (eql slot-value-if version-if))
        version-if
        (setf (uuid-namespace-version-for-control-id object) version-if))))


;;;; UUID-NAMESPACE-VERSION-FOR-CONTROL-ID METHODS

(defmethod uuid-namespace-version-for-control-id ((object uuid-namespace-control-id))
  (when (slot-boundp object 'uuid-namespace-version-for-control-id)
    (slot-value object 'uuid-namespace-version-for-control-id)))

(defmethod (setf uuid-namespace-version-for-control-id) ((integer integer) 
                                                         (object uuid-namespace-control-id))
  (declare ((mod 6) integer))
  (when (zerop integer)
    (error "Declining to set value for slot UUID-NAMESPACE-VERSION-FOR-CONTROL-ID ~
            to non-valid uuid version. Likely the source UUID is corrupted!"))
  (setf (slot-value object 'uuid-namespace-version-for-control-id)
        integer))

;; uuid-namespace-integer-for-control-id
;; (typep (unicly::uuid-bit-vector-to-integer (unicly::uuid-to-bit-vector (make-v5-uuid unicly:*uuid-namespace-dns* "bubba"))) 'integer)

(defmethod (setf uuid-namespace-version-for-control-id) ((uuid-bit-vector bit-vector) 
                                                         (object uuid-namespace-control-id))
  (declare (unicly::uuid-bit-vector-128 uuid-bit-vector))
  (let ((bv-version (unicly::uuid-version-bit-vector  uuid-bit-vector)))
    (declare ((mod 6) bv-version))
    (when (zerop bv-version)
      (error "Declining to set value for slot UUID-NAMESPACE-VERSION-FOR-CONTROL-ID~
            to non-valid uuid version. Likely the source UUID is corrupted!"))
    (setf (slot-value object 'uuid-namespace-version-for-control-id)
          (unicly::uuid-version-bit-vector  uuid-bit-vector))))

(defmethod uuid-namespace-for-control-id-class-description ((object uuid-namespace-control-id)
                                                            stream)
  (let* ((unbound "#<UNBOUND>")
         (control-id-if  (uuid-namespace-for-control-id-identity object))
         (control-id  (or (and control-id-if
                               ;;(format nil "~S" control-id-if))
                               (prin1-to-string control-id-if))
                          unbound))
         (base-namespace  (or (uuid-namespace-for-control-id-base-namespace object)
                              unbound))
         (namespace  (or (uuid-namespace-for-control-id-class object)
                         unbound))
         (byte-array  (or (uuid-namespace-byte-array-for-control-id object)
                          unbound))
         (bit-vector (or (uuid-namespace-bit-vector-for-control-id object)
                         unbound))
         (hex-string-if (uuid-namespace-hex-string-36-for-control-id object))
         (hex-string    (prin1-to-string hex-string-if))

         (integer-128-if (uuid-namespace-integer-for-control-id object))
         (integer-128    (or (and integer-128-if
                                  (format nil "~D" integer-128-if))
                             unbound))
         (version-if (uuid-namespace-version-for-control-id object) )
         (version    (or (and version-if (format nil "~D" version-if))
                         unbound)))
    (with-standard-io-syntax 
      (format stream "~%~{~4T~16A~A~%~}"
              (list ;; "TYPE-OF:"    (type-of object)
               "CONTROL-UUID:"          namespace
               "CONTROL-ID:"     control-id
               "BASE-NAMESPACE:" base-namespace
               "HEX-STRING:" hex-string
               "BYTE-ARRAY:" byte-array
               "INTEGER-128:" integer-128
               "BIT-VECTOR:" bit-vector
               "VERSION:"    version )))))

(defmethod print-object ((object uuid-namespace-control-id) stream)
  ;; (print-unreadable-object (object stream :type t) ;; :identity t)
  (print-unreadable-object (object stream :type t)
    (uuid-namespace-for-control-id-class-description object stream)))


;;; ==============================
;;; EOF
