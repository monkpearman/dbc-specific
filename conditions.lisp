
;;; :FILE-CREATED <Timestamp: #{2011-01-31T23:22:52-05:00Z}#{11051} - by MON>
;;; ==============================

(in-package #:dbc)
;; *package*

(define-condition dbc-error (error)
  (())
  (:documentation "Base error for dbc-errors"))

(define-condition system-path-error (dbc-error)
  ((w-path
    :initarg :w-path :initform nil :reader w-path-locus)
   (system-obj    
    :initarg :w-system-obj
    :reader w-object-locus)
   (w-class-obj
    :initarg :w-class-obj
    :reader w-class-locus))
  (:report (lambda (condition stream)
             (format stream
                     "With class: ~S ~%~
                      object: ~S path error ~%~
                      with value: ~A" 
                     (class-name (class-of (w-object-locus condition)))                     
                     (w-object-locus condition)
                     (w-path-locus condition)))))

;; (let ((object *dbc-xml-dump-dir*))
;;   (error 'system-path-error
;;          :w-path (parent-path object)
;;          :w-system-obj object))


  

;;; ==============================
;;; EOF
