;;; :FILE-CREATED <Timestamp: #{2011-01-06T13:37:33-05:00Z}#{11014} - by MON>
;;; :FILE dbc-classes/dbc-class-refs-convert.lisp
;;; ==============================


(in-package #:dbc)
;; *package*

(defparameter *parsed-ref-field-name-slot-transform* (make-hash-table :test 'equal))

(vardoc '*parsed-ref-field-name-slot-transform*
        "Hashtable of field-name/transform pairs.~%~@
To be populated with `dbc:preprocess-slot-transform' prior to constructing the
slots for the class `parsed-ref'.
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

;;; ==============================
(defun make-ref-maker-sym-name (ref-parse-field)
  ;; (make-ref-maker-sym-name "ref") => "REF-PARSED-REF"
  (and (mon:string-not-null-or-empty-p ref-parse-field)
       (make-parsed-class-slot-init-accessor-name "parsed-ref" ref-parse-field)))

;; (caddr (make-ref-maker-sym-name "artist"))
;; (make-parsed-class-slot-init-accessor-name  "parsed-ref" "ref")
;; (nth 0 (make-parsed-class-slot-init-accessor-name "dbc-ref" "keywords_type") "PFX"))
;; (nth 2 (make-parsed-class-slot-init-accessor-name "parsed-ref" "keywords_type"))

(defun make-ref-maker-symbol (sym-name)
  ;; (make-ref-maker-symbol "ref")
  ;; (symbolp (make-ref-maker-symbol "ref"))
  (let ((mk-sym (make-ref-maker-sym-name sym-name)))
    (and mk-sym (read-from-string (nth 2 (make-ref-maker-sym-name sym-name))))))

(defun make-ref-lookup-table (ref-list)
  ;; (make-ref-lookup-table (list "ref" "price" "year" "artist" "condition"))
  (let ((ref-hash (make-hash-table :test 'equal)))
    (loop
       :for ref :in ref-list
       :collecting (cons ref (make-ref-maker-symbol ref)) :into tbl
       :finally (loop
                   :for (key . val) :in tbl
                   :do (setf (gethash key ref-hash) val)))
    ref-hash))

;;; ==============================
;; :NOTE `load-sax-parsed-xml-file-to-parsed-class-hash' now has parameter
;; KEY-ACCESSOR which was orignally named PRIMARY-KEY-FUN and provided a
;; somewhat different interface which allowed passing an anonymous function
;; instead of a slot-accessor e.g.:
;;  (load-sax-parsed-xml-file-to-parsed-class-hash <PARSED-CLASS> 
;;                                                 <INPUT-FILE> 
;;                                                 <HASH-TABLE>
;;                                                #'(lambda (x) (cdr (assoc "ref" x :test 'string=))))
;; We've kept the orignal as commented as the alternative semantics may be prove useful in the future.
;;
;; (defun load-sax-parsed-xml-file-to-parsed-class-hash (parsed-class input-file hash-table primary-key-fun) 
;;   (with-open-file (fl input-file :direction :input :element-type 'character :external-format :UTF-8)
;;     (loop
;;        for x = (read fl nil 'EOF)
;;        until (eql x 'EOF)
;;        do (loop 
;;              with obj = (make-instance parsed-class)
;;              for (field . val) in x
;;              for ref = (funcall primary-key-fun x) ;; (cdr (assoc "ref" x :test 'string=))
;;              do (set-parse-ref-slot-value field val obj)
;;              finally (setf (gethash ref hash-table) obj))
;;        finally (return (values hash-table (hash-table-count hash-table))))))
;;
(defun load-sax-parsed-xml-file-to-parsed-class-hash (parsed-class input-file hash-table key-accessor)
  ;; Arg PARSED-CLASS a symbol designating the class we are parsing.
  ;; Arg INPUT-FILE the file containing field/value consed pairs.
  ;; Arg HASH-TABLE the hash-table to insert the class object to. 
  ;; Its `cl:hash-table-test' should be appropriate for use with the type of
  ;; return value of KEY-ACCESSOR, e.g. if KEY-ACCESSOR returns a string the
  ;; `cl:hash-table-test' should be `cl:equal' or `cl:equalp'. whereas if
  ;; KEY-ACCESSOR returns a symbol then `cl:eql' will suffice.
  ;; Arg KEY-ACCESSOR names an accessor function which returns the primary key for the parsed table
  ;; it return value will becomes a hash-table KEY associating PARSED-CLASS in HASH-TABLE.
  ;; As such, it should return always return a non-null value. If not the results are undefined.
  ;; :EXAMPLE
  ;; (defparameter *tt--parse-table* (make-hash-table :test 'equal))
  ;; (clrhash *tt--parse-table*)
  ;; (load-sax-parsed-xml-file-to-parsed-class-hash 'parsed-ref
  ;;                        #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/xml-class-dump-dir/test-seq-2011-09-30"
  ;;                        *tt--parse-table*
  ;;                        #'item-number)
  ;; ;; => #<HASH-TABLE  ... >, 8969
  ;; :NOTE For use with output of `write-sax-parsed-xml-refs-file'.
  ;; `write-sax-parsed-xml-refs-file'
  ;; :SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-ref-slots',
  ;; `write-sax-parsed-ref-slots-to-file', `write-sax-parsed-ref-hash-to-files'.~%▶▶▶")
  (with-open-file (fl input-file
                      :direction :input 
                      :element-type 'character
                      :external-format :UTF-8)
    (loop
       for x = (read fl nil 'EOF)
       until (eql x 'EOF)
       do (loop 
             with obj = (make-instance parsed-class)
             for (field . val) in x
             do (set-parse-ref-slot-value field val obj)
             finally (setf (gethash (funcall key-accessor obj) hash-table) obj))
       finally (return (values hash-table (hash-table-count hash-table))))))



;; :NOTE There is nothing preventing us from making this the generalized
;; interface for printing sax parsed slots it is not specific to the class
;; `parsed-ref'.
;;
;; (fundoc 'print-sax-parsed-ref-slots
;; Keyword PRINT-UNBOUND is a boolean.
;; When t (the default) and a slot of OJBECT's is not `cl:slot-boundp' print its slot-value as "#<UNBOUND>".
;; When null and OJBECT's a slot is not `cl:slot-boundp' print its slot-value as NIL. 
;; The later is useful when serializing an object to a file b/c the de-serialzed
;; OBJECT will have its slot :initarg intialized to nil which is what we've done elswhere for this class
;; :SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-ref-slots',
;; `write-sax-parsed-ref-slots-to-file', `write-sax-parsed-ref-hash-to-files'.~%▶▶▶")
(defun print-sax-parsed-ref-slots (object &key stream (print-unbound t))
  (declare (parsed-ref object)
           (boolean print-unbound))
  (format stream "~&(~{~{:~26:A~S~}~^~%~})"
          (loop 
             with unbound = (when print-unbound "#<UNBOUND>")
             for slot-chk in (mon:class-slot-list object)
             for x = (slot-boundp object slot-chk)
             if x
             nconc (list (list slot-chk (slot-value object slot-chk))) into rtn 
             else  
             nconc (list (list slot-chk unbound)) into rtn
             finally ;;(format stream "~&(~{~{:~26:A~S~}~^~%~})" rtn)))
             (return rtn))))

;; (fundoc 'write-sax-parsed-ref-slots-to-file
;; :EXAMPLE
;; (write-sax-parsed-ref-slots-to-file 
;;  *tt--item*
;;  :output-directory (merge-pathnames #P"individual-parse-refs-2011-10-01/" (sub-path *xml-output-dir*)))
;; :SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-ref-slots',
;; `write-sax-parsed-ref-slots-to-file', `write-sax-parsed-ref-hash-to-files'.~%▶▶▶")
(defun write-sax-parsed-ref-slots-to-file (object &key output-directory (directory-exists-check t))
  (declare (parsed-ref object)
           (boolean directory-exists-check))
 (when directory-exists-check
   (unless (equal output-directory
                  (make-pathname :directory (pathname-directory (probe-file output-directory))))
     (error "arg OUTPUT-DIRECTORY does not designate a valid directory~% got: ~S~%"
            output-directory)))
  (let* ((item-number-if (and (slot-exists-p object 'item-number)
                              (slot-boundp  object 'item-number)
                              (slot-value   object 'item-number)))
         (item-number-if-stringp (or (and item-number-if
                                          (stringp item-number-if)
                                          item-number-if)))
         (item-number-to-file-name (and item-number-if-stringp
                                        (merge-pathnames 
                                         (make-pathname :name (concatenate 'string "item-number-" item-number-if-stringp))
                                         output-directory))))
    (if item-number-to-file-name
        (with-open-file (fl item-number-to-file-name
                            :direction :output 
                            :if-does-not-exist :create
                            :if-exists :supersede
                            :external-format :UTF-8)
          (format nil ";;; :CLASS `parsed-ref' item-number ~D ~%;;; :FILE-CREATED  ~A~%"
                  item-number-if-stringp (mon:timestamp-for-file))
          (print-sax-parsed-ref-slots object :stream fl :print-unbound nil)
          item-number-to-file-name)
        (progn
          (warn "~%Something wrong with arg OBJECT, declining to dump to file~%")
          nil))))

;; (fundoc 'write-sax-parsed-ref-hash-to-files
;; :EXAMPLE
;; (write-sax-parsed-ref-hash-to-files 
;;  <HASH-TABLE>
;;  :output-directory (merge-pathnames #P"individual-parse-refs-2011-10-01/" (sub-path *xml-output-dir*)))
;; :SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-ref-slots',
;; `write-sax-parsed-ref-slots-to-file', `write-sax-parsed-ref-hash-to-files'.~%▶▶▶")
(defun write-sax-parsed-ref-hash-to-files (hash-table &key output-directory)
  (declare (hash-table hash-table))
  (unless (equal output-directory
                 (make-pathname :directory (pathname-directory (probe-file output-directory))))
    (error "arg OUTPUT-DIRECTORY does not designate a valid directory~% got: ~S~%"
           output-directory))
  (maphash #'(lambda (k v)
               (declare (ignore k) (parsed-ref v))
               (write-sax-parsed-ref-slots-to-file v 
                                                   :output-directory output-directory
                                                   :directory-exists-check nil))
           hash-table))

;; Next we need to map the hash-table values and for each object and each slot
;; of object clean up the crap in the fields.
;;
;; One way to do this is to build mapping functions that dump all instances
;; slot-values for a particular slot to a hast-table and then inspect these
;; manually.


;; (make-instance 'parsed-ref)

;;; ==============================

(defclass parsed-ref (parsed-class)
  ((item-number
    :initarg :item-number
    :accessor item-number
    :documentation ":ORIGINAL-FIELD \"ref\"")

   (description-title
    :initarg :description-title
    :accessor description-title
    :documentation  ":ORIGINAL-FIELD \"title\"")

   (description-french ;; description-class
    :initarg :description-french
    :accessor description-french
    :documentation ":ORIGINAL-FIELD \"desc_fr\"")

   (description-english ;; description-class
    :initarg :description-english
    :accessor description-english
    :documentation ":ORIGINAL-FIELD \"desc_en\"")

   (ignorable-history-french
    :initarg :ignorable-history-french
    :accessor ignorable-history-french
    :documentation ":ORIGINAL-FIELD \"histo_fr\"")

   (ignorable-history-english
    :initarg  :ignorable-history-english
    :accessor ignorable-history-english
    :documentation ":ORIGINAL-FIELD \"histo_en\"")

   (description-quote
    :initarg :description-quote
    :accessor description-quote
    :documentation ":ORIGINAL-FIELD \"text_quote\"")

   (description-translation
    :initarg  :description-translation
    :accessor description-translation
    :documentation ":ORIGINAL-FIELD \"translation\"")

   (person-entity-coref
    :initarg :person-entity-coref
    :accessor person-entity-coref
    :documentation ":ORIGINAL-FIELD \"people\"")

   (brand-entity-coref
    :initarg :brand-entity-coref
    :accessor brand-entity-coref
    :documentation ":ORIGINAL-FIELD \"brand\"")

   (composer-entity-coref
    :initarg :composer-entity-coref
    :accessor composer-entity-coref
    :documentation ":ORIGINAL-FIELD \"composer\"")

   (artist-entity-coref
    :initarg :artist-entity-coref
    :accessor artist-entity-coref
    :documentation ":ORIGINAL-FIELD \"artist\"")

   (author-entity-coref
    :initarg :author-entity-coref
    :accessor author-entity-coref
    :documentation ":ORIGINAL-FIELD \"author\"")

   (taxon-entity-coref ;; linnaean-entity-coref???
    :initarg :taxon-entity-coref
    :accessor taxon-entity-coref
    :documentation ":ORIGINAL-FIELD \"latin_name\"")

   (publication-entity-coref  
    :initarg :publication-entity-coref
    :accessor publication-entity-coref
    :documentation ":ORIGINAL-FIELD \"book\"")

   (publication-publisher
    :initarg :publication-publisher
    :accessor publication-publisher
    :documentation ":ORIGINAL-FIELD \"publisher\"")

   (publication-location ;; For congruence with birth-location death-location
    :initarg :publication-location
    :accessor publication-location
    :documentation ":ORIGINAL-FIELD \"publish_location\"")

   (publication-volume   
    :initarg :publication-volume
    :accessor publication-volume
    :documentation ":ORIGINAL-FIELD \"volume\"")

   (publication-edition
    :initarg :publication-edition
    :accessor publication-edition
    :documentation ":ORIGINAL-FIELD \"edition\"")

   (publication-page
    :initarg :publication-page
    :accessor publication-page
    :documentation ":ORIGINAL-FIELD \"page\"")

   (publication-plate ;; :NOTE this is the only field which has its first character capitalized
    :initarg :publication-plate
    :accessor publication-plate
    :documentation    ":ORIGINAL-FIELD \"Plate_number\"")

   (publication-issue
    :initarg :publication-issue
    :accessor publication-issue
    :documentation ":ORIGINAL-FIELD \"issue\"")

   ;; It isn't totally clear yet if this is neccesarrily a publication related fields
   (publication-date ;; For congruence with birth-date death-date 
    :initarg :publication-date
    :accessor publication-date  
    :documentation ":ORIGINAL-FIELD \"year\"")
   ;; It isn't totally clear yet if this is neccesarrily a publication related fields
   (publication-date-range
    :initarg :publication-date-range
    :accessor publication-date-range
    :documentation ":ORIGINAL-FIELD \"year_year\"") 

   (category-0
    :initarg :category-0
    :accessor category-0
    :documentation ":ORIGINAL-FIELD \"categ\"")

   (category-1
    :initarg :category-1
    :accessor category-1
    :documentation ":ORIGINAL-FIELD \"c1\"")

   (category-2
    :initarg :category-2
    :accessor category-2
    :documentation ":ORIGINAL-FIELD \"c2\"")

   (category-3
    :initarg :category-3
    :accessor category-3
    :documentation ":ORIGINAL-FIELD \"c3\"")

   (category-4
    :initarg :category-4
    :accessor category-4
    :documentation ":ORIGINAL-FIELD \"c4\"")

   (category-5
    :initarg :category-5
    :accessor category-5
    :documentation ":ORIGINAL-FIELD \"c5\"")

   (category-6
    :initarg :category-6
    :accessor category-6
    :documentation ":ORIGINAL-FIELD \"c6\"")

   (category-precedence-list
    :initarg :category-precedence-list
    :accessor category-precedence-list
    :documentation ":ORIGINAL-FIELD \"bct\"")

   (documentation-category-0
    :initarg :documentation-category-0
    :accessor documentation-category-0
    :documentation ":ORIGINAL-FIELD \"categ_doc\"")

   (documentation-category-1
    :initarg :documentation-category-1
    :accessor documentation-category-1
    :documentation ":ORIGINAL-FIELD \"c1_doc\"")

   (documentation-category-2
    :initarg :documentation-category-2
    :accessor documentation-category-2
    :documentation ":ORIGINAL-FIELD \"c2_doc\"")

   (documentation-category-3
    :initarg :documentation-category-3
    :accessor documentation-category-3
    :documentation ":ORIGINAL-FIELD \"c3_doc\"")

   (theme-0
    :initarg :theme-0
    :accessor theme-0
    :documentation ":ORIGINAL-FIELD \"theme\"")

   (theme-1
    :initarg :theme-1
    :accessor theme-1
    :documentation ":ORIGINAL-FIELD \"theme2\"")

   (theme-2
    :initarg :theme-2
    :accessor theme-2
    :documentation ":ORIGINAL-FIELD \"theme3\"")
 
   (price-ask ;; The "-ask" suffix is for congruence with "price-ebay" :NOTE Need price-paid, price-sold,
    :initarg :price-ask
    :accessor price-ask
    :documentation ":ORIGINAL-FIELD \"price\"")

   (keywords-sequence
    :initarg :keywords-sequence
    :accessor keywords-sequence
    :documentation ":ORIGINAL-FIELD \"keywords\"")

   (description-condition ;; description-class
    :initarg :description-condition
    :accessor description-condition
    :documentation ":ORIGINAL-FIELD \"condition\"")

   (media-mount
    :initarg :media-mount
    :accessor media-mount
    :documentation ":ORIGINAL-FIELD \"onlinen\"")

   (media-technique
    :initarg :media-technique
    :accessor media-technique
    :documentation ":ORIGINAL-FIELD \"technique\"")

   (media-paper
    :initarg :media-paper
    :accessor media-paper
    :documentation ":ORIGINAL-FIELD \"paper\"")

   (media-color
    :initarg :media-color
    :accessor media-color
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

   (item-seller
    :initarg :item-seller
    :accessor item-seller
    :documentation ":ORIGINAL-FIELD \"seller\"")

   (item-bar-code
    :initarg :item-bar-code
    :accessor item-bar-code
    :documentation ":ORIGINAL-FIELD \"bar_code\"")

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

   (item-active
    :initarg :item-active
    :accessor item-active
    :documentation ":ORIGINAL-FIELD \"online\"")

   (item-uri
    :initarg :item-uri
    :accessor item-uri
    :documentation ":ORIGINAL-FIELD \"uri\"")

   (ignorable-notes
    :initarg :ignorable-notes
    :accessor ignorable-notes
    :documentation ":ORIGINAL-FIELD \"notes\"")

   (ignorable-keywords-type
    :initarg :ignorable-keywords-type
    :accessor ignorable-keywords-type
    :documentation ":ORIGINAL-FIELD \"keywords_type\"")

   (item-can-repro ;; IGNORABLE  
    :initarg :item-can-repro
    :accessor item-can-repro
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

   (title-seo
    :initarg :title-seo
    :accessor title-seo
    :documentation ":ORIGINAL-FIELD \"seo_title\"")

   (description-seo
    :initarg :description-seo
    :accessor description-seo
    :documentation ":ORIGINAL-FIELD \"description_seo\"")

   (keywords-seo
    :initarg :keywords-seo
    :accessor keywords-seo
    :documentation ":ORIGINAL-FIELD \"keywords_seo\"")

   (edit-date-origin ;; IGNORABLE assuming date_edit is present and corresponds.
    :initarg :edit-date-origin
    :accessor edit-date-origin
    :documentation ":ORIGINAL-FIELD \"date\"")

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
 \(mon:class-slot-list  'parsed-ref\)~%~@
:SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash',
`write-sax-parsed-xml-refs-file', `set-parse-ref-slot-value'.~%▶▶▶")))

;;; ==============================
;; (fundoc 'set-parse-ref-slot-value
;; "Map orginal sql tables FIELD-STRING name to OBJECT's CLOS slot equivalent setting its slot-value to FIELD-VALUE.~%~@
;; Return as if by `cl:values':~%
;;  - nth-value 0 is the setf'd FIELD-VALUE as set with slot accessor corresponding to FIELD-STRING.
;;  - nth-value 1 is OBJECT~%~@
;; For use with `load-sax-parsed-xml-file-to-parsed-class-hash' after reading in
;; XML files parsed with `write-sax-parsed-xml-refs-file'.~%~@
;; OJBECT is an instance of class `parsed-ref'.~%~@
;; Original FIELD-STRING is the car of the the consed key/value pairs in one of the alists 
;; written to an output file by `write-sax-parsed-xml-refs-file' FIELD VALUE is
;; the corresponding cdr of the consed key/value pair.~%~@
;; The slot documentation of the class `parsed-ref' provides indication of the
;; mapping from the original field name to our new slot name.~%~@
;; :EXAMPLE
;;  (set-parse-ref-slot-value "ref" "13000" (make-instance 'parsed-ref))
;;
;; :SEE-ALSO `<XREF>'.~%▶▶▶")
;; 
;; :NOTE The setf of the accessor ensures we always populate the slot-value with nil
;; so as to avoid errors when slot is not `slot-boundp'.
(defun set-parse-ref-slot-value (field-string field-value object)
  (values 
   (string-case:string-case (field-string)
    ("ref" (setf (item-number object) field-value))
    ("title" (setf (description-title object) field-value))
    ("desc_fr" (setf (description-french object) field-value))
    ("desc_en" (setf (description-english object) field-value))
    ("histo_fr" (setf (ignorable-history-french object) field-value))
    ("histo_en" (setf (ignorable-history-english object) field-value))
    ("text_quote" (setf (description-quote object) field-value))
    ("translation" (setf (description-translation object) field-value))
    ("people" (setf (person-entity-coref object) field-value))
    ("brand" (setf (brand-entity-coref object) field-value))
    ("composer" (setf (composer-entity-coref object) field-value))
    ("artist" (setf (artist-entity-coref object) field-value))
    ("author" (setf (author-entity-coref object) field-value))
    ("latin_name" (setf (taxon-entity-coref object) field-value))
    ("book" (setf (publication-entity-coref object) field-value))
    ("publisher" (setf (publication-publisher object) field-value))
    ("publish_location" (setf (publication-location object) field-value))
    ("volume" (setf (publication-volume object) field-value))
    ("edition" (setf (publication-edition object) field-value))
    ("page" (setf (publication-page object) field-value))
    ("Plate_number" (setf (publication-plate object) field-value))
    ("issue" (setf (publication-issue object) field-value))
    ("year" (setf (publication-date object) field-value))
    ("year_year" (setf (publication-date-range object) field-value))
    ("categ" (setf (category-0 object) field-value)) 
    ("c1" (setf (category-1 object) field-value))
    ("c2" (setf (category-2 object) field-value))
    ("c3" (setf (category-3 object) field-value))
    ("c4" (setf (category-4 object) field-value))
    ("c5" (setf (category-5 object) field-value))
    ("c6" (setf (category-6 object) field-value))
    ("bct" (setf (category-precedence-list object) field-value))
    ("categ_doc" (setf (documentation-category-0 object) field-value))
    ("c1_doc" (setf (documentation-category-1 object) field-value))
    ("c2_doc" (setf (documentation-category-2 object) field-value))
    ("c3_doc" (setf (documentation-category-3 object) field-value))
    ("theme" (setf (theme-0 object) field-value))
    ("theme2" (setf (theme-1 object) field-value))
    ("theme3" (setf (theme-2 object) field-value))
    ("price" (setf (price-ask object) field-value))
    ("keywords" (setf (keywords-sequence object) field-value))
    ("condition" (setf (description-condition object) field-value))
    ("onlinen" (setf (media-mount object) field-value))
    ("technique" (setf (media-technique object) field-value))
    ("paper" (setf (media-paper object) field-value))
    ("color" (setf (media-color object) field-value))
    ("w" (setf (unit-width object) field-value))
    ("h" (setf (unit-height object) field-value))
    ("nbre" (setf (ignorable-number object) field-value))
    ("seller" (setf (item-seller object) field-value))
    ("bar_code" (setf (item-bar-code object) field-value))
    ("weight" (setf (unit-weight object) field-value))
    ("user_name" (setf (edit-by-creator object) field-value))
    ("done" (setf (job-complete object) field-value))
    ("job_name" (setf (job-id object) field-value))
    ("locked" (setf (job-locked object) field-value))
    ("online" (setf (item-active object) field-value))
    ("uri" (setf (item-uri object) field-value))
    ("notes" (setf (ignorable-notes object) field-value))
    ("keywords_type" (setf (ignorable-keywords-type object) field-value))
    ("av_repro" (setf (item-can-repro object) field-value))
    ("related_doc" (setf (documentation-related object) field-value))
    ("ebay_final" (setf (price-sold-ebay object) field-value))
    ("ebay_price" (setf (price-ask-ebay object) field-value))
    ("ebay_title" (setf (title-ebay object) field-value))
    ("ebay_id" (setf (control-id-ebay object) field-value))
    ("seo_title" (setf (title-seo object) field-value))
    ("description_seo" (setf (description-seo object) field-value))
    ("keywords_seo" (setf (keywords-seo object) field-value))
    ("date" (setf (edit-date-origin object) field-value))
    ("date_edit" (setf (edit-date object) field-value))
    ("edit_history" (setf (edit-history object) field-value)))
   object))



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
;; :NOTE Accessor functions should match the REF-<SLOT>-MAKER names of
;; `*xml-refs-match-table*' as generated with `dbc:make-ref-lookup-table'.
;;
;; THIS IS THE LIST OF SLOTS for `*xml-refs-match-list*':
;;
;; (eql (length *xml-refs-match-list*) 72) => t
;;
;; ("ref" "bar_code" "title" "Plate_number" "price" "desc_fr" "desc_en" "condition"
;;  "histo_fr" "histo_en" "categ" "c1" "c2" "c3" "c4" "theme" "keywords" "issue"
;;  "year" "artist" "author" "book" "publisher" "publish_location" "w" "h"
;;  "technique" "paper" "color" "onlinen" "av_repro" "latin_name" "nbre" "online"
;;  "seller" "people" "related_doc" "brand" "translation" "date" "user_name" "done"
;;  "job_name" "locked" "keywords_type" "text_quote" "theme3" "theme2" "c6" "weight"
;;  "c5" "composer" "uri" "year_year" "notes" "volume" "edition" "page" "bct"
;;  "categ_doc" "c1_doc" "c2_doc" "c3_doc" "ebay_final" "ebay_price" "ebay_title"
;;  "ebay_id" "seo_title" "description_seo" "keywords_seo" "date_edit"
;;  "edit_history")


;;; ==============================
;; :TODO `make-parsed-class-slot-init-accessor-name'
;;  - Separate the slot init-arg frobbing into a dedicated function
;;  - Change optional arg PREFIX-INITARG-W should be a keyword PREFIX-INIT-W
;;  - Add additional keyword SUFFFIX-INIT-W
;;  - Add additional keyword TRANSFORM (or NORMALIZE ???) when non-nil should
;;    rename from PARSED-FIELD to TRANSFORM
;; - Return value should have the format:
;;    <SLOT>  <TRANSFORM>  |  (<INIT> {INIT-PFX | INIT-SFX} )  <ACCESSOR>
;;
;; :SEE make-parsed-class-slot-accessor-name etc.
;;
;; --
;;  Current signature is:
;;   (make-parsed-class-slot-init-accessor-name named-class parsed-field &optional prefix-initarg-w)
;;
;; Current return values have the format:
;;  <SLOT>  ( <INIT-PFX> <FIELD-NAME> ) <ACCESSOR>
;;
;; Current return values are:
;;  (make-parsed-class-slot-init-accessor-name "parsed-ref"  "artist"  "p")
;;   => ("ARTIST" "P-ARTIST" "PARSED-REF-ARTIST")
;;
;;  (make-parsed-class-slot-init-accessor-name "parsed-ref" "keywords_type")
;;  => ("KEYWORDS-TYPE" "KEYWORDS-TYPE" "PARSED-REF-KEYWORDS-TYPE")
;;  
;;


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
;; (make-parsed-class-slot-init-accessor-name "parsed-ref" "keywords_type" "init")
;;    <SLOT>  <TRANSFORM>  |  (<INIT> {INIT-PFX | INIT-SFX})  <ACCESSOR>  
;; '(
;;
;;  "ref"              ;; item-number
;;
;;  "title"            ;; description-title
;;  "desc_fr"          ;; description-french     ;; description-class
;;  "desc_en"          ;; description-english    ;; description-class
;;  "histo_fr"         ;; ignorable-history-french
;;  "histo_en"         ;; ignorable-history-english
;;  "text_quote"       ;; description-quote
;;  "translation"      ;; description-translation
;;
;;  "people"           ;; person-entity-coref
;;  "brand"            ;; brand-entity-coref
;;  "composer"         ;; composer-entity-coref
;;  "artist"           ;; artist-entity-coref
;;  "author"           ;; author-entity-coref
;;  "latin_name"       ;; taxon-entity-coref  ;; linnaean-entity-coref???
;;
;;
;;  "book"             ;; "publication-entity-coref"
;;  "publisher"        ;; "publication-publisher"
;;  "publish_location" ;; "publication-location"   ;; For congruence with birth-location death-location
;;  "volume"           ;; "publication-volume"
;;  "edition"          ;; "publication-edition"
;;  "page"             ;; "publication-page"
;;  "Plate_number"     ;; "publication-plate"
;;  "issue"            ;; "publication-issue"
;;
;;  :NOTE `parsed-artist' class has "appeared_in" -> "publication-appeared-in"
;;
;; It isn't totally clear yet that these are neccesarrily publication related fields:
;;  "year"             ;; publication-date        ;; For congruence with birth-date death-date 
;;  "year_year"        ;; publication-date-range  ;;
;;
;;  "categ"            ;; category-0
;;  "c1"               ;; category-1
;;  "c2"               ;; category-2
;;  "c3"               ;; category-3
;;  "c4"               ;; category-4
;;  "c6"               ;; category-6
;;  "c5"               ;; category-5
;;  "bct"              ;; category-precedence-list
;;
;;  "categ_doc"        ;; documentation-category-0
;;  "c1_doc"           ;; documentation-category-1
;;  "c2_doc"           ;; documentation-category-2
;;  "c3_doc"           ;; documentation-category-3
;;
;;  "theme"            ;; theme-0
;;  "theme2"           ;; theme-1
;;  "theme3"           ;; theme-2
;;
;;  "keywords"         ;; keywords-sequence
;;
;;  "condition"        ;; description-condition  ;; description-class
;;  "onlinen"          ;; media-mount
;;  "technique"        ;; media-technique
;;  "paper"            ;; media-paper
;;  "color"            ;; media-color
;;  "w"                ;; unit-width
;;  "h"                ;; unit-height
;;  "price"            ;; price-ask
;;                     ;; The "-ask" suffix is for congruence with "price-ebay"
;;                     ;; :NOTE Need price-paid, price-sold,
;;
;;  "nbre"             ;; ignorable-number    ;; probably empty
;;
;;  "seller"           ;; item-seller
;;  "bar_code"         ;; item-bar-code
;;  "weight"           ;; unit-weight
;;  "user_name"        ;; edit-by-creator
;;  "done"             ;; job-complete
;;  "job_name"         ;; job-id
;;  "locked"           ;; job-locked   ;; IGNORABLE
;;  "online"           ;; item-active
;;
;;  "uri"              ;; item-uri

;;  "notes"            ;; ignorable-notes
;;  "keywords_type"    ;; ignorable-keywords-type
;;  "av_repro"         ;; item-can-repro ;; IGNORABLE

;;
;;  "related_doc"      ;; documentation-related
;;
;;
;;  "ebay_final"       ;; price-sold-ebay
;;  "ebay_price"       ;; price-ask-ebay
;;  "ebay_title"       ;; title-ebay
;;  "ebay_id"          ;; id-ebay ??? uuid-ebay
;;  "seo_title"        ;; title-seo
;;  "description_seo"  ;; description-seo
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
;; :FIELD "ref" :TRANSFORM item-number
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
;; :FIELD "title" :TRANSFORM description-title :CLASS description-class
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
;; :FIELD "desc_fr" :TRANSFORM description-french  :CLASS description-class
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
;; :FIELD "desc_en" :TRANSFORM description-english  :CLASS description-class
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
;; - Remove "&lt;br&gt"
;; - Remove "&quot;"

;;; ==============================
;; :FIELD "translation" :TRANSFORM description-translation
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

;; (search-forward-regexp "histo_fr\">[^<0x].*<" nil t)

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
;; :FIELD "text_quote" :TRANSFORM description-quote
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
;; :FIELD "Plate_number" :TRANSFORM publication-plate
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


;;; ==============================
;; :FIELD "volume" :TRANSFORM publication-volume
;;
;;         :TYPE "varchar(45)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;

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
;; :FIELD "page" :TRANSFORM publication-page
;;
;;         :TYPE "varchar(45)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
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
;; :FIELD "year" :TRANSFORM publication-date-year
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
;; :FIELD "artist" :TRANSFORM artist-entity-coref
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
;; :FIELD "author" :TRANSFORM  author-entity-coref
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
;; :FIELD "book" :TRANSFORM  publication-entity-coref
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
;; :FIELD "composer" :TRANSFORM composer-entity-coref
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
;; :FIELD "brand" :TRANSFORM brand-entity-coref
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
;; :FIELD "people" :TRANSFORM person-entity-coref
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
;; :FIELD "theme" :TRANSFORM theme-0
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
;; :FIELD "theme2" :TRANSFORM theme-1
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
;; :FIELD "theme3" :TRANSFORM theme-2
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
;; :FIELD "technique" :TRANSFORM media-technique
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
;; :FIELD "paper" :TRANSFORM media-paper
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
;; :FIELD "condition" :TRANSFORM description-condition
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
;;
;;
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
;; - remove trailing period 
;; (string-right-trim "#\." <FIELD>)
;;

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
;; :FIELD "color"  :TRANSFORM media-color
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
;; :FIELD "onlinen" :TRANSFORM media-mount
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
;; :FIELD "bct" :TRANSFORM category-precedence-list
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
;; :FIELD "categ" :TRANSFORM category-0
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
;; :FIELD "c1" :TRANSFORM :TRANSFORM category-1
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
;; :FIELD "c2" :TRANSFORM category-2
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
;; :FIELD "c3" :TRANSFORM category-3
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
;; :FIELD "c4" :TRANSFORM category-4
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
;; :FIELD "c5" :TRANSFORM category-5
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
;; :FIELD "c6" :TRANSFORM category-6
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
;; :FIELD "categ_doc" :TRANSFORM documentation-category-0
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
;; :FIELD "c1_doc" :TRANSFORM documentation-category-1
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
;; :FIELD "c2_doc" :TRANSFORM documentation-category-2
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
;; :FIELD "c3_doc" :TRANSFORM documentation-category-3
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
;; :FIELD "uri" :TRANSFORM item-uri
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
;; :FIELD "seo_title" :TRANSFORM title-seo
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
;; :FIELD "description_seo" :TRANSFORM description-seo :CLASS description-class
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "air, plane, airplane, Biplane, aircraft, expo, center, blimp, dirigible,"
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
;; :FIELD "online" :TRANSFORM item-active
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
;;  - These values correspond to:
;;
;;    not-online, sold, duplicate, and online
;;   
;;   Unofortunately I'm having trouble remember which is which
;;
;; - `online` and `onlinen` are far to similiarly named


;;; ==============================
;; :FIELD "bar_code" :TRANSFORM item-bar-code
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
;; :FIELD "av_repro" :TRANSFORM item-can-repro
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
;; :FIELD "seller" :TRANSFORM item-seller
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
