;; -*-no-byte-compile: t; -*-
;;; ==============================
;;; Notes added: <Timestamp: Sunday June 28, 2009 @ 09:14.13 AM - by Stan>

(defclass tgm-theme (eieio-persistent eieio-named)
 ((theme
   :initarg :theme
   :initform ""
   :type string
   :documentation "This theme")
  (broader-theme
   :initarg :bt
   :initform '()
   :type list
   :documentation
   "alist of themes' broader themes.")
  (narrower-theme
   :initarg :nt
   :initform '()
   :type list
   :documentation "alist of themes' narrower-theme.")
  (related-theme
   :initarg :rt
   :initform '()
   :type list
   :documentation "alist of themes' related themes.")
  (related-theme-dcp
   :initarg :rt-dcp
   :initform '()
   :type list
   :documentation "alist of themes' dcp-specific related themes.")
  (used-for-theme
   :initarg :uf
   :initform '()
   :type list
   :documentation "themes this theme is used for.")
  (use-theme
   :initarg :use
   :initform '()
   :type list
   :documentation "theme to use instead of this theme."))
 "TGM-THEME CLASS")

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-06T10:35:10-05:00Z}#{10056} - by MON>
;;; :NOTE This template was initialized for use with Common Lisp.
;;; :TODO Adjust to match above remove eieio specific slots.
(defpackage #:mon-tgm
  (:use #:cl))

(in-package #:mon-tgm)

;;; *package*
(defclass tgm-concept ()
  ((non-descriptor
    :initarg :non-descriptor
    :accessor :non-descriptor
    :documentation "A Main Topic Name")
   (use 
    :initarg :use
    :accessor :use
    :documentation "Use")
   (uf
    :initarg :uf
    :accessor :uf
    :documentation "Used For.")
    (bt
     :initarg :bt
     :accessor :bt
     :documentation "Broader Topic.")
    (rt
     :initarg :rt
     :accessor :rt
     :documentation "Related Topic.")
   (fun 
    :initarg :fun
    :accessor :fun
    :documentation "Former usage note.")
   (ttcsubj 
    :initarg :ttcsubj    
    :accessor
    :documentation "")
   (fcnlctgm 
    :initarg ;; :fcnlctgm -this sucks
    :accessor ;; 
    :documentation "Former Control Number LOC TGM")
   (tnr 
    :initarg :tnr
    :accessor :tnr
    :documentation "Topic Number.")
    (geo-facet
     :initarg :geo-facet
     :accessor :geo-facet
     :documentation "")
    (sn
     :initarg :sn
     :accessor :sn
     :documentation "Scope Note.")
    ))


;;; ==============================
(setq tgm000037
     (tgm-theme "Abused children"
                :theme "Abused children"
                :file (concat
                       mon-emacs-root
                       "/naf-common-lisp/"
                       "naf-mode-eieio-persistent-obj")
                :rt  '("Crimes")
                :bt  '("Battered children"
                       "Child abuse victims"
                       "Maltreated persons"
                       "Victims of abuse")))

(oref tgm000037 :file)
;=>"/home/sp/stan-workspace/lisp/local-emacs/emacs-load-files/naf-common-lisp/naf-mode-eieio-persistent-obj"

(eieio-persistent-save tgm000037)

(eieio-persistent-read
"/home/sp/stan-workspace/lisp/local-emacs/emacs-load-files/naf-common-lisp/naf-mode-eieio-persistent-obj")

;=>[object tgm-theme "Abused children" "/home/sp/stan-workspace/lisp/local-emacs/emacs-load-files/naf-common-lisp/naf-mode-eieio-persistent-obj" "Abused children" ("Battered children" "Child abuse victims" "Maltreated persons" "Victims of abuse") nil ("Crimes") nil nil nil]

(object-slots tgm000037)
;=> (file theme broader-theme narrower-theme related-theme
;    related-theme-dcp used-for-theme use-theme)

;;; ==============================
;;; when inheriting from eieio-named
(object-name tgm000037)
 ;=>"#<tgm-theme Abused children>"

;;; ==============================
(tgm-theme-p tgm000037) ;=> t
(slot-value tgm000037 :bt)
("Battered children" "Child abuse victims" "Maltreated persons" "Victims of abuse")

(completing-read "which bt? :" (slot-value tgm000037 :bt))
;=>("Battered children" "Child abuse victims"
;;  "Maltreated persons" "Victims of abuse")

(oref tgm000037 :bt)
;=>("Battered children" "Child abuse victims"
;;  "Maltreated persons" "Victims of abuse")

(object-remove-from-list tgm000037 :bt "Battered children")
;=> ("Child abuse victims" "Maltreated persons" "Victims of abuse")


(object-add-to-list tgm000037 :bt "Battered children")
;=> ("Battered children" "Child abuse victims"
;    "Maltreated persons" "Victims of abuse")

(oref tgm000037 :rt-dcp)

(object-add-to-list tgm000037 :rt-dcp "Bad Cats")

(slot-value tgm000037 :rt-dcp)
;=> ("Bad Cats")

(slot-value tgm000037 :rt)
;=>("Crimes")

(slot-value tgm000037 :uf)
;=>nil

(eieio-display-method-list)
(eieio-describe-class tgm-theme)
(eieio-describe-class-slots tgm-theme)
;(eieio-build-class-alist)
(eieiodoc-one-node
(eieiodoc-class tgm-theme "aa")
(eieio-browse 
