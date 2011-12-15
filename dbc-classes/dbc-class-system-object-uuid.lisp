;;; :FILE-CREATED <Timestamp: #{2011-05-23T20:18:33-04:00Z}#{11211} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-system-object-uuid.lisp
;;; ==============================

;;; ==============================
;;; :NOTE This file was fenamed from  dbc-class-uuid-namespace-for-control-id.lisp -> dbc-class-system-object-uuid.lisp
;;; @ git commit 0d7a67ea3dbf8a9a433cfb3656dfb09bc351a2e2
;;; ==============================

;;; ==============================
;;; :NOTE danlentz's templeton provides an example of using the class
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


(in-package #:dbc)
;; *package*


;;;; The class SYSTEM-OBJECT-UUID
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
;; `control-id-namespace-required' and `control-id-namespace' but we found the
;; original to be unwieldly once we started defining methods which specialized
;; `uuid-namespace-control-id'.
;; So, despite the use of "system-" as a prefix for this class and it's
;; associated methods, instances of this class are used as the base namespaces
;; for the sub-classes in the dbc-system (e.g. those inheritng from `base-dbc')
;; For example the class and sub-classes of `control-id-display-name' need a
;; control-id namespaces from which their instances will derive UUIDs.
;;
(defclass system-object-uuid (base-uuid)
  ((system-identity
    :documentation  
    #.(format nil
              "An object identified by the `unicly:unique-universal-identifier'~%~
               per slot-value of system-identity-uuid."))
   (system-identity-parent-uuid
    :documentation  
    #.(format nil
              "An object of type `unicly:unique-universal-identifier' which acts~%~
              as the NAMESPACE arg to `unicly:make-v5-uuid' in conjunction with~%~
              slot-value of system-identity as the NAME arg."))
   (system-identity-uuid
    :documentation  
    #.(format nil
              "An object of type `unicly:unique-universal-identifier'.~%~@
               Value of this slot is suitable for use as a namespace argument to~%~@
               `unicly:make-v*-uuid'."))
   (system-identity-uuid-byte-array
    :documentation  
    #.(format nil
              "An object of type `unicly:uuid-byte-array-16'.~%~@
               Value of this slot is the byte-array representation of the object in slot~%~@
               system-identity-uuid."))
   (system-identity-uuid-bit-vector
    :documentation  
    #.(format nil
              "An object of type `unicly::bit-vector-128'.~%~@
               Value of this slot is the bit-vector representation of the object in slot~%~@
               system-identity-uuid."))
   (system-identity-uuid-integer
    :documentation  
    #.(format nil
              "An object of type `unicly::uuid-integer-128'.~%~@
               Value of this slot is the 128bit integer representation of the object in slot~%~@
               system-identity-uuid."))
   (system-identity-uuid-string-36
    :documentation  
    #.(format nil
              "An object of type `unicly::uuid-hex-string-36'.~%~@
               Value of this slot is the hecadecimal integer representation of the object in slot~%~@
               system-identity-uuid."))
   (system-identity-uuid-version
    :documentation 
    #.(format nil 
              "The UUID version of the uuid namespace object in slot~%~@
               system-identity-uuid.")))
  (:documentation 
   #.(format nil
             "Instances of this class hold namespace metadata for classes whose instances~%~@
              share a common UUID namespace."))) 

;; mon:symbol-not-null-or-string-not-empty
;; mon::%fast-string-all-whitespace-p
(defun %verify-valid-string-or-symbol-for-identity (verify-identity)
  (declare #-:mon (type (or string (and symbol (not null))) verify-identity)
           #+:mon (type mon:symbol-not-null-or-string-not-empty verify-identity))
  #+:mon (unless (mon:symbol-not-null-or-string-not-empty-p verify-identity)
           (error "arg IDENTITY did not satisfy `mon:symbol-not-null-or-string-not-empty-p'"))
  #-:mon (when (and (stringp verify-identity)
                    (string= (make-string 0) verify-identity))
           (error "arg IDENTITY did not satisfy `mon:symbol-not-null-or-string-not-empty-p'"))
  (if (stringp verify-identity)
      (if #+:mon (mon::%fast-string-all-whitespace-p verify-identity)
          #-:mon (loop 
                    for char across verify-identity
                    always (member char (list #\SPACE #\NEWLINE #\TAB #\RETURN #\NO-BREAK_SPACE #\PAGE #\VT) :test 'char=))
          (error "arg IDENTITY must not be contained of all whitespace characters")
          verify-identity)
      verify-identity))

(defgeneric system-identity-parent-uuid (sys-object)
  (:method  ((sys-object system-object-uuid))
    (when (and (slot-exists-p sys-object 'system-identity-parent-uuid)
               (slot-boundp sys-object 'system-identity-parent-uuid))
      (slot-value sys-object 'system-identity-parent-uuid))))

(defgeneric (setf system-identity-parent-uuid) (uuid sys-object)
  (:method  ((uuid unicly:unique-universal-identifier) (sys-object system-object-uuid))
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
    (declare (unicly::uuid-byte-array-16 byte-array))
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
    (declare (unicly::uuid-bit-vector-128 uuid-bit-vector))
    (if (slot-exists-p sys-object 'system-identity-uuid-bit-vector)
        (setf (slot-value sys-object 'system-identity-uuid-bit-vector)
              uuid-bit-vector)
        uuid-bit-vector))

  (:method :after
    ((uuid-bit-vector bit-vector) (sys-object system-object-uuid)) ; simple-bit-vector
    (declare (unicly::uuid-bit-vector-128 uuid-bit-vector))
    (let ((slot-value-if (system-identity-uuid-version sys-object))
          (version-if    (unicly::uuid-version-bit-vector uuid-bit-vector)))
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
  (declare (unicly::uuid-bit-vector-128 uuid-bit-vector))
  (let ((slot-value-if (system-identity-uuid-version sys-object))
        (version-if    (unicly::uuid-version-bit-vector uuid-bit-vector)))
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
    (declare (unicly::uuid-ub128 uuid-integer-128))
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
    (declare (unicly::uuid-hex-string-36 uuid-hex-string-36))
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
    (declare (type unicly::uuid-version-int version-integer))
    ;; :NOTE Specializing on fixnum should prevent us from ever seeing the null-uuid here.
    ;; Also, we don't allow v1 or v2 UUID's here either.
    (unless (typep version-integer 'unicly::uuid-v3-4-or-5-int)
      (error "Declining to set value for slot SYSTEM-IDENTITY-UUID-VERSION.~%~
                Version is non-valid for class `system-object-uuid'~% got: ~A~%"
             version-integer))
    (if (slot-exists-p sys-object 'system-identity-uuid-version)
        (setf (slot-value sys-object 'system-identity-uuid-version)
              version-integer)
        version-integer))
  
  (:method  ((uuid-bit-vector bit-vector) (sys-object system-object-uuid))
    (declare (unicly::uuid-bit-vector-128 uuid-bit-vector))
    (let ((bv-version (unicly::uuid-version-bit-vector  uuid-bit-vector)))
      (declare (type (or unicly::uuid-version-int null) bv-version))
      ;; :NOTE  We don't allow null-uuid, v1, or v2 UUID's.
      (unless (typep bv-version 'unicly::uuid-v3-4-or-5-int)
        (error "Declining to set value for slot SYSTEM-IDENTITY-UUID-VERSION.~%~
                Version is non-valid for class `system-object-uuid'~% got: ~A~%"
               bv-version))
      (if (slot-exists-p sys-object 'system-identity-uuid-version)
          (setf (slot-value sys-object 'system-identity-uuid-version)
                uuid-bit-vector)
          uuid-bit-vector))))

(defgeneric system-identity (sys-object)
  (:method ((sys-object system-object-uuid))
    (when (and (slot-exists-p sys-object 'system-identity)
               (slot-boundp sys-object 'system-identity))
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
  ;; `make-system-object-uuid's contains the NAME arg for unicly:make-v5-uuid and
  ;; we want to store this as the slot-value of system-identity in order that we
  ;; may chase upwardly the class uuid's their namespaces and the parent
  ;; namespaces they descend from. To get the NAME into the slot-value of
  ;; system-identity we run an :around method which attempts to rollback in the
  ;; event of a failure (e.g. when the UUID representation for an arg ispoorly
  ;; configurued or otherwise illegitimate.
  (:method :around
    ((namespace-and-identity t) (sys-object system-object-uuid))
    (declare (type list namespace-and-identity))
    (destructuring-bind (namespace identity) namespace-and-identity ;; (list (make-v4-uuid)  "<IDENTITY>")
      (declare ((and (or string symbol) (not null)) identity)
               (unicly:unique-universal-identifier namespace))
      (%verify-valid-string-or-symbol-for-identity identity)
      (let ((new-namespace       (unicly:make-v5-uuid namespace (if (symbolp identity) 
                                                                    (string identity)
                                                                    identity)))
            (old-id-slot         (and (slot-exists-p sys-object 'system-identity)
                                      (slot-boundp  sys-object 'system-identity)
                                      (system-identity sys-object)))
            (old-base-namespace  (and (slot-exists-p sys-object 'system-identity-parent-uuid)
                                      (slot-boundp  sys-object 'system-identity-parent-uuid)
                                      (system-identity-parent-uuid sys-object)))
            ;; We might not have any slots set or only some, so get all of them.
            (old-namespace-slot  (and (slot-exists-p sys-object 'system-identity-uuid)
                                      (slot-boundp  sys-object 'system-identity-uuid)
                                      (system-identity-uuid sys-object)))
            (old-byte-array-slot (and (slot-exists-p sys-object 'system-identity-uuid-byte-array)
                                      (slot-boundp  sys-object 'system-identity-uuid-byte-array)
                                      (system-identity-uuid-byte-array sys-object)))
            (old-bit-vector-slot (and (slot-exists-p sys-object 'system-identity-uuid-bit-vector)
                                      (slot-boundp  sys-object 'system-identity-uuid-bit-vector)
                                      (system-identity-uuid-bit-vector sys-object)))
            (old-integer-slot   (and (slot-exists-p sys-object 'system-identity-uuid-integer)
                                     (slot-boundp  sys-object 'system-identity-uuid-integer)
                                     (system-identity-uuid-integer sys-object)))
            (old-hex-string-slot (and (slot-exists-p sys-object 'system-identity-uuid-string-36)
                                      (slot-boundp  sys-object 'system-identity-uuid-string-36)
                                      (system-identity-uuid-string-36 sys-object)))
            ;; (old-version-slot    (system-identity-uuid-version     sys-object))
            (new-namespace-slot  '()))
        (unwind-protect 
             (progn 
               (setf new-namespace-slot 
                     (ignore-errors 
                       (setf (system-identity-uuid sys-object)
                             new-namespace)))
               ;; If we didn't error we can safeley set the base-namespace slot
               ;; else unset what we just set...
               (when new-namespace-slot 
                 (setf (system-identity-parent-uuid sys-object)
                       namespace)
                 (call-next-method)))
          (unless new-namespace-slot
            (let ((slot-val-for-rollback (or old-bit-vector-slot
                                             old-namespace-slot
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
              (if (and old-base-namespace old-id-slot)
                  (progn
                    (setf (system-identity-parent-uuid sys-object) old-base-namespace)
                    ;; We set the slot-value explicitly instead of using the method
                    ;; specialized because it would land us right back here!
                    (setf (slot-value sys-object 'system-object-uuid-identity) old-id-slot))
                  ;; If either the control-identity or base-namespace slots is
                  ;; null or unbound the the other should be as well.
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
    (declare (unicly::uuid-hex-string-36 uuid-string))
    (let ((uuid-from-string (unicly:make-uuid-from-string uuid-string)))
      (declare (unicly:unique-universal-identifier uuid-from-string))
      (if (slot-exists-p sys-object 'system-identity-uuid)
          (setf (slot-value sys-object 'system-identity-uuid)
                uuid-from-string)
          uuid-from-string)))

  (:method  ((uuid unicly:unique-universal-identifier) (sys-object system-object-uuid))
    (if (slot-exists-p sys-object 'system-identity-uuid)
        (setf (slot-value sys-object 'system-identity-uuid)
              ;; make-sure we don't create eq UUID's
              (uuid-copy-uuid uuid))
        uuid))

  (:method  ((uuid-byte-array array) (sys-object system-object-uuid))
    (declare (unicly::uuid-byte-array-16 uuid-byte-array))
    (let ((uuid-from-byte-array (uuid-from-byte-array uuid-byte-array)))
      (declare (unicly:unique-universal-identifier uuid-from-byte-array))
      (if (slot-exists-p sys-object 'system-identity-uuid)
          (setf (slot-value sys-object 'system-identity-uuid)
                uuid-from-byte-array)
          uuid-from-byte-array)))

  (:method  ((uuid-bit-vector bit-vector) (sys-object system-object-uuid))
    (declare (unicly::uuid-bit-vector-128 uuid-bit-vector))
    (let ((uuid-from-bv (unicly::uuid-from-bit-vector uuid-bit-vector)))
      (declare (unicly:unique-universal-identifier uuid-from-bv))
      (if (slot-exists-p sys-object 'system-identity-uuid)
          (setf (slot-value sys-object 'system-identity-uuid)
                uuid-from-bv)
          uuid-from-bv)))

  (:method  ((integer-128 bignum) (sys-object system-object-uuid))
    (declare (unicly::uuid-ub128 integer-128))
    (let ((uuid-from-int (unicly::uuid-from-bit-vector 
                          (unicly::uuid-integer-128-to-bit-vector integer-128))))
      (declare (unicly:unique-universal-identifier uuid-from-int))
      (if (slot-exists-p sys-object 'system-identity-uuid)
          (setf (slot-value sys-object 'system-identity-uuid)
                uuid-from-int)
          uuid-from-int)))

  ;; The :after method helps us make sure all other slots get propagated whenever
  ;; a slot containing a uuid representation gets touched. 
  ;; This was an early 
  ;; (find-method #'(setf system-identity-uuid) '(:after) '(t system-object-uuid))
  (:method  :after 
    ((uuid-arg t) (sys-object system-object-uuid))
    (let* ((uuid-bv-prevent (unicly:uuid-to-bit-vector 
                             (system-identity-uuid sys-object)))
           (uuid-bv    (if (unicly:uuid-bit-vector-128-p uuid-arg)
                           ;; if the uuid-arg is the same bv128 as the conversion don't re-trigger
                           (if (unicly:uuid-bit-vector-eql uuid-arg uuid-bv-prevent)
                               nil
                               uuid-arg)
                           uuid-bv-prevent))
           (uuid-bytes (if (unicly:uuid-byte-array-16-p uuid-arg)
                           (let* ((existing-slot    
                                   (system-identity-uuid-byte-array sys-object))
                                  (existing-slot-bv 
                                   (when existing-slot 
                                     (unicly:uuid-byte-array-to-bit-vector existing-slot)))
                                  (ba-to-bv 
                                   (if existing-slot-bv
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
                           (let* ((existing-slot    
                                   (system-identity-uuid-integer sys-object))
                                  (existing-slot-bv
                                   (when existing-slot 
                                     (unicly::uuid-integer-128-to-bit-vector existing-slot)))
                                  (int-to-bv      
                                   (if existing-slot-bv
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
           (uuid-hex-36   (if (and (stringp uuid-arg)
                                   (unicly::uuid-string-36-p (the string uuid-arg)))
                              (let* ((existing-slot
                                      (system-identity-uuid-string-36 sys-object))
                                     (existing-slot-bv 
                                      (when existing-slot 
                                        (unicly::uuid-to-bit-vector (unicly:make-uuid-from-string existing-slot))))
                                     (hex-to-bv         
                                      (if existing-slot-bv
                                          nil
                                          (unicly::uuid-to-bit-vector (unicly:make-uuid-from-string uuid-arg)))))
                                (if existing-slot-bv
                                    (if (unicly:uuid-bit-vector-eql existing-slot-bv uuid-bv-prevent)
                                        nil
                                        uuid-arg)
                                    (if (unicly:uuid-bit-vector-eql hex-to-bv uuid-bv-prevent)
                                        nil
                                        uuid-arg)))
                              (unicly:uuid-princ-to-string (system-identity-uuid sys-object)))))
      (declare (type (or unicly::uuid-byte-array-16 null)  uuid-bytes)
               (type (or unicly::uuid-bit-vector-128 null) uuid-bv)
               (type (or unicly::uuid-ub128 null)          uuid-int)
               (type (or unicly::uuid-hex-string-36 null)  uuid-hex-36))
      (when (and uuid-bv (slot-exists-p sys-object 'system-identity-uuid-bit-vector)
                 (setf (system-identity-uuid-bit-vector sys-object) uuid-bv)))
      (when (and uuid-bytes (slot-exists-p sys-object 'system-identity-uuid-byte-array))
        (setf (system-identity-uuid-byte-array sys-object) uuid-bytes))
      (when (and uuid-hex-36 (slot-exists-p sys-object 'system-identity-uuid-string-36))
        (setf (system-identity-uuid-string-36  sys-object) uuid-hex-36))
      (when (and uuid-int (slot-exists-p sys-object 'system-identity-uuid-integer))
        (setf (system-identity-uuid-integer sys-object) uuid-int))
      (if (and (slot-exists-p sys-object 'system-identity)
               (system-identity sys-object))
          (if (and (slot-exists-p sys-object 'system-identity-parent-uuid)
                   (system-identity-parent-uuid sys-object))
              ;; make sure that the namespace and identity evaluate to the
              ;; namespace we just set, and if not remove them.
              (unless (and (slot-exists-p sys-object 'system-identity-uuid-bit-vector)
                           (slot-boundp sys-object 'system-identity-uuid-bit-vector)
                           (slot-exists-p sys-object 'system-identity-parent-uuid)
                           (slot-boundp sys-object 'system-identity-parent-uuid)
                           (slot-exists-p sys-object 'system-identity)
                           (slot-boundp sys-object 'system-identity)
                           (unicly::uuid-bit-vector-eql 
                            (system-identity-uuid-bit-vector sys-object)
                            (uuid-to-bit-vector (make-v5-uuid (system-identity-parent-uuid sys-object)
                                                              (string (system-identity sys-object))))))
                (when (slot-exists-p sys-object 'system-identity)
                  (slot-makunbound sys-object 'system-identity))
                (when (slot-exists-p sys-object 'system-identity-parent-uuid)
                  (slot-makunbound sys-object 'system-identity-parent-uuid)))
              
              (when (slot-exists-p sys-object 'system-identity)
                (slot-makunbound sys-object 'system-identity)))

          ;; The control-identity isn't present, so if the base-namespace is as
          ;; well it shouldn't be
          (when (system-identity-parent-uuid sys-object)
            (slot-makunbound sys-object 'system-identity-parent-uuid)))
      
      uuid-arg)))

;; namespace-and-identity
(defun update-system-object-uuid (sys-object &key base-namespace control-id)
  (declare (type system-object-uuid sys-object)
           (type unicly:unique-universal-identifier base-namespace)
           #-:mon (type (or string (and symbol (not null))) control-id)
           #+:mon ((or mon:string-not-null-empty-or-all-whitespace mon:symbol-not-null)
                   control-id))
  ;; #-:mon (%verify-valid-string-or-symbol-for-identity identity)
  (let ((new-nmspc (unicly:make-v5-uuid base-namespace 
                                        (if (symbolp control-id) 
                                            (string control-id)
                                            control-id))))
    (setf (system-identity sys-object) (list base-namespace control-id))
    (setf (system-identity-uuid sys-object) new-nmspc))
  sys-object)

(defun make-system-object-uuid (&key base-namespace control-id)
  (declare (unicly:unique-universal-identifier base-namespace)
           #-:mon (type (or string (and symbol (not null))) control-id)
           #+:mon ((or mon:string-not-null-empty-or-all-whitespace mon:symbol-not-null)
                   control-id))
  ;; #-:mon (%verify-valid-string-or-symbol-for-identity identity)
  (let ((new-obj   (make-instance 'system-object-uuid))
        (new-nmspc (unicly:make-v5-uuid base-namespace 
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
                             (slot-boundp  sys-object 'system-identity)
                             (system-identity sys-object)))
             (sys-id     (if sys-id-if
                             (prin1-to-string sys-id-if)
                             unbound))
             (sys-id-uuid   (or (and (slot-exists-p sys-object 'system-identity-uuid)
                                     (slot-boundp  sys-object 'system-identity-uuid)
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
                             (slot-boundp  sys-object 'system-identity)
                             (system-identity sys-object)))
             (sys-id     (if sys-id-if
                             (prin1-to-string sys-id-if)
                             unbound))

             (sys-id-uuid   (or (and (slot-exists-p sys-object 'system-identity-uuid)
                                     (slot-boundp  sys-object 'system-identity-uuid)
                                     (system-identity-uuid sys-object))
                                unbound))
             
             (byte-array    (or (and (slot-exists-p sys-object 'system-identity-uuid-byte-array)
                                     (slot-boundp  sys-object 'system-identity-uuid-byte-array)
                                     (system-identity-uuid-byte-array sys-object))
                                unbound))

             (bit-vector    (or (and (slot-exists-p sys-object 'system-identity-uuid-bit-vector)
                                     (slot-boundp  sys-object 'system-identity-uuid-bit-vector)
                                     (system-identity-uuid-bit-vector sys-object))
                                unbound))

             (hex-string-if (and (slot-exists-p sys-object 'system-identity-uuid-string-36)
                                 (slot-boundp  sys-object 'system-identity-uuid-string-36)
                                 (system-identity-uuid-string-36 sys-object)))

             (hex-string    (if hex-string-if
                                (prin1-to-string hex-string-if)
                                unbound))

             (integer-128-if (and (slot-exists-p sys-object 'system-identity-uuid-integer)
                                  (slot-boundp  sys-object 'system-identity-uuid-integer)
                                  (system-identity-uuid-integer sys-object)))
             (integer-128    (if integer-128-if
                                 (let ((*print-base* 16)
                                       (*print-radix* t)) 
                                   (princ-to-string integer-128-if))
                                 unbound))

             (parent-uuid    (or (and (slot-exists-p sys-object 'system-identity-parent-uuid)
                                      (slot-boundp  sys-object 'system-identity-parent-uuid)
                                      (system-identity-parent-uuid sys-object))
                                 unbound))
         
             (version-if    (and (slot-exists-p sys-object 'system-identity-uuid-version)
                                 (slot-boundp  sys-object 'system-identity-uuid-version)
                                 (system-identity-uuid-version sys-object)))
             (version       (if version-if 
                                (prin1-to-string version-if)
                                unbound))
             (format-description (let ((*print-lines* 0))
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


(defmethod describe-object ((sys-object system-object-uuid) stream)
  (print (type-of sys-object) stream)
  (system-object-uuid-description sys-object :stream stream :verbose t))

(defmethod print-object ((sys-object system-object-uuid) stream)
  (print-unreadable-object (sys-object stream :type t) ;; :identity t)
    (system-object-uuid-description sys-object :stream  stream)))


;;; ==============================
;;; :DOCUMENTATION
;;; ==============================

(generic-doc #'system-identity-uuid-bit-vector
"Get SYSTEM-OBJECTs uuid namespace representation as an object of type `unicly::uuid-bit-vector-128'.")

(generic-doc #'(setf system-identity-uuid-bit-vector)
 "Set SYS-OBJECT's UUID namespace bit-vector representation with BV.~%~@
BV is an sys-object of type `unicly:uuid-bit-vector-128'.~%~@
Do not call methods directly use the interface functions:~%~@
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-identity-uuid-integer
 "Get SYS-OBJECT's system-identity-uuid-integer slot-value.~%~@
When `cl:slot-boundp' return value is an object of type `unicly::uuid-integer-128', else nil.")

(generic-doc #'(setf system-identity-uuid-integer)
"Set SYS-OBJECT's 128bit integer representation with UUID-INTEGER-128.~%~@
Do not call methods directly use the interface functions:~%~@
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-identity-uuid-string-36
"Get SYS-OBJECT's system-identity-uuid-string-36 slot-value.
When `cl:slot-boundp' return value is an object of type `unicly::uuid-hex-string-36', else nil.")

(generic-doc #'(setf system-identity-uuid-string-36)
 "Set SYS-OBJECT's `unicly::uuid-hex-string-36' representation with UUID-HEX-STRING-36.~%~@
Do not call methods directly use the interface functions:~%
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-identity-uuid-version
 "Get SYS-OBJECT's system-identity-uuid-version slot-value.~%~@
When `cl:slot-boundp' return value is an object of type `unicly::uuid-version-int', else nil.")

(generic-doc #'system-identity-parent-uuid
 "Return the base-namespace UUID for SYS-OBJECT'S system-identity-parent-uuid slot-value.")

(generic-doc #'(setf system-identity-parent-uuid)
 "Set UUID as SYS-OBJECT's system-identity-parent-uuid slot-value.
Do not call methods directly use the interface functions:~%
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-identity-uuid-byte-array 
 "Set SYS-OBJECT's system-identity-uuid-byte-array slot-value.")

(generic-doc #'(setf system-identity-uuid-byte-array)
 "Set SYS-OBJECT's UUID namespace byte-array representation with BYTE-ARRAY.~%~@
BYTE-ARRAY is an sys-object of type `unicly:uuid-byte-array-16'.~%~@
Do not call methods directly use the interface functions:~%
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'(setf system-identity-uuid-version)
"Set SYS-OBJECT's uuid version with BV-OR-STRING.~%~@
BV-OR-STRING is either a object of type `unicly:uuid-bit-vector-128' or an
integer of type `unicly::uuid-version-int'.~%~@
Do not call methods directly use the interface functions:~%
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-identity
 "Get SYS-OBJECT's system-identity slot-value.")

(generic-doc #'(setf system-identity)
 "Set SYS-OBJECT's system-identity slot-value to IDENTITY.~%~@
Do not call methods directly use the interface functions:~%
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-identity-uuid
 "Get SYS-OBJECT's system-identity-uuid slot-value.")

(generic-doc #'(setf system-identity-uuid)
 "Set UUID namespace for SYS-OBJECT with COERCABLE-UUID.~%~@
COERCABLE-UUID is a representation of a Unicly UUID in some form, e.g.:~%
 hex-string-36, byte-array-16, bit-vector-128, unique-universal-identifier~%~@
Do not call methods directly use the interface functions:~%
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-object-uuid-description
 "Print slot-values of SYS-OBJECT to STREAM.~%~@
When keyword VERBOSE is non-nil return value print all slot-values of SYS-OBJECT
else print only the system-identity and system-identity-uuid slot-values.~%~@
The :VERBOSE t form is used with `cl:describe' method, the nil form is used with
`cl:print-object' method specialized on class system-identity-uuid.~%~@
:SEE-ALSO `make-system-object-uuid', `update-system-object-uuid',
`system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")


;;; ==============================
;;; EOF
