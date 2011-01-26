;;-*- Mode: LISP; Syntax: COMMON-LISP; Encoding: utf-8; Base: 10 -*-

;; (in-package #:cl-user)


(defpackage #:dbc (:use #:common-lisp )
	    ;;
	    ;; (:nicknames #:dbc-sys)
	    ;;
	    ;; Import relevant stuff from :mon
	    ;; (:import-from #:mon {...} )
	    ;; 
	    (:export
	     ;;
	     ;; specials.lisp
	     #:*dbc-xml-dump-dir-name*
	     #:*dbc-xml-dump-dir*
	     #:ensure-dbc-xml-dump-dir-exists
	     ;;
           ;; dbc-xml-sql-parse.lisp
	     ;;
	     #:dbc-field-str-cons
	     #:dbc-field-cln-x
	     #:dbc-table-field-parse ;; klacks:peek klacks:with-open-source
	     #:dbc-field-attribs-parse	     
	     #:dbc-split-lifespan
	     #:dbc-split-used-fors
	     #:dbc-split-roles
	     #:dbc-split-appeared-in
	     #:dbc-split-loc-pre
	     #:dbc-split-lifespan-string-int-pairs
	     #:dbc-split-comma-field
	     #:dbc-convert-1-0-x-field
	     ;;
	     ;;
	     ;; klacks:get-attribute klacks:current-lname
	     ;; klacks:current-characters klacks:consume
	     ;; cxml:make-source
	     ;;
	     ;; psa-parse-table.lisp
	     ;;
	     ;; #:*psa-fl*
	     ;; #:*tr-gthr*
	     ;; #:*curr-src*
	     ;; #:html2xhtml
	     ;; #:psa-handler
	     ;; #:filter-tr
	     ;; #:p/totals-strip-commas
	     ;; ;;#:p/totals-strip-whitespace
	     ;; #:p/sax-integer-string       ;; `string-to-number'
	     ;; #:p/sax-float-string   ;; `string-to-number'
	     ;; #:p/sax-extract-tr
	     ;;
	     ;;
	     ;; dbc-class.lisp
	     ;;
	     ;; 
	    ))


;;; ==============================
;;; EOF			




