;;-*- Mode: LISP; Syntax: COMMON-LISP; Encoding: utf-8; Base: 10 -*-
;;; :FILE-CREATED <Timestamp: #{2011-01-01T14:10:05-05:00Z}#{11526} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/dbc-class.lisp
;;; ==============================


(in-package #:dbc)
;; *package*

;; (defclass dbc-xml->clos-dump ()
;;   ((base-dir :initarg :base-dir ))
;;   (:documentation "Base class for DBC to XML dump files directories.
;; Subclasses inherit their base pathname from this guy.
;; :SEE-ALSO `dbc:*dbc-xml-dump-dir*', `*dbc-xml-dump-dir-name*'
;; `dbc:ensure-dbc-xml-dump-dir-exists'.►►►"))

;;; ==============================

(defclass base-dbc () ;; persistent, rucsack, component, etc.
  ()
  (:documentation "Base class for dbc objects."))

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

;; (defclass entity (object)
;;   ((id :initarg :imdb-id
;;             :accessor imdb-id
;;             :initform nil
;;             :db-type :integer)
;;    (born :initarg :born
;;          :accessor born
;;          :initform nil
;;          :db-type :date)
;;    (died :initarg :died
;;          :initform nil
;;          :accessor died
;;          :db-type :date))
;;   (:metaclass tracking))

;;; ==============================
;;; EOF
