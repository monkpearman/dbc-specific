;;; :FILE-CREATED <Timestamp: #{2011-01-31T23:22:52-05:00Z}#{11051} - by MON>
;;; ==============================

;;; ==============================
;;
;; cxml:xml-parse-error
;;; ==============================


(in-package #:dbc)
;; *package*

(define-condition dbc-error (mon:error-mon)
  ()
  (:documentation "Base condition for dbc-errors."))

(define-condition system-path-error (dbc-error)
  ((w-system-path
    :initarg :w-system-path 
    :initform nil 
    :reader system-path-locus)
   (w-system-obj    
    :initarg :w-system-obj
    :initform nil
    :reader system-object-locus)
   (w-system-slot
    :initarg :w-system-slot
    :initform nil
    :reader system-slot-locus)
   (w-system-aux-msg
    :initarg :w-system-aux-msg 
    :initform nil
    :reader system-aux-msg))
  (:report (lambda (condition stream)
             (handler-case 
                 (let* ((obj   (system-object-locus condition))
                        (class (and obj (mon:class-name-of obj) )) ;;(class-name (class-of obj)) ))
                        (slot   (and obj (system-slot-locus condition)))
                        (slotb  (and slot 
                                     (or 
                                      (and (slot-exists-p obj slot) slot)
                                      ;; :NOTE The mon:slot-non-existent-error can not ":report", why?
                                      (signal (make-condition 'mon:slot-non-existent-error
                                                              :w-sym 'system-path-error
                                                              :w-type 'condition
                                                              :name slot
                                                              :w-obj obj
                                                              :w-not-slot-value slot)))))
                        (sym   (mon:error-sym condition))
                        (typ   (mon:ref-bind est (mon:error-sym-type condition)
                                 (mon:format-error-symbol-type (or (and sym sym) 'system-path-error) est)
                                 (mon:format-error-symbol-type (or (and sym sym) 'system-path-error) 'condition)))
                        (path  (system-path-locus condition))
                        (aux   (system-aux-msg condition))
                        (fmt   `(,(and typ (cons "~A" typ))
                                  ,(and obj (cons ":OBJECT~12T~S" obj))
                                  ,(and obj class (cons ":CLASS~12T~S" class))
                                  ,(and obj slotb (cons ":SLOT~12T~S" slotb))
                                  ,(and path (cons ":PATH~12T~A" path))
                                  ,(and aux (cons "~12T~A" aux)))))
                   (apply #'format stream
                          (mon:mapconcat #'car fmt "~%")
                          (mapcar #'cdr fmt)))
               ;; (mon:proper-list-error (cnd) (error cnd))
               (mon:slot-non-existent-error (cnd) (error cnd)))))
  (:documentation 
   #.(format nil
   "~%~
    Initarg :W-SYSTEM-PATH is the non-existent path value originating the error.~%~%~
    Initarg :W-SYSTEM-OBJ is the object originating the path error.~%~%~
    Initarg :W-SYSTEM-SLOT is the slot originating the path error.~%~%~
    Initarg :W-SYSTEM-AUX-MSG is an auxiliarry string to augment condition's :report.~@
    If provided it appears as the last line in report.~%~%~
    When :W-SYM and/or :W-TYPE are provided they are as per `mon:error-mon'.~@
    If ommitted they are defaulted.~@
   :W-SYM defaults to system-path-error, :W-TYPE defaults to 'condition.~%~%~

   :EXAMPLE~%~%~
    \(let \(\(object *xml-output-dir*\)\)
      \(error 'system-path-error
             :w-system-obj object
             :w-system-slot 'sub-path
             :w-system-path \(parent-path object\)\)\)~%~%~
    \(let \(\(object *xml-output-dir*\)\)
      \(error 'system-path-error
             :w-sym 'bubba
             :w-type 'condition
             :w-system-obj  object
             :w-system-slot 'sub-path
             :w-system-path \(parent-path object\)\)\)~%~%~
    \(let* \(\(object *xml-output-dir*\)
       \(cnd \(make-condition 'system-path-error
                            :w-sym 'bubba
                            :w-type 'function
                            :w-system-obj  object
                            :w-system-slot 'sub-path
                            :w-system-path \(parent-path object\)
                            :w-system-aux-msg \"Danger, Will Robinson\"\)\)\)
       \(error cnd\)\)~%~%~
   :SEE-ALSO `dbc:dbc-error', `mon:format-error-symbol-type'.~%►►►")))

;;
;; :NOTE 'mon:slot-non-existent-error doesn't report when :w-system-slot is non-existent.
;; (let* ((object *xml-output-dir*)
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
