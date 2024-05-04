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

(detect-coding-region (region-beginning) (region-end) )

(find-coding-systems-region  (region-beginning) (region-end))

(utf-8 chinese-gb18030 utf-7 utf-16 utf-16be-with-signature utf-16le-with-signature utf-16be utf-16le compound-text-with-extensions compound-text iso-2022-7bit utf-8-auto utf-8-with-signature emacs-mule raw-text iso-2022-8bit-ss2 iso-2022-7bit-lock utf-8-hfs utf-7-imap utf-8-emacs prefer-utf-8 no-conversion ctext-no-compositions iso-2022-7bit-ss2)


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
;;; :NOTES REGARDDING the klacks interface we' use below:
;;
;; KLACKS:PEEK (source)
;; peek returns the current event's key and main values.
;; => :start-document
;; or => :start-document, version, encoding, standalonep
;; or => :dtd, name, public-id, system-id
;; or => :start-element, uri, lname, qname
;; or => :end-element, uri, lname, qname
;; or => :characters, data
;; or => :processing-instruction, target, data
;; or => :comment, data
;; or => :end-document, data
;; or => nil

;; KLACKS:PEEK-NEXT (source) => key, value*
;; Advance the source forward to the next event and returns it like peek would.

;; Function KLACKS:PEEK-VALUE (source) => value*
;; Like peek, but return only the values, not the key.

;; Function KLACKS:CONSUME (source) => key, value*
;; Return the same values peek would, and in addition advance the source forward to the next event.


;; Function KLACKS:CURRENT-LNAME (source) => string
;; Function KLACKS:CURRENT-QNAME (source) => string
;; If the current event is :start-element or :end-element, return the corresponding
;; value. Else, signal an error.

;; Function KLACKS:CURRENT-CHARACTERS (source) => string
;; If the current event is :characters, return the character data value. Else,
;; signal an error.

;; KLACKS:MAP-ATTRIBUTES (fn source)
;; Call FN for each attribute of the current start tag in turn, and pass the
;; following values as arguments to the function:
;;
;; - namespace uri
;; - local name
;; - qualified name
;; - attribute value
;; - a boolean indicating whether the attribute was specified explicitly in the
;;   source document, rather than defaulted from a DTD
;;
;; Only valid for :start-element.
;;
;; Return a list of SAX attribute structures for the current start tag. Only valid
;; for :start-element.

;; KLACKS:FIND-EVENT (source key)
;; Read events from source and discard them until an event of type key is
;; found. Return values like peek, or NIL if no such event was found.

;; KLACKS:FIND-ELEMENT (source &optional lname uri)
;; Read events from source and discard them until an event of type :start-element
;;is found with matching local name and namespace uri is found. If lname is nil,
;; any tag name matches. If uri is nil, any namespace matches. Return values like
;; peek or NIL if no such event was found.

;;; ==============================

|#



(in-package :dbc)

;; (tgm-parse-concepts-set-source-xml-file #P"$DEVHOME/CL-MON-CODE/dbc-specific/notes-versioned/tgm-conversion-elisp-notes/TGM-Conversion-03-25-24/tgm1_SCRATCH.xml")
;; (merge-pathnames 
;;  (make-pathname :directory '(:relative  "parsed-tgm-theme-record"))
;;  (merge-pathnames
;;   (make-pathname :directory '(:relative "parsed-class-table-dumps"))
;;   (dbc::sub-path dbc::*xml-output-dir*)))
;; (make-pathname :name "tgm1_SCRATCH" :type "xml")

 ;; (merge-pathnames
 ;;  (make-pathname :directory '(:relative "parsed-tgm-theme-record"))
 ;;  (sub-path *xml-output-dir*))


;; (system-subdir-init-w-var 
;;  '*parsed-tgm-theme-output-dir*
;;  :parent-path  (merge-pathnames
;;                (make-pathname :directory '(:relative "parsed-class-table-dumps"))
;;                (dbc::sub-path dbc::*xml-output-dir*)))


;; (sub-path *parsed-tgm-theme-output-dir*)
;; (class-of *parsed-tgm-theme-output-dir*)
;; (system-described *parsed-tgm-theme-output-dir* nil)
(defparameter *parsed-tgm-theme-output-dir* "parsed-tgm-theme-record")

(defparameter *parsed-tgm-theme-xml-source-pathname* nil
              "A pathname naming an XML file containing one or more TGM concepts which is suitable for use with `cxml:make-source'.
:SEE-ALSO `*parsed-tgm-theme-record-hash-table*', `*parsed-tgm-theme-field-to-accessor-table*'.~%▶▶▶")

(defparameter *parsed-tgm-theme-xml-source* nil
              "A variable for dereferencing to an object of type `cxml::cxml-source'.
Used when parsing TGM concepts. It's value is set with `tgm-parse-concepts-make-source'.~%
:EXAMPLE
 \(typep *parsed-tgm-theme-xml-source* 'cxml::cxml-source\)~%
:SEE-ALSO `*parsed-tgm-theme-xml-source-pathname*', `tgm-parse-concepts-set-source-xml-file', `tgm-parse-concepts-set-source-xml-file'.~%▶▶▶")

(defvar *parsed-tgm-theme-field-to-accessor-table*
  '(("DESCRIPTOR"      :CONTROL-ID-DISPLAY-THEME)
    ("NON-DESCRIPTOR"  :NON-DESCRIPTOR)
    ("USE"             :USE-THEME)
    ("Facet"           :FACET-NOTE)
    ("SN"              :SCOPE-NOTE)
    ("UF"              :USED-FOR)
    ("BT"              :BROADER-THEME)
    ("NT"              :NARROWER-THEME)
    ("RT"              :RELATED-THEME)
    ("CN"              :CATALOGER-NOTE)
    ("HN"              :HISTORY-NOTE)
    ("FUN"             :FORMER-USAGE-NOTE)
    ("TTCRef"          :TERM-TYPE-CATEGORY-REFERENCE)
    ("TTCSubd"         :TERM-TYPE-CATEGORY-SUBDIVISION)
    ("TTCSubj"         :TERM-TYPE-CATEGORY-SUBJECT)
    ("TTCForm"         :TERM-TYPE-CATEGORY-GENRE)
    ("FCNgmgpc"        :CONTROL-ID-THEME-ENTITY-TGM-2-FORMER-NUM)
    ("FCNlctgm"        :CONTROL-ID-THEME-ENTITY-TGM-1-FORMER-NUM)
    ("TNR"             :CONTROL-ID-THEME-ENTITY-LOC-NUM)
    ;; Following doesn't appear in the downloaded TGM XML file.
    ;; Including here for consistency w/r/t `make-parsed-class-field-slot-accessor-mapping'
    ;; in case we ever decide to tie into the parsed-class-foo methods
    ("__IGNORED-1"     :CONTROL-ID-THEME-ENTITY-LOC-URI)
    ("__IGNORED-2"     :IMAGE-COREF)
    ("__IGNORED-3"     :IMAGE-DEFAULT-XREF)
    ("__IGNORED-4"     :RECORD-STATUS-ACTIVE)
    ("__IGNORED-5"     :EDIT-TIMESTAMP)
    ("__IGNORED-6"     :CONTROL-ID-THEME-ENTITY-DBC-NUM)
    )
  "List mappiing TGM xml element names to slot-accessor names.
:SEE-ALSO `*parsed-tgm-theme-record-hash-table*',
`*parsed-class-field-slot-accessor-mapping-table*',
`*parsed-tgm-theme-xml-source-pathname*'.~%▶▶▶")

;; :TODO We need to rename this to something more descriptive.  We should also
;; probably make this a :SYNCHRONIZED t hash-table for concurrent access.
;; :NOTE The current TGM file contains 13203 concepts.
;; :TODO Rename *tgm-hash-table* or whatevert is appropriate to match with the
;; rest of the dbc-specific-transfer hash-table variables.

;; (setq *parsed-tgm-theme-record-hash-table* (make-hash-table :size 13203 :test #'equal :synchronized t))

(defparameter *parsed-tgm-theme-record-hash-table*
              #+sbcl(make-hash-table :size (MON:PRIME-OR-NEXT-GREATEST 13202) :test #'equal :synchronized t)
              #-sbcl(make-hash-table :test #'equal :synchronized t)
              
              "A hash-table for holding parsed TGM themes.
It's `hash-table-test'
It's `hash-table-size' is defaulted to 13203 which corresponds roughly to the
number of concepts defined by the TGM1 and TGM2 as of 05-01-2024.
On SBCL it satisfies `sb-ext:hash-table-synchronized-p'.~%
:EXAMPLE
 \(hash-table-test *parsed-tgm-theme-record-hash-table*\)~%
 \(hash-table-size *parsed-tgm-theme-record-hash-table*\)~%
 \(sb-ext:hash-table-synchronized-p *parsed-tgm-theme-record-hash-table*\)~%
:SEE-ALSO  `*parsed-tgm-theme-field-to-accessor-table*', `*parsed-tgm-theme-xml-source-pathname*'.~%▶▶▶")

(defun tgm-parse-concepts-set-source-xml-file (pathname)
  "Set value of `*parsed-tgm-theme-xml-source-pathname*' to PATHNAME.
:SEE-ALSO `tgm-parse-concepts-make-source'.~%▶▶▶"
  (setf *parsed-tgm-theme-xml-source-pathname*
       pathname))
        
(defun tgm-parse-concepts-make-source ()
  "Make an object of type 'cxml::cxml-source as if by `cxml:make-source' and set
it to value of `*parsed-tgm-theme-xml-source*' using pathname stored in  parameter
`*parsed-tgm-theme-xml-source-pathname*' and return the an instance of `cxml::cxml-source'.~%
When value of `*parsed-tgm-theme-xml-source*' satisfies the following form:
 (typep *parsed-tgm-theme-xml-source* 'cxml::cxml-source)
Close the existing source as if by `klacks:close-source' first before setting
Signal an error if value of `*parsed-tgm-theme-xml-source-pathname*' is null or does not satisfy `cl:pathnamep'.
:EXAMPLE
 \(progn \(tgm-parse-concepts-make-source\)
        \(typep  *parsed-tgm-theme-xml-source* 'cxml::cxml-source\)\)~%
:SEE-ALSO `tgm-parse-concepts-set-source-xml-file'.~%▶▶▶"
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
  (
   ;; congruent with slot in class `parsed-theme-record'
   (control-id-display-theme
    :initarg :control-id-display-theme
    :accessor control-id-display-theme
    :documentation "The printed representation of a TGM theme, eg it's display name.
 :NOTE The display name is the same whether the theme's non-descriptor is T or not.")

 (non-descriptor
  :initarg :non-descriptor
  :accessor non-descriptor
  :documentation "When non-nil \(a string value\) indicates that this theme is
not to be used for indexing purposes. Refer to the `USE-THEME' slot value for
the preferred theme to use instead.  :NOTE We assign the `non-descriptor'
slot-value to the `control-id-display-theme' as the string token for ALL
themes is used as the primary key for accessing structures which index themes,
ie hash-table/alist/plist key/val pairs.")

 (use-theme
  :initarg :use-theme
  ;; :initform '() ; don't default when used it's a string.
  :accessor use-theme
  :documentation "Original TGM value \"USE\".
This slot is non-nil \(a string value\) when slot-value of `non-descriptor' is non-nil.
the `use-theme' slot-value dentifies a TGM theme to use in preference to this
one and leads from a non-preferred, unauthorized form of a theme to the theme as used.")
 
 (used-for
  :initarg :used-for
  :initform '()
  :accessor used-for
  :documentation "Original TGM value \"UF\". Postable (Main Term) to nonpostable (UF).
used-for - indicates a non-preferred theme, such as an alternative spelling,
inverted form, or synonym; helps define a theme's meaning. The `used-for'
slot-value identifies a reciprocal relationship with themes with a non-nil
`use-theme' slot-value, ie the object instance for theme with `non-descriptor'
slot-value: \"70s\" and use-theme `slot-value' \"Nineteen seventies\" has a
reciprical relationship with the object instance for theme with
`control-id-display-theme' slot-value: \"Nineteen seventies\" and a
`used-for' slot-value: \"70s\"")
 
 (broader-theme
  :initarg :broader-theme
  :initform '()
  :accessor broader-theme
  :documentation "Original TGM value \"BT\".
broader-theme - indicates the more general class to which a theme belongs;
everything that is true of a theme is also true of its broader-theme. ")

 (narrower-theme
  :initarg :narrower-theme
  :initform '()
  :accessor narrower-theme
  :documentation "Original TGM value \"NT\".
narrower-theme - indicates a more specific term or member of a class.")

 (related-theme
  :initarg :related-theme
  :initform '()
  :accessor related-theme
  :documentation "Original TGM value \"RT\".
related-theme - brings to the catalog user's attention themes that are associated
because of overlapping meanings or part-whole relationships. TGM I tends to be
generous in supplying related-theme references. This is partly because
relationships that would be implicit in a hierarchical display of the themes are
less apparent when the themes appear in an alphabetical display. In accordance
with thesaurus construction guidelines, however, related-theme references are
never made to two themes at different levels in the same hierarchy.

:EXAMPLE       Game industry  NOT  Game industry
               RT  Games           RT  Games
                                   Board games   
                                  [a narrower term to Games]

An authorized theme which is closely related to the theme under which it is
listed, but the relationship is not a hierarchical one. The reciprocal is also
RT. Although no precise rules dictate when related term references should be
supplied, some typical situations include:

 Near synonyms
 Overlapping meanings
 Discipline and the object of study
 Persons and their occupations
 Products and industries
 Whole/part relationships

More detailed definitions and discussion of hierarchical and related term
relationships can be found in the ANSI standard.")

 (facet-note
  :initarg :facet-note
  :initform '()
  :accessor facet-note
  :documentation "Original TGM value \"FACET\". A Geographical faceting note.
facet-note indicators, which appear in brackets directly underneath authorized themes,
signal that a theme may be subdivided by geographic and/or nationality
designations.

:EXAMPLE  Military camps
          --[nationality]--[country or state]--[city]

These indicators have been included on a systematic basis with certain
categories of headings; with other types of headings, they are added as need
arises in P&P's cataloging. \(See Section III for further information about using
geographic, nationality, and other types of subdivisions.\)")

 (scope-note
  :initarg :scope-note
  :initform '()
  :accessor scope-note
  :documentation "Original TGM value \"SN\". Formerly \"Public Note\".
TGM I uses several kinds of notes to help catalogers apply themes consistently
and to help researchers find appropriate search themes.  

The `scope-note' slote-value defines a theme, explains its scope, or helps a user
understand the structure of the thesaurus.

:EXAMPLE   Bison
           PN     For the American buffalo. Search under BUFFALOES 
                  for buffaloes of the eastern hemisphere.
:NOTE This field was formerly named Public Note, but was changed to\"Scope
note\" as of 2007\).")

 (cataloger-note
  :initarg :cataloger-note
  :initform '()
  :accessor cataloger-note
  :documentation "Original TGM value \"CN\".
cataloger-note - guides indexers in selecting a theme; for thesaurus
maintenance, records other notes in which the theme appears and clarifies how to
use a theme or when to use it in conjunction with another theme \(\"double
indexing\"\).

:EXAMPLE  Sick bays
          CN     Double index under type of vessel.

The note \"TGM II theme,\" which occurs frequently throughout TGM I, refers to
themes which also appear in Thesaurus for Graphic Materials II: Genre and
Physical Characteristic Themes. \(See Section II.E. for guidance on application of
these themes.\)

:EXAMPLE  Stereographs
          CN     TGM II theme.

Notes beginning with the phrase \"Used in a note under ...\" are of value
primarily in editing and maintaining the thesaurus.

:EXAMPLE  Doves
          CN     Used in a note under SYMBOLS.")

 (history-note
  :initarg :history-note
  :initform '()
  :accessor history-note
  :documentation  "Original TGM value \"HN\".
The history note \(HN\) records the fact that a change has taken place in a theme
or the status of a theme since the publication of the first edition of TGM
I. This may prove useful to searchers since it suggests themes that may have been
in use formerly and that should be checked to retrieve older catalog
records. Generally, if one theme has been completely replaced by another theme,
the older theme appears as a \"UF.\"

A History note - accounts for earlier ways in which a theme appeared in the
list, in particular, themes that formerly appeared as non-preferred \(UF\) themes;
also, prompts the catalog user to search under earlier forms of headings, in
case headings in a catalog have not been updated to the current forms.

:EXAMPLE  Gem photographs: HN: Changed 5/89.  Formerly, Gem
          photographs may have been indexed as Miniature works.

:EXAMPLE  Draft 
          HN     Changed 11/1987 from COMPULSORY MILITARY SERVICE.")
 
 (term-type-category-reference
  :initarg :term-type-category-reference
  :initform '()
  :accessor term-type-category-reference
  :documentation "Original TGM value \"TTCRef\".
:EXAMPLE
   Reference \(MARC 150\)
:NOTE Field added to TGM data in 2007.")
 
 (term-type-category-subdivision
  :initarg :term-type-category-subdivision
  :initform '()
  :accessor term-type-category-subdivision
  :documentation "Original TGM value \"TTCSubd\". Subdivision (MARC 180+x/650+x).
:NOTE This filed ield added to TGM data in 2007.")
 
 (term-type-category-subject
  :initarg :term-type-category-subject
  :initform '()
  :accessor term-type-category-subject
  :documentation "Original TGM value \"TTCSubj\". Subject (MARC 150/650).
:NOTE This field added to TGM data in 2007.")
 
 (term-type-category-genre
  :initarg :term-type-category-genre
  :initform '()
  :accessor term-type-category-genre
  :documentation
  "Original TGM value \"TTCForm\". Genre/format \(MARC 155/655\).
The difference between genres and physical characteristics may be unclear, for
example, with themes like BROADSIDES, in which purpose is closely identified with
one physical manifestation. The form-genre field \(655\) is to be used for the
entire vocabulary.
:NOTE This field was added to TGM data in 2007.")

 ;; :NOTE Not included in xml/txt file we are parsing, but it is usefull to include this now.
 ;; corresponds to slot `control-id-theme-entity-loc-uri' in class `parsed-theme-record'.
 (former-usage-note
  :initarg :former-usage-note
  :initform '()
  :accessor former-usage-note
  :documentation "Original TGM value \"FUN\". Clarifies TGM I & TGM II past history.
:EXAMPLE
   Formerly TGMI term \(nonpostable\).
:NOTE Field added to TGM data in 2007.")
 
 ; control-id-theme-entity-tgm-2-former-num control-id-theme-entity-tgm-2-former-num
 (control-id-theme-entity-tgm-2-former-num
  :initarg :control-id-theme-entity-tgm-2-former-num
  ;; :initform ;; don't default
  :accessor control-id-theme-entity-tgm-2-former-num
  :documentation "Original TGM value \"FCNgmgpc\".
Former control number from TGM II in format gmgpc000001.
Applies only to terms established prior to 2007.
:NOTE This field added to TGM data in 2007.")

 (control-id-theme-entity-tgm-1-former-num
  :initarg :control-id-theme-entity-tgm-1-former-num
  ;; :initform ;; don't default
  :accessor control-id-theme-entity-tgm-1-former-num
  :documentation "Original TGM value \"FCNlctgm\".
Former control number from TGM I in format: lctgm000001.
Applies only to terms established prior to 2007.
:NOTE This field added to TGM data in 2007.")

 ;; congruent with slot in class `parsed-theme-record'
 (control-id-theme-entity-loc-num
  :initarg :control-id-theme-entity-loc-num
  :accessor control-id-theme-entity-loc-num
  :documentation "Original TGM value \"TNR\".
Control number for merged TGM \(new numbers assigned in 2007 in format: tgm000001\).
:NOTE This field added to TGM data in 2007.")

 ;; congruent with slot in class `parsed-theme-record'
 (control-id-theme-entity-loc-uri
  :initarg :control-id-theme-entity-loc-uri
  :initform '()
  :accessor control-id-theme-entity-loc-uri
  :documentation "A cannonical LOC TGM theme URI the form:

  <RESOURCE-PATH>/<CONTROL-ID-THEME-ENTITY-LOC-NUM>
 
 <RESOURCE-PATH> -> \"http://id.loc.gov/vocabulary/graphicMaterials/\";
 
  <CONTROL-ID-THEME-ENTITY-LOC-NUM> -> \"tgmNNNNNN\"

Potentially useful to grab LOC skos/rdf-xml data.")

 (image-coref
  :initarg       :image-coref
  :initform      '()
  :accessor      image-coref
  :documentation "List of parsed-theme-record `inventory-number' references \(strings\).
Field name from orignial dbc sql table was \"related_pic_num\".
When non-nil has the format:
 \(\"<ITEM-REF>\"* \)
Orignially, when non-nil, value of field `image-default-xref' would be present
as a member and `record-status-active' was T.
Orignially, when NIL, the value of `image-default-xref' was also NIL and value
of `record-status-active' was \"0000-00-00 00:00:00\".")

 (image-default-xref
     :initarg      :image-default-xref
     :initform     '()
     :accessor     image-default-xref
     :documentation "
Field name from orignial dbc sql table was \"display_pic\".
Nil if unassigned, else corresponds with inventory-number slot-value for
instance of class `parsed-inventory-record'. When non-nil value is also present
in list for slot `image-coref'.
Originally, when NIL, the value of `record-status-active' was also NIL and value
of `edit-timestamp'was be \"0000-00-00 00:00:00\".")
    
 (record-status-active
  :initarg      :record-status-active
  :initform     '()
  :accessor      record-status-active
  :documentation "
Field name from orignial dbc sql table was \"active\".
When T indicates the theme is active and mayb be made abvailable for end-user presentation.
When NIL indicates the theme is inactive and may not be made available for end-user presentations.
Originally, when NIL value of `image-default-xref' and `image-coref' were also
be NIL, and value of `edit-timestamp' was be \"0000-00-00 00:00:00\".
Originally, when T value of `image-default-xref' and `image-coref' contained item reference(s).")

 (edit-timestamp
  :initarg       :edit-timestamp
  :initform      '()
  :accessor       edit-timestamp
  :documentation "The date of the last date the theme was updated in the database.
Field name from orignial dbc sql table was \"date_edit\".

:EXAMPLE

  \"2008-09-20 22:33:51\"
  \"0000-00-00 00:00:00\"
  \"2008-09-20 22:30:25\" ; 7156

When present originally, this value indicates the last time the dbc database was
updated with relation data. When value was \"0000-00-00 00:00:00\" the
slot-values of `record-status-cative' `image-default-xref', `image-coref' were
be nil.")
    
 ;; Following has slot-value's in parsed-tgm-theme-record that are unused
 ;; elswhere in the system AFAIK.  ought to be named :CONTROL-ID-THEME-ENTITY-DBC-NUM
 ;; to indicate it references an internal DBC number and not an external
 ;; identity that dereferences to something.
 (control-id-theme-entity-dbc-num
  :initarg        :control-id-theme-entity-dbc-num
  :initform      '()
  :accessor      control-id-theme-entity-dbc-num
  :documentation "An integer value represented as a string identifying a TGM in the dbc database.
Field name from the orignial dbc SQL table was \"id\".
Originally, this was a unique integer (represented now as a string)
dereferncing a TGM theme in the dbd SQL database.

:NOTE We mretain the existing value because it appeared in the originally
database and currently shares a coreference with values from the `thems_fr`
table, which is as yet unparsed and xrefd.! IOW, don't delete or modify it's
value unless/until that occurs!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")

 )
  (:documentation
    #.(format nil
              "Class for parsed LOC TGM XML `themes'file.~%~@
The Thesaurus of Graphic Materials \(TGM\) I is a thesaurus in alphabetical
format. TGM I conforms to the ANSI standard for structure and
syntax. \"Postable\" themes \(themes that are authorized for indexing\) and
\"non-postable\" themes \(cross references pointing from unauthorized to
authorized themes\) are interfiled. Under each authorized theme, the reference
structure includes unauthorized themes \(UF\), broader themes \(BT\), narrower
themes \(NT\), and related themes \(RT\). For each relationship that is
established in the thesaurus, its reciprocal relationship can be found at
another point in the thesaurus.

:EXAMPLE
          Building dedications           (authorized theme)

           UF  Dedication of buildings   (theme not authorized)
           BT  Dedications               (broader authorized theme)
           NT  Church dedications        (narrower authorized themes)
               Cornerstone laying
           RT  Buildings                 (related authorized themes)
               Groundbreaking ceremonies
               Toppings out

         Dedication of buildings

          USE  Building dedications     (cross reference from unauthorized
                                         theme to authorized theme)

TGHM structure is intended to help both catalogers and researchers select the
theme\(s\) most appropriate for indexing and retrieval. Themes appear in
alphabetical order and are listed in word-by-word filing sequence. Scope notes
\(here called \"public notes\"\) define the themes in the context of the
thesaurus. Associations between themes are indicated by the convention of
broader, narrower, related, and \"used for\" relationships. Themes listed under
a heading also appear in the alphabetical filing sequence with the reciprocal
relationship noted. For example, the theme EPHEMERA has LABELS listed as a
narrower theme, and the theme LABELS has EPHEMERA listed as its broader theme.~%~@
:NOTE Compound themes are established \(1\) when a single concept is expressed
by multiple words in natural language, \(2\) when it would be difficult or
unnecessary for an indexer to differentiate between two closely related
concepts, and \(3\) when splitting them into single themes to be placed in
separate fields would lead to retrieval of irrelevant material.~%~@
:EXAMPLE
          Artificial flowers
          Cattle ranches
          Educational organizations
          Real estate development
          Tobacco industry~%~@
Compound themes are always expressed in natural language order, never inverted:~%~@
:EXAMPLE~%  Protestant churches  NOT   Churches, Protestant~%~@
Compound themes which include the word \"and\" are used when two themes occur
together with such frequency that it would be undesirable to establish them
separately. Such themes are constructed with an ampersand \(&\) in order to
differentiate in retrieval systems between the use of \"and\" as a Boolean
operator and the use of \"&\" as part of an indexing theme:~%~@
:EXAMPLE
         Doors & doorways
         Good & evil~%~@
:NOTE Parenthetical qualifiers are used to differentiate between homographs.~%~@
:EXAMPLE  Camouflage \(Biology\)
          Camouflage \(Military science\)~%~@
:SEE \(URL \"https://www.loc.gov/rr/print/tgm1/tgm1.xml\"\)
     \(URL \"https://www.loc.gov/rr/print/tgm2/tgm2.xml\"\)
     \(URL \"https://www.loc.gov/rr/print/tgm1/downloadtgm1.html\"\)
     \(URL \"https://www.loc.gov/pictures/collection/tgm/fields.html\"\)
     \(URL \"https://www.loc.gov/rr/print/tgm1/ic.html\"\)~%~@
:NOTE Not to be confused with class `parsed-theme-record' which references
themes recorded to the orginal dbc SQL table!~%~@
:SEE-ALSO `parsed-theme-record', `theme-entity',
`dbc-theme-request-loc-x-uri',`tgm-assoc-elt',`tgm-peeking',
`tgm-peeking-get-val', `tgm-consume', `tgm-characters-every-whitespace-p',
`tgm-peek-start-element-and-maybe-add-to-slot', `tgm-parse-concept',
`parsed-tgm-theme-record', `*parsed-tgm-theme-field-to-accessor-table*'.~%▶▶▶")))



;;(tgm-assoc-elt 5)
(defun tgm-assoc-elt (elt &key (mapping *parsed-tgm-theme-field-to-accessor-table*))
  "Find ELT in MAPPING and return it.
ELT should satisfy cl:stringp, signal an error if not.
MAPPING designates an alist identifying xml :start-element qname/lames as per `klacks:peek'.
MAPPING alist has the from
 (<STRING> :<KEYWORD>)
<STRING> denotes an xml element name
:<KEYWORD> names an associated keyword to use as an initarg for a
parsed-tgm-theme-record slot accessor.
:SEE-ALSO `tgm-assoc-elt',`tgm-peeking', `tgm-peeking-get-val',
`tgm-consume', `tgm-characters-every-whitespace-p',
`tgm-peek-start-element-and-maybe-add-to-slot',
`tgm-parse-concept', `parsed-tgm-theme-record',
`*parsed-tgm-theme-field-to-accessor-table*'.~%▶▶▶"
  (unless (stringp elt)
    (MON:SIMPLE-ERROR-MON :w-sym 'tgm-assoc-elt
                          :w-type 'function
                          :w-spec "expected a string for arg ELT"
                          :w-got elt :w-type-of t))
  (let ((maybe-match (assoc elt mapping :test #'equal)))
    (and maybe-match (cadr maybe-match))))

;; Temporary helper function hardwired to stream `*parsed-tgm-theme-xml-source*'. for debugging.
(defun %qpeek ()
  (multiple-value-bind (v1 v2 v3 v4)
      (KLACKS:PEEK *parsed-tgm-theme-xml-source*)
    (list v1 v2 v3 v4)))

(defun tgm-peeking (&key stream)
  "mvb'd wrapper for `klacks:peek'. STREAM names a klacks source.
:SEE-ALSO`tgm-assoc-elt',`tgm-peeking', `tgm-peeking-get-val',
`tgm-consume', `tgm-characters-every-whitespace-p',
`tgm-peek-start-element-and-maybe-add-to-slot',
`tgm-parse-concept', `parsed-tgm-theme-record',
`*parsed-tgm-theme-field-to-accessor-table*'.~%▶▶▶"
  (multiple-value-bind (v1 v2 v3 v4)
      (KLACKS:PEEK stream)
    (list v1 v2 v3 v4)))

(defun tgm-peeking-get-val (&key (nth-val 1) stream)
  "Return cl:nth value of mvb'd values list returned by `tgm-peeking'.
:SEE-ALSO `tgm-assoc-elt',`tgm-peeking', `tgm-peeking-get-val',
`tgm-consume', `tgm-characters-every-whitespace-p',
`tgm-peek-start-element-and-maybe-add-to-slot',
`tgm-parse-concept', `parsed-tgm-theme-record',
`*parsed-tgm-theme-field-to-accessor-table*'.~%▶▶▶"
  (nth nth-val (tgm-peeking :stream stream)))

(defun tgm-consume (&key stream)
  "An mvb'd wrapper for `klacks:consume'. STREAM names a klacks source.
:SEE-ALSO`tgm-assoc-elt',`tgm-peeking', `tgm-peeking-get-val',
`tgm-consume', `tgm-characters-every-whitespace-p',
`tgm-peek-start-element-and-maybe-add-to-slot',
`tgm-parse-concept', `parsed-tgm-theme-record',
`*parsed-tgm-theme-field-to-accessor-table*'.~%▶▶▶"
  (multiple-value-bind (v1 v2 v3 v4)
      (KLACKS:CONSUME stream)
    (list v1 v2 v3 v4)))

;; (tgm-characters-every-whitespace-p :stream *tt--tgm*)
(defun tgm-characters-every-whitespace-p (&key stream)
"Return T when length of current nth 1 elt of `tgm-peeking' return value is a
with length <= 2 and every character satisfies `mon:whitespace-char-p'.
:SEE-ALSO `mon:*whitespace-chars*', `tgm-assoc-elt',`tgm-peeking',
`tgm-peeking-get-val', `tgm-consume', `tgm-characters-every-whitespace-p',
`tgm-peek-start-element-and-maybe-add-to-slot', `tgm-parse-concept',
`parsed-tgm-theme-record',`*parsed-tgm-theme-field-to-accessor-table*'.~%▶▶▶"
  (let (;(peek-chars (tgm-peeking :stream stream))
         (v2 (tgm-peeking-get-val :nth-val 1 :stream stream)))
    (and (or (stringp v2)
             (error (format nil ":FUNCTION `tgm-characters-every-whitespace-p' - expected a string ~%:GOT ~S" v2)))
         (<= (length v2) 2)
         (every #'MON:WHITESPACE-CHAR-P v2))))

(defun tgm-start-element-consume (&key object accessor (nth-val 1) peek-val stream)
  "Parse and consume the current XML element being read from STREAM.
OBJECT is an instance of class `parsed-tgm-theme-record' 
ACCESSOR names a slot-value accessor for OBJECT. Used to update OBJECT according
to XML element values encountered during parse.
NTH-VALUE is an positive integer for referencing a list of parse-values as per dbc-tgm-
passed by calling functions. Default is 1, Usefull 
PEEK-VAL is an mvb'd list as per return value of `tgm-peeking'. 
:SEE-ALSO `tgm-assoc-elt',`tgm-peeking', `tgm-peeking-get-val',
`tgm-consume', `tgm-characters-every-whitespace-p',
`tgm-peek-start-element-and-maybe-add-to-slot',
`tgm-parse-concept', `parsed-tgm-theme-record'.~%▶▶▶"
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
               ;; (format t "Pushing SLOT-VALUE: ~S~%With Accessor: ~S~%" slot-val accessor)
               (push slot-val (slot-value object accessor)))
              ((stringp (slot-value object accessor))
               ;; (format t "Setf'ing SLOT-VALUE: ~S~%With Accessor: ~S~%" slot-val accessor)
               (setf (slot-value object accessor) slot-val)))
      ;; (progn (format t
      ;;         "Slot unbound setfing SLOT-VALUE: ~S~%With slot Accessor: ~S~%" slot-val accessor)
      ;;         (eval `(setf (,accessor ,object) ,slot-val))))
      (eval `(setf (,accessor ,object) ,slot-val)))
    (values
       (slot-value object accessor)
       peek-val
       consumed
       object)))


;; (let ((obj (make-instance 'parsed-tgm-theme-record
;;                           :control-id-display-theme-name "FOO"))
;;       (acc 'control-id-display-theme-name)
;;       (nth 1)
;;       (pk-val  nil) 
;;       (str *tt--tgm*))
;;   (macroexpand-1  '(def-tgm-start-element-consume obj acc nth pk-val str)))
(defmacro %tgm-sec-helper (object accessor nth-val peek-val stream)
  "Helper macro wrapping around `tgm-start-element-consume' for use with `tgm-peek-start-element-and-maybe-add-to-slot'.~%
:EXAMPLE~%\(macroexpand-1 '\(%tgm-sec-helper
                 \(make-instance 'parsed-tgm-theme-record :control-id-display-theme-name \"FOO\"\)
                 'control-id-display-theme-name 1 \(tgm-peeking :stream *tt--tgm*\) *tt--tgm*\)\)~%
:SEE-ALSO ~%▶▶▶"
  `(tgm-start-element-consume :object   ,object
                            :accessor ,accessor
                            :nth-val  ,nth-val
                            :peek-val ,peek-val ;(or peek-val (tgm-peeking :stream stream))
                            :stream   ,stream))


(defun tgm-peek-start-element-and-maybe-add-to-slot (object &key stream)
  "A dispatching function for tgm XML parses. Pivot on start-element values
according to the key/value pairs mapped by variable
`*parsed-tgm-theme-field-to-accessor-table*'.
:SEE-ALSO `tgm-assoc-elt',`tgm-peeking', `tgm-peeking-get-val',
`tgm-consume', `tgm-characters-every-whitespace-p',
`tgm-peek-start-element-and-maybe-add-to-slot',
`tgm-parse-concept', `parsed-tgm-theme-record'.~%▶▶▶"
  (let (;; (object (make-instance 'parsed-tgm-theme-record))
        ;; (mapping *parsed-tgm-theme-field-to-accessor-table*)
          (peek-val)
          (case-key ))
      (case (setf case-key (tgm-peeking-get-val  :nth-val 0 :stream stream))
        (:start-document 
         (KLACKS:FIND-ELEMENT stream  "CONCEPT"))
        (:start-element
           (setq peek-val (tgm-peeking-get-val :nth-val 2 :stream stream))
           (cond
            ((equal "CONCEPT" peek-val) ;; (nth 1 '(:START-ELEMENT NIL "CONCEPT" "CONCEPT"))
             (let ((consumed (tgm-consume :stream stream)))
               (values
                case-key
                peek-val
                consumed
                object)))
            ;; :NOTE We put the `non-descriptor' slot value on
            ;; `control-id-display-theme' slot value as well, because the
            ;; display name for a given theme is our key primary key for use
            ;; with indexing data structures that index and perform lookups on
            ;; themese. The structure will likely be a hash-table.
            ((or (equal "DESCRIPTOR" peek-val)
                 (equal "NON-DESCRIPTOR" peek-val))
             (values
              ;;
              ;; (%tgm-sec-helper object 'control-id-display-theme 1 (tgm-peeking :stream stream) stream)
               (tgm-start-element-consume
               :object object
               :accessor 'control-id-display-theme
               :nth-val 1
               :peek-val (tgm-peeking :stream stream)
               :stream stream)
               (setf (non-descriptor object)
                    (control-id-display-theme object))))
            ;; ((EQUAL "NON-DESCRIPTOR")
            ((equal "USE"   peek-val)
             (tgm-start-element-consume
              :object object
              :accessor 'use-theme
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream)) 
            ((equal "Facet" peek-val) ; facet-note
             (tgm-start-element-consume
              :object object
              :accessor 'facet-note
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream)) 
            ((equal "SN"    peek-val) ; scope-note
             (tgm-start-element-consume
              :object object
              :accessor 'scope-note
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream)) 
            ((equal "UF"    peek-val) ; used-for
             (tgm-start-element-consume
              :object object
              :accessor 'used-for
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream)             ) 
            ((equal "BT"    peek-val) ; broader-theme
             (tgm-start-element-consume
              :object object
              :accessor 'broader-theme
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream)) 
            ((equal "NT"    peek-val) ; narrower-theme
             (tgm-start-element-consume
              :object object
              :accessor 'narrower-theme
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream)) 
            ((equal "RT"    peek-val) ; related-theme
             (tgm-start-element-consume
              :object object
              :accessor 'related-theme
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream)) 
            ((equal "CN"    peek-val)   ; cataloger-note
             (tgm-start-element-consume
              :object object
              :accessor 'cataloger-note
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream)) 
            ((EQUAL "HN"    peek-val) ; history-note
             (tgm-start-element-consume
              :object object
              :accessor 'history-note
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream)) 
            ((equal "FUN"      peek-val) ; former-usage-note
             (tgm-start-element-consume
              :object object
              :accessor 'former-usage-note
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream))
            ((EQUAL "TTCRef" peek-val) ;term-type-category-reference
             (tgm-start-element-consume
              :object object
              :accessor 'term-type-category-reference
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream))
            ((equal "TTCSubd" peek-val) ;term-type-category-subdivision
             (tgm-start-element-consume
              :object object
              :accessor 'term-type-category-subdivision
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream))
            ((equal "TTCSubj"   peek-val) ;term-type-category-subject
             (tgm-start-element-consume
              :object object
              :accessor 'term-type-category-subject
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream))
            ((equal "TTCForm" peek-val) ; term-type-category-genre
             (tgm-start-element-consume
              :object object
              :accessor 'term-type-category-genre
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream))
            ((equal "FCNgmgpc" peek-val) ; control-id-theme-entity-tgm-2-former-num
             (tgm-start-element-consume
              :object object
              :accessor 'control-id-theme-entity-tgm-2-former-num
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream))
            ((equal "FCNlctgm" peek-val)  ; control-id-theme-entity-tgm-1-former-num
             (tgm-start-element-consume
              :object object
              :accessor 'control-id-theme-entity-tgm-1-former-num
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream))
            ((equal "TNR" peek-val) ;; control-id-theme-entity-loc-num
             (tgm-start-element-consume
              :object object
              :accessor 'control-id-theme-entity-loc-num
              :nth-val 1
              :peek-val (tgm-peeking :stream stream)
              :stream stream)) 
            ;; This shouldnt ever happen. print a message to standard
            ;; out, and return NIL. Doing so allows droping out of parsing loops. by callers
            (t (format t (concatenate 'string  "~%!!!!!!!!!!~%:FUNCTION `tgm-peek-start-element-and-maybe-add-to-slot'~%"
                       "           -- When parsing a :START-ELEMENT event, case forms failed to trigger correctly.~%!!!!!!!!!!~%"))
               nil )))
        (:end-element
           ;; (KLACKS:FIND-EVENT stream :start-element)
           ;; :TODO when the current event is  :end-element and lname is "CONCEPT" we need to start a new object
           ;; :END-ELEMENT nil "CONCEPT"
            (if (equal (nth 2 (tgm-peeking :stream stream)) "CONCEPT")
                (values nil (tgm-consume :stream stream) object "END CONCEPT")
              (values case-key (tgm-consume :stream stream) object)))
        (:characters
           (if (tgm-characters-every-whitespace-p :stream stream)
               (values case-key (tgm-consume :stream stream) object )
             ;; we need to set the slot value if we aren't looking at whitespace. can this happen?
             (values case-key (tgm-peeking :stream stream) object )))
        (:comment
         ;; (values case-key peek-val object)
         (values nil peek-val object))
        (:end-document
         (values nil peek-val object))
        (t (values case-key peek-val object)))))

(defun tgm-parse-concept (&key stream)
  "Parse a single TGM XML concept event from the current STREAM.
Keyword STREAM names a source as per `cxml:make-source'. 
Return an instance of `parsed-tgm-theme-record' with slot-values populated by
parsed XML values.
:SEE-ALSO `tgm-assoc-elt',`tgm-peeking', `tgm-peeking-get-val', `tgm-consume',
`tgm-characters-every-whitespace-p',`tgm-peek-start-element-and-maybe-add-to-slot',
`tgm-parse-concept',`parsed-tgm-theme-record',`*parsed-tgm-theme-field-to-accessor-table*'.~%▶▶▶"
  (let ((current-object (make-instance 'parsed-tgm-theme-record)))
    (loop for reading = (tgm-peek-start-element-and-maybe-add-to-slot current-object :stream stream)
          until (null reading))
    (if  (slot-boundp current-object 'control-id-display-theme)
        ;; Don't set the slot value and don't return object if we never found an
        ;; XML value for control-id-display-theme when parsing current concept.
        (values current-object (control-id-display-theme current-object))
      ;; Instead, return NIL. Doing so lets us drop out of the file parsing loop by
      ;; calling functions, eg: (loop  unitl (null tgm-parse-concept :stream stream) ...)
      (values nil nil))))

(defun tgm-parse-concepts-update-unbound-slots (&key (hash-table *parsed-tgm-theme-record-hash-table*))
  "Set all unbound `slot-value's to nil for instances of class
`parsed-tgm-theme-record' in HASH-TABLE.
Return the number of objects with unbound slots that were frobbed.
:SEE-ALSO .~%▶▶▶"
  (let ((class-slots (mon:class-slot-list 'parsed-tgm-theme-record)))
  (loop with ht = hash-table ;*parsed-tgm-theme-record-hash-table* ; hash-table
        for obj-id being the hash-keys in ht
        for obj being the hash-values in ht
        when (loop  with obj-inner = obj
                    with obj-inner-id = obj-id
                    for slot in class-slots
                    unless (slot-boundp  obj-inner slot)
                    do (setf (slot-value obj-inner  slot) nil)
                    ;; and collect slot into inner-gather
                    ;; finally (return
                    ;;          (if (null inner-gather)
                    ;;              nil
                    ;;            (list obj-inner-id inner-gather))))
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
(defun tgm-parse-concepts-in-stream (&key ;;(stream (tgm-parse-concepts-make-source))
                                     stream 
                                     (hash-table *parsed-tgm-theme-record-hash-table*)
                                     (clear-hash-p T))
  "Parse all TGM XML concepts in STREAM and close it as if by `klacks:close-source'.
Return as if by values HASH-TABLE and the number of concpets parsed and the number of objects with unbound slots that were updated as if by `tgm-parse-concepts-update-unbound-slots'.
STREAM is a source per return value of `cxml:make-source'. Default is return
value of `tgm-parse-concepts-make-source' which when called resets the current
value of `*parsed-tgm-theme-xml-source-pathname*' by closing any pre-existing
stream object as if by `klacks:close-source'. When STREAM is supplied the stream
is not reset and parsing will continue from current position in stream.
HASH-TABLE is a table to store parsed concepts key/value parse to. Default is `*parsed-tgm-theme-record-hash-table*'.
The keys of hash-table correspond to the `control-id-display-theme' slot-value of an instance of `parsed-tgm-theme-record'.
The values are object instances of same.
CLEAR-HASH-P when T (the default) indicates that HASH-TABLE should be cleared as
if by `cl:clrhash' before parsing concepts.
:EXAMPLE~% \(tgm-parse-concepts-in-stream  :stream  \(tgm-parse-concepts-make-source\)\)~%
:NOTE Following elements if present in STREAM signal an error when parsing and
need to be removed before calling either `tgm-parse-concept' or `tgm-parse-concepts-in-stream':
  <!-- unknown line type [@@@] -->
  <CONCEPT><DESCRIPTOR>Artists materials</DESCRIPTOR><NT>Crayons</NT></CONCEPT>
  <BT>Artists materials</BT> ; <-- tgm013301 \"Crayons\"
:SEE-ALSO `write-parsed-parsed-tgm-theme-record-parse-table-to-file', `tgm-assoc-elt',
`tgm-peeking', `tgm-peeking-get-val', `tgm-consume', `tgm-characters-every-whitespace-p',
`tgm-peek-start-element-and-maybe-add-to-slot',`tgm-parse-concept',`parsed-tgm-theme-record',
`*parsed-tgm-theme-field-to-accessor-table*'.~%▶▶▶"
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
                                           (tgm-parse-concepts-update-unbound-slots
                                            :hash-table hash-table))))
    (KLACKS:CLOSE-SOURCE stream)))

;; (write-parsed-parsed-tgm-theme-record-parse-table-to-file)
(defun write-parsed-parsed-tgm-theme-record-parse-table-to-file (&key
                                                                 (hash-table *parsed-tgm-theme-record-hash-table*)
                                                                 (base-output-directory (merge-pathnames
                                                                                         (make-pathname :directory '(:relative "parsed-class-table-dumps"))
                                                                                         (dbc::sub-path dbc::*xml-output-dir*)))
                                                                 (output-sub-directory "parsed-tgm-theme-record"))

  "Write contents of HASH-TABLE to file.
HASH-TABLE contains key/value pairs that dereference instances of class `parsed-tgm-theme-record' as per `*parsed-tgm-theme-record-hash-table*'.
BASE-OUTPUT-DIRECTORY is a pathname designating the base directory beneath which
to write the file. It is merged with OUTPUT-SUB-DIRECTORY to generate directory
for the output file to be written. BASE-OUTPUT-DIRECTORY must satisfy
`cl:probe-file', an error is signaled if not.%
OUTPUT-SUB-DIRECTORY is a string or list of strings identifying any relative
pathname directory components beneath BASE-OUTPUT-DIRECTORY.
This is a convenience function wrapped  around `write-parsed-class-parse-table-to-file' \(which see\). ~%~@
:EXAMPLE~%~@
\(progn \(tgm-parse-concepts-in-stream :stream *parsed-tgm-theme-xml-source*\)
       \(write-parsed-parsed-tgm-theme-record-parse-table-to-file
        :hash-table *parsed-tgm-theme-record-hash-table*
        :base-output-directory \(merge-pathname \(make-pathname :directory '\(:relative \"parsed-class-table-dumps\"\)\)
                                               \(dbc::sub-path dbc::*xml-output-dir*\)\)
        :output-sub-directory \"parsed-tgm-theme-record\"\)\)
:SEE-ALSO `tgm-assoc-elt',`tgm-peeking', `tgm-peeking-get-val', `tgm-consume',
`tgm-characters-every-whitespace-p',`tgm-peek-start-element-and-maybe-add-to-slot',
`tgm-parse-concept',`parsed-tgm-theme-record',`*parsed-tgm-theme-field-to-accessor-table*'.~%▶▶▶"
  (write-parsed-class-parse-table-to-file  :parsed-class 'parsed-tgm-theme-record
                                           :hash-table hash-table
                                           :base-output-directory base-output-directory
                                           :output-sub-directory output-sub-directory))

;; (tgm-parse-concept-count-slot-value-list-length
(defun tgm-parse-concept-count-slot-value-list-length (slot &key (hash-table *parsed-tgm-theme-record-hash-table*))
  (let ((rslt



          (loop 
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
         (length rslt))
        )))



  

;;; ==============================

#|


;facet-note
(tgm-parse-concept-count-slot-value-list-length 'facet-note :hash-table *parsed-tgm-theme-record-hash-table*) -> 0

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

(tgm-parse-concept-count-slot-value-list-length 'narrower-theme :hash-table *parsed-tgm-theme-record-hash-table*) -> 883, 148 "Activities", 143 "People", 138 "Equipment", 94 "Objects", 88 "Communication", 78 "Events", 74 "Interiors", 70 "Concepts", 66 "Mental states", 63 "Photographs" ...

(tgm-parse-concept-count-slot-value-list-length 'related-theme :hash-table *parsed-tgm-theme-record-hash-table*) ->  3236,  43 "Religion", 40 "Sports", 38 "War", 35 "Human body" ... 


|#

;;; ==============================
;;; EOF
