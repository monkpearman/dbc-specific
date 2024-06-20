;;; :FILE-CREATED <Timestamp: #{2011-05-21T18:53:41-04:00Z}#{11206} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-uuid-vars.lisp
;;; ==============================

;; *system-object-uuid-base-namespace*
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

#|

(defun make-system-object-uuid (&key base-namespace control-id)
  (declare (unicly:unique-universal-identifier base-namespace)
           #-:mon (type (or string (and symbol (not null))) control-id)
           #+:mon ((or mon:string-not-null-empty-or-all-whitespace mon:symbol-not-null)
                   control-id))
  ;; #-:mon (%verify-valid-string-or-symbol-for-identity identity)
  (let ((new-obj   (make-instance 'system-object-uuid))
        (new-nmspc (unicly:make-v5-uuid base-namespace 
                                        (if (symbolp control-id) 
                                            (string control-id)
                                            control-id))))
    (setf (system-identity new-obj) (list base-namespace control-id))
    (setf (system-identity-uuid new-obj) new-nmspc)
    new-obj))

uuid-hex-string-36-p
|#


(in-package #:dbc)

;; (find-method #'(setf system-identity-uuid) '(:after) '(t system-object-uuid))
;; (typep  (unicly:make-v5-uuid unicly:*uuid-namespace-oid* (string '*system-object-uuid-base-namespace*)) 'unicly:unique-universal-identifier)

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
;; Likewise, we will need a class to represent the various types of control-ids per namespace-type, e.g.:
;; `control-id-display-name'
;; `control-id-doc-num'
;; `control-id-entity-num'
;; `control-id-db'
;;
;; :NOTE Not clear if these are more system type objects entity type objects:
;; *control-id-user-namespace*
;; *control-id-description-namespace*
;; *control-id-image-namespace*

(defvar *control-id-inventory-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-inventory-namespace*))

(defvar *control-id-inventory-publication-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-inventory-publication-namespace*))

(defvar *control-id-inventory-sales-order-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-inventory-order-namespace*))

(defvar *control-id-inventory-sales-sold-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-inventory-sold-namespace*))

(defvar *control-id-inventory-sales-sold-in-store-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-inventory-sold-in-store-namespace*))

(defvar *control-id-documentation-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-documentation-namespace*))

(defvar *control-id-authority-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-authority-namespace*))

(defvar *control-id-category-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-category-namespace*))

(defvar *control-id-theme-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-theme-namespace*))

;; (find-class (class-name (class-of *control-id-location-namespace*)))
(defvar *control-id-location-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-location-namespace*))

(defvar *control-id-taxon-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-taxon-namespace*))


;;; ==============================
;; media-entity namespaces
;;; ==============================
(defvar *control-id-technique-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-technique-namespace*))

;; (defvar *control-id-color-namespace*
;;   (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
;;                            :control-id '*control-id-color-namespace*))

(defvar *control-id-mount-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-mount-namespace*))

(defvar *control-id-material-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-material-namespace*))

(defvar *control-id-paper-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-paper-namespace*))


;;; ==============================
;; naf-entity namespaces
;;; ==============================
;; system-object-uuid *control-id-display-artist-namespace*

(defvar *control-id-artist-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-artist-namespace*))

(defvar *control-id-brand-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-brand-namespace*))

(defvar *control-id-author-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-author-namespace*))

(defvar *control-id-person-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-person-namespace*))

;; :NOTE what to do about `control-id-display-publication-full'???
(defvar *control-id-publication-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*control-id-publication-namespace*))

;; is this needed?
(defvar *control-id-image-namespace*
  (make-system-object-uuid :base-namespace (system-identity-uuid *system-object-uuid-base-namespace*)
                           :control-id '*system-object-uuid-base-namespace*))

;;; ==============================

(defvar *control-id-namespace-table* (make-hash-table-uuid))

(dolist (namspace (list *control-id-inventory-namespace*
                        *control-id-documentation-namespace* *control-id-authority-namespace*
                        *control-id-category-namespace* *control-id-theme-namespace*
                        *control-id-location-namespace* *control-id-taxon-namespace*
                        *control-id-technique-namespace* *control-id-mount-namespace*
                        *control-id-material-namespace* *control-id-paper-namespace*
                        *control-id-artist-namespace* *control-id-brand-namespace*
                        *control-id-author-namespace* *control-id-person-namespace*
                        *control-id-publication-namespace*
                        *control-id-image-namespace*
                        ;; *system-object-uuid-base-namespace*
                        ))
  (multiple-value-bind (val found)
      (gethash (system-identity-uuid namspace) *control-id-namespace-table*)
    (unless (and val found)
      (setf (gethash (system-identity-uuid namspace) *control-id-namespace-table*)
            (make-hash-table-uuid)))))



;;; ==============================
;;; EOF
