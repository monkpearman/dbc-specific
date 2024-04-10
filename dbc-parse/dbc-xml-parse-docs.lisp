;;; :FILE-CREATED <Timestamp: #{2011-05-15T17:29:08-04:00Z}#{11197} - by MON>
;;; :FILE dbc-specific/dbc-parse/dbc-xml-parse-docs.lisp
;;; ==============================

(in-package :dbc) 
;; *package*

#| 
:NOTES regarding CXML/SAX/KLACKS parsing/serialization model.

CXML refers to rods and runes:
 a rod is a UTF-16 vectors containing runes
 a rune is an integers

;; :XML-EVENTS

 An XML event is a thing that opens/closes or changes parser state, e.g.:

  <field   ;; opens field  :START-ELEMENT
  </field> ;; closes field :END-ELEMENT

 Following are XML events CXML knows about:

 :start-element
 :end-element
 :characters
 :start-document :end-document
 :comment
 :dtd
 :processing-instruction

 :SEE `klacks:find-event' 
      `klacks:serialize-event'

 Following is a list of symbols specifically relevant to the event types CXML
 knows about:

 :CHARACTERS    
  `klacks:current-characters', `klacks:consume-characters'

 :START-ELEMENT/:END-ELEMENT
  `klacks:find-element', `klacks:serialize-element'
  `cxml:with-element'

 :COMMENT
  `sax:comment'

;; :XML-ELEMENTS

 An XML element is a thing occuring inside an event:
 In the following example the element is "field".
 It begins with "<" (the character #\<) 
 It ends with "</" (the characters #\< and #\/)

  <field   ;; :START-ELEMENT
  </field> ;; :END-DOCUMENT

:SEE `klacks:expecting-element'
     `klacks:find-element'
     `klacks:serialize-element'

 An XML attribute is a thing occuring inside an element:
 In the following example the attribute is "name".

 It begins with the LHS value: name 
  followed by = (the character #\=) 
  followed by its RHS value: the string "display"

         LHS    RHS
  <field name="display">Chalon (Louis)</field>
         |           |
         `- attribute|
                      `attribute value 
 :SEE `klacks:list-attributes' 
      `klacks:get-attribute'
      `klacks:map-attributes'

 An attribute has a Qname (qualified name) 
 An attribute may also have an Lname (local name) 

 Qnames and Lnames are similiar to CL's package namespace, e.g.:
  The symbol `CL:IF` is a Qname
  The symbol `IF` is an Lname

 :SEE `klacks:current-lname'
      `klacks:current-qname'
      `klacks:decode-qname'
      `sax:attribute-local-name'
      `sax:attribute-qname'
      `sax:attribute-value'

;; :KLACKS-SOURCES

 `klacks:source'
 `klacks:close-source'
 `klacks:with-open-source'
 `klacks:make-tapping-source'
 `klacks:tapping-source'
 `klacks:serialize-source'
 `cxml:make-source'

;; :SERIALIZING

  Serialization is the inverse of parsing.  That is, one generates things and
  sends them to a serialization sink.

 `klacks:serialize-source'
 `klacks:serialize-element'
 `klacks:serialize-event'

;; :SINKS

 A sink is an stream to output serialized/parsed things to.
 All sink creation functions share the same keyword arguments.
 initargs are:
   canonical   [ NIL | T | 1 | 2 ]
   indentation [ <INTEGER> | NIL ]
   encoding    [ <string> | <keyword> ] as if by 
   omit-xml-declaration <BOOLEAN>

 `cxml:make-string-sink'                 Creates a vector of (character)
 `cxml:make-string-sink/utf8'
 `cxml:make-octet-vector-sink'           Creates a vector of (unsigned-byte 8)
 `cxml:make-rod-sink'
 `cxml:make-character-stream-sink'       Writes to a stream/file
 `cxml:make-character-stream-sink/utf8'  Writes to a stream/file 
 `cxml:make-octet-stream-sink'

 `cxml:with-xml-output'

  make-string-sink
  make-character-stream-sink  Writes to a stream/file
  make-octet-vector-sink      Creates a vector of (unsigned-byte 8)
  make-octet-stream-sink      Writes to a stream/file

;; :KLACKS-READING

 `klacks:consume'
 `klacks:consume-characters'
 `klacks:peek'
 `klacks:peek-next'
 `klacks:peek-value'
 `klacks:expect'
 `klacks:skip'

;; :SAX-HANDLERS

`sax:abstract-handler'
`sax:content-handler'
`sax:default-handler'

;; Documentation for CXML sink creation functions:

 `cxml:make-string-sink'                 Creates a vector of (character)
 `cxml:make-string-sink/utf8'
 `cxml:make-octet-vector-sink'           Creates a vector of (unsigned-byte 8)
 `cxml:make-rod-sink'

 The above all share the same keyword arguments.
 However, their lambda-list's are not informative, e.g.:
 cxml:make-octet-vector-sink (&rest initargs &key encoding &allow-other-keys)
 For details, see the macrolet form CXML::DEFINE-MAKER in :FILE cxml/xml/unparse.lisp

Documentation:

Return A serialization sink, i.e. a SAX handler
Returns a handler that writes processes SAX events by writing an equivalent XML
document to a newly allocated vector of type: (unsigned-byte 8)

The sink will return the vector as a result from `sax:end-document'.

CANONICAL 
If specified, serialization in canonical form is enabled.  

The following values for CANONICAL are allowed:

 - T or 1  Canonical XML
 - 2       Second Canonical Form
 - NIL     Use a more readable non-canonical representation.

The two canonical forms [ { T | 1 } | 2 ] are useful to allow comparisons of XML
documents and their content model when making character-by-character comparisons
of their serialized representation.

An internal subset will be included in the result regardless of the
canonical setting. It is the responsibility of the caller to not
report an internal subset for canonical <= 1, or only notations as
required for canonical = 2. For example, the INCLUDE-DOCTYPE argument
to `dom:map-document' should be set to NIL for the former behaviour and
:CANONICAL-NOTATIONS for the latter.

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
NIL is also allowed and means encoding will be in UTF-8 format.

OMIT-XML-DECLARATION 
Boolean.
If true, no XML declaration is written.


klacks:peek (source)
=> :start-document
or => :start-document, version, encoding, standalonep
or => :dtd, name, public-id, system-id
or => :start-element, uri, lname, qname
or => :end-element, uri, lname, qname
or => :characters, data
or => :processing-instruction, target, data
or => :comment, data
or => :end-document, data
or => nil

klacks:peek returns the current event's key and main values. 


klacks:peek-value (source) 
=> value*
Like klacks:peek but returns without the events key as if by cl:values

klacks:skip (source key &optional value1 value2 value3)
Expect the specific event KEY, then consume it.
 
;;; ==============================

 In this example, find-element is used to skip over the uninteresting events
 until the opening child1 tag is found. Then serialize-element is used to
 generate SAX events for the following element, including its children, and an
 xmls-compatible list structure is built from those events. find-element skips
 over whitespace, and find-event is used to parse up to :end-document, ensuring
 that the source has been closed.
 
 * (defparameter *source*
       (cxml:make-source "<example>
                            <child1><p>foo</p></child1>
                            <child2 bar='baz'/>
                          </example>"))
 *SOURCE*

 ,----
 | klacks:find-element is used to skip over the uninteresting events until the
 | opening child1 tag is found.
 `----

 * (klacks:find-element *source* "child1")
 :START-ELEMENT
 NIL
 "child1"
 "child1"
 
 ,----
 | klacks:serialize-element is used to generate SAX events for the found
 | element, including its children. 
 | An xmls-compatible list structure is built from those events.
 `----

 * (klacks:serialize-element *source* (cxml-xmls:make-xmls-builder))
 ("child1" NIL ("p" NIL "foo"))
 
 * (klacks:find-element *source*)
 :START-ELEMENT
 NIL
 "child2"
 "child2"
 
 *  (klacks:serialize-element *source* (cxml-xmls:make-xmls-builder))
 ("child2" (("bar" "baz")))

 ,----
 | klacks:find-element skips over whitespace, and klacks:find-event is used to
 | parse up to :END-DOCUMENT, ensuring that the source has been closed.
 `----
 
 * (klacks:find-event *source* :end-document)
 :END-DOCUMENT
 NIL
 NIL
 NIL

;;; ==============================

 (klacks:peek *example*)         ;; Return event thing and value - returns as if by `cl:values' - don't advance source.
 (klacks:peek-value *example*)   ;; Reutrn value of thing
 (klacks:peek-next *example*)    ;; Advances point
 
 (klacks:current-uri *example*)
 (klacks:current-xml-base *example*) ;; Returns path to file or source 
 
 (klacks:current-lname *example*)
 (klacks:current-qname *example*)
 
 (klacks:list-attributes *example*)      ;; when looking at a thing with attributes return them (a struct)
 (klacks:get-attribute *example* "name") ;; accessor for the lname/quname
 
 (klacks:current-characters *example*)
 (klacks:find-element *example* "field")
 (klacks:expect *example* :characters)
 

|#




;;; ==============================
;;; EOF
