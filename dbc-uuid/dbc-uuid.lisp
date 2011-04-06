;;; :FILE-CREATED <Timestamp: #{2011-03-03T18:39:55-05:00Z}#{11094} - by MON>
;;; :FILE  dbc-uuid/dbc-uuid.lisp
;;; ==============================


;;;; ==============================
;;;; Author Boian Tzonev <boiantz@gmail.com>
;;;; 2007, All Rights Reserved 
;;;;
;;;; This software may be distributed and used according to the terms of the
;;;; Lisp Lesser GNU Public License (LLGPL)
;;;; (URL `http://opensource.franz.com/preamble.html').
;;;;
;;;; (URL `http://www.ietf.org/rfc/rfc4122.txt')
;;;; (URL `https://github.com/dardoria/uuid.git')
;;;; (URL `git://github.com/dardoria/uuid.git')
;;;; ==============================


;;; ==============================
;;; :MOVED 
;;; - The original UUID had its defpackage exports inlined at the top of the
;;;   uuid.lisp file (as opposed to within a package.lisp) The relevant parts of
;;;   that form are now in dbc-specific/package.lisp
;;;
;;; - Also, the original UUID defpackage form had (:use :ironclad).
;;;   However, the required ironclad symbols:
;;;    `ironclad:produce-digest', `ironclad:update-digest'
;;;    `ironclad:ascii-string-to-byte-array' 
;;;   Are each referenced by callers with their package-name qualifers so AFAIC
;;;   there is no reason to :use ironclad.
;;;
;;; - Likewise, the original UUID defpackage had a shadowing-import of cl:null:
;;;     (:shadowing-import-from :common-lisp #:null) 
;;;   Of which it said:
;;;   ,----
;;;   | "ironclad shadows `cl:null' to declare its null-cypher.
;;;   |  We don't use it here so take it from COMMON-LISP"
;;;   `----
;;;   As we aren't using ironclad with (:use ironclad) the shadowing-import is
;;;   not needed either.
;;;
;;; :MODIFICATIONS
;;; - `uuid-print-bytes' no longer uses the :reader method
;;;
;;; - `print-object' of uuid instances no longer uses the :reader methods
;;;
;;; - `format-v3or5-uuid' now uses `%verify-version-3-or-5' instead of checking
;;;   its UUID-VERSION arg is either 3 or 5 arg directly. Originally if
;;;   UUID-VERSION was neither 3 or 5 it returned nil if not. With the addition
;;;   of `%verify-version-3-or-5' it now signals an error.
;;;
;;; - `uuid-digest-uuid-string' now uses `%verify-digest-version' instead of checking its
;;;    DIGEST-VERSION arg directly. Per `%verify-digest-version' reliance on
;;;    `%verify-version-3-or-5' when `uuid-digest-uuid-string's DIGEST-VERSION arg is
;;;    neither 3 or 5 an error is signaled.
;;;
;;; - `arr-to-bytes' macro is now `macrolet'd in `uuid-from-byte-array'
;;;
;;; - `make-v4-uuid' and `make-v1-uuid' (unused) now pass `cl:random' a dedicated
;;;    random state object `*uuid-random-state*'.
;;; 
;;;    The original UUID generated a new `cl:*random-state*' inside an `eval-when'
;;;    form with:
;;;     (setf *random-state* (make-random-state t))
;;;
;;;    The intent (IIUC) was to guarantee a fresh value of *random-state* whenever
;;;    the UUID system loaded.
;;;
;;;    However this is prob. not a good thing b/c it steps on the _state_ of global
;;;    special variable.  *random-state* should be treated as privelged and should
;;;    only be _set_ explicitly and not inside a loadtime form.
;;; 
;;;    UUID could have been accomplished the same affect by alternatively creating
;;;    its own *NON-GLOBAL-RANDOM-STATE* and passing that state to `cl:random'
;;;    This is what we have done with the new variable `*uuid-random-state*'.
;;;
;;; - :RENAMED following:
;;;    `uuid'               -> `unique-universal-identifier'
;;;    `print-bytes'        -> `uuid-print-bytes'
;;;    `byte-array-to-uuid' -> `uuid-from-byte-array'
;;;    `format-as-urn'      -> `format-uuid-as-urn'
;;;    `load-bytes'         -> `uuid-load-bytes'
;;;    `get-bytes'          -> `uuid-get-bytes'
;;;    `digest-uuid'        -> `uuid-digest-uuid-string'
;;;    `+namespace-dns+'    -> `*uuid-namespace-dns*' 
;;;    `+namespace-url+'    -> `*uuid-namespace-url*' 
;;;    `+namespace-oid+'    -> `*uuid-namespace-oid*' 
;;;    `+namespace-x500+'   -> `*uuid-namespace-x500*'
;;;
;;; :NOTE The original UUID called this class `uuid'.
;;; We renamed that to `unique-universal-identifier' b/c we have the class
;;; `base-uuid' in dbc-classes/dbc-class-uuid.lisp and that usage is consistent
;;; with the rest of the system.
;;;
;;; :SLOT-INITARG-ACCESSORS
;;; - We rename the slots with a "%uuid_" prefix to better allow other dbc
;;;   classes to include "uuid-" prefixed slots without worry about slime
;;;   completion issues.
;;;   
;;;   `time-low'               -> `%uuid_time-low' 
;;;   `time-mid'               -> `%uuid_time-mid'
;;;   `time-high-and-version'  -> `%uuid_time-high-and-version'
;;;   `clock-seq-and-reserved' -> `%uuid_clock-seq-and-reserved'
;;;   `clock-seq-low'          -> `%uuid_clock-seq-low'
;;;   `node'                   -> `%uuid_node'
;;;
;;;  - The original UUID accessors were never really used effectively so
;;;    we've omitted them. They remain commented in the source as:
;;;    `%uuid_time-low', `%uuid_time-mid', `%uuid_time-high',
;;;    `%uuid_clock-seq-var', `%uuid_clock-seq-low', `%uuid_node'
;;;
;;; - :ADDED
;;;   `%verify-version-3-or-5'
;;;   `%verify-digest-version'
;;;   `%verify-slot-boundp-and-type'
;;;   `%uuid-get-bytes-if'
;;;   `make-uuid-from-string-if'
;;;   `uuid-copy-uuid'
;;;   `uuid-string-32'
;;;   `uuid-string-36'
;;;   `uuid-hex-string-32'
;;;   `uuid-hex-string-36'
;;;   `uuid-byte-string'
;;;   `uuid-byte-array-16'
;;;   `uuid-string-32-p'
;;;   `uuid-string-36-p'
;;;   `uuid-hex-string-32-p'
;;;   `uuid-hex-string-36-p'
;;;   `uuid-byte-string-p'
;;;   `uuid-byte-array-16-p'
;;;   `unique-universal-identifier-p'
;;;   `uuid-ub48'
;;;   `uuid-ub32'
;;;   `uuid-ub16'
;;;   `uuid-ub8'
;;;
;;;   `*uuid-random-state*'
;;;   `uuid-string-to-sha1-byte-array'
;;;
;;; :UNUSED 
;;; `*clock-seq*',  `*node*', `*ticks-per-count*', 
;;; `get-timestamp', `get-node-id', `make-v1-uuid', `arr-to-bytes',
;;; 
;;; ==============================

;; `make-v3-uuid' and `make-v5-uuid'
;;  `-> `format-v3or5-uuid'
;;       `-> `uuid-digest-uuid-hex-string-36'
;;             `-> `uuid-get-bytes'
;;                  `-> `uuid-print-bytes'
;;
;; `format-v3or5-uuid'
;; `-> `%verify-version-3-or-5', `uuid-load-bytes'
;;
;; `uuid-get-bytes'            Return value type --> uuid-byte-string
;;  `-> `%uuid-get-bytes-if'

;; `uuid-digest-uuid-string'  Return value type --> 
;;  `-> `ironclad:make-digest'
;;      `ironclad:update-digest'
;;      `ironclad:ascii-string-to-byte-array'
;;      `ironclad:produce-digest'

;;; ==============================


;;; ==============================
;; :TESTING v5 dbc/uuid/elisp-uuid
;; 
;; (make-v5-uuid *uuid-namespace-dns* "bubba") 
;; => EEA1105E-3681-5117-99B6-7B2B5FE1F3C7
;;
;; (make-v5-uuid *uuid-namespace-dns* "ésiaλ")
;; => BB7CB880-7D2A-5DB6-86FF-AFADC974A7B3
;;
;; (uuid:make-v5-uuid uuid:+namespace-dns+ "bubba")
;; => EEA1105E-3681-5117-99B6-7B2B5FE1F3C7
;;
;; (uuid:make-v5-uuid uuid:+namespace-dns+ "ésiaλ")
;; => BB7CB880-7D2A-5DB6-86FF-AFADC974A7B3
;;
;; (insert (uuid-5 "6ba7b810-9dad-11d1-80b4-00c04fd430c8" "bubba"))
;;  => EEA1105E-3681-5117-99B6-7B2B5FE1F3C7
;; 
;; (insert (uuid-5 "6ba7b810-9dad-11d1-80b4-00c04fd430c8" "ésiaλ"))
;; => bb7cb880-7d2a-5db6-86ff-afadc974a7b3
;;; ==============================
;; :TEST v3
;;
;; (make-v3-uuid *uuid-namespace-dns* "bubba")
;; => 5E320838-7157-3039-8383-652D96705A7D
;;
;; (make-v3-uuid *uuid-namespace-dns* "ésiaλ")
;; => 6AE2D886-F18B-30C8-82A3-47F5B6909F7B
;;
;; (uuid:make-v3-uuid uuid:+namespace-dns+ "bubba")
;; => 5E320838-7157-3039-8383-652D96705A7D
;;
;; (uuid:make-v3-uuid uuid:+namespace-dns+ "ésiaλ")
;; => 6AE2D886-F18B-30C8-82A3-47F5B6909F7B
;;
;; (insert (uuid-3 "6ba7b810-9dad-11d1-80b4-00c04fd430c8" "bubba"))
;; => 5e320838-7157-3039-8383-652d96705a7d
;;
;; (insert (uuid-3 "6ba7b810-9dad-11d1-80b4-00c04fd430c8" "ésiaλ"))
;; => 6ae2d886-f18b-30c8-82a3-47f5b6909f7b
;;
;; (defparameter *tt--array*
;;   (make-array 16 :element-type 'uuid-ub8 :initial-contents '(;; 004 163 243 087 
;;                                                              255 255 255 255
;;                                                              131 056 113 209
;;                                                              192 078 ;; 199 013 186 219 156 252)))
;;                                                              255 255 255 255 255 255)))
;;
;; (eql (uuid-get-bytes-for-integer 825973027016) 6)
;;
;;
;; (eql (uuid-get-bytes-for-integer #xFFFFFFFFFFFF) 6)
;; (eql (uuid-get-bytes-for-integer #x1FFFFFFF) 4)
;; (eql (uuid-get-bytes-for-integer #xFFFFFFFF) 4)
;; (eql (uuid-get-bytes-for-integer #xFFFFFF) 4)
;; (eql (uuid-get-bytes-for-integer #x1FFFF) 4)
;; fails successfully:
;; (uuid-get-bytes-for-integer 281474976710656)
;; 
;; (let ((rnd-trip-17 #x1FFFF)
;;       (rslt nil))
;;   (setf rslt
;;         (multiple-value-bind (arr len) (uuid-number-to-byte-array rnd-trip-17)
;;           (uuid-request-integer  arr 0 len)))
;;   (setf rslt `(,(eql rnd-trip-17 rslt) ,rslt)))
;;
;; :NOTE Testing serialization/deserilization
;; (let ((file (make-pathname :directory '(:absolute "tmp")
;;                            :name "temp-bytes"))
;;       (w-uuid (make-v5-uuid *uuid-namespace-dns* "bubba"))
;;       ;; w-uuid => EEA1105E-3681-5117-99B6-7B2B5FE1F3C7
;;       (gthr '()))
;;   (with-open-file (s file
;;                      :if-exists :supersede
;;                      :if-does-not-exist :create
;;                      :direction :output
;;                      :element-type 'uuid-ub8)
;;     (serialize-uuid w-uuid s))
;;   ;; :NOTE following is basis for deserializing a uuid from file, e.g.: 
;;   ;;  (defun deserialize-uuid (file) (...) )
;;   (with-open-file (stream file :element-type 'uuid-ub8)
;;     (do ((code (read-byte stream nil :eof) (read-byte stream nil :eof)))
;;         ((eql code :eof))
;;       (push code gthr)))
;;   (and gthr
;;        (setf gthr (uuid-from-byte-array (make-array 16
;;                                                     :element-type 'uuid-ub8
;;                                                     :initial-contents (nreverse gthr)))))
;;   (unwind-protect 
;;        (list (uuid-eql w-uuid gthr)
;;              gthr
;;              w-uuid)
;;     (delete-file file)))
;;
;;; ==============================



(in-package #:dbc)
;; *package*

(deftype uuid-ub48 ()
 '(unsigned-byte 48))

(deftype uuid-ub32 ()
 '(unsigned-byte 32))

(deftype uuid-ub16 ()
  '(unsigned-byte 16))

(deftype uuid-ub8 ()
  '(unsigned-byte 8))

(deftype uuid-byte-string ()
  '(simple-array character (16)))

(deftype uuid-byte-array ()
  ;; '(or uuid-byte-array-16 uuid-byte-array-20))
  '(simple-array (unsigned-byte 8) (*)))

;; v3 MD5 returns an array of type: (simple-array (unsigned-byte 8) (16))
(deftype uuid-byte-array-16 ()
  '(and uuid-byte-array (simple-array (unsigned-byte 8) (16))))

;; v5 SHA1 returns an array of type: (simple-array (unsigned-byte 8) (20))
(deftype uuid-byte-array-20 ()
  '(and uuid-byte-array (simple-array (unsigned-byte 8) (20))))

(deftype uuid-string-32 ()
  '(array character (32)))

(deftype uuid-string-36 ()
  '(array character (36)))

(deftype uuid-hex-string-32 ()
  '(and uuid-string-32 (satisfies mon:string-all-hex-char-p)))

(deftype uuid-hex-string-36 ()
  '(and uuid-string-36 (satisfies uuid-hex-string-36-p)))

;; (macroexpand-1 '(uuid-get-bytes-for-integer 281474976710655))
(defmacro uuid-get-bytes-for-integer (unsigned-integer)
  (declare (optimize (speed 3)))
  `(etypecase (integer-length ,unsigned-integer)
     ,@(loop 
          for cnt upfrom 1 below 7
          for x upfrom 0 below 48 by 8
          for low = 0 then (case x 
                             ;; Skip returning 3 octet value 17-24, bump to 4
                             (24 17) 
                             ;; Skip returning 5 octet value 33-40, bump to 6
                             (40 33) 
                             (t (+ x 1)))
          for high = 8 then (+ x 8)
          unless  (and (oddp cnt) (> cnt 1))
          collect (list (list 'integer low high) cnt))))

(defun uuid-string-32-p (maybe-uuid-string-32)
  (typep maybe-uuid-string-32 'uuid-string-32))

(defun uuid-string-36-p (maybe-uuid-string-36)
  (typep maybe-uuid-string-36 'uuid-string-36))

(defun uuid-byte-array-p (maybe-uuid-byte-array)
  (typep maybe-uuid-byte-array 'uuid-byte-array))

(defun uuid-byte-array-16-p (maybe-uuid-byte-array-16)
  (typep maybe-uuid-byte-array-16 'uuid-byte-array-16))

(defun uuid-byte-array-20-p (maybe-uuid-byte-array-20)
  (typep maybe-uuid-byte-array-20 'uuid-byte-array-20))

(defun uuid-byte-string-p (maybe-uuid-byte-string)
  (typep maybe-uuid-byte-string 'uuid-byte-string))

(defun uuid-hex-string-32-p (maybe-uuid-hex-string-32)
  (typep maybe-uuid-hex-string-32 'uuid-hex-string-32))

(defun uuid-hex-string-36-p (maybe-uuid-hex-string-36)
  (when (uuid-string-36-p maybe-uuid-hex-string-36)
    (let ((split-uuid (split-sequence:split-sequence-if #'(lambda (x) 
                                                            (char= #\- x))
                                                        (the uuid-string-36 maybe-uuid-hex-string-36))))
      (declare (list split-uuid))
      (and (eq (length split-uuid) 5)
           (equal (map 'list #'length split-uuid) (list 8 4 4 4 12))
           (loop
              :for chk-hex :in split-uuid
              :always (mon:string-all-hex-char-p (the string chk-hex)))))))

;;; ==============================
;;; :NOTE The eval-when _was_ here b/c the parameters with nameforms matching
;;; `*uuid-namespace-<NAME>*' need `make-uuid-from-string' which in turn needs
;;; the class definition for `unique-universal-id'. We moved
;;; these parameter to ../specials.lisp and the eval-when form is no longer needed.
;;;
;;; 
;;; (eval-when (:compile-toplevel :load-toplevel :execute)
;;; :WAS #+:sbcl (setf *random-state* (make-random-state t))
;;
(defclass unique-universal-identifier ()
  ((%uuid_time-low 
      :initarg :%uuid_time-low
      :type uuid-ub32
      :initform 0
      ;; :accessor %uuid_time-low
      :documentation
      #.(format nil "A 4 octet value of type `uuid-ub32'.~%~@
                     Occurs as the 0 element in a UUID string delimited by #\\-.~%~@
                     Its string representation is 8 hexadecimal characters."))
     (%uuid_time-mid
      :initarg :%uuid_time-mid
      :type uuid-ub16
      :initform 0 
      ;; :accessor %uuid_time-mid
      :documentation
      #.(format nil "A 2 octet value of type `uuid-ub16'.~%~@
                     Occurs as the 1 element in a UUID string delimited by #\\-.~%~@
                     Its string representation is 4 hexadecimal characters."))
     (%uuid_time-high-and-version
      :initarg :%uuid_time-high-and-version
      :type uuid-ub16
      :initform 0
      ;; :accessor %uuid_time-high
      :documentation
      #.(format nil "A 2 octet value of type `uuid-ub16'.~%~@
                     Occurs as the 2 element in a UUID string delimited by #\\-.~%
                     Its string representation is 4 hexadecimal characters."))
     (%uuid_clock-seq-and-reserved
      :initarg :%uuid_clock-seq-and-reserved
      :type uuid-ub8
      :initform 0
      ;; :accessor %uuid_clock-seq-var
      :documentation
      #.(format nil "An octet value of type `uuid-ub8'.~%~@
                     Occurs in the upper portion of the 3 element in a UUID string delimited by #\\-.~%~@
                     Its string representation is 2 hexadecimal characters."))
     (%uuid_clock-seq-low
      :initarg :%uuid_clock-seq-low
      :type uuid-ub8
      :initform 0
      ;; :accessor %uuid_clock-seq-low
      :documentation
      #.(format nil "An octet of type `uuid-ub8'.~%~@
                     Occurs in the lower portion of the 3 element in a UUID string delimited by #\\-.~%~@
                     Its string representation is 2 hexadecimal characters."))
     (%uuid_node
      :initarg :%uuid_node
      :type uuid-ub48
      :initform 0
      ;; :accessor %uuid_node
      :documentation 
      #.(format nil "A 6 octet value of type `uuid-ub48'.~%~@
                    Occurs as the final or 4 element in a UUID string delimited by #\\-.~%~@
                    Its string representation is 12 hexadecimal characters.")))

  (:documentation
     #.(format nil "Representation of an UUID.~%~@
                    The string representation of A UUID has the format:~%~%~4T
                                         clock-seq-and-reserved~4T
                               time-mid  | cloc-seq-low~4T
                               |         | |~4T
                      6ba7b810-9dad-11d1-80b4-00c04fd430c8~4T
                      |             |         |~4T
                      ` time-low    |         ` node~4T
                                    ` time-high-and-version~%~@
                    Each field is treated as an integer and has its value printed as a zero-filled~%~@
                    hexadecimal digit string with the most significant digit first.")))

;; :SOURCE kyoto-persistence/uuid.lisp
;; :SEE (URL `git://github.com/kraison/kyoto-persistence.git') 
(defgeneric uuid-eql (uuid-a uuid-b)
  (:method ((uuid-a unique-universal-identifier) (uuid-b unique-universal-identifier))
    (equalp (uuid-get-namespace-bytes uuid-a) (uuid-get-namespace-bytes uuid-b)))
  (:method ((uuid-a unique-universal-identifier) uuid-b)
    nil)
  (:method (uuid-a (uuid-b unique-universal-identifier))
    nil)
  (:method ((uuid-a t) (uuid-b t))
    nil)
  (:documentation 
   #.(format nil 
             "Whether object UUID-A is eql UUID-B.~%~@
:EXAMPLE~%
 \(uuid-eql \(make-v5-uuid *uuid-namespace-dns* \"bubba\"\)
           \(make-v5-uuid *uuid-namespace-dns* \"bubba\"\)\)~%
 \(uuid-eql \(make-v5-uuid *uuid-namespace-dns* \"bubba\"\)
           \(make-v5-uuid *uuid-namespace-dns* \"bubbA\"\)\)~%
 \(uuid-eql \"bubb\" \"bobby\"\)~%~@
:SEE-ALSO `unique-universal-identifier-p'.~%►►►")))

;;; ==============================
;;; :NOTE using generic fun instead.
;; (defun unique-universal-identifier-p (maybe-uuid-instance)
;;   (typep maybe-uuid-instance 'unique-universal-identifier))
(defgeneric unique-universal-identifier-p (object)
  (:method ((object unique-universal-identifier)) t)
  (:method (object) nil)
  (:documentation
   #.(format nil
"Whether MAYBE-UUID-INSTANCE is a unique-universal-identifier.~%~@
Return T when argument is an instace of the class
`dbc:unique-universal-identifier' or one of its subclasses.~%~@
:EXAMPLE~%
 \(unique-universal-identifier-p *uuid-namespace-dns*\)~%
 \(unique-universal-identifier-p t\)~%~@
:SEE-ALSO `uuid-eql'.~%►►►")))

(defmethod print-object ((id unique-universal-identifier) stream)
  ;;  "Print UNIQUE-UNIVERSAL-IDENTIFIER ID to to STREAM in string representation.
  ;;  :EXAMPLE (print-object (make-v4-uuid) nil)"  
  (with-slots (%uuid_time-low 
               %uuid_time-mid
               %uuid_time-high-and-version
               %uuid_clock-seq-and-reserved
               %uuid_clock-seq-low
               %uuid_node)
      id
    (declare (type uuid-ub32 %uuid_time-low)
             (type uuid-ub16 %uuid_time-mid %uuid_time-high-and-version)
             (type uuid-ub8 %uuid_clock-seq-and-reserved %uuid_clock-seq-low)
             (type uuid-ub48 %uuid_node))
    (format stream "~8,'0X-~4,'0X-~4,'0X-~2,'0X~2,'0X-~12,'0X" 
            %uuid_time-low 
            %uuid_time-mid 
            %uuid_time-high-and-version
            %uuid_clock-seq-and-reserved
            %uuid_clock-seq-low
            %uuid_node)))

(defun uuid-princ-to-string (uuid-instance)
  (declare (unique-universal-identifier uuid-instance))
  #-sbcl (assert (typep uuid-instance 'unique-universal-identifier)
                 (uuid-instance)
                 "Arg UUID-INSTANCE does not satisfy `unique-universal-identifier-p'")
  (princ-to-string uuid-instance))

(defun make-uuid-from-string-if (uuid-hex-string-36-if)
  (or (and (uuid-hex-string-36-p uuid-hex-string-36-if)
           (the uuid-string-36 uuid-hex-string-36-if))
      (mon:simple-error-mon :w-sym  'make-uuid-from-string-if
                            :w-type 'function
                            :w-spec "Arg UUID-HEX-STRING-36-IF not `uuid-hex-string-36-p'"
                            :w-got uuid-hex-string-36-if
                            :w-type-of t
                            :signal-or-only nil)))

(defun %verify-slot-boundp-and-type (verify-uuid)
  (declare (unique-universal-identifier verify-uuid))
  (with-slots ((utl   %uuid_time-low)
               (utm   %uuid_time-mid)
               (uthav %uuid_time-high-and-version)  
               (ucsar %uuid_clock-seq-and-reserved)
               (ucsl  %uuid_clock-seq-low)
               (un    %uuid_node))
      verify-uuid
    (loop
       for (chk-bnd . chk-type) in '((%uuid_time-low . uuid-ub32)
                                     (%uuid_time-mid . uuid-ub16)
                                     (%uuid_time-high-and-version  . uuid-ub16)
                                     (%uuid_clock-seq-and-reserved . uuid-ub8)
                                     (%uuid_clock-seq-low . uuid-ub8)
                                     (%uuid_node . uuid-ub48))
       unless (slot-boundp verify-uuid chk-bnd)
       do (error 'simple-condition
                 :format-control "Arg VERIFY-UUID has unbound slot: ~S"
                 :format-arguments (list chk-bnd))
       unless (typep (slot-value verify-uuid chk-bnd) chk-type)
       do (error (make-condition 'type-error
                                 :datum (slot-value verify-uuid chk-bnd)
                                 :expected-type chk-type))
       finally (return t))))

(defun uuid-copy-uuid (uuid-instance)
  (declare (unique-universal-identifier uuid-instance)
           (optimize (speed 3)))
  #-sbcl (assert (unique-universal-identifier-p uuid-instance) 
                 (uuid-instance)
                 "Arg UUID-INSTANCE does not satisfy `unique-universal-identifier-p'")
  (%verify-slot-boundp-and-type uuid-instance)
  (with-slots (%uuid_time-low
               %uuid_time-mid
               %uuid_time-high-and-version
               %uuid_clock-seq-and-reserved
               %uuid_clock-seq-low
               %uuid_node)
      uuid-instance
    (declare (type uuid-ub32 %uuid_time-low)
             (type uuid-ub16 %uuid_time-mid %uuid_time-high-and-version)
             (type uuid-ub8  %uuid_clock-seq-and-reserved %uuid_clock-seq-low)
             (type uuid-ub48 %uuid_node))
    (make-instance 'unique-universal-identifier
                   :%uuid_time-low                %uuid_time-low
                   :%uuid_time-mid                %uuid_time-mid
                   :%uuid_time-high-and-version   %uuid_time-high-and-version
                   :%uuid_clock-seq-and-reserved  %uuid_clock-seq-and-reserved
                   :%uuid_clock-seq-low           %uuid_clock-seq-low
                   :%uuid_node                    %uuid_node)))

;; :NOTE What about `cl:read-from-string' instead of `cl:parse-integer' e.g.:
;;   (let ((*read-base* 16)) (read-from-string "88"))
;; No. When asked on #lisp noting that the bounds fo string and its contents are
;; known and pre-verified to be all hexadecimal chars -- nyef says:
;; ,----
;; | Use PARSE-INTEGER. It's more efficient, and makes an explicit
;; | statement about what syntax you're expecting as input.
;; `----
(defun make-uuid-from-string (uuid-or-hex-string-36)
  (declare ((or unique-universal-identifier string) uuid-or-hex-string-36))
  (let ((chk-uuid-str (typecase uuid-or-hex-string-36
                        (unique-universal-identifier 
                         (return-from make-uuid-from-string (uuid-copy-uuid uuid-or-hex-string-36)))
                        (string (make-uuid-from-string-if uuid-or-hex-string-36)))))
    (declare (uuid-string-36 chk-uuid-str)
             (optimize (speed 3)))
    (make-instance 'unique-universal-identifier
                   :%uuid_time-low 
                   (the uuid-ub32 (parse-integer chk-uuid-str :start 0 :end 8  :radix 16))
                   :%uuid_time-mid 
                   (the uuid-ub16 (parse-integer chk-uuid-str :start 9 :end 13 :radix 16))
                   :%uuid_time-high-and-version 
                   (the uuid-ub16 (parse-integer chk-uuid-str :start 14 :end 18 :radix 16))
                   :%uuid_clock-seq-and-reserved 
                   (the uuid-ub8  (parse-integer chk-uuid-str :start 19 :end 21 :radix 16))
                   :%uuid_clock-seq-low 
                   (the uuid-ub8  (parse-integer chk-uuid-str :start 21 :end 23 :radix 16))
                   :%uuid_node 
                   (the uuid-ub48 (parse-integer chk-uuid-str :start 24 :end 36 :radix 16)))))

;;; ==============================
;; :NOTE vivace-graph-v2 serializes the integers of UUID not its bytes.
;; :SOURCE vivace-graph-v2-GIT/uuid.lisp
;; (defun serialize-uuid-vivace (uuid stream)
;;   (with-slots 
;; 	(time-low time-mid time-high-and-version clock-seq-and-reserved clock-seq-low 
;; 		  node)
;;       uuid
;;     (loop for i from 3 downto 0
;;        do (write-byte (ldb (byte 8 (* 8 i)) time-low) stream))
;;     (loop for i from 5 downto 4
;;        do (write-byte (ldb (byte 8 (* 8 (- 5 i))) time-mid) stream))
;;     (loop for i from 7 downto 6
;;        do (write-byte (ldb (byte 8 (* 8 (- 7 i))) time-high-and-version) stream))
;;     (write-byte (ldb (byte 8 0) clock-seq-and-reserved) stream)
;;     (write-byte (ldb (byte 8 0) clock-seq-low) stream)
;;     (loop for i from 15 downto 10
;;        do (write-byte (ldb (byte 8 (* 8 (- 15 i))) node) stream))))
;;
;; (defun serialize-uuid-vivace (uuid stream)
;;   (declare (type unique-universal-identifier uuid)
;;            (type stream stream)
;;            (optimize (speed 3)))  
;;   (with-slots (%uuid_time-low               ;; 4
;;                %uuid_time-mid               ;; 2
;;                %uuid_time-high-and-version  ;; 2
;;                %uuid_clock-seq-and-reserved ;; 1
;;                %uuid_clock-seq-low          ;; 1
;;                %uuid_node)                  ;; 6
;;       uuid
;;     (declare (type uuid-ub32 %uuid_time-low)
;;              (type uuid-ub16 %uuid_time-mid %uuid_time-high-and-version)
;;              (type uuid-ub8  %uuid_clock-seq-and-reserved %uuid_clock-seq-low)
;;              (type uuid-ub48 %uuid_node))
;;     ;; :NOTE This is is uuid byte writer as `uuid-to-byte-array's is byte reader
;;     (loop for i from 3 downto 0
;;        do (write-byte (ldb (byte 8 (* 8 i)) %uuid_time-low) stream))
;;     (loop for i from 5 downto 4
;;        do (write-byte (ldb (byte 8 (* 8 (- 5 i))) %uuid_time-mid) stream))
;;     (loop for i from 7 downto 6
;;        do (write-byte (ldb (byte 8 (* 8 (- 7 i))) %uuid_time-high-and-version) stream))
;;     (write-byte (ldb (byte 8 0) %uuid_clock-seq-and-reserved) stream)
;;     (write-byte (ldb (byte 8 0) %uuid_clock-seq-low) stream)
;;     (loop for i from 15 downto 10
;;        do (write-byte (ldb (byte 8 (* 8 (- 15 i))) %uuid_node) stream))))
;;; ==============================

(defun serialize-uuid (uuid stream)
  (declare (type unique-universal-identifier uuid)
           (type stream stream)
           (optimize (speed 3)))
  (loop 
     with bv = (the uuid-byte-array-16 (uuid-get-namespace-bytes uuid))
     for i from 0 below 16
     do (write-byte (aref bv i) stream)))



(defun uuid-number-to-byte-array (num)  ; &optional number-type)
  ;; :EXAMPLE
  ;; (uuid-number-to-byte-array 825973027016)
  ;;  => #(200 48 212 79 192 0), 6
  ;;
  ;; (slot-value *uuid-namespace-dns* '%uuid_node) ;=> 825973027016
  ;; (logand 825973027016 255)          ;=> 200
  ;; (logand (ash 825973027016 -8) 255) ;=> 48
  ;; (logand (ash 3226457136 -8) 255)   ;=> 212
  ;; (logand (ash 12603348 -8) 255)     ;=> 79
  ;; (logand (ash 49231 -8) 255)        ;=> 192
  ;; (ash 192 -8)                       ;=> 0
  (declare ((integer 0 *) num))
  (if (zerop num)
      (values (make-array 1 :element-type 'uuid-ub8 :initial-element 0) 1)
      (let* ((type-cnt (uuid-get-bytes-for-integer num))
             (byte-arr (make-array type-cnt :element-type 'uuid-ub8 :initial-element 0)))
        (declare ((mod 7) type-cnt) 
                 ((integer 1 *) num)
                 ((simple-array (unsigned-byte 8) (*)) byte-arr))
        (loop
           :for val = num :then (ash val -8)
           :for count downfrom (1- type-cnt) downto 0
           ;; Knock down all 1 bits above 255 to 0
           :do (setf (aref byte-arr count) (logand val #XFF))
           :finally (return (values byte-arr type-cnt))))))

;;; :NOTE `uuid-get-namespace-bytes' and `uuid-to-byte-array' are essentially the same.
(defun uuid-get-namespace-bytes (uuid)
  ;; Return value has this form:
  ;; ((4 . #(107 167 184 16))
  ;;  (2 . #(157 173))
  ;;  (2 . #(17 209))
  ;;  (1 . #(128))
  ;;  (1 . #(180)) 
  ;;  (^ . #(0 192 79 212 48 200))) ;; <- This must _always_ be a 6 elt array
  ;;
  ;; (length (uuid-get-namespace-bytes *uuid-namespace-dns*))
  ;;
  ;; Replaces following from `uuid-digest-uuid-string'
  ;; (ironclad:ascii-string-to-byte-array (uuid-get-bytes (uuid-print-bytes nil *uuid-namespace-dns*)))
  ;; 
  (declare (type unique-universal-identifier uuid)
           (optimize (speed 3)))
  (with-slots (%uuid_time-low               ;; 4
               %uuid_time-mid               ;; 2
               %uuid_time-high-and-version  ;; 2
               %uuid_clock-seq-and-reserved ;; 1
               %uuid_clock-seq-low          ;; 1
               %uuid_node)                  ;; 6
      uuid
    (declare (type uuid-ub32 %uuid_time-low)
             (type uuid-ub16 %uuid_time-mid %uuid_time-high-and-version)
             (type uuid-ub8  %uuid_clock-seq-and-reserved %uuid_clock-seq-low)
             (type uuid-ub48 %uuid_node))
    (loop 
       for slots in (list %uuid_time-low %uuid_time-mid %uuid_time-high-and-version
                          %uuid_clock-seq-and-reserved %uuid_clock-seq-low %uuid_node)
       for (a b) of-type (uuid-byte-array (mod 7)) = (multiple-value-list (uuid-number-to-byte-array slots))
       summing b into len
       nconc  (loop for idx from 0 below b collect (aref a idx)) into rslt
       finally (locally 
                   (declare ((integer 16 20) len)
                            (cons rslt))
                 (return (make-array len 
                                     :element-type 'uuid-ub8
                                     :initial-contents rslt))))))
;; 
;; Following is the proof:
;;
;; (let ((new-nmspc (make-v4-uuid)))
;;   (list (uuid-get-namespace-bytes (make-v5-uuid new-nmspc "bubba"))
;;         (ironclad:ascii-string-to-byte-array
;;            (uuid-get-bytes (uuid-print-bytes nil (make-v5-uuid new-nmspc "bubba"))))))
;; => (#(27 38 0 193 81 202 82 186 187 104 105 188 142 176 0 123)
;;     #(27 38 0 193 81 202 82 186 187 104 105 188 142 176 0 123))
;;
;; (uuid-get-namespace-bytes (make-v5-uuid *uuid-namespace-dns* "bubba"))
;; => #(238 161 16 94 54 129 81 23 153 182 123 43 95 225 243 199)
;;
;; (ironclad:ascii-string-to-byte-array 
;;   (uuid-get-bytes (uuid-print-bytes nil (make-v5-uuid *uuid-namespace-dns* "bubba"))))
;; => #(238 161 16 94 54 129 81 23 153 182 123 43 95 225 243 199)

;; :NOTE Specialized on objects that are uuid instances instead of the wacky return value of:
;;  (uuid-get-bytes (uuid-print-bytes nil *uuid-namespace-dns*))
(defun uuid-digest-uuid-instance (digest-version uuid-instance name)
  ;; This is step two of RFC4122 section 4.3 
  ;; -  Compute the hash of the name space ID concatenated with the name.
  (declare 
   ((mod 6) digest-version)
   (type unique-universal-identifier uuid-instance))
  (let ((digester  (ironclad:make-digest (%verify-digest-version digest-version))))
    (ironclad:update-digest digester (uuid-get-namespace-bytes uuid-instance))
    (ironclad:update-digest digester 
                            ;; :WAS (ironclad:ascii-string-to-byte-array name))
                            ;; #-sbcl (trivial-utf-8:string-to-utf-8-bytes name))
                            #-sbcl (the uuid-byte-array (flexi-streams:string-to-octets name :external-format :UTF-8))
                            #+sbcl (the uuid-byte-array (sb-ext:string-to-octets name :external-format :UTF-8)))
    (the (values uuid-byte-array &optional) (ironclad:produce-digest digester))))


;; (uuid-digest-uuid-instance 5 *uuid-namespace-dns* "bubba")
;; 
;; (uuid-digest-uuid-string 5 (uuid-get-bytes (uuid-print-bytes nil *uuid-namespace-dns*)) "bubba")
;; => #(238 161 16 94 54 129 17 23 153 182 123 43 95 225 243 199 6 226 80 144)
;;
;; (uuid-digest-uuid-instance 5 *uuid-namespace-dns* "bubba")
;; => #(238 161 16 94 54 129 17 23 153 182 123 43 95 225 243 199 6 226 80 144)
;;
;; (uuid-get-namespace-bytes (make-v5-uuid *uuid-namespace-dns* "bubba"))
;; #(238 161 16 94 54 129 81 23 153 182 123 43 95 225 243 199)
;;
;; (uuid-to-byte-array (make-v5-uuid *uuid-namespace-dns* "bubba"))
;; #(238 161 16 94 54 129 81 23 153 182 123 43 95 225 243 199)

;;; ==============================
;;; :PASTE 120426:
;;; :COURTESY nyef
;;; :TITLE Informing loop of integer size -- how to do it idiomatically?
;;; :SEE (URL `http://paste.lisp.org/+2KX6/1')
(defun uuid-request-integer (array offset length &key little-endian sign-extend)
  (let ((value (loop
                  for i from 0 below length
                  for octet = (aref array (+ offset
                                             (if little-endian
                                                 i
                                                 (- length i 1))))
                  sum (ash octet (* i 8)))))
    (if (and sign-extend
             (logbitp (1- (* length 8)) value))
        (logior (lognot (1- (ash 1 (1- (* length 8))))) value)
        value)))
;;
;; (uuid-request-integer (uuid-digest-uuid-instance 5 *uuid-namespace-dns* "bubba") 10 6)
;;
(define-compiler-macro uuid-request-integer (&whole form array offset length &key little-endian sign-extend)
;; :NOTE the 4 is an (unsigned-byte 32) which isn't a fixnum on x86-32
  (if (and (member length '(1 2 4)) 
           (member little-endian '(t nil))
           (member sign-extend '(t nil)))
      `(let* (,@(loop
                   for i from 0 below length
                   for var in '(byte-0 byte-1 byte-2 byte-3)
                   collect `(,var (aref ,array (+ ,offset
                                                  ,(if little-endian
                                                       i
                                                       (- length i 1))))))
              (value ,(elt '(#1=byte-0
                             #2=(dpb byte-1 (byte 8 8) #1#)
                             #3=(dpb byte-2 (byte 8 16) #2#)
                             (dpb byte-3 (byte 8 24) #3#))
                           (1- length))))
         ,(if sign-extend
              `(if (logbitp ,(1- (* length 8)) value)
                   (logior ,(lognot (1- (ash 1 (1- (* length 8))))) value)
                   value)
              'value))
      form))

;;; ==============================
;;  1) Convert the name to a canonical sequence of octets (as defined by
;;     the standards or conventions of its name space); put the name
;;     space ID in network byte order (big endian).
;;  2) Compute the hash of the name space ID concatenated with the name.
;;  3) Set octets zero through 3 of the time_low field to octets zero through 3 of the hash.
;;  4) Set octets zero and one of the time_mid field to octets 4 and 5 of the hash.
;;  5) Set octets zero and one of the time_hi_and_version field to octets 6 and 7 of the hash.
;;  6) Set the four most significant bits (bits 12 through 15) of the time_hi_and_version field 
;;     to the appropriate 4-bit version number from Section 4.1.3.
;;  7) Set the clock_seq_hi_and_reserved field to octet 8 of the hash.
;;  8) Set the two most significant bits (bits 6 and 7) of the clock_seq_hi_and_reserved
;;     to zero and one, respectively.
;;  9) Set the clock_seq_low field to octet 9 of the hash.
;; 10) Set octets zero through five of the node field to octets 10 through 15 of the hash.
;; 11) Convert the resulting UUID to local byte order.
;;; ==============================

(declaim (inline %uuid_time-low-request))
(defun %uuid_time-low-request (byte-array)
  ;; RFC4122 Section 4.3
  ;; Step three:
  ;; - Set octets zero through 3 of the time_low field to octets zero through 3 of the hash.
  (declare (type uuid-byte-array byte-array)
           (optimize (speed 3)))
  ;; (uuid-load-bytes byte-array :start 0 :end 3) ))
  ;; (uuid-load-bytes *tt--array* :start 0 :end 3) 4294967295 => 77853527
  ;; (uuid-request-integer *tt--array* 0 4)  => 77853527
  (uuid-request-integer byte-array 0 4))

(declaim (inline %uuid_time-mid-request))
(defun %uuid_time-mid-request (byte-array)
  ;; RFC4122 Section 4.3
  ;; Step four
  ;; - Set octets zero and one of the time_mid field to octets 4 and 5 of the hash.
  (declare (type uuid-byte-array byte-array)
           (optimize (speed 3)))
  (the (values uuid-ub16 &optional)
    ;; (uuid-load-bytes byte-array :start 4 :end 5)
    ;; (uuid-load-bytes  *tt--array* :start 4 :end 5) ;=> 33592
    ;; (uuid-request-integer *tt--array* 4 2) ;=> 33592
    (uuid-request-integer byte-array 4 2)))

(declaim (inline %uuid_time-high-and-version-request))
(defun %uuid_time-high-and-version-request (byte-array version)
  ;; RFC4122 Section 4.3
  ;; Step five: (occurs in the inner `uuid-load-bytes' form)
  ;; - Set octets zero and one of the time_hi_and_version field to octets 6 and 7 of the hash.
  ;; Step six: (occurs in the outer `dpb' form)
  ;; - Set the four most significant bits (bits 12 through 15) of the time_hi_and_version field 
  ;;   to the appropriate 4-bit version number from Section 4.1.3.
  ;;    Msb0  Msb1  Msb2  Msb3   Version
  ;;       0     1     0     1        5
  ;;       0     0     1     1        3
  (declare (type uuid-byte-array byte-array)
           ((mod 6) version)
           (optimize (speed 3)))
  (the uuid-ub16 
    (dpb version (byte 4 12)
         ;; (the uuid-ub16 (uuid-load-bytes byte-array :start 6 :end 7))
         ;; (the uuid-ub16 (uuid-load-bytes *tt--array* :start 6 :end 7)) => 29137
         ;; (uuid-request-integer *tt--array* 6 2) => 29137
         (the uuid-ub16 (uuid-request-integer byte-array 6 2)))))

(declaim (inline %uuid_clock-seq-and-reserved-request))
(defun %uuid_clock-seq-and-reserved-request (byte-array)
  ;; RFC4122 Section 4.3
  ;; Step seven: (occurs in the inner `uuid-load-bytes' form)
  ;; - Set the clock_seq_hi_and_reserved field to octet 8 of the hash.
  ;; Step eight: (occurs in the outer `dpb' form)
  ;; - Set the two most significant bits (bits 6 and 7) of the clock_seq_hi_and_reserved
  ;;   to zero and one, respectively. IOW, set bit 6 to 0 - Set bit 7 to 1
  (declare (type uuid-byte-array byte-array)
           (optimize (speed 3)))
  (the uuid-ub8 (dpb #b0010 (byte 2 6) (the uuid-ub8 (aref byte-array 8)))))

(declaim (inline %uuid_node-request))
(defun %uuid_clock-seq-low-request (byte-array)
  ;; RFC4122 Section 4.3
  ;; Step nine:
  ;; - Set the clock_seq_low field to octet 9 of the hash.
  (declare (type uuid-byte-array byte-array)
           (optimize (speed 3)))  
  (the uuid-ub8 (aref byte-array 9)))


(declaim (inline %uuid_node-request))
(defun %uuid_node-request (byte-array)
  ;; RFC4122 Section 4.3 step ten:
  ;; - Set octets zero through five of the node field to octets 10 through 15 of the hash.
  (declare (type uuid-byte-array byte-array)
           (optimize (speed 3)))
  ;; (uuid-load-bytes byte-array :start 10 :end 15)))
  (uuid-request-integer byte-array 10 6))

(defun format-v5-uuid (v5-digest-byte-array)
  (declare (uuid-byte-array-20 v5-digest-byte-array)
            (optimize (speed 3) (safety 1))
           ;; (optimize (speed 1) (safety 3) (debug 3))
           (inline %uuid_time-low-request
                   %uuid_time-mid-request
                   %uuid_time-high-and-version-request
                   %uuid_clock-seq-and-reserved-request
                   %uuid_node-request))
  (make-instance 'unique-universal-identifier
                 ;; :%uuid_time-low  (the uuid-ub32 (uuid-load-bytes v5-digest-byte-array :start 0 :end 3))
                 :%uuid_time-low (%uuid_time-low-request v5-digest-byte-array)
                 ;; :%uuid_time-mid (the uuid-ub16 (uuid-load-bytes v5-digest-byte-array :start 4 :end 5))
                 :%uuid_time-mid (%uuid_time-mid-request v5-digest-byte-array)
                 ;; :%uuid_time-high-and-version
                 ;; (the uuid-ub16 (dpb #b0101 (byte 4 12) (the uuid-ub16 (uuid-load-bytes v5-digest-byte-array :start 6 :end 7))))
                 :%uuid_time-high-and-version (%uuid_time-high-and-version-request v5-digest-byte-array 5)
                 ;; :%uuid_clock-seq-and-reserved (the uuid-ub8 (dpb #b0010 (byte 2 6) (the uuid-ub8 (aref v5-digest-byte-array 8))))
                 :%uuid_clock-seq-and-reserved (%uuid_clock-seq-and-reserved-request v5-digest-byte-array)
                 :%uuid_clock-seq-low (the uuid-ub8 (%uuid_clock-seq-low-request v5-digest-byte-array))
                 ;; :%uuid_node (the uuid-ub48 (uuid-load-bytes v5-digest-byte-array :start 10 :end 15))))
                 :%uuid_node (%uuid_node-request v5-digest-byte-array)))

;; (length (uuid-get-namespace-bytes *uuid-namespace-dns*))
;; 
;; (uuid-digest-uuid-instance 5 namespace name)
;; (length (uuid-digest-uuid-instance 5 *uuid-namespace-dns* "bubba")) => 20
;; (%uuid_node-request  (uuid-digest-uuid-instance 5 *uuid-namespace-dns* "bubba"))
;; (uuid-request-integer (uuid-digest-uuid-instance 5 *uuid-namespace-dns* "bubba") 10 6)
;; (make-v5-uuid *uuid-namespace-dns* "bubba") 
;; => EEA1105E-3681-5117-99B6-7B2B5FE1F3C7

(defun format-v3-uuid (v3-digest-byte-array)
  (declare (uuid-byte-array-16 v3-digest-byte-array)
           (inline %uuid_time-low-request
                   %uuid_time-mid-request
                   %uuid_time-high-and-version-request
                   %uuid_clock-seq-and-reserved-request
                   %uuid_node-request)
           (optimize (speed 3)))
  (make-instance 'unique-universal-identifier
                 ;; :%uuid_time-low (the uuid-ub32 (uuid-load-bytes v3-digest-byte-array :start 0 :end 3))
                 :%uuid_time-low (%uuid_time-low-request v3-digest-byte-array)
                 ;; :%uuid_time-mid (the uuid-ub16 (uuid-load-bytes v3-digest-byte-array :start 4 :end 5))
                 :%uuid_time-mid (%uuid_time-mid-request v3-digest-byte-array)
                 ;; :%uuid_time-high-and-version 
                 ;; (the uuid-ub16 (dpb #b0011 (byte 4 12) (the uuid-ub16 (uuid-load-bytes v3-digest-byte-array :start 6 :end 7))))
                 :%uuid_time-high-and-version (%uuid_time-high-and-version-request v3-digest-byte-array 3)
                 ;; :%uuid_clock-seq-and-reserved (the uuid-ub8 (dpb #b10 (byte 2 6) (the uuid-ub8 (aref v3-digest-byte-array 8))))
                 :%uuid_clock-seq-and-reserved (%uuid_clock-seq-and-reserved-request v3-digest-byte-array)
                 :%uuid_clock-seq-low (%uuid_clock-seq-low-request v3-digest-byte-array)
                 ;; :%uuid_node (the uuid-ub48 (uuid-load-bytes v3-digest-byte-array :start 10 :end 15))))
                 :%uuid_node (the uuid-ub48 (%uuid_node-request v3-digest-byte-array))))

(declaim (inline %verify-version-3-or-5))
(defun %verify-version-3-or-5 (version)
  (declare ((mod 6) version)
           (optimize (speed 3)  (debug 0)))
  (or (and (typep version '(unsigned-byte 3))
           (or (= version 3)
               (= version 5))
           version)
      (error "arg VERSION is not integer 3 nor 5")))

(declaim (inline %verify-digest-version))
(defun %verify-digest-version (chk-version)
  (declare ((mod 6) chk-version)
           (inline %verify-version-3-or-5)
           (optimize (speed 3)))
  (or (and (= (%verify-version-3-or-5 chk-version) 3) :md5) :sha1))

(defun format-v3or5-uuid (digest-byte-array uuid-version) 
  (declare (inline %verify-version-3-or-5)
           (uuid-byte-array digest-byte-array)
           (optimize (speed 3)))
  (let ((version-if (%verify-version-3-or-5 uuid-version)))
    (declare ((integer 3 5) version-if))
    (case version-if 
      (3 (format-v3-uuid (the uuid-byte-array-16 digest-byte-array)))
      (5 (format-v5-uuid (the uuid-byte-array-20 digest-byte-array))))))

(defun make-v3-uuid (namespace name)
  (declare (type string name)
           (unique-universal-identifier namespace)
           (optimize (speed 3)))
  (format-v3or5-uuid 
   (the uuid-byte-array-16
     (uuid-digest-uuid-instance 3 namespace name)) 3))

(defun make-v5-uuid (namespace name)
  (declare (type string name)
           (unique-universal-identifier namespace)
           (optimize (speed 3)))
  (format-v3or5-uuid (the uuid-byte-array-20 (uuid-digest-uuid-instance 5 namespace name))  5))

(defun make-v4-uuid ()
  (declare (special *uuid-random-state*))
  (let ((*random-state* (the random-state *uuid-random-state*)))
    (make-instance 'unique-universal-identifier
                   :%uuid_time-low (the uuid-ub32 (random #xffffffff))
                   :%uuid_time-mid (the uuid-ub16 (random #xffff))
                   :%uuid_time-high-and-version  (the uuid-ub16 (dpb #b0100 (byte 4 12) (ldb (byte 12 0) (random #xffff))))
                   :%uuid_clock-seq-and-reserved (the uuid-ub8 (dpb #b0010 (byte 2 6)(ldb (byte 8 0) (random #xff))))
                   :%uuid_clock-seq-low (the uuid-ub8 (random #xff))
                   :%uuid_node (the uuid-ub48 (random #xffffffffffff)))))

(defun format-uuid-as-urn (stream uuid)
  (declare (type mon:stream-or-boolean stream)
           (unique-universal-identifier uuid))
  (format stream "urn:uuid:~(~A~)" uuid))

(defun make-null-uuid ()
  (make-instance 'unique-universal-identifier))

;;; :NOTE `uuid-get-namespace-bytes' and `uuid-to-byte-array' are essentially the same.
(defun uuid-to-byte-array (uuid)
  (declare (unique-universal-identifier uuid))
  (let ((array (make-array 16 :element-type '(unsigned-byte 8))))
    (declare (uuid-byte-array-16 array))
    (with-slots (%uuid_time-low 
                 %uuid_time-mid 
                 %uuid_time-high-and-version
                 %uuid_clock-seq-and-reserved
                 %uuid_clock-seq-low %uuid_node)
        uuid
      (declare (type uuid-ub32 %uuid_time-low)
               (type uuid-ub16 %uuid_time-mid %uuid_time-high-and-version)
               (type uuid-ub8  %uuid_clock-seq-and-reserved %uuid_clock-seq-low)
               (type uuid-ub48 %uuid_node))
      (loop
         for i from 3 downto 0
         do (setf (aref array (- 3 i)) (ldb (byte 8 (* 8 i)) %uuid_time-low)))
      (loop
         for i from 5 downto 4
         do (setf (aref array i) (ldb (byte 8 (* 8 (- 5 i))) %uuid_time-mid)))
      (loop
         for i from 7 downto 6
         do (setf (aref array i) (ldb (byte 8 (* 8 (- 7 i))) %uuid_time-high-and-version)))
      (setf (aref array 8) (ldb (byte 8 0) %uuid_clock-seq-and-reserved))
      (setf (aref array 9) (ldb (byte 8 0) %uuid_clock-seq-low))
      (loop
         for i from 15 downto 10
         do (setf (aref array i) (ldb (byte 8 (* 8 (- 15 i))) %uuid_node)))
      (the uuid-byte-array-16 array))))

;; (uuid-get-namespace-bytes (make-v5-uuid *uuid-namespace-dns* "bubba"))
;; #(238 161 16 94 54 129 81 23 153 182 123 43 95 225 243 199)
;;
;; (uuid-to-byte-array (make-v5-uuid *uuid-namespace-dns* "bubba"))
;; #(238 161 16 94 54 129 81 23 153 182 123 43 95 225 243 199)

(defun uuid-from-byte-array (byte-array)
  ;; Can't declare this uuid-byte-array-16 because SHA-1s are arrays of 20 elts
  ;;
  (declare (type uuid-byte-array byte-array))
  ;; :WAS #-sbcl (assert (and (= (array-rank byte-array) 1)
  ;;           (= (array-total-size byte-array) 16))
  #-sbcl (assert (uuid-byte-array-p byte-array) (byte-array)
                 "Arg BYTE-ARRAY does not satisfy `uuid-byte-array-p'")
  (macrolet ((arr-to-bytes (from to w-array)
               "Helper macro used in `uuid-from-byte-array'."
               (declare ((mod 17) from to))
               `(loop 
                   for i from ,from to ,to
                   with res = 0
                   do (setf (ldb (byte 8 (* 8 (- ,to i))) res) (aref ,w-array i))
                   finally (return res))))
    (make-instance 'unique-universal-identifier
                   :%uuid_time-low (the uuid-ub32 (arr-to-bytes 0 3 byte-array))
                   :%uuid_time-mid (the uuid-ub16 (arr-to-bytes 4 5 byte-array))
                   :%uuid_time-high-and-version (the uuid-ub16 (arr-to-bytes 6 7 byte-array))
                   :%uuid_clock-seq-and-reserved (the uuid-ub8 (aref byte-array 8))
                   :%uuid_clock-seq-low (the uuid-ub8 (aref byte-array 9))
                   :%uuid_node (the uuid-ub48 (arr-to-bytes 10 15 byte-array)))))

(defun uuid-string-to-sha1-byte-array (string)
  (declare (type string string))
  #+mon   
  (mon:string-to-sha1-byte-array string)
  (let ((digester (ironclad:make-digest :sha1)))
    (ironclad:update-digest digester 
                            ;; :WAS (ironclad:ascii-string-to-byte-array string)
                            #+sbcl (sb-ext:string-to-octets string :external-format :UTF-8)
                            #-sbcl (flexi-streams:string-to-octets string :external-format :UTF-8))
    (ironclad:produce-digest digester)))


;;; ==============================
;;; :NOTE Everything below here is deprecated, including `uuid-digest-uuid-string'.
;;; ==============================

(defun uuid-load-bytes (byte-array &key (byte-size 8) (start 0) end)
  (declare (type uuid-byte-array byte-array)
           (optimize (speed 3)))
  (let ((ret-val 0))
    (loop 
       :for i :from start :to end
       :for pos :from (- end start) :downto 0
       :do (setf ret-val (dpb (aref  byte-array i) (byte byte-size (* pos byte-size)) ret-val)))
    ret-val))

(defun uuid-print-bytes (stream uuid)
  (declare (type unique-universal-identifier uuid)
           (optimize (speed 3)))
  (with-slots (%uuid_time-low
               %uuid_time-mid
               %uuid_time-high-and-version
               %uuid_clock-seq-and-reserved
               %uuid_clock-seq-low
               %uuid_node)
      uuid
    (declare (type uuid-ub32 %uuid_time-low)
             (type uuid-ub16 %uuid_time-mid %uuid_time-high-and-version)
             (type uuid-ub8  %uuid_clock-seq-and-reserved %uuid_clock-seq-low)
             (type uuid-ub48 %uuid_node))
    (format stream "~8,'0X~4,'0X~4,'0X~2,'0X~2,'0X~12,'0X" 
            %uuid_time-low
            %uuid_time-mid 
            %uuid_time-high-and-version
            %uuid_clock-seq-and-reserved
            %uuid_clock-seq-low
            %uuid_node)))

(declaim (inline %uuid-get-bytes-if))
(defun %uuid-get-bytes-if (chk-uuid-str)
  (or (and (uuid-hex-string-32-p chk-uuid-str)
           (the uuid-string-32 chk-uuid-str))
      (mon:simple-error-mon :w-sym '%uuid-get-bytes-if
                            :w-type 'function
                            :w-spec "arg CHK-UUID-STR not `uuid-hex-string-32-p'"
                            :w-got chk-uuid-str
                            :w-type-of t
                            :signal-or-only nil)))

(defun uuid-get-bytes (uuid-string)
  (declare (optimize (speed 3) (debug 0))
           (inline %uuid-get-bytes-if))
  (let ((uuid-str-if (%uuid-get-bytes-if uuid-string))
        (outstr (make-array 16 :element-type 'character :initial-element #\NUL :fill-pointer 0)))
    (declare (uuid-string-32 uuid-str-if)
             ((and (vector character 16) (not simple-array)) outstr))
    (with-output-to-string (out outstr)
      (loop
         with max = (- (length uuid-str-if) 2)
         for i = 0 then (+ i 2)
         as  j = (+ i 2)
         as cur-pos = (the uuid-ub8 (parse-integer (subseq uuid-str-if i j) :radix 16))
         do (format out "~A" (code-char (the uuid-ub8 cur-pos)))
         while (< i max))
      (the uuid-byte-string (make-array 16 :element-type 'character :initial-contents outstr)))))

;;; ==============================
;;; :NOTE The type signature of the arrray returned by `uuid-digest-uuid-string' differs for :MD5 vs :SHA1
;;; v5 :SHA1 returns an array of type: (simple-array (unsigned-byte 8) (20))
;;; v3 :MD5 returns  an array of type: (simple-array (unsigned-byte 8) (16))
;;
;;; :NOTE No longer using. This was specialized on the return value of:
;;;  (uuid-get-bytes (uuid-print-bytes nil *uuid-namespace-dns*))
(defun uuid-digest-uuid-string (digest-version string-uuid name)
  ;; This is step two of RFC4122 section 4.3 
  ;; -  Compute the hash of the name space ID concatenated with the name.
  (declare ((mod 6) digest-version)
   (type string name string-uuid))
  (let ((digester  (ironclad:make-digest (%verify-digest-version digest-version))))
    ;; :NOTE `mon:ascii-string-to-byte-array'
    (ironclad:update-digest digester (ironclad:ascii-string-to-byte-array string-uuid))
    (ironclad:update-digest digester 
                            ;; :WAS (ironclad:ascii-string-to-byte-array name))
                            ;; #-sbcl (trivial-utf-8:string-to-utf-8-bytes name))
                            #-sbcl (the uuid-byte-array (flexi-streams:string-to-octets name :external-format :UTF-8))
                            #+sbcl (the uuid-byte-array (sb-ext:string-to-octets name :external-format :UTF-8)))
    (the (values uuid-byte-array &optional) (ironclad:produce-digest digester))))

;; (length (uuid-get-namespace-bytes *uuid-namespace-dns*))
;; 
;; (uuid-digest-uuid-instance 5 namespace name)
;; (length (uuid-digest-uuid-instance 5 *uuid-namespace-dns* "bubba")) => 20
;; (%uuid_node-request  (uuid-digest-uuid-instance 5 *uuid-namespace-dns* "bubba"))
;; (uuid-request-integer (uuid-digest-uuid-instance 5 *uuid-namespace-dns* "bubba") 10 6)
;; (make-v5-uuid *uuid-namespace-dns* "bubba") 
;; => EEA1105E-3681-5117-99B6-7B2B5FE1F3C7
;;
;; (uuid-request-integer (uuid-digest-uuid-instance 5 *uuid-namespace-dns* "bubba") 10 6)
;; 135426222453703
;;
;; (uuid-request-integer (uuid-digest-uuid-string 5 (uuid-get-bytes (uuid-print-bytes nil *uuid-namespace-dns*)) "bubba") 10 6)
;; 135426222453703
;;
;; (uuid-load-bytes (uuid-digest-uuid-string 5 (uuid-get-bytes (uuid-print-bytes nil *uuid-namespace-dns*)) "bubba") :start 10 :end 15)
;; => 135426222453703
;;
;; (uuid-digest-uuid-instance 5 *uuid-namespace-dns* "bubba")
;; #(238 161 16 94 54 129 17 23 153 182 123 43 95 225 243 199 6 226 80 144)
;;
;; (uuid-digest-uuid-string 5 (uuid-get-bytes (uuid-print-bytes nil *uuid-namespace-dns*)) "bubba")
;; #(238 161 16 94 54 129 17 23 153 182 123 43 95 225 243 199 6 226 80 144)
;; 
;; 
;; (uuid-digest-uuid-string 5 (uuid-get-bytes (uuid-print-bytes nil *uuid-namespace-dns*)) "bubba")
;; => #(238 161 16 94 54 129 17 23 153 182 123 43 95 225 243 199 6 226 80 144)
;;
;; (uuid-digest-uuid-instance 5 *uuid-namespace-dns* "bubba")
;; => #(238 161 16 94 54 129 17 23 153 182 123 43 95 225 243 199 6 226 80 144)
;;
;; (uuid-get-namespace-bytes (make-v5-uuid *uuid-namespace-dns* "bubba"))
;; #(238 161 16 94 54 129 81 23 153 182 123 43 95 225 243 199)
;;
;; (uuid-to-byte-array (make-v5-uuid *uuid-namespace-dns* "bubba"))
;; #(238 161 16 94 54 129 81 23 153 182 123 43 95 225 243 199)
;;; ==============================


;;; ==============================
;; :DOESN'T work
;; (defun make-uuid-namespace-loadtime-vars (namespace-pairs)
;;   (loop 
;;      :for (nm . id-string)  namespace-pairs
;;      :when (uuid-hex-string-36-p id-string)
;;      :do  (setf nm (make-uuid-from-string id-string))))

;; (fundoc 'make-uuid-namespace-loadtime-vars
;; "Set values of NAMESPACE-PAIRS to UUIDs at loadtime.~%~@
;; NAMESPACE-PAIRS is a list of conses each of the form:~%
;;  \( <SYMBOL> . <UUID-HEX-STRING-36> \)~%~@
;; <SYMBOL> should be a variable or parameter in the current environment.~%~@
;; <UUID-HEX-STRING-36> should satisfy `dbc:uuid-hex-string-36-p'.~%~@
;; Value is set as if by `dbc:make-uuid-from-string'.~%~@
;; :EXAMPLE~%~@
;;  { ... <EXAMPLE> ... } ~%~@
;; :SEE-ALSO `<XREF>'.~%►►►")


;;; ==============================
;;; :UUID-TYPES-DOCUMENTATION
;;; ==============================

(typedoc 'uuid-ub48
"An object of type: \(unsigned-byte 48\)~%~@
Octets:         6
Bits:          48
Hex value:     #xFFFFFFFFFFFF, 
Decimal value: 281474976710655
Octal value:   #o7777777777777777
:Binary value: #b111111111111111111111111111111111111111111111111~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `uuid-ub48', `uuid-ub32', `uuid-ub16', `uuid-ub8'.~%►►►")

(typedoc 'uuid-ub32
"An object of type: \(unsigned-byte 32\)~%~@
Octets:         4
Bits:          32 
Hex value:     #xFFFFFFFF
Decimal value: 4294967295
Octal value:   #o37777777777
Binary value:  #b11111111111111111111111111111111~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `uuid-ub48', `uuid-ub32', `uuid-ub16', `uuid-ub8'.~%►►►")

(typedoc 'uuid-ub16
"An object of type: \(unsigned-byte 16\)~%~@
Octets:          2
Bits:           16 
Hex value:      #xFFFF
Decimal value:  65535
Octal value:    #o177777
Binary value:   #b1111111111111111~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `uuid-ub48', `uuid-ub32', `uuid-ub16', `uuid-ub8'.~%►►►")

(typedoc 'uuid-ub8
"An object of type: \(unsigned-byte 8\)~%~@
Octets:         1
Bits:           8
Hex value:      #xFF
Decimal value:  255
Octal value:    #o377
Binary value:   #b11111111~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `uuid-ub48', `uuid-ub32', `uuid-ub16', `uuid-ub8'.~%►►►")

(typedoc 'uuid-string-36
"An object with the type signature: \(array character \(32\)\)
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `dbc:uuid-byte-string', `dbc:uuid-byte-array-16', `dbc:uuid-string-32',
`dbc:uuid-string-36', `dbc:uuid-hex-string-32', `dbc:uuid-hex-string-36',
`dbc:uuid-hex-string-32-p', `dbc:uuid-hex-string-36-p',.~%►►►")

(typedoc 'uuid-string-32
"An object with the type signature: \(array character \(36\)\)~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `dbc:uuid-byte-string', `dbc:uuid-byte-array-16', `dbc:uuid-string-32',
`dbc:uuid-string-36', `dbc:uuid-hex-string-32', `dbc:uuid-hex-string-36',
`dbc:uuid-hex-string-32-p', `dbc:uuid-hex-string-36-p'.~%►►►")

(typedoc 'uuid-hex-string-36
"An object of type \(array character \(36\)\) satsfying `dbc:uuid-hex-string-36-p'.~%~@
:EXAMPLE~%~@
 (type ~%~@
 \(typep \"6ba7b810-9dad-11d1-80b4-00c04fd430c8\" 'uuid-hex-string-36\)~%
 \(typep \"6BA7B810-9DAD-11D1-80B4-00C04FD430C8\" 'uuid-hex-string-36-p\)~%~@
;; Following fails successfully:~%
 \(typep \"6BA7B810--9DAD-11D1-80B4-00C04FD430C8\ 'uuid-hex-string-36-p\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(typedoc 'uuid-hex-string-32
"An object with the type signature:~%
 \(array character \(32\)\)~%~@
And satisfies `mon:string-all-hex-char-p'.~%~@
:EXAMPLE~%
 \(typep \(uuid-print-bytes nil *uuid-namespace-dns*\) 'uuid-hex-string-32\)~%
;; Following fails successfully:~%
 \(typep \(print-object *uuid-namespace-dns* nil\) 'uuid-hex-string-32\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(typedoc 'uuid-byte-string
 "An object of with type signature: \(simple-array character \(16\)\)~%~@
:EXAMPLE~%
 \(typep \(uuid-get-bytes \(uuid-print-bytes nil *uuid-namespace-dns*\)\) 'uuid-byte-string\)~%~@
:SEE-ALSO `dbc:uuid-byte-array-16', `dbc:uuid-hex-string-36'.~%►►►")

(typedoc 'uuid-byte-array-16
 "An object which has the type signature: \(simple-array \(unsigned-byte 8\) \(16\)\)~%~@
:EXAMPLE~%
 \(typep \(uuid-to-byte-array *uuid-namespace-dns*\) 'uuid-byte-array-16\)~%~@
:SEE-ALSO `dbc:uuid-hex-string-36'.~%►►►")

(typedoc 'uuid-byte-array-20
 "An object which has the type signature: \(simple-array \(unsigned-byte 8\) \(20\)\)~%~@
:EXAMPLE~%
 \(typep \(uuid-string-to-sha1-byte-array \"bubba\"\) 'uuid-byte-array-20\)~%~@
:SEE-ALSO `dbc:uuid-hex-string-36'.~%►►►")


;;; ==============================
;;; :UUID-FUNCTIONS-DOCUMENTATION
;;; ==============================

(fundoc 'uuid-get-bytes-for-integer
"Return the number of octets required to represent UNSIGNED-INTEGER.~%~@
:EXAMPLE~%~@
 \(uuid-get-bytes-for-integer 281474976710655\)~%
 \(uuid-get-bytes-for-integer #b11111111111111111\)~%~@
;; Fails on integers larger than 48 bits:
 \(uuid-get-bytes-for-integer 281474976710656\)~%~@
:NOTE In teh following macro expansion, a 3 octet integer will return 4:~%
 \(macroexpand-1 '\(uuid-get-bytes-for-integer 0\)\)~%~@
E.g. the following integer is in the third octet:~%~@
 #b11111111111111111
    2        1      ~%
 \(typep #b11111111111111111 '\(unsigned-byte 17\)\)~%~@
However, the UUID RRC doesn't specify that any sub-value of the UUID will be 3
octet integer so we play it safe and bump that puppy up to four.~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'uuid-string-32-p
"Whether object is of type `dbc:uuid-string-32'.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'uuid-string-36-p
"Whether object is of type `dbc:uuid-string-36'.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'uuid-hex-string-36-p
"Whether MAYBE-UUID-HEX-STRING-36 is a valid string representation of a UUID.~%~@
Return T when MAYBE-UUID-HEX-STRING-36 satisfies the following constraints:~%
 - Its type is '\(array character 36\)~%
 - When split to list of strings on #\\- delimter the list is of length is 5~%
 - The length of each string in the list matches the pattern 8-4-4-4-12~%
 - each string in the list satisfies `mon:string-all-hex-char-p'~%
:EXAMPLE~% 
\(uuid-hex-string-36-p \"6ba7b810-9dad-11d1-80b4-00c04fd430c8\"\)~%
 \(uuid-hex-string-36-p \"6BA7B810-9DAD-11D1-80B4-00C04FD430C8\"\)~%~@
;; Following fails successfully:~%
 \(uuid-hex-string-36-p \"6BA7B810--9DAD-11D1-80B4-00C04FD430C8\"\)~%~@
:SEE-ALSO `dbc:uuid-hex-string-32-p', `dbc:uuid-hex-string-32'
`mon:split-string-on-chars'.~%►►►")

(fundoc 'uuid-hex-string-32-p
"Whether object is of type `dbc:uuid-hex-string-32'.~%~@
Return T when object has the type signature:~%
 \(array character \(32\)\)~%~@
and satisfies `mon:string-all-hex-char-p'.~%~@
:EXAMPLE~%
 \(uuid-hex-string-32-p \(uuid-print-bytes nil *uuid-namespace-dns*\)\)~%
;; Following fails successfully:~%
 \(uuid-hex-string-32-p \(print-object *uuid-namespace-dns* nil\)\)~%~@
:SEE-ALSO `dbc:uuid-hex-string-36', `dbc:uuid-hex-string-36-p'.~%►►►")

(fundoc 'uuid-byte-array-16-p
"Wheter MAYBE-UUID-BYTE-ARRAY-16 is of type `dbc:uuid-byte-array-16'.~%~@
Return T when MAYBE-UUID-BYTE-ARRAY-16 has the type signature:~%
 \(simple-array \(unsigned-byte 8\) \(16\)\)~%~@
:EXAMPLE~%~@
 \(uuid-byte-array-16-p \(uuid-to-byte-array *uuid-namespace-dns*\)\)~%~@
:SEE-ALSO `dbc:uuid-hex-string-36', `dbc:uuid-hex-string-36-p'.~%►►►")

(fundoc 'uuid-byte-array-20-p
"Wheter MAYBE-UUID-BYTE-ARRAY-16 is of type `dbc:uuid-byte-array-20'.~%~@
Return T when MAYBE-UUID-BYTE-ARRAY-16 has the type signature:~%
 \(simple-array \(unsigned-byte 8\) \(20\)\)~%~@
:EXAMPLE~%
 \(uuid-byte-array-20-p \(uuid-string-to-sha1-byte-array \"bubba\"\)\)~%~@
:SEE-ALSO `dbc:uuid-hex-string-36', `dbc:uuid-hex-string-36-p'.~%►►►")

(fundoc 'uuid-byte-string-p
"Whether object is of type `dbc:uuid-byte-string'.~%~@
Return T when object has the type signature:~%
 \(simple-array character \(16\)\)~%~@
:EXAMPLE~%
 \(uuid-byte-string-p \(uuid-get-bytes \(uuid-print-bytes nil *uuid-namespace-dns*\)\)\)~%~@
:SEE-ALSO `dbc:uuid-hex-string-36-p', `dbc:uuid-byte-array-16-p'.~%►►►")

(fundoc 'make-uuid-from-string-if
"Helper function for `dbc:make-uuid-from-string'.~%~@
If UUID-HEX-STRING-36-IF satisfies `uuid-hex-string-36-p' return it.
If the constraint fails signal a `mon:simple-error-mon' condition.~%~@
:EXAMPLE~%~@
 \(make-uuid-from-string-if \"6ba7b810-9dad-11d1-80b4-00c04fd430c8\"\)~%
 \(make-uuid-from-string-if \"6ba7b810-9dad--11d1-80b4-00c04fd430c8\"\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

;; (fundoc 'unique-universal-identifier-p
;; "Whether MAYBE-UUID-INSTANCE is a unique-universal-identifier.
;; Return T when argument is an instace of the class
;; `dbc:unique-universal-identifier' or one of its subclasses.~%~@
;; :EXAMPLE~%
;;  \(unique-universal-identifier-p *uuid-namespace-dns*\)
;;  \(unique-universal-identifier-p t\)~%~@
;; :SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'uuid-princ-to-string
            "Return string representation fo UUID-INSTANCE as if by `cl:princ-to-string'.~%~@
UUID-INSTANCE should satisfy `unique-universal-identifier-p', an error is
signaled if not~%~@
:EXAMPLE~%~@
 \(uuid-princ-to-string *uuid-namespace-dns*\)
 \(uuid-princ-to-string t\)
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'serialize-uuid
"Serialize UUID to STREAM.~%~@
Bytes of UUID are written to STREAM.~%~@
Stream should have an :element-type '\(unsigned-byte 8\).~%~@
:EXAMPLE~%~@
 \(let \(\(file \(make-pathname :directory '\(:absolute \"tmp\"\)
                            :name \"temp-bytes\"\)\)
       \(w-uuid \(make-v5-uuid *uuid-namespace-dns* \"bubba\"\)\)
       \(gthr '\(\)\)\)
   \(with-open-file \(s file
                      :if-exists :supersede
                      :if-does-not-exist :create
                      :direction :output
                      :element-type 'uuid-ub8)
     \(serialize-uuid w-uuid s\)\)
  ;; :NOTE basis for deserializing to file \(defun deserialize-uuid \(file\) ;
   \(with-open-file \(stream file :element-type 'uuid-ub8\)
     \(do \(\(code \(read-byte stream nil :eof\) \(read-byte stream nil :eof\)\)\)
         \(\(eql code :eof\)\)
       \(push code gthr\)\)\)
   \(and gthr
        \(setf gthr \(uuid-from-byte-array \(make-array 16
                                                     :element-type 'uuid-ub8
                                                     :initial-contents \(nreverse gthr\)\)\)\)\)
   \(unwind-protect 
        \(list \(uuid-eql w-uuid gthr\)
              gthr
              w-uuid\)
     \(delete-file file\)\)\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc '%verify-slot-boundp-and-type
"Check that VERIFY-UUID has all slots `cl:slot-boundp' and of the correct type.~%~@
Signal either a `cl:simple-condition or' `cl:type-error' error if not.~%~@
Helper function for `uuid-copy-uuid'
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'uuid-copy-uuid
"Copy slot-value's of UUID-INSTANCE to new instance and return new instance.~%~@
UUID-INSTANCE should satisfy `unique-universal-identifier-p', an error is
signaled if not.~%~@
:EXAMPLE~%~@
 \(let \(\(uuid-copy \(uuid-copy-uuid *uuid-namespace-dns*\)\)\)
    \(not \(or \(eq uuid-copy *uuid-namespace-dns*\)
             \(eql uuid-copy *uuid-namespace-dns*\)
             \(equal uuid-copy *uuid-namespace-dns*\)
             \(equalp uuid-copy *uuid-namespace-dns*\)\)\)\)~%~@

:NOTE The base slot-values of an instance of `unique-universal-identifier' class
are constants and satisfy `cl:constantp':~%
 \(constantp \(slot-value *uuid-namespace-dns* '%uuid_time-low\)\)~%~@
Therefor, the newly returned copy will not share mutable structure with
its source UUID-INSTANCE.~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'make-uuid-from-string 
 "Create an instance of unique-universal-identifier class from UUID-OR-HEX-STRING-36.~%~@
UUID string should satisfy one of `dbc:unique-universal-identifier-p' or
`dbc:uuid-hex-string-36-p', an error is signaled if not.~%~@
:EXAMPLE~%
 \(make-uuid-from-string \"6ba7b810-9dad-11d1-80b4-00c04fd430c8\"\)~%
 \(make-uuid-from-string *uuid-namespace-dns*\)~%
 \(make-uuid-from-string \(uuid-princ-to-string *uuid-namespace-dns*\)\)~%
 \(equal \(make-uuid-from-string *uuid-namespace-dns*\)
        \(make-uuid-from-string \(uuid-princ-to-string *uuid-namespace-dns*\)\)\)~%~@
;; :Following successfully signals an error:~%
 \(make-uuid-from-string \"Q6ba7b810-9dad-11d1-80b4-00c04fd430c8\"\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'uuid-load-bytes
 "Helper function.~%~@
Load as if by `cl:dpb' the bytes of BYTE-ARRAY.~%~@
Return bytes set as integer values.~%~@
keyword BYTE-SIZE is a byte width to set. Default is 8.~%~@
keyword START is the position in BYTE-ARRAY to begin setting bytes from. Default is 0.~%~@
END is the position to stop setting bytes.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc '%verify-version-3-or-5
"Verify that arg VERSION is either the integer 3 or 5.~%~@
Signal an error if not.
Helper function for `dbc:format-v3or5-uuid'.~%~@
:EXAMPLE~%~@
  \(%verify-version-3-or-5 3\)~%
  \(%verify-version-3-or-5 5\)~%~@
;; Following fails successfully:~%
  \(%verify-version-3-or-5 6\)~%~@
:SEE-ALSO `dbc:%verify-digest-version'.~%►►►")

(fundoc '%verify-digest-version
"Return one of the symbols :MD5 or :SHA1 depending on value of CHK-VERSION.
When CHK-VERSION is 3 return :MD5~%~@
When CHK-VERSION is 5 return :SHA1~%~@
CHK-VERSION should satisfy `dbc:%verify-version-3-or-5', an error is signaled if not. ~%~@
Helper function for `dbc:uuid-digest-uuid-string'~%~@
:EXAMPLE~%
  \(%verify-digest-version 3\)~%
  \(%verify-digest-version 5\)~%
;; Following fails successfully:~%
  \(%verify-digest-version 6\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

;; should satisfy `mon:open-stream-output-stream-p'.~%~@
(fundoc 'uuid-print-bytes
"Print the raw bytes of UUID in hexadecimal format to STREAM.~%~@
UUID is an instance of `unique-universal-identifier' class.~%~@
STREAM is an output-stream.
Output of returned has the format:~%
 6ba7b8109dad11d180b400c04fd430c8~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'format-v3or5-uuid
"Helper function to format UUIDv3 and UUIDv5 hashes according to UUID-VERSION.~%~@
DIGEST-BYTE-ARRAY is an argument suitable as the BYTE-ARRAY arg to `dbc:uuid-load-bytes'.~%~@
DIGEST-BYTE-ARRAY is as per the the return value of `dbc:format-v3or5-uuid'
UUID-VERSION should satisfy `dbc::%verify-version-3-or-5', an error is signaled if not.~%~@
:NOTE Here the term \"formatting\" means setting the appropriate version bytes.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'uuid-get-bytes
            "Convert UUID-STRING to a string of characters.~%~@
UUID-STRING is a is a string as returned by `dbc:uuid-print-bytes'.~%~@
Return value is constructed from the `cl:code-char' of each number in UUID-STRING.~%~@
Return value has is of type `dbc:uuid-byte-string' with the type signature:~%
 \(simple-array character \(16\)\)~%~@
And will satisfy the predicate `dbc:uuid-byte-string-p'.~%~@
Helper function for `make-v3-uuid' and `make-v5-uuid'.~%~@
:EXAMPLE~%
 \(uuid-get-bytes 
  \(uuid-print-bytes nil \(make-uuid-from-string \"6ba7b810-9dad-11d1-80b4-00c04fd430c8\"\)\)\)~%
\(uuid-get-bytes \"5E320838715730398383652D96705A7D\"\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc '%uuid-get-bytes-if
"Helper function for `dbc:uuid-get-bytes'.~%~@
Verify that arg CHK-UUID-STR is of type `dbc:uuid-hex-string-32'.~%~@
Signal an error if not.~%~@
:EXAMPLE~%~@
 \(%uuid-get-bytes-if \"6ba7b8109dad11d180b400c04fd430c8\"\)~%
 \(%uuid-get-bytes-if \"6BA7B8109DAD11D180B400C04FD430C8\"\)~%
 \(%uuid-get-bytes-if \"6ba7b8109dad11d180b400c04fd430c8-Q\"\)~%~@
:SEE-ALSO `dbc:uuid-hex-string-32-p'.~%►►►")

;; return value has type signature: (SIMPLE-ARRAY (UNSIGNED-BYTE 8) (16))

(fundoc 'uuid-digest-uuid-string
  "Helper function producing an ironclad digest.~%~@
Reutrn value is an object of type `dbc:uuid-byte-array-16' and will satisfy the
precicate `dbc:uuid-byte-array-16-p'.~%~@
DIGEST-VERSION is a symbol suitable for uase as an argument to
`ironclad:make-digest'. It is is either :MD5 or :SHA1, and should satisfy
`dbc::%verify-digest-version' an error is signaled if not.~%~@
UUID is an instance of unique-universal-identifier class.
Used for the generation of UUIDv3 and UUIDv5 UUID by `dbc:make-v5-uuid' and `dbc:make-v3-uuid'.
:EXAMPLE~%~@
 \(uuid-digest-uuid-string 5 \(uuid-get-bytes \(uuid-print-bytes nil *uuid-namespace-dns*\)\) \"bubba\"\)
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'make-v4-uuid
  "Generate a version 4 (random) UUID.~%~@
Return value is an instance of the UNIQUE-UNIVERSAL-IDENTIFIER class.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `dbc:*uuid-random-state*', `cl:random'.~%►►►")

(fundoc 'make-v3-uuid
"Generate a version 3 (named based MD5) UUID for NAME in NAMESPACE.~%~@
Return value is an instance of the UNIQUE-UNIVERSAL-IDENTIFIER class.
NAMESPACE is a UUID namespace object.
NAME is a string.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'make-v5-uuid
  "Generates a UUID-v5 (SHA1) with NAME in NAMESPACE.~%~@
Return value is an instance of the UNIQUE-UNIVERSAL-IDENTIFIER class.~%~@
NAMESPACE is a UUID namespace object.~%~@
NAME is a string.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'format-uuid-as-urn
  "Print UUID as a URN \(Universal Resource Name\) to STREAM.~%~@
Return value has the format:
 urn:uuid:<UUID>
UUID is an instance of `unique-universal-identifier' class.~%~@
STREAM is an output-stream~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'make-null-uuid
"Generate a NULL UUID.~%~@
Return value is an instance of `dbc:unique-universal-identifier' with all slots defaulted to 0.~%~@
Return value has the format:
 00000000-0000-0000-0000-000000000000
:EXAMPLE~%
 \(make-null-uuid\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'uuid-number-to-byte-array
        "Return NUMBER as if by `cl:values' a byte-array and the count of its elements.~%~@
byte-array is in big-endian format with LSB as first elt and MSB as last elt.~%~@
:EXAMPLE~%~@
 \(slot-value *uuid-namespace-dns* '%uuid_node\)
 => 825973027016~%
 \(uuid-number-to-byte-array \(slot-value *uuid-namespace-dns* '%uuid_node\)\)
 => #\(192 79 212 48 200\)
      LSB...........MSB~%
 (elt #(192 79 212 48 200) 4) => MSB~%
 (elt #(192 79 212 48 200) 0) => LSB~%
 (uuid-request-integer (uuid-number-to-byte-array 825973027016) 0 5)~%
 => 825973027016~%~@
;; Roundtrip it:~%
 (multiple-value-bind (ba len) (uuid-number-to-byte-array 825973027016)
   (uuid-request-integer ba 0 len))
 => 825973027016~%~@
;; Verify it works on 3 octet numbers:
 \(let \(\(rnd-trip-17 #x1FFFF\)
       \(rslt nil\)\)
   \(setf rslt
         \(multiple-value-bind \(arr len\) \(uuid-number-to-byte-array rnd-trip-17\)
           \(request-integer  arr 0 len\)\)\)
   \(setf rslt `\(,\(eql rnd-trip-17 rslt\) ,rslt\)\)\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'uuid-from-byte-array
 "Convert BYTE-ARRAY to a UUID.~%~@
Return value is an instance of the UNIQUE-UNIVERSAL-IDENTIFIER class.~%~@
BYTE-ARRAY is a byte-array as returned by `dbc:uuid-to-byte-array' it should be of
type `dbc:uuid-to-byte-array' and satisfy the predicate
`dbc:uuid-to-byte-array-p':~%
:EXAMPLE~%~@
 \(uuid-from-byte-array \(uuid-to-byte-array \(make-uuid-from-string \"6ba7b814-9dad-11d1-80b4-00c04fd430c8\"\)\)\)
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'uuid-to-byte-array
  "Convert UUID to a byte-array.~%~@
Arg UUID should be an instance of the UNIQUE-UNIVERSAL-IDENTIFIER class.~%~@
Return value is an array of type `dbc:uuid-byte-array-16' with the type signature:~%
 \(simple-array \(unsigned-byte 8\) \(16\)\)~%~@
It will satisfy the predicate `dbc:uuid-byte-array-16-p'.
:EXAMPLE~%~@
 \(uuid-to-byte-array *uuid-namespace-dns*\)~%~@
:SEE-ALSO `dbc:uuid-from-byte-array'.~%►►►")

(fundoc 'uuid-request-integer
  "Decode an integer of LENGTH octets from ARRAY starting at OFFSET.~%~@
The number represented by BYTE-ARRAY may be any positive integer representable
in 48 bits.~%~@
The OFFSET is effectively :start and 
LENGTH is :end where :end => \(+ offset length\)
x86-32 OSs are LITTLE-ENDIAN but network-byte-order is big-endian...~%~@
:EXAMPLE~%~@
  \(uuid-request-integer \(uuid-number-to-byte-array 281474976710654\) 0 6\)~%
:SEE-ALSO `<XREF>'.~%►►►")

(fundoc 'uuid-string-to-sha1-byte-array
"Return string as a SHA1 byte-array as if by `ironclad:make-digest'.~%~@
Arg STRING is a string and may contain UTF-8 characters.~%~@
:EXAMPLE~%
 \(let \(\(target-str \(mon-test:make-random-string 16\)\)\)
   \(values \(string-to-sha1-byte-array target-str\) target-str\)\)~@
:NOTE we can compare the output of `string-to-sha1-byte-array' with output
Emacs lisp' `sha1-binary':
 CL>  \(string-to-sha1-byte-array \"bubba\"\)
        => #\(32 193 148 189 4 164 89 163 52 78 106 202 121 61 200 118 132 25 134 11\)
 elisp> \(vconcat \(sha1-binary \"bubba\"\)\)
         => [32 193 148 189 4 164 89 163 52 78 106 202 121 61 200 118 132 25 134 11]~%~@
:SEE-ALSO `<XREF>'.~%►►►")


;;; ==============================
;;; UNUSED-FROM-ORIGINAL-UUID
;;; ==============================
;;
;; :WAS The convoluted print-bytes/get-bytes route
;; (defun make-v3-uuid (namespace name)
;;   (declare (type string name)
;;            (unique-universal-identifier namespace)
;;            (optimize (speed 3)))
;;   ;;;; (format-v3or5-uuid (uuid-digest-uuid-string 3 (uuid-get-bytes (uuid-print-bytes nil namespace)) name) 3))
;;    (format-v3or5-uuid
;;     (the uuid-byte-array-16    
;;       (uuid-digest-uuid-string 3 
;;         (the uuid-byte-string 
;;           (uuid-get-bytes 
;;            (the uuid-string-32
;;              (uuid-print-bytes nil namespace)))) name)) 3))
;;
;; :WAS The convoluted print-bytes/get-bytes route
;; (defun make-v5-uuid (namespace name)
;;   (declare (type string name)
;;            (unique-universal-identifier namespace)
;;            (optimize (speed 3)))
;;   ;; (format-v3or5-uuid (uuid-digest-uuid-string  5 (uuid-get-bytes (uuid-print-bytes nil namespace)) name) 5))
;;   (format-v3or5-uuid
;;    (the uuid-byte-array-20
;;      (uuid-digest-uuid-string 5
;;        (the uuid-byte-string 
;;          (uuid-get-bytes 
;;           (the uuid-string-32
;;             (uuid-print-bytes nil namespace)))) name)) 5)
;;
;;
;; (defun uuid-number-to-byte-array (num)
;;   (declare ((integer 0 *) num))
;;   (if (zerop num)
;;       (values (make-array 1 :element-type 'uuid-ub8 :initial-contents (list 0)) 1)
;;       (loop
;;          :with type-cnt = (uuid-get-bytes-for-integer num)
;;          :for val = num :then (ash val -8)
;;          :for count :from 0 below type-cnt 
;;          ;; Knock down all 1 bits above 255 to 0 ;; #XFF -> 255
;;          :collect (logand val #XFF) :into bits
;;          :finally (return (values (make-array count 
;;                                               :element-type 'uuid-ub8 
;;                                               :initial-contents  (nreverse bits))
;;                                   count)))))
;;; ==============================
;; (defmacro arr-to-bytes (from to array)
;;   "Helper macro used in `uuid-from-byte-array'."
;;   `(loop for i from ,from to ,to
;; 	 with res = 0
;; 	 do (setf (ldb (byte 8 (* 8 (- ,to i))) res) (aref ,array i))
;; 	 finally (return res)))
;;
;;; :TESTING use of `macrolet'
;; (defun arr-to-bytes-mlet (array)
;;   (macrolet ((arr-to-bytes (from to w-array)
;;                (declare ((mod 17) from to))
;;                `(loop 
;;                    for i from ,from to ,to
;;                    with res = 0
;;                    do (setf (ldb (byte 8 (* 8 (- ,to i))) res) (aref ,w-array i))
;;                    finally (return res))))
;;     (arr-to-bytes 0 3 array )))
;;; ==============================


;;; ==============================
;; ;; :NOTE The variables `*clock-seq*', `*node*', `*ticks-per-count*' are not
;; ;; needed b/c we don't use `make-v1-uuid'
;; (defvar *clock-seq* 0 
;;   "Holds the clock sequence. Is is set when a version 1 uuid is 
;;   generated for the first time and remains unchanged during a whole session.")
;;
;; (defvar *node* nil 
;;   "Holds the IEEE 802 MAC address or a random number when such is not available")
;;
;; (defvar *ticks-per-count* 1024 
;;   "Holds the amount of ticks per count.
;;  The ticks per count determine the number of possible version 1 uuids created for
;;  one time interval.
;;  Common Lisp provides INTERNAL-TIME-UNITS-PER-SECOND which gives the ticks per
;;  count for the current system so *ticks-per-count* can be set to
;;  INTERNAL-TIME-UNITS-PER-SECOND")
;;
;; ;; :NOTE `get-node-id' not needed b/c we don't use `make-v1-uuid'
;; (defun get-node-id ()
;;   "Get MAC address of first ethernet device"
;;   (let ((node
;;          #+(and :linux (or :cmu :sbcl :allegro))
;; 	 ;; todo this can be simplified a bit ;
;;          (let ((proc #+(and :linux :cmu)
;;                      (ext:run-program "/sbin/ifconfig"
;;                                       nil
;;                                       :pty nil 
;;                                       :wait t 
;;                                       :output :stream 
;;                                       :error t
;;                                       :if-error-exists nil)
;;                      #+(and :linux :sbcl)
;;                      (sb-ext:run-program "/sbin/ifconfig" 
;;                                          nil
;;                                          :output :stream
;;                                          :error t
;;                                          :if-error-exists nil
;;                                          :wait nil)
;;                      #+(and :linux :allegro)
;;                      (excl:run-shell-command "/sbin/ifconfig" 
;;                                              :output :stream
;;                                              :if-error-output-exists t
;;                                              :wait nil)))
;;            (prog1
;;                (loop for line = (read-line #+(and :linux :cmu)
;;                                            (extensions:process-output proc) 
;;                                            #+(and :linux :sbcl)
;;                                            (sb-ext:process-output proc)
;;                                            #+(and :linux :allegro)
;;                                            proc
;;                                            nil) 
;;                   while line 
;;                   when (search "HWaddr" line :test #'string-equal)
;;                   return (parse-integer (remove #\: (subseq line 38))
;;                                         :radix 16))
;;              #+(and :linux :allegro)
;;              (sys:reap-os-subprocess)))
;;
;;          #+(and :windows :clisp)
;;          (let ((output (ext:run-program "ipconfig" 
;;                                         :arguments (list "/all")
;;                                         :input nil
;;                                         :output :stream
;;                                         :wait t)))
;;            (loop for line = (read-line output nil) while line 
;;               when (search "Physical" line :test #'string-equal)
;;               return (parse-integer (remove #\- (subseq line 37)) :radix 16)))
;;          ))
;;     (when (not node)
;;       (setf node (dpb #b01 (byte 8 0) (random #xffffffffffff))))
;;     node))
;;
;; ;; :NOTE `get-timestamp' not needed when not using `make-v1-uuid'
;; (let ((uuids-this-tick 0)
;;       (last-time 0))
;;   (defun get-timestamp ()
;;     "Get timestamp, compensate nanoseconds intervals"
;;     (tagbody 
;;      restart
;;        (let ((time-now (+ (* (get-universal-time) 10000000) 100103040000000000)))
;;  					;10010304000 is time between 1582-10-15 and 1900-01-01 in seconds
;;          (cond ((not (= last-time time-now))
;;                 (setf uuids-this-tick 0
;;                       last-time time-now)
;;                 (return-from get-timestamp time-now))
;;                (T 
;;                 (cond ((< uuids-this-tick *ticks-per-count*)
;;                        (incf uuids-this-tick)
;;                        (return-from get-timestamp (+ time-now uuids-this-tick)))
;;                       (T
;;                        (sleep 0.0001)
;;                        (go restart)))))))))
;;
;; (defun make-v1-uuid ()
;;   "Generates a version 1 (time-based) uuid."
;;   (let ((timestamp (get-timestamp)))
;;     (when (zerop *clock-seq*)
;;       ;;  :WAS (setf *clock-seq* (random 10000 )))
;;       (setf *clock-seq* (random 10000 *uuid-random-state*)))
;;     (unless *node*
;;       (setf *node* (get-node-id)))
;;     (make-instance 'unique-universal-identifier
;;                    :%uuid_time-low (ldb (byte 32 0) timestamp)
;;                    :%uuid_time-mid (ldb (byte 16 32) timestamp)
;;                    :%uuid_time-high-and-version (dpb #b0001 (byte 4 12) (ldb (byte 12 48) timestamp))
;;                    :%uuid_clock-seq-and-reserved (dpb #b10 (byte 2 6) (ldb (byte 6 8) *clock-seq*))
;;                    :%uuid_clock-seq-low (ldb (byte 8 0) *clock-seq*) 
;;                    :%uuid_node *node*)))
;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:


;;; ==============================
;;; EOF
