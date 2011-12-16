;;; :FILE-CREATED <Timestamp: #{2011-10-11T15:20:06-04:00Z}#{11412} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-category-entity.lisp
;;; ==============================

;; *category-entity-hash*
;; *control-id-category-namespace*

;; --- control-id-category-entity-type           (control-id-entity-type) 
;; ---- control-id-category-entity               (control-id-category-entity-type)
;; ----- control-id-category-entity-display-name (control-id-category-entity control-id-display-name-for-entity-type)
;; ------ control-id-display-category            (control-id-category-entity-display-name)


;; category-entity-top-level                    (base-category-entity)
;; category-entity-advertising-and-graphics
;; category-entity-architecture-and-design
;; category-entity-books-and-publications
;; category-entity-geography
;; category-entity-historical-life-and-scenes
;; category-entity-natural-history

;; :NOTE See bknr-datastore/src/indices/category-index.lisp which implements
;; something similar an prob. better....

(in-package #:dbc)

(defgeneric category-precedence-list (object))
(defgeneric node-name (object))
(defgeneric child-node-name (object))

;; (defgeneric category-entity-control-id-display-category-null-error (object)
;;   (:documentation "Subclasses of category-entity-top-level should never have a null cl:slot-value for slot `control-id-display-category'."))
;;
;; (defgeneric category-entity-node-name-null-error (object slot)
;;   (:documentation "Subclasses of category-entity-top-level should never have a null cl:slot-value for slot `node-name'."))
;;
;; (defgeneric category-entity-category-precedence-list-null-error (object)
;;   (:documentation "Subclasses of category-entity-top-level should never have a null cl:slot-value for slot `control-id-display-category'."))
;;

;;
;; control-id-namespace
;; control-id-uuid
;; control-id-identifies

(defparameter *category-entity-hash* (unicly:make-hash-table-uuid))

;; :NOTE specialize method `control-id-display-category' on subclasses of `category-entity-top-level'.
;; :ABSTRACT-CLASS
(defclass category-entity-top-level (base-category-entity)
  ((;; slot control-id-namespace is bound in an after method specialized on class `control-id-display-category'.
    ;; We need to specialize and populate slot-values for slots: 
    ;; control-id-uuid and control-id-identifies 
    ;; These will depend on values of local slots:
    ;; slot node-name, child-node-name, and category-precedence-list
    control-id-display-category
    :initform (make-instance 'control-id-display-category))
   (category-precedence-list :initform (list))
   (node-name :initform (list))
   (child-node-name
    :initarg :child-node-name
    :initform (list))))
;;
(defmethod control-id-slot-missing-error (class (object category-entity-top-level) slot operation)
  (dbc-class-with-slot-missing-error class object slot operation))
;;
(defmethod control-id-slot-unbound-error (class (object category-entity-top-level) slot)
  (dbc-class-with-slot-unbound-error class slot object))
;; (control-id-slot-value-null-error 
(defmethod control-id-slot-value-null-error ((object category-entity-top-level) slot)
  (dbc-class-with-slot-value-null-error object slot))

;;; control-id-display-category
(defmethod slot-missing (class (object category-entity-top-level) (slot (eql 'control-id-display-category)) operation &optional new-value)
  (declare (ignore new-value))
  (control-id-slot-missing-error class object slot operation))
;;
(defmethod slot-unbound (class (object category-entity-top-level) (slot (eql 'control-id-display-category)))
  (control-id-slot-value-null-error class slot object))

(defmethod control-id-slot-unbound-error (class (object category-entity-top-level) (slot (eql 'control-id-display-category)))
  (control-id-slot-unbound-error class object slot))
;;
(defmethod control-id-slot-value-null-error ((object category-entity-top-level) (slot (eql 'control-id-display-category)))
  (control-id-slot-value-null-error object 'control-id-display-category))
;;
(defmethod control-id-display-category ((object category-entity-top-level))
  (or (and (slot-value object 'control-id-display-category))
      (control-id-slot-value-null-error object 'control-id-display-category)))

;; :NOTE In following methods specialized on the class category-entity-top-level:
;;  control-id-of-class-type, control-id-namespace
;;  control-id-identifies, control-id-uuid
;; When a local slot is unbound in then taking its slot-value will signal a
;; cl:slot-unbound method specialized on class `control-id-display-category'. 
;; So, we know that when slot-value is  null we can signal `category-entity-<FOO>-null-error'. 
;; If we get a legitimate value we hand control over to methods specialized on
;;  class subbclasses of `control-id-type'.
(defmethod control-id-of-class-type ((object category-entity-top-level))
  (control-id-of-class-type (control-id-display-category object)))
;;
(defmethod control-id-uuid ((object category-entity-top-level))
  (control-id-uuid (control-id-display-category object)))
;;
(defmethod control-id-namespace ((object category-entity-top-level))
  (control-id-namespace (control-id-display-category object)))
;;
(defmethod control-id-identifies ((object category-entity-top-level))
  (control-id-identifies (control-id-display-category object)))

;;; category-precedence-list
(defmethod slot-missing (class (object category-entity-top-level) (slot (eql 'category-precedence-list)) operation &optional new-value)
  (declare (ignore new-value))
  (control-id-slot-missing-error class object slot operation))
;;
(defmethod control-id-slot-unbound-error (class (object category-entity-top-level) (slot (eql 'category-precedence-list)))
  (control-id-slot-unbound-error class object slot))
;;
(defmethod slot-unbound (class (object category-entity-top-level) (slot (eql 'category-precedence-list)))
  ;; Subclasses of `category-entity-top-level' should never have an unbound cl:slot-value for slot category-precedence-list
  (control-id-slot-unbound-error class slot object))
;;
(defmethod control-id-slot-value-null-error ((object category-entity-top-level) (slot (eql 'category-precedence-list)))
  (control-id-slot-value-null-error object 'category-precedence-list))
;;
(defmethod category-precedence-list ((object category-entity-top-level))
  (unless (eql (control-id-of-class-type object) 'category-entity-top-level)
    (or (and (slot-value object 'category-precedence-list))
        (control-id-slot-value-null-error object 'category-precedence-list))))

;;; node-name
(defmethod slot-missing (class (object category-entity-top-level) (slot (eql 'node-name)) operation &optional new-value)
  (declare (ignore new-value))
  (control-id-slot-missing-error class object slot operation))
;;
(defmethod slot-unbound (class (object category-entity-top-level) (slot (eql 'node-name)))
  ;; Subclasses of `category-entity-top-level' should never have an unbound cl:slot-value for slot node-name.
  (control-id-slot-unbound-error class slot object))
;;
(defmethod control-id-slot-unbound-error (class (object category-entity-top-level) (slot (eql 'node-name)))
  (control-id-slot-unbound-error class object slot))
;;
(defmethod control-id-slot-value-null-error ((object category-entity-top-level) (slot (eql 'node-name)))
  (control-id-slot-value-null-error object slot))
;;
(defmethod node-name ((object category-entity-top-level))
  (unless (eql (control-id-of-class-type object) 'category-entity-top-level)
    (or (and (slot-value object 'node-name))
        (control-id-slot-unbound-error object 'node-name))))

;;; child-node-name
(defmethod slot-missing (class (object category-entity-top-level) (slot (eql 'child-node-name)) operation &optional new-value)
  (declare (ignore new-value))
  (control-id-slot-missing-error class object slot operation))
;;
(defmethod slot-unbound (class (object category-entity-top-level) (slot (eql 'child-node-name)))
  (control-id-slot-unbound-error class slot object))
;;
(defmethod child-node-name ((object category-entity-top-level))
  (slot-value object 'child-node-name))

;; category-precedence-list
;; node-name
;; child-node-name
;;
;; control-id-uuid
;; control-id-identifies

;; We need to register the UUID of every class in uuid hash-table `*category-entity-hash*' at initialize-instance time.
;; For subclasses we need to check if object's NODE-NAME is already in the CPL and if not push it onto the CPL.
;; If child-node-name is non-null then we find the parent-classes CPL with
;; `sb-mop:class-direct-superclasses', else we compute it with
;; `sb-mop:compute-class-precedence-list'
(defmethod initialize-instance :after ((object category-entity-top-level) &key)
  (unless (eql (control-id-of-class-type object) 'category-entity-top-level)
    ;; (setf (slot-value object 'control-id-namespace)
    ;;       (make-v5-uuid (slot-value object 'control-id-namespace)
    ;;                     (string (class-name (find-class (slot-value object 'control-id-of-class-type))))))
    (let ((cnn (slot-value object 'child-node-name))
          (nn  (slot-value object 'node-name)))
      (if (null cnn)
          ;; We need to make a CPL from the node-name slot-value
          (let* ((class-of-object (class-of object))
                 (computed-cpl (sb-mop:compute-class-precedence-list (class-of object)))
                 (position-root (position (find-class 'category-entity-top-level) computed-cpl))
                 (relevant-cpl (subseq computed-cpl 0 position-root)))
            (if  (or (null relevant-cpl)
                     (eql class-of-object (car relevant-cpl)))
                 ;; :NOTE This portion works -- carefull when merging.
                 ;; its a top level category
                 (let* ((object-metadata (control-id-display-category object))
                        (nmspc (control-id-namespace object-metadata)))
                 
                   (setf (gethash 
                          (setf (slot-value object-metadata 'control-id-uuid)
                                (unicly:make-v5-uuid nmspc
                                                     (setf (slot-value object-metadata 'control-id-identifies)
                                                           nn)
                                                     ))
                          *category-entity-hash*)
                         class-of-object))
                 ;; ... do stuff here when 
                 ))))
    ))

;; 

;; (make-instance 'category-entity-advertising-and-graphics)
;; (make-instance 'category-entity-natural-history)
;; *category-entity-hash*

;; (let ((object (make-instance 'category-entity-advertising-and-graphics)))
;;   (let ((cnn (slot-value object 'child-node-name))
;;         (nn  (slot-value object 'node-name)))
;;     (if (null cnn)
;;         ;; we need to make a cpl from node-name 
;;         (let* ((class-of-object (class-of object))
;;                (computed-cpl (sb-mop:compute-class-precedence-list (class-of object)))
;;                (position-root (position (find-class 'category-entity-top-level) computed-cpl))
;;                (relevant-cpl (subseq computed-cpl 0 position-root)))
;;           (if  (or (null relevant-cpl)
;;                    (eql class-of-object (car relevant-cpl)))
;;                ;; its a top level category
;;                (let* ((object-metadata (control-id-display-category object))
;;                      (nmspc (control-id-namespace object-metadata)))
;;                 
;;                  (setf (gethash 
;;                         (setf (slot-value object-metadata 'control-id-uuid)
;;                               (unicly:make-v5-uuid nmspc
;;                                                    (setf (slot-value object-metadata 'control-id-identifies)
;;                                                          nn)
;;                                                    ))
;;                         *category-entity-hash*)
;;                        class-of-object))
;;                ;; do stuff here
;;                ))))
;;   )
;;
;; ))


;; (let ((computed-cop (FIND-CPL OBJECT)))
;;   (unless (member (node-name OBJECT) computed-cop)
;;     (setf computed-cop 
;;           (map 'list 
;;                (lambda (x) 
;;                  (... get display name of each class object in computed-cop ... ))))
;;     (push (node-name object) computed-cop)))
;; (let ((cnn (slot-value object 'child-node-name))
;;       (nn  (slot-value object 'node-name)))
;;   (if (null cnn)
;;       ;; we need to make a cpl from node-name 
;;       (let* ((class-of-object (class-of object))
;;              (computed-cpl (sb-mop:compute-class-precedence-list (class-of object)))
;;              (position-root (position (find-class 'category-entity-top-level) computed-cpl))
;;              (relevant-cpl (subseq computed-cpl 0 position-root)))
;;         (if (null relevant-cpl)
;;             ;; its a top level category
;;             (let ((object-metadata (control-id-display-category object))
;;                   (nmspc (control-id-namespace object-metadata))
;;                   (setf (gethash 
;;                          (setf (slot-value object-metadata (control-id-uuid object-metadata))
;;                                (unicly:make-v5-uuid nmspc
;;                                                     (setf (slot-value object-metadata 'control-id-identifies)
;;                                                           nn)))
;;                          *category-entity-hash*)
;;                     class-of-object)))
;;             ;; do stuff here
;;             ))))

;; (progn (setf (
;;                          ;; control-id-uuid
;; ;; control-id-identifies
;;            (push (slot-value object category-precedence-list)
;;                  (list 
                 
                 
;;        (uuid-cpl     (map 'list 
;;        )             

;;    (push 

;; (make-instance 'category-entity-advertising-and-graphics)
  

;; (defparameter *tt--cida* (make-instance 'category-id-display-advertising-and-graphics))

;; advert.xml
;; :ABSTRACT-CLASS
(defclass category-entity-advertising-and-graphics (category-entity-top-level)
  ((control-id-display-category 
    :initform (make-instance 'category-id-display-advertising-and-graphics))
   ;; (class-precedence-list :initform (list "Advertising and Graphics"))
   (node-name :initform "Advertising and Graphics"))
  )

;; archi.xml
;; :ABSTRACT-CLASS
(defclass category-entity-architecture-and-design (category-entity-top-level)
  ((control-id-display-category 
    :initform (make-instance 'category-id-display-architecture-and-design))
   (node-name :initform "Architecture and Design"))
  )

;; books.xml
;; :ABSTRACT-CLASS
(defclass category-entity-books-and-publications (category-entity-top-level)
  ((control-id-display-category 
    :initform (make-instance 'category-id-display-books-and-publications))
   (node-name :initform "Books and Publications" ))
  )

;; geo.xml
;; :ABSTRACT-CLASS
(defclass category-entity-geography (category-entity-top-level)
  ((control-id-display-category 
    :initform (make-instance 'category-id-display-geography))
   (node-name :initform "Geography"))
  )

;; historical.xml
;; :ABSTRACT-CLASS
(defclass category-entity-historical-life-and-scenes (category-entity-top-level)
  ((control-id-display-category 
    :initform (make-instance 'category-id-display-historical-life-and-scenes))
   (node-name :initform "Historical Life and Scenes"))
  )

;; natural.xml
;; :ABSTRACT-CLASS
(defclass category-entity-natural-history (category-entity-top-level)
  ((control-id-display-category 
    :initform (make-instance 'category-id-display-natural-history))
   (node-name :initform "Natural History")))

(defclass category-entity-natural-history-ornithology (category-entity-natural-history)
  ((node-name :initform "Ornithology"))
  )

(defclass category-entity-natural-history-albin (category-entity-natural-history-ornithology)
  ((node-name :initform "Albin"))
  )

;; (defparameter *tt--cida* ;; (unintern '*tt--cida*) 
;;     (make-instance 'category-entity-natural-history-albin  :child-node-name "Natural History of Birds"))
;;
;; (node-name *tt--cida*)
;; (control-id-display-category *tt--cida*)
;; => #<CATEGORY-ID-DISPLAY-NATURAL-HISTORY {D23DA41}>

;; (control-id-namespace (control-id-display-category *tt--cida*))
;; => 7425ce80-a88d-5d0f-94c8-4a1b7af27078

;; (control-id-uuid (control-id-display-category *tt--cida*))
;; 
;; (control-id-of-class-type (control-id-display-category *tt--cida*))
;  => #<STANDARD-CLASS CATEGORY-ENTITY-NATURAL-HISTORY>

;; (child-node-name  *tt--cida*)
;; => "Natural History of Birds"

;; (node-name  *tt--cida*)
;; => "Albin"


;; CATEGORY-ENTITY-NATURAL-HISTORY
;; *category-entity-hash*
;; b6b30254-62bf-58c0-b1d5-6e4ec19e485d
;;

(defclass category-entity-natural-history-audubon (category-entity-natural-history-ornithology)
  ((node-name :initform "Audubon"))  
  )

(defclass category-entity-natural-history-audubon-birds-of-america (category-entity-natural-history-audubon)
  ((node-name :initform "Birds of America"))
  )

;; (make-instance 'category-entity-natural-history) *category-entity-hash*

;; (make-instance 'category-entity-natural-history-audubon-birds-of-america 
;;                :child-node-name "Havell - Elephant Folio - DEF")

;; (make-instance 'category-entity-natural-history-audubon-birds-of-america 
;;                :child-node-name "Bien")

;; (make-instance 'category-entity-natural-history-audubon-birds-of-america 
;;                :child-node-name "1st Royal 8vo Edition")

;; (make-instance 'category-entity-natural-history-audubon-birds-of-america 
;;                :child-node-name "2nd Royal 8vo Edition")

;; (make-instance 'category-entity-natural-history-audubon-birds-of-america 
;;                :child-node-name "Amsterdam - Repro Edition")

;; (make-instance 'category-entity-natural-history-audubon-birds-of-america 
;;                :child-node-name "Leipzig - Repro Edition")

;; (make-instance 'category-entity-natural-history-audubon-birds-of-america 
;;                :child-node-name "Loates - Repro Edition")


;;; ==============================
;;; EOF
