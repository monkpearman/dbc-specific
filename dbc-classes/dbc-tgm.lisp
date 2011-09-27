;;-*- Mode: LISP; Syntax: COMMON-LISP; Base: 10 -*-
;;; ======================================================
;;; This is mon-tgm.lisp
;;; 
;;; FILE-CREATED:
;;; <Timestamp: #{2010-02-06T22:12:47-05:00Z}#{10056} - by MON>
;;; ================================================================
;;; Copyright © 2010 MON KEY 
;;; ==============================
;;; CODE:
(in-package #:dbc)

;; (defpackage #:mon-tgm
;;   (:use #:cl #:cl-ppcre))

;; (in-package #:mon-tgm)

;;; *package*

;;; The db code was stolen from Seibels `Practical Common Lisp' chapter 23.

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-06T22:53:05-05:00Z}#{10056} - by MON>
(defvar *tgm-database* (make-hash-table :test #'equal)
  "Hashtable to store TGM term descriptors for caching instances of the
  `tgm-concept' class.")
;;
;; *tgm-database*
;; => #S(HASH-TABLE :TEST EXT:FASTHASH-EQUAL)

;;; `clear-db'
;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-06T22:53:00-05:00Z}#{10056} - by MON>
(defun clear-tgm-db ()
  "Reinitalize the `*tgm-database*' hashtable."
  (setf *tgm-database* (make-hash-table :test #'equal)))

;; (clear-tgm-db)
;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-06T10:35:10-05:00Z}#{10056} - by MON>
;;; :NOTE This template was initialized for use with Common Lisp.
;;; :TODO Adjust to match above remove eieio specific slots.
(defclass tgm-concept ()
  ((concept-name
    :initarg :concept-name
    :accessor tgm.concept-name
    :initform (error "Must supply :concept-name")
    :type 'string
    :documentation 
    "A Main Topic Name")
   (descriptor
    :initarg :descriptor
    :accessor tgm.descriptor
    :initform nil
    :type 'string
    :documentation 
    "A Main Topic Name")
   (non-descriptor
    :initarg :non-descriptor
    :accessor tgm.non-descriptor
    :initform nil
    :type 'string
    :documentation 
    "Occurs when topic has a :USE slot.")
   (use 
    :initarg :use
    :accessor tgm.use
    :initform nil
    :type 'list
    :documentation 
    "Use this concept(s) instead.")
   (uf
    :initarg :uf
    :accessor tgm.uf
    :initform nil
    :type 'list
    :documentation 
    "Concept is Used For.")
   (bt
     :initarg :bt
     :accessor tgm.bt
     :initform nil
     :type 'list
     :documentation 
     "Concept has the Broader-Topic(s).")
   (rt
     :initarg :rt
     :accessor tgm.rt
     :initform nil
     :type 'list
     :documentation 
     "Concept has the Related Topic(s).")
   (nt
    :initarg :nt
    :accessor tgm.nt ;nt
    :initform nil
    :type 'list
    :documentation 
    "Concept has the Narrower Topic(s).")
   (geo-facet
     ;; :NOTE String needs to be split to a list and maybe sub-classed
     ;; Possible values are ":COUNTRY :STATE :CITY"
     :initarg :geo-facet
     :accessor tgm.geo-facet ;geo-facet
     :initform nil
     :type 'string 
     :documentation 
     "Possible values are :NATIONALITY :COUNTRY :STATE :CITY")
   (hn 
    :initarg :hn
    :accessor tgm.hn ;hn
    :initform nil
    :type 'string
    :documentation "")
   (cn 
    :initarg :cn
    :accessor tgm.cn ;cn
    :initform nil
    :type 'string
    :documentation 
    "Concept Catalogers Note. May indicate alternative aspects or subdivisions
    as indicated by the key :SUBDIVIDE-BY")
   (sn
    ;; :NOTE string should/could be split and or sublcassed.
    :initarg :sn
    :accessor tgm.sn ;sn
    :initform nil    
    :type 'string
    :documentation 
    "Concept Scope Note. May indicate appendices and subdivisions. Subdivisions
    are flagged as `--<SUBDIVISION>' with the keys :USED-WITH :NAMES-OF
    :NAME-OF-WAR :ETHNIC-GROUP :RACIAL-GROUP :REGIONAL-GROUP :CLASSES-OF-PERSONS
    :SEARCH-SUBDIVISION :CORPORATE-BODY :NAMED-EVENT etc.")
   (ttcform
    :initarg :ttcform
    :accessor tgm.ttcform ;ttcform
    :initform nil
    :type 'string
    :documentation 
    "Concept has the Marc code for the Genre/Format.")
   (ttcsubj 
    :initarg :ttcsubj    
    :accessor tgm.ttcsubj ;ttcsubj
    :initform nil
    :type 'string
    :documentation "Concept has MARC code subject.")
   (:frmr-usage ;:fun
    :initarg :frmr-usage ;:fun
    :accessor tgm.frmr-usage ;fun
    :initform nil    
    :type 'string
    :documentation 
    "Concept Former Usage Note. Typically indicates concept was formerly a TGMI,
    TGM2, or TGM1 and TGM2 term and whether it was postable as such.")
   (tnr 
    :initarg :tnr
    :accessor tgm.tnr
    :initform nil    
    :type 'string
    :documentation 
    "Topic Number.")
   (frmr-gmgpc ;;fcngmgpc <- This name sucks
    :initarg  :frmr-gmgpc ;; :fcngmgpc 
    :accessor tgm.frmr-gmgpc ;fcngmgpc
    :initform nil    
    :type 'string
    :documentation "")
   (frmr-cntl  ;; fcnlctgm  <- This name sucks
    :initarg   :frmr-cntl ;; :fcnlctgm
    :accessor  tgm.frmr-cntl  ;fcnlctgm 
    :initform nil    
    :type 'string
    :documentation 
    "Former Control Number LOC TGM")
    ))

;;; `intern-feature'
;;; ==============================
(defun tgm-db (concept)
  (or (gethash concept *tgm-database*)
      (setf (gethash concept *tgm-database*)
            (make-instance 'tgm-concept :concept-name concept))))

;;; `extract-features'
;;; ==============================
;;; :SEE /home/sp/HG-Repos/mon-notes-HG/tgm-conversion-elisp-notes/lispified-tgm
;;; :NOTE Following isn't right we need to either: 
;;;        o Read the list from file from a file;
;;;        o bind to  symbol and read that;
;;;       Either way the list prob. isn't quite right 
;(defun populate-concepts (concept-list)
;  (mapcar #'intern-feature 
;	  (mapcar #'car concept-list)))

;;; ==============================
;;; (defmethod print-object ((object word-feature) stream)
;;;   (print-unreadable-object (object stream :type t)
;;;     (with-slots (word ham-count spam-count) object
;;;       (format stream "~s :hams ~d :spams ~d" word ham-count spam-count))))
(defmethod print-object ((object tgm-concept) stream)
  (print-unreadable-object (object stream :type t)
    (with-slots (concept-name descriptor non-descriptor
                 use uf bt rt nt tnr 
		 ;;geo-facet hn cn sn ttcform ttcsubj fun fcngmgpc fcnlctgm
		 ) object
      (format stream 
	      "~s~&:descriptor ~s~&:non-descriptor ~s~&:use ~S~&:uf ~S~&:bt ~S~&:rt ~S~&:nt ~S~&:tnr ~s"
	      ;;~&:geo-facet ~s~&:hn ~s~&:cn ~s~&:sn ~s~&:ttcsubj ~s~&:fun ~s~&:tnr ~s~&:fcngmgpc ~s~&:fcnlctgm ~s"
	      concept-name descriptor non-descriptor
	      use uf bt rt nt tnr 
	      ;;geo-facet hn cn sn ttcform ttcsubj fun fcngmgpc fcnlctgm
	      ))))

(defun map-concept-slots (concept-slots)
  (mapc #'(lambda (x)
	    (let ((cs (cadar concept-slots)))
	      ;;(tgm-db cs)
	      (setq cs (make-instance 'tgm-concept :concept-name cs))
	      (setf (slot-value (tgm-db cs) (car x)) (cadr x))))
	concept-slots))

;;; ==============================
;;; :NOTE to read the string in as a symbol 
;;; (preferably after frobbing it with a regexp to replace whitespace with -)
;;; (with-input-from-string (sym "Writing") (read sym))

;;; ==============================
;; use uf bt rt nt
;; (defparameter *some-topic* nil)
;; (setf *some-topic* (make-instance 'tgm-concept))
;;; (describe-symbol '*some-topic*)

;;;(print-object *some-topic* t)
;;;(setf (slot-value *some-topic* 'sn) "test")
;; (:sn *some-topic*)
;; (setf (:use *some-topic*) "test-use")
;; (slot-value *some-topic* 'sn)
;; (tgm-concept *some-topic* 'sn)
;; (mapcar 
;; 
;;; ==============================

;;; (clear-tgm-db)

;;; (concept-name (tgm-db "Zoos"))
;;; (setf (descriptor (tgm-db "Zoos")) (tgm-db "Zoos")
;;;       (non-descriptor (tgm-db "Zoos")) "not Zoos")
;;;       (use (tgm-db "Zoos")) '("not Using")
;;;       (uf (tgm-db "Zoos")) '("not Used For")
;;;       (bt (tgm-db "Zoos")) '("Some BT" "Some BT1")
;;;       (rt (tgm-db "Zoos")) '("Some RT" "Some RT1")
;;;       (nt (tgm-db "Zoos")) '("Some NT" "Some NT1"))

;;; (tgm-db "Zoos")

;;; ==============================
;;; (TGM-CONCEPT
;;;  (:DESCRIPTOR "Zouaves") (:GEO-FACET ":COUNTRY :STATE")
;;;  (:SN
;;;   "For the French infantry unit that wore a brillant uniform 
;;;    or any military unit that adopted the dress of the Zouaves.")
;;;  (:BT ("Military organizations"))
;;;  (:CN
;;;   ":SUBDIVIDE-BY geographically by the :COUNTRY or :STATE from which the Zouave unit comes.")
;;;  (:FUN "Formerly TGMI term.") (:TTCSUBJ "Subject [MARC 150/650]")
;;;  (:FCNLCTGM "lctgm011889") (:TNR "tgm011926"))

;;; ==============================
;;; EOF

