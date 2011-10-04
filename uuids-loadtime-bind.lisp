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
;; 

(defvar *control-id-display-taxon-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-taxon-namespace*))

(defvar *control-id-display-category-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-category-namespace*))

(defvar *control-id-display-theme-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-theme-namespace*))

(defvar *control-id-display-technique-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-technique-namespace*))

(defvar *control-id-display-mount-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-mount-namespace*))

(defvar *control-id-display-mount-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-mount-namespace*))

(defvar *control-id-display-meterial-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-meterial-namespace*))

(defvar *control-id-display-artist-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-artist-namespace*))

(defvar *control-id-display-brand-namespace*
    (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                             :control-id '*control-id-display-brand-namespace*))

(defvar *control-id-display-author-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-author-namespace*))

(defvar *control-id-display-person-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-person-namespace*))

(defvar *control-id-display-publication-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-publication-namespace*))


;; (find-class (class-name (class-of *control-id-display-location-namespace*)))
(defvar *control-id-display-location-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-location-namespace*))

(defvar *control-id-display-technique-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-display-technique-namespace*))

;; (make-system-object-uuid  *system-object-uuid-base-namespace*
;;  *uuid-namespace-control-id-display-artist*


 

;;; ==============================
;;; EOF
