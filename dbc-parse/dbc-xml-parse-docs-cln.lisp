;;; :FILE-CREATED <Timestamp: #{2011-05-15T18:00:21-04:00Z}#{11197} - by MON>
;;; :FILE dbc-specific/dbc-parse/dbc-xml-parse-docs-cln.lisp
;;; ==============================

;;; ==============================
;; :NOTES
;; elisp for cleaning lichteblau's inlined TEX formatting:
;;
;; (progn (search-forward-regexp ;; "\\(
;;         "\\(\\(}\\)[[:blank:]]\\)" nil t);;@arg\\[\\(.*\\)\\]\\){" nil t)
;;        ;;(match-string-no-properties 2)
;;
;; (while (search-forward-regexp "@arg\\[\\(.*\\)\\]" nil t)
;;   (replace-match (concat (upcase (match-string-no-properties 1)) " "))) 
;;; ==============================

(in-package :dbc)
;; *package*

;;; ==============================

#|
Return A serialization sink, i.e. a SAX handler
Returns a handler that writes processes SAX events by writing an equivalent XML
document to a newly allocated vector of type: (unsigned-byte 8)

The sink will return the vector as a result from `sax:end-document'.

CANONICAL 
Canonical form, one of NIL, T, 1, 2.
If specified, serialization in canonical form is enabled.  The two canonical
forms are useful to allow comparisons of XML documents and their content model
by character-by-character comparisons of their serialized representation.

The following values for CANONICAL are allowed:

 - t or 1: Canonical XML
 - 2       Second Canonical Form
 - NIL     Use a more readable non-canonical representation.

An internal subset will be included in the result regardless of the
canonical setting. It is the responsibility of the caller to not
report an internal subset for canonical <= 1, or only notations as
required for canonical = 2. For example, the include-doctype argument
to dom:map-document should be set to nil for the former behaviour and
:canonical-notations for the latter.

INDENTATION 
Indentation level.
An integer or nil. 

If specified, a pretty-printing indentation mode is enabled.
:NOTE As implemented currently, INDENTATION changes the content model
unconditionally, and is usually helpful only for debugging purposes.

ENCODING 
The character encoding to use.
A string or keyword. 
Values are interpreted by Babel.
CL:NIL is also allowed and means UTF-8.

OMIT-XML-DECLARATION 
Boolean.
If true, no XML declaration is written.

|#    

;;; ==============================
;;; EOF
