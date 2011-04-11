;;; :FILE-CREATED <Timestamp: #{2011-04-11T11:51:10-04:00Z}#{11151} - by MON>
;;; :FILE dbc-specific/dbc-uuid/dbc-uuid-types.lisp
;;; ==============================


(in-package #:dbc)

(deftype uuid-ub48 ()
 '(unsigned-byte 48))

(deftype uuid-ub32 ()
 '(unsigned-byte 32))

(deftype uuid-ub16 ()
  '(unsigned-byte 16))

(deftype uuid-ub8 ()
  '(unsigned-byte 8))

(deftype uuid-integer-length ()
  ;; expands to: (OR (INTEGER 1 2) (INTEGER 4 4) (INTEGER 6 6))
  '(member 1 2 4 6))

(deftype uuid-byte-string ()
  '(simple-array character (16)))

(deftype uuid-byte-array ()
  ;; '(or uuid-byte-array-16 uuid-byte-array-20))
  '(simple-array (unsigned-byte 8) (*)))

(deftype uuid-bit-vector-128 ()
  '(simple-bit-vector 128))

;; v3 MD5 returns an array of type: (simple-array (unsigned-byte 8) (16))
(deftype uuid-byte-array-16 ()
  ;; (typep (uuid-get-namespace-bytes (make-v5-uuid *uuid-namespace-dns* "bubba")) 'uuid-byte-array-16)
  ;;'(and uuid-byte-array (simple-array (unsigned-byte 8) (16)))
  '(simple-array (unsigned-byte 8) (16)))

;; v5 SHA1 returns an array of type: (simple-array (unsigned-byte 8) (20))
(deftype uuid-byte-array-20 ()
  '(simple-array (unsigned-byte 8) (20)))

(deftype uuid-string-32 ()
  '(array character (32)))

(deftype uuid-string-36 ()
  '(array character (36)))

(deftype uuid-hex-string-32 ()
  '(and uuid-string-32 (satisfies mon:string-all-hex-char-p)))

(deftype uuid-hex-string-36 ()
  '(and uuid-string-36 (satisfies uuid-hex-string-36-p)))


;;; ==============================
;;; :UUID-TYPES-DOCUMENTATION
;;; ==============================

;;; ==============================
;;; EOF
