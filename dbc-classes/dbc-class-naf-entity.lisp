;;; :FILE-CREATED <Timestamp: #{2011-10-11T14:49:49-04:00Z}#{11412} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-naf-entity.lisp
;;; ==============================


(in-package #:dbc)

(defclass naf-entity-artist (base-naf-entity)
  ;; control-id-display-artist
  ;; *control-id-display-artist-namespace*
  ()
  (:documentation  #.(classdoc 'naf-entity-artist :class-doc)))

(defclass naf-entity-author (base-naf-entity)
  ;; control-id-display-author
  ;; *control-id-display-author-namespace*
  ()
  (:documentation  #.(classdoc 'naf-entity-author :class-doc)))

(defclass naf-entity-person (base-naf-entity)
  ;; control-id-display-person
  ;; *control-id-display-person-namespace*
  ()
  (:documentation  #.(classdoc 'naf-entity-person :class-doc)))

(defclass naf-entity-brand (base-naf-entity)
  ;; control-id-display-brand
  ;; *control-id-display-brand-namespace*
  ()
  (:documentation  #.(classdoc 'naf-entity-brand :class-doc)))

(defclass naf-entity-publication (base-naf-entity)
  ;; control-id-display-publication
  ;; *control-id-display-publication-namespace*
  ()
  (:documentation  #.(classdoc 'naf-entity-publication :class-doc)))

;;; ==============================
;;; EOF
