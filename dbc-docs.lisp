;;; :FILE-CREATED <Timestamp: #{2011-09-26T13:27:24-04:00Z}#{11391} - by MON>
;;; :FILE dbc-specific/dbc-docs.lisp
;;; ==============================

(in-package #:dbc)


;;; ==============================
;;; :SPECIALS-DOCUMENTATION
;;; ==============================

(vardoc '*system-path*
"The base dbc-sytsem path.~%~@
An instance of the system-path class holds the class allocated slot system-path
:EXAMPLE~%
 \(and \(eql \(mon:class-name-of *system-path*\) 
          \(class-name \(find-class 'system-path\)\)\)
     \(system-base-path *system-path*\)\)~%~@
:SEE-ALSO `dbc:system-path'.~%▶▶▶")

(vardoc '*parsed-class-parse-table*
"A hash-table. It's keys are symbols naming subclasses of class `parsed-class'
its values are hash-tables of the parsed XML database files corresponding to the
subclass identified by the key.~%~@
:EXAMPLE~%
 \(gethash 'parsed-inventory-record *parsed-class-parse-table*\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

;;; ==============================
;;; :SPECIALS-DBC-TEST-PATHS-DOCUMENTATION
;;; ==============================

(vardoc '*system-tests-dir*
"Initially set to the string \"dbc-tests\".~%~@
The dbc package defines this parameter and `dbc:*system-tests-temp-dir*' in
:FILE dbc-specific/specials.lisp~%~@
Its value is set at loadtime from :FILE dbc-specific/loadtime-bind.lisp~%~@
Once set the parameter is an instance of `dbc:system-subdir' with a parent-path
as if by the return value of `dbc:find-system-path', e.g.:~%
 \(equal \(dbc:parent-path dbc:*system-tests-dir*\)
        \(dbc:find-system-path\)\)~%~@
Its pathname is accessible with the `dbc:sub-path' accessor.~%~@
:EXAMPLE~%
  \(dbc:sub-path dbc:*system-tests-dir*\)~%
  \(pathname-directory \(dbc:sub-path dbc:*system-tests-dir*\)\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

(vardoc '*system-tests-temp-dir*
"Initially set to the string \"tests\".
The dbc package defines this parameter and `dbc:*system-tests-temp-dir*' in
:FILE dbc-specific/specials.lisp~%~@
Its value is set at loadtime from :FILE dbc-specific/loadtime-bind.lisp~%~@
Once set the parameter is an instance of `dbc:system-subdir' with a parent-path
relative to `dbc:*system-tests-dir*' which has a parent-path relative to return
value of `dbc:find-system-path', e.g.:~%
 \(equal \(find-system-path\)
   \(and \(equal 
         \(dbc:parent-path dbc::*system-tests-temp-dir*\)
         \(dbc:sub-path dbc::*system-tests-dir*\)\)
        \(slot-value dbc::*system-tests-temp-dir* 'system-path\)\)\)~%~@
Its pathname is accessible with the `dbc:sub-path' accessor.~%~@
:EXAMPLE~%
  \(dbc:sub-path dbc::*system-tests-temp-dir*\)~%
  \(pathname-directory \(dbc:sub-path dbc::*system-tests-temp-dir*\)\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

;;; ==============================



;;; ==============================
;;; :SPECIALS-XML-PATHS-DOCUMENTATION
;;; ==============================

(vardoc '*xml-output-dir*
"System relative directory pathname object for storing dbc-xml-dump files.~%~@
Evaluated when system is loaded.~%
:EXAMPLE~%
 \(sub-path *xml-output-dir*\)~%
 \(system-described *xml-output-dir* nil\)~%~@
:SEE-ALSO `*xml-output-dir*', `*xml-output-refs-name*', `*xml-output-refs-ext*',
`*xml-input-dir*', `*xml-input-refs-name*', `*xml-input-refs-name-temp*'.~%▶▶▶")

(vardoc '*xml-output-refs-name*
"---> Output file name with directory components.~%~@
Use when dumping parsed dbc XML files.~%~@
:EXAMPLE~%
 \(pathname-directory *xml-output-refs-name*\)~%
 \(pathname-name *xml-output-refs-name*\)~%
 \(namestring *xml-output-refs-name*\)~%~@
:SEE-ALSO `*xml-output-dir*', `*xml-output-refs-name*', `*xml-output-refs-ext*',
`*xml-input-dir*', `*xml-input-refs-name*', `*xml-input-refs-name-temp*'.~%▶▶▶")

(vardoc '*xml-output-refs-ext*
"---> Output file name with extension and directory components.~%~@
Use when dumping parsed dbc XML files.~%~@
:EXAMPLE~%~@
 \(pathname-directory *xml-output-refs-ext*\)~%
 \(pathname-name *xml-output-refs-ext*\)~%
 \(pathname-type *xml-output-refs-ext*\)~%
 \(namestring *xml-output-refs-ext*\)~%~@
:SEE-ALSO `*xml-output-dir*', `*xml-output-refs-name*', `*xml-output-refs-ext*',
`*xml-input-dir*', `*xml-input-refs-name*', `*xml-input-refs-name-temp*'.~%▶▶▶")

(vardoc '*xml-input-dir*
"System relative directory pathname object for reading dbc-xml-dump files.~%~@
Evaluated when system is loaded.~%~@
:EXAMPLE~%
 \(sub-path *xml-input-dir*\)
 \(system-described *xml-input-dir* nil\)~%~@
:SEE-ALSO `*xml-output-dir*', `*xml-output-refs-name*', `*xml-output-refs-ext*',
`*xml-input-dir*', `*xml-input-refs-name*', `*xml-input-refs-name-temp*'.~%▶▶▶")


;;; ==============================
;;; :SPECIALS-PARSED-CLASS-HASH-TABLES
;;; ==============================

(vardoc '*parsed-class-parse-table*
"Table mapping symbols which subclass `parsed-class' to a corresponding
hash-table of parsed xml-data for that subclass.~%~@
For use with `load-sax-parsed-xml-file-to-parsed-class-hash',
`write-sax-parsed-class-hash-to-files', and functions defined with
`def-parsed-class-record-xml-dump-file-and-hash'.~%~@
:EXAMPLE~%
 \(gethash 'parsed-inventory-record *parsed-class-parse-table*\)~%
 \(gethash 'parsed-inventory-sales-order-record *parsed-class-parse-table*\)~%~@
:SEE-ALSO `*parsed-class-field-slot-accessor-mapping-table*'.~%▶▶▶")

(vardoc '*parsed-class-field-slot-accessor-mapping-table*
"Big table mapping parsed-class symbols to instances of class `parsed-class-field-slot-accessor-mapping'.~%~@
Its keys name object instances which subclass the class `parsed-class'.~%~@
Its values are an instance of three slots:~%~%  ~
 parsed-class-mapped -- a sybmol naming a parsed-class~% ~
 field-to-accessor-table -- a hash-table mapping field-names to slot-accessors~% ~
 accessor-to-field-table -- a hash-table mapping slot-accessors to field-names~%~@
For use with the macro `def-set-parsed-class-record-slot-value' which is used to
define functions which map setf slot-value forms for use with `string-case:string-case'.~%~@
:SEE-ALSO `make-parsed-class-field-slot-accessor-mapping', `*parsed-class-parse-table*'.~%▶▶▶")


;;; ==============================
;; dbc-specific/dbc-classes/dbc-class-parsed-slot-value-cleaning.lisp
;;; ==============================

(fundoc 'parsed-class-slot-value-sort-unique-numeric-string-sequence
        "Return a copy of STRING-SEQUENCE  sorted according to TEST.~%
STRING-SEQUENCE is a list or simple-vector.
When STRING-SEQUENCE has length zerop return it, else each element of
string-sequence must be a non-empty string with 0 every character satsifying
cl:digit-char-p such that the parse-integer representation of string is a unique
integer value for the set of parse-integer elements represented by
STRING-SEQUENCE, an error is signalled if not (possibly leaving
STRING-SEQUENCE in a corrupted state).~%~@
Keyword TEST is a function either #'> or #'<. An error is signaled if not.~%~@
:EXAMPLE~%
 \(parsed-class-slot-value-sort-unique-numeric-string-sequence  '\(\"1\" \"1000\" \"100\"  \"0002\"\) :test #'>\)~%
 \(parsed-class-slot-value-sort-unique-numeric-string-sequence  '\(\"1\" \"1000\" \"100\"  \"0002\"\) :test #'>\)~%
 \(parsed-class-slot-value-sort-unique-numeric-string-sequence  #\(\"1\" \"1000\" \"100\"  \"0002\"\) :test #'<\)~%
 \(parsed-class-slot-value-sort-unique-numeric-string-sequence  #\(\"1\" \"1000\" \"100\"  \"0002\"\) :test #'>\)~%
 \(parsed-class-slot-value-sort-unique-numeric-string-sequence  \(\) :test #'<\)~%
 \(parsed-class-slot-value-sort-unique-numeric-string-sequence  #\(\) :test #'<\)~%~@
Following error succesfully:~%
 \(parsed-class-slot-value-sort-unique-numeric-string-sequence  #\(\"1\" \"1000\" \"100\"  \"0002\"\) :test #'<=\)~%
 \(parsed-class-slot-value-sort-unique-numeric-string-sequence  '\(\"\" \"1000\" \"100\"  \"0002\"\) :test #'>\)~%
 \(parsed-class-slot-value-sort-unique-numeric-string-sequence  '\(\"1.8\" \"1000\" \"100\"  \"0002\"\) :test #'>\)~%
 \(parsed-class-slot-value-sort-unique-numeric-string-sequence  #\(\"1\" \"1000\" \"100\" \"0001\" \"0002\"\) :test #'>\)~%~@
:SEE-ALSO `parsed-class-slot-value-compare-count', `parsed-class-slot-value-count-null',
`parsed-class-slot-value-count-non-null', `parsed-class-slot-value-count-string=',
`parsed-class-slot-value-count-eql', `parsed-class-slot-value-count-equal',
`parsed-class-slot-value-count-equalp', `parsed-class-slot-value-count-string/=',
`parsed-class-slot-value-count-not-eql', `parsed-class-slot-value-count-not-equal',
`parsed-class-slot-value-count-not-equalp', `parsed-class-slot-value-always-string=',
`parsed-class-slot-value-always-null', `parsed-class-slot-value-always-eql',
`parsed-class-slot-value-always-equal', `parsed-class-slot-value-always-equalp',
`parsed-class-slot-value-never-null', `parsed-class-slot-value-never-string=',
`parsed-class-slot-value-never-eql', `parsed-class-slot-value-never-equal',
`parsed-class-slot-value-never-equalp', `parsed-class-slot-value-thereis-null',
`parsed-class-slot-value-thereis-string=', `parsed-class-slot-value-thereis-eql',
`parsed-class-slot-value-thereis-equal', `parsed-class-slot-value-thereis-equalp',
`parsed-class-slot-value-collect-all', `parsed-class-slot-value-collect-string=',
`parsed-class-slot-value-collect-string/=', `parsed-class-slot-value-collect-null',
`parsed-class-slot-value-collect-non-null', `parsed-class-slot-value-collect-eql',
`parsed-class-slot-value-collect-equal', `parsed-class-slot-value-collect-equalp',
`parsed-class-slot-value-collect-not-eql', `parsed-class-slot-value-collect-not-equal',
`parsed-class-slot-value-collect-not-equalp', `parsed-class-slot-value-set-when-null',
`parsed-class-slot-value-set-when-string=', `parsed-class-slot-value-set-when-eql',
`parsed-class-slot-value-set-when-equal', `parsed-class-slot-value-set-when-equalp',
`parsed-class-slot-value-set-when-string/=', `parsed-class-set-slot-value-from-consed-pairs'.~%▶▶▶")

;; :TODO Document these:
;; parsed-class-slot-value-compare-count (class slot)
;; parsed-class-slot-value-count-null (class slot)
;; parsed-class-slot-value-count-non-null (class slot)
;; parsed-class-slot-value-count-string= (class slot match-string)
;; parsed-class-slot-value-count-eql (class slot match-value)
;; parsed-class-slot-value-count-equal (class slot match-value)
;; parsed-class-slot-value-count-equalp (class slot match-value)
;; parsed-class-slot-value-count-string/= (class slot match-string)
;; parsed-class-slot-value-count-not-eql (class slot match-value)
;; parsed-class-slot-value-count-not-equal (class slot match-value)
;; parsed-class-slot-value-count-not-equalp (class slot match-value)
;; parsed-class-slot-value-always-string= (class slot match-string)
;; parsed-class-slot-value-always-null (class slot)
;; parsed-class-slot-value-always-eql (class slot match-value)
;; parsed-class-slot-value-always-equal (class slot match-value)
;; parsed-class-slot-value-always-equalp (class slot match-value)
;; parsed-class-slot-value-never-null (class slot)
;; parsed-class-slot-value-never-string= (class slot match-string)
;; parsed-class-slot-value-never-eql (class slot match-value)
;; parsed-class-slot-value-never-equal (class slot match-value)
;; parsed-class-slot-value-never-equalp (class slot match-value)
;; parsed-class-slot-value-thereis-null (class slot)
;; parsed-class-slot-value-thereis-string= (class slot match-string)
;; parsed-class-slot-value-thereis-eql (class slot match-value)
;; parsed-class-slot-value-thereis-equal (class slot match-value)
;; parsed-class-slot-value-thereis-equalp (class slot match-value)
;; parsed-class-slot-value-collect-all (class slot)
;; parsed-class-slot-value-collect-string= (class slot match-string &key (sort-object-ids nil))
;; parsed-class-slot-value-collect-string/= (class slot match-string)
;; parsed-class-slot-value-collect-null (class slot &key (sort-object-ids nil))
;; parsed-class-slot-value-collect-non-null (class slot)
;; parsed-class-slot-value-collect-eql (class slot match-value &key (sort-object-ids nil))
;; parsed-class-slot-value-collect-equal (class slot match-value &key (sort-object-ids nil))
;; parsed-class-slot-value-collect-equalp (class slot match-value &key (sort-object-ids nil))
;; parsed-class-slot-value-collect-not-eql (class slot match-value)
;; parsed-class-slot-value-collect-not-equal (class slot match-value)
;; parsed-class-slot-value-collect-not-equalp (class slot match-value)
;; parsed-class-slot-value-set-when-null (class slot replacement-value 
;; parsed-class-slot-value-set-when-string= (class slot match-string replacement-value 
;; parsed-class-slot-value-set-when-eql (class slot match-value replacement-value 
;; parsed-class-slot-value-set-when-equal (class slot match-value replacement-value &key (return-object-id t)
;; parsed-class-slot-value-set-when-equalp (class slot match-value replacement-value
;;
;; parsed-class-slot-value-set-when-string/= (class slot match-string replacement-value
;; parsed-class-set-slot-value-from-consed-pairs (parsed-class slot-name hash-key-and-new-value)


;;; ==============================
;;; :DBC-CLN-PARSE-DOCUMENTATION
;;; dbc-parse/dbc-cln-parse.lisp
;;; ==============================

(fundoc 'field-convert-edit-timestamp
        "Return a string representation of a `local-time:timestamp' as if by cl:values
when MAYBE-TIMESTAMP satisfies certain constraints.
Return values have the form:~%
 - nth-value 0 is a local-time timestamp ojbect formatted as a string | NIL
 - nth-value 1 is a local-time timestamp object | NIL
 - nth-value 2 is a universal-time | NIL
 - nth-value 3 is MAYBE-VALID-TIME-STRING~%~@
MAYBE-TIMESTAMP is a string having the form:~%
 \"2009-01-27 22:00:31\"
  YYYY-MM-DD hh:mm:ss~%~@
:EXAMPLE~%
 \(field-convert-edit-timestamp \"2009-01-27 22:00:31\"\)~%
 \(field-convert-edit-timestamp \"\"\)~%
 \(field-convert-edit-timestamp \"  \"\)~%
 \(field-convert-edit-timestamp \"0000-00-00 00:00:00\"\)~%~@
Following errors successfully:~%
 \(field-convert-edit-timestamp \" _\"\)~%~@
:SEE-ALSO `field-convert-edit-timestamp-origin-14'.~%▶▶▶")

(fundoc 'field-convert-edit-timestamp-origin-14
        "Return a string representation of a `local-time:timestamp' as if by cl:values
if MAYBE-VALID-TIME-STRING satisfies certain constraints.~%~@
Return values have the form:~%
 - nth-value 0 is a local-time timestamp ojbect formatted as a string | NIL  
 - nth-value 1 is a local-time timestamp object | NIL
 - nth-value 2 is a universal-time | NIL     
 - nth-value 3 is MAYBE-VALID-TIME-STRING~%
When MAYBE-VALID-TIME-STRING is a string of length 14 with every character
cl:digit-char-p and has the format:~%
\"20040812082333\"
 YYYYMMDDhhmmss~%
 - where YYYY represent an integer value the range [2004,<CURRENT-YEAR>]
 - where MM represent an integer value the range [1,13]
 - where DD represent an integer value the range [1,31]
 - where hh represent an integer value the range [0,24]
 - where mm and ss represent an integer value the range [0,60]~%
:EXAMPLE~%
 \(field-convert-edit-timestamp-origin-14 \"20040812082333\"\)~%
Following shouldn't parse correctly and return as values nil, nil, nil, <TIMESTRING>~%
 \(field-convert-edit-timestamp-origin-14 \"20040812082333m\"\)~%
 \(field-convert-edit-timestamp-origin-14 \"20030812082333\"\)~%
 \(field-convert-edit-timestamp-origin-14 \"20031312082333\"\)~%
:SEE-ALSO `field-convert-edit-timestamp'.~%▶▶▶")

(fundoc 'field-name-underscore-to-dash
 "Convert string FIELD-NAME with `cl:string-upcase'd removing any #\\_.~%~@
Return as if by `cl:values'.~%~@
FIELD-NAME is a string and should not be prefixed or suffixed by whitespace or #\\_.~%~@
When optional arg W-COLON is non-nil return prefixed with a colon.~%~@
:EXAMPLE~%
 \(field-name-underscore-to-dash \"keyword_seo\"\)~%
 \(field-name-underscore-to-dash \"keyword_seo\" t\)~%
:SEE-ALSO `preprocess-underscore-to-dash',
`dbc:preprocess-leading-trailing-dashes', `mon:string-underscore-to-dash',
`cl-ppcre:regex-replace-all'.~%▶▶▶")

(fundoc 'field-string-cons
  "Return a three element list according to the `type-of' FIELD-STR.~%~@
List has the form:~%
 \(<SEQ-LENGTH> \(<TYPE-SPEC>\) FIELD-STR\)~%
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `field-table-parse-out', `field-string-cons', `field-cln-x'.~%▶▶▶")

(fundoc 'field-cln-x
        "Return nil when FIELD-STRING-CONS is a string of length 1 with char value #\\x.~%
Else return value of FIELD-STRING-CONS.~%
This is a short-circuiting procedure, e.g. it does nothing on success.~%
:NOTE the \"x\" was used ind dbc sql fields to designate a null value.~%
:EXAMPLE~%~%\(field-cln-x \"x\"\)~%
 \(field-cln-x 'sym\)~%
 \(field-cln-x #\(x y z\)\)~%
 \(field-cln-x '\(x y z\)\)~%
:SEE-ALSO `field-table-parse-out', `field-string-cons', `field-cln-x'.~%▶▶▶")

(fundoc 'split-used-fors
"Split USED-FOR-STRING on \"|\" barriers stripping leading and trailing whitespace~%~@
Return as if by cl:values:
 \(\"SPLIT\" \"USED\" \"FORS\" \"STRINGS\"\),USED-FOR-STRING.~%~@
When USED-FOR-STRING is either `mon:string-null-or-empty-p' or
`mon:string-all-whitespace-p' return as if by `cl:values':~%
 nil,USED-FOR-STRING~%~@
:EXAMPLE~%
 \(split-used-fors \"Poinçon de la Blanchardière, Pierre | La Blanchardiere, Pierre Poin çon de | \"\)~%
 \(split-used-fors \" | \"\)~%
 \(split-used-fors \"     \"\)~%
 \(split-used-fors \"\"\)~%
 \(split-used-fors nil\)~%~@
:SEE-ALSO `split-piped-field-if', `mon:string-split-on-chars', `split-roles',
`split-appeared-in', `split-loc-pre', `split-date-range', `split-comma-field'.~%▶▶▶")

(fundoc 'split-field-on-char-if
"SPLIT-STRING on CHAR returning a list of strings.~%~@
Do not return a list if no occurences of CHAR are found.~%~@
SPLIT-STRING may be an object of any type not just a `cl:string'.~%~@
Return 4 values as if by `cl:values' in a like manner as `dbc:field-convert-1-0-x-empty'.~%~@
Keywords KEEP-FIRST and KEEP-DUPLICATES are booleans.
When keyword KEEP-DUPLICATES is non-nil do not remove duplicate elements from
first value ruturned.  Default is to process nth-value 0 with
`field-convert-remove-duplicates' prior to returning.~%
When keyword KEEP-FIRST is non-nil do not return nil for nth-value 0 if string
is contained of only `mon:whitespace-char-p' and CHAR.~%
:NOTE The call chain is as follows:~%~@
 `split-field-on-char-if' :keep-first { T | NIL } :keep-duplicates { T | NIL }
  `- `field-convert-1-0-x-empty'
       `- `field-convert-verify-string' <SPLIT-STRING> :known-field-hashtable <KNOWN-FIELD-HASHTABLE>~%~@
:EXAMPLE~%
 \(split-field-on-char-if \" a | b | c | d | e\" #\\|\)~%
 \(split-field-on-char-if \" a | b | c | d | e | e | d | c | b | a | \" #\\|\)~%
 \(split-field-on-char-if \" a | b | c | d | e | e | d | c | b | a | \" #\\| :keep-duplicates t\)~%
 \(split-field-on-char-if \" , \" #\\,\)~%
 \(split-field-on-char-if \" , \" #\\, :keep-first t\)~%
 \(split-field-on-char-if \", \" #\\,  :keep-first t\)~%
 \(split-field-on-char-if \" ,\" #\\,  :keep-first t\)~%
 \(split-field-on-char-if \" ,   \" #\\,\)~%
 \(split-field-on-char-if \" ,      \" #\\, :keep-first t\)~%
 \(split-field-on-char-if \"8 ba \" #\\ \)~%
 \(split-field-on-char-if \"8 ba ba\" #\\  :keep-duplicates t\)~%
 \(split-field-on-char-if 8 #\\8\)~%
 \(split-field-on-char-if nil #\\8\)~%
 \(split-field-on-char-if t #\\8\)~%
 \(split-field-on-char-if #b0000 #\\8\)~%
 \(split-field-on-char-if #\\1 #\\1\)~%
 \(split-field-on-char-if \"1\" #\\1\)~%
 \(split-field-on-char-if \"\" #\\1\)~%
 \(split-field-on-char-if \"ref\" #\\1 :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \"x\" #\\1 :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \"1\" #\\1 :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \"0,\" #\\, :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \" ,\" #\\, :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \" , \" #\\, :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \" , \" #\\, :keep-first t :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-field-on-char-if \"ref , \" #\\, :known-field-hashtable *xml-refs-match-table*\)~%~@
:NOTE Corner case where `field-convert-1-0-x-empty' wins:~%~@
 \(split-field-on-char-if \"   \" #\\space :keep-first t\)~%~@
:NOTE Has regression tests:
 `split-field-on-char-if-TEST.0' `split-field-on-char-if-TEST.1'
 `split-field-on-char-if-TEST.2' `split-field-on-char-if-TEST.3'
:SEE-ALSO `split-piped-field-if', `split-comma-field' `split-comma-field-if'.~%▶▶▶")

(fundoc 'split-piped-field-if
        "Like `split-used-fors' but do not return a list if no #\\| are found.~%~@
Unlike `split-used-fors' arg PIPED-STRING may be an object of any type not just a `cl:string'.~%~@
Return 4 values as if by `cl:values' in a like manner as `dbc:field-convert-1-0-x-empty'.~%~@
When keyword KEEP-DUPLICATES (a boolean) is non-nil do not remove as if by the duplicate
elements from first value ruturned.  Default is to process nth-value 0 with
`field-convert-remove-duplicates' prior to returning.~%~@
:EXAMPLE~%
 \(split-piped-field-if \" a | b | c | d | e\"\)~%
 \(split-piped-field-if \" a | b | c | d | e | e | d | c | b | a | \"\)~%
 \(split-piped-field-if \" a | b | c | d | e | e | d | c | b | a | \" :keep-duplicates t\)~%
 \(split-piped-field-if \" | \"\)~%
 \(split-piped-field-if \" | \"\)~%
 \(split-piped-field-if \"\"\)~%
 \(split-piped-field-if \"|\"\)~%
 \(split-piped-field-if  8\)~%
 \(split-piped-field-if \"8\"\)~%
 \(split-piped-field-if \"8 ba \"\)~%
 \(split-piped-field-if nil\)~%
 \(split-piped-field-if t\)~%
 \(split-piped-field-if #b0000\)~%
 \(split-piped-field-if \"ref\" :known-field-hashtable *xml-refs-match-table*\)~%
 \(split-piped-field-if \"ref\"\)~%
 \(funcall \(complement #'equalp\)
          \(multiple-value-list 
           \(split-piped-field-if \"ref\"\)\) 
          \(multiple-value-list 
           \(split-piped-field-if \"ref\" 
                                 :known-field-hashtable *xml-refs-match-table*\)\)\)~%~@
:SEE-ALSO `split-used-fors', `split-roles', `split-appeared-in',
`split-loc-pre', `split-date-range', `split-comma-field',
`mon:string-split-on-chars'.~%▶▶▶")
 
(fundoc 'split-appeared-in
"Split APPEARED-IN-STRING on \"|\" barriers.~%~@
Return value is a list of strings.~%~@
Like `split-used-fors', but strip leading and trailing occurences of
`mon:*whitespace-chars*', e.g. #\\Newline #\\Return et al.~%~@
When APPEARED-IN-STRING is either `mon:string-null-or-empty-p' or
`mon:string-all-whitespace-p' return as if by `cl:values':~%
 nil,APPEARED-IN-STRING~%~@
:EXAMPLE~%
 \(split-appeared-in \"Le Rire | Le Sourire | Femina | Printed Salesmanship |\"\)~%
 \(split-appeared-in \"    Le Rire | Le Sourire |~% Femina | La Rampe \"\)~%
 \(split-appeared-in \"\"\)~%
 \(split-appeared-in nil\)~%
 \(split-appeared-in \"\"\)~%
 \(split-appeared-in \"     \"\)~%~@
:SEE-ALSO `split-roles', `split-used-fors', `split-loc-pre',
`split-date-range'`mon:string-split-on-chars', `mon:string-trim-whitespace',
`mon:*whitespace-chars*'.~%▶▶▶")
 
(fundoc 'split-roles
        "Split ROLE-STRING on \",\" barriers.~%~@
Strip leading/trailing whitespace and \".\". Capitalize all roles.~%~@
Return value is a list of strings.~%~@
When ROLE-STRING is either `mon:string-null-or-empty-p' or
`mon:string-all-whitespace-p' return as if by `cl:values':~%
 nil,ROLE-STRING~%~@
:EXAMPLE~%
 \(split-roles
  \"Artist, Illustrator,  Designer, Fashion Illustrator, Fashion Designer.\"\)~%
 \(split-roles
  \"Artist, Illustrator,  designer, Fashion illustrator, Fashion Designer .\"\)~%
 \(split-roles \"Artist, \"\)~%
 \(split-roles nil\)~%
 \(split-roles \"\"\)~%
 \(split-roles \"       \"\)~%~@
:SEE-ALSO `split-piped-field-if', `split-used-fors', `split-appeared-in',
`split-loc-pre', `split-date-range', `split-comma-field'.~%▶▶▶")

(fundoc 'split-loc-pre
        "Trim leading \"n \" prefix from loc-control fields.~%~@
Return as if by cl:values:~%~@
 <TRANSOFRMED-LOC-STRING>, LOC-STRING
When LOC-STRING is either `mon:string-null-or-empty-p' or
`mon:string-all-whitespace-p' return as if by `cl:values':~%
 nil,LOC-STRING~%~@
:EXAMPLE~%
 \(split-loc-pre \"n 83043434\"\)~%
 \(split-loc-pre \"83043434\"\)~%
 \(split-loc-pre \"\"\)~%
 \(split-loc-pre \"     \"\)~%
 \(split-loc-pre nil\)~%~@
:NOTE This is actually a bad idea as the \"n 95121069\" is canonical...~%~@
:SEE-ALSO `split-roles', `split-used-fors', `split-piped-field-if',
`split-appeared-in', `split-date-range'.~%▶▶▶")

(fundoc 'split-date-range
"Split LIFESPAN-STR into a consed pair.~%~@
LIFESPAN-STR should have one of the formats:~% 
 <YYYY>-<YYYY>~% -<YYYY>~% <YYYY>-~% <YYYY>-?~% ?-<YYYY>~%~@
LIFESPAN-STR is either `null' or `simple-string-p', signal an error if not.~%~@
Return value has the form:~% 
 \(\"<YYYY>\" . \"<YYYY>\"\)~% 
 \(\"<YYYY>\" . \"?\"\)~% 
 \(\"?\" . \"<YYYY>\"\)~% 
 \(NIL\)~%
:EXAMPLE~%
 \(split-date-range \"1843-1908\"\)~%
 \(split-date-range \"1848-\"\)~%
 \(split-date-range \"-1848\"\)~%
 \(split-date-range \"?-1848\"\)~%
 \(split-date-range \"-1848-?\"\)~%
 \(split-date-range \"-1848?\"\)~%
 \(split-date-range \"-1848?\"\)~%
 \(split-date-range \"1848 - 1942\"\)
 \(split-date-range \" 1848 - 1942 \"\)
 \(split-date-range \"1848 -- ??\"\)~%
 \(split-date-range \" 1848-?? \"\)~%~@
;; Pathological:~%
 \(split-date-range \"1940s-60s\"\)~%
 \(split-date-range \"Active 1940s-60s\"\)~%~@
:NOTE Doesn't catch the #\\[ #\\] chars in \"[?]-1900\" or \"1900-[?]\".~%~@
:SEE-ALSO `split-roles', `split-used-fors', `split-piped-field-if',
`split-appeared-in', `split-loc-pre'.~%▶▶▶")

(fundoc 'split-date-range-string-int-pairs
"Attempt integer extraction from cons strings returned by `split-date-range'.~%~@
LIFESPAN-STR-PAIR is a consed pair with the value of each conscell satisfying
either null or `simple-stringp', signal an error if not.~%~@
First cons pair of return value is LIFESPAN-STR-PAIR second cons pair is its
interpolated parsed value.  Return value is a list of conses with the form:~% 
 \(<LIFESPAN-STR-PAIR>    <PARSED-VALUE>\)~% 
And should match one of the following patterns:~%
 \(\(\"<YYYY>\" . \"<YYYY>\"\)  \(YYYY   . YYYY\)\)~%
 \(\(\"<YYYY>\" . \"?\"\)       \(YYYY-1 . \(lognot YYYY-1\)\)\)~%
 \(\(\"<?+>\"   . \"<YYYY>\"\)  \(-1     . YYYY\)\)~%
 \(\(nil\)                  \(nil\)\)~%
 \(\(\"<YYYY>\"\)             \(nil\)\)~%
 \(\(\"<?+>\"   . \"<?+>\"\)    \(nil)\)~%
 \(\(\"<0+>\"   . \"<?+>\"\)    \(nil\)\)~%
 \(\(\"<?+>\"   . \"<0+>\"\)    \(nil\)\)~%
 \(\(\"<0+>\"   . \"<YYYY>\"\)  \(-1     . YYYY\)\)~%
 \(\(\"<YYYY>\" . \"<0+>\"\)    \(YYYY-1 . \(lognot YYYY-1\)\)~%
:EXAMPLE~%
 \(split-date-range-string-int-pairs \(split-date-range \"\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"1843-1943\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"1843-\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"-1843\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"1843-??\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"??-1843\"\)\)~%
;; Following cases are pathological and reasonably acounted for:~%
 \(split-date-range-string-int-pairs \(split-date-range \"00\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"??-??\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"00-??\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"00-00\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"00-1843\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"1843-00\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"1866-1866\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"1866--\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"1866-?-\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"1866--??-\"\)\))~%~@
;; Following case is pathological and without a clear solution:~%
 \(split-date-range-string-int-pairs \(split-date-range \"1843\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"1866-1865\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"3001-88\"\)\)~%
 \(split-date-range-string-int-pairs \(split-date-range \"88-3001\"\)\)~%~@
When the car of LIFESPAN-STR-PAIR is a string indicating the beginning of
lifespan is an \"unknown\", the car of the second cons of return value is -1.
The intent in using a negative is to allow later callers the oppurtunity to
optimize their checks. For example:~%
 \(let* \(\(w-str \"1843-??\"\)
        \(both-lifespan \(split-date-range-string-int-pairs
 		       \(split-date-range w-str\)\)\)
        \(hd-ls \(caadr both-lifespan\)\)
        \(tl-ls \(cdadr both-lifespan\)\)\)
   \(and \(integerp tl-ls\)
        \(eql \(signum \(- tl-ls hd-ls\)\) -1\)\)
   \(format nil \(mon:concat
 	       \"~~2%With string: ~~20T~~S~~%Split to: ~~20T~~S~~%Beg-of-Life: \"
 	       \"~~20T~~S~~%End-of-Life: ~~20T~~S~~%Calcuation: ~~20t~~S ;=> ~~S~~%\")
     	  w-str both-lifespan hd-ls tl-ls
     	  \(list '- tl-ls hd-ls\) \(- tl-ls hd-ls\)\)\)~%~@
Likewise, when the cdr of LIFESPAN-STR-PAIR is a string indicating the end of 
lifespan is \"unknown\", the cdr of the second cons of return value is `lognot'
the integer value in the car cell. IOW, if there is a known beginning of
lifespan i.e. the string passed from `split-date-range' was \"1843-?\", we
don't want inferences about an entities lifespan to return misleadingly and
guard against that by making it difficult for forms such as:~% 
 \(- <END-LIFESPAN> <BEG-LIFESPAN>\)~%~@
to return a value that is `plusp'. For example:~% 
 \(let* \(\(both-lifespan \(split-date-range-string-int-pairs
			\(split-date-range \"1843-??\"\)\)\)
	\(hd-ls \(caadr both-lifespan\)\)
	\(tl-ls \(cdadr both-lifespan\)\)\)
   \(and \(integerp tl-ls\)
	\(eql \(signum \(- tl-ls hd-ls\)\) -1\)\)\)~%~@
When coupled with the string values in the cons at the first elt in return value
we can be reasonably sure that the integer parse is correct.~%~@
:SEE-ALSO `split-roles', `split-used-fors', `split-piped-field-if',
`split-appeared-in', `split-loc-pre'.~%▶▶▶")

(fundoc 'split-comma-field-if
"If COMMA-STRING is `cl:stringp' split it at #\\, comma delimiters.~%~@
Return 4 values as if by `cl:values' in a like manner as `dbc:field-convert-1-0-x-empty'.~%~@
Keywords KEEP-FIRST and KEEP-DUPLICATES are booleans.
When keyword KEEP-DUPLICATES is non-nil do not remove duplicate elements from
first value ruturned.  Default is to process nth-value 0 with
`field-convert-remove-duplicates' prior to returning.~%
When keyword KEEP-FIRST is non-nil do not return nil for nth-value 0 if string
is contained of only `mon:whitespace-char-p' and CHAR.~%
:EXAMPLE~%
 \(split-comma-field-if \"air, air,\"\)~%
 \(split-comma-field-if nil\)~%
 \(split-comma-field-if \(\)\)~%
 \(split-comma-field-if \(cons nil nil\)\)~%
 \(split-comma-field-if \(list nil\)\)~%
 \(split-comma-field-if \"air, plane, airplane, Biplane,, aircraft, expo, , dirigible,\"\)~%
 \(count \"air\"  \(split-comma-field-if \"air, aircraft, air, \"\)  :test #'string=\)~%
 \(count \"air\" \(split-comma-field-if \"air, airplane, air,\" :keep-duplicates t\)  :test #'string=\)~%
 \(split-comma-field-if \",\"\)~%
 \(split-comma-field-if \",\" :keep-first t\)~%
 \(split-comma-field-if \",,\"\)~%
 \(split-comma-field-if \",,\" :keep-first t\)~%
 \(split-comma-field-if \", ,\"\)~%
 \(eql \(null \(split-comma-field-if \", ,\"\)\)
      \(null \(split-comma-field-if \", ,\" :keep-duplicates t\)\)\)~%
 \(split-comma-field-if \"\"\)~%
 \(split-comma-field-if  \"   \"\)~%
 \(every #'null
        \(split-comma-field-if \"\"\)
        \(split-comma-field-if  \"   \"\)
        \(split-comma-field-if  \"   \" :keep-first t\)
        \(split-comma-field-if  \"   \" :keep-duplicates t\)
        \(split-comma-field-if  \"   \" :keep-first t :keep-duplicates t\)\)~%
:SEE-ALSO `split-used-fors', `split-piped-field-if', `split-roles',
`split-appeared-in', `split-loc-pre', `split-date-range', `split-comma-field',
`mon:string-split-on-chars'.~%▶▶▶")

(fundoc 'split-comma-field
"Split a comma delimited string COMMA-STRING.~%~@
Intended for use with SEO and \"keyword\" like fields in the `refs` table.~%~@
:EXAMPLE~%
 \(split-comma-field \"air, plane, airplane, Biplane,, aircraft, expo, , dirigible,\"\)~%
 \(split-comma-field \",\"\)~%
 \(split-comma-field \",,\"\)~%
 \(split-comma-field \", ,\"\)~% 
 \(split-comma-field \"\"\)~%
 \(split-comma-field  \"   \"\)~%
 \(split-comma-field  nil\)~%
 \(split-comma-field  \(\)\)~%~@
:NOTE Do not call unless reasonably sure sure that there are never free commas
used in a non-delimiting position, e.g. the following string will not parse correctly:~% 
 \(split-comma-field  \"Havell \(Robert, Jr.\), Havell \(Robert, Sr.\), Havell Lithograph, \"\)~%~@
:SEE-ALSO `split-used-fors', `split-piped-field-if', `split-roles',
`split-appeared-in', `split-loc-pre', `split-date-range', `split-comma-field',
`mon:string-split-on-chars'.~%▶▶▶")

(fundoc 'format-entity-role
"Format dbc entity-roles list for presentation.~%~@
Arg ENTITY-ROLES is a list of strings with each string designating a role played
by a dbc entity, e.g. Artist, Author, Publisher, etc.~%~@
Keyword STREAM is destination stream for `cl:format'. Default is nil.~%~@
Keyword ENTITY-ROLE-PREFIX is a qualifier describing the type of entity role.
Default is \":ROLE\".
Keyword PREFIX-MIN-PAD is an integer designating the amount of padding which
should suffix ENTITY-ROLE-PREFIX.  Default is 14.~%~@
:EXAMPLE~%
 \(with-open-stream \(s \(make-string-output-stream\)\)
   \(format s \"Artist Name: Bubba \(Big\)~~%\"\)
   \(dbc-format-entity-rol
    \(dbc:split-roles
     \"Artist, Illustrator,  designer, Fashion illustrator, Fashion Designer .\"\)
    :entity-role-prefix \":ARTIST-ROLE\"
    :prefix-min-pad 15
    :stream s\)
   \(get-output-stream-string s\)\)
 ; => \"Artist Name: Bubba (Big)
 ;     :ARTIST-ROLE   Artist
 ;     :ARTIST-ROLE   Illustrator
 ;     :ARTIST-ROLE   Designer
 ;     :ARTIST-ROLE   Fashion Illustrator
 ;     :ARTIST-ROLE   Fashion Designer\"~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

(fundoc 'field-convert-verify-string
"Return STRING-FIELD-MAYBE if it is a string and not null or empty.~%~@
Return as if by cl:values.~%~@
When optional arg KNOWN-FIELD-HASHTABLE is non-nil it is a hash-table the keys
of which are strings identifiying known fields. 
If a field is found as key in hash-table return nil, STRING-FIELD-MAYBE.~%~@
:EXAMPLE~%
 \(field-convert-verify-string nil\)~%
 \(field-convert-verify-string 8\)~%
 \(field-convert-verify-string \"\"\)~%
 \(field-convert-verify-string \"             \"\)~%
 \(field-convert-verify-string \"mma\"\)~%
 \(field-convert-verify-string \"ref\" *xml-refs-match-table*\)~%
 \(field-convert-verify-string \"ref\" *xml-refs-match-table*\)~%
 \(field-convert-verify-string \"ref\" '*xml-refs-match-table*\)~%
 \(field-convert-verify-string \"not-there\" *xml-refs-match-table*\)~%
 \(field-convert-verify-string \"not-there\" 'xml-refs-match-table*\)~%
 \(field-convert-verify-string \"ref\" '*not-xml-refs-match-table*\)~%
 \(field-convert-verify-string \"ref\" nil\)~%
 \(field-convert-verify-string \"ref\" t\)~%~@
:SEE-ALSO `field-convert-empty-string-nil'.~%▶▶▶")

(fundoc 'field-convert-remove-duplicates
"Remove duplicate string= elements from STRING-LIST-MAYBE.~%~@
Return as if by cl:values:~%
 <TRANSFORMED-STRING-LIST-MAYBE>, STRING-LIST-MAYBE.~%~@
When STRING-LIST-MAYBE is not `mon:each-a-string-p' return:~%
 NIL, STRING-LIST-MAYBE~%~@
:EXAMPLE~%
 \(field-convert-remove-duplicates 
  \(split-appeared-in \"Le Rire | Le Sourire | Le Rire | Femina | ARTworld | Femina | femina | \"\)\)~%
 \(field-convert-remove-duplicates '\(\"   \" \"   \" \" a \" \" a \"\)\)~%
 \(field-convert-remove-duplicates \" \"\)~%
 \(field-convert-remove-duplicates  \(split-used-fors nil\)\)~%
 \(field-convert-remove-duplicates 42\)~%~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

(fundoc 'field-convert-1-0-x
        "Attept to CONVERT-FIELD to a boolean.~%~@
CONVERT-FIELD is a dbc field string value of length one satisfying 
`mon:simple-string-or-null'.~%~@
When CONVERT-FIELD is any of the following  return T:~%
 \"1\" #\\1 1 T
When CONVERT-FIELD is any of the following return NIL:~%
 \"x\" \"X\" #\x #\X the symbol X \"0\" #\0 0 NIL
When CONVERT-FIELD is some other character or \(> \(length CONVERT-FIELD\) 1\)
return CONVERT-FIELD.~%~@
:EXAMPLE~%
 \(field-convert-1-0-x  \"1\"\)~%
 \(field-convert-1-0-x #\\1\)~%
 \(field-convert-1-0-x t\)~%
 \(field-convert-1-0-x   1\)~%
 \(field-convert-1-0-x  \"0\"\)~%
 \(field-convert-1-0-x  \"x\"\)~%
 \(field-convert-1-0-x  \"X\"\)~%
 \(field-convert-1-0-x #\\0\)~%
 \(field-convert-1-0-x #\\x\)~%
 \(field-convert-1-0-x #\\X\)~%
 \(field-convert-1-0-x   0\)~%
 \(field-convert-1-0-x  #\\*\)~%
 \(field-convert-1-0-x  #\\t\)~%
 \(field-convert-1-0-x  \"t\"\)~%
 \(field-convert-1-0-x \"Return Me\"\)~%~@
:NOTE Has regression test `field-convert-1-0-x-TEST'.~%~@
:SEE-ALSO `dbc:field-convert-1-0-x', `dbc:field-convert-1-0-x-empty',
`dbc:field-convert-1-0-x-empty-known', `dbc:field-convert-verify-string',
`dbc:field-convert-empty-string-nil', `dbc:field-cln-x'.~%▶▶▶")

(fundoc 'field-convert-1-0-x-empty
        "Like `field-convert-1-0-x' but return 4 values as if by cl:values.~%~@
:EXAMPLE~%
 \(field-convert-1-0-x-empty \"    \"\)~%
 \(field-convert-1-0-x-empty \"\"\)~%
 \(field-convert-1-0-x-empty nil\)~%
 \(field-convert-1-0-x-empty \"1\"\)~%
 \(field-convert-1-0-x-empty #\\1\)~%
 \(field-convert-1-0-x-empty t\)~%
 \(field-convert-1-0-x-empty 1\)~%
 \(field-convert-1-0-x-empty \"0\"\)~%
 \(field-convert-1-0-x-empty \"x\"\)~%
 \(field-convert-1-0-x-empty \"X\"\)~%
 \(field-convert-1-0-x-empty #\\0\)~%
 \(field-convert-1-0-x-empty #\\x\)~%
 \(field-convert-1-0-x-empty #\\X\)~%
 \(field-convert-1-0-x-empty 0\)~%
 \(field-convert-1-0-x-empty #\\*\)~%
 \(field-convert-1-0-x-empty #\\t\)~%
 \(field-convert-1-0-x-empty \"t\"\)~%
 \(field-convert-1-0-x-empty \"Return Me\"\)~%
 \(field-convert-1-0-x-empty \"ref\" :known-field-hashtable *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"ref\" :known-field-hashtable '*xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"not-there\" :known-field-hashtable 'not-a-valid-hashtable\)~%
 \(field-convert-1-0-x-empty \"not-there\" :known-field-hashtable '*xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"\" :known-field-hashtable *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"   \" :known-field-hashtable *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty  8 :known-field-hashtable *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"x\" :known-field-hashtable *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"1\" :known-field-hashtable *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty \"0\" :known-field-hashtable *xml-refs-match-table*\)~%~@
:NOTE Has regression tests:~%
 `field-convert-1-0-x-empty-TEST.0' `field-convert-1-0-x-empty-TEST.0'~%~@
:SEE-ALSO `dbc:field-convert-1-0-x', `dbc:field-convert-1-0-x-empty',
`dbc:field-convert-1-0-x-empty-known', `dbc:field-convert-verify-string',
`dbc:field-convert-empty-string-nil', `dbc:field-cln-x'.~%▶▶▶")

(fundoc 'field-convert-1-0-x-empty-known
"Like `field-convert-1-0-x-empty' but also check if CONVERT-FIELD is in
KNOWN-FIELD-HASHTABLE.~%~@
:EXAMPLE~%
 \(field-convert-1-0-x-empty-known \"ref\" *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty-known \"\" *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty-known \"   \" *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty-known 8 *xml-refs-match-table*\)~%

 \(field-convert-1-0-x-empty-known \"x\" *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty-known \"1\" *xml-refs-match-table*\)~%
 \(field-convert-1-0-x-empty-known \"0\" *xml-refs-match-table*\)~%~@
:SEE-ALSO `dbc:field-convert-1-0-x', `dbc:field-convert-1-0-x-empty',
`dbc:field-convert-1-0-x-empty-known', `dbc:field-convert-verify-string',
`dbc:field-convert-empty-string-nil', `dbc:field-cln-x'.~%▶▶▶")

(fundoc 'field-convert-empty-string-nil
"If EMPTY-FIELD is null or `mon:string-empty-p' return nil.~%~@
If EMPTY-FIELD is `cl:stringp' return EMPTY-FIELD, else signal an error unless
keyword W-NO-ERROR is non-nil in which case do not signal an error and return
as if by `cl:values' first value is EMPTY-FIELD second is its `cl:type-of'.~%~@
:EXAMPLE~%~@
 (field-convert-empty-string-nil nil)~%
 (field-convert-empty-string-nil "")~%
 \(field-convert-empty-string-nil \"bubba\"\)~%
 (field-convert-empty-string-nil t)~%
 (field-convert-empty-string-nil t :w-no-error t)~%
 (field-convert-empty-string-nil t :w-no-error t)~%~@
:SEE-ALSO `dbc:field-convert-1-0-x', `dbc:field-convert-1-0-x-empty',
`dbc:field-convert-1-0-x-empty-known', `dbc:field-convert-verify-string',
`dbc:field-convert-empty-string-nil', `dbc:field-cln-x'.~%▶▶▶")

(fundoc 'field-name-convert-field-name
"If FIELD-VALUE is null or `cl:string-equal' FIELD-NAME return nil, else FIELD-VALUE.~%~@
FIELD-NAME is a string.
FIELD-VALUE is some sort of object.
:EXAMPLE~%
 \(field-name-convert-field-name \"field_name\" \"not the same\"\)~%
 \(field-name-convert-field-name \"field_name\" \"field_name\"\)~%
 \(field-name-convert-field-name \"field_name\" \"FIELD_NAME\"\)~%
 \(field-name-convert-field-name \"field_name\" \"FIELD_NAME   \"\)~%
 \(field-name-convert-field-name \"field_name\" \"   fieLd_Name\"\)~%
 \(field-name-convert-field-name \"field_name\" nil\)~%
 \(field-name-convert-field-name \"field_name\" 8\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")


;;; ==============================
;;; :DBC-XML-SQL-PARSE-DOCUMENTATION
;;;  dbc-parse/dbc-xml-sql-parse.lisp
;;; ==============================

(fundoc 'with-namespaces
"Evalute BODY form with the namespace BINDINGS provided.~%~@
Convenience macro to reduce nesting of CXML:WITH-NAMESPACE forms.~%~@
:SYNTAX~%
 with-namespaces \({\(<PREFIX> <URI>\)}*\) <FORM>* => <RESULT>~%
 - <PREFIX> -- a namespace prefix \(a string\)
 - <URI>    -- a string denoting a URI
 - <FORM>   -- a form \(evaluated at runtime\)
 - <RESULT> -- the result of evaluating forms~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `with-soap-envelope'.~%▶▶▶")

(fundoc 'with-soap-envelope
  ":NOTE This macro is defined as an example implementation and exists for example purposes only.~%~@
Evalute BODY forms within the wrapped context of `cxml:with-xml-output' with XML SOAP namespaces bindings active.~%~@
PREFIX is bound to the SOAP envelope prefix i.e.:~%
 \"http://schemas.xmlsoap.org/soap/envelope/\"~%~@
Any other namespace BINDINGS provided are also in effect.~%~@
BODY forms are evaluated within two `cxml:with-element's wrapping forms, these are:~%
 - SOAP \"Envelope\"
 - SOAP \"Body\"~%~@
Return valuu is a `cxml:rod' \(probably a string\).~%~@
:SYNTAX~%
 with-soap-envelope (<SOAP-PREFIX> {(<PREFIX> <URI>)}*) <BODY>* => <ENVELOPE>
 - <SOAP-PREFIX>, <prefix> -- namespace abbreviations/prefixes
 - <URI> --- string denoting a URI
 - <BODY> --- body forms
 - <ENVELOPE> --- a CXML:ROD \(probably a string\)~%~@
:EXAMPLE~%
 \(with-soap-envelope
     \(\"env\" \(\"foo\" \"http://foo.example.org\"\)
            \(\"bar\" \"http://bar.example.org\"\)\)
   \(cxml:with-element* \(\"foo\" \"a\"\)
     \(cxml:with-element* \(\"bar\" \"b\"\)
       \(cxml:text \"Text Content\"\)\)\)\)~%
 |=> \"<?xml version=\"1.0\" encoding=\"UTF-8\"?>
 |     <env:Envelope xmlns:env=\"http://schemas.xmlsoap.org/soap/envelope/\"
 |                   xmlns:foo=\"http://foo.example.org\"
 |                   xmlns:bar=\"http://bar.example.org\">
 |       <env:Body>
 |         <foo:a>
 |           <bar:b>Text Content</bar:b>
 |         </foo:a>
 |       </env:Body>
 |     </env:Envelope>\"~%~@
:SEE-ALSO `with-namespaces'.~%▶▶▶")

(fundoc 'start-element-p
        "Whether current-event is :END-ELEMENT.~%~@
 Return as if by `cl:values':~%
  - <BOOLEAN>
  - the current element \(if any\)~%~@
:SEE-ALSO `start-element-and-attribute-value-present-p', `end-element-p',
`end-element-and-local-present-p'.~%▶▶▶")

(fundoc 'end-element-p
"Whether current-event is :END-ELEMENT.~%~@
Return as if by `cl:values':~%
 - <BOOLEAN>
 - the current element \(if any\)~%~@
:SEE-ALSO `end-element-and-local-present-p',
`start-element-and-attribute-value-present-p', `start-element-p'.~%▶▶▶")

(fundoc 'end-element-and-local-present-p
"Whether current-event is :END-ELEMENT and its lname is `cl:string=' ELEMENT-EXPECT.~%~@
ELEMENT-EXPECT is a string. Default is \"row\".~%~@
:EXAMPLE~%
 \(end-element-and-local-present-p <SOURCE>\)
 \(end-element-and-local-present-p *tt-source* :element-expect \"field\"\)~%~@
:SEE-ALSO `end-element-p', `start-element-p',
`start-element-and-attribute-value-present-p'.~%▶▶▶")

(fundoc 'field-attribs-find
"Return => \":YEAR\"~%~@
Keyword ATTRIB-NAMES is an object holding a string(s) each of which is a valid
value for an element's name attribute, e.g.:~%
 <field name=\"<ATTRIB-NAME>\"> ... STUFF ... </field>~%~@
:NOTE Keyword ATTRIB-NAMES is normalized with `field-attribs-find-normalize-names'.~%~@
:SEE-ALSO `field-attribs-consume-if', `klacks:list-attributes', `klacks:get-attribute'.")

(fundoc 'field-attribs-consume-if
"Return => \(\":YEAR\" . \"August, 10, 1895\"\)~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `field-attribs-find'.~%▶▶▶")

(fundoc 'peek-skipping-comments
 "Like `klacks:peek' except that if next event from source is :COMMENTS, the event is consumed.~%~@
The `cl:values' of the first non-comment event are returned \(un-consumed\).~%~@
SOURCE is a `cxml:source'.~%
:SEE-ALSO `consume-whitespace'.~%▶▶▶")

(fundoc 'xml-whitespace-p
  "Return a boolean, true if string satisfies `mon:string-null-empty-or-all-whitespace-p'.~%~@
STRING is a string-designator.
Helper function for `consume-whitespace'.
:SEE-ALSO `<XREF>'.~%▶▶▶")

(fundoc 'consume-whitespace
  "Consume :CHARACTERS events of SOURCE if associated string satisfies `xml-whitespace-p'.~%~@
Return as if by `cl:values':
 - nth-value 0 is a boolean indicating whether `klacks:consume' was invoked with SOURCE
 - nth-value 1 is a list of the event types consumed \(if any\)~%~@
SOURCE is a cxml source.~%~@
Keywords :COMMENT :DTD :START-DOCUMENT are booleans.~%~@
When true \(the default\) these indicate that their corresponding XML event
types should be consumed of as well.~%
:EXAMPLE
 \(klacks:with-open-source \(s \(cxml:make-source 
                              \"<row name=\\\"row\\\"><!-- bubba  --> <!-- bubba2  --></row>\"\)\)
   \(list 
    :peek \(multiple-value-list \(klacks:peek s\)\)
    :consume-whitespace \(consume-whitespace s\)
    :consume \(multiple-value-list \(klacks:consume s\)\)
    :peek-next \(multiple-value-list \(klacks:peek-next s\)\)
    :consume-whitespace \(multiple-value-list \(consume-whitespace s\)\)
    :peek \(multiple-value-list \(klacks:peek s\)\)
    :consume-whitespace \(multiple-value-list \(consume-whitespace s\)\)
    \)\)
:SEE-ALSO `peek-skipping-comments'.~%▶▶▶")

(fundoc  'field-table-parse-out
  "Return parsed results for MySQL xml dump file SQL-XML-DMP.~%
SQL-XML-DMP becomes a source as if by `klacks:with-open-source'.~%
It is a pathname or variable suitable for use with `cxml:make-source' e.g.:~%
 #P\"/some/file/pathname.xml\"~%
For each XML `<row>` element event convert each `<field>` event with attribute
`name` to a lispy keyword/value pair where a field element event has the form:~%
 <field name=\"`attribute_name`\">`field-value`</field>~%
return:~%
 :FIELD-NAME field-value~%
:SEE-ALSO `field-table-parse-out', `field-str-cons', `field-cln-x'.~%▶▶▶")

(fundoc 'field-parse-attribs
"Map the attributes of the current klacks event.~%~@
CURR-SRC is a klacks-source as per return value of `cxml:make-source'.~%~@
The current klacks event should be `:START-EVENT`, e.g.:~%
\(values \(klacks:peek CURR-SRC\)\)~%~@
 => :START-EVENT~%~@
If so retrun value is a list of elements each the form:~%
 \(\(:NAMESPACE-URI . <BOOLEAN>\)
  \(:LOCAL-NAME    . \"<LOCAL-NAME>\"\)
  \(:QNAME         . \"QNAME\"\)
  \(:VALUE         . \"<VALUE>\"\)
  \(:SPECIFIED-P   . <BOOLEAN>\)\)~%~@
:EXAMPLE~%
 \(klacks:with-open-source 
     \(s \(cxml:make-source \"<field name=\\\"name 1\\\" name2=\\\"name 2\\\" name3=\\\"\\\">10</field>\"\)\) 
   \(klacks:find-element s \"field\"\)
   \(field-parse-attribs s\)\)~%
 \(klacks:with-open-source 
     \(s \(cxml:make-source \"<field name=\\\"name 1\\\" name2=\\\"name 2\\\" name3=\\\"\\\">10</field>\"\)\) 
   \(klacks:find-element s \"field\"\)
   \(klacks:list-attributes s\)\)~%~@
:NOTE Like `klacks:list-attributes' but does not returns a list of conses
instead of structure object.~%~@
:SEE-ALSO `klacks:map-attributes'.~%▶▶▶")

(fundoc 'field-attribs-find-normalize-names
"Convert ENUMERATED-ATTRIB-NAMES to a list of strings.~%~@
Helper function for `dbc:field-attribs-find'.~%~@
ENUMERATED-ATTRIB-NAMES is an object of type:~%
 list string vector hash-table~%
When object is of type `cl:hash-table' return value is a list of its keys.~%
Signal an error if not.~%~@
When elts of ENUMERATED-ATTRIB-NAMES do not satisfy
`mon:string-not-null-empty-or-all-whitespace-p' they will be removed as if by
`cl:remove-if-not' from return value.~%
:EXAMPLE~%
 \(field-attribs-find-normalize-names \"ref\"\)~%
 \(field-attribs-find-normalize-names \"\"\)~%
 \(field-attribs-find-normalize-names *xml-refs-match-table*\)~%
 \(field-attribs-find-normalize-names '\(\"ref\" \"price\" \"year\" \"artist\" \"condition\"\)\)~%
 \(field-attribs-find-normalize-names  '\(\"ref\" nil \"price\" 8 \"year\" \"\" \"artist\" \"condition\"\)\)~%
 \(field-attribs-find-normalize-names  #\(\"ref\" \"price\" \"year\" \"artist\" \"condition\"\)\)~%
 \(field-attribs-find-normalize-names  #\(\"ref\" nil \"price\" 8 \"year\" \"\" \"artist\" \"condition\"\)\)~%
:SEE-ALSO `mon:hash-get-keys'.~%▶▶▶")

(fundoc 'start-element-and-attribute-present-p
"Whether current klacks event has an attribute with value matching ATTRIB-EXPECT.~%~@
Return ATTRIB-EXPECT when following constraints are met:~%
 - current event is :start-element~%
 - value of its `klacks:current-lname' matches ELEMENT-LOCAL~%
 - value of `klacks:get-attribute' for ATTRIB-LOCAL is `cl:string=' ATTRIB-EXPECT~%~@
Arg SOURCE is the current cxml-source being parsed.
It is an object suitable for use an argument to `klacks:peek'.~%~@
Keyword ELEMENT-LOCAL default is a string naming an elments lname \(Local Name\).
Default is \"field\".~%~@
Keyword ATTRIB-LOCAL is a string naming an attribute of element. 
Default is \"name\".~%~@
Keyword ATTRIB-EXPECT is a string naming an attribute value expected.~%~@
:EXAMPLE~%
 \(klacks:with-open-source \(s \(cxml:make-source \"<field name=\\\"ref\\\">2766</field>\"\)\)
   \(klacks:find-event s :start-element\) ;; :NOTE Usage of `klacks:find-event' ;
   \(start-element-and-attribute-present-p s
                                          :element-local \"field\" 
                                          :attrib-local \"name\"
                                          :attrib-expect \"ref\"\)\)~%
 \(klacks:with-open-source \(s \(cxml:make-source \"<field name=\\\"ref\\\">2766</field>\"\)\)
   \(start-element-and-attribute-present-p s
                                          :element-local \"field\" 
                                          :attrib-local \"name\"
                                          :attrib-expect \"ref\"\)\)~%~@
:SEE-ALSO `start-element-and-attribute-value-present-p'.~%▶▶▶")

;;; 
;; (fundoc 'start-element-and-attribute-value-present-p
;; "Like `start-element-and-attribute-present-p' but also checks that
;; ATTRIB-LOCAL's value is `cl:string=' ATTRIB-EXPECT.~%~@
;; Return as if by cl:values:
;;  - <BOOLEAN> T when ATTRIB-EXPECT matched ATTRIB-LOCAL's value~%~@
;;  - [ ATTRIB-EXPECT | <WHAT-WAS-FOUND> ]~%~@
;; :EXAMPLE~%~@
;;  \(klacks:with-open-source \(s \(cxml:make-source \"<field name=\\\"ref\\\">2766</field>\"\)\)
;;    \(klacks:find-event s :start-element\)
;;    \(start-element-and-attribute-value-present-p s
;;                                           :element-local \"field\" 
;;                                           :attrib-local \"name\"
;;                                           :attrib-expect \"ref\"\)\)~%~@
;;  \(klacks:with-open-source \(s \(cxml:make-source \"<field name=\\\"ref\\\">2766</field>\"\)\)
;;    \(klacks:find-event s :start-element\)
;;    \(start-element-and-attribute-value-present-p s
;;                                           :element-local \"field\" 
;;                                           :attrib-local \"name\"
;;                                           :attrib-expect \"not-ref\"\)\)~%
;; :SEE-ALSO `<XREF>'.~%▶▶▶")

(fundoc 'end-document-find-and-close
"Find SOURCE's :end-document event (if any) with `klacks:find-event'.~%~@
If event is found consume it with `klacks:consume' and evaluate
`klacks:close-source' making sure that source is close.~%~@
Return value when source is closed. is as if by the form: (values) e.g.:~%
 => ; No value 
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")


;;; ==============================
;; dbc-specific/dbc-parse/dbc-xml-parse-sax.lisp
;;; ==============================

(vardoc '*parsed-data-current-state*
"Holds the current parsing state related to the parse of an XML document.~%~@
State held by instances of class `%parsed-data-state'.~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

(fundoc 'write-sax-parsed-delimiter 
"Write a commented delimiter line to OUTPUT-STREAM.
Commented delimiter is written as a `cl:fresh-line' followed by a string of
68 #\\; characters followed by a newline.
:SEE-ALSO `dbc-sax-current-chars-clear', `dbc-sax-current-chars-reset',
`dbc-sax-current-chars', `dbc-sax-handler', `write-sax-parsed-delimiter',
`write-sax-parsed-xml-row-to-file', `load-sax-parsed-xml-file-to-parsed-class-hash',
`*parsed-data-current-state*', `*xml-input-dir*', `*xml-output-dir*'.~%▶▶▶")

(fundoc 'make-parsed-class-output-directory-ensuring-pathname
"Return a directory for use when outputting parsed xml files.~%
If PATHNAME-SUB-DIRECTORY does not exist in PATHNAME-BASE-DIRECTORY it is created as if by `cl:ensure-directories-exist'.~%
If PATHNAME-BASE-DIRECTORY does not satisfy `osicat:directory-exists-p' an error is signaled.~%
:EXAMPLE~%
 \(make-parsed-class-output-directory-ensuring-pathname :pathname-sub-directory \"new-sax-parser\" 
                                                        :pathname-base-directory \(sub-path *xml-output-dir*\)\)~%
:SEE-ALSO `make-parsed-class-output-directory-ensuring-pathname'.~%▶▶▶")

(fundoc 'make-parsed-class-output-file-ensuring-pathname
"Return a pathname suitable for use as the OUTPUT-FILE arg to `write-sax-parsed-xml-to-file'.~%~@
Any directory components specified by PATHNAME-SUB-DIRECTORY which do not exist
relative to PATHNAME-BASE-DIRECTORY will be created as if by `cl:ensure-directories-exist'.~%~@
Keyword arg PATHNAME-NAME is a string designating a cl:pathname-name.
Default is \"parsed-xml\".~%~@
Keyword arg PATHNAME-NAME-DATED-P is a boolean indicating whether to append a date to PATHNAME-NAME.
The default is to append a timestamp as per `mon:time-string-yyyy-mm-dd'.~%~@
Keyword arg PATHNAME-TYPE <TYPE> - A cl:pathname-type. Default is \"lisp\".~%~@
Keyword arg PATHNAME-SUB-DIRECTORY A string or list of strings designating a subdir pathname relative to PATHNAME-BASE-DIRECTORY.~%~@
Defalut is return value of of:~% \(sub-name *xml-output-dir*\)~%~@
Keyword arg PATHNAME-BASE-DIRECTORY is a an object of type `mon:pathname-or-namestring'.
It should name an existing directory, an error is signaled if not.~%~@
:EXAMPLE~%
 \(%make-default-parsed-output-pathname :pathname-name \"bubba\" \)~%
 \(%make-default-parsed-output-pathname :pathname-name \"bubba\" :pathname-name-dated-p nil\)~%
:SEE-ALSO `make-parsed-class-output-directory-ensuring-pathname'.~%▶▶▶")

(fundoc 'write-sax-parsed-xml-to-file
        "Parse the dbc XML refs in INPUT-FILE and write thier lispy counterparts to OUTPUT-FILE.~%~@
For duration of body the variable `*parsed-data-output-stream*' is bound to an open output-stream.~%~@
INPUT-FILE is a is a pathspec satisfying `mon:pathname-or-namestring' and should name an existing file.~%~@
OUTPUT-FILE to write parsed XML data to. When keyword arg OUTPUT-FILE is of
pathname or namestring it should satisfy `mon:pathname-or-namestring-not-empty-dotted-or-wild-p',
an error is signaled if not. When keyword arg OUTPUT-FILE is a list is has the form:~%
 \(:pathname-name <NAME>
  :pathname-name-dated-p <BOOLEAN>
  :pathname-type <TYPE>
  :pathname-sub-directory [<STRING> | <LIST OF STRINGS>]
  :pathname-base-directory [<PATHNAME> | <NAMESTRING>]\)~%~@
where each property of list is a keyword/value argument to `make-parsed-class-output-file-ensuring-pathname'.~%~@
:EXAMPLE~%
 \(write-sax-parsed-xml-to-file\)~%
 \(write-sax-parsed-xml-to-file
  :input-file  \(merge-pathnames \(make-pathname :name \"dump-themes-DUMPING\"\)
                                \(sub-path *xml-input-dir*\)\)
  :output-file \(merge-pathnames 
                \(make-pathname :directory `\(:relative ,(sub-name *xml-output-dir*\)\)
                               :name \(concatenate 'string \"sax-themes-test-\" \(mon:time-string-yyyy-mm-dd\)\)
                               :type \"lisp\"\)
                \(system-path *system-path*\)\)\)~%~@
The parsed file can be loaded into a hash-table with `load-sax-parsed-xml-file-to-parsed-class-hash'.~%~@
:SEE-ALSO `write-sax-parsed-slots-to-file',
`write-sax-parsed-class-hash-to-files', `print-sax-parsed-slots',
`load-sax-parsed-xml-file-to-parsed-class-hash',
`%ensure-dated-parsed-directory', `write-sax-parsed-xml-row-to-file'.")

(fundoc 'write-sax-parsed-xml-row-to-file
        "Write current XML row data of slot-value FIELD-DATA of class `dbc-sax-parsing-class' to OUTPUT-STREAM.~%~@
Current XML row data is comprised of all the <field> elements data encounered
inside an XML <row> element where a <row> has the form:~%~
 <row>
 <field name=\"<NAME>\"><FIELD-VALUE></field>
  ... 
 <field name=\"<NAME>\"><FIELD-VALUE></field>
 </row>~%~@
While parsing the current instance of class `dbc-sax-parsing-class' is held by
variable `*parsed-data-current-row*'.~%~@
:SEE-ALSO `dbc-sax-current-chars-clear', `dbc-sax-current-chars-reset',
`dbc-sax-current-chars', `dbc-sax-handler', `write-sax-parsed-delimiter',
`write-sax-parsed-xml-row-to-file', `write-sax-parsed-slots-to-file',
`write-sax-parsed-class-hash-to-files', `print-sax-parsed-slots',
`load-sax-parsed-xml-file-to-parsed-class-hash',
`%ensure-dated-parsed-directory', `*parsed-data-current-state*', `*xml-input-dir*',
`*xml-output-dir*'.~%▶▶▶")



;;; ==============================
;; dbc-specific/dbc-classes/dbc-class-parsed-convert.lisp
;;; ==============================

;; Finding the appropriate SLOT-DISPATCH-FUNCTION:
;; (let ((obj (make-instance 'parsed-inventory-record)))
;;   (setf (inventory-number obj) "88")
;;   (funcall (fdefinition (field-to-accessor-mapping "ref" 'parsed-inventory-record)) obj))
;;
(typedoc 'control-id-indexed-number-for-zero-padded-string-integer-range
         "The valid range of positive integers which can succesfully be converted to a zero-padded string.~%~@
An integer in the range [1,99999].~%
For use with method `control-id-indexed-number-zero-padded-string' specialized on integers.~%~@
:EXAMPLE~%
 \(typep 000001 'control-id-indexed-number-for-zero-padded-string-integer-range\)~%
 \(typep 099999 'control-id-indexed-number-for-zero-padded-string-integer-range\)~%
 \(null \(typep 100000 'control-id-indexed-number-for-zero-padded-string-integer-range\)\)~%
 \(null \(typep 000000 'control-id-indexed-number-for-zero-padded-string-integer-range\)\)~%~@
:SEE-ALSO `every-digit-char-p', `notevery-digit-char-p'.~%▶▶▶")

(typedoc 'control-id-indexed-number-for-zero-padded-string-integer-string-length
         "The valid length of a string representing an integer of type ~
`control-id-indexed-number-for-zero-padded-string-integer-range'.~%~@
An integer in the range [1,6].~%
For use with method `control-id-indexed-number-zero-padded-string' specialized on strings.~%~@
:EXAMPLE~%
 \(typep 1 'control-id-indexed-number-for-zero-padded-string-integer-string-length\)~%
 \(typep 6 'control-id-indexed-number-for-zero-padded-string-integer-string-length\)~%
 \(null \(typep 0 'control-id-indexed-number-for-zero-padded-string-integer-string-length\)\)~%
 \(null \(typep 7 'control-id-indexed-number-for-zero-padded-string-integer-string-length\)\)~%~@
:SEE-ALSO `every-digit-char-p', `notevery-digit-char-p'.~%▶▶▶")

(fundoc 'control-id-indexed-number-for-zero-padded-string-integer-range-validate
        "Return MAYBE-VALID-INTEGER if it is of type `control-id-indexed-number-for-zero-padded-string-integer-range'.~%~@
Signal an error if not.~%~@
:EXAMPLE~%
 \(control-id-indexed-number-for-zero-padded-string-integer-range-validate 8\)~%
 \(control-id-indexed-number-for-zero-padded-string-integer-range-validate \"foo\"\)~%~@
:SEE-ALSO `control-id-indexed-number-for-zero-padded-string',
`control-id-indexed-number-for-zero-padded-string-integer-string-length-validate',
`control-id-indexed-number-for-zero-padded-string-integer-range-validate',
`control-id-indexed-number-for-zero-padded-string-integer-range',
`control-id-indexed-number-for-zero-padded-string-integer-string-length'.~%▶▶▶")

(fundoc 'control-id-indexed-number-for-zero-padded-string-integer-string-length-validate
"Return STRING-LENGTH if it is of type `control-id-indexed-number-for-zero-padded-string-length'.~%~@
Signal an error if not.~%~@
:EXAMPLE~%
 \(control-id-indexed-number-for-zero-padded-string-integer-string-length-validate \"000113\" 6\)~%
 \(control-id-indexed-number-for-zero-padded-string-integer-string-length-validate \"0000113\" 7\)~%~@
:SEE-ALSO `control-id-indexed-number-for-zero-padded-string',
`control-id-indexed-number-for-zero-padded-string-integer-string-length-validate',
`control-id-indexed-number-for-zero-padded-string-integer-range-validate',
`control-id-indexed-number-for-zero-padded-string-integer-range',
`control-id-indexed-number-for-zero-padded-string-integer-string-length'.~%▶▶▶")

(generic-doc #'control-id-indexed-number-zero-padded-string
             "Convert INTEGER-OR-STRING to a zero-padded string of length 6.~%
INTEGER-OR-STRING is a positive integer or a string.~%
When INTEGER-OR-STRING is an integer it should be of type 
`control-id-indexed-number-for-zero-padded-string-integer-range' an error is signaled if not.~%
When INTEGER-OR-STRING is string an error is signalled if it does not satisfy
the following constraints:~%
 - it should not be cl:string= \"0\"
 - it should have a length of type `control-id-indexed-number-for-zero-padded-string-integer-string-length' 
 - it should have a `cl:parse-integer' representation of type `control-id-indexed-number-for-zero-padded-string-integer-range'~%")

(method-doc #'control-id-indexed-number-zero-padded-string nil '(null)
"~%An error is signaled.~%~@
:EXAMPLE~%
 \(control-id-indexed-number-zero-padded-string nil\)~%")

(method-doc #'control-id-indexed-number-zero-padded-string nil '(list)
"~%An error is signaled.~%~@
:EXAMPLE~%
 \(control-id-indexed-number-zero-padded-string \(list nil\)\)~%")

(method-doc #'control-id-indexed-number-zero-padded-string nil '(symbol)
            "~%An error is signaled.~%~@
:EXAMPLE~%
 \(control-id-indexed-number-zero-padded-string 'foo\)~%
 \(control-id-indexed-number-zero-padded-string t\)~%")

(method-doc #'control-id-indexed-number-zero-padded-string nil '(integer)
"~%:EXAMPLE~%
 \(control-id-indexed-number-zero-padded-string 1\)~%
 \(control-id-indexed-number-zero-padded-string 42\)~%
 \(control-id-indexed-number-zero-padded-string 111\)~%
 \(control-id-indexed-number-zero-padded-string 1111\)~%
 \(control-id-indexed-number-zero-padded-string 99999\)~%
 \(control-id-indexed-number-zero-padded-string 5432\)~%~@
Following fail successfully:~%
 \(control-id-indexed-number-zero-padded-string 0\)~%
 \(control-id-indexed-number-zero-padded-string -1\)~%
 \(control-id-indexed-number-zero-padded-string 100000\)~%")

(method-doc #'control-id-indexed-number-zero-padded-string nil '(string)
"~%:EXAMPLE~%
 \(control-id-indexed-number-zero-padded-string \"99999\"\)~%
 \(control-id-indexed-number-zero-padded-string \"010000\"\)~%
 \(control-id-indexed-number-zero-padded-string \"10000\"\)~%
 \(control-id-indexed-number-zero-padded-string \"1\"\)~%
 \(control-id-indexed-number-zero-padded-string \"12\"\)~%
 \(control-id-indexed-number-zero-padded-string \"123\"\)~%
 \(control-id-indexed-number-zero-padded-string \"1234\"\)~%
 \(control-id-indexed-number-zero-padded-string \"12345\"\)~%~@
Following fail successfully:~%
 \(control-id-indexed-number-zero-padded-string \"100000\"\)~%
 \(control-id-indexed-number-zero-padded-string \"0\"\)~%
 \(control-id-indexed-number-zero-padded-string \"00\"\)~%
 \(control-id-indexed-number-zero-padded-string \"000\"\)~%
 \(control-id-indexed-number-zero-padded-string \"0000\"\)~%
 \(control-id-indexed-number-zero-padded-string \"00000\"\)~%
 \(control-id-indexed-number-zero-padded-string \"000000\"\)~%
 \(control-id-indexed-number-zero-padded-string \"\"\)~%")

(method-doc #'control-id-indexed-number-zero-padded-string nil '(parsed-inventory-record)
"~%:EXAMPLE~%
 \(control-id-indexed-number-zero-padded-string 
  \(make-instance 'parsed-inventory-record :inventory-number 42\)\)~%
 \(control-id-indexed-number-zero-padded-string 
  \(make-instance 'parsed-inventory-record :inventory-number \"42\"\)\)~%
 \(control-id-indexed-number-zero-padded-string 
  \(parsed-class-parse-table-lookup 'parsed-inventory-record \"3566\"\)\)~%~@
Following errors successfully:~%
 \(control-id-indexed-number-zero-padded-string
  \(make-instance 'parsed-inventory-record\)\)~%")

(fundoc 'load-sax-parsed-xml-file-to-parsed-class-hash
"Arg PARSED-CLASS a symbol designating the class we are parsing.~%~@
Arg INPUT-FILE the file containing field/value consed pairs.~%
Arg HASH-TABLE the hash-table to insert the class object to.
Its `cl:hash-table-test' should be appropriate for use with the type of
return value of KEY-ACCESSOR, e.g. if KEY-ACCESSOR returns a string the
`cl:hash-table-test' should be `cl:equal' or `cl:equalp'. Whereas, if
KEY-ACCESSOR returns a symbol then `cl:eql' will suffice.~%~@
Arg KEY-ACCESSOR names an accessor function which returns the primary key for
the parsed table it return value will becomes a hash-table KEY associating
PARSED-CLASS in HASH-TABLE.  As such, it should return always return a non-null
value.  The results are undefined if not.~%~@
Arg SLOT-DISPATCH-FUNCTION is a function utilizing `string-case:string-case'
to map strings to an appropriate accesor e.g. `set-parsed-artist-record-slot-value',
`set-parsed-inventory-record-slot-value', etc.~%
The SLOT-DISPATCH-FUNCTION functions are normally defined at loadtime with
the `def-set-parsed-class-record-slot-value' macro, e.g. with:~%
 \(def-set-parsed-class-record-slot-value set-parsed-inventory-record-slot-value parsed-inventory-record\)~%~@
:EXAMPLE~%
 \(defparameter *tt--parse-table* \(make-hash-table :test 'equal\)\)~%
 \(let \(\(parsed-sax-file \(merge-pathnames 
                        \(make-pathname :directory `\(:relative ,\(sub-name *xml-output-dir*\)\)
                                       :name \(concatenate 'string \"sax-refs-test-\" \(mon:time-string-yyyy-mm-dd\)\)
                                       :type \"lisp\"\)
                        \(system-path *system-path*\)\)\)\)
  \(write-sax-parsed-xml-to-file
   :input-file  \(merge-pathnames \(make-pathname :name \"dump-refs-DUMPING\"\)
                                 \(sub-path *xml-input-dir*\)\)
   :output-file parsed-sax-file\)
  \(load-sax-parsed-xml-file-to-parsed-class-hash :parsed-class 'parsed-inventory-record  
                                                 :input-file parsed-sax-file
                                                 :hash-table  *tt--parse-table*
                                                 :key-accessor  #'item-number
                                                 :slot-dispatch-function #'set-parsed-inventory-record-slot-value\)\)~%
 ;; => #<HASH-TABLE  ... >, 8969~%
 \(clrhash *tt--parse-table*\)~%
:NOTE For use with output of `write-sax-parsed-xml-refs-file'.~%~@
:SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-slots',
`write-sax-parsed-slots-to-file', `write-sax-parsed-class-hash-to-files'.~%▶▶▶")

(fundoc 'print-sax-parsed-slots-padding-format-control
"Return a format-control string for printing the slots of OBJECT with
padding adjusted according to the longest symbol-name of its slots.~%~@
Helper function for use with `print-sax-parsed-slots',
`write-sax-parsed-slots-to-file', and `write-sax-parsed-class-hash-to-files'.~%~@
:EXAMPLE~%
 \(print-sax-parsed-slots-padding-format-control \(make-instance 'parsed-inventory-record\)\)~%~@
:SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-slots',
`write-sax-parsed-slots-to-file', `write-sax-parsed-class-hash-to-files'.~%▶▶▶")

(fundoc 'print-sax-parsed-slots
"Keyword PRINT-UNBOUND is a boolean.~%~@
When t \(the default\) and a slot of OJBECT's is not `cl:slot-boundp' print its
slot-value as \"#<UNBOUND>\".~%~@
When null and OJBECT's a slot is not `cl:slot-boundp' print its slot-value as NIL.~%~@
:NOTE The later is useful when serializing an object to a file b/c the
de-serialzed OBJECT will have its slot :initarg intialized to nil which is what
we've done elswhere for this class.~%~@
:SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-slots',
`write-sax-parsed-slots-to-file', `write-sax-parsed-class-hash-to-files',
`write-sax-parsed-inventory-record-hash-to-zero-padded-directory'.~%▶▶▶")

(fundoc 'write-sax-parsed-slots-to-file
"Write a list of the slot/value pairs of OBJECT to a file in OUTPUT-DIRECTORY.~%~@
Each slot/value pair is written in such a way that the list may be read and
passed to `cl:make-instance' to re-instantiate the instance.~%~@
Arg SLOT-FOR-FILE-NAME is a symbol, e.g. 'item-number, 'control-id-entity-num-artist, etc.
If it satisfies `cl:slot-exists-p', `cl:slot-boundp' and `cl:slot-value', it's
value is used as the suffix for a file name otherwise an error is signaled.~%~@
:NOTE When called outside the package \"DBC\" the symbol must be package
qualified, e.g. as DBC:INVENTORY-NUMBER.~%~@
Arg PREFIX-FOR-FILE-NAME is a string, e.g. \"inventory-number\", \"artist-enity-num\",
etc.  It is combined with `cl:slot-value' of SLOT-FOR-FILE-NAME when making a
pathname to write OBJECT to.  When a string is provided it should contain a
trailing #\\- if one is wanted. If PREFIX-FOR-FILE-NAME is null the `cl:string'
representation of the symbol SLOT-FOR-FILE-NAME is used instead. To override
this behaviour, i.e. to write a file without SLOT-FOR-FILE-NAME prepended use
the the empty string, e.g. \"\".~%~@
Arg SUFFIX-FOR-FILE-NAME is a string to append to the pathname name written to.
When a string is provided it should contain a leading #\\- if one is wanted.~%~@
When keyword SLOT-FOR-FILE-NAME-ZERO-PADDED is non-nil if slot-value of
SLOT-FOR-FILE-NAME is a positive integer or string representing one it will be
prepended with leading zeros such that it will have the form 0NNNNN. In either
case, the slot-value must not represent an integer larger than 99999 or a
warning is signalled and the file will not be written.~%~@
Keyword arg PRE-PADDED-FORMAT-CONTROL, if supplied, is used in lieu of return
value of `print-sax-parsed-slots-padding-format-control' with OBJECT as argument.~%~@
When keyword PRINT-UNBOUND is non-nil unbound slots of OBJECT are printed with
their slot-value as #<UNBOUND>.~%~@
:EXAMPLE~%
 \(write-sax-parsed-slots-to-file 
  <OBJECT>
  :slot-for-file-name 'inventory-number 
  :prefix-for-file-name \"bubba-\"
  :suffix-for-file-name \"-FOO\"
  :output-directory \(merge-pathnames #P\"individual-parse-refs-2011-10-01/\" \(sub-path *xml-output-dir*\)\)\)~%~@
:SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-slots',
`write-sax-parsed-slots-to-file', `write-sax-parsed-class-hash-to-files',
`write-sax-parsed-inventory-record-hash-to-zero-padded-directory'.~%▶▶▶")

(fundoc 'write-parsed-class-parse-table-to-file
        "Ouput as if by `write-sax-parsed-slots-to-file', but instead of writing an individual file
per object, dump the contents of a populated parsed-class-parse-table for
PARSED-CLASS to a single file such that the each object in the hash-table is written
as a plist of key/value pairs where each key is a keyword corresponding to a
slot-initarg for PARSED-CLASS.~%~@
:NOTE As compared to output of `write-sax-parsed-xml-to-file' there is an increase in
the overall size of the file written because each object contains a dedicated
plist of key/value pairs, so we are trading file size for human readability.~%~@
PARSED-CLASS is a symbol designating a subclass of parsed-class.~%~@
HASH-TABLE is a hash-table the hash-values of which are instance of PARSED-CASS.
When ommitted hash-table defaults to the return value of
`parsed-class-parse-table' for PARSED-CLASS. If provided each hash-value of
HASH-TABLE must be an instance of PARSED-CLASS, an error is signaled if not.~%~@
OUTPUT-SUB-DIRECTORY is a string or list of strings identifying any relative
pathname directory components beneath BASE-OUTPUT-DIRECTORY.~%~@
BASE-OUTPUT-DIRECTORY is a pathname designating the base directory beneath which
to write the file. It is merged with OUTPUT-SUB-DIRECTORY to generate directory
for the output file to be written. BASE-OUTPUT-DIRECTORY must satisfy
`cl:probe-file', an error is signaled if not.%~@
PATHNAME-TYPE is a string designating a cl:pathname-type. Default is \"pctd\".~%~@
:EXAMPLE~%
 { ... <EXAMPLE> ... } ~%~@
:NOTE The intendended functionality is different from
`write-sax-parsed-slots-to-file' in that where that function transforms an SQL
xml file to a lispy file for immediate loading to a hash-table this function is
intented to dump the contents of that hash-table subesequent to any editing of
the slot-values of the parsed-class such that we can persist the changes to a
lispy format and are not required to contintually parse the XML file and
therefor do not need to synchornize any changes made to the hash-table back to
the parsed-class' sql XML file.~%~@
:SEE-ALSO `write-sax-parsed-class-hash-to-files', `write-sax-parsed-slots-to-file',
`write-sax-parsed-xml-file', `parsed-inventory-record-xml-dump-file-and-hash',
`load-sax-parsed-xml-file-to-parsed-class-hash'.~%▶▶▶")

(fundoc 'def-parsed-class-write-parse-table-to-file
        "Return a function for writing contents of a `parsed-class-parse-table' to file as
if by `write-parsed-class-parse-table-to-file'.~%~@
DEFAULT-OUTPUT-PATHNAME-SUB-DIRECTORY is a string or list of strings identifying any relative
pathname directory components beneath DEFAULT-OUTPUT-PATHNAME-BASE-DIRECTORY. 
It is used as the default value for the OUTPUT-SUB-DIRECTORY parameter of the
returned function.~%~@
DEFAULT-OUTPUT-PATHNAME-BASE-DIRECTORY is a pathname identifying any relative
pathname directory components beneath DEFAULT-OUTPUT-PATHNAME-BASE-DIRECTORY.~%~@
DEFAULT-OUTPUT-PATHNAME-BASE-DIRECTORY is a pathname designating the base
directory beneath which to write the file. It is used as the default value for
the BASE-OUTPUT-DIRECTORY parameter of the returned function and will be merged
with the OUTPUT-SUB-DIRECTORY parameter of the returned function when generating
a directory pathname for its output file.~%~@
DEFAULT-PATHNAME-TYPE is a string designating what the the default
`cl:pathname-type' parameter will be for the returned function. Default is \"pctd\".~%~@
Return function has a `cl:symbol-name' with the format:~%
 WRITE-<PARSED-CLASS>-PARSE-TABLE-TO-FILE~%~@
For example, if argument for PARSED-CLASS is parsed-inventory-record the
returned function is `write-parsed-inventory-record-parse-table-to-file'.~%~@
:EXAMPLE~%
 \(macroexpand-1 
  '\(def-parsed-class-write-parse-table-to-file
    :parsed-class parsed-inventory-record
    :default-output-pathname-sub-directory \"parsed-inventory-record\"
    :default-output-pathname-base-directory \(merge-pathnames
                                             \(make-pathname :directory '\(:relative \"parsed-class-table-dumps\"\)\)
                                             \(sub-path *xml-output-dir*\)\)
    :default-pathname-type \"pctd\"\)\)~%~@
:SEE-ALSO `def-parsed-class-load-default-parsed-file-to-hash',
`def-parsed-class-record-xml-dump-file-and-hash',
`def-parsed-class-write-csv-file'.~%▶▶▶")

(fundoc 'load-parsed-class-default-file-to-hash-table
"Load the contents of INPUT-FILE to HASH-TABLE populating its hash-values with
instances of PARSED-CLASS using KEY-ACCESSOR as the hash-key.~%~@
:EXAMPLE~%~@
 { ... <EXAMPLE> ... } ~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

(fundoc 'def-parsed-class-load-default-parsed-file-to-hash
        "A wrapper macro around `load-parsed-class-default-file-to-hash-table'.~%~@
Return a function which loads the contents of parsed-class-parse-table from a file written
by a function returned by macro `def-parsed-class-write-parse-table-to-file'.~%~@
Returned function has a symbol-name with the format:~%
 load-\<PARSED-CLASS\>-default-file-to-parse-table~%
For example, if PARSED-CLASS is parsed-inventory-record returned function would
have the symbol name:~%
 load-parsed-inventory-record-default-file-to-parse-table~%~@
:EXAMPLE~%
  \(macroexpand-1
   '\(def-parsed-class-load-default-parsed-file-to-hash 
     :parsed-class parsed-inventory-record
     :default-key-accessor inventory-number
     :default-input-pathname-sub-directory \"parsed-inventory-record\"
     :default-input-pathname-base-directory \(default-input-pathname-base-directory
                                             \(merge-pathnames
                                              \(make-pathname :directory '\(:relative \"parsed-class-table-dumps\"\)\)
                                              \(dbc::sub-path dbc::*xml-output-dir*\)\)\)
     :default-pathname-type \"pctd\"\)\)~%~@
:SEE-ALSO `def-parsed-class-record-xml-dump-file-and-hash',
`def-parsed-class-write-csv-file'.~%▶▶▶")



;;; ==============================
;;; dbc-specific/dbc-classes/dbc-class-parsed-slot-value-equal.lisp
;;; ==============================

(generic-doc #'parsed-class-slot-value-equal
"Compare SLOT-VALUE-A SLOT-VALUE-B as if by cl:equal except when descending
compare strings as if by cl:string= and perform array comparison as follows:~%~% ~
- If an array is adjustable the other one must be as well;~%~% ~
- If an array has a fill-pointer the other one must as well and they~%   ~
must each have the same index;~%~% ~
- If either array is displaced-array we do not consider them to be equal.~%~@
- If SLOT-VALUE-A and SLOT-VALUE-B are the same array the array must satisfy the
  above constraints. That is, the array must not be a displaced-array.~%~@
:NOTE The above constraints around arrays have important consequences when
comparing hash-table's. When comparing two hashes (even if they are the same
hash) map descend every hash-value of each hash-table comparing it to itself and
return NIL if any array object encountered in the descent does not satisfy
`parsed-class-slot-value-equal'.~%~@
:NOTE This functionality is looseley modeled after the EQUALS cdr.
:SEE \(URL `http://cdr.eurolisp.org/document/8/cleqcmp.html'\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

(method-doc #'parsed-class-slot-value-equal nil '(null null)
"~%:EXAMPLE~%
 \(parsed-class-slot-value-equal nil nil\)~%")

(method-doc #'parsed-class-slot-value-equal nil '((eql t) (eql t))
"~%:EXAMPLE~%
 \(parsed-class-slot-value-equal t t\)~%")

(method-doc #'parsed-class-slot-value-equal nil '((eql t) null)
"~%:EXAMPLE~%
 \(parsed-class-slot-value-equal t nil\)~%")

(method-doc #'parsed-class-slot-value-equal nil '(null (eql t))
"~%:EXAMPLE~%
 \(parsed-class-slot-value-equal nil t\)~%")

(method-doc #'parsed-class-slot-value-equal nil '(character character)
"~%:EXAMPLE~%
 \(parsed-class-slot-value-equal #\\A #\\A\)~%
 \(parsed-class-slot-value-equal #\\A #\\a\)~%")

(method-doc #'parsed-class-slot-value-equal nil '(string string)
"~%:EXAMPLE~%
 \(parsed-class-slot-value-equal \"string\" \"string\"\)
 \(parsed-class-slot-value-equal \"string\" \"String\"\)~%")

(method-doc #'parsed-class-slot-value-equal nil '(cons cons)
"~%:EXAMPLE~%
 \(parsed-class-slot-value-equal nil \(\)\)~%
 \(parsed-class-slot-value-equal \(cons nil nil\) \(list nil\)\)~%
 \(parsed-class-slot-value-equal '\(a \(b\) \(c . d\)\) '\(a \(b\) \(c . d\)\)\)~%
 \(parsed-class-slot-value-equal '\(a b c . d\) '\(a b c . d\)\)~%
 \(parsed-class-slot-value-equal '\(a \(b\) \(c . d\)\) '\(a \(b\) \(c . D\)\)\)~%
 \(parsed-class-slot-value-equal '\(a \(b\) \(c . d\)\) '\(a \(b\) \(c . :D\)\)\)~%
 \(parsed-class-slot-value-equal '\(a \(b\) \(c . \"C\"\)\) '\(a \(b\) \(c . \"C\"\)\)\)~%
 \(parsed-class-slot-value-equal '\(a \(b\) \(c . \"C\"\)\) '\(a \(b\) \(c . \"c\"\)\)\)~%
 \(parsed-class-slot-value-equal '\(a \(b\) \(c . #\(\)\)\) '\(a \(b\) \(c . #\(\)\)\)\)~%
 \(parsed-class-slot-value-equal '\(a \(b\) \(c . #\(\)\)\) `\(a \(b\) \(c . ,\(make-array 0 :adjustable t\)\)\)\)~%")

(method-doc #'parsed-class-slot-value-equal nil '(hash-table hash-table)
"~%:EXAMPLE~%
 \(parsed-class-slot-value-equal \(make-hash-table\) \(make-hash-table\)\)~%
 \(parsed-class-slot-value-equal \(make-hash-table :test #'equal\) \(make-hash-table :test #'equal\)\)~%
 \(parsed-class-slot-value-equal \(make-hash-table :test #'equal\) \(make-hash-table :test #'eql\)\)~%
 \(let \(\(hta \(make-hash-table\)\)
       \(htb \(make-hash-table\)\)
       \(return-val '\(\)\)\)
   \(setf \(gethash 8 hta\) \"8\"
         \(gethash 8 htb\) \"8\"
         return-val \(parsed-class-slot-value-equal hta htb\)
         \(gethash 8 hta\) \"not-8\"
         return-val \(list return-val \(parsed-class-slot-value-equal hta htb\)\)
         \(gethash 8 hta\) \(make-array 0\)
         \(gethash 8 htb\) \(make-array 0\)
         return-val `\(,\(parsed-class-slot-value-equal hta htb\) ,@return-val\)
         \(gethash 8 hta\) \(make-array 2\)
         \(gethash 8 htb\) \(make-array 2 :fill-pointer 1\)
         return-val `\(,\(parsed-class-slot-value-equal hta htb\) ,@return-val\)
         \(gethash 8 hta\) \(make-hash-table\)
         \(gethash 8 htb\) \(make-hash-table\)
         return-val `\(,\(parsed-class-slot-value-equal hta htb\) ,@return-val\)
         \(gethash 9 \(gethash 8 hta\)\) \"9\"
         \(gethash 9 \(gethash 8 htb\)\) \"9\"
         return-val `\(,\(parsed-class-slot-value-equal hta htb\) ,@return-val\)
         \(gethash 9 \(gethash 8 hta\)\) \"not-9\"
         \(gethash 9 \(gethash 8 htb\)\) \"9\"
         return-val `\(,\(parsed-class-slot-value-equal hta htb\) ,@return-val\)\)
   \(remhash 8 hta\)
   \(setf return-val `\(,\(not \(parsed-class-slot-value-equal hta htb\)\) ,@return-val\)\)
   \(remhash 8 htb\)
   \(setf return-val `\(,\(parsed-class-slot-value-equal hta htb\) ,@return-val\)\)
   \(values \(equal '\(t t nil t t nil t t nil\) return-val\) return-val\)\)~%")

(method-doc #'parsed-class-slot-value-equal nil '(simple-vector simple-vector)
"~%:EXAMPLE~%
 \(parsed-class-slot-value-equal #\(\) #\(\)\)~%
 \(parsed-class-slot-value-equal #\(#\(\)\) #\(#\(\)\)\)~%
 \(parsed-class-slot-value-equal #\(#\(#\\a\)\) #\(#\(#\\a\)\)\)~%
 \(parsed-class-slot-value-equal #\(#\(#\\a\)\) #\(#\(#\\A\)\)\)~%")

(method-doc #'parsed-class-slot-value-equal nil '(bit-vector bit-vector)
"~%:EXAMPLE~%
 \(parsed-class-slot-value-equal #*010 #*010\)~%
 \(parsed-class-slot-value-equal \(make-array 3 :element-type 'bit :fill-pointer 1\)
                                \(make-array 3 :element-type 'bit :fill-pointer 1\)\)~%
 \(parsed-class-slot-value-equal \(make-array 3 :element-type 'bit :fill-pointer 1\)
                                \(make-array 3 :element-type 'bit :fill-pointer 2\)\)~%
 \(parsed-class-slot-value-equal \(make-array 3 :element-type 'bit :fill-pointer 3\)
                                #*000\)~%")

(method-doc #'parsed-class-slot-value-equal nil '(vector vector)
"~%:EXAMPLE~%
 \(parsed-class-slot-value-equal \(vector 2\) \(vector 2\)\)~%
 \(parsed-class-slot-value-equal
  \(make-array 1 :element-type '\(unsigned-byte 2\) :initial-contents '\(2\) :fill-pointer 1\)
  \(make-array 1 :element-type '\(unsigned-byte 2\) :initial-contents '\(2\) :fill-pointer 1\)\)~%
 \(parsed-class-slot-value-equal
  \(make-array 1 :element-type '\(unsigned-byte 2\) :initial-contents '\(2\) :fill-pointer 1\)
  \(make-array 1 :element-type '\(unsigned-byte 2\) :initial-contents '\(2\) :fill-pointer 0\)\)~%
 \(let* \(\(vec1 \(make-array 1 :element-type '\(unsigned-byte 2\) :initial-contents '\(2\) :fill-pointer 1\)\)
        \(vec2 \(make-array 1 :element-type '\(unsigned-byte 2\) :displaced-to vec1\)\)\)
   \(parsed-class-slot-value-equal vec1 vec2\)\)~%
 \(parsed-class-slot-value-equal
  \(make-array 1 :initial-contents '\(2\) :fill-pointer 1\)
  \(make-array 1 :element-type '\(unsigned-byte 2\) :initial-contents '\(2\) :fill-pointer 1\)\)~%
 \(parsed-class-slot-value-equal
  \(make-array 1 :initial-contents '\(2\) :adjustable t\)
  \(make-array 1 :element-type '\(unsigned-byte 2\) :initial-contents '\(2\) :fill-pointer 1\)\)~%
 \(parsed-class-slot-value-equal
  \(make-array 1 :initial-contents '\(2\) :adjustable t\)
  \(make-array 1 :element-type '\(unsigned-byte 2\) :initial-contents '\(2\)\)\)~%
 \(parsed-class-slot-value-equal
  \(make-array 1 :initial-contents '\(2\) :adjustable t\)
  \(make-array 1 :element-type '\(unsigned-byte 2\) :initial-contents '\(2\) :adjustable t\)\)~%")

(method-doc #'parsed-class-slot-value-equal nil '(array array)
"~%:EXAMPLE~%
 \(parsed-class-slot-value-equal \(make-array '\(2 2\)\) \(make-array '\(2 2\)\)\)~%
 \(parsed-class-slot-value-equal \(make-array '\(2 2\) :adjustable t\)
                                \(make-array '\(2 2\) :adjustable t\)\)~%
 \(parsed-class-slot-value-equal #2A\(\(1 2\) \(3 4\)\)
                                #2A\(\(1 2\) \(3 4\)\)\)~%
 \(parsed-class-slot-value-equal \(make-array '\(2 2\) :adjustable t\)
                                \(make-array '\(2 2\) :adjustable nil\)\)~%
 \(parsed-class-slot-value-equal #2A\(\(1 2\) \(3 4\) \(5 6\)\)
                                #2A\(\(1 2\) \(3 4\)\)\)~%
:NOTE In the following example when the local displaced var is an argument to
parsed-class-slot-value-equal the return value is never true:~%
 \(let \(\(not-displaced \(make-array '\(2 2\)
                                  :initial-contents '\(\(1 2\) \(3 4\)\)
                                  :adjustable t\)\)
       \(displaced \(make-array '\(2 2\)
                              :displaced-to \(vector 0 1 2 3 4\)
                              :displaced-index-offset 1
                              :adjustable t\)\)\)
   \(list \(%parsed-class-slot-value-equal-array-check not-displaced not-displaced\)
         \(%parsed-class-slot-value-equal-array-check displaced displaced\)
         \(parsed-class-slot-value-equal not-displaced not-displaced\)
         \(parsed-class-slot-value-equal displaced displaced\)
         \(parsed-class-slot-value-equal not-displaced displaced\)\)\)~%")


;;; ==============================
;; dbc-specific/dbc-classes/dbc-class-parsed-field-slot-mapping.lisp
;;; ==============================

(fundoc '%parsed-class-mapped-with-known-key-helper
"Return hash-table value for key PARSED-CLASS-SYMBOL in hash-table
`*parsed-class-field-slot-accessor-mapping-table*'.~%
Signal an error if PARSED-CLASS-SYMBOL is not present in hash-table.~%
:EXAMPLE~%
 \(%parsed-class-mapped-with-known-key-helper 'parsed-inventory-record\)~%
 \(%parsed-class-mapped-with-known-key-helper 'parsed-foo-record\)~%
 \(%parsed-class-mapped-with-known-key-helper \(%parsed-class-subtype-check 'parsed-inventory-record\)\)~%
 \(%parsed-class-mapped-with-known-key-helper \(%parsed-class-subtype-check \(make-instance 'parsed-inventory-record\)\)\)~%
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%")

(generic-doc #'%parsed-class-subtype-check
"Ensure arg PARSED-CLASS-OBJECT dereferences to a subclass of class `parsed-class'.~%~@
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%")

(method-doc #'%parsed-class-subtype-check nil '((eql parsed-class))
"~%:EXAMPLE~%
 \(%parsed-class-subtype-check 'parsed-inventory-record\)~%
Fails successfully:~%
 (%parsed-class-subtype-check  'parsed-class)~%")

(method-doc #'%parsed-class-subtype-check nil '(symbol)
"~%:EXAMPLE~%
 \(%parsed-class-subtype-check  'parsed-inventory-record\)~%
Fails successfully:~%
 \(%parsed-class-subtype-check  'parsed-foo-record\)~%")

(method-doc #'%parsed-class-subtype-check nil '(parsed-class)
"~%:EXAMPLE~%
 \(%parsed-class-subtype-check \(make-instance 'parsed-inventory-record\)\)~%
Fails successfully:~%
 \(%parsed-class-subtype-check \(make-instance 'parsed-class\)\)~%")

(generic-doc #'%parsed-class-slot-exists-for-parsed-class-check
"If SLOT-NAME is a valid slot for OBJECT return as if by cl:values OBJECT and
its `cl:fdefinition', else signal an error.~%
SLOT-NAME is a symbol~%
OBJECT is either a symbol, a subclass of the class `parsed-class', or an
instance of the class `parsed-class-field-slot-accessor-mapping'.~%
:NOTE When OBJECT or SLOT-NAME are symbols they may need to be package qualified when
invoked from outside the package DBC.~%
:SEE-ALSO `%parsed-class-subtype-check',
`parsed-class-parse-table-lookup-slot-value', `accessor-to-field-mapping',
`field-to-accessor-mapping', `field-to-accessor-table',
`accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%")

(method-doc #'%parsed-class-slot-exists-for-parsed-class-check nil '(parsed-class-field-slot-accessor-mapping symbol)
"~%:EXAMPLE~%
 \(%parsed-class-slot-exists-for-parsed-class-check \(parsed-class-mapped 'parsed-inventory-record\) 
                                                   'category-entity-0-coref\)~%
 \(%parsed-class-slot-exists-for-parsed-class-check \(parsed-class-mapped 'parsed-inventory-record\)
                                                   'dbc::category-entity-0-coref\)~%
Following fail successfully:~%
 \(%parsed-class-slot-exists-for-parsed-class-check \(parsed-class-mapped 'parsed-class\)
                                                   'category-entity-0-coref\)~%
 \(%parsed-class-slot-exists-for-parsed-class-check \(parsed-class-mapped 'parsed-inventory-record\)
                                                   'foo\)~%")

(method-doc #'%parsed-class-slot-exists-for-parsed-class-check nil '(parsed-class symbol)
"~%:EXAMPLE~%
\(%parsed-class-slot-exists-for-parsed-class-check \(make-instance 'parsed-inventory-record\) 
                                                  'category-entity-0-coref\)~%
\(%parsed-class-slot-exists-for-parsed-class-check \(make-instance 'parsed-inventory-record\) 
                                                  'dbc::category-entity-0-coref\)~%
Following fails successfully:~%
 \(%parsed-class-slot-exists-for-parsed-class-check \(make-instance 'parsed-inventory-record\) 
                                                   'foo\)~%")

(method-doc #'%parsed-class-slot-exists-for-parsed-class-check nil '(symbol symbol)
"~%:EXAMPLE~%
\(%parsed-class-slot-exists-for-parsed-class-check 'parsed-inventory-record 
                                                  'category-entity-0-coref\)~%
\(%parsed-class-slot-exists-for-parsed-class-check 'parsed-inventory-record 
                                                  'dbc::category-entity-0-coref\)~%
Following fails successfully:~%
 \(%parsed-class-slot-exists-for-parsed-class-check 'parsed-inventory-record 
                                                   'foo\)~%")

(generic-doc #'parsed-class-parse-table-lookup
"Get the HASH-KEY from OBJECT's `parsed-class-parse-table-lookup'
Return value is as if by cl:gethash.
When HASH-KEY is present nth-value 0 is an instance of a subclass of parsed-class.~%
OBJECT is either a symbol, a subclass of the class `parsed-class', or an
instance of the class `parsed-class-field-slot-accessor-mapping'.~%
HASH-KEY is a key into OJBECT's `parsed-class-parse-table'.~%~
:SEE-ALSO `parsed-class-parse-table-lookup-slot-value', `accessor-to-field-mapping',
`field-to-accessor-mapping', `field-to-accessor-table',
`accessor-to-field-table', `initargs-of-parsed-class', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%")

(method-doc #'parsed-class-parse-table-lookup nil '(symbol t)
"~%:EXAMPLE~%
 \(parsed-class-parse-table-lookup 'parsed-inventory-record \"3566\"\)~%
 \(parsed-class-parse-table-lookup 'parsed-inventory-record \"not-there\"\)~%")

(method-doc #'parsed-class-parse-table-lookup nil '(parsed-class t)
"~%:EXAMPLE~%
 \(parsed-class-parse-table-lookup \(closer-mop:class-prototype \(find-class 'parsed-inventory-record\)\) \"3566\"\)~%
 \(parsed-class-parse-table-lookup \(closer-mop:class-prototype \(find-class 'parsed-inventory-record\)\) \"not-there\"\)~%")

(method-doc #'parsed-class-parse-table-lookup nil '(parsed-class-field-slot-accessor-mapping t)
"~%:EXAMPLE~%
 \(parsed-class-parse-table-lookup \(parsed-class-mapped 'parsed-inventory-record\) \"3566\"\)~% 
 \(parsed-class-parse-table-lookup \(parsed-class-mapped 'parsed-inventory-record\) \"not-there\"\)~%")

(generic-doc #'parsed-class-parse-table-lookup-slot-value 
"Lookup the SLOT-NAME slot-value of OBJECT with HASH-KEY.~%~@
Return as if by cl:values the slot-value for OBJECT with HASH-KEY.~%
 - nth-value 0 is the slot-value or nil
 - nth-value 1 is a boolean indicating HASH-KEY's presence in OBJECT's `parsed-class-parse-table'~%
OBJECT is either a symbol, a subclass of the class `parsed-class', or an
instance of the class `parsed-class-field-slot-accessor-mapping'.~%
SLOT-NAME is a symbol. 
An error is signaled if SLOT-NAME does not satisfy
`%parsed-class-slot-exists-for-parsed-class-check'.~%
HASH-KEY is a key into OJBECT's `parsed-class-parse-table'.~%~
If HASH-KEY maps to an hash-value in the `parsed-class-parse-table' for OBJECT's
class that hash-value must satisfy both `cl:slot-exists-p' and `cl:slot-boundp'
for SLOT-NAME, when either fails an error is signaled.~%~@
:NOTE When OBJECT or SLOT-NAME are symbols they may need to be package qualified
when invoked from outside the package DBC.~%
:SEE-ALSO `parsed-class-parse-table-lookup', `accessor-to-field-mapping',
`field-to-accessor-mapping', `field-to-accessor-table',
`accessor-to-field-table', `initargs-of-parsed-class', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%")

(method-doc #'parsed-class-parse-table-lookup-slot-value nil '(parsed-class-field-slot-accessor-mapping symbol t) 
"~%:EXAMPLE~%
 \(parsed-class-parse-table-lookup-slot-value \(parsed-class-mapped 'parsed-inventory-record\)
                                             'naf-entity-publication-coref
                                             \"2766\"\)~%
 \(parsed-class-parse-table-lookup-slot-value \(parsed-class-mapped 'parsed-inventory-record\)
                                             'naf-entity-publication-coref
                                             \"blarg\"\)~%
Following errors successfully:~%
 \(parsed-class-parse-table-lookup-slot-value \(parsed-class-mapped 'parsed-inventory-record\)
                                             'foo
                                             \"blarg\"\)~%")


(method-doc #'parsed-class-parse-table-lookup-slot-value nil '(symbol symbol t) 
"~%:EXAMPLE~%
 \(parsed-class-parse-table-lookup-slot-value 'parsed-inventory-record 'naf-entity-publication-coref \"2766\"\)~%
 \(parsed-class-parse-table-lookup-slot-value 'parsed-inventory-record 'naf-entity-publication-coref \"blarg\"\)~%
                                             
Following errors successfully:~%
 \(parsed-class-parse-table-lookup-slot-value \(parsed-class-mapped 'parsed-inventory-record\)
                                             'foo
                                             \"blarg\"\)~%")

(method-doc #'parsed-class-parse-table-lookup-slot-value nil '(parsed-class symbol t) 
"~%:EXAMPLE~%
 \(parsed-class-parse-table-lookup-slot-value \(closer-mop:class-prototype \(find-class 'parsed-inventory-record\)\)
                                             'naf-entity-publication-coref
                                             \"2766\"\)~%
 \(parsed-class-parse-table-lookup-slot-value \(closer-mop:class-prototype \(find-class 'parsed-inventory-record\)\)
                                             'naf-entity-publication-coref
                                             \"blarg\"\)~%
Following errors successfully:~%
 \(parsed-class-parse-table-lookup-slot-value \(closer-mop:class-prototype \(find-class 'parsed-inventory-record\)\)
                                             'foo
                                             \"blarg\"\)~%")

(generic-doc #'field-to-accessor-table
"Return a hash-table mapping original SQL field strings to accessors of OBJECT's class.~%~@
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%")

(method-doc #'field-to-accessor-table nil '(parsed-class)
"~%:EXAMPLE~%
 \(field-to-accessor-table \(make-instance 'parsed-inventory-record\)\)~%
 \(field-to-accessor-table \(make-instance 'parsed-artist-record\)\)~%
 \(field-to-accessor-table \(make-instance 'parsed-technique-record\)\)~%")

(generic-doc #'accessor-to-field-table
"Return a hash-table mapping accessors of OBJECT's class to their original SQL field strings.~%~@
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%")

(method-doc #'accessor-to-field-table nil '(parsed-class)
"~%:EXAMPLE~%
 \(accessor-to-field-table \(make-instance 'parsed-inventory-record\)\)~%
 \(accessor-to-field-table \(make-instance 'parsed-artist-record\)\)~%
 \(accessor-to-field-table \(make-instance 'parsed-technique-record\)\)~%")

(generic-doc #'parsed-class-mapped
 "
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%")

(method-doc #'parsed-class-mapped nil '(symbol)
 "Return an instance of class `parsed-class-field-slot-accessor-mapping'.~%
Signal an error if OBJECT is not a symbol designating a subclass of `parsed-class'.~%
:EXAMPLE~%
 \(parsed-class-mapped \(make-instance 'parsed-inventory-record\)\)~%")

(method-doc #'parsed-class-mapped nil '(parsed-class)
            "Return an instance of class `parsed-class-field-slot-accessor-mapping'.~%
:EXAMPLE~%
 \(parsed-class-mapped \(parsed-class-mapped \(make-instance 'parsed-inventory-record\)\)\)~%")

(method-doc #'parsed-class-mapped nil '(parsed-class-field-slot-accessor-mapping)
            "Return an instance of class `parsed-class-field-slot-accessor-mapping'.
:EXAMPLE~%
 \(parsed-class-mapped \(parsed-class-mapped \(make-instance 'parsed-inventory-record\)\)\)~%")

(generic-doc #'accessor-to-field-mapping
"Return the accessor associated with string FIELD for OBJECT.~%~@
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',`def-set-parsed-class-record-slot-value'.~%")

(method-doc #'accessor-to-field-mapping nil '(t parsed-class)
"OBJECT should be an instance of class PARSED-CLASS and present as a key in
hash-table `*parsed-class-field-slot-accessor-mapping-table', an error is signaled if not.~%~@
:EXAMPLE~%
 \(accessor-to-field-mapping 'inventory-bar-code \(make-instance 'parsed-inventory-record\)\)~%
 \(let \(\(obj \(make-instance 'parsed-inventory-record\)\)\)
   \(field-to-accessor-mapping \(accessor-to-field-mapping 'inventory-number obj\) obj\)\)~%")

(method-doc #'accessor-to-field-mapping nil '(T  parsed-class-field-slot-accessor-mapping)
"~%:EXAMPLE~%
 \(accessor-to-field-mapping 'inventory-number 'parsed-inventory-record\)~%
 \(null \(accessor-to-field-mapping 'inventory-number 'parsed-artist-record\)\)~%
fails successfully:~%
 \(accessor-to-field-mapping 'inventory-number 'foo\)~%
 \(accessor-to-field-mapping 'inventory-number \(make-instance 'parsed-class-field-slot-accessor-mapping\)\)~%")

(generic-doc #'field-to-accessor-mapping
"Return the \"field string\" associated with ACCESSOR for OBJECT.~%~@
:EXAMPLE~%
 \(let \(\(obj \(make-instance 'parsed-artist-record\)\)\)
  \(setf \(inventory-number obj\) \"88\"\)
  \(funcall \(fdefinition \(field-to-accessor-mapping \"ref\" 'parsed-inventory-record\)\) obj\)\)~%
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%")

(method-doc #'field-to-accessor-mapping nil '(t parsed-class)
"Return as if by `cl:values' the \"field string\" associated with ACCESSOR for OBJECT and a boolean as per `cl:gethash'.~%~@
When non-nil the  `cl:nth-value' 0 corresponds to an parsed SQL/XML field from the original dbc database dump.~%~@
ACCESSOR is a symbol naming an accessor method defined for OBJECT.~%~@
OBJECT should be an instance of class PARSED-CLASS and present as a key in
hash-table `*parsed-class-field-slot-accessor-mapping-table*', an error is signaled if not.~%~@
:EXAMPLE~%
 \(field-to-accessor-mapping \"bar_code\" \(make-instance 'parsed-inventory-record\)\)~%")

(method-doc #'field-to-accessor-mapping nil '(T  parsed-class-field-slot-accessor-mapping)
"~%:EXAMPLE~%
   \(field-to-accessor-mapping \"ref\" 'parsed-inventory-record\)~%
   \(null \(field-to-accessor-mapping \"ref\" 'parsed-artist-record\)\)~%
 fails successfully:~%
  \(field-to-accessor-mapping \"ref\" 'foo\)~%
  \(field-to-accessor-mapping \"ref\" \(make-instance 'parsed-class-field-slot-accessor-mapping\)\)~%")

(generic-doc #'fields-of-parsed-class
"Return a list of all field strings associated with an accessor for OBJECT.~%~@
OBJECT should dereference a subclass of class `parsed-class'.~%
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%")

(method-doc #'fields-of-parsed-class nil '(parsed-class)
"~%:EXAMPLE~%
 \(fields-of-parsed-class \(make-instance 'parsed-inventory-record\)\)~%")

(method-doc #'fields-of-parsed-class nil '(parsed-class-field-slot-accessor-mapping)
"~%:EXAMPLE~%
 \(fields-of-parsed-class \(gethash 'parsed-inventory-record *parsed-class-field-slot-accessor-mapping-table*\)\)~%")

(method-doc #'fields-of-parsed-class nil '(symbol)
"~%:EXAMPLE~%
 \(fields-of-parsed-class 'parsed-inventory-record\)~%")

(generic-doc #'accessors-of-parsed-class
"Return a list of all accessor symbols associated with a field string for OBJECT.~%~@
OBJECT should dereference a subclass of class `parsed-class'.~%
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%")

(method-doc #'accessors-of-parsed-class nil '(parsed-class)
"~%:EXAMPLE~%
 \(accessors-of-parsed-class \(make-instance 'parsed-inventory-record\)\)~%")

(method-doc #'accessors-of-parsed-class nil '(parsed-class-field-slot-accessor-mapping)
"~%:EXAMPLE~%
 \(accessors-of-parsed-class \(gethash 'parsed-inventory-record *parsed-class-field-slot-accessor-mapping-table*\)\)~%")

(method-doc #'accessors-of-parsed-class nil '(symbol)
"~%:EXAMPLE~%
 \(accessors-of-parsed-class 'parsed-inventory-record\)~%")

(fundoc 'make-parsed-class-field-slot-accessor-mapping
"Return an instance of class `parsed-class-field-slot-accessor-mapping'.~%~@
Arg PARSED-CLASS-SUBCLASS is a symbol designating a class which subclasses `parsed-class'.
Arg FIELD-TO-ACCESSOR-ALIST is an alist used to map the hash-tables of slots
field-to-accessor-table and accessor-to-field-table.
The car of each elt of FIELD-TO-ACCESSOR-ALIST is a string designating a field-name.
The cdr is a symbol designating an slot-accessor of class PARSED-CLASS-SUBCLASS.~%~@
:EXAMPLE~%
 \(let \(\(example-object \(make-parsed-class-field-slot-accessor-mapping
                        'parsed-naf-entity
                        '\(\(\"categ\" . category-entity-0-coref\)\)\)\)\)
   \(values
    \(gethash
     \(gethash \"categ\" \(field-to-accessor-table example-object\)\)
     \(accessor-to-field-table example-object\)\)
    \(gethash
     \(gethash 'category-entity-0-coref \(accessor-to-field-table example-object\)\)
     \(field-to-accessor-table example-object\)\)
    \(parsed-class-mapped example-object\)\)\)~%~@
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping',
`def-set-parsed-class-record-slot-value'.~%▶▶▶")

(fundoc '%parsed-class-documenting-set-parsed-class-record-slot-value-function
        "Generate a documentation string for GENERATED-NAME.~%~@
PARSED-CLASS is a symbol designating the sublcass of parsed-class.~%~@
GENERATED-NAME is a symbold designating a function as per the return value of
macro `def-set-parsed-class-record-slot-value'.~%~@
:EXAMPLE~%~@
 (%parsed-class-documenting-set-parsed-class-record-slot-value-function 
  'parsed-inventory-record  'set-parsed-inventory-record-slot-value)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

(fundoc 'def-set-parsed-class-record-slot-value
"Define a function with FUN-NAME which maps the fields/value paris of orginal
SQL tables to FOR-PARSED-CLASS's CLOS equivalent.~%~@
Arg FUN-NAME is an unquoted symbol
Arg FOR-PARSED-CLASS is an unquoted symbol designating a subclass of class `parsed-class'.~%~@
Arguments to returned function are FIELD-STRING, FIELD-VALUE, and OBJECT.
Its return value is as if by `cl:values':~%
 - nth-value 0 is the setf'd FIELD-VALUE as set with slot accessor corresponding to FIELD-STRING.
 - nth-value 1 is OBJECT~%~@
Its arg FIELD-STRING is a string from the original SQL data and should have a
direct association with a slot-accessor for OBJECT.~%~@
OJBECT is an instance of a class which subclasses `parsed-class'.~%~@
Original FIELD-STRING is the car of the the consed key/value pairs in one of the alists 
written to an output file by `write-sax-parsed-xml-refs-file'
FIELD VALUE is the corresponding cdr of the consed key/value pair.~%~@
:EXAMPLE~%
 \(def-set-parsed-class-record-slot-value set-parsed-inventory-record-slot-value parsed-inventory-record\)~%
 \(let* \(\(object \(make-instance 'parsed-inventory-record\)\)
        \(field-string \"ref\"\)
        \(field-value \"13000\"\)
        \(accessor-symbol \(field-to-accessor-mapping field-string object\)\)
        \(accessor-method
         \(find-method \(fdefinition accessor-symbol\) nil `\(,\(class-of object\)\)\)\)\)
   \(set-parsed-inventory-record-slot-value field-string field-value object\)
   \(values
    \(apply \(symbol-function accessor-symbol\) \(list object\)\)
    accessor-symbol
    accessor-method\)\)~%~@
:SEE-ALSO `accessor-to-field-mapping', `field-to-accessor-mapping',
`field-to-accessor-table', `accessor-to-field-table', `parsed-class-mapped',
`make-parsed-class-field-slot-accessor-mapping'.~%▶▶▶")



;;; ==============================
;;; dbc-specific/dbc-classes/dbc-class-system-object-uuid.lisp
;;; ==============================

(generic-doc #'system-identity-uuid-bit-vector
"Get SYSTEM-OBJECTs uuid namespace representation as an object of type `unicly::uuid-bit-vector-128'.")

(generic-doc #'(setf system-identity-uuid-bit-vector)
 "Set SYS-OBJECT's UUID namespace bit-vector representation with BV.~%~@
BV is an sys-object of type `unicly:uuid-bit-vector-128'.~%~@
Do not call methods directly use the interface functions:~%~@
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-identity-uuid-integer
 "Get SYS-OBJECT's system-identity-uuid-integer slot-value.~%~@
When `cl:slot-boundp' return value is an object of type `unicly::uuid-integer-128', else nil.")

(generic-doc #'(setf system-identity-uuid-integer)
"Set SYS-OBJECT's 128bit integer representation with UUID-INTEGER-128.~%~@
Do not call methods directly use the interface functions:~%~@
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-identity-uuid-string-36
"Get SYS-OBJECT's system-identity-uuid-string-36 slot-value.
When `cl:slot-boundp' return value is an object of type `unicly::uuid-hex-string-36', else nil.")

(generic-doc #'(setf system-identity-uuid-string-36)
 "Set SYS-OBJECT's `unicly::uuid-hex-string-36' representation with UUID-HEX-STRING-36.~%~@
Do not call methods directly use the interface functions:~%
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-identity-uuid-version
 "Get SYS-OBJECT's system-identity-uuid-version slot-value.~%~@
When `cl:slot-boundp' return value is an object of type `unicly::uuid-version-int', else nil.")

(generic-doc #'system-identity-parent-uuid
 "Return the base-namespace UUID for SYS-OBJECT'S system-identity-parent-uuid slot-value.")

(generic-doc #'(setf system-identity-parent-uuid)
 "Set UUID as SYS-OBJECT's system-identity-parent-uuid slot-value.
Do not call methods directly use the interface functions:~%
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-identity-uuid-byte-array 
 "Set SYS-OBJECT's system-identity-uuid-byte-array slot-value.")

(generic-doc #'(setf system-identity-uuid-byte-array)
 "Set SYS-OBJECT's UUID namespace byte-array representation with BYTE-ARRAY.~%~@
BYTE-ARRAY is an sys-object of type `unicly:uuid-byte-array-16'.~%~@
Do not call methods directly use the interface functions:~%
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'(setf system-identity-uuid-version)
"Set SYS-OBJECT's uuid version with BV-OR-STRING.~%~@
BV-OR-STRING is either a object of type `unicly:uuid-bit-vector-128' or an
integer of type `unicly::uuid-version-int'.~%~@
Do not call methods directly use the interface functions:~%
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-identity
 "Get SYS-OBJECT's system-identity slot-value.")

(generic-doc #'(setf system-identity)
 "Set SYS-OBJECT's system-identity slot-value to IDENTITY.~%~@
Do not call methods directly use the interface functions:~%
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-identity-uuid
 "Get SYS-OBJECT's system-identity-uuid slot-value.")

(generic-doc #'(setf system-identity-uuid)
 "Set UUID namespace for SYS-OBJECT with COERCABLE-UUID.~%~@
COERCABLE-UUID is a representation of a Unicly UUID in some form, e.g.:~%
 hex-string-36, byte-array-16, bit-vector-128, unique-universal-identifier~%~@
Do not call methods directly use the interface functions:~%
 `make-system-object-uuid' and `update-system-object-uuid'~%~@
:SEE-ALSO `system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")

(generic-doc #'system-object-uuid-description
 "Print slot-values of SYS-OBJECT to STREAM.~%~@
When keyword VERBOSE is non-nil return value print all slot-values of SYS-OBJECT
else print only the system-identity and system-identity-uuid slot-values.~%~@
The :VERBOSE t form is used with `cl:describe' method, the nil form is used with
`cl:print-object' method specialized on class system-identity-uuid.~%~@
:EXAMPLE~%
 \(system-object-uuid-description *control-id-artist-namespace* 
                                 :stream s 
                                 :verbose t\)~%
 \(let \(\(q \(with-output-to-string \(s\) 
            \(system-object-uuid-description *control-id-artist-namespace* 
                                            :stream s 
                                            :verbose t\)\)\)
       \(y '\(\)\)\) 
   \(declare \(ignore q\)\)
   y\)~%~@
:SEE-ALSO `make-system-object-uuid', `update-system-object-uuid',
`system-identity', `system-identity-parent-uuid',
`system-identity-uuid', `system-identity-uuid-byte-array',
`system-identity-uuid-bit-vector', `system-identity-uuid-integer',
`system-identity-uuid-string-36', `system-identity-uuid-version'.~%▶▶▶")



;;; ==============================
;;; dbc-specific/dbc-classes/dbc-class-image-path-convert.lisp
;;; ==============================
(vardoc '*dbc-base-httpd-synced-item-number-image-pathname*
"Pathname under which old dbc images are stored.~%~@
:NOTE may not be mounted!!!~%~@
Callers will signal an error if cl:probe-file doesn't return true. ~%~@
:SEE-ALSO `*dbc-wild-httpd-synced-item-number-image-pathname-list*',
`*dbc-item-number-path-source-destination-vector*'.~%▶▶▶")

(vardoc '*dbc-wild-httpd-synced-item-number-image-pathname-list*
        "List of pathname-directory components to construct wild pathnames for matching
jpg images beneath `*dbc-base-httpd-synced-item-number-image-pathname*'.~%~@
Elements of list are either strings or a list of strings and/or wild pathname
keywords e.g. :wild :wild-inferiors.~%~@
:NOTE Order in wich the elements are specified is important!!!~%~@
:SEE-ALSO `*dbc-item-number-path-source-destination-vector*'.~%▶▶▶")

(vardoc '*dbc-item-number-path-source-destination-vector*
        "Vector mapping item-numbers to to their original source paths and their
  directory under pathname named by `*dbc-base-item-number-image-pathname*'.
When CL:BOUNDP the vector is 1 indexed such that the object it indexes
corresponds to an item number e.g.:
 (aref *dbc-item-number-path-source-destination-vector* 8999) maps to item-number \"8999\".
:SEE-ALSO ``*dbc-wild-httpd-synced-item-number-image-pathname-list*',
`*dbc-base-httpd-synced-item-number-image-pathname*'.~%▶▶▶")

(fundoc '%ensure-dbc-base-http-synced-item-number-image-pathname-exists
        "Verify BASE-HTTPD-SYNCED-DIRECTORY exists with cl:probe-file. 
An error is signaled if not.~%~@
:EXAMPLE~%
 (%ensure-dbc-base-http-synced-item-number-image-pathname-exists 
  *dbc-base-httpd-synced-item-number-image-pathname*)
:SEE-ALSO `%make-httpd-synced-item-number-image-wild-pathname-list'.~%▶▶▶")

(fundoc '%make-httpd-synced-item-number-image-wild-pathname-list
        "Return a list of wild pathnames merging SUBDIRS-FOR-WILD-PATHNAME with BASE-HTTPD-SYNCED-DIRECTORY.~%~@
An error is signaled if base-httpd-synced-directory does not exist.~%~@
:EXAMPLE~%~@
 \(make-item-number-image-wild-pathname-list *dbc-base-httpd-synced-item-number-image-pathname*
                                            *dbc-wild-httpd-synced-item-number-image-pathname-list*\)~%~@
:SEE-ALSO `%ensure-dbc-base-http-synced-item-number-image-pathname-exists', .~%▶▶▶")


;;; ==============================
;;; dbc-specific/dbc-classes/dbc-class-image-path-inventory-record.lisp
;;; ==============================

(generic-doc #'inventory-record-image-directory-probe
        "Probe for an ITEM-NUMBER subdir beneath BASE-IMAGE-DIRECTORY-PATHNAME.~%
If a subdir exists with a name matching the return value of:~%
 \(control-id-indexed-number-zero-padded-string ITEM-NUMBER\)~%
return the subdirs pathname.~%~@
OBJECT is an instance of class parsed-inventory-record, a positive-integer, or
the string equivalent of one.~%
BASE-IMAGE-DIRECTORY-PATHNAME is a pathname identifying a directory to search
for images beneath. Specializing methods default to `*dbc-base-item-number-image-pathname*'.~%~@
:SEE-ALSO `inventory-record-image-jpg-probe'.~%▶▶▶")

(method-doc #'inventory-record-image-directory-probe nil '(integer)
            "~%:EXAMPLE~%
 \(inventory-record-image-directory-probe 2849\)~%
 \(inventory-record-image-directory-probe 99999\)~%")

(method-doc #'inventory-record-image-directory-probe nil '(string)
            "~%:EXAMPLE~%
 \(inventory-record-image-directory-probe \"2849\"\)~%")

(method-doc #'inventory-record-image-directory-probe nil '(parsed-inventory-record)
            "~%:EXAMPLE~%
 \(let \(\(obj \(make-instance 'parsed-inventory-record\)\)\)
   \(setf \(inventory-number obj\) \"2849\"\)
   \(inventory-record-image-directory-probe obj\)\)~%")

(generic-doc #'inventory-record-image-jpg-probe
"Probe for a jpg image in an ITEM-NUMBER subdir beneath BASE-IMAGE-DIRECTORY-PATHNAME.~%
ITEM-NUMBER is an instance of class parsed-inventory-record, a positive-integer
or the string equivalent of one.~%
BASE-IMAGE-DIRECTORY-PATHNAME is a pathname identifying a directory to search
for images beneath. Default is `*dbc-base-item-number-image-pathname*'.~%
IMAGE-SUFFIX is either :all or a string.
When IMAGE-SUFFIX is a string it must be one of:~%
 \"\" \"-m\" \"-s\" \"-f\" \"-fs\" \"-fc\" \"-z\"~%
Return value is as if by `inventory-record-image-jpg-probe-all' and has the same
semantics except that nth-value 0 is a single pathname when a matching image for
ITEM-NUMBER is found unless IMAGE-SUFFIX is :all in which case return value is a
list.
PATHNAME-RETURN-STYLE indicates how pathnames should be returned if a match is found.
:absolute returns an absolute pathname.
:relative returns a pathname with the format: 
 #P\"<PARENT-DIR>/<FILENAME>.jpg\"~%~@
:file-pathname returns a pathanme with the format: 
 #P\"<FILENAME>.jpg\"~%~@
:SEE-ALSO `inventory-record-image-directory-probe'.~%▶▶▶")

(method-doc #'inventory-record-image-jpg-probe nil '(string)
"~%:EXAMPLE~%
 \(inventory-record-image-jpg-probe \"2849\"\)~%
 \(inventory-record-image-jpg-probe \"2849\" :image-suffix \"-z\"\)~%
 \(inventory-record-image-jpg-probe \"2849\" :image-suffix \"-f\"\)~%
 \(inventory-record-image-jpg-probe \"2849\" :image-suffix \"-m\"\)~%")

(method-doc #'inventory-record-image-jpg-probe nil '(integer)
"~%:EXAMPLE~%
 \(inventory-record-image-jpg-probe 2849\)~%
 \(inventory-record-image-jpg-probe 2849 :image-suffix \"-z\"\)~%
 \(inventory-record-image-jpg-probe 2849 :image-suffix \"-f\"\)~%
 \(inventory-record-image-jpg-probe 2849 :image-suffix \"-m\"\)~%")

(method-doc #'inventory-record-image-jpg-probe nil '(parsed-inventory-record)
"~%:EXAMPLE~%
 \(let \(\(obj \(make-instance 'parsed-inventory-record\)\)\)
   \(setf \(inventory-number obj\) \"2849\"\)
   \(list 
    \(inventory-record-image-jpg-probe obj\)
    \(inventory-record-image-jpg-probe obj :image-suffix \"-z\"\)
    \(inventory-record-image-jpg-probe obj :image-suffix \"-f\"\)
    \(inventory-record-image-jpg-probe obj :image-suffix \"-m\"\)\)\)~%
Following errors successfully:~%
 \(let \(\(obj \(make-instance 'parsed-inventory-record\)\)\)
   \(setf \(inventory-number obj\) \"2849\"\)
   \(inventory-record-image-jpg-probe obj :image-suffix \"foo\"\)\)~%")

;; "^<00NNNN>((-[msz]{1}?)??|(-f[sc]??)??)??$"

(generic-doc #'inventory-record-image-jpg-probe-all
"Probe for a jpg images in an ITEM-NUMBER subdir beneath BASE-IMAGE-DIRECTORY-PATHNAME.~%
Find images with pathname-names matching the cl-ppcre regex:~%
 \"^[0-9]{6}?\(\(-[msz]{1}?\)??|\(-f[sc]??\)??\)??$\"~%~@
ITEM-NUMBER is an instance of class parsed-inventory-record, a positive-integer
or the string equivalent of one.~%
BASE-IMAGE-DIRECTORY-PATHNAME is a pathname identifying a directory to search
for images beneath. Default is `*dbc-base-item-number-image-pathname*'.~%
PATHNAME-RETURN-STYLE indicates how pathnames should be returned when matching
images are found it should be one of following keywords:~%
 :absolute :relative :file-pathname~%
 :absolute indicates to return a list of absolute pathnames~%
 :relative indicates to return a list of pathnames with the format:
  #P\"<RELATIVE-ITEM-DIRECTORY>/<FILENAME>.jpg\"~%
 :file-pathname indicates to return a list of pathnames with the format:
  #P\"<FILENAME>.jpg\"~%~@
Return value is as if by cl:values and has one of the following formats:~%
 a) NIL, NIL, <ITEM-NUMBER-STRING>~%
 b) NIL, <ITEM-DIRECTORY>, <ITEM-NUMBER-STRING>~%
 c) <IMAGE-LIST>, <ITEM-DIRECTORY> | <RELATIVE-ITEM-DIRECTORY>, <ITEM-NUMBER-STRING>~%
In case a ITEM-NUMBER does not have a directory beneath BASE-IMAGE-DIRECTORY-PATHNAME~%
In case b ITEM-NUMBER does have a directory beneath BASE-IMAGE-DIRECTORY-PATHNAME
but either does not contain jpg images or, if it does, these do not match our
pattern. Note also that nth-value 1 is always ITEM-NUMBER's directory even when
PATHNAME-RETURN-STYLE is :relative -- see below for additional discussion.~%
In case c ITEM-NUMBER does have a directory beneath BASE-IMAGE-DIRECTORY-PATHNAME
and it contains jpg images which match our pattern. Here the pathname returned
for nth-value 1 is contigent on whether or not PATHNAME-RETURN-STYLE is
:relative. If it is, the pathname returned is the parent directory relative to
the directory containg the images of <IMAGE-LIST>.~%
:EXAMPLE~%
 Here the base pathname-name at nth-value 2 matches the subdir name \"001894\"
 at nth-value 1:~%
 \(%inventory-record-image-jpg-probe-all 001894 
                                        :pathname-return-style :absolute\)
 |=> \(#P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/001894/001894.jpg\"
 |    #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/001894/001894-m.jpg\"
 |    #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/001894/001894-s.jpg\"\)
 |    #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/001894/\"
 |   \"001894\"~%
 Here base pathname-name at nth-value 2 does not match subdir name
 \"001893_SOLD\" at nth-value 1:~%
 \(%inventory-record-image-jpg-probe-all \"001893\" :pathname-return-style :absolute\)
 |=> \(#P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/001893_SOLD/001893.jpg\"
 |    #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/001893_SOLD/001893-m.jpg\"
 |    #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/001893_SOLD/001893-s.jpg\"\)
 |    #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/001893_SOLD/\"
 |    \"001893\"~%
 Here we can map a merge-pathnames with the elts of nth-value 0 with nth-value 1:~%
 \(%inventory-record-image-jpg-probe-all 001893 :pathname-return-style :relative\)
 |=> \(#P\"001893_SOLD/001893.jpg\" #P\"001893_SOLD/001893-m.jpg\"
 |    #P\"001893_SOLD/001893-s.jpg\"\)
 |    #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/\"
 |    \"001893\"~%
 Here we can map a merge-pathnames with the elts of nth-value 0 with nth-value 1
 Note however base pathname-name at nth-value 2 does not match subdir name
 \"001893_SOLD\" at nth-value 1:~%
 \(%inventory-record-image-jpg-probe-all 001893 :pathname-return-style :file-pathname\)
 |=> \(#P\"001893.jpg\" #P\"001893-m.jpg\" #P\"001893-s.jpg\"\)
 |    #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/001893_SOLD/\" 
 |   \"001893\"~%
 Here ITEM-NUMBER 56666 does not have an existent directory:~%
 \(%inventory-record-image-jpg-probe-all 56666\)
 |=> NIL
 |   NIL
 |   \"056666\"~%
 In following examples directory for 013476 exists but does not contain jpg
 images matching our pattern.~%
 \(%inventory-record-image-jpg-probe-all 013476 :pathname-return-style :absolute\)
 |=> NIL
 |   #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/013476/\"
 |   \"013476\"~%
 \(%inventory-record-image-jpg-probe-all 013476 :pathname-return-style :file-pathname\)
 |=> NIL
 |   #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/013476/\"
 |   \"013476\"~%
 \(%inventory-record-image-jpg-probe-all 013476 :pathname-return-style :relative\)
 |=> NIL
 |   #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/013476/\"
 |   \"013476\"~%~@
:NOTE In the last example above, when PATHNAME-RETURN-STYLE is :relative and we
find an existing diretory for ITEM-NUMBER which contains jpg files matching our
pattern we return the _parent_ diretory of the files matched. However, in
earlier examples when matching jpg files are found beneath a pathname which does
exist for ITEM-NUMBER we return for nth-value 1 a pathname which is relative to
the directory containing the images. This difference is because the semantics
for recovering a parent directory given a null pathname are such that this
returns a meaningful pathname:~%
 \(merge-pathnames \(make-pathname :name nil :type nil\)
  #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/<ITEM-NUMBER-DIR>/\"\)~%
whereas this does not:~%
 \(merge-pathnames \(make-pathname :name nil :type nil\)
  #P\"/<BASE-IMAGE-DIRECTORY-PATHNAME>/\"\)~%~%")




;;; ==============================
;;; dbc-specific/dbc-classes/dbc-class-parsed-csv-writer.lisp
;;; ==============================

;; deprecated now defined with `def-parsed-class-write-csv-file' macrology from loadtime-bind.lisp
;; (fundoc 'write-parsed-inventory-record-parse-table-to-csv-file
;; "Clean PREFIX-FOR-FILE-NAME for use with `write-parsed-class-parse-table-to-csv-file'.~%~@
;; :EXAMPLE~%
;;  \(parsed-class-csv-clean-prefix-for-file-name \"parsed-inventory-record\"\)~%
;;  \(parsed-class-csv-clean-prefix-for-file-name \"parsed-inventory-record- \"\)~%
;;  \(parsed-class-csv-clean-prefix-for-file-name \" parsed-inventory-record-CSV \"\)~%
;;  \(parsed-class-csv-clean-prefix-for-file-name \"parsed-inventory-record-csv _-\"\)~%~@
;; Following error successfully:~%
;;  \(parsed-class-csv-clean-prefix-for-file-name \"\"\)~%
;;  \(parsed-class-csv-clean-prefix-for-file-name \"-CSV\"\)~%
;;  \(parsed-class-csv-clean-prefix-for-file-name \"-csv\"\)~%~@
;; :SEE-ALSO `<XREF>'.~%▶▶▶")

(fundoc 'write-parsed-class-parse-table-to-csv-file
        "Write the slot values of PARSED-CLASS to a csv file.
Return the file written if the parsed-class-parse-table for class is populated else nil.
prefix-for-file-name is a name to prepend to a pathname-name. 
It is trimmed of whitespace and #\\_ #\\-.~%~@
The written file will have the format: <PREFIX-FOR-FILENAME>-CSV-<TIMESTAMP>.csv
OUTPUT-SUB-DIRECTORY is a string or list of strings which when merged with
BASE-OUTPUT-DIRECTORY create a path to write the filename beneath. If the
merged pathname contains subdirectories which do not exist they will be
created as if by `cl:ensure-directories-exist'.~%~@
BASE-OUTPUT-DIRECTORY is a base pathname beneath which to write the file. 
If BASE-OUTPUT-DIRECTORY does not exist an error is signalled.
FILTERING-SLOT-LIST is a list of slots of PARSED-CLASS for which the
slot-values should not be written.~%~@
SLOT-HEADER-CASE is a keyword either :downcase or :upcase designating the
case for the initargs written to the CSV header.~%~@
:EXAMPLE~%~@
 \(write-parsed-class-parse-table-to-csv-file :parsed-class 'parsed-inventory-record
                                             :prefix-for-file-name \"inventory-records\"
                                             :output-sub-directory \"parsed-csv-inventory-records\"
                                             :slot-header-case :downcase\)
:SEE-ALSO `<XREF>'.~%▶▶▶")

(fundoc 'def-parsed-class-write-csv-file
"Wrapper macro for `write-parsed-class-parse-table-to-csv-file'. 
Return a function with defaults specific to PARSED-CLASS.
Returned function has a symbol-name with the format:~%
 write-<PARSED-CLASS>-parse-table-to-csv-file~%~@
:EXAMPLE~%~@
 \(def-parsed-class-write-csv-file
     :parsed-class parsed-inventory-record
   :default-prefix-for-file-name \"inventory-records\"
   :default-output-pathname-sub-directory \"parsed-csv-inventory-records\"
   :default-output-pathname-base-directory \(merge-pathnames
                                            \(make-pathname :directory '\(:relative \"parsed-csv-records\"\)\)
                                            \(dbc::sub-path dbc::*xml-output-dir*\)\)\)~%~@
:SEE-ALSO `write-parsed-inventory-record-parse-table-to-csv-file'.~%▶▶▶")



;;; ==============================
;;; dbc-specific/dbc-classes/dbc-class-theme-entity.lisp
;;; ==============================

(fundoc 'dbc-theme-request-loc-x-uri
        "Perform a `drakma:http-request' with THEME-STRING after percent-encoding it.~%~@
Request has the format:~%
 \"http://id.loc.gov/vocabulary/graphicMaterials/label/<PERCENT-ENCCODE-THEME-STRING>\"~%
If we recieve a 200 response code return as if by cl:values as follows:~%
 - nth-value 0 is the tgm-id assocated with THEME-STRING it is a string with the format:~%
    \"tgmNNNNNN\"~%
 - nth-value 1 is a puri:uri. It is the redirect uri for THEME-STRING.~%~@
When keyword RENDER-URI (a boolean) is T it is returned as a string as if by `puri:render-uri'.~%~@
:EXAMPLE~%
 \(dbc::dbc-theme-request-loc-x-uri \"A la poupée prints\"\)~%
 \(dbc::dbc-theme-request-loc-x-uri \"A la poupée prints\" :render-uri t\)~%~@
The above is loosely equivalent to:~%
 shell> curl -I http://id.loc.gov/vocabulary/graphicMaterials/label/A%20la%20poup%C3%A9e%20prints~%~@
:SEE-ALSO `mon:string-percent-encode'.~%▶▶▶")

;;; ==============================
;;; dbc-classes/dbc-class-parsed-inventory-record.lisp
;;; ==============================

(generic-doc #'parsed-inventory-record-parse-table-lookup-slot-value
"Do not specialize methods directly!
Methods are specialized on an existing slot-name with the
`accessors-of-parsed-class' for `parsed-inventory-record' at loadtime using
macro `def-parsed-inventory-record-parse-table-lookup-slot-value'.~%~@
SLOT-NAME is a symbol corresponding to an existing slot of class `parsed-inventory-record'.
HASH-KEY is a string for `parsed-class-parse-table' possibly mapping to an instance of `parsed-inventory-record'.
:EXAMPLE~%
 \(loop 
   for fun in \(accessors-of-parsed-class 'parsed-inventory-record\)
   collect \(find-method #'parsed-inventory-record-parse-table-lookup-slot-value nil `\(\(eql ,fun\) string\)\)\)~%~@
:SEE-ALSO `parsed-inventory-record-parse-table-lookup',
`parsed-class-parse-table', `parsed-class-parse-table-lookup',
`parsed-class-parse-table-lookup-slot-value'.~%▶▶▶")

(fundoc 'parsed-inventory-record-parse-table-lookup
"Find HASH-KEY in the `parsed-class-parse-table' for class `parsed-inventory-record'.~%~@
Like `parsed-class-parse-table-lookup' but specifically for class `parsed-inventory-record'.~%~@
Return values as if by `cl:gethash'.~%~@
If HASH-KEY is found nth-value 0 is an instance of class `parsed-inventory-record'.~%~@
Arg HASH-KEY is a string.~%~@
:EXAMPLE~%
  \(parsed-class-parse-table-lookup 'parsed-inventory-record \"1692\"\)~%
  \(parsed-class-parse-table-lookup 'parsed-inventory-record \"1692m\"\)~%~@
:SEE-ALSO `parsed-inventory-record-parse-table-lookup-slot-value',
`parsed-class-parse-table-lookup-slot-value'.~%▶▶▶")

(fundoc 'def-parsed-inventory-record-parse-table-lookup-slot-value
"loadtime macro for specializing generic `parsed-inventory-record-parse-table-lookup-slot-value'.~%~@
For each slot-name in `accessors-of-parsed-class' for class `parsed-inventory-record'
define a function and a method with an eql specializer for the accessor.~%~@
Defined function accepts a single argument HASH-KEY which is a string mapping to
an instance of in the parsed-class-parse-table for `parsed-inventory-record'.
Each defined function has a sybmol name with the format:~%
 PARSED-INVENTORY-RECORD-<SLOT-NAME>-LOOKUP~%~@
Defined method has a signature of the form:~%
 \(\(eql <SLOT-NAME>\) \(string hash-key\)\)~%~@
:EXAMPLE~%~@
 \(macroexpand '\(def-parsed-inventory-record-parse-table-lookup-slot-value description-inventory-english\)\)~%
 \(loop 
   for fun in \(accessors-of-parsed-class 'parsed-inventory-record\)
   collect \(find-method #'parsed-inventory-record-parse-table-lookup-slot-value nil `\(\(eql ,fun\) string\)\)\)~%~@
:NOTE `%parsed-inventory-record-parse-table-lookup-slot-value-maybe-remove'
evaluated at loadtime will remove any pre-existing functions/methods defined
with this macro.~%
:SEE-ALSO `<XREF>'.~%▶▶▶")

(fundoc '%parsed-inventory-record-parse-table-lookup-slot-value-maybe-remove
"Remove any existing functions/methods which may have been previously defined
with `def-parsed-inventory-record-parse-table-lookup-slot-value' prior to
\(re\)defining new ones at system loadtime.~%
:EXAMPLE~%
 (def-parsed-inventory-record-parse-table-lookup-slot-value not-a-real-slot)~%
 \(find-method #'parsed-inventory-record-parse-table-lookup-slot-value nil '\(\(eql not-a-real-slot\) string\)\)~%
 \(fboundp 'parsed-inventory-record-not-a-real-slot-lookup\)~%
 \(%parsed-inventory-record-parse-table-lookup-slot-value-maybe-remove\)~%
 \(find-method #'parsed-inventory-record-parse-table-lookup-slot-value nil '\(\(eql not-a-real-slot\) string\) nil\)~%
 \(fboundp 'parsed-inventory-record-not-a-real-slot-lookup\)~%
:SEE-ALSO `parsed-inventory-record-parse-table-lookup-slot-value'.~%▶▶▶")

(fundoc 'parsed-inventory-record-null-prototype-to-file
        "Write slot values of OBJECT to a file in directory corresponding to object's
inventory-number slot value beneath BASE-OUTPUT-DIRECTORY.~%~@
Return pathname of file written.~%~@
Keyword args PREFIX-FOR-FILE-NAME, SUFFIX-FOR-FILE-NAME, PATHNAME-TYPE, and
PRINT-UNBOUND are as per `dbc::write-sax-parsed-slots-to-file'.~%~@
:SEE-ALSO `parsed-inventory-record-xml-dump-file-and-hash'.~%▶▶▶")

(fundoc 'write-sax-parsed-inventory-record-hash-to-zero-padded-directory
        "Write all parsed-inventory-records in HASH-TABLE to a relative sub-directory
pathname of the form 0NNNNN beneath BASE-OUTPUT-DIRECTORY. If sub-directory does
not exist it will be created as if by `cl:ensure-directories-exist'.~%~@
:EXAMPLE~%
 \(write-sax-parsed-inventory-record-hash-to-per-image-directory 
  *tt--parse-table*
  :base-output-directory \(merge-pathnames 
                          \(make-pathname 
                           :directory `\(:relative ,\(concatenate 'string 
                                                                \"individual-parse-refs-zero-padded-\"
                                                                \(mon:time-string-yyyy-mm-dd\)\)\)\)
                          \(sub-path *xml-output-dir*\)\)\)~%~@
:SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-slots',
`write-sax-parsed-slots-to-file', `write-sax-parsed-class-hash-to-files'.~%▶▶▶")

;; (fundoc 'parsed-inventory-record-xml-dump-file-and-hash
;;         "Parse XML contents of INPUT-FILE and write a lispy version to disk as per
;; `write-sax-parsed-xml-to-file' then feed the contents of the lisp file into a
;; hash-table with `load-sax-parsed-xml-file-to-parsed-class-hash'.~%~@
;; Return cl:values a hash-table and the output pathname written to.
;; Keyword input-file is an XML file containing inventory-records to be parsed.
;; Keywords OUTPUT-PATHNAME-SUB-DIRECTORY, OUTPUT-PATHNAME-BASE-DIRECTORY,
;; OUTPUT-PATHNAME-NAME, OUTPUT-PATHNAME-DATED-P, and OUTPUT-PATHNAME-TYPE are as
;; per `make-parsed-class-output-file-ensuring-pathname'.~%~@
;; When set-inventory-record-table is non-nil nth-value 1 is the return value of
;; setting the 'parsed-inventory-record key in variable `*parsed-class-parse-table*' to the
;; hash-table populated from the contents of INPUPT-FILE, else return a hash-table.~%
;; :EXAMPLE~% \(parsed-inventory-record-xml-dump-file-and-hash\)~%~@
;; :SEE-ALSO `parsed-inventory-record-null-prototype-to-file'.~%▶▶▶")

(fundoc 'def-parsed-class-record-xml-dump-file-and-hash
        "Return a function which consolidates functionality of both
`write-sax-parsed-xml-to-file' and `load-sax-parsed-xml-file-to-parsed-class-hash'
such that evalauting the returned function will for a given subclass parsed-<FOO> of
`parsed-class' perform the following:~%
 - Parse an XML input file~%~% ~
 - For each parsed record write a Lispy sexp of the parsed XML input file to
   disk (i.e. serialize the parse)~%~% ~
 - Load the contents of the Lispy file \(i.e. deserialize the parse\)~%~% ~
 - For each deserialized sexp create an instance of parsed-<FOO>~%~% ~
 - Add the created instance to a hash-table keyed by some unique value of a
   slot of parsed-<FOO>~%~@
Keyword PARSED-CLASS is an unquoted symbol designating a class which subclasses `parsed-class'.~%~@
Its symbol-name is concatenated with \"-xml-dump-file-and-hash\" as per return
value of `%parsed-class-dumper-format-and-intern-symbol' to form the returned
symbol-name of the defined function. For example the following pair:~%~% ~
 :PARSED-CLASS parsed-inventory-record~%~@
generates a function with the `cl:symbol-name' \"PARSED-INVENTORY-RECORD-XML-DUMP-FILE-AND-HASH\".~%~@

Keyword DEFAULT-KEY-ACCESSOR is a symbol designating a method specialized on PARSED-CLASS
as per`load-sax-parsed-xml-file-to-parsed-class-hash'.

Keyword DEFAULT-INPUT-PATHNAME-NAME is a pathname-name \(a string\) naming
the default xml file to parse, e.g.:~%
 :DEFAULT-INPUT-PATHNAME-NAME \"dump-refs-DUMPING\"~%~@
At runtime it is merged with the pathname value of the following form:~%
  \(sub-path *xml-input-dir*\)~%~@
to form a pathname for which `cl:probe-file' returns true.~%~@
It becomes the defined functions default value for use with the keyword INPUT-FILE
for both `write-sax-parsed-xml-to-file' and `load-sax-parsed-xml-file-to-parsed-class-hash'.~%~@

Keyword DEFAULT-OUTPUT-PATHNAME-BASE-DIRECTORY is a pathname naming a default
base directory, e.g.:~%
 :DEFAULT-OUTPUT-PATHNAME-BASE-DIRECTORY \(sub-path *xml-output-dir*\)\)~%~@

It is merged with the subdirectories specified by
DEFAULT-OUTPUT-PATHNAME-SUB-DIRECTORY when writing the dumped file.~%~@

It becomes the defined functions default value for use with the keyword
OUTPUT-PATHNAME-BASE-DIRECTORY of `make-parsed-class-output-file-ensuring-pathname'.~%~@

Keyword DEFAULT-OUTPUT-PATHNAME-SUB-DIRECTORY is an unquoted list of strings each
designating a sub directory of DEFAULT-OUTPUT-PATHNAME-BASE-DIRECTORY e.g.:~%
 :DEFAULT-OUTPUT-PATHNAME-SUB-DIRECTORY \(\"parsed-xml-inventory-records\"\)~%~@
It becomes the defined functions default value for use with the keyword
OUTPUT-PATHNAME-SUB-DIRECTORY of `make-parsed-class-output-file-ensuring-pathname'.~%~@
Keyword DEFAULT-OUTPUT-PATHNAME-NAME is a string to use as the prefix when
generating the dumped-file's dated pathname-name, e.g.:~%~% ~
 :DEFAULT-OUTPUT-PATHNAME-NAME \"inventory-records\"~%~@
would at runtime expand to a pathname-name having the form:~%~% ~
 \"inventory-records-<YYYY>-<MM>-<DD>\"~%~@
It becomes the defined functions default value for use with the
keyword OUTPUT-PATHNAME-NAME of `write-sax-parsed-xml-to-file' and the
keyword OUTPUT-PATHNAME-SUB-DIRECTORY of `make-parsed-class-output-file-ensuring-pathname'.~%~@

:EXAMPLE~%~@
 \(macroexpand-1
  '\(def-parsed-class-record-xml-dump-file-and-hash 
      :parsed-class parsed-inventory-sales-order-record
      :default-key-accessor order-number
      :default-input-pathname-name \"orders-xml\"
      :default-output-pathname-base-directory \(sub-path *xml-output-dir*\)
      :default-output-pathname-sub-directory \(\"parsed-xml-inventory-sales-order-records\"\)
      :default-output-pathname-name \"order-records\"\)\)~%~@

:SEE-ALSO `print-sax-parsed-slots', `write-sax-parsed-slots-to-file',
`write-sax-parsed-class-hash-to-files', `write-parsed-class-parse-table-to-file'.~%▶▶▶")

;; (fundoc 'parsed-inventory-record-load-default-parsed-file-to-hash
;;         "Load slots of class parsed-inventory-record to its parsed-class-parse-table from most recent dump file.~%~@
;; Loads file written with `write-parsed-inventory-record-parse-table-to-file'
;; which have the `cl:pathname-type' \"pctd\".~%~@
;; Signal an error if the parsed file or its containing directory can not be found.~%~@
;; :NOTE This functionality is distinct from that of
;; `load-sax-parsed-xml-file-to-parsed-class-hash' which loads the contents of a
;; parsed XML file where each record is an alist with each element of the alist a
;; mapping from a string to a slot-value where each string is a valid argument to
;; `set-parsed-inventory-record-slot-value' and identifies an SQL table-column with
;; a corresponding slot-name.~%~@
;; :SEE-ALSO `parsed-inventory-record-xml-dump-file-and-hash',
;; `load-sax-parsed-xml-file-to-parsed-class-hash',
;; `write-sax-parsed-slots-to-file', `write-parsed-class-parse-table-to-file'.~%▶▶▶")

(fundoc 'write-sax-parsed-class-hash-to-files
"Write each parsed-class object of HASH-TABLE to a dedicated file beneath OUTPUT-DIRECTORY.~%~@
Return value is a list of the `cl:file-namestring's of each file written.~%~@
:EXAMPLE~%
 \(write-sax-parsed-class-hash-to-files 
  <HASH-TABLE> 
  :parse-class 'parsed-inventory-record
  :slot-for-file-name 'inventory-number 
  :prefix-for-file-name \"inventory-number\"
  :output-directory \(merge-pathnames #P\"individual-parse-refs-2011-10-01/\" 
                                     \(sub-path *xml-output-dir*\)\)\)~%~@
:SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash',
`print-sax-parsed-slots', `write-sax-parsed-slots-to-file',
`write-sax-parsed-class-hash-to-files',
`write-parsed-class-parse-table-to-file',
`write-sax-parsed-inventory-record-hash-to-zero-padded-directory',.~%▶▶▶")

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
