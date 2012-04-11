;;; :FILE-CREATED <Timestamp: #{2012-04-11T13:18:55-04:00Z}#{12153} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-slot-value-format.lisp
;;; ==============================

#|
methods for formatting slot-values when exporting to non-lispy files e.g. csv

parsed-class-slot-value-format-keyword-sequenced-entity-coref

edit-timestamp

parsed-inventory-record

these are lists of strings:

naf-entity-person-coref
naf-entity-brand-coref
naf-entity-composer-coref
naf-entity-artist-coref
naf-entity-author-coref
taxon-entity-coref
naf-entity-publication-coref

edit-history

category-entity-precedence-list 
this needs to be delimited for mystuff2 as a group/location - i prefer location 
keyword-seo-sequenced-entity-coref


publication-date-range

publication-date
NIL | (:YEAR INTEGER :MONTH INTEGER | NIL :DAY INTEGER | NIL)
we should export both the sequence and as a formatted date-string if all values :MONTH :DAY :YEAR are present

|#

(in-package #:dbc)


(defgeneric parsed-class-slot-value-format-string-list (object slot-name))

(defgeneric parsed-class-slot-value-format-image-pathnames (object))

(defgeneric parsed-class-slot-value-format-delimited-string-list (object slot-name delimiter))




;;; ==============================
;;; EOF
