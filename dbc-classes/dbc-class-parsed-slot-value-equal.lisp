;;; :FILE-CREATED <Timestamp: #{2012-02-22T19:42:50-05:00Z}#{12083} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-slot-value-equal.lisp
;;; ==============================

;; Elsewhere we have stuff that wants to repopulate an existing hash-table mapped
;; to a bunch of objects.  For a given object I'd like to not update its
;; existing slot-value unless its value has changed.  When a change has occurred
;; in many cases is likely to be a case correction.

;; :NOTE stuff below mostly modelled after the EQUALS cdr
;; (URL `http://cdr.eurolisp.org/document/8/cleqcmp.html')
;;
;; and implements an EQUALS except that we don't use the keywords
;;  recursive, result, keys, case-sensitive,
;;  by-key, by-value, or check-properties
;; :PASTE-DATE 2012-02-23
;; :PASTE-URL (URL `http://paste.lisp.org/+2QQ2')

;; p_l: between "both" what? ruby & CL or PB and ASN.1

;;; ==============================


(in-package #:dbc)

;; Our original version of `%parsed-class-slot-value-equal-array-check'
;; (defun %parsed-class-slot-value-equal-array-check (slot-value-a slot-value-b)
;;   (declare (array slot-value-a slot-value-b)
;;            (optimize speed))
;;   (cond ((eq slot-value-a slot-value-b)
;;          t)
;;         ((eql (array-total-size slot-value-a) (array-total-size slot-value-b))
;;          (unless (eql (array-rank slot-value-a) (array-rank slot-value-b))
;;            (return-from %parsed-class-slot-value-equal-array-check))
;;          (unless (eql (array-dimensions slot-value-a) (array-dimensions slot-value-b))
;;            (return-from %parsed-class-slot-value-equal-array-check))
;;          ;; we do not consider displaced-arrays to be equal
;;          (when (or (array-displacement slot-value-a)
;;                    (array-displacement slot-value-b))
;;            (return-from %parsed-class-slot-value-equal-array-check))
;;          ;; If an array is adjustable the other one must be as well.
;;          (when (or (adjustable-array-p slot-value-a)
;;                    (adjustable-array-p slot-value-b))
;;            (cond ((adjustable-array-p slot-value-a)
;;                   (unless (adjustable-array-p slot-value-b)
;;                     (return-from %parsed-class-slot-value-equal-array-check)))
;;                  ((adjustable-array-p slot-value-b)
;;                   (unless (adjustable-array-p slot-value-a)
;;                     (return-from %parsed-class-slot-value-equal-array-check)))))
;;          ;; If an array has a fill-pointer the other one must as well and they
;;          ;; must each have the same index.
;;          (when (or (array-has-fill-pointer-p slot-value-a)
;;                    (array-has-fill-pointer-p slot-value-b))
;;            (cond ((array-has-fill-pointer-p slot-value-a)
;;                   (unless (and (array-has-fill-pointer-p slot-value-b)
;;                                (eql (fill-pointer slot-value-a)
;;                                     (fill-pointer slot-value-b)))
;;                     (return-from %parsed-class-slot-value-equal-array-check)))
;;                  ((array-has-fill-pointer-p slot-value-b)
;;                   (unless (and (array-has-fill-pointer-p slot-value-a)
;;                                (eql (fill-pointer slot-value-a)
;;                                     (fill-pointer slot-value-b)))
;;                     (return-from %parsed-class-slot-value-equal-array-check)))))
;;          t)
;;         (t nil)))

;; Thanks to 3b for help reducing the above definition to avoid using so
;; much when/unless/cond/return-from
;; :PASTE-DATE 2012-02-22
;; :PASTE-URL (URL `http://paste.lisp.org/+2QPJ/4')
(defun %parsed-class-slot-value-equal-array-check (slot-value-a slot-value-b)
  (declare (array slot-value-a slot-value-b)
           (optimize speed))
  (and
   ;; we do not consider displaced-arrays to be equal
   ;; even if it slot-value-a and slot-value-b are cl:eq
   (not (array-displacement slot-value-a))
   (not (array-displacement slot-value-b))
   ;; We used to compare if they are the same object and be done
   ;; (or (eq slot-value-a slot-value-b)
   ;; else, check that the shape and properties of each array are congruent.
   (and
    ;; are cl:array-total-size and cl:array-rank eql for both arrays
    (equal (array-dimensions slot-value-a)
           (array-dimensions slot-value-b))
    ;; If an array is adjustable the other one must be as well.
    (eql (adjustable-array-p slot-value-a)
         (adjustable-array-p slot-value-b))
    ;; When an array has a fill-pointer the other one must as well and they must
    ;; each have the same fill-pointer index.
    (or
     ;; Neither array has a fill-pointer, we're done
     (and (not (array-has-fill-pointer-p slot-value-a))
          (not (array-has-fill-pointer-p slot-value-b)))
     (and
      ;; each has a fill-pointer
      (array-has-fill-pointer-p slot-value-a)
      (array-has-fill-pointer-p slot-value-b)
      ;; do each have the same fill-pointer index => T
      (eql (fill-pointer slot-value-a)
           (fill-pointer slot-value-b)))))))



;;; ==============================
;; methods for comparing equality of parsed-class slot-values
;;
(defgeneric parsed-class-slot-value-equal (slot-value-a slot-value-b))

(defmethod parsed-class-slot-value-equal ((slot-value-a t) (slot-value-b t))
  (equal slot-value-a slot-value-b))

;; (parsed-class-slot-value-equal nil nil)
(defmethod parsed-class-slot-value-equal ((slot-value-a null) (slot-value-b null))
  t)

;; (parsed-class-slot-value-equal t t)
(defmethod parsed-class-slot-value-equal ((slot-value-a (eql t)) (slot-value-b (eql t)))
  t)

;; (parsed-class-slot-value-equal t nil)
(defmethod parsed-class-slot-value-equal ((slot-value-a (eql t)) (slot-value-b null))
  nil)

;; (parsed-class-slot-value-equal nil t)
(defmethod parsed-class-slot-value-equal ((slot-value-a null) (slot-value-b (eql t)))
  nil)

;; (parsed-class-slot-value-equal #\A #\A) => T
;; (parsed-class-slot-value-equal #\A #\a) => nil
(defmethod parsed-class-slot-value-equal ((slot-value-a character) (slot-value-b character))
  (char= slot-value-a slot-value-b))

;; (parsed-class-slot-value-equal "string" "string") => T
;; (parsed-class-slot-value-equal "string" "String") => NIL
(defmethod parsed-class-slot-value-equal ((slot-value-a string) (slot-value-b string))
  (string= slot-value-a slot-value-b))

;; The method specialized on cons cribbed from definition of `cl:equal' in
;; sbcl/src/code/pred.lisp
;;
;; Should we check for circular structure here???
(defmethod parsed-class-slot-value-equal ((slot-value-a cons) (slot-value-b cons))
  (and (parsed-class-slot-value-equal (car slot-value-a) (car slot-value-b))
       (parsed-class-slot-value-equal (cdr slot-value-a) (cdr slot-value-b))))

;; The method specialized on hash-table cribbed from `hash-table-equalp' in
;; sbcl/src/code/pred.lisp except that it checks for cl:eq with
;; (or (eq slot-value-a slot-value-b)
;;     ...
;;
;; Should we allow hash-table comparison of the same object under cl:eq?
;;
;; When we don't this means we map descend every hash-value of the hash-table
;; comparing it to itself and return NIL if any object encountered in the
;; descent does not satisfy `parsed-class-slot-value-equal'.
(defmethod parsed-class-slot-value-equal ((slot-value-a hash-table) (slot-value-b hash-table))
  (if (and (eql (hash-table-count slot-value-a) (hash-table-count slot-value-b))
           (eql (hash-table-test slot-value-a) (hash-table-test slot-value-b)))
      (block parsed-class-hash-entry-compare
        (maphash (lambda (key a-value)
                   (multiple-value-bind (b-value b-value-p)
                       (gethash key slot-value-b)
                     (unless (and b-value-p (parsed-class-slot-value-equal a-value b-value))
                       (return-from parsed-class-hash-entry-compare nil))))
                 slot-value-a)
        t)))

(defmethod parsed-class-slot-value-equal ((slot-value-a simple-vector) (slot-value-b simple-vector))
  (and (eql (array-total-size slot-value-a) (array-total-size slot-value-b))
       (every #'parsed-class-slot-value-equal slot-value-a slot-value-b)))

;; (let ((simp-bv #*010))
;;   (%parsed-class-slot-value-equal-array-check simp-bv simp-bv))
;;   (parsed-class-slot-value-equal simp-bv simp-bv))
;;
;; (parsed-class-slot-value-equal #*010 #*010)
;; (parsed-class-slot-value-equal #*010 #*010)
;;
;; (parsed-class-slot-value-equal (make-array 3 :element-type 'bit :fill-pointer 1)
;;                                (make-array 3 :element-type 'bit :fill-pointer 1))
;;
;; (parsed-class-slot-value-equal (make-array 3 :element-type 'bit :fill-pointer 1)
;;                                (make-array 3 :element-type 'bit :fill-pointer 2))
;;
;; (parsed-class-slot-value-equal (make-array 3 :element-type 'bit :fill-pointer 3)
;;                                (make-array 3 :element-type 'bit :fill-pointer 2))
;; (parsed-class-slot-value-equal (make-array 3 :element-type 'bit :fill-pointer 3)
;;                                #*000)
(defmethod parsed-class-slot-value-equal ((slot-value-a bit-vector) (slot-value-b bit-vector))
  (or
   ;; each array is a simple-bit-vector
   (and
    (eql (simple-bit-vector-p slot-value-a)
         (simple-bit-vector-p slot-value-b))
    (eql (array-total-size slot-value-a) (array-total-size slot-value-b))
    (equal slot-value-a slot-value-b))
   (and
    ;; if either is a simple-bit-vector, were done.
    (not (or (simple-bit-vector-p slot-value-a) (simple-bit-vector-p slot-value-b)))
    ;; we have bit-vectors - check them.
    (%parsed-class-slot-value-equal-array-check slot-value-a slot-value-b)
    (equal slot-value-a slot-value-b))))

;;
;; (parsed-class-slot-value-equal
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 1)
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 1))
;; => T

;; (parsed-class-slot-value-equal
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 1)
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 0))
;; => NIL

;; (let* ((vec1 (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 1))
;;        (vec2 (make-array 1 :element-type '(unsigned-byte 2) :displaced-to vec1)))
;;   (parsed-class-slot-value-equal vec1 vec2))
;; => NIL

;; (parsed-class-slot-value-equal
;;  (make-array 1 :initial-contents '(2) :fill-pointer 1)
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 1))
;; => T

;; (parsed-class-slot-value-equal
;;  (make-array 1 :initial-contents '(2) :adjustable t)
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 1))
;; => NIL

;; (parsed-class-slot-value-equal
;;  (make-array 1 :initial-contents '(2) :adjustable t)
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2)))
;; => NIL

;; (parsed-class-slot-value-equal
;;  (make-array 1 :initial-contents '(2) :adjustable t)
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :adjustable t))
;; => T
(defmethod parsed-class-slot-value-equal ((slot-value-a vector) (slot-value-b vector))
  (and (%parsed-class-slot-value-equal-array-check slot-value-a slot-value-b)
       (every #'parsed-class-slot-value-equal slot-value-a slot-value-b)))

(defmethod parsed-class-slot-value-equal ((slot-value-a array) (slot-value-b array))
  (or (eq slot-value-a slot-value-b)
      (and (%parsed-class-slot-value-equal-array-check slot-value-a slot-value-b)
           ;; can't use cl:every on multi-diemensional arrays
           ;; (typep (make-array '(3 3 3)) 'sequence)
           (loop
              for i from 0 below (array-total-size slot-value-a)
              always (parsed-class-slot-value-equal (row-major-aref slot-value-a i)
                                                    (row-major-aref slot-value-b i))))))


;;; ==============================
;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
