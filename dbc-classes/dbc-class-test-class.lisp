;;; :FILE-CREATED <Timestamp: #{2011-03-23T19:45:12-04:00Z}#{11123} - by MON>
;;; :FILE dbc-classes/dbc-class-test-class.lisp
;;; ==============================

;; :NOTE for testing CLOS stuff before moving into core files


(in-package #:dbc)

(defvar *test-entity-regexp-matcher-db* (make-hash-table))

(defvar *test-entity-regexp-entity-db*  (make-hash-table))

(defclass base-testing-entity (base-entity)
  ()
  (:documentation "Base class for instantiating throw away DBC system NAF entities.~%~"))


;; (find-class 'base-testing-entity)

(defclass test-entity-regexp (entity-regexp)
  ((match-entity-class :allocation :class)
   (match-entity-db    :allocation :class)
   (match-matcher-db   :allocation :class))
  ;; match-container-uuid
  ;; match-container-type   
  (:documentation 
   #.(format nil
             "An `entity-regexp' sub-class for themes.~%~@
:SEE-ALSO `base-theme-entity'.~%▶▶▶")))

(defparameter *base-test-entity-regexp-instance* nil)

(make-entity-regexp-subclass-allocation-if
 'base-testing-entity         
 '*test-entity-regexp-entity-db* 
 '*test-entity-regexp-matcher-db*)

(let ((chk-entity
       (make-entity-regexp-subclass-allocation 
        :match-entity-class  'base-testing-entity
        :match-entity-db     '*test-entity-regexp-entity-db*  
        :match-matcher-db    '*test-entity-regexp-matcher-db*)))
  (setf *base-test-entity-regexp-instance* chk-entity))

(let ((mv4u (make-v4-uuid)))
  (setf (gethash mv4u (symbol-value (slot-value *base-test-entity-regexp-instance* 'subclass-match-entity-db))) "bubba"))

;;; ==============================
;; #<HASH-TABLE {D5F2001}>
;; --------------------
;; Count: 1
;; Size: 16
;; Test: EQL
;; Rehash size: 1.5
;; Rehash threshold: 1.0
;; Contents: 
;; D9054273-41B2-4FA4-87A0-7B1E93AE4D1F = "bubba"
;; ;;; ==============================

;; #<ENTITY-REGEXP-SUBCLASS-ALLOCATION {D6E7E89}>
;; --------------------
;; Class: #<STANDARD-CLASS ENTITY-REGEXP-SUBCLASS-ALLOCATION>
;; --------------------
;;  Group slots by inheritance [ ]
;;  Sort slots alphabetically  [X]

;; All Slots:
;; [ ]  SUBCLASS-MATCH-ENTITY-CLASS = BASE-TESTING-ENTITY
;; [ ]  SUBCLASS-MATCH-ENTITY-DB    = *TEST-ENTITY-REGEXP-ENTITY-DB*
;; [ ]  SUBCLASS-MATCH-MATCHER-DB   = *TEST-ENTITY-REGEXP-MATCHER-DB*



;; INSTALLED 
(defmethod regexp-match-entity-class ((obj entity-regexp-subclass-allocation) &key)
  (let* ((if-bnd
          (and (slot-boundp obj 'subclass-match-entity-class)
               (slot-value obj  'subclass-match-entity-class)))
         (fnd-class (and if-bnd 
                         (mon:ref-bind fc (find-class if-bnd)
                           (and (eq (class-name fc) if-bnd)
                                fc)))))
    (and if-bnd fnd-class
         (values fnd-class if-bnd))))

;; INSTALLED
(defmethod regexp-match-entity-db ((obj entity-regexp-subclass-allocation) &key)
  (let ((if-bnd
         (and (slot-boundp obj 'subclass-match-entity-db)
              (slot-value obj  'subclass-match-entity-db)))
        (then-get-hsh nil))
    (and (symbolp if-bnd)
         (setf then-get-hsh 
               (symbol-value if-bnd)))
    (and then-get-hsh 
         (hash-table-p then-get-hsh)
         (values then-get-hsh if-bnd))))

;; INSTALLED
(defmethod regexp-match-matcher-db ((obj entity-regexp-subclass-allocation) &key)
  (let ((if-bnd
         (and (slot-boundp obj 'subclass-match-matcher-db)
              (slot-value obj  'subclass-match-matcher-db)))
        (then-get-hsh nil))
    (and (symbolp if-bnd)
         (setf then-get-hsh 
               (symbol-value if-bnd)))
    (and then-get-hsh 
         (hash-table-p then-get-hsh)
         (values then-get-hsh if-bnd))))

(let ((rmec (nth-value 1 (regexp-match-entity-class *base-test-entity-regexp-instance*)))
      (rmed (nth-value 1 (regexp-match-entity-db *base-test-entity-regexp-instance*)))
      (rmmd (nth-value 1 (regexp-match-matcher-db *base-test-entity-regexp-instance*))))
  ;;(list rmec rmed rmmd))
  (and rmec rmed rmmd
       (make-instance 'test-entity-regexp
                      :match-entity-class rmec
                      :match-entity-db    rmed
                      :match-matcher-db   rmmd)))

;; (funcall (lambda (&rest rest &key &allow-other-keys)
;;            ;;(cons rest
;;            ;; (apply #'make-array 3 rest)))
;;            (funcall #'make-array 3 rest))
;;          :element-type '(unsigned-byte 8) :initial-contents '(88 0 3))

;; (funcall (lambda (&rest rest)
;;            (apply #'make-array 3 rest))
;;          :element-type '(unsigned-byte 8) :initial-contents '(88 0 3))


regexp-match-matcher-db

(let ((mv4u (make-v4-uuid)))
  (setf (gethash mv4u (symbol-value (slot-value *base-test-entity-regexp-instance* 'subclass-match-entity-db))) "bubba"))


;; (defclass tt--no-bound-slots ()
;;   ((tt-unbound :initarg :tt-unbound)))

;; (let ((tt (make-instance 'tt--no-bound-slots)))
;;   (with-slots (tt-unbound) tt
;;     tt-unbound))

;;; ==============================

;;; ==============================
;;; EOF
