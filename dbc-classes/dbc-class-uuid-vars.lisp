;;; :FILE-CREATED <Timestamp: #{2011-05-21T18:53:41-04:00Z}#{11206} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-uuid-vars.lisp
;;; ==============================

;;; ==============================
;; :NOTE this :FILE dbc-class-uuid-vars.lisp loads :AFTER  dbc-class-system-object-uuid.lisp
;;; ==============================

;;; ==============================
;; *control-id-namespace-table*
;; *system-object-uuid-base-namespace*
;;
;; *control-id-inventory-namespace*
;; *control-id-inventory-publication-namespace*
;; *control-id-inventory-sales-order-namespace*
;; *control-id-inventory-sales-sold-namespace*
;; *control-id-inventory-sales-sold-in-store-namespace*
;; *control-id-documentation-namespace*
;; *control-id-authority-namespace*
;; *control-id-category-namespace*
;; *control-id-theme-namespace*
;; *control-id-location-namespace*
;; *control-id-taxon-namespace*
;; *control-id-technique-namespace*
;; *control-id-mount-namespace*
;; *control-id-material-namespace*
;; *control-id-paper-namespace*
;; *control-id-artist-namespace*
;; *control-id-brand-namespace*
;; *control-id-author-namespace*
;; *control-id-person-namespace*
;; *control-id-publication-namespace*

;;; ==============================

;; :NOTE Currently we don't define these, maybe we should?
;;
;; *uuid-namespace-control-id-display-artist*
;; *uuid-namespace-control-id-image-directory*

;;; ==============================

;;; ==============================

;; `%control-id-namespace-prefetch-uuid-table'
;; (%control-id-namespace-prefetch-uuid-table 'control-id-display-theme)
;;    
;; (multiple-value-bind (namespace-uuid namespace-hash)
;;     (%control-id-namespace-prefetch-uuid-table 'control-id-indexed-theme)
;;   (let* ((indexed-id \"666\")
;;          (indexing-uuid (make-v5-uuid namespace-uuid indexed-id))
;;          (maybe-already-indexed (gethash indexing-uuid namespace-hash)))
;;     (if maybe-already-indexed
;;         (values maybe-already-indexed T)
;;       (values (setf (gethash indexing-uuid namespace-hash) indexed-id) nil))))
;;
;; (control-id-namespace 

;;
;; (type-of (%control-id-namespace-prefetch-uuid-table 'control-id-display-theme))

;;; ==============================

(in-package #:dbc)


;; (find-method #'(setf system-identity-uuid) '(:after) '(t system-object-uuid))
;;
;; (typep  (unicly:make-v5-uuid unicly:*uuid-namespace-oid*
;;                              (string '*system-object-uuid-base-namespace*))
;;         'unicly:unique-universal-identifier)

(defvar *system-object-uuid-base-namespace*
  (make-system-object-uuid
   :base-namespace (unicly:make-v5-uuid unicly:*uuid-namespace-oid*
                                        (string '*system-object-uuid-base-namespace*))
   :control-id '*system-object-uuid-base-namespace*))


;;; ==============================
;;
;; :TODO The namespace objects below need to be encapsulated to a uuid
;; hash-table for lookup purposes.
;;
;; Likewise, we will need a class to represent the various types of control-ids
;; per namespace-type, e.g.:
;;  `control-id-display-name'
;;  `control-id-doc-num'
;;  `control-id-entity-num'
;;  `control-id-db'
;;
;; :NOTE Not clear if these are more system type objects vs  entity type objects:
;; *control-id-user-namespace*
;; *control-id-description-namespace*
;; *control-id-image-namespace*

(defvar *control-id-inventory-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-inventory-namespace*))

(defvar *control-id-inventory-publication-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-inventory-publication-namespace*))

(defvar *control-id-inventory-sales-order-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-inventory-order-namespace*))

(defvar *control-id-inventory-sales-sold-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-inventory-sold-namespace*))

(defvar *control-id-inventory-sales-sold-in-store-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-inventory-sold-in-store-namespace*))

(defvar *control-id-documentation-namespace*
  (make-system-object-uuid 
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-documentation-namespace*))

(defvar *control-id-authority-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-authority-namespace*))

(defvar *control-id-category-namespace*
  (make-system-object-uuid 
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-category-namespace*))

(defvar *control-id-theme-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-theme-namespace*))

;; (find-class (class-name (class-of *control-id-location-namespace*)))
(defvar *control-id-location-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-location-namespace*))

(defvar *control-id-taxon-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-taxon-namespace*))


;;; ==============================
;; media-entity namespaces
;;; ==============================

(defvar *control-id-technique-namespace*
  (make-system-object-uuid 
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-technique-namespace*))

;; (defvar *control-id-color-namespace*
;;    (make-system-object-uuid 
;;     :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
;;     :control-id '*control-id-color-namespace*))

(defvar *control-id-mount-namespace*
  (make-system-object-uuid 
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-mount-namespace*))

(defvar *control-id-material-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-material-namespace*))

(defvar *control-id-paper-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id '*control-id-paper-namespace*))


;;; ==============================
;; naf-entity namespaces
;;; ==============================
;; system-object-uuid *control-id-display-artist-namespace*

(defvar *control-id-artist-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id     '*control-id-artist-namespace*))

(defvar *control-id-brand-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id     '*control-id-brand-namespace*))

(defvar *control-id-author-namespace*
  (make-system-object-uuid 
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id     '*control-id-author-namespace*))

(defvar *control-id-person-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id     '*control-id-person-namespace*))

;; :NOTE what to do about `control-id-display-publication-full'???
(defvar *control-id-publication-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id     '*control-id-publication-namespace*))

;; Is this needed?
(defvar *control-id-image-namespace*
  (make-system-object-uuid
   :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
   :control-id     '*system-object-uuid-base-namespace*))


;;; ==============================

(defvar *control-id-namespace-table* (make-hash-table-uuid :synchronized t))

(dolist (namspace (list *control-id-inventory-namespace*
                        *control-id-documentation-namespace*
                        *control-id-authority-namespace*
                        *control-id-category-namespace*
                        *control-id-theme-namespace*
                        *control-id-location-namespace*
                        *control-id-taxon-namespace*
                        *control-id-technique-namespace*
                        *control-id-mount-namespace*
                        *control-id-material-namespace*
                        *control-id-paper-namespace*
                        *control-id-artist-namespace*
                        *control-id-brand-namespace*
                        *control-id-author-namespace*
                        *control-id-person-namespace*
                        *control-id-publication-namespace*
                        *control-id-image-namespace*
                        ;; *system-object-uuid-base-namespace*
                        ))
  (multiple-value-bind (val found)
      (gethash (system-identity-uuid namspace) *control-id-namespace-table*)
    (unless (and val found)
      (setf (gethash (system-identity-uuid namspace) *control-id-namespace-table*)
            (make-hash-table-uuid :synchronized t)))))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: nil
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
