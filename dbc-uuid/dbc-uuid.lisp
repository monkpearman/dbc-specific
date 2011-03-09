
;;;; Author Boian Tzonev <boiantz@gmail.com>
;;;; 2007, All Rights Reserved 
;;;;
;;;; This software may be distributed and used according to the terms of the
;;;; Lisp Lesser GNU Public License (LLGPL)
;;;; (URL `http://opensource.franz.com/preamble.html').
;;;;
;;;; (URL `http://www.ietf.org/rfc/rfc4122.txt')

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
;;; - `digest-uuid' now uses `%verify-digest-version' instead of checking its
;;;    DIGEST-VERSION arg directly. Per `%verify-digest-version' reliance on
;;;    `%verify-version-3-or-5' when `digest-uuid's DIGEST-VERSION arg is
;;;    neither 3 or 5 an error is signalled.
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
;;;    `+namespace-dns+'    -> `*uuid-namespace-dns-default*' 
;;;    `+namespace-url+'    -> `*uuid-namespace-url-default*' 
;;;    `+namespace-oid+'    -> `*uuid-namespace-oid-default*' 
;;;    `+namespace-x500+'   -> `*uuid-namespace-x500-default*'
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
;;;   `uuid-string-p'
;;;   `*uuid-random-state*'
;;;
;;; :UNUSED 
;;; `*clock-seq*',  `*node*', `*ticks-per-count*', 
;;; `get-timestamp', `get-node-id', `make-v1-uuid', `arr-to-bytes',
;;; 
;;; ==============================

;;; ==============================


(in-package #:dbc)
;; *package*

(deftype uuid-string ()
  '(and (array character (36)) (satsifies uuid-string-p)))

(defun uuid-string-p (maybe-uuid-string)
  (when (typep maybe-uuid-string '(array character (36)))
    (let ((spilt-uuid (mon:string-split-on-chars (the string maybe-uuid-string) #\-)))
      (and (= (length spilt-uuid) 5)
           (equal (map 'list #'length spilt-uuid) (list 8 4 4 4 12))
           (loop
              :for chk-hex :in spilt-uuid
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
;;; 
;;
;; :TODO Add slot level documentation corresponding to the the RFC.
(defclass unique-universal-identifier ()
  ((%uuid_time-low 
      :initarg :%uuid_time-low
      :initform 0
      ;; :accessor %uuid_time-low
      :documentation
      #.(format nil "A 4 octet value.~%~@
                     Occurs as the 0 element in a UUID string delimited by #\\-.~%~@
                     Its string representation is 8 characters."))
     (%uuid_time-mid
      :initarg :%uuid_time-mid
      :initform 0 
      ;; :accessor %uuid_time-mid
      :documentation
      #.(format nil "A 2 octet value.~%~@
                     Occurs as the 1 element in a UUID string delimited by #\\-.~%~@
                     Its string representation is 4 hexadecimal characters."))
     (%uuid_time-high-and-version
      :initarg :%uuid_time-high-and-version
      :initform 0
      ;; :accessor %uuid_time-high
      :documentation
      #.(format nil "A 2 octet value.~%~@
                     Occurs as the 2 element in a UUID string delimited by #\\-.~%
                     Its string representation is 4 hexadecimal characters."))
     (%uuid_clock-seq-and-reserved
      :initarg :%uuid_clock-seq-and-reserved
      :initform 0
      ;; :accessor %uuid_clock-seq-var
      :documentation
      #.(format nil "An octet.~%~@
                     Occurs in the upper portion of the 3 element in a UUID string delimited by #\\-.~%~@
                     Its string representation is 2 hexadecimal characters."))
     (%uuid_clock-seq-low
      :initarg :%uuid_clock-seq-low
      :initform 0
      ;; :accessor %uuid_clock-seq-low
      :documentation
      #.(format nil "An octet.~%~@
                     Occurs in the lower portion of the 3 element in a UUID string delimited by #\\-.~%~@
                     Its string representation is 2 hexadecimal characters."))
     (%uuid_node
      :initarg :%uuid_node
      :initform 0
      ;; :accessor %uuid_node
      :documentation 
      #.(format nil "A 3 octet value. Its string representation is 6 hexadecimal characters.")))
  (:documentation
     #.(format nil "Representation of an UUID.~%~@
                    The string representation of A UUID has the format:~%~%~4T
                                         clock-seq-and-reserved~4T
                               time-mid  | cloc-seq-low~4T
                               |         | |~4T
                      6ba7b810-9dad-11d1-80b4-00c04fd430c8~4T
                      |            |          |~4T
                      ` time-low   |          ` node~4T
                                   ` time-high-and-version~%~@
                    Each field is treated as an integer and has its value printed as a zero-filled~%~@
                    hexadecimal digit string with the most significant digit first.")))

(defun make-uuid-from-string-if (uuid-string-if)
  (or (and (uuid-string-p uuid-string-if) 
           (the (array character (36)) uuid-string-if))
      (mon:simple-error-mon :w-sym  'make-uuid-from-string 
                            :w-type 'function
                            :w-spec "Arg UUID-STRING-IF not `uuid-string-p'"
                            :w-got uuid-string-if
                            :w-type-of t
                            :signal-or-only nil)))

(defun make-uuid-from-string (uuid-string)
  (let ((chk-uuid-str (make-uuid-from-string-if uuid-string)))
    (declare ((array character (36)) chk-uuid-str))
    (make-instance 'unique-universal-identifier
                   :%uuid_time-low (parse-integer chk-uuid-str :start 0 :end 8 :radix 16)
                   :%uuid_time-mid (parse-integer chk-uuid-str :start 9 :end 13 :radix 16)
                   :%uuid_time-high-and-version (parse-integer chk-uuid-str :start 14 :end 18 :radix 16)
                   :%uuid_clock-seq-and-reserved (parse-integer chk-uuid-str :start 19 :end 21 :radix 16)
                   :%uuid_clock-seq-low (parse-integer chk-uuid-str :start 21 :end 23 :radix 16)
                   :%uuid_node (parse-integer chk-uuid-str :start 24 :end 36 :radix 16))))

;; ) ;; :CLOSE eval-when


(defmethod print-object ((id unique-universal-identifier) stream)
  ;;  "Print UNIQUE-UNIVERSAL-IDENTIFIER ID to to STREAM in string represenatation.
  ;;  (example string 6ba7b810-9dad-11d1-80b4-00c04fd430c8)"
  (with-slots (%uuid_time-low 
               %uuid_time-mid
               %uuid_time-high-and-version
               %uuid_clock-seq-and-reserved
               %uuid_clock-seq-low
               %uuid_node)
      id
    (format stream "~8,'0X-~4,'0X-~4,'0X-~2,'0X~2,'0X-~12,'0X" 
            %uuid_time-low 
            %uuid_time-mid 
            %uuid_time-high-and-version
            %uuid_clock-seq-and-reserved
            %uuid_clock-seq-low
            %uuid_node)))
	    
(defun uuid-load-bytes (byte-array &key (byte-size 8) (start 0) end)
  (let ((ret-val 0))
    (loop 
       :for i :from start :to end
       :for pos :from (- end start) :downto 0
       :do (setf ret-val (dpb (aref byte-array i) (byte byte-size (* pos byte-size)) ret-val)))
    ret-val))

;; (declaim (inline %verify-version-3-or-5))
(defun %verify-version-3-or-5 (version)
  ;; (%verify-version-3-or-5 3) 
  (declare ((mod 6) version)
           (optimize (speed 3)  (debug 0)))
  (or (and (typep version '(unsigned-byte 3))
           (or (= version 3)
               (= version 5))
           version)
      (error "arg VERSION is not integer 3 nor 5")))

;; (declaim (inline %verify-digest-version))
(defun %verify-digest-version (chk-version)
  (declare ((mod 6) chk-version)
           (optimize (speed 3) (debug 0)))
  (or (and (= (%verify-version-3-or-5 chk-version) 3) :md5) :sha1))

(defun format-v3or5-uuid (hash uuid-version)
  (let ((version-if (%verify-version-3-or-5 uuid-version)))
    (declare ((mod 6) version-if))
    (make-instance 'unique-universal-identifier
		   :%uuid_time-low (uuid-load-bytes hash :start 0 :end 3)
		   :%uuid_time-mid (uuid-load-bytes hash :start 4 :end 5)
                   :%uuid_time-high-and-version  (dpb version-if (byte 4 12) (uuid-load-bytes hash :start 6 :end 7))
		   :%uuid_clock-seq-and-reserved (dpb #b10 (byte 2 6) (aref hash 8))
		   :%uuid_clock-seq-low (aref hash 9)
		   :%uuid_node (uuid-load-bytes hash :start 10 :end 15))))

(defun uuid-print-bytes (stream uuid)
  ;; :NOTE Incorporate following??? :
  ;; (mon:open-stream-output-stream-p stream :allow-booleans t :w-error t)
  (declare (type mon:stream-or-boolean stream))
  ;; (unique-universal-identifier uuid))
  (with-slots (%uuid_time-low
               %uuid_time-mid
               %uuid_time-high-and-version
               %uuid_clock-seq-and-reserved
               %uuid_clock-seq-low
               %uuid_node)
      uuid
    (format stream "~8,'0X~4,'0X~4,'0X~2,'0X~2,'0X~12,'0X" 
            %uuid_time-low
            %uuid_time-mid 
            %uuid_time-high-and-version
            %uuid_clock-seq-and-reserved
            %uuid_clock-seq-low
            %uuid_node)))

(defun %uuid-get-bytes-if (chk-uuid-str)
  (or (and (typep chk-uuid-str '(array character (32)))
           (mon:string-all-hex-char-p (the string chk-uuid-str))
           (the (array character (32)) chk-uuid-str))
      (mon:simple-error-mon :w-sym '%uuid-get-bytes-if
                            :w-type 'function
                            :w-spec "arg CHK-UUID-STR either not of type:~%  ~
                                     '(array character (32))~%~
                                     Or, failed to satisfy `mon:string-all-hex-char-p'"
                            :w-got chk-uuid-str
                            :w-type-of t
                            :signal-or-only nil)))

(defun uuid-get-bytes (uuid-string)
  (let ((uuid-str-if (%uuid-get-bytes-if uuid-string))
        (outstr (make-array 16 :element-type 'character :fill-pointer 0)))
    (declare ((array character (32)) uuid-str-if)
             ((and (vector character 16) (not simple-array)) outstr))
    (with-output-to-string (out outstr)
      (loop
         for i = 0 then (+ i 2)
         as  j = (+ i 2)
         with max = (- (length uuid-string) 2)
         as cur-pos = (parse-integer (subseq uuid-str-if i j) :radix 16)
         do (format out "~A" (code-char cur-pos))
         while (< i max))
      outstr)))

;; (simple-array character (16))
;; 
(defun uuid-to-byte-array (uuid)
  (declare (unique-universal-identifier uuid))
  (let ((array (make-array 16 :element-type '(unsigned-byte 8))))
    (with-slots (%uuid_time-low 
                 %uuid_time-mid 
                 %uuid_time-high-and-version
                 %uuid_clock-seq-and-reserved
                 %uuid_clock-seq-low %uuid_node)
        uuid
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
      array)))
           
(defun uuid-from-byte-array (array)
  (declare ((simple-array (unsigned-byte 8) (16)) array))
  #-sbcl (assert (and (= (array-rank array) 1)
                      (= (array-total-size array) 16))
                 (array)
                 "Arg ARRAY not one-dimensional array of 16 elements of type (unsigned-byte 8)")
  (macrolet ((arr-to-bytes (from to w-array)
               "Helper macro used in `uuid-from-byte-array'."
               (declare ((mod 17) from to))
               `(loop 
                   for i from ,from to ,to
                   with res = 0
                   do (setf (ldb (byte 8 (* 8 (- ,to i))) res) (aref ,w-array i))
                   finally (return res))))
    (make-instance 'unique-universal-identifier
                   :%uuid_time-low (arr-to-bytes 0 3 array)
                   :%uuid_time-mid (arr-to-bytes 4 5 array)
                   :%uuid_time-high-and-version (arr-to-bytes 6 7 array)
                   :%uuid_clock-seq-and-reserved (aref array 8)
                   :%uuid_clock-seq-low (aref array 9)
                   :%uuid_node (arr-to-bytes 10 15 array))))


(defun digest-uuid (digest-version uuid name)
  (declare ((mod 6) digest-version)
           (type string name) 
           ;; (unique-universal-identifier uuid)
           )
  (let ( ;; :WAS (ironclad:make-digest (cond ((= digest-version 3)  :md5) ((= digest-version 5)  :sha1 )))
        (digester  (ironclad:make-digest (%verify-digest-version digest-version))))
    ;; :NOTE `mon:ascii-string-to-byte-array'
    (ironclad:update-digest  digester (ironclad:ascii-string-to-byte-array uuid))
    (ironclad:update-digest  digester (ironclad:ascii-string-to-byte-array name))
    (ironclad:produce-digest digester)))

(defun make-v3-uuid (namespace name)
  (declare (type string name)
           (unique-universal-identifier namespace))
  (format-v3or5-uuid 
   (digest-uuid 3 (uuid-get-bytes (uuid-print-bytes nil namespace)) name)
   3))

(defun make-v5-uuid (namespace name)
  (declare (type string name)
           (unique-universal-identifier namespace))
  (format-v3or5-uuid 
   (digest-uuid 5 (uuid-get-bytes (uuid-print-bytes nil namespace)) name)
   5))

(defun make-v4-uuid ()
  (let ((*random-state* (the random-state *uuid-random-state*)))
    ;;(declare (special *random-state*))
    (make-instance 'unique-universal-identifier
                   :%uuid_time-low (random #xffffffff)  ; *uuid-random-state*)
                   :%uuid_time-mid (random #xffff     ) ;*uuid-random-state*)
                   :%uuid_time-high-and-version (dpb #b0100 (byte 4 12) 
                                                     (ldb (byte 12 0) (random #xffff))) ;*uuid-random-state*)))
                   :%uuid_clock-seq-and-reserved (dpb #b10  (byte 2 6)
                                                      (ldb (byte 8 0)  (random #xff))) ; *uuid-random-state*)))
                   :%uuid_clock-seq-low (random #xff) ; *uuid-random-state*)
                   :%uuid_node (random #xffffffffffff)))) ; *uuid-random-state*)))

(defun format-uuid-as-urn (stream uuid)
  (declare (type mon:stream-or-boolean stream)
           (unique-universal-identifier uuid))
  (format stream "urn:uuid:~(~A~)" uuid))

(defun make-null-uuid ()
  (make-instance 'unique-universal-identifier))

;; ;;; :DOESN'T work
;; (defun make-uuid-namespace-loadtime-vars (namespace-pairs)
;;   (loop 
;;      :for (nm . id-string)  namespace-pairs
;;      :when (uuid-string-p id-string)
;;      :do  (setf nm (make-uuid-from-string id-string))))
;;
;; (mon:fundoc 'make-uuid-namespace-loadtime-vars
;; "Set values of NAMESPACE-PAIRS to UUIDs at loadtime.~%~@
;; NAMESPACE-PAIRS is a list of conses each of the form:~%
;;  \( <SYMBOL> . <UUID-STRING> \)~%~@
;; <SYMBOL> should be a variable or parameter in the current environment.~%~@
;; <UUID-STRING> should satisfy `dbc:uuid-string-p'.~%~@
;; Value is set as if by `dbc:make-uuid-from-string'.~%~@
;; :EXAMPLE~%~@
;;  { ... <EXAMPLE> ... } ~%~@
;; :SEE-ALSO `<XREF>'.~%►►►")


;;; ==============================
;;; :UUID-DOCUMENTATION
;;; ==============================

(setf (documentation 'uuid-string 'type)
      #.(format nil
"An object of type (array character (36)) satsfying `dbc:uuid-string-p'.~%~@
:EXAMPLE~%~@
 (type ~%~@
 \(typep \"6ba7b810-9dad-11d1-80b4-00c04fd430c8\" 'uuid-string\)~%
 \(typep \"6BA7B810-9DAD-11D1-80B4-00C04FD430C8\" 'uuid-string-p\)~%~@
;; Following fails successfully:~%
 \(typep \"6BA7B810--9DAD-11D1-80B4-00C04FD430C8\ 'uuid-string-p\)~%~@
:SEE-ALSO `<XREF>'.~%►►►"))

(mon:fundoc 'uuid-string-p
"Whether MAYBE-UUID-STRING is a valid string representation of a UUID.~%~@
Return T when MAYBE-UUID-STRING satisfies the following constraints:~%
 - Its type is '\(array character 36\)~%
 - When split to list of strings on #\\- delimter the list is of length is 5~%
 - The length of each string in the list matches the pattern 8-4-4-4-12~%
 - each string in the list satisfies `mon:string-all-hex-char-p'~%
:EXAMPLE~%
 \(uuid-string-p \"6ba7b810-9dad-11d1-80b4-00c04fd430c8\"\)~%
 \(uuid-string-p \"6BA7B810-9DAD-11D1-80B4-00C04FD430C8\"\)~%~@
;; Following fails successfully:~%
 \(uuid-string-p \"6BA7B810--9DAD-11D1-80B4-00C04FD430C8\"\)~%~@
:SEE-ALSO `mon:split-string-on-chars'.~%►►►")

(mon:fundoc 'make-uuid-from-string-if
"Helper function for `dbc:make-uuid-from-string'.~%~@
If UUID-STRING-IF satisfies `uuid-string-p' return it.
If the constraint fails signal a `mon:simple-error-mon' condition.~%~@
:EXAMPLE~%~@
 (make-uuid-from-string-if \"6ba7b810-9dad-11d1-80b4-00c04fd430c8\")~%
 (make-uuid-from-string-if \"6ba7b810-9dad--11d1-80b4-00c04fd430c8\") ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'make-uuid-from-string 
"Create an instance of unique-universal-identifier class from UUID-STRING.~%~@
UUID string should satisfy `dbc:uuid-string-p' an error is signalled if not.~%~@
:EXAMPLE~%
 (make-uuid-from-string \"6ba7b810-9dad-11d1-80b4-00c04fd430c8\")~%~@
:SEE-ALSO `<XREF>'.~%►►►")


(mon:fundoc 'uuid-load-bytes
 "Helper function.~%~@
Load as if by `cl:dpb' the bytes of BYTE-ARRAY.~%~@
Return bytes set as integer values.~%~@
keyword BYTE-SIZE is a byte width for to set. Default is 8.~%~@
keyword START is the position in BYTE-ARRAY to begin setting bytes from. Default is 0.~%~@
END is the position to stop setting bytes.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc '%verify-version-3-or-5
"Verify that arg VERSION is either the integer 3 or 5.~%~@
Signal an error if not.
Helper function for `dbc:format-v3or5-uuid'.~%~@
:EXAMPLE~%~@
  \(%verify-version-3-or-5 3\)~%
  \(%verify-version-3-or-5 5\)~%~@
;; Following fails successfully:~%
  \(%verify-version-3-or-5 6\)~%~@
:SEE-ALSO `dbc:%verify-digest-version'.~%►►►")

(mon:fundoc '%verify-digest-version
"Return one of the symbols :MD5 or :SHA1 depending on value of CHK-VERSION.
When CHK-VERSION is 3 return :MD5~%~@
When CHK-VERSION is 5 return :SHA1~%~@
CHK-VERSION should satisfy `dbc:%verify-version-3-or-5', an error is signalled if not. ~%~@
Helper function for `dbc:digest-uuid'~%~@
:EXAMPLE~%
  \(%verify-digest-version 3\)~%
  \(%verify-digest-version 5\)~%
;; Following fails successfully:~%
  \(%verify-digest-version 6\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

;; should satisfy `mon:open-stream-output-stream-p'.~%~@
(mon:fundoc 'uuid-print-bytes
"Print the raw bytes of UUID in hexadecimal format to STREAM.~%~@
UUID is an instance of `unique-universal-identifier' class.~%~@
STREAM is an output-stream.
Output of returned has the format:~%
 6ba7b8109dad11d180b400c04fd430c8~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'format-v3or5-uuid
"Helper function to format UUIDv3 and UUIDv5 hashes according to UUID-VERSION.~%~@
HASH is an argument suitable as the BYTE-ARRAY arg to `dbc:uuid-load-bytes'.~%~@
UUID-VERSION should satisfy `dbc::%verify-version-3-or-5', an error is signalled if not.~%~@
:NOTE Here the term \"formatting\" means setting the appropriate version bytes.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'uuid-get-bytes
            "Convert UUID-STRING to a string of characters.~%~@
UUID-STRING is a is a string as returned by `dbc:uuid-print-bytes'.~%~@
Return value is constructed from the `cl:code-char' of each number in UUID-STRING.~%~@
Helper function for `make-v3-uuid' and `make-v5-uuid'.~%~@
:EXAMPLE~%
 \(uuid-get-bytes 
  \(uuid-print-bytes nil \(make-uuid-from-string \"6ba7b810-9dad-11d1-80b4-00c04fd430c8\"\)\)\)~%
\(uuid-get-bytes \"5E320838715730398383652D96705A7D\"\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc '%uuid-get-bytes-if
"Helper function for `uuid-get-bytes'.~%~@
Verify that arg CHK-UUID-STR is of type:~%
  '(array character (32))
and satisfies `mon:string-all-hex-char-p', signal an error if not.
:EXAMPLE~%~@
 \(%uuid-get-bytes-if \"6ba7b8109dad11d180b400c04fd430c8\"\)~%
 \(%UUID-GET-BYTES-IF \"6BA7B8109DAD11D180B400C04FD430C8\"\)~%
 \(%uuid-get-bytes-if \"6ba7b8109dad11d180b400c04fd430c8-Q\"\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'digest-uuid 
  "Helper function producing an ironclad digest.~%~@
DIGEST-VERSION is a symbol suitable for uase as an argument to
`ironclad:make-digest'. It is is either :MD5 or :SHA1, and should satisfy
`dbc::%verify-digest-version' an error is signalled if not.~%~@
UUID is an instance of unique-universal-identifier class
Used for the generation of UUIDv3 and UUIDv5 UUID by `make-v5-uuid' and `make-v3-uuid'.
:EXAMPLE~%~@
 \(digest-uuid 3 *uuid-namespace-dns-default* \"bubba\"\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'make-v4-uuid
  "Generate a version 4 (random) UUID.~%~@
Return value is an instance of the UNIQUE-UNIVERSAL-IDENTIFIER class.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `dbc:*uuid-random-state*', `cl:random'.~%►►►")

(mon:fundoc 'make-v3-uuid
"Generate a version 3 (named based MD5) UUID for NAME in NAMESPACE.~%~@
Return value is an instance of the UNIQUE-UNIVERSAL-IDENTIFIER class.
NAMESPACE is a UUID namespace object.
NAME is a string.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'make-v5-uuid
  "Generates a UUID-v5 (SHA1) with NAME in NAMESPACE.~%~@
Return value is an instance of the UNIQUE-UNIVERSAL-IDENTIFIER class.~%~@
NAMESPACE is a UUID namespace object.~%~@
NAME is a string.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'format-uuid-as-urn
  "Print UUID as a URN \(Universal Resource Name\) to STREAM.~%~@
Return value has the format:
 urn:uuid:<UUID>
UUID is an instance of `unique-universal-identifier' class.~%~@
STREAM is an output-stream~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'make-null-uuid
"Generate a NULL UUID.~%~@
Return value is an instance of `dbc:unique-universal-identifier' with all slots defaulted to 0.~%~@
Return value has the format:
 00000000-0000-0000-0000-000000000000
:EXAMPLE~%
 \(make-null-uuid\)~%~@
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'uuid-from-byte-array
"Convert ARRAY to a UUID.~%~@
Return value is an instance of the UNIQUE-UNIVERSAL-IDENTIFIER class.~%~@
ARRAY is a byte-array as returned by `dbc:uuid-to-byte-array' it should be of type:~%
 \(simple-array \(unsigned-byte 8\) \(16\)\)~%~@
:EXAMPLE~%~@
 \(uuid-from-byte-array \(uuid-to-byte-array \(make-uuid-from-string \"6ba7b814-9dad-11d1-80b4-00c04fd430c8\"\)\)\)
:SEE-ALSO `<XREF>'.~%►►►")

(mon:fundoc 'uuid-to-byte-array
  "Convert UUID to a byte-array.~%~@
Return value is an array of type:~%
 (simple-array (unsigned-byte 8) (16))
Arg UUID should be an instance of the UNIQUE-UNIVERSAL-IDENTIFIER class.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `dbc:uuid-from-byte-array'.~%►►►")


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
;; End:


;;; ==============================
;;; EOF
