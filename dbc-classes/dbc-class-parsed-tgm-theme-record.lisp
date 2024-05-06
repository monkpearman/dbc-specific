;;; :FILE-CREATED <Timestamp: #{2024-05-02T19:42:09-04:00Z}#{24184} - by MON KEY>
;;; :FILE $DEVHOME/dbc-specific/dbc-classes/dbc-class-parsed-tgm-theme-record.lisp
;;; ==============================


#| 

Notes regarding conversion and transformation of LOC TGM files updated quarterly
as posted at following URLs:

https://www.loc.gov/rr/print/tgm1/tgm1.txt
https://www.loc.gov/rr/print/tgm1/tgm1.xml
https://www.loc.gov/rr/print/tgm2/tgm2.txt
https://www.loc.gov/rr/print/tgm2/tgm2.xml

https://www.loc.gov/rr/print/tgm1/downloadtgm1.html
https://www.loc.gov/pictures/collection/tgm/fields.html
https://www.loc.gov/rr/print/tgm1/ic.html

First things first, we need to set the correct coding system for the tgm.txt
and/or tgm1.xml files the xml file has encoding="ISO-8859-1" so we will assume
the same is true for the .txt version.  so for example we get "A la poupée
prints" instead of "A la poup�e prints" or "LATIN SMALL LETTER E WITH ACUTE"

`buffer-file-coding-system' `set-buffer-file-coding-system'
`find-file-literally' `coding-system-for-write' `coding-system-for-write'
`detect-coding-region'



;;; ==============================
:NOTE Our last known TGM conversion lives here:

#P"$DEFHOME/CL-MON-CODE/dbc-specific/xml-class-dump-dir/parsed-xml-records/parsed-xml-theme-records/theme-records-2012-03-20T202042.lisp"

;;; ==============================

The atest TGM file we will work from:

#P"$DEVHOME/CL-MON-CODE/dbc-specific/notes-versioned/tgm-conversion-elisp-notes/TGM-Conversion-03-25-24/tgm1_SCRATCH.xml"

;;; ==============================

:TODO once the parser is finalized, need to walk through lists for each of the
theme naming slots ofclass `parsed-tgm-theme-record' and make a key/val pairs
plist/alist/hash of the form:

 <CONTROL-ID-DISPLAY-THEME> . <UUID>

This will apply to slots:
`USED-FOR', `BROADER-THEME',`NARROWER-THEME',`RELATED-THEME', and possibly `USE-THEME'.

It may be that a bi-directional linking structure of some sort is more
applicable than simply adding key/val pairs to a standard CL sequence, but that
needs additional thought and is currently TBD.

Likewise, need to figure out the scheme for storing UUID's for each instance of
`parsed-tgm-theme-record'. we can store this in a separate lookup hashtable
where each theme has the same form as above, eg:

 <CONTROL-ID-DISPLAY-THEME> . <UUID>

Or, we can store the UUID in the object itself and walk the hash-table storing
our `parsed-tgm-theme-record' instances.l


;;; ==============================
CXML source:
:SEE (URL "https://github.com/sharplispers/cxml")

CXML documentation:
:SEE (URL "https://cxml.common-lisp.dev/")

Klacks documentation:
:SEE (URL "https://cxml.common-lisp.dev/klacks.html")

;;; ==============================

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
    ("__IGNORED-6"     . control-id-theme-entity-dbc-num))
  )

;; (make-parsed-class-field-slot-accessor-mapping 'parsed-tgm-theme-record *parsed-tgm-theme-field-to-accessor-table*)


;; :TODO We need to rename this to something more descriptive.  We should also
;; probably make this a :SYNCHRONIZED t hash-table for concurrent access.
;; :NOTE The current TGM file contains 13203 concepts.
;; :TODO Rename *tgm-hash-table* or whatevert is appropriate to match with the
;; rest of the dbc-specific-transfer hash-table variables.

;; (setq *parsed-tgm-theme-record-hash-table* (make-hash-table :size 13203 :test #'equal :synchronized t))

(defparameter *parsed-tgm-theme-record-hash-table*
              #-sbcl(make-hash-table :test #'equal :synchronized t)
              #+sbcl(make-hash-table :size (MON:PRIME-OR-NEXT-GREATEST 13202) :test #'equal :synchronized t))

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


;;; ==============================
;; :NOTE Not to be confused with class `parsed-theme-record' which references
;; themes recorded to the orginal dbc SQL table.
;; :TODO currently we don't set initforms for some slots:
;; `control-id-display-theme',`non-descriptor',
;; `use-theme', `control-id-theme-entity-tgm-2-former-num',
;; `control-id-theme-entity-tgm-1-former-num',`control-id-theme-entity-loc-num'
;; Once we finalize the XML file parse and all object instance are in a
;; hash-table, (The current TGM file contains 13203 concepts) we need to walk
;; back over these slots ands set them to NIL and not leave them unbound.
;; However, we leave them that way initially so that we can identify when a 
;; concept was parsed incorrectly.
(defclass parsed-tgm-theme-record () ;; (parsed-class)
  ((control-id-display-theme ;; congruent with slot in class `parsed-theme-record'
    :initarg :control-id-display-theme
    :accessor control-id-display-theme
    :documentation #.(classdoc 'parsed-tgm-theme-record :control-id-display-theme))
   (non-descriptor
    :initarg :non-descriptor
    :accessor non-descriptor
    :documentation #.(classdoc 'parsed-tgm-theme-record :non-descriptor))
   (use-theme
    :initarg :use-theme
    ;; :initform '() ; don't default when used it's a string.
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
    ;; :initform ;; don't default
    :accessor control-id-theme-entity-tgm-2-former-num
    :documentation #.(classdoc 'parsed-tgm-theme-record :control-id-theme-entity-tgm-2-former-num))
   (control-id-theme-entity-tgm-1-former-num
    :initarg :control-id-theme-entity-tgm-1-former-num
    ;; :initform ;; don't default
    :accessor control-id-theme-entity-tgm-1-former-num
    :documentation #.(classdoc 'parsed-tgm-theme-record :control-id-theme-entity-tgm-1-former-num))
   (control-id-theme-entity-loc-num ;; congruent with slot in class `parsed-theme-record'
    :initarg :control-id-theme-entity-loc-num
    :accessor control-id-theme-entity-loc-num
    :documentation #.(classdoc 'parsed-tgm-theme-record :control-id-theme-entity-loc-num))
   ;; :NOTE Not included in xml/txt file we are parsing, but it is usefull to include this now.
   (control-id-theme-entity-loc-uri ;; congruent with slot in class `parsed-theme-record'
    :initarg :control-id-theme-entity-loc-uri
    :initform '()
    :accessor control-id-theme-entity-loc-uri
    :documentation #.(classdoc 'parsed-tgm-theme-record :control-id-theme-entity-loc-uri))
   (image-coref
    :initarg       :image-coref
    :initform      '()
    :accessor      image-coref
    :documentation #.(classdoc 'parsed-tgm-theme-record :image-coref))
   (image-default-xref
    :initarg      :image-default-xref
    :initform     '()
    :accessor     image-default-xref
    :documentation #.(classdoc 'parsed-tgm-theme-record :image-default-xref))
   (record-status-active
    :initarg      :record-status-active
    :initform     '()
    :accessor      record-status-active
    :documentation #.(classdoc 'parsed-tgm-theme-record :record-status-active))
   (edit-timestamp
    :initarg       :edit-timestamp
    :initform      '()
    :accessor       edit-timestamp
    :documentation #.(classdoc 'parsed-tgm-theme-record :edit-timestamp))
   ;; Following has slot-value's in parsed-tgm-theme-record that are unused
   ;; elswhere in the system AFAIK.  ought to be named :CONTROL-ID-THEME-ENTITY-DBC-NUM
   ;; to indicate it references an internal DBC number and not an external
   ;; identity that dereferences to something.
   (control-id-theme-entity-dbc-num
    :initarg        :control-id-theme-entity-dbc-num
    :initform      '()
    :accessor      control-id-theme-entity-dbc-num
    :documentation #.(classdoc 'parsed-tgm-theme-record :control-id-theme-entity-dbc-num)))
  (:documentation #.(classdoc 'parsed-tgm-theme-record :class-doc)))


;; (tgm-assoc-elt "DESCRIPTOR")
(defun tgm-assoc-elt (elt &key (mapping *parsed-tgm-theme-field-to-accessor-table*))
  ;; :NOTE we probably don't need to allow for NIL and could constrain to `cl:strinp' only, 
  ;; but `tgm-assoc-elt' is used in macrology inside
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
                         ;; events that contain XML escaped characters "&apos;"
                         ;; , "&amp;" eg:
                         ;; <FUN>Formerly TGMI term (nonpostable) &amp; TGMII term (nonpostable).</FUN>
                         ;; and <RT>Farmers&apos; groups</RT>
                         ;; we assume here than any characters encountered in
                         ;; the element don't satisfy `tgm-characters-every-whitespace-p' 
                         (list nil (KLACKS:CONSUME-CHARACTERS stream))
                       (tgm-consume :stream stream))))
         (slot-val     (nth nth-val consumed)))
    (if (slot-boundp object accessor) ;; we leave certain slots unbound as these should always default to a string
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


;; 
;; klacks:peek returns as values:
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
    ;; (case (setf case-key (tgm-peeking-get-val  :nth-val 0 :stream stream))
    (ecase (setf case-key (tgm-peeking-get-val  :nth-val 0 :stream stream))
      (:start-document 
       (KLACKS:FIND-ELEMENT stream  "CONCEPT"))
      (:processing-instruction ;; , target, data
       (KLACKS:FIND-ELEMENT stream  "CONCEPT"))
      (:dtd ;; , name, public-id, system-id
       (KLACKS:FIND-ELEMENT stream  "CONCEPT"))
      (:comment
       (klacks:consume stream))
      (:end-element
       ;; (if (equal (nth 2 (tgm-peeking :stream stream)) "CONCEPT")
       ;;     (values nil (tgm-consume :stream stream) object "END CONCEPT")
       ;;     (values case-key (tgm-consume :stream stream) object))
       (if (equal (nth 2 (tgm-peeking :stream stream)) "CONCEPT")
           (progn (tgm-consume :stream stream) nil )
           (progn (tgm-consume :stream stream) case-key)))
      (:characters
       ;; (if (tgm-characters-every-whitespace-p :stream stream)
       ;;     (values case-key (tgm-consume :stream stream) object)
       ;;     ;; we need to set the slot value if we aren't looking at whitespace. can this happen?
       ;;     (values case-key (tgm-peeking :stream stream) object ))
       (if (tgm-characters-every-whitespace-p :stream stream)
           (progn (tgm-consume :stream stream) case-key )
           ;; we need to set the slot value if we aren't looking at whitespace. can this happen?
           (progn (tgm-peeking :stream stream) case-key)))
      (:end-document
       ;; (values nil peek-val object)
       nil)
      (:start-element
       (setq peek-val (tgm-peeking-get-val :nth-val 2 :stream stream))
       (let ((mapping '("USE" "Facet" "SN" "UF" "BT" "NT" "RT"   
                        "CN" "HN" "FUN" "TTCRef" "TTCSubd" "TTCSubj"
                        "TTCForm"  "FCNgmgpc"  "FCNlctgm" "TNR")))
         (cond
           ((equal "CONCEPT" peek-val) ;; (nth 1 '(:START-ELEMENT NIL "CONCEPT" "CONCEPT"))
            ;; (let ((consumed (tgm-consume :stream stream)))
            ;;    (values
            ;;     case-key
            ;;     peek-val
            ;;     consumed
            ;;     object))
            (progn 
              (tgm-consume :stream stream)
              case-key))
           ((equal "DESCRIPTOR" peek-val)
            ;; (tgm-assoc-elt "DESCRIPTOR")
            (%tgm-sec-helper object (tgm-assoc-elt peek-val) 1 (tgm-peeking :stream stream) stream))
            ;; :NOTE We put the `non-descriptor' slot value on `control-id-display-theme' slot value as well, because the
            ;; display name for a given theme is our key primary key for use with indexing data structures
            ;; that index and perform lookups on themes. The structure will likely be a hash-table.
            ((equal "NON-DESCRIPTOR" peek-val) ;; (tgm-assoc-elt "NON-DESCRIPTOR")
             ;; (values
             ;;  (%tgm-sec-helper object (tgm-assoc-elt peek-val) 1 (tgm-peeking :stream stream) stream)
             ;;  (setf (control-id-display-theme object) (non-descriptor object))))
             (progn
               (%tgm-sec-helper object (tgm-assoc-elt peek-val) 1 (tgm-peeking :stream stream) stream)
               (setf (control-id-display-theme object) (non-descriptor object))
               ))
            ((member peek-val mapping :test #'string=)
             (%tgm-sec-helper object (tgm-assoc-elt peek-val) 1 (tgm-peeking :stream stream) stream))
            ;; This shouldnt ever happen. print a message to standard
             ;; out, and return NIL. Doing so allows droping out of parsing loops. by callers
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

(defun tgm-parse-concepts-update-unbound-slots (&key (hash-table *parsed-tgm-theme-record-hash-table*))
  (let ((class-slots (MON:CLASS-SLOT-LIST 'parsed-tgm-theme-record)))
  (loop with ht = hash-table ;*parsed-tgm-theme-record-hash-table* ; hash-table
        for obj-id being the hash-keys in ht
        for obj being the hash-values in ht
        when (loop  with obj-inner = obj
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
        finally (return outer-count))))

;; (tgm-parse-concept :stream *parsed-tgm-theme-xml-source*)
;; (tgm-parse-concepts-in-stream :stream *parsed-tgm-theme-xml-source*)
;; (tgm-parse-concepts-in-stream  :stream  (tgm-parse-concepts-make-source))
;; (tgm-parse-concepts-make-source *parsed-tgm-theme-xml-source*)
(defun tgm-parse-concepts-in-stream (&key stream 
                                         (hash-table *parsed-tgm-theme-record-hash-table*)
                                         (clear-hash-p T))
  (when (and clear-hash-p (> (hash-table-count hash-table) 0))
    (clrhash hash-table))
  ;; (KLACKS:WITH-OPEN-SOURCE (s stream)
  (unwind-protect 
       (loop for read-obj = (tgm-parse-concept :stream stream)
             for set-hash = (when read-obj
                              (setf (gethash (control-id-display-theme read-obj) hash-table)
                                    read-obj))
             until (null read-obj)
             finally (return
                       (values
                        hash-table
                        (hash-table-count hash-table)
                        (tgm-parse-concepts-update-unbound-slots :hash-table hash-table))))
    (KLACKS:CLOSE-SOURCE stream)))


;; No longer wrapping around `write-parsed-class-parse-table-to-file' doing it by hand now.
;; :WAS (defun write-parsed-tgm-theme-record-parse-table-to-file (&key (hash-table *parsed-tgm-theme-record-hash-table*)
;;                                                                (base-output-directory (dbc::sub-path dbc::*parsed-class-table-output-dir*))
;;                                                                (output-sub-directory "parsed-tgm-theme-record"))
(defun write-parsed-tgm-theme-record-parse-table-to-file (&key
                                                          (hash-table *parsed-tgm-theme-record-hash-table*)
                                                          (base-output-directory (sub-path *parsed-tgm-theme-output-dir*))
                                                          (pathname-name "parsed-tgm-theme-record")
                                                          (pathname-type  *parsed-class-table-output-pathname-type*)
                                                          (timestamp-p t))
  (let*  ((pathname-stamped  (make-pathname :name (or (and timestamp-p (concatenate 'string pathname-name "-" (MON:TIMESTAMP-FOR-FILE)))
                                                      pathname-name)))
          (pathname-and-type (make-pathname :name (pathname-name pathname-stamped) :type pathname-type))
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
                          (and (hash-table-p  *parsed-tgm-theme-record-hash-table*)
                               (not (zerop (hash-table-count hash-table)))
                               *parsed-tgm-theme-record-hash-table*)
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
      (loop
        for obj being the hash-values of hash-table
        for frmt-cntl = (print-sax-parsed-slots-padding-format-control obj)
        do (print-sax-parsed-slots obj :stream fl :print-unbound nil :pre-padded-format-control frmt-cntl)
           (write-char #\Newline fl)
           (write-char #\Newline fl))
      (values
       full-path
       pathname-and-type
       hash-table))))

;; (tgm-parse-concept-count-slot-value-list-length 'broader-theme :hash-table *parsed-tgm-theme-record-hash-table*)
(defun tgm-parse-concept-count-slot-value-list-length (slot &key (hash-table *parsed-tgm-theme-record-hash-table*))
  (let ((rslt (loop 
                for obj-id being the hash-keys in hash-table
                for obj being the hash-values in hash-table
                for sv = (slot-value obj slot)
                for sv-len = (length sv)
                unless (or (null sv)
                           (= sv-len 1))
                collect (list sv-len obj-id sv) into gthr
                end
                finally (return gthr))))
    (if (null rslt)
        rslt
        (values 
         (setf rslt (stable-sort rslt
                     #'>
                     :key #'car))
         (length rslt)))))


;; 6900  :CONTROL-ID-THEME-ENTITY-DBC-NUM

;; (load-parsed-theme-record-default-file-to-parse-table  :key-accessor 'CONTROL-ID-DISPLAY-THEME )
;;  (parsed-class-parse-table 'parsed-theme-record)


;; (defparameter *tt--matching-themes-table* (make-hash-table :test #'equal))
;;
;; Following finds all parsed-theme-record's with control-id-display-theme id's that aren't in *parsed-tgm-theme-record-hash-table*.
;; (progn
;;   (loop 
;;    with hash-table-themes = (parsed-class-parse-table 'parsed-theme-record)
;;    with hash-table-tgm = *parsed-tgm-theme-record-hash-table*
;;    for theme-id being the hash-keys in hash-table-themes
;;    for theme-obj being the hash-values in hash-table-themes
;;     unless (gethash theme-id hash-table-tgm)
;;     do (setf (gethash theme-id *tt--matching-themes-table*) theme-obj))
;;   *tt--matching-themes-table*)

;; (clrhash *tt--matching-themes-table*)


#|


*parsed-tgm-theme-xml-source-pathname*
(tgm-parse-concepts-set-source-xml-file (merge-pathnames
                                        (dbc::sub-path dbc::*parsed-tgm-theme-input-dir*)
                                        (make-pathname :name "tgm1" :type "xml")))


(tgm-parse-concepts-make-source)

(tgm-parse-concept :stream *parsed-tgm-theme-xml-source*)

(tgm-parse-concepts-in-stream  :stream *parsed-tgm-theme-xml-source*)


(gethash "Accessories (Clothing & dress)" *parsed-tgm-theme-record-hash-table*)



;;; ==============================

;facet-note
(tgm-parse-concept-count-slot-value-list-length 'facet-note :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

;history-note
(tgm-parse-concept-count-slot-value-list-length 'history-note :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

;scope-note
(tgm-parse-concept-count-slot-value-list-length 'scope-note :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

cataloger-note
(tgm-parse-concept-count-slot-value-list-length 'cataloger-note :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

'term-type-category-reference
(tgm-parse-concept-count-slot-value-list-length 'TERM-TYPE-CATEGORY-REFERENCE :hash-table *parsed-tgm-theme-record-hash-table*) -> hil

; 'term-type-category-subdivision
(tgm-parse-concept-count-slot-value-list-length 'term-type-category-subdivision :hash-table *parsed-tgm-theme-record-hash-table*)

;term-type-category-subject
(tgm-parse-concept-count-slot-value-list-length 'term-type-category-subject :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

;'term-type-category-genre
(tgm-parse-concept-count-slot-value-list-length 'term-type-category-genre :hash-table *parsed-tgm-theme-record-hash-table*) -> nil

(tgm-parse-concept-count-slot-value-list-length 'former-usage-note :hash-table *parsed-tgm-theme-record-hash-table*) -> nil


(tgm-parse-concept-count-slot-value-list-length 'used-for :hash-table *parsed-tgm-theme-record-hash-table*) -> 1430, longest 11

(tgm-parse-concept-count-slot-value-list-length 'broader-theme :hash-table *parsed-tgm-theme-record-hash-table*) -> 350, 3

(tgm-parse-concept-count-slot-value-list-length 'narrower-theme :hash-table *parsed-tgm-theme-record-hash-table*) 
 -> 883, 148 "Activities", 143 "People", 138 "Equipment", 94 "Objects", 88
    "Communication", 78 "Events", 74 "Interiors", 70 "Concepts",
     66 "Mental states", 63 "Photographs" ...

(tgm-parse-concept-count-slot-value-list-length 'related-theme :hash-table *parsed-tgm-theme-record-hash-table*)
  ->  3236,  43 "Religion", 40 "Sports", 38 "War", 35 "Human body" ... 

|#

;;; ==============================
;;; EOF
