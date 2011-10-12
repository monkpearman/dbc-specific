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
;; contains extensive potentially CLOS-ifiable instances
;; <c5 document_number="1259" 
;;     document_title="Using the Compare Groupings Feature of MyPrints"
;;     help_icon_title="Using the Compare Groupings Feature of MyPrints"    
;;     link_title="Using the Compare Groupings Feature of MyPrints" 
;;     document_uploaded="9-19-06" 
;;     name="Compare Groupings">
;;
;; much of the documentation in sitedoc.xml corrsponds with the categories defined in:
;;  advert.xml, archi.xml, books.xml, geo.xml, historical.xml, natural.xml
;;
;; :SEE :FILE dbc-specific/notes-versioned/dbc-xml-categs-as-lisp/xml-files/sitedoc-sxml.lisp
;;
;; (with-open-file 
;;     (str #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/dbc-xml-categs-as-lisp/xml-files/sitedoc.xml")
;;   (s-xml:parse-xml str ))

;;(s-xml:parse-xml-file #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/dbc-xml-categs-as-lisp/xml-files/sitedoc.xml")
;;(s-xml:parse-xml-file #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/dbc-xml-categs-as-lisp/xml-files/sitedoc.xml" :output-type :xml-struct)




;;; ==============================



(in-package #:dbc)

;; *package*

;; `parsed-doc-record'
(defclass base-documentation-record (base-dbc)
  ()
  (:documentation 
   #.(format nil "Base class for referencing documents in the dbc-system.")))


(defclass documentation-record-sitedoc (base-documentation-record)
  ;; ("name"              :document-name)
  ;; ("document_number"   :document-number)
  ;; ("document_title"    :document-title)
  ;; ("help_icon_title"   :help-icon-title)
  ;; ("link_title"        :link-title)
  ;; ("document_uploaded" :document-upload-date)
  ;; :SEE  dbc-specific/notes-versioned/dbc-xml-categs-as-lisp/xml-files/sitedoc.xml
  ;;       dbc-specific/notes-versioned/dbc-xml-categs-as-lisp/xml-files/sitedoc-sxml.lisp
  ;; :NOTE Much of the documentation in sitedoc.xml corrsponds with the categories defined in:
  ;;        advert.xml, archi.xml, books.xml, geo.xml, historical.xml, natural.xml
  ()
  (:documentation 
   #.(format nil "Base class for referencing documents from the file sitedoc.xml~%")))

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
