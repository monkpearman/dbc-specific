;;; :FILE-CREATED <Timestamp: #{2011-03-03T16:09:02-05:00Z}#{11094} - by MON>
;;; :FILE dbc-classes/dbc-class-documentation-record.lisp
;;; ==============================

;;; ==============================
;;; :NOTE
;;;  documents objects should have:
;;;  - uuids
;;;  - indexed terms
;;;  - 
;;; :NOTE The class `parse-ref' has the following slots:
;;;  documentation-category-entity-0-coref
;;;  documentation-category-entity-1-coref
;;;  documentation-category-entity-2-coref
;;;  documentation-category-entity-3-coref

;; :NOTE :FILE dbc-specific/notes-versioned/dbc-xml-categs-as-lisp/xml-files/sitedoc.xml
;; contains extensive pre-CLOSified instantiations for sitedoc.
;; <c5 document_number="1259" 
;;     document_title="Using the Compare Groupings Feature of MyPrints"
;;     help_icon_title="Using the Compare Groupings Feature of MyPrints"    
;;     link_title="Using the Compare Groupings Feature of MyPrints" 
;;     document_uploaded="9-19-06" 
;;     name="Compare Groupings">


;;; ==============================



(in-package #:dbc)

;; *package*

;; `parsed-doc-record'
(defclass base-documentation-record (base-dbc)
  ()
  (:documentation 
   #.(format nil "Base class for referencing documents in the dbc-system.")))


#|

(defclass doc-dbc (base-dbc)
  (doc-uuid 
   ;; :initform (generate-dbc-uuid) 
   :accessor doc-uuid)
  (doc-title
   :initform nil
   :initarg :doc-title
   :accessor doc-title)
  (doc-subtitle
   :initform nil
   :initarg :doc-title
   :accessor doc-title)
  (doc-xrefs 
   :initform nil
   :initarg :doc-xrefs
   :accessor doc-xrefs))
|#

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
