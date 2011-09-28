;;; :FILE-CREATED <Timestamp: #{2011-05-21T18:53:41-04:00Z}#{11206} - by MON>
;;; :FILE dbc-specific/uuids-loadtime-bind.lisp
;;; ==============================


(in-package #:dbc)
;; *package*


(defvar *uuid-namespace-control-id-base-namespace*
  (unicly:make-v5-uuid unicly:*UUID-NAMESPACE-OID*
                       (string '*uuid-namespace-control-id-base-namespace*)))

;; (simple-bit-vector-p 
;; (let ((bv (unicly:uuid-to-bit-vector *uuid-namespace-control-id-base-namespace*)))
;; (upgraded-array-element-type (type-of (make-array 128 :element-type 'bit :initial-element 0)))
;; (array-element-type (make-array 128 :element-type 'bit :initial-element 0))
;; 
;; (upgraded-array-element-type (type-of (make-array 128 :element-type 'bit :initial-element 0)))
;; (uuid-to-bit-vector (make-instance 'unique-universal-identifier))
;;
;; 


;; unicly:make-hash-table-uuid
;; http://www.lispworks.com/reference/HyperSpec/Body/f_bt_and.htm
;; (make-uuid-namespace-control-id :base-namespace *uuid-namespace-control-id-base-namespace* 
;;                                 :control-id '*uuid-namespace-control-id-display-artist*)
;;
;; (unicly:make-v5-uuid 
;;  *uuid-namespace-control-id-base-namespace* 
;;   (string '*uuid-namespace-control-id-display-artist*))


;; (symbol '*uuid-namespace-control-id-base-namespace*)

;; *uuid-namespace-control-id-image-directory*  
;; 
;; *uuid-namespace-control-id-display-artist*
;; *uuid-namespace-control-id-display-artist*
;; *uuid-namespace-control-id-display-artist*
;; *uuid-namespace-control-id-display-brand*
;; *uuid-namespace-control-id-display-author*
;; *uuid-namespace-control-id-display-person*
;; *uuid-namespace-control-id-display-publication*
;; *uuid-namespace-control-id-display-location*
;; *uuid-namespace-control-id-display-technique*


;;; ==============================
;;; EOF
