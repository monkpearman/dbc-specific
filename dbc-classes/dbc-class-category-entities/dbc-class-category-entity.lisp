;;; :FILE-CREATED <Timestamp: #{2011-10-11T15:20:06-04:00Z}#{11412} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-category-entity.lisp
;;; ==============================

;; *control-id-display-category-namespace*
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

(in-package #:dbc)

(defgeneric child-node-name (object)
  )

(defclass category-entity-top-level (base-category-entity)
  ((node-name)
   (child-node-name
    :initarg :child-node-name)))

;; advert.xml
;; :ABSTRACT-CLASS
(defclass category-entity-advertising-and-graphics (category-entity-top-level)
  ((node-name :initform "Advertising and Graphics"))
  )

;; archi.xml
;; :ABSTRACT-CLASS
(defclass category-entity-architecture-and-design (category-entity-top-level)
  ((node-name :initform "Architecture and Design"))
  )

;; books.xml
;; :ABSTRACT-CLASS
(defclass category-entity-books-and-publications (category-entity-top-level)
  ((node-name :initform "Books and Publications" ))
  )

;; geo.xml
;; :ABSTRACT-CLASS
(defclass category-entity-geography (category-entity-top-level)
  ((node-name :initform "Geography"))
  )

;; historical.xml
;; :ABSTRACT-CLASS
(defclass category-entity-historical-life-and-scenes (category-entity-top-level)
  ((node-name :initform "Historical Life and Scenes"))
  )

;; natural.xml
;; :ABSTRACT-CLASS
(defclass category-entity-natural-history (category-entity-top-level)
  ((node-name :initform "Natural History"))  
  )

(defclass category-entity-natural-history-ornithology (category-entity-natural-history)
  ((node-name :initform "Ornithology"))  
  )

(defclass category-entity-natural-history-albin (category-entity-natural-history-ornithology)
  ((node-name :initform "Albin"))  
  )

;; (make-instance 'category-entity-natural-history-albin  :child-node-name "Natural History of Birds")

(defclass category-entity-natural-history-audubon (category-entity-natural-history-ornithology)
  ((node-name :initform "Audubon"))  
  )

(defclass category-entity-natural-history-audubon-birds-of-america (category-entity-natural-history-audubon)
  ((node-name :initform "Birds of America"))  
  )

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
