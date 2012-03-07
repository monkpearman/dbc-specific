;;; :FILE-CREATED <Timestamp: #{2011-01-06T13:37:33-05:00Z}#{11014} - by MON>
;;; :FILE dbc-classes/dbc-class-parsed-inventory-record.lisp
;;; ==============================

;; NOTE Our largest item-ref from the xml/sql parse is 12416 our largest picture
;; in httpd/photos/big is 12415


(in-package #:dbc)
;; *package*

;; (make-instance 'parsed-inventory-record)

;;; ==============================

(defclass parsed-inventory-record (parsed-class)
  ((inventory-number  ;; control-id-indexed-inventory-record
    :initarg :inventory-number
    :accessor inventory-number
    :documentation ":ORIGINAL-FIELD \"ref\"")

   (description-inventory-title
    :initarg :description-inventory-title
    :accessor description-inventory-title
    :documentation  ":ORIGINAL-FIELD \"title\"")

   (description-inventory-french ;; description-class
    :initarg :description-inventory-french
    :accessor description-inventory-french
    :documentation ":ORIGINAL-FIELD \"desc_fr\"")

   (description-inventory-english ;; description-class
    :initarg :description-inventory-english
    :accessor description-inventory-english
    :documentation ":ORIGINAL-FIELD \"desc_en\"")

   (ignorable-history-french
    :initarg :ignorable-history-french
    :accessor ignorable-history-french
    :documentation ":ORIGINAL-FIELD \"histo_fr\"")

   (ignorable-history-english
    :initarg  :ignorable-history-english
    :accessor ignorable-history-english
    :documentation ":ORIGINAL-FIELD \"histo_en\"")

   (description-inventory-quote
    :initarg :description-inventory-quote
    :accessor description-inventory-quote
    :documentation ":ORIGINAL-FIELD \"text_quote\"")

   (description-inventory-translation
    :initarg  :description-inventory-translation
    :accessor description-inventory-translation
    :documentation ":ORIGINAL-FIELD \"translation\"")

   (naf-entity-person-coref
    :initarg :naf-entity-person-coref
    :accessor naf-entity-person-coref
    :documentation ":ORIGINAL-FIELD \"people\"")

   (naf-entity-brand-coref
    :initarg :naf-entity-brand-coref
    :accessor naf-entity-brand-coref
    :documentation ":ORIGINAL-FIELD \"brand\"")

   (naf-entity-composer-coref
    :initarg :naf-entity-composer-coref
    :accessor naf-entity-composer-coref
    :documentation ":ORIGINAL-FIELD \"composer\"")

   (naf-entity-artist-coref
    :initarg :naf-entity-artist-coref
    :accessor naf-entity-artist-coref
    :documentation ":ORIGINAL-FIELD \"artist\"")

   (naf-entity-author-coref
    :initarg :naf-entity-author-coref
    :accessor naf-entity-author-coref
    :documentation ":ORIGINAL-FIELD \"author\"")

   (taxon-entity-coref
    :initarg :taxon-entity-coref
    :accessor taxon-entity-coref
    :documentation ":ORIGINAL-FIELD \"latin_name\"")

   (naf-entity-publication-coref
    :initarg :naf-entity-publication-coref
    :accessor naf-entity-publication-coref
    :documentation ":ORIGINAL-FIELD \"book\"")

   ;; publication-publisher-entity ??
   (publication-publisher ;; 
    :initarg :publication-publisher
    :accessor publication-publisher
    :documentation ":ORIGINAL-FIELD \"publisher\"")

   ;; publication-location-entity ??
   (publication-location ;; For congruence with birth-location death-location
    :initarg :publication-location
    :accessor publication-location
    :documentation ":ORIGINAL-FIELD \"publish_location\"")

   (publication-volumes ;; for congruence with class `parsed-publication-record' 
    :initarg :publication-volumes
    :accessor publication-volumes
    :documentation ":ORIGINAL-FIELD \"volume\"")

   (publication-edition
    :initarg :publication-edition
    :accessor publication-edition
    :documentation ":ORIGINAL-FIELD \"edition\"")

   (publication-pages
    :initarg :publication-pages
    :accessor publication-pages
    :documentation ":ORIGINAL-FIELD \"page\"")

   (publication-plates ;; :NOTE this is the only field which has its first character capitalized
    :initarg :publication-plates
    :accessor publication-plates
    :documentation    ":ORIGINAL-FIELD \"Plate_number\"")

   (publication-issue
    :initarg :publication-issue
    :accessor publication-issue
    :documentation ":ORIGINAL-FIELD \"issue\"")

   ;; It isn't totally clear yet if this is neccesarrily a publication related field
   (publication-date ;; For congruence with birth-date death-date 
    :initarg :publication-date
    :accessor publication-date  
    :documentation ":ORIGINAL-FIELD \"year\"")
   ;; It isn't totally clear yet if this is neccesarrily a publication related field
   (publication-date-range
    :initarg :publication-date-range
    :accessor publication-date-range
    :documentation ":ORIGINAL-FIELD \"year_year\"") 

   (category-entity-0-coref
    :initarg :category-entity-0-coref
    :accessor category-entity-0-coref
    :documentation ":ORIGINAL-FIELD \"categ\"")

   (category-entity-1-coref
    :initarg :category-entity-1-coref
    :accessor category-entity-1-coref
    :documentation ":ORIGINAL-FIELD \"c1\"")

   (category-entity-2-coref
    :initarg :category-entity-2-coref
    :accessor category-entity-2-coref
    :documentation ":ORIGINAL-FIELD \"c2\"")

   (category-entity-3-coref
    :initarg :category-entity-3-coref
    :accessor category-entity-3-coref
    :documentation ":ORIGINAL-FIELD \"c3\"")

   (category-entity-4-coref
    :initarg :category-entity-4-coref
    :accessor category-entity-4-coref
    :documentation ":ORIGINAL-FIELD \"c4\"")

   (category-entity-5-coref
    :initarg :category-entity-5-coref
    :accessor category-entity-5-coref
    :documentation ":ORIGINAL-FIELD \"c5\"")

   (category-entity-6-coref
    :initarg :category-entity-6-coref
    :accessor category-entity-6-coref
    :documentation ":ORIGINAL-FIELD \"c6\"")

   (category-entity-precedence-list
    :initarg :category-entity-precedence-list
    :accessor category-entity-precedence-list
    :documentation ":ORIGINAL-FIELD \"bct\"")

   (documentation-category-entity-0-coref
    :initarg :documentation-category-entity-0-coref
    :accessor documentation-category-entity-0-coref
    :documentation ":ORIGINAL-FIELD \"categ_doc\"")

   (documentation-category-entity-1-coref
    :initarg :documentation-category-entity-1-coref
    :accessor documentation-category-entity-1-coref
    :documentation ":ORIGINAL-FIELD \"c1_doc\"")

   (documentation-category-entity-2-coref
    :initarg :documentation-category-entity-2-coref
    :accessor documentation-category-entity-2-coref
    :documentation ":ORIGINAL-FIELD \"c2_doc\"")

   (documentation-category-entity-3-coref
    :initarg :documentation-category-entity-3-coref
    :accessor documentation-category-entity-3-coref
    :documentation ":ORIGINAL-FIELD \"c3_doc\"")

   (theme-entity-0-coref
    :initarg :theme-entity-0-coref
    :accessor theme-entity-0-coref
    :documentation ":ORIGINAL-FIELD \"theme\"")

   (theme-entity-1-coref
    :initarg :theme-entity-1-coref
    :accessor theme-entity-1-coref
    :documentation ":ORIGINAL-FIELD \"theme2\"")

   (theme-entity-2-coref
    :initarg :theme-entity-2-coref
    :accessor theme-entity-2-coref
    :documentation ":ORIGINAL-FIELD \"theme3\"")
 
   (price-ask ;; The "-ask" suffix is for congruence with "price-ebay" :NOTE Need price-paid, price-sold,
    :initarg :price-ask
    :accessor price-ask
    :documentation ":ORIGINAL-FIELD \"price\"")

   (keywords-sequence
    :initarg :keywords-sequence
    :accessor keywords-sequence
    :documentation ":ORIGINAL-FIELD \"keywords\"")

   (description-inventory-condition ;; description-class
    :initarg :description-inventory-condition
    :accessor description-inventory-condition
    :documentation ":ORIGINAL-FIELD \"condition\"")

   (media-entity-mount
    :initarg :media-entity-mount
    :accessor media-entity-mount
    :documentation ":ORIGINAL-FIELD \"onlinen\"")

   (media-entity-technique
    :initarg :media-entity-technique
    :accessor media-entity-technique
    :documentation ":ORIGINAL-FIELD \"technique\"")

   (media-entity-paper
    :initarg :media-entity-paper
    :accessor media-entity-paper
    :documentation ":ORIGINAL-FIELD \"paper\"")

   (media-entity-color
    :initarg :media-entity-color
    :accessor media-entity-color
    :documentation ":ORIGINAL-FIELD \"color\"")

   (unit-width
    :initarg :unit-width
    :accessor unit-width
    :documentation ":ORIGINAL-FIELD \"w\"")

   (unit-height
    :initarg :unit-height
    :accessor unit-height
    :documentation ":ORIGINAL-FIELD \"h\"")

   (ignorable-number ;; probably empty  
    :initarg :ignorable-number
    :accessor ignorable-number
    :documentation ":ORIGINAL-FIELD \"nbre\"")

   (inventory-seller
    :initarg :inventory-seller
    :accessor inventory-seller
    :documentation ":ORIGINAL-FIELD \"seller\"")

   (inventory-bar-code
    :initarg :inventory-bar-code
    :accessor inventory-bar-code
    :documentation ":ORIGINAL-FIELD \"bar_code\"")

   ;; :NOTE See ignorable-shipping-weight-combined, ignorable-shipping-weight-combined-pounds,
   ;; ignorable-shipping-weight-combined-ounces slot in class
   ;; `parsed-inventory-record'
   (unit-weight 
    :initarg :unit-weight
    :accessor unit-weight
    :documentation ":ORIGINAL-FIELD \"weight\"")

   (edit-by-creator
    :initarg :edit-by-creator
    :accessor edit-by-creator
    :documentation ":ORIGINAL-FIELD \"user_name\"")

   (job-complete
    :initarg :job-complete
    :accessor job-complete
    :documentation ":ORIGINAL-FIELD \"done\"")

   (job-id
    :initarg :job-id
    :accessor job-id
    :documentation ":ORIGINAL-FIELD \"job_name\"")

   (job-locked ;; IGNORABLE  
    :initarg :job-locked
    :accessor job-locked
    :documentation ":ORIGINAL-FIELD \"locked\"")

   (record-status-active
    :initarg :record-status-active
    :accessor record-status-active
    :documentation ":ORIGINAL-FIELD \"online\"")

   (inventory-uri
    :initarg :inventory-uri
    :accessor inventory-uri
    :documentation ":ORIGINAL-FIELD \"uri\"")

   (ignorable-notes
    :initarg :ignorable-notes
    :accessor ignorable-notes
    :documentation ":ORIGINAL-FIELD \"notes\"")

   (ignorable-keywords-type
    :initarg :ignorable-keywords-type
    :accessor ignorable-keywords-type
    :documentation ":ORIGINAL-FIELD \"keywords_type\"")

   (inventory-can-repro ;; IGNORABLE  
    :initarg :inventory-can-repro
    :accessor inventory-can-repro
    :documentation ":ORIGINAL-FIELD \"av_repro\"")

   (documentation-related
    :initarg :documentation-related
    :accessor documentation-related
    :documentation ":ORIGINAL-FIELD \"related_doc\"")

   (price-sold-ebay
    :initarg :price-sold-ebay
    :accessor price-sold-ebay
    :documentation ":ORIGINAL-FIELD \"ebay_final\"")

   (price-ask-ebay
    :initarg :price-ask-ebay
    :accessor price-ask-ebay
    :documentation ":ORIGINAL-FIELD \"ebay_price\"")

   (title-ebay
    :initarg :title-ebay
    :accessor title-ebay
    :documentation ":ORIGINAL-FIELD \"ebay_title\"")

   (control-id-ebay
    :initarg :control-id-ebay
    :accessor control-id-ebay
    :documentation ":ORIGINAL-FIELD \"ebay_id\"")

   (description-inventory-seo-title
    :initarg :description-inventory-seo-title
    :accessor description-inventory-seo-title
    :documentation ":ORIGINAL-FIELD \"seo_title\"")

   (description-inventory-seo
    :initarg :description-inventory-seo
    :accessor description-inventory-seo
    :documentation ":ORIGINAL-FIELD \"description_seo\"")

   (keywords-seo
    :initarg :keywords-seo
    :accessor keywords-seo
    :documentation ":ORIGINAL-FIELD \"keywords_seo\"")

   ;; shares-generic   
   (edit-date-origin ;; IGNORABLE assuming date_edit is present and corresponds.
    :initarg :edit-date-origin
    :accessor edit-date-origin
    :documentation ":ORIGINAL-FIELD \"date\"")

   ;; shares-generic   
   (edit-date 
    :initarg :edit-date
    :accessor edit-date
    :documentation ":ORIGINAL-FIELD \"date_edit\"")

   (edit-history
    :initarg :edit-history
    :accessor edit-history
    :documentation ":ORIGINAL-FIELD \"edit_history\""))
  (:documentation 
   #.(format nil
             "Class for parsed dbc xml `refs` table.~%~@
:EXAMPLE ~%
 \(mon:class-slot-list  'parsed-inventory-record\)~%~@
:NOTE the accessor `inventory-number' should be used as value for the
KEY-ACCESSOR keyword of `load-sax-parsed-xml-file-to-parsed-class-hash'.~%
:SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash',
`write-sax-parsed-xml-refs-file', `set-parsed-inventory-record-slot-value'.~%▶▶▶")))

;; (make-instance 'parsed-inventory-record)
;; => #<PARSED-INVENTORY-RECORD NIL>
;; (nth-value 0 (gethash "9842" (parsed-class-parse-table 'parsed-inventory-record)))
;; => #<PARSED-INVENTORY-RECORD "009842">
(defmethod print-object ((object parsed-inventory-record) stream)
  (print-unreadable-object (object stream :type t) 
    (let* ((inv-num (and (slot-boundp object 'inventory-number)
                         (slot-value object 'inventory-number)))
           (inv-num-if (and (stringp inv-num)
                            (control-id-indexed-number-zero-padded-string inv-num))))
      (declare (mon:string-or-null inv-num-if))
      (format stream "~S" inv-num-if))))

;; control-id-entity-num-artist

(make-parsed-class-field-slot-accessor-mapping
 'parsed-inventory-record
 '(("ref"               . inventory-number)
   ("title"             . description-inventory-title)
   ("desc_fr"           . description-inventory-french)
   ("desc_en"           . description-inventory-english)
   ("histo_fr"          . ignorable-history-french)
   ("histo_en"          . ignorable-history-english)
   ("text_quote"        . description-inventory-quote)
   ("translation"       . description-inventory-translation)
   ("people"            . naf-entity-person-coref)
   ("brand"             . naf-entity-brand-coref)
   ("composer"          . naf-entity-composer-coref)
   ("artist"            . naf-entity-artist-coref)
   ("author"            . naf-entity-author-coref)
   ("latin_name"        . taxon-entity-coref)
   ("book"              . naf-entity-publication-coref)
   ("publisher"         . publication-publisher)
   ("publish_location"  . publication-location)
   ("volume"            . publication-volumes)
   ("edition"           . publication-edition)
   ("page"              . publication-pages)
   ("Plate_number"      . publication-plates) ; note case
   ("issue"             . publication-issue)
   ("year"              . publication-date)
   ("year_year"         . publication-date-range)
   ("categ"             . category-entity-0-coref) 
   ("c1"                . category-entity-1-coref)
   ("c2"                . category-entity-2-coref)
   ("c3"                . category-entity-3-coref)
   ("c4"                . category-entity-4-coref)
   ("c5"                . category-entity-5-coref)
   ("c6"                . category-entity-6-coref)
   ("bct"               . category-entity-precedence-list)
   ("categ_doc"         . documentation-category-entity-0-coref)
   ("c1_doc"            . documentation-category-entity-1-coref)
   ("c2_doc"            . documentation-category-entity-2-coref)
   ("c3_doc"            . documentation-category-entity-3-coref)
   ("theme"             . theme-entity-0-coref)
   ("theme2"            . theme-entity-1-coref)
   ("theme3"            . theme-entity-2-coref)
   ("price"             . price-ask)
   ("keywords"          . keywords-sequence)
   ("condition"         . description-inventory-condition)
   ("onlinen"           . media-entity-mount)
   ("technique"         . media-entity-technique)
   ("paper"             . media-entity-paper) ; media-entity-material
   ("color"             . media-entity-color)
   ("w"                 . unit-width)
   ("h"                 . unit-height)
   ("nbre"              . ignorable-number)
   ("seller"            . inventory-seller)
   ("bar_code"          . inventory-bar-code)
   ("weight"            . unit-weight)
   ("user_name"         . edit-by-creator)
   ("done"              . job-complete)
   ("job_name"          . job-id)
   ("locked"            . job-locked) ;; or maybe ignorable-job-locked
   ("online"            . record-status-active)
   ("uri"               . inventory-uri)
   ("notes"             . ignorable-notes)
   ("keywords_type"     . ignorable-keywords-type)
   ("av_repro"          . inventory-can-repro)
   ("related_doc"       . documentation-related)
   ("ebay_final"        . price-sold-ebay)
   ("ebay_price"        . price-ask-ebay)
   ("ebay_title"        . title-ebay)
   ("ebay_id"           . control-id-ebay)
   ("seo_title"         . description-inventory-seo-title)
   ("description_seo"   . description-inventory-seo)
   ("keywords_seo"      . keywords-seo)
   ("date"              . edit-date-origin)
   ("date_edit"         . edit-date)
   ("edit_history"      . edit-history))
 )

;; (defun parsed-inventory-record-xml-dump-file-and-hash (&key 
;;                                                        (input-file (make-pathname 
;;                                                                     :directory (pathname-directory (sub-path *xml-input-dir*)) 
;;                                                                     :name "dump-refs-DUMPING"))
;;                                                        ;; (output-pathname-sub-directory `(,(concatenate 'string "parsed-xml-inventory-records-"
;;                                                        ;;                                                (mon:time-string-yyyy-mm-dd))))
;;                                                        (output-pathname-sub-directory '("parsed-xml-inventory-records"))
;;                                                        (output-pathname-base-directory (sub-path *xml-output-dir*))
;;                                                        (output-pathname-name "inventory-records")
;;                                                        (output-pathname-dated-p t)
;;                                                        (output-pathname-type "lisp")
;;                                                        (set-inventory-record-table t))
;;   (let ((parsed-xml-file
;;          (multiple-value-list 
;;           (write-sax-parsed-xml-to-file
;;            :input-file input-file
;;            :output-file (make-parsed-class-output-file-ensuring-pathname
;;                          :pathname-sub-directory output-pathname-sub-directory
;;                          :pathname-base-directory output-pathname-base-directory
;;                          :pathname-name output-pathname-name
;;                          :pathname-name-dated-p output-pathname-dated-p
;;                          :pathname-type output-pathname-type))))
;;         (parsed-hash (make-hash-table :test 'equal)))
;;     ;; (if (cadr parsed-xml-file)
;;     (load-sax-parsed-xml-file-to-parsed-class-hash
;;      :parsed-class 'parsed-inventory-record  
;;      :input-file (cadr parsed-xml-file)
;;      :hash-table  parsed-hash
;;      :key-accessor  #'inventory-number
;;      :slot-dispatch-function #'set-parsed-inventory-record-slot-value)
;;     (values 
;;      (if set-inventory-record-table
;;          (setf (gethash 'parsed-inventory-record *parsed-class-parse-table*) parsed-hash)
;;          parsed-hash)
;;      (cadr parsed-xml-file))))
;;
;; :NOTE following supersedes definition above.
;;  Returns the function `parsed-inventory-record-xml-dump-file-and-hash'.
;; (def-parsed-class-record-xml-dump-file-and-hash
;;     :parsed-class parsed-inventory-record
;;   :default-key-accessor inventory-number
;;   :default-input-pathname-name "dump-refs-DUMPING"
;;   :default-output-pathname-base-directory (sub-path *xml-output-dir*)
;;   :default-output-pathname-sub-directory (list "parsed-xml-inventory-records")
;;   :default-output-pathname-name "inventory-records")
(def-parsed-class-record-xml-dump-file-and-hash
    :parsed-class parsed-inventory-record
  :default-key-accessor inventory-number
  :default-input-pathname-name "dump-refs-DUMPING"
  :default-output-pathname-base-directory (sub-path *xml-output-dir*)
  :default-output-pathname-sub-directory (list "parsed-xml-inventory-records")
  :default-output-pathname-name "inventory-records")

(defun parsed-inventory-record-null-prototype ()
  "Return an instance of parsed-inventory-record with all slot-values null.
We do this rather than using :initform or :default-initargs for class
`parsed-inventory-record' and because we don't want to specialize on
`initialize-instance'.
This function should only be used for instantiating instances created _outside_ a sax parse!"
  (let ((prototype (make-instance 'dbc::parsed-inventory-record)))
    (loop 
       for slot-is-accessor in (mon:class-slot-list 'dbc::parsed-inventory-record)
       do (setf (slot-value  prototype slot-is-accessor) nil))
    prototype))

(defun parsed-inventory-record-null-prototype-to-file (object &key
                                                       (base-output-directory dbc::*dbc-base-item-number-image-pathname*)
                                                       ;; (directory-exists-check t)
                                                       (prefix-for-file-name "")
                                                       (suffix-for-file-name (concatenate 'string "_NEW-" (mon:time-string-yyyy-mm-dd)))
                                                       (pathname-type "lisp")
                                                       (print-unbound nil))
  
  (let* ((inventory-number-check (dbc::inventory-number object))
         (record-id (or (and inventory-number-check
                             (stringp inventory-number-check)
                             (every-digit-char-p inventory-number-check)
                             (control-id-indexed-number-zero-padded-string (inventory-number object)))
                        (error ":FUNCTION `parsed-inventory-record-null-prototype-to-file' ~
                                -- OBJECT has bad slot-value for slot inventory-number")))
         (output-dir (and (or (equal (pathname base-output-directory) *dbc-base-item-number-image-pathname*)
                              (probe-file base-output-directory))
                          (ensure-directories-exist (merge-pathnames (make-pathname :directory `(:relative ,record-id))
                                                                     base-output-directory)))))
    (when output-dir 
      (write-sax-parsed-slots-to-file
       object
       :output-directory output-dir
       :slot-for-file-name 'inventory-number
       :prefix-for-file-name prefix-for-file-name
       :suffix-for-file-name suffix-for-file-name
       :directory-exists-check nil
       :print-unbound print-unbound
       :slot-for-file-name-zero-padded t
       :pathname-type pathname-type))))

;; (parsed-class-parse-table 'parsed-inventory-record)
;; (load-sax-parsed-xml-file-to-parsed-class-hash :parsed-class 'parsed-inventory-record #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/xml-class-dump-dir/parsed-xml-inventory-records/inventory-records-2012-02-16.lisp")
;; (parsed-inventory-record-xml-dump-file-and-hash)
;; (gethash 'parsed-inventory-record *parsed-class-parse-table*)
;; (gethash "12000" (gethash 'parsed-inventory-record *parsed-class-parse-table*))
;; (inspect (gethash "12000" (gethash 'parsed-inventory-record *parsed-class-parse-table*)))
;;

;; (parsed-inventory-record-load-default-parsed-file-to-hash)
;;
(defun parsed-inventory-record-load-default-parsed-file-to-hash ()
  (let* ((maybe-wild-pathname 
           (merge-pathnames (make-pathname :name :wild 
                                           :type "lisp")
                            (or (probe-file (merge-pathnames 
                                             (make-pathname :directory '(:relative "parsed-xml-inventory-records"))
                                             (sub-path *xml-output-dir*)))
                                (error ":FUNCTION `parsed-inventory-record-load-default-parsed-file-to-hash'~% ~
                                      did find suitable directory containing parsed-xml-inventory-records"))))
         (maybe-find-wilds (directory maybe-wild-pathname))
         (most-recent-parse-file
           (or (and maybe-find-wilds
                    (car (sort 
                          (remove-if-not #'(lambda (x) (pathname-match-p x "/**/inventory-records-*.lisp"))
                                         maybe-find-wilds)
                          #'string>
                          :key #'pathname-name)))
               (error ":FUNCTION `parsed-inventory-record-load-default-parsed-file-to-hash'~% ~
                       did not find suitable parsed file beneath directory:~% ~S"
                      (pathname (directory-namestring maybe-wild-pathname))))))
    (when most-recent-parse-file
      (load-sax-parsed-xml-file-to-parsed-class-hash :parsed-class 'parsed-inventory-record
                                                     :input-file most-recent-parse-file
                                                     :hash-table (parsed-class-parse-table 'dbc::parsed-inventory-record)
                                                     :key-accessor 'inventory-number
                                                     :slot-dispatch-function #'set-parsed-inventory-record-slot-value))))

;; :NOTE `set-parsed-inventory-record-slot-value' is defined in loadtime-bind.lisp
;; (def-set-parsed-class-record-slot-value 
;;     parsed-inventory-record)

;;; ==============================
;; :NOTE Depreated use the macro'd version generated with `def-set-parsed-class-record-slot-value' instead. 
;; (fundoc 'set-parsed-inventory-record-slot-value
;; "Map orginal sql tables FIELD-STRING name to OBJECT's CLOS slot equivalent setting its slot-value to FIELD-VALUE.~%~@
;; Return as if by `cl:values':~%
;;  - nth-value 0 is the setf'd FIELD-VALUE as set with slot accessor corresponding to FIELD-STRING.
;;  - nth-value 1 is OBJECT~%~@
;; For use with `load-sax-parsed-xml-file-to-parsed-class-hash' after reading in
;; XML files parsed with `write-sax-parsed-xml-refs-file'.~%~@
;; OJBECT is an instance of class `parsed-inventory-record'.~%~@
;; Original FIELD-STRING is the car of the the consed key/value pairs in one of the alists 
;; written to an output file by `write-sax-parsed-xml-refs-file' FIELD VALUE is
;; the corresponding cdr of the consed key/value pair.~%~@
;; The slot documentation of the class `parsed-inventory-record' provides indication of the
;; mapping from the original field name to our new slot name.~%~@
;; :EXAMPLE
;;  (set-parsed-inventory-record-slot-value "ref" "13000" (make-instance 'parsed-inventory-record))
;;
;; :SEE-ALSO `<XREF>'.~%▶▶▶")
;; 
;; :NOTE The setf of the accessor ensures we always populate the slot-value with nil
;; so as to avoid errors when slot is not `slot-boundp'.
;; 
;; :TODO Currently these accessor methods are defined automagically at class creation.
;; We need to unify common routines and symbol-names to appropriate generic
;; functions and where the behavior is generalized across all class specialize
;; them on the class `parsed-class'.
;;
;; (defun set-parsed-inventory-record-slot-value (field-string field-value object)
;;   (values 
;;    (string-case:string-case (field-string)
;;      ("ref" 
;;       (setf (inventory-number object) field-value))
;;      ("title" 
;;       (setf (description-inventory-title object) field-value))
;;      ("desc_fr" 
;;       (setf (description-inventory-french object) field-value))
;;      ("desc_en" 
;;       (setf (description-inventory-english object) field-value))
;;      ("histo_fr" 
;;       (setf (ignorable-history-french object) field-value))
;;      ("histo_en" 
;;       (setf (ignorable-history-english object) field-value))
;;      ("text_quote"
;;       (setf (description-inventory-quote object) field-value))
;;      ("translation"
;;       (setf (description-inventory-translation object) field-value))
;;      ("people"
;;       (setf (naf-entity-person-coref object) field-value))
;;      ("brand"
;;       (setf (naf-entity-brand-coref object) field-value))
;;      ("composer"
;;       (setf (naf-entity-composer-coref object) field-value))
;;      ("artist" 
;;       (setf (naf-entity-artist-coref object) field-value))
;;      ("author"
;;       (setf (naf-entity-author-coref object) field-value))
;;      ("latin_name"
;;       (setf (taxon-entity-coref object) field-value))
;;      ("book"
;;       (setf (naf-entity-publication-coref object) field-value))
;;      ("publisher" 
;;       (setf (publication-publisher object) field-value))
;;      ("publish_location" 
;;       (setf (publication-location object) field-value))
;;      ("volume" 
;;       (setf (publication-volumes object) field-value))
;;      ("edition" 
;;       (setf (publication-edition object) field-value))
;;      ("page" 
;;       (setf (publication-pages object) field-value))
;;      ("Plate_number"
;;       (setf (publication-plates object) field-value))
;;      ("issue"
;;       (setf (publication-issue object) field-value))
;;      ("year"
;;       (setf (publication-date object) field-value))
;;      ("year_year"
;;       (setf (publication-date-range object) field-value))
;;      ("categ"
;;       (setf (category-entity-0-coref object) field-value)) 
;;      ("c1"
;;       (setf (category-entity-1-coref object) field-value))
;;      ("c2"
;;       (setf (category-entity-2-coref object) field-value))
;;      ("c3"
;;       (setf (category-entity-3-coref object) field-value))
;;      ("c4"
;;       (setf (category-entity-4-coref object) field-value))
;;      ("c5"
;;       (setf (category-entity-5-coref object) field-value))
;;      ("c6"
;;       (setf (category-entity-6-coref object) field-value))
;;      ("bct"
;;       (setf (category-entity-precedence-list object) field-value))
;;      ("categ_doc"
;;       (setf (documentation-category-entity-0-coref object) field-value))
;;      ("c1_doc"
;;       (setf (documentation-category-entity-1-coref object) field-value))
;;      ("c2_doc"
;;       (setf (documentation-category-entity-2-coref object) field-value))
;;      ("c3_doc"
;;       (setf (documentation-category-entity-3-coref object) field-value))
;;      ("theme"
;;       (setf (theme-entity-0-coref object) field-value))
;;      ("theme2"
;;       (setf (theme-entity-1-coref object) field-value))
;;      ("theme3"
;;       (setf (theme-entity-2-coref object) field-value))
;;      ("price"
;;       (setf (price-ask object) field-value))
;;      ("keywords"
;;       (setf (keywords-sequence object) field-value))
;;      ("condition"
;;       (setf (description-inventory-condition object) field-value))
;;      ("onlinen"
;;       (setf (media-entity-mount object) field-value))
;;      ("technique"
;;       (setf (media-entity-technique object) field-value))
;;      ("paper"
;;       (setf (media-entity-paper object) field-value))
;;      ("color"
;;       (setf (media-entity-color object) field-value))
;;      ("w"
;;       (setf (unit-width object) field-value))
;;      ("h"
;;       (setf (unit-height object) field-value))
;;      ("nbre"
;;       (setf (ignorable-number object) field-value))
;;      ("seller"
;;       (setf (inventory-seller object) field-value))
;;      ("bar_code"
;;       (setf (inventory-bar-code object) field-value))
;;      ("weight"
;;       (setf (unit-weight object) field-value))
;;      ("user_name"
;;       (setf (edit-by-creator object) field-value))
;;      ("done"
;;       (setf (job-complete object) field-value))
;;      ("job_name"
;;       (setf (job-id object) field-value))
;;      ("locked"
;;       (setf (job-locked object) field-value))
;;      ("online"
;;       (setf (record-status-active object) field-value))
;;      ("uri"
;;       (setf (inventory-uri object) field-value))
;;      ("notes"
;;       (setf (ignorable-notes object) field-value))
;;      ("keywords_type"
;;       (setf (ignorable-keywords-type object) field-value))
;;      ("av_repro"
;;       (setf (inventory-can-repro object) field-value))
;;      ("related_doc"
;;       (setf (documentation-related object) field-value))
;;      ("ebay_final"
;;       (setf (price-sold-ebay object) field-value))
;;      ("ebay_price"
;;       (setf (price-ask-ebay object) field-value))
;;      ("ebay_title"
;;       (setf (title-ebay object) field-value))
;;      ("ebay_id"
;;       (setf (control-id-ebay object) field-value))
;;      ("seo_title"
;;       (setf (description-inventory-seo-title object) field-value))
;;      ("description_seo"
;;       (setf (description-inventory-seo object) field-value))
;;      ("keywords_seo"
;;       (setf (keywords-seo object) field-value))
;;      ("date"
;;       (setf (edit-date-origin object) field-value))
;;      ("date_edit"
;;       (setf (edit-date object) field-value))
;;      ("edit_history"
;;       (setf (edit-history object) field-value)))
;;    object))





;;; ==============================
;; :NOTE Exisiting functions written for cleaning
;; `field-name-underscore-to-dash'
;; `field-string-cons'
;; `field-cln-x'
;; `split-used-fors'
;; `split-appeared-in'
;; `split-roles'
;; `split-loc-pre'
;; `split-lifespan'
;; `split-lifespan-string-int-pairs'
;; `split-comma-field'
;; `field-convert-1-0-x'
;; `format-entity-role'
;; `field-convert-empty-string-nil'
;;; ==============================



;;; ==============================
;; :TODO We need to match all occurences of in all parsed-classes where the "field-name" is also the "field-value"
;; e.g. situations like this: ("ebay_price" . "ebay_price")
;; (defun filter-field-name-value-is-field-name (object )
;;   )





;;; ==============================
;;
;; :PASTE-NUMBER 124918
;; :PASTE-TITLE "generate code"
;; :PASTE-AUTHOR flip214
;; :PASTE-DATE   2011-09-28
;; :PASTE-URL (URL `http://paste.lisp.org/display/124918')

;; (defparameter *fields-and-convs*
;;   '((uuid       'parse-integer)
;;     (ts         'parse-integer)
;;     (ts-string  'identity)
;;     (vers-md5   'identity)
;;     (kern_id    'parse-integer)
;;     (kernel     'identity)
;;     (distro     'identity)
;;     (version    'identity)))
;;
;;  #.(list* 'defstruct 'node
;;           (mapcar #'car *fields-and-convs*))
;;
;;; ==============================



;;; ==============================
;;
;;
;; (make-parsed-class-slot-init-accessor-name "parsed-inventory-record" "keywords_type" "init")
;;    <SLOT>  <TRANSFORM>  |  (<INIT> {INIT-PFX | INIT-SFX})  <ACCESSOR>  
;; '(
;;
;;  "ref"              ;; inventory-number
;;
;;  "title"            ;; description-inventory-title
;;  "desc_fr"          ;; description-inventory-french     ;; description-class
;;  "desc_en"          ;; description-inventory-english    ;; description-class
;;  "histo_fr"         ;; ignorable-history-french
;;  "histo_en"         ;; ignorable-history-english
;;  "text_quote"       ;; description-inventory-quote
;;  "translation"      ;; description-inventory-translation
;;
;;  "people"           ;; naf-entity-person-coref
;;  "brand"            ;; naf-entity-brand-coref
;;  "composer"         ;; naf-entity-composer-coref
;;  "artist"           ;; naf-entity-artist-coref
;;  "author"           ;; naf-entity-author-coref
;;  "latin_name"       ;; taxon-entity-coref  ;; linnaean-entity-coref???
;;
;;
;;  "book"             ;; "naf-entity-publication-coref"
;;  "publisher"        ;; "publication-publisher"
;;  "publish_location" ;; "publication-location"   ;; For congruence with birth-location death-location
;;  "volume"           ;; "publication-volumes"
;;  "edition"          ;; "publication-edition"
;;  "page"             ;; "publication-pages"
;;  "Plate_number"     ;; "publication-plates"
;;  "issue"            ;; "publication-issue"
;;
;;  :NOTE `parsed-artist-record' class has "appeared_in" -> "publication-appeared-in"
;;
;; It isn't totally clear yet that these are neccesarrily publication related fields:
;;  "year"             ;; publication-date        ;; For congruence with birth-date death-date 
;;  "year_year"        ;; publication-date-range  ;;
;;
;;  "categ"            ;; category-entity-0-coref
;;  "c1"               ;; category-entity-1-coref
;;  "c2"               ;; category-entity-2-coref
;;  "c3"               ;; category-entity-3-coref
;;  "c4"               ;; category-entity-4-coref
;;  "c6"               ;; category-entity-6-coref
;;  "c5"               ;; category-entity-5-coref
;;  "bct"              ;; category-entity-precedence-list
;;
;;  "categ_doc"        ;; documentation-category-entity-0-coref
;;  "c1_doc"           ;; documentation-category-entity-1-coref
;;  "c2_doc"           ;; documentation-category-entity-2-coref
;;  "c3_doc"           ;; documentation-category-entity-3-coref
;;
;;  "theme"            ;; theme-entity-0-coref
;;  "theme2"           ;; theme-entity-1-coref
;;  "theme3"           ;; theme-entity-2-coref
;;
;;  "keywords"         ;; keywords-sequence
;;
;;  "condition"        ;; description-inventory-condition  ;; description-class
;;  "onlinen"          ;; media-entity-mount
;;  "technique"        ;; media-entity-technique
;;  "paper"            ;; media-entity-paper
;;  "color"            ;; media-entity-color
;;  "w"                ;; unit-width
;;  "h"                ;; unit-height
;;  "price"            ;; price-ask
;;                     ;; The "-ask" suffix is for congruence with "price-ebay"
;;                     ;; :NOTE Need price-paid, price-sold,
;;
;;  "nbre"             ;; ignorable-number    ;; probably empty
;;
;;  "seller"           ;; inventory-seller
;;  "bar_code"         ;; inventory-bar-code
;;  "weight"           ;; unit-weight
;;  "user_name"        ;; edit-by-creator
;;  "done"             ;; job-complete
;;  "job_name"         ;; job-id
;;  "locked"           ;; job-locked   ;; IGNORABLE
;;  "online"           ;; record-status-active
;;
;;  "uri"              ;; inventory-uri

;;  "notes"            ;; ignorable-notes
;;  "keywords_type"    ;; ignorable-keywords-type
;;  "av_repro"         ;; inventory-can-repro ;; IGNORABLE

;;
;;  "related_doc"      ;; documentation-related
;;
;;
;;  "ebay_final"       ;; price-sold-ebay
;;  "ebay_price"       ;; price-ask-ebay
;;  "ebay_title"       ;; title-ebay
;;  "ebay_id"          ;; id-ebay ??? uuid-ebay
;;  "seo_title"        ;; description-inventory-seo-title
;;  "description_seo"  ;; description-inventory-seo
;;  "keywords_seo"     ;; keywords-seo
;;
;;  "date"             ;; edit-date-origin  ;; IGNORABLE assuming date_edit is present and corresponds 
;;  "date_edit"        ;; edit-date
;;  "edit_history      ;; edit-history
;;  ")
;;


;;; ==============================
;;; :TODO methods  

;; `field-convert-1-0-x' 
;; brand, people, latin_name,
;; date, year
;; Plate_number, issue, 
;; title
;; 
;; desc_en, desc_fr, histo_en, histo_en,
;; related_doc, 
;; categ, c1, c2, c3, c4, c5, c6      ;; These may contain "1" to indicate depth. 
;; categ_doc, c1_doc, c2_doc, c3_doc 
;; ebay_id, ebay_price, ebay_final, ;; (maybe the latter are floats)
;; 
;; done, color, job_name
;; 
;; :ARTIST-NAF-FIELDS
;; also_people, also_author 

;;; ==============================
;; 
;; (defun split-ref-multi-naf (naf-multi-ref)
;; 
;; split on "&"
;; :REF-FIELDS artist, author, people, brand, 


;;; ==============================
;; :FIELD "ref" :TRANSFORM inventory-number
;;
;;         :TYPE "mediumint(8) unsigned"
;;         :NULL-P "NO"
;;         :KEY "PRI"
;;         :EXTRA "auto_increment"
;;
;; :EXAMPLE-VALUES 
;;  2767
;;  12000
;;
;; - This should be a UUID

;;; ==============================
;; :FIELD "price" :TRANSFORM "price-ask"
;;
;;         :TYPE "int(10)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  150
;;
;; :NOTE The "-ask" suffix is for congruence with "price-ebay"
;; :TODO Need "price-paid", "price-sold"
;; This would imply that price is a class e.g. "price-class" 

;; (defclass price-class (base-dbc)
;; (price-paid :initarg :price-paid 


;;; ==============================
;;; TEXT-DESCRIPTORS
;;; ==============================

;;; ==============================
;; :FIELD "title" :TRANSFORM description-inventory-title :CLASS description-class
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Translation"
;;  "Eve.- Voyons, Adam..."
;;  "A Sa Toilette..."
;;  " Whinchat"
;; " Hermés Accessories"
;;  "x"
;;
;; - What to do about "Translation"? 
;;   Used to indicate that the field needs a translation but that it may be missing.
;;
;; - How often were these used to hold translation data, b/c they weren't always
;;  
;; - `mon:string-trim-whitespace' these. 
;;
;; - `field-convert-1-0-x' 
;; 

;;; ==============================
;; :FIELD "desc_fr" :TRANSFORM description-inventory-french  :CLASS description-class
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Couverture couleur illustrée"
;;  "x"
;;  "0"
;;
;;   Use `field-convert-1-0-x'

;;; ==============================
;; :FIELD "desc_en" :TRANSFORM description-inventory-english  :CLASS description-class
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; "An original ad, featuring all the varying models tested in early aviation,
;;  including the Wright Brothers plane, it is more than 95 years old."
;; 
;; "Cover Page From Le Sourire. rare!"
;;
;; "&lt;br&gt;&lt;br&gt"
;;
;; "&quot;The Arabians called it the 'Column of Columns'... 88 ft tall and 8 ft
;; in Diameter...&quot; it was located in Alexandria Egypt. Vol VI No. 39."
;;
;; - Note, above wrapped for clarity.
;;
;; - Remove all occurences of "rare!"
;;
;; - Remove occurences of "<br>"
;; - Remove occurences of "&lt;br&gt"
;; - Replace occurences of "&quot; -> #\" e.g.:
;;   (let ((str "&quot;The Arabians called it the 'Column of Columns'... 88 ft tall and 8 ft
;; in Diameter...&quot; it was located in Alexandria Egypt. Vol VI No. 39."))
;;     (setf str (cl-ppcre:regex-replace-all "&quot;" str "\"")) 
;;     (print str))

;;; ==============================
;; :FIELD "translation" :TRANSFORM description-inventory-translation
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "0" "1"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Looks like this might be a boolean 

;;; ==============================
;; :FIELD "related_doc" :TRANSFORM documentation-related
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'


;;; ==============================
;; :FIELD "histo_fr" :TRANSFORM ignorable-history-french
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "x"
;;  histo_fr
;; (search-forward-regexp "<field name=\"histo_fr\">[[:graph:]]+<" nil t)
;;
;; - Strip "x"
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; (search-forward-regexp "histo_fr\">[^<0x].*<" nil t)
;;
;; 90796533

;;; ==============================
;; :FIELD "histo_en" :TRANSFORM ignorable-history-english
;;                              
;;         :TYPE "mediumint(9)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;
;; (search-forward-regexp "<field name=\"histo_en\">[[:graph:]]+<" nil t)
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'

;;; ==============================
;; :FIELD "text_quote" :TRANSFORM description-inventory-quote
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "text_quote"
;;  "4617 "
;; - May contain "text_quote", remove/ignore it.
;;
;; - Is this is actually used? Yes,  see ref 4617

;;; ==============================
;; :FIELD "notes" :TRANSFORM 
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "è %EF%BF%BD - Crèches (Nativity scenes)" 
;; "Générale_et_Particulière<"
;;
;; - Is this used? Yes, twice see `ref` 3126, 424
;; 
;; (search-forward-regexp "notes\">[^<0].*<" nil t)

;;; ==============================
;;; DATE-VOLUME-ISSUE
;;; ==============================

;;; ==============================
;; :FIELD "Plate_number" :TRANSFORM publication-plates
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "x"
;;  "51"
;;  " 35"
;;  " 13"
;;
;; - Strip "x" 
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;; :NOTE stripping X may not be possible if this is "PLATE X" the Roman numeral!
;;
;; :NOTE Why is this the only field containing a capitalized name, e.g. "Plate" in "Plate_number"?
;; - `mon:string-trim-whitespace'
;;
;; :NOTE we've chosen to use the plural form `publication-plates' for
;; congruence with clss `parsed-publication-record' -- 2011-10-04

;;; ==============================
;; :FIELD "volume" :TRANSFORM publication-volumes 
;;
;;         :TYPE "varchar(45)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "LXII"
;;
;; :NOTE we've chosen to use the plural form `publication-volumes' for
;; congruence with class `parsed-publication-record' -- 2011-10-04

;;; ==============================
;; :FIELD "edition" :TRANSFORM publication-edition
;;
;;         :TYPE "varchar(45)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "First Octavo"
;;

;;; ==============================
;; :FIELD "issue" :TRANSFORM publication-issue
;;
;;         :TYPE "varchar(5)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "9999"
;;  "280"
;;  "20"
;;  "0"
;;
;; - Strip "9999"
;; - Use `field-convert-1-0-x'

;;; ==============================
;; :FIELD "page" :TRANSFORM publication-pages
;;
;;         :TYPE "varchar(45)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; :NOTE we've chosen to use the plural form `publication-pages' for
;; congruence with clss `parsed-publication-record' -- 2011-10-04
;;


;;; ==============================
;; :FIELD "date" :TRANSFORM edit-date-origin
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "date" 
;;  "0"
;;
;; - Following appears to be the _original_ edit-date field. 
;;    AFAICT all occurences are circa 2004 e.g.
;;   occurence for entire file:
;;   "20040811125434" 
;;
;; This field is ignorable assuming value of "date_edit" is present and corresponds.
;;
;; (search-forward-regexp "date\">[^<0].*<" nil t)
;; 
;; - May contain "date" remove/ignore it.
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'


;;; ==============================
;; :FIELD "year_year" :TRANSFORM publication-date-range
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;  "1828"
;;  "1755 - 1787"  :SEE `ref` 7476
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;

;;; ==============================
;; :FIELD "year" :TRANSFORM publication-date
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "December, 19, 1896"
;;  "December , 10 , 1910"
;;  "January , 6 , 1900"
;;  "October, 4, 1930"
;;  "0 , 0 , 1820"
;;  "0 , 0 , 1900"
;;  "0 , 0 , 1896"
;;  "December , 0 , 1933"     ;; 10984
;;  "1832-1837"               ;; Should this have been in year_year? See `ref` 8652
;;  "1749-1783"               ;; ref 427 has year_year as 1749
;;  "1837-1839"               ;; ref 399,400 year_year as 1837
;;  "1717 - 1725"             ;; ref 9311 year is 1717 ;; replaced 20 times
;;  "0"
;;  "December, ,1946"
;;  ",,1810"                 ;; 7496 
;;
;; - And/or maybe `string-split-on-chars' 
;; 
;; (remove-if #'(lambda (x) (eql (length x) 0)) 
;;	      (mon::string-split-on-chars "December , 10 , 1910" " ,"))
;;
;; - Frob with `local-time'?
;;
;; - Use `field-convert-1-0-x'
;;
;; (search-forward-regexp "year\">[[:digit:]]\\{4,4\\}-[[:digit:]]\\{4,4\\}<" nil t)
;; (search-forward-regexp "ref\">[[:digit:]]\\{4,4\\}<" nil t)


;;; ==============================
;;; NAF-RELATED
;;; ==============================

;;; ==============================
;; :FIELD "artist" :TRANSFORM naf-entity-artist-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "Audubon (John James) &amp; Audubon (John Woodhouse) &amp; Havell (Robert, Jr.)"
;; "Steinlen (Theophile Alexandre)"
;; " Mourgue (Pierre)"
;;
;; - split on "&"
;;
;; - Use `mon:string-trim-whitespace'


;;; ==============================
;; :FIELD "author" :TRANSFORM  naf-entity-author-coref
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "MacGillivray (William) &amp; Audubon (John James)"
;; "Puech (Lucien)"
;;
;; - split on "&"
;;
;; - This field will have a class-instance if it is non-nil

;;; ==============================
;; :FIELD "book" :TRANSFORM  naf-entity-publication-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Gil Blas Illustre"
;;  "Unknown"
;;
;; - This will field will have a class-instance if it is non-nil
;; 

;;; ==============================
;; :FIELD "composer" :TRANSFORM naf-entity-composer-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; <field name="composer" xsi:nil="true" />
;;
;; (count-matches "field name=\"composer\" xsi:nil=\"true\"") => 727
;; 
;;; ==============================
;; :FIELD "brand" :TRANSFORM naf-entity-brand-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "x"
;;  "Maxim\'s"
;;  "Fly-Tox"
;;
;; - Strip "x" 
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - This field will have a class-instance if it is non-nil

;;; ==============================
;; :FIELD "people" :TRANSFORM naf-entity-person-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "x"
;; 
;; - Strip "x"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - This field will have a class-instance if it is non-nil


;;; ==============================
;;; NAF-ENTITIES-W/OUT-UUID
;;; ==============================

;;; ==============================
;; :FIELD "publisher" :TRANSFORM publication-publisher
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; " Wallace"
;; "John T. Bowen,  J.J. Audubon, and  J.B. Chevalier"
;; "x"
;;
;; - Use `field-convert-1-0-x'
;; - Use `mon:string-trim-whitespace'
;;
;; (field-convert-1-0-x (mon:string-trim-whitespace "x"))

;;; ==============================
;; :FIELD "publish_location" :TRANSFORM location-published
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  " Weimar"
;;  " London" 
;;  " France"
;;  "Paris, 15 Rue de la Parcheminerie"
;;  "34 North Front Street, Philadelphia and 77 William Street, New York"
;; 
;; - `mon:string-trim-whitespace' these.


;;; ==============================
;; :FIELD "latin_name" :TRANSFORM taxon-entity-coref
;;
;;         :TYPE "varchar(192)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "Passerina ciris (Linnaeus, 1758) | Fringilla Emberiza (Ciris)"
;; "Cathartes Atratus | Cathartes Aura (Linnaeus)"
;; "Tachycineta Thalassina (Swainson) | Hirundo Malassinus | Tachycineta thalassina"
;; "Asclepias tuberosa | Spizella pallida (Swainson, 1832) | Emberiza pallida (Swainson &amp; Richardson)"
;;
;;  "x"
;;
;; - Split on "|"
;;
;; - Strip "x"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'


;;; ==============================
;;; THEME-RELATED
;;; ==============================

;; The themes should be dedicated class instances.

;;; ==============================
;; :FIELD "theme" :TRANSFORM theme-entity-0-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Artists' models"
;;  "Eating &amp; drinking"        -> "Eating and drinking"
;;  "Patterns (Design elements)"
;;
;; - Replace "&amp;" -> "and"

;;; ==============================
;; :FIELD "theme2" :TRANSFORM theme-entity-1-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Portraits"
;;
;; <field name="theme2" xsi:nil="true" />
;; (count-matches "<field name=\"theme2\" xsi:nil=\"true\" />") => 353
;; 
;; - Replace "&amp;" -> "and"

;;; ==============================
;; :FIELD "theme3" :TRANSFORM theme-entity-2-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Walking"
;;  "Relations between the sexes"
;;
;; <field name="theme3" xsi:nil="true" />
;; (count-matches "<field name=\"theme3\" xsi:nil=\"true\" />") => 347
;;
;; - Replace "&amp;" -> "and"


;;; ==============================
;;; CONDITION-DESCRIPTORS
;;; ==============================

;;; ==============================
;; :FIELD "technique" :TRANSFORM media-entity-technique
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "Stone Lithograph"
;;
;; - This field has a naf UUID and is (at least currently) a relatively small set.
;;

;;; ==============================
;; :FIELD "paper" :TRANSFORM media-entity-paper
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Antique Wove Paper"
;;  "Machine pressed" 
;;
;; - This field has a naf UUID and is (at least currently) a relatively small set.
;;

;;; ==============================
;; :FIELD "condition" :TRANSFORM description-inventory-condition
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "[8] Archival Conservation and Mounted on Linen. light age staining."
;;  "[9] "
;;  " [9]"
;;  "[8]"
;;  "[9 ] Strong print and plate marks. Beautiful hand coloring"
;;  "[4 ] moderate age staining in top margin, light age staining in other margins."
;;  "[6] very light age toning in margins."
;;  "[5] very light age staining."
;;  "[6]  light age toning."
;;  "[8]  Very light offsetting."
;;  "(8.5) Light age toning, stronger at edges. Light crease damage. Please see Zoom In for details."
;;  "[8+] One small fox mark shown in image. Strong print marks and beaitiful handcoloring."
;;  "[8+] Professional archival conservation. Very light offsetting. [Typical]."
;;  "[8+]  Very light offsetting."
;;  "[7 ] Light age toning. Very light offsetting."
;; "[9]Age toning, Strong plate mark. Please see Zoom In for details."
;; "... For details, see zoom scan."
;; "... Please see Zoom In for details"
;;
;;
;; - Separate out the `[<N>]` values when present.
;;
;; - Convert "[<N>+]" to "N.5"
;;
;; -- Split the string on whitespace, Should capitalize first word, and concatenate the result
;; 
;; -- Return (8 . "Condition String here")
;; 
;; - But, really these should be a separated into dedicated slots:
;;   :condition-value <N>
;;   :condition-desc "<STRING>"
;;
;; - Moreso, it should instead be a class that way we can add alternate condition representations, i.e.:
;;   :damage
;;   :damage-location
;;   :damage-description
;;   :damage-type
;;
;; - string-left-trim
;;
;; - remove trailing period, e.g.: (string-right-trim "#\." <FIELD>)
;;
;; - remove occurences of string: "For details, see zoom scan."
;;
;; - remove occurences of  "Please see Zoom In for details."

;;; ==============================
;; :FIELD "w" :TRANSFORM unit-width
;;
;;         :TYPE "float unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  9  
;;  6.5
;;
;; - This is the width field 
;;
;; - Use `mon:number-to-string' or `parse-integer'

;;; ==============================
;; :FIELD "h" :TRANSFORM unit-height
;;
;;         :TYPE "float unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  12 
;;  13.75
;;
;; - This is the "height" field 
;;
;; - Use `mon:number-to-string' or `parse-integer'

;;; ==============================
;; :FIELD "color"  :TRANSFORM media-entity-color
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; :NOTE This has never really been correct. The value is ternary not binary.
;; In the current binary configuration the following 
;; TRUE indicates a non greyscale image.
;; FALSE indicates a greyscale or monochromatic image.
;; Better, would be to indicate as follows:
;; - polychromatic-multi  -- a polychromatic multi-colored imaged
;; - polychromatic-grey   -- a polychromatic grayscale (greyscale) image
;; - monochromatic-binary -- a binary image black and white
;; These would map as:
;;  0 - black and white
;;  1 - greyscale
;;  2 - color 

;;; ==============================
;; :FIELD "onlinen" :TRANSFORM media-entity-mount
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;   1 | 0 
;;
;; - 1 indicates the item is linenbacked, 0 indicates that it isn't
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;

;;; ==============================
;; :FIELD "weight" :TRANSFORM unit-weight
;;
;;         :TYPE "tinyint(4)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "1" 
;;  "0"
;;
;; - These integers are 
;; - Convert these values to somthing more meaningful?



;;; ==============================
;; CATEG-RELATED 
;;; ==============================

;;; ==============================
;; :FIELD "bct" :TRANSFORM category-entity-precedence-list
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0
;;  "bct" <-- WTF! 
;; "Sports Mem, Cards &amp; Fan Shop &gt; Cards &gt; Baseball-MLB &gt; Rookies (Pre-1950)"
;; 
;; - Replace the 0 default with NIL
;;
;; - Not sure how much this was used. It is effectively a class-precedence list.
;;
;; - (search-forward-regexp "bct\">[^<0].*<" nil t)


;;; ==============================
;; :FIELD "categ" :TRANSFORM category-entity-0-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Books and Publications"
;;  "0"
;;
;; - It is never the case that the `categ` field is empty.
;;   e.g. there are no matches for the following search:
;;    (search-forward-regexp "<field name=\"categ\"></field>" nil t)
;; 
;; - These are effectively classes and should be treated as such. By creating an
;;   instance of the deepest most categ we will automatically inherit from the
;;   class precedence heirarchy. And, we can then get multiple-inheritance!
;;
;; - In the sub-categs it appears that "1" is used to to indicate max depth. 
;;   BUT there are Le Rire issues that use the item number for the "c6" see for
;;   example the ~4600 range of items e.g. 4607
;;    - When such occurs the following fields  all refer to the item number:
;;       `job_name` `keywords_type` `text_quote` and `c6` (sometimes)
;;    Additionally, the `locked` and `done` fields have the value 127
;;
;; (search-forward-regexp "<field name=\"categ\"></field>" nil t)

;;    Additionally, the `locked` and `done` fields have the value 127


;;; ==============================
;; :FIELD "c1" :TRANSFORM :TRANSFORM category-entity-1-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;

;;; ==============================
;; :FIELD "c2" :TRANSFORM category-entity-2-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;

;;; ==============================
;; :FIELD "c3" :TRANSFORM category-entity-3-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;

;;; ==============================
;; :FIELD "c4" :TRANSFORM category-entity-4-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;

;;; ==============================
;; :FIELD "c5" :TRANSFORM category-entity-5-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;

;;; ==============================
;; :FIELD "c6" :TRANSFORM category-entity-6-coref
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  1
;;  4622
;; - The "1" value _may_ be used to indicate depth in the class tree 

;;; ==============================
;; :FIELD "categ_doc" :TRANSFORM documentation-category-entity-0-coref
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Is this ever used? Yep once, see ref 8941
;;
;; - (search-forward-regexp "categ_doc\">[^<0].*<" nil t)

;;; ==============================
;; :FIELD "c1_doc" :TRANSFORM documentation-category-entity-1-coref
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Is this ever used? No.

;;; ==============================
;; :FIELD "c2_doc" :TRANSFORM documentation-category-entity-2-coref
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "1040"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Is this ever used? Yes, at least once :SEE `ref` 8942


;;; ==============================
;; :FIELD "c3_doc" :TRANSFORM documentation-category-entity-3-coref
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Is this ever used? NO


 
;;; ==============================
;;; METADATA-AND-SEO
;;; ==============================

;;; ==============================
;; :FIELD "uri" :TRANSFORM inventory-uri
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "YES"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Journals_and_Publications_Guillaume_Le_Rire_Clothing___dress_Money_image-3219.htm"
;;  "Journals-and-Publications_No-Signature_La-Vie-Au-Grand-Air_Airships_Airplanes-print-10566.htm"
;;  "Modern__(1890_-_1945)_No_Signature_Nouveautes_Papiers_Peints_Wallpapers_Interior_decoration_image-11834.htm"
;;
;; - Clean up the `___` underscores, generally these are `_&_` and shoud prob. be converted to `_and_`
;;
;; - Remove occurences of "_No-Signature_", "Unknown", "No_Signature" 
;;
;; - Remove the ".htm" extension we can always add it back in as needed.
;;

;;; ==============================
;; :FIELD "seo_title" :TRANSFORM description-inventory-seo-title
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "  -  Guillaume (Albert), Original Print -March, 9, 1907 - GUILLAUME  FROM LE RIRE"
;;
;;  "An Original early ad for Continental tires. Featuring models of early
;;   airplanes - La Vie au Grand Air Noel December 10, 1910 | DerbyCityPrints.com"
;;
;;  "Alken (Henry), Original Print - ,,1820 - ALKEN  FROM SPORTING SCRAP BOOK"
;;  "Alken (Henry), Original Print -September, 1, 1821 - ALKEN  FROM"
;;
;;  "x, Original Print -January , 18 , 1908 - X FROM LE SOURIRE"
;;
;; "Huard (Charles), Original Print - - HUARD  FROM LE SOURIRE"
;;
;; "  -  No Signature &amp; , Original Print -1929 - 1930 -  FROM NOUVEAUTES PAPIERS PEINTS"
;;
;; "Alfredo Bouret - Original Boucheron Advert - linen backed Print - circa 1952
;;  - FROM PLAISIR DE FRANCE"
;;
;; "  -  , Original Print -0 -  FROM"
;;
;; - Note, above wrapped for clarity.
;;
;; - Fix dates with "-<DATE>" e.g. "-February , 2 , 1901"
;;   Maybe these can be inferred and/or extracted? 
;;
;; - Remove superfluous whitespace 
;;
;; - Fix this shit: "- ,,"
;;
;; - Remove leading " - "
;;
;; - Replace " - - " -> " - "
;;
;; - Replace " Original Print -<MONTH>" ->  "Original Print - <MONTH>"
;;
;; - Remove "x,"
;;
;; - Remove "&amp;"
;;
;; - What to do about trailing "| DerbyCityPrints.com"?
;; 
;; - These can probably be safely `string-lef-trimmed'
;;
;; - What fucking mess... 

;;; ==============================
;; :FIELD "description_seo" :TRANSFORM description-inventory-seo :CLASS description-class
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "air, plane, airplane, Biplane, aircraft, expo, center, blimp, dirigible,"
;;   "A Pochoir for the 1922 periodical Styl 1922 shos a dress made of golden
;;    yellow Matelasse with a matching hat, by the popular Berlin fashion
;;    designer Johanna Marbach."
;;
;; - `split-comma-field' works so long as we can be sure that there are
;;   never free commas as used as an SEO descriptor:
;;
;;  (split-comma-field
;;   "air, plane, airplane, Biplane,, aircraft, expo, center, blimp, dirigible,")


;;; ==============================
;; :FIELD "keywords" :TRANSFORM keywords-sequence
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY "MUL"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; "Books and Publications, Journals and Publications, French, Airships, Petit
;;  Journal pour Rire, Air shows, , Airplanes, , La Vie Au Grand Air Revue
;;  illustrée de tous les sports | Le Sport Photographique | Le Sport
;;  Photographie | Le Sport Francais | Les Sports a L'Exposition | Tres Sport |
;;  La Vie a La Campagne, Anonymous | Unknown | Unsigned |, Rubber | Tires |
;;  Automobile Parts | Brake systems | Automotive safety and communications
;;  systems, , , No Signature"
;;
;; "Natural History Ornithology Audubon Birds of America 1st Royal 8vo Edition
;;  Red-Headed Turkey Vulture Audubon (John James) &amp; Audubon (John Woodhouse)
;;  &amp; Havell (Robert, Jr.) MacGillivray (William) &amp; Audubon (John James)
;;  Birds of America - Royal Octavo Vultures Birds Turkey 1840 Cathartes Atratus |
;;  Cathartes Aura (Linnaeus) John T. Bowen, J.J. Audubon, and J.B. Chevalier"
;;
;; "Natural History Ornithology Bree Birds of Europe 2nd Edition x Red Breasted
;;  Flycatcher Fawcett (Benjamin) Bree (Charles Robert) x History of The Birds of
;;  Europe, Not Observed In The British Isles.  Birds 1875 x George Bell and
;;  Sons"
;;
;; "Natural History Ornithology Gould Birds of Europe 1st Edition x Tree Pipit Gould
;;  (John) &amp; Gould (Elizabeth) Gould (John) x Birds of Europe Birds Scientific
;;  illustrations Tree limbs 1832 1833 1834 1835 1836 1837 Anthus Arboreus R. and
;;  J.E. Taylor"
;;
;; "1 1 1 1 1 x Parfums Lanvin Aljanvic x Lanvin x Natural History Street
;; vendors Flowers Sidewalks 1948 x x"
;;
;; - Note, above examples wrapped for clarity, should genrally appears as one longline.
;;
;; - May contain  chars e.g. #\Return  and #\Tab these are effectively delimiters
;;
;; - Split on chars: "|" "," #\Tab #\Return #\&
;;
;; - Split on words: "Unknown", "Unsigned", "No Signature", "Anonymous" "Translation" "&amp;"
;;
;; - Maybe can split on years "<YYYY>" - If so we should replace with "circa <YYYY>"
;;
;; - Replace occurencs of: " - Pseudonym" -> " (pseudonym)" 
;;   Or, maybe try to catch all of them:  "Pseudonym" -> "(pseudonym)"
;;
;; - But, we shoud/could also use " x " as a delimiter b/c  it must be.
;;
;; - Remove duplicates 
;;    (remove-duplicates <SEQ> :test #'string-equal) 
;;
;; - Remove dups should catch all but the last:  " x "
;;
;; - Remove occurences of "x" "1" "0" "..." "---" 
;;   Note, we can't always safely remove "1" (and possibly also "0") where the
;;   string contains "free" date strings formatted as: "December, 1, 1894"
;;   b/c, where this was previously split on commas we might potentially have subseqs of
;;   a list which contains: (... "December" "1" "1894" ...) and the "1" in this position is 
;;   contextually relevant information which should not be elided. 
;;   Possible solutions, query the existing 
;;   
;;
;; - see ref 8785 for Gould's items having big long year range lists which should
;;    be replaced with something like "date range 1850-1883"
;;  "1850 1851 1852 1853 1854 1855 1856 1857 1858 1859 1860 1861 1862 1863 1864 1865 1866 1867 1868 1869 1870 1871 1872 1873 1874 1875 1876 1877 1878 1879 1880 1881 1882 1883"
;;  (cl-ppcre:create-scanner 
;;
;; "\(1850 \)\(18[0-9][0-9] \)+1883\( +\)"
;; (cl-ppcre:scan "((1850 )(18[0-9][0-9] )+1883( +))"
;;                "1850 1851 1852 1853 1854 1855 1856 1857 1858 1859 1860 1861 1862 1863 1864 1865 1866 1867 1868 1869 1870 1871 1872 1873 1874 1875 1876 1877 1878 1879 1880 1881 1882 1883      ")
;;
;;
;;   (defun dbc-remove-unwanted-strings (string-bag seq)
;;    delete-if #'(lambda (x)
;;
;; - This sucks because some don't have delimiters in them as they were constructed programatically. 
;;   The best we might be able to do is to split on "|" as even NAF names may have commas in them.
;;  
;;; 

;;; ==============================
;; :FIELD "keywords_type" :TRANSFORM 
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "keywords_type"
;; "4603"
;; - May contain "keywords_type", remove/ignore it.
;; 
;; - Was this actually used? Nope.
;;
;; (search-forward-regexp "keywords_type\">[^<0].*<" nil t)

;;; ==============================
;; :FIELD "keywords_seo" :TRANSFORM 
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "Catulle Mendes, Caricature, Top Hats, Overcoats, bugeyes, facial hair, Smile, portrait, Likeness,"
;; "Hummingbird, twig, branch, tail,yellow, gold, feathers, dove grey, green, throat, beak,"
;; 
;; (split-comma-field  (string-right-trim "," <FIELD>))
;; 
;; (search-forward-regexp "keywords_seo\">[^<0].*<" nil t)
;;
;; may be empty.                                        


;;; ==============================
;;; EBAY-RELATED
;;; ==============================
;;; :NOTE The ebay stuff Should be subclassed. It was never used but does have utility.

;;; ==============================
;; :FIELD "ebay_final" :TRANSFORM 
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Should maybe be a float as like 'ebay_price" but not used anyways... (floatp 0) => nil

;;; ==============================
;; :FIELD "ebay_price" :TRANSFORM 
;;
;;         :TYPE "float unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;; 
;; - Shold we convert these 0 values to 0.0, e.g:
;;   (floatp 0.0) => T
;;   (floatp 0) => nil
;;

;;; ==============================
;; :FIELD "ebay_title" :TRANSFORM 
;;
;;         :TYPE "varchar(55)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;

;;; ==============================
;; :FIELD "ebay_id" :TRANSFORM "id-ebay"
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "ebay_id"
;; "140115400523" ;; one occurence
;;
;; (search-backward-regexp "ebay_id\">[^<0].*<" nil t)
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'


;;; ==============================
;;; STATUS-RELATED
;;; ==============================


;;; ==============================
;; :FIELD "nbre" :TRANSFORM ignorable-number
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;; (search-forward-regexp "<field name=\"nbre\">\\(^0\\)</field>")
;;
;; - This doesn't appear to ever have been used


;;; ==============================
;; :FIELD "online" :TRANSFORM record-status-active
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0 | 1 | 2 | 3
;;
;; - `online` and `onlinen` are far to similiarly named
;;
;;  - These values correspond to:
;;
;;    not-online, sold, duplicate, and online
;;   
;;   Unofortunately I'm having trouble remember which is which
;;
;; - But see the output for SQL tables `sold_refs` `sold_in_store` `orders`
;;   and correspodngin XML files in following paths:
;;     (loop 
;;        with base-dir = (sub-path *xml-input-dir*)
;;        for sold-xml-pathnames in (list "orders-xml" "sold-in-store-xml" "sold-refs-xml")
;;        collect (merge-pathnames (make-pathname :name sold-xml-pathnames) base-dir))
;; 

;;

;;
;; (let ((not-online     (list))
;;       (sold           (list))
;;       (duplicate      (list))
;;       (online         (list))
;;       (something-else (list)))
;;   (loop 
;;      for record-key being the hash-keys in (gethash 'dbc::parsed-inventory-record dbc::*parsed-class-parse-table*) using (hash-value record-value)
;;      for status = (dbc::record-status-active record-value)
;;      do (cond ((equal status "0")
;;                (push (inventory-number record-value) not-online))
;;               ((equal status "1")
;;                (push (inventory-number record-value) sold))
;;               ((equal status "2")
;;                (push (inventory-number record-value) duplicate))
;;               ((equal status "3")
;;                (push (inventory-number record-value) online))
;;               (t
;;                (push (inventory-number record-value) something-else))))
;;   (list 
;;    :not-online        not-online
;;    :sold              sold          
;;    :duplicate         duplicate     
;;    :online            online        
;;    :something-else    something-else))
;; 
;; :NOT-ONLINE <- "0" seems correct 
;; :SOLD       <- "1" has length 7466
;; :DUPLICATE  <- "2" has length 338
;; :ONLINE     <- "3" has length 667


;;; ==============================
;; :FIELD "bar_code" :TRANSFORM inventory-bar-code
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "x"
;;  "bar_code"
;;  "Bree2nd-117"
;;  "AudBirds-006"
;;
;; - May contain "bar_code" remove/ignore it
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'


;;; ==============================
;; :FIELD "user_name" :TRANSFORM edit-by-creator
;;
;;         :TYPE "varchar(100)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  constance
;;

;;; ==============================
;; :FIELD "done" :TRANSFORM job-done
;;
;;         :TYPE "tinyint(4)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  1
;;  127
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Verify that this is always 1 | 0. Its not see ref 4603 with value 127 and corresponding locked value 127
;; (search-forward-regexp "name=\"done\">127</field>" nil t)
;; (search-forward-regexp "name=\"locked\">127</field>" nil t)


;;; ==============================
;; :FIELD "job_name" :TRANSFORM job-id
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "laura_lerire"
;;  "job_name"
;;  "Bree2nd"
;;  "CuvierBrd318-386"
;;  "0"
;;
;; - May contain "job_name", remove/ignore it.
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'

;;; ==============================
;; :FIELD "date_edit" :TRANSFORM edit-date 
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "CURRENT_TIMESTAMP"
;;         :EXTRA "on update CURRENT_TIMESTAMP"
;;
;; :EXAMPLE-VALUES 
;;  "2004-08-11 15:50:25"
;;  "0000-00-00 00:00:00"
;;  "0000-00-00 00:00:00"
;;  "2009-01-27 22:00:31"
;; 
;; - Use local-time
;;
;; - Convert "0000-00-00 00:00:00" to nil
;;
;; - :SEE edit_history below
;; (string= "0000-00-00 00:00:00")


;;; ==============================
;; :FIELD "edit_history" :TRANSFORM edit-history
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "constance-January 27, 2009|constance-January 27, 2009|"
;;
;;  - split on "|" 
;;    - then split on "-" 
;;    -- ?(look for user name occurences and capitalize/normalize)?
;;    --- then parse the date
;;    ---- if (>= (length <VAL>) 2)
;;         Check for multiple occurences and reduce on the count field
;;
;;    * In the last branch, the idea is that often we make multiple edits on a
;;      single day, rather than record each edit it would be better to just
;;      count the times an edit occured.
;;
;;  Return values should have the form:
;;
;; (unwritten-date-edit-fun "constance-January 27, 2009|constance-January 27, 2009|")
;; => ((:DATE (2009 01 27) :USER "constance" :COUNT 2)
;;
;; (unwritten-date-edit-fun "stan-May 6, 2008|constance-April 27, 2009|constance-April 27, 2009|stan-March-4-2010")
;; => ((:DATE (2008 05 06) :USER "stan" :COUNT 1)
;;     (:DATE (2009 04 27) :USER "constance" :COUNT 2)
;;     (:DATE (2010 03 04) :USER "stan" :COUNT 1))
;;
;;  Which is the better format `:DATE` key/val pair at head or `:USER key/val pair?
;;
;;  Or, maybe it would be better to store these as instances on the edit_history
;;  slot with instance having the above ref'd key/val pairs? Going forward, this
;;  would allow attaching additional data w/re what was edited e.g. we could
;;  present diffs for those slots we wished to track...
;;
;;  Also, in some cases where we have the "date_edit" field we should be able to
;;  xref the most recent edit with the most recent entry on the "edit_history"
;;  string. Should we provide more details w/re the timestamp for :COUNT e.g.: 
;;    (:count 1 (2009-01-27-22:00:31))
;;    (:count 2 (2009-01-27-22:00:31 2010-03-27-21:00:31))


;;; ==============================
;;; POTENTIALLY-IGNORABLE
;;; ==============================

;;; ==============================
;; :FIELD "locked" :TRANSFORM job-locked
;;
;;         :TYPE "tinyint(4)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "0"
;;
;; - This field can prob. be ignored.
;;
;; - use `field-convert-1-0-x'

;;; ==============================
;; :FIELD "av_repro" :TRANSFORM inventory-can-repro
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  0
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;; 
;; - Pretty sure this was _never_ used. 
;;
;; - Can effictively be ignored.

;;; ==============================
;; :FIELD "seller" :TRANSFORM inventory-seller
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "lapp"
;;
;; - This never had any utility. But it could if we considered it as consigments or some such.



;;; ==============================
;; :REFS-INFOS
;;
;; :NOTE Use `mon-dbc-xml-parse-clean-fields' to clean these fields
;; :FILEdbc-specific/notes-versioned/dbc-xml-parse-notes/xml-table-fields-parse-regexps-2011-01-06

;; <table_structure name="refs">
;; <field Field="ref" Type="mediumint(8) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
;; <field Field="bar_code" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="title" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="Plate_number" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="price" Type="int(10)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="desc_fr" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="desc_en" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="condition" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="histo_fr" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="histo_en" Type="mediumint(9)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="categ" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c1" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c2" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c3" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c4" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="theme" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="keywords" Type="text" Null="NO" Key="MUL" Extra="" />
;; <field Field="issue" Type="varchar(5)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="year" Type="varchar(100)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="artist" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="author" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="book" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="publisher" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="publish_location" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="w" Type="float unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="h" Type="float unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="technique" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="paper" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="color" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="onlinen" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="av_repro" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="latin_name" Type="varchar(192)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="nbre" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="online" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="seller" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="people" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="related_doc" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="brand" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="translation" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="date" Type="varchar(100)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="user_name" Type="varchar(100)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="done" Type="tinyint(4)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="job_name" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="locked" Type="tinyint(4)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="keywords_type" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="text_quote" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="theme3" Type="varchar(255)" Null="YES" Key="" Extra="" />
;; <field Field="theme2" Type="varchar(255)" Null="YES" Key="" Extra="" />
;; <field Field="c6" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="weight" Type="tinyint(4)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c5" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="composer" Type="varchar(255)" Null="YES" Key="" Extra="" />
;; <field Field="uri" Type="varchar(255)" Null="YES" Key="" Default="0" Extra="" />
;; <field Field="year_year" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="notes" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="volume" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="edition" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="page" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="bct" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="categ_doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c1_doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c2_doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="c3_doc" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="ebay_final" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="ebay_price" Type="float unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="ebay_title" Type="varchar(55)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ebay_id" Type="varchar(255)" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="seo_title" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="description_seo" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="keywords_seo" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="date_edit" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />
;; <field Field="edit_history" Type="text" Null="NO" Key="" Extra="" />

;; <key Table="refs" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="ref" Collation="A" Cardinality="8969" Null="" Index_type="BTREE" Comment="" />

;; <key Table="refs" Non_unique="1" Key_name="keywords" Seq_in_index="1" Column_name="keywords" Cardinality="1" Null="" Index_type="FULLTEXT" Comment="" />

;; <options Name="refs" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="8969" Avg_row_length="939" Data_length="8427580" Max_data_length="281474976710655" Index_length="2570240" Data_free="0" Auto_increment="12418" Create_time="2009-12-08 00:23:22" Update_time="2009-12-08 00:23:23" Check_time="2009-12-08 00:23:24" Collation="latin1_swedish_ci" Create_options="" Comment="" />

;; </table_structure>
;; <table_data name="refs">
;;; ==============================

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
