;;; :FILE-CREATED <Timestamp: #{2024-05-02T19:42:09-04:00Z}#{24184} - by MON KEY>
;;; :FILE $DEVHOME/dbc-specific/dbc-classes/dbc-class-parsed-tgm-theme-record.lisp
;;; ==============================


#| 

:EXTERNAL SYMBOLS

MON:PRIME-OR-NEXT-GREATEST
MON:SIMPLE-ERROR-MON
KLACKS:PEEK
KLACKS:CONSUME
KLACKS:CONSUME-CHARACTERS
KLACKS:FIND-ELEMENT
KLACKS:CLOSE-SOURCE


;;; ==============================

Notes regarding conversion and transformation of LOC TGM files updated quarterly
as posted at following URLs:

https://www.loc.gov/rr/print/tgm1/tgm1.txt
https://www.loc.gov/rr/print/tgm1/tgm1.xml
https://www.loc.gov/rr/print/tgm2/tgm2.txt
https://www.loc.gov/rr/print/tgm2/tgm2.xml

https://www.loc.gov/rr/print/tgm1/downloadtgm1.html
https://www.loc.gov/pictures/collection/tgm/fields.html
https://www.loc.gov/rr/print/tgm1/ic.html



;;; ==============================

:TODO Once the parser is finalized, need to walk through lists for each of the
theme naming slots of class `parsed-tgm-theme-record' and make a key/val pairs
plist/alist/hash of the form:

 <CONTROL-ID-DISPLAY-THEME> . <UUID>

This will apply to slots:
`USED-FOR', `BROADER-THEME',`NARROWER-THEME',`RELATED-THEME', and possibly `USE-THEME'.

It may be that a bi-directional linking structure of some sort is more
applicable than simply adding key/val pairs to a standard CL sequence, but that
needs additional thought and is currently TBD.

Likewise, need to figure out the scheme for storing UUID's for each instance of
`parsed-tgm-theme-record'. We can store this in a separate lookup hashtable
where each theme has the same form as above, eg:

 <CONTROL-ID-DISPLAY-THEME> . <UUID>

Or, we can store the UUID in the object itself and walk the hash-table storing
our `parsed-tgm-theme-record' instances.


;;; ==============================
CXML source:
:SEE (URL "https://github.com/sharplispers/cxml")

CXML documentation:
:SEE (URL "https://cxml.common-lisp.dev/")

Klacks documentation:
:SEE (URL "https://cxml.common-lisp.dev/klacks.html")

;;; ==============================

:NOTE Our last known TGM conversion for class instances of `parsed-theme-record' lives here:
#P"$DEvHOME/CL-MON-CODE/dbc-specific/xml-class-dump-dir/parsed-class-table-dumps/parsed-theme-record/parsed-theme-record-2012-03-21T000438.pctd"


:NOTE Our last known TGM conversion for class instances of `parsed-tgm-theme-record' lives here:
#P"$DEVHOME//HG-Repos/CL-MON-CODE/dbc-specific/xml-class-dump-dir/parsed-class-table-dumps/parsed-tgm-theme-record/parsed-tgm-theme-record-2024-05-09T155002.pctd"

:NOTE These are not the same and are currently orthoganal `parsed-theme-record' <=> `parsed-tgm-theme-record'

:NOTE The Latest TGM file we will work from:
#P"$DEvHOME/CL-MON-CODE/dbc-specific/xml-class-dump-dir/parsed-class-table-dumps/parsed-tgm-theme-record/TGM-TO-PARSE/tgm1.xml"

;;; ==============================

The interface for functions defined herein is as follows:

(sub-path *parsed-tgm-theme-output-dir*)

(sub-path *parsed-tgm-theme-input-dir*)

*parsed-tgm-theme-xml-source-pathname*

(tgm-parse-concepts-set-source-xml-file (merge-pathnames
                                        (dbc::sub-path dbc::*parsed-tgm-theme-input-dir*)
                                        (make-pathname :name "tgm1" :type "xml")))

(tgm-parse-concepts-make-source)

(eq (type-of *parsed-tgm-theme-xml-source*) 'cxml::cxml-source)

(tgm-parse-concept :stream *parsed-tgm-theme-xml-source*)

(clrhash *parsed-tgm-theme-record-hash-table*)

(tgm-parse-concepts-in-stream  :stream *parsed-tgm-theme-xml-source*)

(gethash "Accessories (Clothing & dress)" *parsed-tgm-theme-record-hash-table*)

;; write the `parsed-tgm-theme-record' instances to their default location:
(write-parsed-tgm-theme-record-parse-table-to-file)

;; Load the written file to our default hash-table. 
;; :NOTE !!! This populates instances of class `parsed-tgm-theme-record' NOT `parsed-theme-record'
(load-parsed-tgm-theme-record-parse-file-to-hash-table :clear-existing-table t :load-verbose nil)

*parsed-tgm-theme-record-hash-table*

;; Load the `parsed-theme-record' instances to their hash-table:
;; :NOTE !!! This populates instances of class `parsed-theme-record' NOT `parsed-tgm-theme-record':
(load-parsed-theme-record-default-file-to-parse-table  :key-accessor 'CONTROL-ID-DISPLAY-THEME )

(clrhash (parsed-class-parse-table 'parsed-theme-record))

;; count the length >= 2 of all 'broader-theme slot-values for instances in default hash-table.
(tgm-parse-concept-count-slot-value-list-length 'broader-theme :hash-table *parsed-tgm-theme-record-hash-table*)

;; Identify all class instances of `parsed-theme-record''s with slot-value of
;; `control-id-display-theme' id's that aren't currently present in
;; `*parsed-tgm-theme-record-hash-table*'
(tgm-parse-concept-count-parsed-theme-record-diff)

(system-identity *control-id-theme-namespace*)
;=>  *CONTROL-ID-THEME-NAMESPACE*

(system-identity-parent-uuid *control-id-theme-namespace*)
;=>  a348d6ac-5a81-5d66-b2fe-67fea1abd53d

(system-identity-uuid *system-object-uuid-base-namespace*)
;=> a348d6ac-5a81-5d66-b2fe-67fea1abd53d


(gethash (system-identity-uuid *control-id-theme-namespace*) *control-id-namespace-table*)


|#


(in-package :dbc)

;; (sub-path *parsed-tgm-theme-output-dir*)
;; (class-of *parsed-tgm-theme-output-dir*)
;; (system-described *parsed-tgm-theme-output-dir* nil)
(defparameter *parsed-tgm-theme-output-dir* "parsed-tgm-theme-record")

;; (sub-path *parsed-tgm-theme-output-dir*)
;; (class-of *parsed-tgm-theme-output-dir*)
;; (system-described *parsed-tgm-theme-output-dir* nil)
(defparameter *parsed-tgm-theme-input-dir* "TGM-TO-PARSE")

(defparameter *parsed-tgm-theme-xml-source-pathname* nil)

(defparameter *parsed-tgm-theme-xml-source* nil)

;; (sb-ext:hash-table-synchronized-p *parsed-tgm-theme-record-hash-table*)
;; :NOTE The current TGM file contains 13203 concepts.
(defparameter *parsed-tgm-theme-record-hash-table*
              #-sbcl(make-hash-table :test #'equal :synchronized t)
              (make-hash-table-sync :size (MON:PRIME-OR-NEXT-GREATEST 13202) :test #'equal))
;; 
;; (setq *parsed-tgm-theme-record-hash-table*
;;       (make-hash-table-sync :size (MON:PRIME-OR-NEXT-GREATEST 13202) :test #'equal))

(defvar *parsed-tgm-theme-field-to-accessor-table*
  '(("DESCRIPTOR"      . control-id-display-theme)
    ("NON-DESCRIPTOR"  . non-descriptor)
    ("USE"             . use-theme)
    ("Facet"           . facet-note)
    ("SN"              . scope-note)
    ("UF"              . used-for)
    ("BT"              . broader-theme)
    ("NT"              . narrower-theme)
    ("RT"              . related-theme)
    ("CN"              . cataloger-note)
    ("HN"              . history-note)
    ("FUN"             . former-usage-note)
    ("TTCRef"          . theme-type-category-reference)
    ("TTCSubd"         . theme-type-category-subdivision)
    ("TTCSubj"         . theme-type-category-subject)
    ("TTCForm"         . theme-type-category-genre)
    ("FCNgmgpc"        . control-id-theme-entity-tgm-2-former-num)
    ("FCNlctgm"        . control-id-theme-entity-tgm-1-former-num)
    ("TNR"             . control-id-theme-entity-loc-num)
    ;; Following doesn't appear in the downloaded TGM XML file.
    ;; Including here for consistency w/r/t `make-parsed-class-field-slot-accessor-mapping'
    ;; in case we ever decide to tie into the parsed-class-foo methods
    ("__IGNORED-1"     . control-id-theme-entity-loc-uri)
    ("__IGNORED-2"     . image-coref)
    ("__IGNORED-3"     . image-default-xref)
    ("__IGNORED-4"     . record-status-active)
    ("__IGNORED-5"     . edit-timestamp)
    ("__IGNORED-6"     . control-id-theme-entity-dbc-num)
    ;;("__IGNORED-7"     .  system-identity-uuid) ;; *CONTROL-ID-THEME-NAMESPACE*
    ))

;; :TODO once we have finalized the TGM parse we can begin unifying instances of
;; `parsed-tgm-theme-record' with instances of `parsed-theme-record'. we will
;; start by making `parsed-tgm-theme-record' a subclass of `parsed-class'
;; and then uncommeing following `make-parsed-class-field-slot-accessor-mapping' form:
;;  (make-parsed-class-field-slot-accessor-mapping 'parsed-tgm-theme-record *parsed-tgm-theme-field-to-accessor-table*)


;;; ==============================
;; :NOTE The class `parsed-tgm-theme-record' is NOT to be confused with class
;; `parsed-theme-record' which references themes recorded to the orginal dbc SQL
;; table.
;; :NOTE currently we don't set initforms for some slots:
;; `control-id-display-theme',`non-descriptor',
;; `use-theme', `control-id-theme-entity-tgm-2-former-num',
;; `control-id-theme-entity-tgm-1-former-num',`control-id-theme-entity-loc-num'
;;
;; Reciprocal Relationships among these slots:
;; use-theme <--> used-for
;; broader-theme <--> narrowoer-theme
;; related-theme <--> related-theme
;;
(defclass parsed-tgm-theme-record () ;; (parsed-class)
  ((control-id-display-theme ; Congruent with slot in class `parsed-theme-record'.
    ;; base-dbc -> base-control-id -> control-id-display-name -> (control-id-display-name-for-entity-type control-id-theme-entity) ->  control-id-theme-entity-display-name -> control-id-display-theme
    :initarg :control-id-display-theme
    :accessor control-id-display-theme
    :documentation #.(classdoc 'parsed-tgm-theme-record :control-id-display-theme))
   (non-descriptor
    :initarg :non-descriptor
    :accessor non-descriptor
    :documentation #.(classdoc 'parsed-tgm-theme-record :non-descriptor))
   (use-theme
    :initarg :use-theme
    ;; :initform '() ; Don't default when used it's a string.
    :accessor use-theme
    :documentation #.(classdoc 'parsed-tgm-theme-record :use-theme))
   (used-for
    :initarg :used-for
    :initform '()
    :accessor used-for
    :documentation #.(classdoc 'parsed-tgm-theme-record :used-for))
   (broader-theme
    :initarg :broader-theme
    :initform '()
    :accessor broader-theme
    :documentation #.(classdoc 'parsed-tgm-theme-record :broader-theme))
   (narrower-theme
    :initarg :narrower-theme
    :initform '()
    :accessor narrower-theme
    :documentation #.(classdoc 'parsed-tgm-theme-record :narrower-theme))
   (related-theme
    :initarg :related-theme
    :initform '()
    :accessor related-theme
    :documentation #.(classdoc 'parsed-tgm-theme-record :related-theme))
   (facet-note
    :initarg :facet-note
    :initform '()
    :accessor facet-note
    :documentation #.(classdoc 'parsed-tgm-theme-record :facet-note))
   (scope-note
    :initarg :scope-note
    :initform '()
    :accessor scope-note
    :documentation #.(classdoc 'parsed-tgm-theme-record :scope-note))
   (cataloger-note
    :initarg :cataloger-note
    :initform '()
    :accessor cataloger-note
    :documentation #.(classdoc 'parsed-tgm-theme-record :cataloger-note))
   (history-note
    :initarg :history-note
    :initform '()
    :accessor history-note
    :documentation  #.(classdoc 'parsed-tgm-theme-record :history-note))
   (theme-type-category-reference
    :initarg :theme-type-category-reference
    :initform '()
    :accessor theme-type-category-reference
    :documentation #.(classdoc 'parsed-tgm-theme-record :theme-type-category-reference))
   (theme-type-category-subdivision
    :initarg :theme-type-category-subdivision
    :initform '()
    :accessor theme-type-category-subdivision
    :documentation #.(classdoc 'parsed-tgm-theme-record :theme-type-category-subdivision))
   (theme-type-category-subject
    :initarg :theme-type-category-subject
    :initform '()
    :accessor theme-type-category-subject
    :documentation #.(classdoc 'parsed-tgm-theme-record :theme-type-category-subject))
   (theme-type-category-genre
    :initarg :theme-type-category-genre
    :initform '()
    :accessor theme-type-category-genre
    :documentation #.(classdoc 'parsed-tgm-theme-record :theme-type-category-genre))
   (former-usage-note
    :initarg :former-usage-note
    :initform '()
    :accessor former-usage-note
    :documentation #.(classdoc 'parsed-tgm-theme-record :former-usage-note))
   (control-id-theme-entity-tgm-2-former-num
    :initarg :control-id-theme-entity-tgm-2-former-num
    ;; :initform   ; Don't default.
    :accessor control-id-theme-entity-tgm-2-former-num
    :documentation #.(classdoc 'parsed-tgm-theme-record :control-id-theme-entity-tgm-2-former-num))
   (control-id-theme-entity-tgm-1-former-num
    :initarg :control-id-theme-entity-tgm-1-former-num
    ;; :initform   ; Don't default.
    :accessor control-id-theme-entity-tgm-1-former-num
    :documentation #.(classdoc 'parsed-tgm-theme-record :control-id-theme-entity-tgm-1-former-num))
   (control-id-theme-entity-loc-num  ; Congruent with slot in class `parsed-theme-record'.
    :initarg :control-id-theme-entity-loc-num
    :accessor control-id-theme-entity-loc-num
    :documentation #.(classdoc 'parsed-tgm-theme-record :control-id-theme-entity-loc-num))
   ;; :NOTE Not included in xml/txt file we are parsing, but it is usefull to include this now.
   ;; dbc-theme-request-loc-x-uri
   (control-id-theme-entity-loc-uri  ; Congruent with slot in class `parsed-theme-record'.
    :initarg :control-id-theme-entity-loc-uri
    :initform '()
    :accessor control-id-theme-entity-loc-uri
    :documentation #.(classdoc 'parsed-tgm-theme-record :control-id-theme-entity-loc-uri))
   (image-coref        ; Congruent with slot in class `parsed-theme-record'.
    :initarg       :image-coref
    :initform      '()
    :accessor      image-coref
    :documentation #.(classdoc 'parsed-tgm-theme-record :image-coref))
   (image-default-xref ; Congruent with slot in class `parsed-theme-record'.
    :initarg      :image-default-xref
    :initform     '()
    :accessor     image-default-xref
    :documentation #.(classdoc 'parsed-tgm-theme-record :image-default-xref))
   (record-status-active ; Congruent with slot in class `parsed-theme-record'.
    :initarg      :record-status-active
    :initform     '()
    :accessor      record-status-active
    :documentation #.(classdoc 'parsed-tgm-theme-record :record-status-active))
   (edit-timestamp  ; Congruent with slot in class `parsed-theme-record'.
    :initarg       :edit-timestamp
    :initform      '()
    :accessor       edit-timestamp
    :documentation #.(classdoc 'parsed-tgm-theme-record :edit-timestamp))
   ;; Following has slot-value's in parsed-tgm-theme-record that are unused
   ;; elswhere in the system AFAIK.
   (control-id-theme-entity-dbc-num ; Congruent with slot in class `parsed-theme-record'.
    :initarg        :control-id-theme-entity-dbc-num
    :initform      '()
    :accessor      control-id-theme-entity-dbc-num
    :documentation #.(classdoc 'parsed-tgm-theme-record :control-id-theme-entity-dbc-num)))
  (:documentation  #.(classdoc 'parsed-tgm-theme-record :class-doc)))

(defun %print-parsed-tgm-theme-record-helper (object stream)
  (let ((disp (and (slot-boundp object 'control-id-display-theme)
                   (slot-value  object 'control-id-display-theme))))
    (if disp
        (format stream ":CONTROL-ID-DISPLAY-THEME ~S" disp)
        (format stream ":CONTROL-ID-DISPLAY-THEME NUL/UNBOUND"))))

(defmethod print-object ((object parsed-tgm-theme-record) stream)
  (print-unreadable-object (object stream :type t)
    (%print-parsed-tgm-theme-record-helper object stream)))


(defun tgm-parse-concepts-set-source-xml-file (pathname)
  (and (or (pathnamep pathname)
               (error ":FUNCTION `tgm-parse-concepts-set-source-xml-file' -- arg PATHNAME does not satisfy `cl:pathnamep' -- :GOT ~S~%" pathname))
       (or (probe-file pathname)
               (error (concatenate 'string ":FUNCTION `tgm-parse-concepts-set-source-xml-file' unable to set~%"
                                           ":VARIABLE `*parsed-tgm-theme-xml-source-pathname*'~%:PATHNAME ~S supplied did not satisfy `cl:probe-file'.~%")
                      pathname))
       (setf *parsed-tgm-theme-xml-source-pathname* pathname)))
        
(defun tgm-parse-concepts-make-source ()
  (unless (and (not (null *parsed-tgm-theme-xml-source-pathname*))
               (pathnamep *parsed-tgm-theme-xml-source-pathname*))
    (MON:SIMPLE-ERROR-MON :w-sym 'tgm-parse-concepts-make-source
                          :w-type 'function
                          :w-spec (concatenate 'string "Attempting to set Value of parameter `*parsed-tgm-theme-xml-source*',~%"
                                                       "but `*parsed-tgm-theme-xml-source-pathname*' either null or does not satisfy `cl:pathnamep'.")
                          :w-got *parsed-tgm-theme-xml-source-pathname* :w-type-of t))
  (when (typep  *parsed-tgm-theme-xml-source* 'cxml::cxml-source)
    (klacks:close-source  *parsed-tgm-theme-xml-source*))
  (setf *parsed-tgm-theme-xml-source* (cxml:make-source  *parsed-tgm-theme-xml-source-pathname* :pathname t)))


;; (tgm-assoc-elt "DESCRIPTOR")
(defun tgm-assoc-elt (elt &key (mapping *parsed-tgm-theme-field-to-accessor-table*))
  ;; :NOTE we probably don't need to allow for NIL and could constrain to `cl:strinp' only, 
  ;; but `tgm-assoc-elt' is used in macrology inside `%tgm-sec-helper' so don't mess around, 
  ;; and play it safe instead.
  (unless (or (null elt) (stringp elt))
    (MON:SIMPLE-ERROR-MON :w-sym 'tgm-assoc-elt
                          :w-type 'function
                          :w-spec "expected a string for arg ELT"
                          :w-got elt :w-type-of t))
  (cdr  (find elt mapping :key #'car :test #'string-equal)))

(defun tgm-peeking (&key stream)
  (multiple-value-bind (v1 v2 v3 v4)
      (KLACKS:PEEK stream)
    (list v1 v2 v3 v4)))

(defun tgm-peeking-get-val (&key (nth-val 1) stream)
  (nth nth-val (tgm-peeking :stream stream)))

(defun tgm-consume (&key stream)
  (multiple-value-bind (v1 v2 v3 v4)
      (KLACKS:CONSUME stream)
    (list v1 v2 v3 v4)))

(defun tgm-characters-every-whitespace-p (&key stream)
  (let ((v2 (tgm-peeking-get-val :nth-val 1 :stream stream)))
    (and (or (stringp v2)
             (error (format nil ":FUNCTION `tgm-characters-every-whitespace-p' - expected a string ~%:GOT ~S" v2)))
         (<= (length v2) 2)
         (every #'MON:WHITESPACE-CHAR-P v2))))

(defun tgm-start-element-consume (&key object accessor (nth-val 1) peek-val stream (as-values nil))
  (let* ((consumed (progn
                     (tgm-consume :stream stream)
                     (if (eq (car (tgm-peeking :stream stream)) :characters)
                         ;; The if condition above accounts for :character
                         ;; events that contain XML escaped characters "&apos;", "&amp;" eg:
                         ;; <FUN>Formerly TGMI term (nonpostable) &amp; TGMII term (nonpostable).</FUN>
                         ;; and <RT>Farmers&apos; groups</RT>
                         ;; We assume here than any characters encountered in
                         ;; the element don't satisfy `tgm-characters-every-whitespace-p'.
                         (list nil (KLACKS:CONSUME-CHARACTERS stream))
                       (tgm-consume :stream stream))))
         (slot-val     (nth nth-val consumed)))
    (if (slot-boundp object accessor)   ; We leave certain slots unbound, as these should always default to a string.
        (cond ((listp (slot-value object accessor))
               (push slot-val (slot-value object accessor)))
              ((stringp (slot-value object accessor))
               (setf (slot-value object accessor) slot-val)))
        (eval `(setf (,accessor ,object) ,slot-val)))
    (if as-values
        (values
         (slot-value object accessor)
         peek-val
         consumed
         object)
        (slot-value object accessor))))

(defmacro %tgm-sec-helper (object accessor nth-val peek-val stream)
  `(tgm-start-element-consume :object   ,object
                              :accessor ,accessor                              
                              :nth-val  ,nth-val
                              :peek-val ,peek-val
                              :stream   ,stream))


;; klacks:peek returns as values the following:
;; :start-document
;; :start-document, version, encoding, standalonep
;; :dtd, name, public-id, system-id
;; :start-element, uri, lname, qname
;; :end-element, uri, lname, qname
;; :characters, data
;; :processing-instruction, target, data
;; :comment, data
;; :end-document, data
;; nil
(defun tgm-peek-start-element-and-maybe-add-to-slot (object &key stream)
  (let ((peek-val)
        (case-key ))
    (ecase (setf case-key (tgm-peeking-get-val  :nth-val 0 :stream stream))
      (:start-document 
       (KLACKS:FIND-ELEMENT stream  "CONCEPT"))
      (:processing-instruction ;; , target, data
       (KLACKS:FIND-ELEMENT stream  "CONCEPT"))
      (:dtd ;; , name, public-id, system-id
       (KLACKS:FIND-ELEMENT stream  "CONCEPT"))
      (:comment
       (KLACKS:CONSUME stream))
      (:end-element
       (if (equal (nth 2 (tgm-peeking :stream stream)) "CONCEPT")
           (progn (tgm-consume :stream stream) nil )
           (progn (tgm-consume :stream stream) case-key)))
      (:characters
       (if (tgm-characters-every-whitespace-p :stream stream)
           (progn (tgm-consume :stream stream) case-key )
           ;; We need to set the slot value if we aren't looking at whitespace. can this happen?
           (progn (tgm-peeking :stream stream) case-key)))
      (:end-document
       nil)
      (:start-element
       (setq peek-val (tgm-peeking-get-val :nth-val 2 :stream stream))
       (let ((mapping '("USE" "Facet" "SN" "UF" "BT" "NT" "RT"   
                        "CN" "HN" "FUN" "TTCRef" "TTCSubd" "TTCSubj"
                        "TTCForm"  "FCNgmgpc"  "FCNlctgm" "TNR")))
         (cond
           ((equal "CONCEPT" peek-val)
            (progn 
              (tgm-consume :stream stream)
              case-key))
           ((equal "DESCRIPTOR" peek-val)
            (%tgm-sec-helper object (tgm-assoc-elt peek-val) 1 (tgm-peeking :stream stream) stream))
            ;; :NOTE We put the `non-descriptor' slot value on `control-id-display-theme' slot value as well, because the
            ;; display name for a given theme is our key primary key for use with indexing data structures
            ;; that index and perform lookups on themes. The structure will likely be a hash-table.
            ((equal "NON-DESCRIPTOR" peek-val)
             (progn
               (%tgm-sec-helper object (tgm-assoc-elt peek-val) 1 (tgm-peeking :stream stream) stream)
               (setf (control-id-display-theme object) (non-descriptor object))))
            ((member peek-val mapping :test #'string=)
             (%tgm-sec-helper object (tgm-assoc-elt peek-val :mapping mapping) 1 (tgm-peeking :stream stream) stream))
            ;; This shouldnt ever happen. print a message to standard out, and return NIL.
            ;; Doing so allows droping out of parsing loops by calling function.
            (t  
             (warn (concatenate 'string 
                                "~%!!!!!!!!!!~%:FUNCTION `tgm-peek-start-element-and-maybe-add-to-slot'~%           "
                                "-- When parsing a :START-ELEMENT event, case forms failed to trigger correctly.~%!!!!!!!!!!~%"))
             nil)))))))


(defun tgm-parse-concept (&key stream)
  (let ((current-object (make-instance 'parsed-tgm-theme-record)))
    (loop 
      for reading = (tgm-peek-start-element-and-maybe-add-to-slot current-object :stream stream)
      until (null reading))
    (if  (slot-boundp current-object 'control-id-display-theme)
         ;; Don't set the slot value and don't return object if we never found an
         ;; XML value for control-id-display-theme when parsing current concept.
         (values current-object (control-id-display-theme current-object))
         ;; Instead, return NIL. Doing so lets us drop out of the file parsing loop by
         ;; calling functions, eg: (loop  unitl (null tgm-parse-concept :stream stream) ...)
        (values nil nil))))

;; :TODO We need a like function wrapped around `dbc-theme-request-loc-x-uri' that should do
;; similiarly to what `tgm-parse-concepts-update-unbound-slots' does.
(defun tgm-parse-concepts-update-unbound-slots (&key (hash-table *parsed-tgm-theme-record-hash-table*))
  (let ((class-slots (MON:CLASS-SLOT-LIST 'parsed-tgm-theme-record)))
    (with-locked-hash-table (hash-table)
      (loop with ht = hash-table
          for obj-id being the hash-keys in ht
          for obj being the hash-values in ht
          when (loop with obj-inner = obj
                     with obj-inner-id = obj-id
                     for slot in class-slots
                     unless (slot-boundp  obj-inner slot)
                     do (setf (slot-value obj-inner  slot) nil)
                     and count obj-inner-id into cnt
                     end
                     finally (return (if (> cnt 0) cnt nil)))
          ;; collect it into outer-gather
          count it into outer-count
          end
          finally (return outer-count)))))

;; (tgm-parse-concept :stream *parsed-tgm-theme-xml-source*)
;; (tgm-parse-concepts-in-stream :stream *parsed-tgm-theme-xml-source*)
;; (tgm-parse-concepts-in-stream  :stream  (tgm-parse-concepts-make-source))
;; (tgm-parse-concepts-make-source *parsed-tgm-theme-xml-source*)
(defun tgm-parse-concepts-in-stream (&key stream 
                                         (hash-table *parsed-tgm-theme-record-hash-table*)
                                         (clear-hash-p T))
  (when (and clear-hash-p (> (hash-table-count hash-table) 0))
    (with-locked-hash-table (hash-table) (clrhash hash-table)))
  (unwind-protect  ;; (KLACKS:WITH-OPEN-SOURCE (s stream)
       (loop for read-obj = (tgm-parse-concept :stream stream)
               for set-hash = (when read-obj
                                (with-locked-hash-table (hash-table)
                                  (setf (gethash (control-id-display-theme read-obj) hash-table)
                                        read-obj)))
               until (null read-obj)
               finally (return
                         (values
                          hash-table
                          (hash-table-count hash-table)
                          (tgm-parse-concepts-update-unbound-slots :hash-table hash-table))))
         (KLACKS:CLOSE-SOURCE stream)))


(defun write-parsed-tgm-theme-record-parse-table-to-file (&key
                                                          (hash-table *parsed-tgm-theme-record-hash-table*)
                                                          (base-output-directory (sub-path *parsed-tgm-theme-output-dir*))
                                                          (pathname-name "parsed-tgm-theme-record")
                                                          (pathname-type  *parsed-class-table-output-pathname-type*)
                                                          (timestamp-p t))
  (let*  ((pathname-stamped  (make-pathname :name (or (and timestamp-p 
                                                           (concatenate 'string pathname-name "-" (MON:TIMESTAMP-FOR-FILE)))
                                                      pathname-name)))
          (pathname-and-type (make-pathname :name (pathname-name pathname-stamped) 
                                            :type pathname-type))
          (ensure-directory 
            (or (and (eql base-output-directory (sub-path *parsed-tgm-theme-output-dir*))
                     base-output-directory)
                (or (UIOP:DIRECTORY-EXISTS-P base-output-directory)
                    (MON:SIMPLE-ERROR-MON :w-sym '%write-parsed-tgm-theme-record-parse-table-to-file
                                          :w-type 'function
                                          :w-spec '("Arg BASE-OUTPUT-DIRECTORY did not satisfy `uiop:directory-exists-p'.~%"
                                                    "   -- Declining to write to :FILE ~S~%"
                                                    "   -- With contents of :HASH-TABLE ~S~%"
                                                    "   -- To :DIRECTORY ~S")
                                          :w-args `(,pathname-and-type ,hash-table ,base-output-directory)))))
          (full-path (make-pathname :directory (pathname-directory ensure-directory)
                                    :name (pathname-name pathname-stamped)
                                    :type pathname-type))
          (hash-table (or (and (eql hash-table *parsed-tgm-theme-record-hash-table*)
                               (> (hash-table-count *parsed-tgm-theme-record-hash-table*) 0)
                               *parsed-tgm-theme-record-hash-table*)
                          (and (hash-table-p  hash-table)
                               (not (zerop (hash-table-count hash-table)))
                               hash-table)
                          (MON:SIMPLE-ERROR-MON :w-sym '%write-parsed-tgm-theme-record-parse-table-to-file
                                                :w-type 'function
                                                :w-spec '("ARG HASH-TABLE not suitable. Failed to satisfy either "
                                                          "`cl:hash-table-p' or `cl:zerop'  of it's `hash-table-count'.~%"
                                                          "   -- Declining to write to :FILE ~S~%"
                                                          "   -- IN :DIRECTORY ~S~%"
                                                          "   -- With contents of :HASH-TABLE ~S~%")
                                                :w-args `(,pathname-and-type ,base-output-directory ,hash-table)))))
    (with-open-file (fl full-path :direction :output
                                  :if-exists :supersede
                                  :if-does-not-exist :create
                                  :element-type 'character
                                  :external-format :UTF-8)
      (format fl ";;; :CLASS `~A'~%;;; :FILE-CREATED ~A~%~%"
              'parsed-tgm-theme-record
              (LOCAL-TIME:FORMAT-TIMESTRING nil (LOCAL-TIME:NOW)))
      (with-locked-hash-table (hash-table)
      (loop
        for obj being the hash-values of hash-table
        for frmt-cntl = (print-sax-parsed-slots-padding-format-control obj)
        do (print-sax-parsed-slots obj 
                                   :stream fl
                                   :print-unbound nil
                                   :pre-padded-format-control frmt-cntl)
           (write-char #\Newline fl)
           (write-char #\Newline fl))
      (values
       full-path
       pathname-and-type
       hash-table)))))

;; (write-parsed-tgm-theme-record-parse-table-to-file)
;; (load-parsed-tgm-theme-record-parse-file-to-hash-table :clear-existing-table t load-verbose nil)
(defun load-parsed-tgm-theme-record-parse-file-to-hash-table (&key 
                                                              (input-pathname nil)
                                                              (key-accessor 'control-id-display-theme)
                                                              (hash-table *parsed-tgm-theme-record-hash-table*)
                                                              (clear-existing-table nil)
                                                              (input-pathname-directory (sub-path *parsed-tgm-theme-output-dir*))
                                                              (input-pathname-name "parsed-tgm-theme-record")
                                                              (input-pathname-type  *parsed-class-table-output-pathname-type*)
                                                              (load-verbose t))
  (let ((in-file
         (if input-pathname 
             (or (probe-file input-pathname)
                 (MON:SIMPLE-ERROR-MON 
                 :w-spec "`cl:probe-file' did not find suitable directory for INPUT-PATHNAME"
                 :w-sym 'load-parsed-tgm-theme-record-parse-file-to-hash-table
                 :w-got input-pathname
                 :w-type-of t))
             (let* ((wild-pathname-pattern
                      (CL-PPCRE:CREATE-SCANNER
                       (format nil "^~(~A~)-2[0-9]{3}?-[0-9]{2}?-[0-9]{2}?T[0-9]{6}?$" 'parsed-tgm-theme-record)))
                    (maybe-wild-pathnames  (merge-pathnames (make-pathname :name :wild :type input-pathname-type)
                                                            (or (probe-file  (make-pathname :directory (pathname-directory input-pathname-directory)))
                                                                (MON:SIMPLE-ERROR-MON 
                                                                 :w-spec "`cl:probe-file' did not find suitable directory for INPUT-PATHNAME-DIRECTORY"
                                                                 :w-sym 'load-parsed-tgm-theme-record-parse-file-to-hash-table
                                                                 :w-got  input-pathname-directory
                                                                 :w-type-of t))))
                    (maybe-find-wilds (directory maybe-wild-pathnames))
                    (most-recent-parse-file (or (and maybe-find-wilds
                                                     (car (sort (delete-if-not #'(lambda (x) (CL-PPCRE:SCAN wild-pathname-pattern x))
                                                                               maybe-find-wilds
                                                                               :key #'pathname-name)
                                                                #'string>
                                                                :key #'pathname-name)))
                                     (MON:SIMPLE-ERROR-MON 
                                      :w-spec "did not find suitable parsed file beneath directory: ~S~%"
                                      :w-sym 'load-parsed-tgm-theme-record-parse-file-to-hash-table
                                      :w-got  input-pathname-directory
                                      :w-type-of t))))
               most-recent-parse-file))))
    (when in-file
      (and clear-existing-table 
           (with-locked-hash-table (hash-table) (clrhash hash-table)))
      (with-locked-hash-table (hash-table)
        (load-parsed-class-default-file-to-hash-table 
         :parsed-class 'parsed-tgm-theme-record
         :input-file    in-file
         :hash-table    hash-table
         :key-accessor  key-accessor
         :load-verbose  load-verbose)))))


;; (tgm-parse-concept-count-slot-value-list-length 'broader-theme :hash-table *parsed-tgm-theme-record-hash-table*)
(defun tgm-parse-concept-count-slot-value-list-length (slot &key (hash-table *parsed-tgm-theme-record-hash-table*))
  (let ((rslt (with-locked-hash-table (hash-table)
                (loop 
                  for obj-id being the hash-keys in hash-table
                  for obj being the hash-values in hash-table
                  for sv = (slot-value obj slot)
                  for sv-len = (length sv)
                  unless (or (null sv)
                             (stringp sv)
                             (= sv-len 1))
                  collect (list sv-len obj-id sv) into gthr
                  end
                  finally (return gthr)))))
    (if (null rslt)
        rslt
        (values 
         (setf rslt (stable-sort rslt #'> :key #'car))
         (length rslt)))))

;; (tgm-parse-concept-count-slot-value-null 'control-id-theme-entity-loc-num)
(defun tgm-parse-concept-count-slot-value-null (slot &key (hash-table *parsed-tgm-theme-record-hash-table*))
  (loop 
    for obj-id being the hash-keys in *parsed-tgm-theme-record-hash-table* using (hash-value obj)
    for slot-v = (slot-value obj slot)
    when (null slot-v) 
    count it into cnt
    and
    collect obj-id into gthr
    end
    finally (return (values gthr cnt))))

;; (load-parsed-theme-record-default-file-to-parse-table  :key-accessor 'CONTROL-ID-DISPLAY-THEME )
;; (parsed-class-parse-table 'parsed-theme-record)
;;
;; (defparameter *tt--matching-themes-table* (make-hash-table :test #'equal)) (clrhash *tt--matching-themes-table*)
;;
;; Following finds all parsed-theme-record's with control-id-display-theme id's that aren't in 
;; `*parsed-tgm-theme-record-hash-table*':
;; (tgm-parse-concept-count-parsed-theme-record-diff :match-table *tt--matching-themes-table*)
(defun tgm-parse-concept-count-parsed-theme-record-diff (&key (tgm-hash-table *parsed-tgm-theme-record-hash-table*)
                                                              (match-table (make-hash-table-sync 
                                                                            :test #'equal)))
  (loop 
    with hash-table-themes = (parsed-class-parse-table 'parsed-theme-record)
    with hash-table-tgm = tgm-hash-table
    for theme-id being the hash-keys in hash-table-themes
    for theme-obj being the hash-values in hash-table-themes
    unless (gethash theme-id hash-table-tgm)
    do (setf (gethash theme-id match-table) theme-obj))
match-table)


;; (loop 
;;        with null-control-id-theme-entity-loc-num-cnt  = 0
;;        with null-control-id-theme-entity-loc-num      = '()
;;        for obj being the hash-values of (parsed-class-parse-table 'parsed-theme-record)
;;        do (with-slots (record-status-active
;;                        control-id-theme-entity-loc-num
;;                        control-id-display-theme)
;;               obj
;;             (when  (null control-id-theme-entity-loc-num)
;;               (incf null-control-id-theme-entity-loc-num-cnt)
;;               (push  `(:control-id-display-theme ,control-id-display-theme
;;                          :record-status-active ,record-status-active)
;;                      null-control-id-theme-entity-loc-num)))
;;             finally (return (values null-control-id-theme-entity-loc-num null-control-id-theme-entity-loc-num)))

;; return the number of 'parsed-theme-record instances that are currently active in the dbc system:
;; (loop 
;;   for obj-id being the hash-keys of (parsed-class-parse-table 'parsed-theme-record) using (hash-value obj)
;;   for theme = (control-id-display-theme obj)
;;   for active = (record-status-active obj)
;;   when active
;;   collect theme)
;; ;; => 2041

;; inactive themes with an loc number 4435
;; (loop 
;;   with innactive-loc-themes-count = 0
;;   for obj being the hash-values of (parsed-class-parse-table 'parsed-theme-record)
;;   do (with-slots (record-status-active
;;                   control-id-theme-entity-loc-num
;;                   );control-id-display-theme)
;;          obj
;;        (when (and (null record-status-active)
;;                   control-id-theme-entity-loc-num)
;;          (incf  innactive-loc-themes-count)))
;;   finally (return  innactive-loc-themes-count))

;; active themes without an loc number 69
;; (loop 
;;   with active-no-loc-themes-count = 0
;;   with active-no-loc-themes = '()
;;   for obj being the hash-values of (parsed-class-parse-table 'parsed-theme-record)
;;   do (with-slots (record-status-active
;;                   control-id-theme-entity-loc-num
;;                   control-id-display-theme
;;                   control-id-theme-entity-dbc-num
;;                   image-coref)
;;          obj
;;        (when (and record-status-active
;;                   (null control-id-theme-entity-loc-num))
;;          (incf  active-no-loc-themes-count)
;;          (push (list control-id-theme-entity-dbc-num control-id-display-theme image-coref) active-no-loc-themes)))
;;   finally (return (values active-no-loc-themes active-no-loc-themes-count )))


#|

:NOTE despite what the tgm1.xml DTD says to the contrary currently, the
followinhg slots when non-nil have a list-length of 1:
`facet-note', `history-note', `scope-note', `cataloger-note',
`theme-type-category-reference', `theme-type-category-reference',
`theme-type-category-subdivision', `theme-type-category-genre',
`former-usage-note', `use-theme',

IOW, we can currently effectively say that for all instance parsed, each of the
above slots are of type (or (string null)) and we don't need to pack them into a
list structure.

Only slot-value of following slots will be lists of length larger than 1 containing strings.
`used-for', `broader-theme', `narrower-theme',`related-theme'

; use-theme
(tgm-parse-concept-count-slot-value-list-length 'use-theme :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

; facet-note
(tgm-parse-concept-count-slot-value-list-length 'facet-note :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

; history-note
(tgm-parse-concept-count-slot-value-list-length 'history-note :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

; scope-note
(tgm-parse-concept-count-slot-value-list-length 'scope-note :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

; cataloger-note
(tgm-parse-concept-count-slot-value-list-length 'cataloger-note :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

; theme-type-category-reference
(tgm-parse-concept-count-slot-value-list-length 'THEME-TYPE-CATEGORY-REFERENCE :hash-table *parsed-tgm-theme-record-hash-table*) -> hil

; theme-type-category-subdivision
(tgm-parse-concept-count-slot-value-list-length 'theme-type-category-subdivision :hash-table *parsed-tgm-theme-record-hash-table*)

;theme-type-category-subject
(tgm-parse-concept-count-slot-value-list-length 'theme-type-category-subject :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

; theme-type-category-genre
(tgm-parse-concept-count-slot-value-list-length 'theme-type-category-genre :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

; former-usage-note
(tgm-parse-concept-count-slot-value-list-length 'former-usage-note :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

; used-for
(tgm-parse-concept-count-slot-value-list-length 'used-for :hash-table *parsed-tgm-theme-record-hash-table*) -> 1430, longest 11

; broader-theme
(tgm-parse-concept-count-slot-value-list-length 'broader-theme :hash-table *parsed-tgm-theme-record-hash-table*) -> 350, 3

; narrower-theme
(tgm-parse-concept-count-slot-value-list-length 'narrower-theme :hash-table *parsed-tgm-theme-record-hash-table*) 
 -> 883, 148 "Activities", 143 "People", 138 "Equipment", 94 "Objects", 88
    "Communication", 78 "Events", 74 "Interiors", 70 "Concepts",
     66 "Mental states", 63 "Photographs" ...

; narrower-theme
(tgm-parse-concept-count-slot-value-list-length 'related-theme :hash-table *parsed-tgm-theme-record-hash-table*)
  ->  3236,  43 "Religion", 40 "Sports", 38 "War", 35 "Human body" ... 

|#

       
;;; ==============================
;;; EOF
