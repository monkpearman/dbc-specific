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
;;; :DBC-CLN-PARSE-DOCUMENTATION
;;; dbc-parse/dbc-cln-parse.lisp
;;; ==============================

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
`split-appeared-in', `split-loc-pre', `split-lifespan', `split-comma-field'.~%▶▶▶")

(fundoc 'split-field-on-char-if
"SPLIT-STRING on CHAR returning a list of strings.~%~@
Do not return a list if no occurences of CHAR are found.~%~@
SPLIT-STRING may be an object of any type not just a `cl:string'.~%~@
Return 4 values as if by `cl:values' in a like manner as `dbc:field-convert-1-0-x-empty'.~%~@
When keyword KEEP-DUPLICATES is non-nil do not remove as if by the duplicate
elements from first value ruturned.  Default is to process nth-value 0 with
`field-convert-remove-duplicates' prior to returning.~%~@
When keyword KEEP-FIRST is non-nil do not return nil for nth-value 0 if string
is contained of only `mon:whitespace-char-p' and CHAR.~%~@
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
:SEE-ALSO `split-piped-field-if'.~%▶▶▶")

(fundoc 'split-piped-field-if
        "Like `split-used-fors' but do not return a list if no #\\| are found.~%~@
Unlike `split-used-fors' arg PIPED-STRING may be an object of any type not just a `cl:string'.~%~@
Return 4 values as if by `cl:values' in a like manner as `dbc:field-convert-1-0-x-empty'.~%~@
When keyword KEEP-DUPLICATES is non-nil do not remove as if by the duplicate
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
`split-loc-pre', `split-lifespan', `split-comma-field',
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
`split-lifespan'`mon:string-split-on-chars', `mon:string-trim-whitespace',
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
`split-loc-pre', `split-lifespan', `split-comma-field'.~%▶▶▶")

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
`split-appeared-in', `split-lifespan'.~%▶▶▶")

(fundoc 'split-lifespan
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
 \(split-lifespan \"1843-1908\"\)~%
 \(split-lifespan \"1848-\"\)~%
 \(split-lifespan \"-1848\"\)~%
 \(split-lifespan \"?-1848\"\)~%
 \(split-lifespan \"-1848-?\"\)~%
 \(split-lifespan \"-1848?\"\)~%
 \(split-lifespan \"-1848?\"\)~%
 \(split-lifespan \"1848 - 1942\"\)
 \(split-lifespan \" 1848 - 1942 \"\)
 \(split-lifespan \"1848 -- ??\"\)~%
 \(split-lifespan \" 1848-?? \"\)~%~@
;; Pathological:~%
 \(split-lifespan \"1940s-60s\"\)~%
 \(split-lifespan \"Active 1940s-60s\"\)~%~@
:NOTE Doesn't catch the #\\[ #\\] chars in \"[?]-1900\" or \"1900-[?]\".~%~@
:SEE-ALSO `split-roles', `split-used-fors', `split-piped-field-if',
`split-appeared-in', `split-loc-pre'.~%▶▶▶")

(fundoc 'split-lifespan-string-int-pairs
"Attempt integer extraction from cons strings returned by `split-lifespan'.~%~@
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
 \(split-lifespan-string-int-pairs \(split-lifespan \"\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"1843-1943\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"1843-\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"-1843\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"1843-??\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"??-1843\"\)\)~%
;; Following cases are pathological and reasonably acounted for:~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"??-??\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"00-??\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"00-00\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"00-1843\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"1843-00\"\)\)~%
;; Following case is pathological and without a clear solution:~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"1843\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"3001-88\"\)\)~%
 \(split-lifespan-string-int-pairs \(split-lifespan \"88-3001\"\)\)~%~@
When the car of LIFESPAN-STR-PAIR is a string indicating the beginning of
lifespan is an \"unknown\", the car of the second cons of return value is -1.
The intent in using a negative is to allow later callers the oppurtunity to
optimize their checks. For example:~%
 \(let* \(\(w-str \"1843-??\"\)
        \(both-lifespan \(split-lifespan-string-int-pairs
 		       \(split-lifespan w-str\)\)\)
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
lifespan i.e. the string passed from `split-lifespan' was \"1843-?\", we
don't want inferences about an entities lifespan to return misleadingly and
guard against that by making it difficult for forms such as:~% 
 \(- <END-LIFESPAN> <BEG-LIFESPAN>\)~%~@
to return a value that is `plusp'. For example:~% 
 \(let* \(\(both-lifespan \(split-lifespan-string-int-pairs
			\(split-lifespan \"1843-??\"\)\)\)
	\(hd-ls \(caadr both-lifespan\)\)
	\(tl-ls \(cdadr both-lifespan\)\)\)
   \(and \(integerp tl-ls\)
	\(eql \(signum \(- tl-ls hd-ls\)\) -1\)\)\)~%~@
When coupled with the string values in the cons at the first elt in return value
we can be reasonably sure that the integer parse is correct.~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")

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
`split-appeared-in', `split-loc-pre', `split-lifespan', `split-comma-field',
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

(vardoc '*parsed-data-current-row*
  "Holds an instance of class `dbc-sax-parsing-class' while parsing an XML row field.~%~@
:SEE-ALSO `*parsed-data-current-row*', `*parsed-data-output-path*',
`*parsed-data-output-stream*', `*xml-input-dir*', `*xml-output-dir*'.~%▶▶▶")

(vardoc '*parsed-data-output-stream*
  "Output stream current while parsing the XML data of *parsed-data-output-path*
Opend on entry to `write-sax-parsed-xml-to-file' and closed on exit.
:SEE-ALSO `*parsed-data-current-row*', `*parsed-data-output-path*',
`*parsed-data-output-stream*', `*xml-input-dir*', `*xml-output-dir*'.~%▶▶▶")

(fundoc 'write-sax-parsed-delimiter 
"Write a commented delimiter line to OUTPUT-STREAM.
Commented delimiter is written as a `cl:fresh-line' followed by a string of
68 #\\; characters followed by a newline.
:SEE-ALSO `dbc-sax-current-chars-clear', `dbc-sax-current-chars-reset',
`dbc-sax-current-chars', `dbc-sax-handler', `write-sax-parsed-delimiter',
`write-sax-parsed-xml-row-to-file', `load-sax-parsed-xml-file-to-parsed-class-hash',
`*parsed-data-current-row*', `*parsed-data-output-path*',
`*parsed-data-output-stream*', `*xml-input-dir*', `*xml-output-dir*'.~%▶▶▶")

(fundoc 'write-sax-parsed-xml-to-file
        "Parse the dbc XML refs in INPUT-FILE and write thier lispy counterparts to OUTPUT-FILE.~%~@
For duration of body the variable `*parsed-data-output-stream*' is bound to an open output-stream.~%~@
INPUT-FILE defaults to `*xml-input-refs-name*'.~%~@
OUTPUT-FILE defaults to `*parsed-data-output-path*'.~%~@
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
`%ensure-dated-parsed-directory', `*parsed-data-current-row*',
`*parsed-data-output-path*', `*parsed-data-output-stream*', `*xml-input-dir*',
`*xml-output-dir*'.~%▶▶▶")



;;; ==============================
;; dbc-specific/dbc-classes/dbc-class-parsed-convert.lisp
;;; ==============================

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
`set-parsed-inventory-record-slot-value', etc.~%~@
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
                                                 :slot-dispatch-function #'set-parse-ref-slot-value\)\)~%
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
`write-sax-parsed-slots-to-file', `write-sax-parsed-class-hash-to-files'.~%▶▶▶")

(fundoc 'write-sax-parsed-slots-to-file
"Write a list of the slot/value pairs of OBJECT to a file in OUTPUT-DIRECTORY.~%~@
Each slot/value pair is written in such a way that the list may be read and
passed to `cl:make-instance' to re-instantiate the instance.~%~@
Arg SLOT-FOR-FILE-NAME is a symbol, e.g. 'item-number, 'control-id-entity-num-artist, etc.
If it satisfies `cl:slot-exists-p', `cl:slot-boundp' and `cl:slot-value', it's
value is used as the suffix for a file name otherwise an error is signaled.~%~@
Arg PREFIX-FOR-FILE-NAME is a string, e.g. \\\"item-number\\\", \\\"artist-enity-num\\\",
etc.  It is combined with `cl:slot-value' of SLOT-FOR-FILE-NAME when makeing a
pathname to write OBJECT to.  When a string is provided it should not contain a
trailing #\\\\-. If PREFIX-FOR-FILE-NAME is null the `cl:string' representation of
SLOT-FOR-FILE-NAME is used instead.~%~@
Keyword arg PRE-PADDED-FORMAT-CONTROL if supplied is used in lieu of return
value of `print-sax-parsed-slots-padding-format-control' with OBJECT as its argument.~%~@
:EXAMPLE~%
 \(write-sax-parsed-slots-to-file 
  *tt--item* 
  :slot-for-file-name 'inventory-number 
  :prefix-for-file-name \"inventory-number\"
  :output-directory \(merge-pathnames #P\"individual-parse-refs-2011-10-01/\" \(sub-path *xml-output-dir*\)\)\)~%~@
:SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-slots',
`write-sax-parsed-slots-to-file', `write-sax-parsed-class-hash-to-files'.~%▶▶▶")

(fundoc 'write-sax-parsed-class-hash-to-files
"Write the sax-parsed class of HASH-TABLE to a file in OUTPUT-DIRECTORY.~%~@
:EXAMPLE~%
 \(write-sax-parsed-class-hash-to-files 
  <HASH-TABLE> 
  :parse-class 'parsed-inventory-record
  :slot-for-file-name 'inventory-number 
  :prefix-for-file-name \"inventory-number\"
  :output-directory \(merge-pathnames #P\"individual-parse-refs-2011-10-01/\" 
                                     \(sub-path *xml-output-dir*\)\)\)~%~@
:SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash', `print-sax-parsed-slots',
`write-sax-parsed-slots-to-file', `write-sax-parsed-class-hash-to-files'.~%▶▶▶")

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
