
;;; :FILE-CREATED <Timestamp: #{2011-01-31T23:22:52-05:00Z}#{11051} - by MON>
;;; ==============================

(in-package #:dbc)
;; *package*

(define-condition dbc-error (error)
  (())
  (:documentation "Base error for dbc-errors"))

(define-condition system-path-error (dbc-error)
  ((w-path
    :initarg :w-path 
    :initform nil 
    :reader w-path-locus)
   (w-obj    
    :initarg :w-system-obj
    :initform nil
    :reader w-object-locus)
   (w-slot
    :initarg :w-slot
    :initform nil
    :reader w-slot-locus))
  (:report (lambda (condition stream)
             (let* ((obj   (w-object-locus condition))
                    (class (and obj ;;(class-name (class-of obj)) ))
                                (mon::class-name-of obj) ))
                    (slot  (and obj (w-slot-locus condition)))
                    (slot  (and slot (or (and (slot-exists-p obj slot) slot)
                                         ;; :NOTE this doesn't work. Why?
                                         (error 'slot-non-existent-error 
                                                :name slot     ;; (w-slot-locus condition)
                                                :w-obj obj)))) ;;(w-object-locus condition)))))
                    (path  (w-path-locus condition))
                    (fmt   `(,(and  obj (cons ":OBJECT~12T~S" obj))
                              ,(and obj class (cons ":CLASS~12T~S" class))
                              ,(and obj slot (cons ":SLOT~12T~S" slot))
                              ,(and path (cons ":PATH~12T~A" path)))))
               (apply #'format stream
                      (mon:mapconcat #'car fmt "~%")
                      (mapcar #'cdr fmt)))))
  (:documentation 
   #.(format nil
   "~%~
   :EXAMPLE~%~
    (let ((object *dbc-xml-dump-dir*))
      (error 'system-path-error
             :w-obj object
             :w-path (parent-path object)))~%~
   :SEE-ALSO `<XREF>'.~%►►►")))

;;; ==============================
;;; :WORKS
;;; (let ((object *dbc-xml-dump-dir*))
;;;   (error 'system-path-error
;;;          :w-system-obj  object
;;;          :w-slot 'SUB-PATH
;;;          :w-path (parent-path object)))
;;;
;;;
;;; :OUGHTA-BUT-DONT
;;; (let ((object *dbc-xml-dump-dir*))
;;;   (error 'system-path-error
;;;          :w-system-obj  object
;;;          :w-slot 'SUB-PATH
;;;          :w-path (parent-path object)))
;;; ==============================

(define-condition slot-non-existent-error (cell-error)
  ((w-obj    
    :initarg :w-obj
    :reader w-object-locus)
   (w-not-slot-value
    :initarg :w-not-slot-value
    :reader value-for-not-slot))
  (:report (lambda (condition stream)
             (let* ((c-e-n (cell-error-name condition))
                    (w-o-l (w-object-locus condition))
                    (w-o-c (and w-o-l (mon::class-name-of w-o-l)))
                    (w-not (value-for-not-slot condition))
                    (fmt  `(,(and w-o-c (cons ":SLOT-NOT-OF-CLASS~24T~S" w-o-c))
                             ,(and w-o-l (cons ":SLOT-NOT-OF-OBJECT~24T~S" w-o-l))
                             ,(and c-e-n (cons ":SLOT-THATS-NOT~24T~S" c-e-n))
                             ,(and w-not (cons ":SLOT-DONT-GOT~24T~S" w-not)))))
               (apply #'format stream
                      (mon:mapconcat #'car fmt "~%")
                      (mapcar #'cdr fmt)))))
  (:documentation 
   #.(format nil
             "Condition for slots not satisfying `slot-exists-p'.~%
 :NAME names the offending non-existent slot.~%
 Its reader is `cl:cell-error-name'.~%
 :W-OBJ is the object that doesn't contain slot.
 Its reader is w-object-locus.~%
 :W-NOT-SLOT-VALUE is the value that slot would get if existent.~%
 Its reader is value-for-not-slot.~%
 :EXAMPLE~%
 \(let \(\(object *dbc-xml-dump-dir*\)\)
   \(error \(make-condition 'slot-non-existent-error
                          :name 'non-existent-slot
                          :w-obj object
                          :w-not-slot-value 42\)\)\)~%
:SEE-ALSO `<XREF>'.~%►►►")))


;;; ==============================
;;; EOF
