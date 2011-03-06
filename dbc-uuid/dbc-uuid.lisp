
;;;; Author Boian Tzonev <boiantz@gmail.com>
;;;; 2007, All Rights Reserved 
;;;;
;;;; This software may be distributed and used according to the terms of the
;;;; Lisp Lesser GNU Public License (LLGPL)
;;;; (URL `http://opensource.franz.com/preamble.html').
;;;;
;;;; (URL `http://www.ietf.org/rfc/rfc4122.txt')


;;; ==============================
;; :NOTE These Now exported from dbc-specific/package.lisp 
;;

(defpackage :uuid (:use :common-lisp) ;; :ironclad)
  ;; Why do we have to :USE ironclad ???
  ;; ironclad:ascii-string-to-byte-array
  ;; ironclad:produce-digest
  ;; ironclad:update-digest

  ;; :NOTE ironclad shadows `cl:null' to declare its null-cypher.
  ;; We don't use it here so take it from COMMON-LISP
  ;; (:shadowing-import-from :common-lisp #:null) 
  (:export 
   #:*uuid-namespace-dns*    ;; :RENAMED `+namespace-dns+'   -> `*uuid-namespace-dns-default*' 
   #:*uuid-namespace-url*    ;; :RENAMED `+namespace-url+'   -> `*uuid-namespace-url-default*' 
   #:*uuid-namespace-oid*    ;; :RENAMED `+namespace-oid+'   -> `*uuid-namespace-oid-default*' 
   #:*uuid-namespace-x500*   ;; :RENAMED `+namespace-x500+' -> `*uuid-namespace-x500-default*'
   ;;
   #:uuid 
   #:make-null-uuid
   #:make-uuid-from-string
   #:make-v1-uuid
   #:make-v3-uuid 
   #:make-v4-uuid
   #:make-v5-uuid
   ;;
   #:uuid-print-bytes           ;; :RENAMED `print-bytes' -> `uuid-print-bytes'
   #:uuid-to-byte-array
   #:uuid-from-byte-array  ;; :RENAMED `byte-array-to-uuid' -> `uuid-from-byte-array'
   ;; :RENAMED `format-as-urn' -> `format-uuid-as-urn'
   ;; :RENAMED `load-bytes'    -> `uuid-load-bytes'
   ;; 
   ;; :UNUSED
   ;; #:*ticks-per-count*
   ))

;; :WAS (in-package :uuid)

;; (in-package #:dbc)
;; *package*

(defparameter *uuid-namespace-dns* (make-uuid-from-string "6ba7b810-9dad-11d1-80b4-00c04fd430c8")
  "The DNS namespace as provided by RFC-4122.
  May be used for generating UUIDv3 and UUIDv5")

(defparameter *uuid-namespace-url* (make-uuid-from-string "6ba7b811-9dad-11d1-80b4-00c04fd430c8")
  "The URL namespace as provided by RFC-4122.
  May be used for generating UUIDv3 and UUIDv5")

(defparameter *uuid-namespace-oid* (make-uuid-from-string "6ba7b812-9dad-11d1-80b4-00c04fd430c8")
  "The OID namespace as provided with RFC-4122 appendix C.
  May be used for generating UUIDv3 and UUIDv5.")

(defparameter *uuid-namespace-x500* (make-uuid-from-string "6ba7b814-9dad-11d1-80b4-00c04fd430c8")
  "The x500+ namespace as provided by RFC-4122 appendix C. 
   May be used for generating UUIDv3 and UUIDv5.")

(eval-when (:compile-toplevel :load-toplevel :execute)
  #+:sbcl
  (setf *random-state* (make-random-state t))
  
  ;; :NOTE The accessor are never really used effectively.
  ;;; We have base-uuid in dbc-classes/dbc-class-uuid.lisp 
  ;;; This should be ;; unique-and-universal-identifier
  (defclass uuid ()
    ((%uuid_time-low 
      :initarg :%uuid_time-low
      :initform 0
      :accessor %uuid_time-low)
     (%uuid_time-mid
      :initarg :%uuid_time-mid
      :initform 0 
      :accessor %uuid_time-mid)
     (%uuid_time-high-and-version
      :initarg :%uuid_time-high-and-version
      :initform 0
      :accessor %uuid_time-high)
     (%uuid_clock-seq-and-reserved
      :accessor %uuid_clock-seq-var
      :initarg :%uuid_clock-seq-and-reserved
      :initform 0)
     (%uuid_clock-seq-low
      :initarg :%uuid_clock-seq-low
      :initform 0
      :accessor %uuid_clock-seq-low)
     (%uuid_node
      :initarg :%uuid_node
      :initform 0
      :accessor %uuid_node))
    (:documentation "Represents an uuid"))

  (defun make-uuid-from-string (uuid-string)
    "Creates an UUID from the string represenation of an UUID-STRING. 
    :EXAMPLE~%
     (make-uuid-from-string \"6ba7b810-9dad-11d1-80b4-00c04fd430c8\"
     "
    (make-instance 'uuid
		   :%uuid_time-low (parse-integer uuid-string :start 0 :end 8 :radix 16)
		   :%uuid_time-mid (parse-integer uuid-string :start 9 :end 13 :radix 16)
		   :%uuid_time-high-and-version (parse-integer uuid-string :start 14 :end 18 :radix 16)
		   :%uuid_clock-seq-and-reserved (parse-integer uuid-string :start 19 :end 21 :radix 16)
		   :%uuid_clock-seq-low (parse-integer uuid-string :start 21 :end 23 :radix 16)
		   :%uuid_node (parse-integer uuid-string :start 24 :end 36 :radix 16))))

;;; No longer uses the :reader methods
(defmethod print-object ((id uuid) stream)
  "Print UUID ID to to STREAM in string represenatation
   (example string 6ba7b810-9dad-11d1-80b4-00c04fd430c8)"
  (with-slots (%uuid_time-low %uuid_time-mid %uuid_time-high
               %uuid_clock-seq-and-reserved ;;%uuid_clock-seq-var
               %uuid_clock-seq-low %uuid_node)
      id
    (format stream "~8,'0X-~4,'0X-~4,'0X-~2,'0X~2,'0X-~12,'0X" 
            %uuid_time-low %uuid_time-mid %uuid_time-high
            %uuid_clock-seq-and-reserved ;; %uuid_clock-seq-var
            %uuid_clock-seq-low %uuid_node)))
	    
(defun uuid-load-bytes (byte-array &key (byte-size 8) (start 0) end)
  "Helper function. load bytes from BYTE-ARRAY
  Return bytes as integers."
  (let ((ret-val 0))
    (loop 
       for i from start to end
       for pos from (- end start) downto 0 
       do (setf ret-val (dpb (aref byte-array i) (byte byte-size (* pos byte-size)) ret-val)))
    ret-val))


;; (declaim (inline %verify-version-3-or-5))
;; 
(defun %verify-version-3-or-5 (version)
  (declare (optimize (speed 3)  (debug 0)))
  (or (and (typep version '(unsigned-byte 3))
           (or (= version 3)
               (= version 5))
           version)
      (error "arg VERSION is not integer 3 nor 5")))

(defun %verify-version-3-or-5 (version)
  ;;(declare (optimize (speed 3)  (debug 0)))
  (or (and (typep version '(unsigned-byte 3))
           (or (= version 3)
               (= version 5))
           version)
      (error "arg VERSION is not integer 3 nor 5")))

(defun %verify-digest-version (chk-version)
  (or (and (= (%verify-version-3-or-5 chk-version) 3) :md5) :sha1))


  
;; (lambda (a b)
;;   (declare ((integer 1 1) a)
;;            (type (integer 0 1) b)
;;            (optimize debug))
;;   (lambda () (< b a)))


(defun format-v3or5-uuid (hash uuid-version)
  "Helper function to format UUIDv3 and UUIDv5 hashes according to UUID-VERSION.
   Formatting means setting the appropriate version bytes."
  ;; :WAS
  (when (or (= uuid-version 3)
            (= uuid-version 5))
  ;; (let ((version-if (%verify-version-3-or-5 uuid-version)))
  ;;   (declare ((mod 6) version-if))
    (make-instance 'uuid
		   :%uuid_time-low (uuid-load-bytes hash :start 0 :end 3)
		   :%uuid_time-mid (uuid-load-bytes hash :start 4 :end 5)
		   :%uuid_time-high-and-version 
                   (cond ((= uuid-version 3)
                          (dpb #b0011 (byte 4 12) (uuid-load-bytes hash :start 6 :end 7)))
                         ((= uuid-version 5)
                          (dpb #b0101 (byte 4 12) (uuid-load-bytes hash :start 6 :end 7))))
                   (dpb version-if (byte 4 12) (uuid-load-bytes hash :start 6 :end 7))
		   :%uuid_clock-seq-and-reserved (dpb #b10 (byte 2 6) (aref hash 8))
		   :%uuid_clock-seq-low (aref hash 9)
		   :%uuid_node (uuid-load-bytes hash :start 10 :end 15))))

;;; No longer uses the :reader method
(defun uuid-print-bytes (stream uuid)
  "Prints the raw bytes of UUID in hexadecimal format to STREAM.
   (example output 6ba7b8109dad11d180b400c04fd430c8)"
  (declare (type stream stream))
  (with-slots (%uuid_time-low %uuid_time-mid %uuid_time-high-and-version
               %uuid_clock-seq-and-reserved %uuid_clock-seq-low %uuid_node)
      uuid 
    (format stream "~8,'0X~4,'0X~4,'0X~2,'0X~2,'0X~12,'0X" 
            %uuid_time-low %uuid_time-mid 
            %uuid_time-high-and-version  ;; %uuid_time-high
            %uuid_clock-seq-and-reserved ;; %uuid_clock-seq-var
            %uuid_clock-seq-low %uuid_node)))
  
(defun format-uuid-as-urn (stream uuid)
  "Prints UUID as a URN (Universal Resource Name) to STREAM.
  Return value has the format:
  urn:uuid:<UUID>"
  (declare (type stream stream))
  (format stream "urn:uuid:~(~A~)" uuid))
  
(defun make-null-uuid ()
  "Generates a NULL UUID.
 Return value has the format:
 00000000-0000-0000-0000-000000000000"
  (make-instance 'uuid))

(defun make-v3-uuid (namespace name)
  "Generates a version 3 (named based MD5) uuid."
  (format-v3or5-uuid 
   (digest-uuid 3 (get-bytes (uuid-print-bytes nil namespace)) name)
   3))

(defun make-v4-uuid ()
  "Generates a version 4 (random) uuid"
  (make-instance 'uuid
		 :%uuid_time-low (random #xffffffff)
		 :%uuid_time-mid (random #xffff)
		 :%uuid_time-high-and-version (dpb #b0100 (byte 4 12) (ldb (byte 12 0) (random #xffff)))
		 :%uuid_clock-seq-and-reserved (dpb #b10 (byte 2 6) (ldb (byte 8 0) (random #xff)))
		 :%uuid_clock-seq-low (random #xff)
		 :%uuid_node (random #xffffffffffff)))

(defun make-v5-uuid (namespace name)
  "Generates a UUID-v5 (SHA1) with NAME in NAMESPACE."
  (format-v3or5-uuid 
   (digest-uuid 5 (get-bytes (uuid-print-bytes nil namespace)) name)
   5))


(defun uuid-to-byte-array (uuid)
  "Convert UUID to byte-array"
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


;;; :NOTE this is now `macrolet'd in `uuid-from-byte-array'
;; (defmacro arr-to-bytes (from to array)
;;   "Helper macro used in `uuid-from-byte-array'."
;;   `(loop for i from ,from to ,to
;; 	 with res = 0
;; 	 do (setf (ldb (byte 8 (* 8 (- ,to i))) res) (aref ,array i))
;; 	 finally (return res)))
;;
;;; 
;;;  "Helper macro used in `uuid-from-byte-array'."
;; (macrolet ((arr-to-bytes (from to w-array)
;;              (declare ((mod 17) from to))
;;              `(loop 
;;                  for i from ,from to ,to
;;                  with res = 0
;;                  do (setf (ldb (byte 8 (* 8 (- ,to i))) res) (aref ,w-array i))
;;                  finally (return res))))

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

;; (uuid-from-byte-array (uuid-to-byte-array (make-uuid-from-string "6ba7b814-9dad-11d1-80b4-00c04fd430c8")))
           
(defun uuid-from-byte-array (array)
  "Converts a byte-array generated with uuid-to-byte-array to an uuid."
  (declare ((simple-array (unsigned-byte 8) (16)) array))
           #-sbcl 
           (assert (and (= (array-rank array) 1)
                        (= (array-total-size array) 16))
                   (array)
                   "Please provide a one-dimensional array with 16 elements of type (unsigned-byte 8)")
           (macrolet ((arr-to-bytes (from to w-array)
                        "Helper macro used in `uuid-from-byte-array'."
                        (declare ((mod 17) from to))
                        `(loop 
                            for i from ,from to ,to
                            with res = 0
                            do (setf (ldb (byte 8 (* 8 (- ,to i))) res) (aref ,w-array i))
                            finally (return res))))
             (make-instance 'uuid::uuid
                            :%uuid_time-low (arr-to-bytes 0 3 array)
                            :%uuid_time-mid (arr-to-bytes 4 5 array)
                            :%uuid_time-high-and-version (arr-to-bytes 6 7 array)
                            :%uuid_clock-seq-and-reserved (aref array 8)
                            :%uuid_clock-seq-low (aref array 9)
                            :%uuid_node (arr-to-bytes 10 15 array))))


(defun digest-uuid (digest-version uuid name)
  "Helper function producing an ironclad digest from 

namespace and a string.
   Used for the  generation of UUIDv3 and UUIDv5 uuids."
  (let ( ;; (ironclad:make-digest (cond ((= digest-version 3)  :md5) ((= digest-version 5)  :sha1 )))
        ;; (ironclad:make-digest (ecase digest-version (3 :md5) (5 :sha1)))))
        (digester  (ironclad:make-digest (or 
                                          (and (= digest-version 3) :md5)
                                          (and (= digest-version 5) :sha1)))))
    (ironclad:update-digest digester (ironclad:ascii-string-to-byte-array uuid))
    (ironclad:update-digest digester (ironclad:ascii-string-to-byte-array name))
    (ironclad:produce-digest digester)))

(defun get-bytes (uuid-string)
  "Convert UUID-STRING \(as returned by `uuid-print-bytes'\) to a string of
characters built according code-char of each number in UUID-STRING."
  ;; :WAS (with-output-to-string (out)
  (with-output-to-string (out nil :element-type 'standard-char)
    (loop
       for i = 0 then (+ i 2)
       as j = (+ i 2)
       with max = (- (length uuid-string) 2)
       as cur-pos = (parse-integer (subseq uuid-string i j) :radix 16)
       do (format out "~A" (code-char cur-pos))
       while (< i max))
    out))


#|
 ;; ==============================
 ;; :NOTE The variables `*clock-seq*', `*node*', `*ticks-per-count*' are not
 ;; needed b/c we don't use `make-v1-uuid'
;; *clock-seq*
 (defvar *clock-seq* 0 
   "Holds the clock sequence. Is is set when a version 1 uuid is 
  generated for the first time and remains unchanged during a whole session.")

 (defvar *node* nil 
   "Holds the IEEE 802 MAC address or a random number when such is not available")

 (defvar *ticks-per-count* 1024 
   "Holds the amount of ticks per count.
 The ticks per count determine the number of possible version 1 uuids created for
 one time interval.
 Common Lisp provides INTERNAL-TIME-UNITS-PER-SECOND which gives the ticks per
 count for the current system so *ticks-per-count* can be set to
 INTERNAL-TIME-UNITS-PER-SECOND")

 ;; ==============================
 ;; :NOTE `get-node-id' not needed b/c we don't use `make-v1-uuid'

 (defun get-node-id ()
   "Get MAC address of first ethernet device"
   (let ((node
          #+(and :linux (or :cmu :sbcl :allegro))
	 ;; todo this can be simplified a bit ;
          (let ((proc #+(and :linux :cmu)
                      (ext:run-program "/sbin/ifconfig"
                                       nil
                                       :pty nil 
                                       :wait t 
                                       :output :stream 
                                       :error t
                                       :if-error-exists nil)
                      #+(and :linux :sbcl)
                      (sb-ext:run-program "/sbin/ifconfig" 
                                          nil
                                          :output :stream
                                          :error t
                                          :if-error-exists nil
                                          :wait nil)
                      #+(and :linux :allegro)
                      (excl:run-shell-command "/sbin/ifconfig" 
                                              :output :stream
                                              :if-error-output-exists t
                                              :wait nil)))
            (prog1
                (loop for line = (read-line #+(and :linux :cmu)
                                            (extensions:process-output proc) 
                                            #+(and :linux :sbcl)
                                            (sb-ext:process-output proc)
                                            #+(and :linux :allegro)
                                            proc
                                            nil) 
		   while line 
		   when (search "HWaddr" line :test #'string-equal)
		   return (parse-integer (remove #\: (subseq line 38))
					 :radix 16))
              #+(and :linux :allegro)
              (sys:reap-os-subprocess)))

          #+(and :windows :clisp)
          (let ((output (ext:run-program "ipconfig" 
                                         :arguments (list "/all")
                                         :input nil
                                         :output :stream
                                         :wait t)))
            (loop for line = (read-line output nil) while line 
               when (search "Physical" line :test #'string-equal)
               return (parse-integer (remove #\- (subseq line 37)) :radix 16)))
          ))
     (when (not node)
       (setf node (dpb #b01 (byte 8 0) (random #xffffffffffff))))
     node))

 ;; ==============================
 ;; :NOTE `get-timestamp' not needed when not using `make-v1-uuid'

 (let ((uuids-this-tick 0)
       (last-time 0))
   (defun get-timestamp ()
     "Get timestamp, compensate nanoseconds intervals"
     (tagbody 
      restart
      (let ((time-now (+ (* (get-universal-time) 10000000) 100103040000000000)))
 					;10010304000 is time between 1582-10-15 and 1900-01-01 in seconds
        (cond ((not (= last-time time-now))
 	      (setf uuids-this-tick 0
 		    last-time time-now)
 	      (return-from get-timestamp time-now))
 	     (T 
 	      (cond ((< uuids-this-tick *ticks-per-count*)
 		     (incf uuids-this-tick)
 		     (return-from get-timestamp (+ time-now uuids-this-tick)))
 		    (T
 		     (sleep 0.0001)
 		     (go restart)))))))))

 ;; ==============================
 ; :NOTE `make-v1-uuid' not needed.

 (defun make-v1-uuid ()
   "Generates a version 1 (time-based) uuid."
   (let ((timestamp (get-timestamp)))
     (when (zerop *clock-seq*)
       (setf *clock-seq* (random 10000)))
     (unless *node*
       (setf *node* (get-node-id)))
     (make-instance 'uuid
                    :%uuid_time-low (ldb (byte 32 0) timestamp)
                    :%uuid_time-mid (ldb (byte 16 32) timestamp)
                    :%uuid_time-high-and-version (dpb #b0001 (byte 4 12) (ldb (byte 12 48) timestamp))
                    :%uuid_clock-seq-and-reserved (dpb #b10 (byte 2 6) (ldb (byte 6 8) *clock-seq*))
                    :%uuid_clock-seq-low (ldb (byte 8 0) *clock-seq*) 
                    :%uuid_node *node*)))
|#
;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:


;;; ==============================
;;; EOF
