;;; :FILE-CREATED <Timestamp: #{2011-05-21T18:53:41-04:00Z}#{11206} - by MON>
;;; :FILE dbc-specific/uuids-loadtime-bind.lisp
;;; ==============================


(in-package #:dbc)
;; *package*

(defvar *system-object-uuid-base-namespace*
  (make-system-object-uuid  :base-namespace (unicly:make-v5-uuid unicly:*uuid-namespace-oid*
                                                                 (string '*system-object-uuid-base-namespace*))
                            :control-id '*system-object-uuid-base-namespace*))

;;(let ((base-control-id (make-instance 'base-control-id :control-id-namespace

;; (simple-bit-vector-p 
;; (let ((bv (unicly:uuid-to-bit-vector *system-object-uuid-base-namespace*)))
;; (upgraded-array-element-type (type-of (make-array 128 :element-type 'bit :initial-element 0)))
;; (array-element-type (make-array 128 :element-type 'bit :initial-element 0))
;; 
;; (upgraded-array-element-type (type-of (make-array 128 :element-type 'bit :initial-element 0)))
;; (uuid-to-bit-vector (make-instance 'unique-universal-identifier))
;;
;; 


;; unicly:make-hash-table-uuid
;; http://www.lispworks.com/reference/HyperSpec/Body/f_bt_and.htm
;; (make-uuid-namespace-control-id :base-namespace *system-object-uuid-base-namespace* 
;;                                 :control-id '*uuid-namespace-control-id-display-artist*)
;;
;; (unicly:make-v5-uuid 
;;  *system-object-uuid-base-namespace* 
;;   (string '*uuid-namespace-control-id-display-artist*))
;;
;;
;; '*system-object-uuid-base-namespace*
;;
;; *uuid-namespace-control-id-image-directory*  

;;; ==============================
;;
;; :TODO The namespace objects below need to be encapsulated to a uuid hash-table for lookup purposes.
;; Likewise, we will need a class to represent the various types of control-ids per namespace-type, e.g.
;; `control-id-display-name'
;; `control-id-doc-num'
;; `control-id-entity-num'
;; `control-id-db'
;;
;; :NOTE Not clear if these are more system type objects entity type objects:
;; *control-id-display-user-namespace*
;; *control-id-display-documentation-namespace*
;; *control-id-display-description-namespace*
;; *control-id-display-image-namespace*

(defvar *control-id-display-taxon-namespace*
  ;; "91103f04-b8b8-52b2-821b-eaa83d3c6cc7"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-taxon-namespace*))

(defvar *control-id-display-category-namespace*
  ;; "847b4603-59f6-5213-87f1-a9ac281960e9"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-category-namespace*))

(defvar *control-id-display-theme-namespace*
  ;; "f7d30217-43c6-5fa8-8411-3b22f1bda8a9"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-theme-namespace*))

;; (find-class (class-name (class-of *control-id-display-location-namespace*)))
(defvar *control-id-display-location-namespace*
  ;; "232e5c3e-aaf4-523c-9b61-e525a85e2c07"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-location-namespace*))


;;; ==============================
;; media-entity display namespaces
;;; ==============================
(defvar *control-id-display-technique-namespace*
  ;; "68b3c894-17af-5e47-ac77-88555d0accd1"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-technique-namespace*))

;; (defvar *control-id-display-color-namespace*
;;   (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
;;                            :control-id '*control-id-display-color-namespace*))

(defvar *control-id-display-mount-namespace*
  ;; "07756ef9-021b-56fc-83e3-435d8552cc8e"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-mount-namespace*))

(defvar *control-id-display-material-namespace*
  ;; "18b38b5f-974e-512f-b280-e965e9b98a22"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-material-namespace*))

(defvar *control-id-display-paper-namespace*
  ;; "0796d6e5-c83c-5aef-8617-5be908fe1ad2"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-paper-namespace*))


;;; ==============================
;; naf-entity display namespaces
;;; ==============================
(defvar *control-id-display-artist-namespace*
  ;; "a9289f54-133a-5c0d-8478-651f8ebbf23a"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-artist-namespace*))

(defvar *control-id-display-brand-namespace*
  ;; "eb8c3f24-1016-5c40-bedf-3aeab3d52723"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-brand-namespace*))

(defvar *control-id-display-author-namespace*
  ;; "32255517-b15e-5b99-b887-59e02109cb2b"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-author-namespace*))

(defvar *control-id-display-person-namespace*
  ;; "2416f575-1c49-54ac-a641-04f3a147c280"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-person-namespace*))

;; :NOTE what to do about `control-id-display-publication-full'???
(defvar *control-id-display-publication-namespace*
  ;; "01fa791e-7a39-5b8e-9f97-f70dc48d8fc3"
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-publication-namespace*))


;;; ==============================
;;; EOF
