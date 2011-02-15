
;;; :FILE-CREATED <Timestamp: #{2011-01-31T23:22:52-05:00Z}#{11051} - by MON>
;;; ==============================

(in-package #:dbc)
;; *package*

(define-condition dbc-error (mon:mon-error)
  ()
  (:documentation "Base condition for dbc-errors."))

(define-condition system-path-error (dbc-error)
  ((w-system-path
    :initarg :w-system-path 
    :initform nil 
    :reader w-system-path-locus)
   (w-system-obj    
    :initarg :w-system-obj
    :initform nil
    :reader w-system-object-locus)
   (w-system-slot
    :initarg :w-system-slot
    :initform nil
    :reader w-system-slot-locus))
  (:report (lambda (condition stream)
             (handler-case 
                 (let* ((obj   (w-system-object-locus condition))
                        (class (and obj ;;(class-name (class-of obj)) ))
                                    (mon:class-name-of obj) ))
                        (slot   (and obj (w-system-slot-locus condition)))
                        (slotb  (and slot 
                                     (or 
                                      (and (slot-exists-p obj slot) slot)
                                      ;; :NOTE The mon:slot-non-existent-error can not ":report", why?
                                      ;;(error 'mon:slot-non-existent-error
                                      (signal 
                                       (make-condition 'mon:slot-non-existent-error
                                                       :w-sym 'system-path-error
                                                       :w-type 'condition
                                                       :name slot ;;(w-system-slot-locus condition) ;; slot
                                                       :w-obj obj ;; (w-system-object-locus condition) ;; obj
                                                       :w-not-slot-value slot ;;(w-system-path-locus condition)))
                                                       )))))
                        (typ   (error-sym-type condition))
                        ;;(typ   (and (error-sym-type condition) (error-sym-type condition)))
                        (path  (w-system-path-locus condition))
                        (fmt   `(;;,(and (ref-bind if-type (and typ) (cons type 
                                 ,(and  obj (cons ":OBJECT~12T~S" obj))
                                 ,(and obj class (cons ":CLASS~12T~S" class))
                                 ,(and obj slotb (cons ":SLOT~12T~S" slotb))
                                 ,(and path (cons ":PATH~12T~A" path)))))
                   (apply #'format stream
                          (mon:mapconcat #'car fmt "~%")
                          (mapcar #'cdr fmt)))
               (mon:proper-list-error (cnd) (error cnd)))))

  (:documentation 
   #.(format nil
   "~%~
    Initarg :W-SYSTEM-PATH is the non-existent path value originating the error.~%~%~
    Initarg :W-SYSTEM-OBJ is the object originating the path error.~%~%~
    Initarg :W-SYSTEM-SLOT is the slot originating the path error.~%~%~
   :EXAMPLE~%~%~
    \(let \(\(object *dbc-xml-dump-dir*\)\)
      \(error 'system-path-error
             :w-system-obj object
             :w-system-slot 'sub-path
             :w-system-path \(parent-path object\)\)\)~%~%~
   :SEE-ALSO `<XREF>'.~%►►►")))
;;
;; :NOTE 'mon:slot-non-existent-error doesn't report when :w-system-slot is non-existent.
;; (let ((object *dbc-xml-dump-dir*))
;;    (error 'system-path-error
;;         :w-system-obj  object
;;         :w-system-slot 'sub-pathm ;; <- here
;;         :w-system-path (parent-path object)))

;; (let* ((object *dbc-xml-dump-dir*)
;;        (cnd (make-condition 'system-path-error
;;                             :w-sym 'bubba
;;                             :w-type 'condition
;;                             :w-system-obj  object
;;                             :w-system-slot 'sub-pathm ;; <- here
;;                             :w-system-path (parent-path object))))
;;   (mon::ref-bind rb (mon::error-sym cnd) rb))

;;; ==============================


;;; ==============================
;;; EOF
