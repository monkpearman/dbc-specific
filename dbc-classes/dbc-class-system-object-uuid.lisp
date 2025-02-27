;;; :FILE-CREATED <Timestamp: #{2011-05-23T20:18:33-04:00Z}#{11211} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-system-object-uuid.lisp
;;; ==============================

;;; ==============================
;;; :NOTE This file was renamed :FROM  dbc-class-uuid-namespace-for-control-id.lisp :TO dbc-class-system-object-uuid.lisp
;;; @ git commit 0d7a67ea3dbf8a9a433cfb3656dfb09bc351a2e2
;;; ==============================

;;; ==============================
;;; :NOTE Dan Lentz's Templeton provides an example of using the class
;;; SYSTEM-OBJECT-UUID but with the old name CONTEXTUAL-OBJECT-UUID
;;; :SEE :FILE templeton/contrib/index/namespace.lisp
;;; :SEE (URL `http://github.com/danlentz/templeton/blob/master/contribindex/namespace.lisp')
;;; ==============================

;;; ==============================
;;
;; (defparameter *tt--system-obj-uuid* 
;;   (make-system-object-uuid :base-namespace unicly:*uuid-namespace-dns*
;;                            :control-id "bubba"))
;; => *TT--SYSTEM-OBJ-UUID*
;;
;; *TT--SYSTEM-OBJ-UUID*
;; |=> #<SYSTEM-OBJECT-UUID 
;; |     SYSTEM-ID:      "bubba"
;; |     SYSTEM-UUID:    eea1105e-3681-5117-99b6-7b2b5fe1f3c7>
;;
;; (unicly:uuid-eql (make-v5-uuid (system-identity-parent-uuid  *tt--system-obj-uuid*)
;;                                (system-identity  *tt--system-obj-uuid*))
;;                  (system-identity-uuid *tt--system-obj-uuid*))
;; => T
;;
;; (setf *tt--system-obj-uuid*
;;       (make-system-object-uuid :base-namespace unicly:*uuid-namespace-dns* 
;;                                :control-id 'bubba))
;; |=> #<SYSTEM-OBJECT-UUID 
;; |     SYSTEM-ID:      BUBBA
;; |     SYSTEM-UUID:    60ada823-d6de-5729-9e7e-8e44a57e400d >
;;
;; (unicly:uuid-eql (make-v5-uuid (system-identity-parent-uuid  *tt--system-obj-uuid*)
;;                                 (string (system-identity  *tt--system-obj-uuid*)))
;;                   (system-identity-uuid *tt--system-obj-uuid*))
;; => T
;;
;; (setf (system-identity *tt--system-obj-uuid*)
;;       (list (make-v4-uuid) "new-bubba"))
;; => "new-bubba"
;;
;; *tt--system-obj-uuid*
;;  |=> #<SYSTEM-OBJECT-UUID 
;;  |    :SYSTEM-IDENTITY             "new-bubba"
;;  |    :SYSTEM-IDENTITY-UUID        0ef86c6f-b263-5987-a90c-3fcca581bc38 >
;;
;; (system-identity-uuid  *tt--system-obj-uuid*)
;; ; => 0ef86c6f-b263-5987-a90c-3fcca581bc38
;;
;; (system-identity  *tt--system-obj-uuid*)
;;  ;=> "new-bubba"
;;
;; (system-identity-parent-uuid  *tt--system-obj-uuid*)
;;  ;=> addedf68-81a4-47cd-a7b1-b96779f8b676
;; 
;; (type-of (system-identity-parent-uuid  *tt--system-obj-uuid*))
;; => UNIQUE-UNIVERSAL-IDENTIFIER
;;
;; (unicly:uuid-version-uuid (system-identity-parent-uuid  *tt--system-obj-uuid*))
;; ;=> 4
;;
;; (system-identity-uuid-version *tt--system-obj-uuid*)
;; ;=> 5
;;
;; (system-identity-uuid-byte-array  *tt--system-obj-uuid*)
;; ;=> #(14 248 108 111 178 99 89 135 169 12 63 204 165 129 188 56)
;;
;; (system-identity-uuid-bit-vector  *tt--system-obj-uuid*)
;; ;=> #*000011101111100001101100011011111011001001100011010 ...
;;
;; (system-identity-uuid-integer     *tt--system-obj-uuid*)
;; ;=> 19899080911677131133725998230922181688
;;
;; (system-identity-uuid-string-36   *tt--system-obj-uuid*)
;; ;=> "0ef86c6f-b263-5987-a90c-3fcca581bc38"
;;
;; (update-system-object-uuid *tt--system-obj-uuid*
;;                            :base-namespace (make-v5-uuid *uuid-namespace-dns* (string '*tt--system-obj-uuid*))
;;                            :control-id '*tt--system-obj-uuid*)
;; |=> #<SYSTEM-OBJECT-UUID 
;; |    :SYSTEM-IDENTITY             *TT--SYSTEM-OBJ-UUID*
;; |    :SYSTEM-IDENTITY-UUID        db197774-6955-55b1-ac30-143864977f41 >
;;
;;
;; (system-identity *TT--SYSTEM-OBJ-UUID*)
;; ;=> *TT--SYSTEM-OBJ-UUID*
;;
;; (eq (system-identity *TT--SYSTEM-OBJ-UUID*) '*TT--SYSTEM-OBJ-UUID*)
;; ;=> T
;;
;;; ==============================

;; (base-dbc)
;; - base-uuid (base-dbc)
;; -- system-object-uuid (base-uuid)
;;
;;    system-objects identified by UUID:
;;     base-dbc
;;     base-regexp
;;     base-entity
;;     base-control-id
;;     system-object-uuid
;;; ==============================



(in-package #:dbc)


;;; ==============================
;;; The class SYSTEM-OBJECT-UUID
;;
;; system-object-uuid               <CLASS>
;; system-identity                  <SLOT>,<GENERIC>
;; system-identity-parent-uuid      <SLOT>,<GENERIC>
;; system-identity-uuid             <SLOT>,<GENERIC>
;; system-identity-uuid-byte-array  <SLOT>,<GENERIC>
;; system-identity-uuid-bit-vector  <SLOT>,<GENERIC>
;; system-identity-uuid-integer     <SLOT>,<GENERIC>
;; system-identity-uuid-string-36   <SLOT>,<GENERIC>
;; system-identity-uuid-version     <SLOT>,<GENERIC>
;;
;;
;; :NOTE This class was originally named `uuid-namespace-control-id' which
;; coupled nicely with `base-control-id' and it's slots
;; `control-id-namespace-required' and `control-id-namespace', but we found the
;; original to be unwieldly once we started defining methods which specialized
;; `uuid-namespace-control-id'.
;; So, despite the use of "system-" as a prefix for this class and it's
;; associated methods, instances of this class are used as the base namespaces
;; for the sub-classes in the dbc-system (e.g. those inheritng from `base-dbc')
;; For example the class and sub-classes of `control-id-display-name' need a
;; control-id namespaces from which their instances will derive UUIDs.
;;
;;
;; CPL base-dbc -> base-uuid -> system-object-uuid
(defclass system-object-uuid (base-uuid) 
  ((system-identity
    :documentation
    #.(format nil
              "An object identified by the `unicly:unique-universal-identifier'~%~
               per slot-value of system-identity-uuid.~%"))
   (system-identity-parent-uuid
    :documentation
    #.(format nil
              "An object of type `unicly:unique-universal-identifier' which acts~%~
              as the NAMESPACE arg to `unicly:make-v5-uuid' in conjunction with~%~
              `slot-value' of `system-identity' as the NAME arg.~%"))
   (system-identity-uuid
    :documentation
    #.(format nil
              "An object of type `unicly:unique-universal-identifier'.~%~@
               It dereferences the symbol stored in the system-identity slot designating a UUID namespace.~%~@
               Value of this slot is suitable for use as a namespace argument to~@
               `unicly:make-v*-uuid'.~%"))   
   (system-identity-uuid-byte-array
    :documentation
    #.(format nil
              "An object of type `unicly:uuid-byte-array-16'.~%~@
               Value of this slot is the byte-array representation of the object in slot~@
               `system-identity-uuid'.~%"))
   (system-identity-uuid-bit-vector
    :documentation
    #.(format nil
              "An object of type `unicly::bit-vector-128'.~%~@
               Value of this slot is the bit-vector representation of the object in slot~@
               `system-identity-uuid'.~%"))
   (system-identity-uuid-integer
    :documentation
    #.(format nil
              "An object of type `unicly::uuid-integer-128'.~%~@
               Value of this slot is the 128bit integer representation of the object in slot~@
               `system-identity-uuid'.~%"))
   (system-identity-uuid-string-36
    :documentation
    #.(format nil
              "An object of type `unicly::uuid-hex-string-36'.~%~@
               Value of this slot is the hecadecimal integer representation of~@
               the object in slot `system-identity-uuid'.~%"))
   (system-identity-uuid-version
    :documentation
    #.(format nil
              "The UUID version of the uuid namespace object in slot system-identity-uuid.~%")))
  (:documentation
   #.(format
      nil
      "Instances of this class hold namespace metadata for classes whose instances~%~@
       share a common UUID namespace.~%
Instances of this class are used as the base namespaces
for the sub-classes in the dbc-system (e.g. those inheritng from `base-dbc')
For example the class and sub-classes of `control-id-display-name' need a
control-id namespaces from which their instances will derive UUIDs.
:EXAMPLE~%
 \(type-of *control-id-inventory-namespace*\)
 \(type-of *system-object-uuid-base-namespace*\)
 \(system-identity *control-id-inventory-namespace*\)
 \(system-identity-uuid *control-id-inventory-namespace*\)
 \(gethash \(system-identity-uuid *control-id-inventory-namespace*\)
          *control-id-namespace-table*\)
:SEE-ALSO `make-system-object-uuid', `update-system-object-uuid',
`*control-id-namespace-table*' `base-uuid', `base-control-id',
`system-object-uuid', `control-id-type', `base-control-id', `base-record',
`base-entity', `base-regexp', `base-image', `base-description', `base-edit'.~%▶▶▶~%")))


;; mon:symbol-not-null-or-string-not-empty
;; mon::%fast-string-all-whitespace-p
(defun %verify-valid-string-or-symbol-for-identity (verify-identity)
  (declare #+:IS-MON(type MON:SYMBOL-NOT-NULL-OR-STRING-NOT-EMPTY verify-identity)
           #-:IS-MON(type (or string (and symbol (not null))) verify-identity))
  #+:IS-MON (unless (MON:SYMBOL-NOT-NULL-OR-STRING-NOT-EMPTY-P verify-identity)
              (error "arg IDENTITY did not satisfy `mon:symbol-not-null-or-string-not-empty-p'"))
  #-:IS-MON (when (and (stringp verify-identity)
                       (string= (make-string 0) verify-identity))
              (error "arg IDENTITY did not satisfy `mon:symbol-not-null-or-string-not-empty-p'"))
  (if (stringp verify-identity)
      (if #+:IS-MON (MON::%FAST-STRING-ALL-WHITESPACE-P verify-identity)
          #-:IS-MON (loop for char across verify-identity
                          always (member char
                                         (list #\SPACE #\NEWLINE #\TAB #\RETURN
                                               #\NO-BREAK_SPACE #\PAGE #\VT)
                                         :test 'char=))
          (error "arg IDENTITY must not be contained of all whitespace characters")
          verify-identity)
      verify-identity))

(defgeneric system-identity-parent-uuid (sys-object)
  (:method  ((sys-object system-object-uuid))
    (when (and (slot-exists-p sys-object 'system-identity-parent-uuid)
               (slot-boundp sys-object 'system-identity-parent-uuid))
      (slot-value sys-object 'system-identity-parent-uuid))))

(defgeneric (setf system-identity-parent-uuid) (uuid sys-object)
  (:method  ((uuid UNICLY:UNIQUE-UNIVERSAL-IDENTIFIER) (sys-object system-object-uuid))
    (if (slot-exists-p sys-object 'system-identity-parent-uuid)
        (setf (slot-value sys-object 'system-identity-parent-uuid)
              uuid)
        uuid)))

(defgeneric system-identity-uuid-byte-array (sys-object)
  (:method ((sys-object system-object-uuid))
    (when (and (slot-exists-p sys-object 'system-identity-uuid-byte-array)
               (slot-boundp sys-object 'system-identity-uuid-byte-array))
      (slot-value  sys-object 'system-identity-uuid-byte-array))))

(defgeneric (setf system-identity-uuid-byte-array) (byte-array sys-object)
  (:method ((byte-array array) (sys-object system-object-uuid))
    (declare (UNICLY::UUID-BYTE-ARRAY-16 byte-array))
    (if (slot-exists-p sys-object 'system-identity-uuid-byte-array)
        (setf (slot-value  sys-object 'system-identity-uuid-byte-array)
              byte-array)
        byte-array)))


(defgeneric system-identity-uuid-bit-vector (sys-object)
  (:method ((sys-object system-object-uuid))
    (when (and (slot-exists-p sys-object 'system-identity-uuid-bit-vector)
               (slot-boundp sys-object 'system-identity-uuid-bit-vector))
      (slot-value sys-object 'system-identity-uuid-bit-vector))))

(defgeneric (setf system-identity-uuid-bit-vector) (uuid-bit-vector sys-object)
  
  (:method  ((uuid-bit-vector bit-vector) (sys-object system-object-uuid)) ; simple-bit-vector
    (declare (UNICLY::UUID-BIT-VECTOR-128 uuid-bit-vector))
    (if (slot-exists-p sys-object 'system-identity-uuid-bit-vector)
        (setf (slot-value sys-object 'system-identity-uuid-bit-vector)
              uuid-bit-vector)
        uuid-bit-vector))

  (:method :after
           ((uuid-bit-vector bit-vector) (sys-object system-object-uuid)) ; simple-bit-vector
    (declare (UNICLY::UUID-BIT-VECTOR-128 uuid-bit-vector))
    (let ((slot-value-if (system-identity-uuid-version sys-object))
          (version-if    (UNICLY::UUID-VERSION-BIT-VECTOR uuid-bit-vector)))
      (declare ((mod 6) version-if))
      (when (zerop version-if)
        (error "Declining to set value for slot SYSTEM-IDENTITY-UUID-VERSION ~
              to non-valid uuid version.~%~
              Likely the source UUID is corrupted or a null-uuid!~%~
              got bit-vector: ~S"
               uuid-bit-vector))
      (if (and slot-value-if (eql slot-value-if version-if))
          version-if
          (setf (system-identity-uuid-version sys-object) version-if)))))

(defmethod (setf system-identity-uuid-bit-vector) :after ((uuid-bit-vector bit-vector) (sys-object system-object-uuid)) ; simple-bit-vector
  (declare (UNICLY::UUID-BIT-VECTOR-128 uuid-bit-vector))
  (let ((slot-value-if (system-identity-uuid-version sys-object))
        (version-if    (UNICLY::UUID-VERSION-BIT-VECTOR uuid-bit-vector)))
    (declare ((mod 6) version-if))
    (when (zerop version-if)
      (error "Declining to set value for slot SYSTEM-IDENTITY-UUID-VERSION ~
             to non-valid uuid version.~%~
             Likely the source UUID is corrupted or a null-uuid!~%~
             got bit-vector: ~S"
             uuid-bit-vector))
    (if (and slot-value-if (eql slot-value-if version-if))
        version-if
        (setf (system-identity-uuid-version sys-object) version-if))))

(defgeneric system-identity-uuid-integer (sys-object)
  (:method  ((sys-object system-object-uuid))
    (when (and (slot-exists-p sys-object 'system-identity-uuid-integer)
               (slot-boundp sys-object 'system-identity-uuid-integer))
      (slot-value sys-object 'system-identity-uuid-integer))))


(defgeneric (setf system-identity-uuid-integer) (uuid-integer-128 sys-object)
  (:method  ((uuid-integer-128 bignum) (sys-object system-object-uuid))
    (declare (UNICLY::UUID-UB128 uuid-integer-128))
    (if (slot-exists-p sys-object 'system-identity-uuid-integer)
        (setf (slot-value sys-object 'system-identity-uuid-integer)
              uuid-integer-128)
        uuid-integer-128)))

(defgeneric system-identity-uuid-string-36 (sys-object)
  (:method  ((sys-object system-object-uuid))
    (when (and (slot-exists-p sys-object 'system-identity-uuid-string-36)
               (slot-boundp sys-object 'system-identity-uuid-string-36))
      (slot-value sys-object 'system-identity-uuid-string-36))))

(defgeneric (setf system-identity-uuid-string-36) (uuid-hex-string-36 sys-object)
  (:method ((uuid-hex-string-36 string) (sys-object system-object-uuid))
           ;; DARWIN UNCOMMENT ONCE FIXED
           ;; (declare (unicly::uuid-hex-string-36 uuid-hex-string-36))
    (if (slot-exists-p sys-object 'system-identity-uuid-string-36)
        (setf (slot-value sys-object 'system-identity-uuid-string-36)
              uuid-hex-string-36)
        uuid-hex-string-36)))

(defgeneric system-identity-uuid-version (sys-object)
  (:method  ((sys-object system-object-uuid))
    (when (and (slot-exists-p sys-object 'system-identity-uuid-version)
               (slot-boundp sys-object 'system-identity-uuid-version))
      (slot-value sys-object 'system-identity-uuid-version))))

(defgeneric system-object-uuid-description (sys-object &key stream verbose)
  )

(defgeneric (setf system-identity-uuid-version) (bit-vector-or-version-integer sys-object)

  ;; (:method  ((integer integer) (sys-object system-object-uuid))
  (:method  ((version-integer fixnum) (sys-object system-object-uuid))
    (declare (type UNICLY::UUID-VERSION-INT version-integer))
    ;; :NOTE Specializing on fixnum should prevent us from ever seeing the null-uuid here.
    ;; Also, we don't allow v1 or v2 UUID's here either.
    (unless (typep version-integer 'UNICLY::UUID-V3-4-OR-5-INT)
      (error "Declining to set value for slot SYSTEM-IDENTITY-UUID-VERSION.~%~
                Version is non-valid for class `system-object-uuid'~% got: ~A~%"
             version-integer))
    (if (slot-exists-p sys-object 'system-identity-uuid-version)
        (setf (slot-value sys-object 'system-identity-uuid-version)
              version-integer)
        version-integer))
  
  (:method  ((uuid-bit-vector bit-vector) (sys-object system-object-uuid))
    (declare (UNICLY::UUID-BIT-VECTOR-128 uuid-bit-vector))
    (let ((bv-version (UNICLY::UUID-VERSION-BIT-VECTOR  uuid-bit-vector)))
      (declare (type (or UNICLY::UUID-VERSION-INT null) bv-version))
      ;; :NOTE  We don't allow null-uuid, v1, or v2 UUID's.
      (unless (typep bv-version 'UNICLY::UUID-V3-4-OR-5-INT)
        (error "Declining to set value for slot SYSTEM-IDENTITY-UUID-VERSION.~%~
                Version is non-valid for class `system-object-uuid'~% got: ~A~%"
               bv-version))
      (if (slot-exists-p sys-object 'system-identity-uuid-version)
          (setf (slot-value sys-object 'system-identity-uuid-version)
                uuid-bit-vector)
          uuid-bit-vector))))


(defgeneric system-identity (sys-object)
 ;;
  (:method ((sys-object system-object-uuid))
             (when (and (slot-exists-p sys-object 'system-identity)
                        (slot-boundp   sys-object 'system-identity))
               (slot-value sys-object 'system-identity))))

;; (find-method #'(setf system-identity) '(:around) '(t system-object-uuid))
;; (remove-method #'(setf system-identity) (find-method #'(setf system-identity) '(:around) '(t system-object-uuid)))
(defgeneric (setf system-identity) (namespace-and-identity sys-object)

  (:method  ((namespace-and-identity t) (sys-object system-object-uuid))
    (if (slot-exists-p sys-object 'system-identity)
        (setf (slot-value sys-object 'system-identity)
              (cadr namespace-and-identity))
        (cadr namespace-and-identity)))
  
  ;; :NOTE The NAMESPACE-AND-IDENTITY arg to the interface function
  ;; `make-system-object-uuid's contains the NAME arg for `unicly:make-v5-uuid' and
  ;; we want to store this as the slot-value of system-identity in order that we
  ;; may chase upwardly the class uuid's to their namespaces and the parent
  ;; namespaces they descend from. To get the NAME into the slot-value of
  ;; system-identity we run an :around method which attempts to rollback in the
  ;; event of a failure (e.g. when the UUID representation for an arg is poorly
  ;; configurued or otherwise illegitimate.
  (:method :around
    ((namespace-and-identity t) (sys-object system-object-uuid))
    (declare (type list namespace-and-identity))
    (destructuring-bind (sys-id-uuid sys-identity) namespace-and-identity ;; (list (make-v4-uuid)  "<IDENTITY>")
      (declare ((and (or string symbol) (not null)) sys-identity)
               (UNICLY:UNIQUE-UNIVERSAL-IDENTIFIER sys-id-uuid))
      (%verify-valid-string-or-symbol-for-identity sys-identity)
      (let ((new-sys-identity-uuid    (UNICLY:MAKE-V5-UUID sys-id-uuid (if (symbolp sys-identity) 
                                                                           (string sys-identity)
                                                                         sys-identity)))
            (old-system-identity      (and (slot-exists-p sys-object 'system-identity)
                                           (slot-boundp  sys-object  'system-identity)
                                           (system-identity sys-object)))
            (old-system-parent-uuid   (and (slot-exists-p sys-object 'system-identity-parent-uuid)
                                           (slot-boundp  sys-object  'system-identity-parent-uuid)
                                           (system-identity-parent-uuid sys-object)))
            ;; We might not have any slots set or only some, so get all of them.
            (old-system-identity-uuid (and (slot-exists-p sys-object 'system-identity-uuid)
                                           (slot-boundp  sys-object  'system-identity-uuid)
                                           (system-identity-uuid sys-object)))
            (old-byte-array-slot      (and (slot-exists-p sys-object 'system-identity-uuid-byte-array)
                                           (slot-boundp  sys-object  'system-identity-uuid-byte-array)
                                           (system-identity-uuid-byte-array sys-object)))
            (old-bit-vector-slot      (and (slot-exists-p sys-object 'system-identity-uuid-bit-vector)
                                           (slot-boundp  sys-object  'system-identity-uuid-bit-vector)
                                           (system-identity-uuid-bit-vector sys-object)))
            (old-integer-slot         (and (slot-exists-p sys-object  'system-identity-uuid-integer)
                                           (slot-boundp  sys-object   'system-identity-uuid-integer)
                                           (system-identity-uuid-integer sys-object)))
            (old-hex-string-slot      (and (slot-exists-p sys-object 'system-identity-uuid-string-36)
                                           (slot-boundp  sys-object  'system-identity-uuid-string-36)
                                           (system-identity-uuid-string-36 sys-object)))
            ;; (old-version-slot    (system-identity-uuid-version     sys-object))
            (new-system-identity-uuid  '())) ; new-namespace-slot
        (unwind-protect 
             (progn 
               (setf new-system-identity-uuid 
                     (ignore-errors 
                       (setf (system-identity-uuid sys-object)
                             new-sys-identity-uuid)))
               ;; If we didn't error, we can safeley set the
               ;; system-identity-parent-uuid slot to value of sys-id-uuid
               ;; else unset what we just set...
               (when new-system-identity-uuid 
                 (setf (system-identity-parent-uuid sys-object)
                       sys-id-uuid)
                 (call-next-method)))
          (unless new-system-identity-uuid
            (let ((slot-val-for-rollback (or old-bit-vector-slot
                                             old-system-identity-uuid
                                             old-byte-array-slot
                                             old-integer-slot
                                             old-hex-string-slot)))
              ;; Following form will clear the existing system-identity and
              ;; system-identity-parent-uuid slots with slot-makunbound. 
              ;; We set them back to their previous state afterwards.
              (when (and slot-val-for-rollback 
                         (slot-exists-p sys-object 'system-identity-parent-uuid))
                (setf (system-identity-parent-uuid sys-object)
                      slot-val-for-rollback))
              (if (and old-system-parent-uuid
                       old-system-identity)
                  (progn
                    (setf (system-identity-parent-uuid sys-object) old-system-parent-uuid)
                    ;; We set the slot-value explicitly instead of using the
                    ;; method specialized because it would land us right back here!
                    ;; The slot system-object-uuid-identity no longer exists or
                    ;; its name has changed.

                    ;; It became either system-identity or system-identity-uuid.
                    ;; I'm pretty sure it is `system-identity', and the
                    ;; following change reflects that assumption:
                    
                    ;; :WAS (setf (slot-value sys-object 'system-object-uuid-identity) old-system-identity))
                    (setf (slot-value sys-object 'system-identity) old-system-identity))
                
                  ;; If either the control-identity or sys-id-uuid slots is
                  ;; null or unbound, then the other should be as well.
                  (progn 
                    (when (and (slot-exists-p sys-object 'system-identity-parent-uuid) 
                               (slot-boundp sys-object   'system-identity-parent-uuid))
                      (slot-makunbound sys-object 'system-identity-parent-uuid))
                    (when (and (slot-exists-p sys-object 'system-identity) 
                               (slot-boundp sys-object   'system-identity))
                      (slot-makunbound sys-object 'system-identity)))))))))))


(defgeneric system-identity-uuid (sys-object)
  (:method  ((sys-object system-object-uuid))
    (when (slot-boundp sys-object 'system-identity-uuid)
      (slot-value sys-object 'system-identity-uuid))))

(defgeneric (setf system-identity-uuid) (coercable-uuid sys-object)
  ;; :NOTE `unicly:make-uuid-from-string' already coerces a uuid sys-object with
  ;; `unicly:uuid-copy-uuid' we keep the method dispatch b/c we can check string
  ;; validity earlier.
  (:method  ((uuid-string string) (sys-object system-object-uuid))
            ;; :DARWWIN RE-ENABLE following if we can get it to compile:
            ;; (declare (unicly::uuid-hex-string-36 uuid-string))
    (let ((uuid-from-string (UNICLY:MAKE-UUID-FROM-STRING uuid-string)))
      (declare (UNICLY:UNIQUE-UNIVERSAL-IDENTIFIER uuid-from-string))
      (if (slot-exists-p sys-object 'system-identity-uuid)
          (setf (slot-value sys-object 'system-identity-uuid)
                uuid-from-string)
          uuid-from-string)))

  (:method  ((uuid UNICLY:UNIQUE-UNIVERSAL-IDENTIFIER) (sys-object system-object-uuid))
    (if (slot-exists-p sys-object 'system-identity-uuid)
        (setf (slot-value sys-object 'system-identity-uuid)
              ;; make-sure we don't create eq UUID's
              (uuid-copy-uuid uuid))
        uuid))

  (:method  ((uuid-byte-array array) (sys-object system-object-uuid))
    (declare (UNICLY::UUID-BYTE-ARRAY-16 uuid-byte-array))
    (let ((uuid-from-byte-array (uuid-from-byte-array uuid-byte-array)))
      (declare (UNICLY:UNIQUE-UNIVERSAL-IDENTIFIER uuid-from-byte-array))
      (if (slot-exists-p sys-object 'system-identity-uuid)
          (setf (slot-value sys-object 'system-identity-uuid)
                uuid-from-byte-array)
          uuid-from-byte-array)))

  (:method  ((uuid-bit-vector bit-vector) (sys-object system-object-uuid))
    (declare (UNICLY::UUID-BIT-VECTOR-128 uuid-bit-vector))
    (let ((uuid-from-bv (UNICLY::UUID-FROM-BIT-VECTOR uuid-bit-vector)))
      (declare (UNICLY:UNIQUE-UNIVERSAL-IDENTIFIER uuid-from-bv))
      (if (slot-exists-p sys-object 'system-identity-uuid)
          (setf (slot-value sys-object 'system-identity-uuid)
                uuid-from-bv)
          uuid-from-bv)))

  (:method  ((integer-128 bignum) (sys-object system-object-uuid))
    (declare (UNICLY::UUID-UB128 integer-128))
    (let ((uuid-from-int (UNICLY::UUID-FROM-BIT-VECTOR 
                          (UNICLY::UUID-INTEGER-128-TO-BIT-VECTOR integer-128))))
      (declare (UNICLY:UNIQUE-UNIVERSAL-IDENTIFIER uuid-from-int))
      (if (slot-exists-p sys-object 'system-identity-uuid)
          (setf (slot-value sys-object 'system-identity-uuid)
                uuid-from-int)
          uuid-from-int)))

  ;; The :after method helps us make sure all other slots get propagated whenever
  ;; a slot containing a uuid representation gets touched. 
  ;; This was an early 
  ;; (find-method #'(setf system-identity-uuid) '(:after) '(t system-object-uuid))
  (:method  :after  ((uuid-arg t) (sys-object system-object-uuid))
    (let* ((uuid-bv-prevent (UNICLY:UUID-TO-BIT-VECTOR (system-identity-uuid sys-object)))
           (uuid-bv    (if (UNICLY:UUID-BIT-VECTOR-128-P uuid-arg)
                           ;; if the uuid-arg is the same bv128 as the conversion don't re-trigger
                           (if (UNICLY:UUID-BIT-VECTOR-EQL uuid-arg uuid-bv-prevent)
                               nil
                               uuid-arg)
                           uuid-bv-prevent))
           (uuid-bytes (if (UNICLY:UUID-BYTE-ARRAY-16-P uuid-arg)
                           (let* ((existing-slot    (system-identity-uuid-byte-array sys-object))
                                  (existing-slot-bv (when existing-slot (UNICLY:UUID-BYTE-ARRAY-TO-BIT-VECTOR existing-slot)))
                                  (ba-to-bv 
                                   (if existing-slot-bv
                                       nil
                                       (UNICLY:UUID-BYTE-ARRAY-TO-BIT-VECTOR uuid-arg))))
                             (if existing-slot-bv
                                 (if (UNICLY:UUID-BIT-VECTOR-EQL existing-slot-bv uuid-bv-prevent)
                                     nil
                                     uuid-arg)
                                 (if (UNICLY:UUID-BIT-VECTOR-EQL ba-to-bv uuid-bv-prevent)
                                     nil
                                     uuid-arg)))
                           (UNICLY:UUID-BIT-VECTOR-TO-BYTE-ARRAY uuid-bv-prevent)))
           (uuid-int   (if (typep uuid-arg 'bignum)
                           (let* ((existing-slot    (system-identity-uuid-integer sys-object))
                                  (existing-slot-bv
                                   (when existing-slot 
                                     (UNICLY::UUID-INTEGER-128-TO-BIT-VECTOR existing-slot)))
                                  (int-to-bv      
                                   (if existing-slot-bv
                                       nil
                                       (UNICLY::UUID-INTEGER-128-TO-BIT-VECTOR uuid-arg))))
                             (if existing-slot-bv
                                 (if (UNICLY:UUID-BIT-VECTOR-EQL existing-slot-bv uuid-bv-prevent)
                                     nil
                                     uuid-arg)
                                 (if (UNICLY:UUID-BIT-VECTOR-EQL int-to-bv uuid-bv-prevent)
                                     nil
                                     uuid-arg)))
                           (UNICLY::UUID-BIT-VECTOR-TO-INTEGER uuid-bv-prevent)))
           ;;; DARWIN when binding DBC::UUID-HEX-36 [Condition of type TYPE-ERROR]
           (uuid-hex-36   (if (and (stringp uuid-arg)
                                   (UNICLY::UUID-STRING-36-P (the string uuid-arg)))
                              (let* ((existing-slot
                                      (system-identity-uuid-string-36 sys-object))
                                     (existing-slot-bv 
                                      (when existing-slot 
                                        (UNICLY::UUID-TO-BIT-VECTOR (UNICLY:MAKE-UUID-FROM-STRING existing-slot))))
                                     (hex-to-bv         
                                      (if existing-slot-bv
                                          nil
                                          (UNICLY::UUID-TO-BIT-VECTOR (UNICLY:MAKE-UUID-FROM-STRING uuid-arg)))))
                                (if existing-slot-bv
                                    (if (UNICLY:UUID-BIT-VECTOR-EQL existing-slot-bv uuid-bv-prevent)
                                        nil
                                        uuid-arg)
                                    (if (UNICLY:UUID-BIT-VECTOR-EQL hex-to-bv uuid-bv-prevent)
                                        nil
                                        uuid-arg)))
                            (UNICLY:UUID-PRINC-TO-STRING (system-identity-uuid sys-object)))))
      (declare (type (or UNICLY::UUID-BYTE-ARRAY-16 null)  uuid-bytes)
               (type (or UNICLY::UUID-BIT-VECTOR-128 null) uuid-bv)
               (type (or UNICLY::UUID-UB128 null)          uuid-int)
               ;; DARWIN -- UNCOMMENT AFTER IT WORKS:
               ;; (type (or UNICLY::UUID-HEX-STRING-36 null)  uuid-hex-36)
               )
      (when (and uuid-bv (slot-exists-p sys-object 'system-identity-uuid-bit-vector)
                 (setf (system-identity-uuid-bit-vector sys-object) uuid-bv)))
      (when (and uuid-bytes (slot-exists-p sys-object 'system-identity-uuid-byte-array))
        (setf (system-identity-uuid-byte-array sys-object) uuid-bytes))
      (when (and uuid-hex-36 (slot-exists-p sys-object 'system-identity-uuid-string-36))
        (setf (system-identity-uuid-string-36  sys-object) uuid-hex-36))
      (when (and uuid-int (slot-exists-p sys-object 'system-identity-uuid-integer))
        (setf (system-identity-uuid-integer sys-object) uuid-int))
      ;; Continue checking to make sure are critical slots (system-identity &
      ;; system-identity-parent-uuid) have a value and are correct, if not fix that
      (if (and ; make sure system-identity exists and is bound
           (slot-exists-p sys-object 'system-identity)
           (system-identity sys-object))
          (if (and ; make sure system-identity-parent-uuid exists and is bound.
               (slot-exists-p sys-object 'system-identity-parent-uuid)
               (system-identity-parent-uuid sys-object))
              ;; If so, make sure that the namespace (system-identity-parent-uuid) and identity (system-identity)
              ;; evaluate to the namespace we just set, and if not remove them.
              (unless (and (slot-exists-p sys-object 'system-identity-uuid-bit-vector)
                           (slot-boundp sys-object   'system-identity-uuid-bit-vector)
                           (slot-exists-p sys-object 'system-identity-parent-uuid)
                           (slot-boundp sys-object   'system-identity-parent-uuid)
                           (slot-exists-p sys-object 'system-identity)
                           (slot-boundp sys-object   'system-identity)
                           (UNICLY::UUID-BIT-VECTOR-EQL
                            (system-identity-uuid-bit-vector sys-object)
                            (UNICLY:UUID-TO-BIT-VECTOR (UNICLY:MAKE-V5-UUID (system-identity-parent-uuid sys-object)
                                                              (string (system-identity sys-object))))))
                (when (slot-exists-p sys-object 'system-identity)
                  (slot-makunbound sys-object   'system-identity))
                (when (slot-exists-p sys-object 'system-identity-parent-uuid)
                  (slot-makunbound sys-object   'system-identity-parent-uuid)))
            ;;  The slot system-identity exists, but system-identity-parent-uuid is corrupt, so we unbind system-identity
            (when (slot-exists-p sys-object 'system-identity)
              (slot-makunbound sys-object   'system-identity)))

        ;; The control-identity (system-identity) isn't present.
        ;; So, if the base-namespace (system-identity-parent-uuid) is as well, it shouldn't be, so unset it now.
          (when (system-identity-parent-uuid sys-object)
            (slot-makunbound sys-object 'system-identity-parent-uuid)))
      uuid-arg)))

;; namespace-and-identity
(defun update-system-object-uuid (sys-object &key base-namespace control-id)
  (declare (type system-object-uuid sys-object)
           (type UNICLY:UNIQUE-UNIVERSAL-IDENTIFIER base-namespace)
           #+:IS-MON((or MON:STRING-NOT-NULL-EMPTY-OR-ALL-WHITESPACE MON:SYMBOL-NOT-NULL) control-id)
           #-:IS-MON(type (or string (and symbol (not null))) control-id))
  ;; #-:mon (%verify-valid-string-or-symbol-for-identity identity)
  (let ((new-nmspc (UNICLY:MAKE-V5-UUID base-namespace 
                                        (if (symbolp control-id) 
                                            (string control-id)
                                          control-id))))
    (setf (system-identity sys-object) (list base-namespace control-id))
    (setf (system-identity-uuid sys-object) new-nmspc))
  sys-object)


;;; ==============================
;; DARWIN `make-system-object-uuid' is having trouble using quoted symbol.
;; '*system-object-uuid-base-namespace* as value suppled for keyword :control-id
;; do we need to loosen the declarations?
(defun make-system-object-uuid (&key base-namespace control-id)
  ;; (declare (unicly:unique-universal-identifier base-namespace)
  ;;          #+:IS-MON((or mon:string-not-null-empty-or-all-whitespace mon:symbol-not-null) control-id)
  ;;          #-:IS-MON(type (or string (and symbol (not null))) control-id))
  ;; #-:IS-MON (%verify-valid-string-or-symbol-for-identity identity)
  (let ((new-obj   (make-instance 'system-object-uuid))
        (new-nmspc (UNICLY:MAKE-V5-UUID base-namespace 
                                        (if (symbolp control-id) 
                                            (string control-id)
                                            control-id))))
    (setf (system-identity new-obj) (list base-namespace control-id))
    (setf (system-identity-uuid new-obj) new-nmspc)
    new-obj))

;; (find-method #'system-object-uuid-description nil '(system-object-uuid))
(defmethod system-object-uuid-description ((sys-object system-object-uuid) &key stream verbose)
  (declare (type boolean verbose))
  (if (not verbose)
      (let* ((unbound "#<UNBOUND>")
             (sys-id-if (and (slot-exists-p sys-object 'system-identity)
                             (slot-boundp  sys-object  'system-identity)
                             (system-identity sys-object)))
             (sys-id     (if sys-id-if
                             (prin1-to-string sys-id-if)
                             unbound))
             (sys-id-uuid   (or (and (slot-exists-p sys-object 'system-identity-uuid)
                                     (slot-boundp  sys-object  'system-identity-uuid)
                                     (system-identity-uuid sys-object))
                                unbound)))
        (with-standard-io-syntax 
          (format stream "~%~{~4T~29A~A~^~%~}~4T"
                  (list 
                   ;; "TYPE-OF:"    (type-of sys-object)
                   ":SYSTEM-IDENTITY"          sys-id
                   ":SYSTEM-IDENTITY-UUID"     sys-id-uuid))))

      (let* ((unbound "#<UNBOUND>")
             (sys-id-if (and (slot-exists-p sys-object 'system-identity)
                             (slot-boundp  sys-object  'system-identity)
                             (system-identity sys-object)))
             (sys-id     (if sys-id-if
                             (prin1-to-string sys-id-if)
                             unbound))

             (sys-id-uuid   (or (and (slot-exists-p sys-object 'system-identity-uuid)
                                     (slot-boundp  sys-object  'system-identity-uuid)
                                     (system-identity-uuid sys-object))
                                unbound))
             
             (byte-array    (or (and (slot-exists-p sys-object 'system-identity-uuid-byte-array)
                                     (slot-boundp  sys-object  'system-identity-uuid-byte-array)
                                     (system-identity-uuid-byte-array sys-object))
                                unbound))

             (bit-vector    (or (and (slot-exists-p sys-object 'system-identity-uuid-bit-vector)
                                     (slot-boundp  sys-object  'system-identity-uuid-bit-vector)
                                     (system-identity-uuid-bit-vector sys-object))
                                unbound))

             (hex-string-if (and (slot-exists-p sys-object 'system-identity-uuid-string-36)
                                 (slot-boundp  sys-object  'system-identity-uuid-string-36)
                                 (system-identity-uuid-string-36 sys-object)))

             (hex-string    (if hex-string-if
                                (prin1-to-string hex-string-if)
                                unbound))
             
             (integer-128-if (and (slot-exists-p sys-object 'system-identity-uuid-integer)
                                  (slot-boundp  sys-object  'system-identity-uuid-integer)
                                  (system-identity-uuid-integer sys-object)))
             (integer-128    (if integer-128-if
                                 (let ((*print-base* 16)
                                       (*print-radix* t)) 
                                   (princ-to-string integer-128-if))
                                 unbound))

             (parent-uuid    (or (and (slot-exists-p sys-object 'system-identity-parent-uuid)
                                      (slot-boundp  sys-object  'system-identity-parent-uuid)
                                      (system-identity-parent-uuid sys-object))
                                 unbound))
         
             (version-if    (and (slot-exists-p sys-object 'system-identity-uuid-version)
                                 (slot-boundp  sys-object  'system-identity-uuid-version)
                                 (system-identity-uuid-version sys-object)))
             (version       (if version-if 
                                (prin1-to-string version-if)
                                unbound))
             (format-description (let ((*print-lines* 0)
                                       ;; (*print-length* 16)
                                       ;; (*print-level* 1)
                                       )
                                   (format nil "~%~{~4T~40A~A~%~}"
                                           (list ;; "TYPE-OF:"    (type-of sys-object)
                                            ":SYSTEM-IDENTITY"                  sys-id
                                            ":SYSTEM-IDENTITY-UUID"             sys-id-uuid
                                            ":SYSTEM-IDENTITY-PARENT-UUID"      parent-uuid
                                            ":SYSTEM-IDENTITY-UUID-STRING-36"   hex-string
                                            ":SYSTEM-IDENTITY-UUID-BYTE-ARRAY"  byte-array
                                            ":SYSTEM-IDENTITY-UUID-INTEGER"     integer-128
                                            ":SYSTEM-IDENTITY-UUID-BIT-VECTOR"  bit-vector
                                            ":SYSTEM-IDENTITY-UUID-VERSION"     version)))))
        (with-standard-io-syntax 
          (princ format-description stream)))))


;; (describe-object *control-id-artist-namespace* nil)
;; (let ((q (with-output-to-string (s) (describe-object *control-id-artist-namespace* s)))
;;       (y '())) 
;;   (declare (ignore q))
;;   y)
(defmethod describe-object ((sys-object system-object-uuid) stream)
  (print (type-of sys-object) stream)
  (system-object-uuid-description sys-object :stream stream :verbose t))

(defmethod print-object ((sys-object system-object-uuid) stream)
  (print-unreadable-object (sys-object stream :type t) ;; :identity t)
    (system-object-uuid-description sys-object :stream  stream)))


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: nil
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
