;;; :FILE-CREATED <Timestamp: #{2012-02-22T19:42:50-05:00Z}#{12083} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-slot-value-equal.lisp
;;; ==============================

;; Elsewhere we have stuff that wants to repopulate an existing hash-table mapped
;; to a bunch of objects.  For a given object I'd like to not update its
;; existing slot-value unless its value has changed.  when a change has occured
;; in many cases is likely to be a case correction.

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
  (or 
   ;; If they are the same object, we're done
   (eq slot-value-a slot-value-b)
   ;; else, check that the shape and properties of each array are congruent.
   (and 
    ;; are cl:array-total-size and cl:array-rank eql for both arrays
    (equal (array-dimensions slot-value-a)
           (array-dimensions slot-value-b))
    ;; we do not consider displaced-arrays to be equal
    (not (array-displacement slot-value-a))
    (not (array-displacement slot-value-b))
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

;; (not (array-displacement #()))
;; (not (array-displacement (make-array 0 :adjustable t)))

;; (eql (adjustable-array-p #())
;;      (adjustable-array-p (make-array 0 :adjustable t)))


;;      
;; (%parsed-class-slot-value-equal-array-check #() (make-array 0 :adjustable t))

;;; ==============================
;; methods for comparing equality of parsed-class slot-values
;;
(defgeneric parsed-class-slot-value-equal (slot-value-a slot-value-b)
  (:documentation 
   "Compare SLOT-VALUE-A SLOT-VALUE-B as if by cl:equal except when descending
compare strings as if by cl:string= and perform array comparison as follows:
 - If an array is adjustable the other one must be as well;
 - If an array has a fill-pointer the other one must as well and they
   must each have the same index;
 - If either array is displaced-array we do not consider them to be equal." ))

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

;; Following two methods specialized on hash-table and cons cribbed from sbcl/src/code/pred.lisp
;;
;; (parsed-class-slot-value-equal nil ()) => T
;; (parsed-class-slot-value-equal (cons nil nil) (list nil)) => T
;; (parsed-class-slot-value-equal '(a (b) (c . d)) '(a (b) (c . d))) => T
;; (parsed-class-slot-value-equal '(a b c . d) '(a b c . d))
;; (parsed-class-slot-value-equal '(a (b) (c . d)) '(a (b) (c . D))) => T
;; (parsed-class-slot-value-equal '(a (b) (c . d)) '(a (b) (c . :D))) => NIL
;; (parsed-class-slot-value-equal '(a (b) (c . "C")) '(a (b) (c . "C"))) => T
;; (parsed-class-slot-value-equal '(a (b) (c . "C")) '(a (b) (c . "c"))) => nil
;; (parsed-class-slot-value-equal '(a (b) (c . #())) '(a (b) (c . #()))) => T
;; (parsed-class-slot-value-equal '(a (b) (c . #())) `(a (b) (c . ,(make-array 0 :adjustable t)))) => NIL
;;
;; Should we check for circular structure here???
(defmethod parsed-class-slot-value-equal ((slot-value-a cons) (slot-value-b cons))
  (and (parsed-class-slot-value-equal (car slot-value-a) (car slot-value-b))
       (parsed-class-slot-value-equal (cdr slot-value-a) (cdr slot-value-b))))

(defmethod parsed-class-slot-value-equal ((slot-value-a hash-table) (slot-value-b hash-table))
  (if (eq slot-value-a slot-value-b)
      t
      (if (and (eql (hash-table-count slot-value-a) (hash-table-count slot-value-b))
               (eql (hash-table-test slot-value-a) (hash-table-test slot-value-b)))
          (block parsed-class-hash-entry-compare
            (maphash (lambda (key a-value)
                       (multiple-value-bind (b-value b-value-p)
                           (gethash key slot-value-b)
                         (unless (and b-value-p (parsed-class-slot-value-equal a-value b-value))
                           (return-from parsed-class-hash-entry-compare nil))))
                     slot-value-a)
            t))))

(defmethod parsed-class-slot-value-equal ((slot-value-a simple-vector) (slot-value-b simple-vector))
  (cond ((eq slot-value-a slot-value-b) t)
        ((eql (array-total-size slot-value-a) (array-total-size slot-value-b))
         (every #'parsed-class-slot-value-equal slot-value-a slot-value-b))
        (t nil)))

(defmethod parsed-class-slot-value-equal ((slot-value-a bit-vector) (slot-value-b bit-vector))
  (cond ((eq slot-value-a slot-value-b)
         t)
        ((and (typep slot-value-a '(simple-bit-vector))
              (typep slot-value-b '(simple-bit-vector)))
         (unless (eql (array-total-size slot-value-a) (array-total-size slot-value-b))
           (return-from parsed-class-slot-value-equal))
         (equal slot-value-a slot-value-b))
        (t 
         (if (%parsed-class-slot-value-equal-array-check slot-value-a slot-value-b)
             (equal slot-value-a slot-value-b)
             nil))))
;; 
;; (parsed-class-slot-value-equal
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 1)
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 1)) 
;; => T
;;
;; (parsed-class-slot-value-equal
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 1)
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 0))
;; => NIL
;;
;; (let* ((vec1 (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 1))
;;        (vec2 (make-array 1 :element-type '(unsigned-byte 2) :displaced-to vec1)))
;;   (parsed-class-slot-value-equal vec1 vec2))
;; => NIL
;;
;; (parsed-class-slot-value-equal
;;  (make-array 1 :initial-contents '(2) :fill-pointer 1)
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 1))
;; => T
;;
;; (parsed-class-slot-value-equal
;;  (make-array 1 :initial-contents '(2) :adjustable t)
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :fill-pointer 1))
;; => NIL
;;
;; (parsed-class-slot-value-equal
;;  (make-array 1 :initial-contents '(2) :adjustable t)
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2)))
;;
;; (parsed-class-slot-value-equal
;;  (make-array 1 :initial-contents '(2) :adjustable t)
;;  (make-array 1 :element-type '(unsigned-byte 2) :initial-contents '(2) :adjustable t))
;; => T
(defmethod parsed-class-slot-value-equal ((slot-value-a vector) (slot-value-b vector))
  (cond ((eq slot-value-a slot-value-b) t)
        (t (if (%parsed-class-slot-value-equal-array-check slot-value-a slot-value-b)
               (every #'parsed-class-slot-value-equal slot-value-a slot-value-b)
               nil))))

(defmethod parsed-class-slot-value-equal ((slot-value-a array) (slot-value-b array))
  (cond ((eq slot-value-a slot-value-b) t)
        (t (if (%parsed-class-slot-value-equal-array-check slot-value-a slot-value-b)
               ;; instead of cl:every
               ;; (loop for i from 0 below (array-total-size slot-value-a)
               ;;    always (parsed-class-slot-value-equal
               ;;            (row-major-aref slot-value-a i)
               ;;            (row-major-aref slot-value-b i)))
               (every #'parsed-class-slot-value-equal slot-value-a slot-value-b)
               nil))))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
