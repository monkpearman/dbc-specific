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
	     ;; :VARIABLES
             #:*dbc-system-path*	     
             #:*dbc-xml-dump-dir-name*
	     #:*dbc-xml-dump-dir*
	     ;; :GENERIC-FUNCTIONS
	     #:dbc-base-path
	     #:dbc-var-binding
	     #:dbc-system-described
	     ;; :CLASSES
	     #:dbc-system-class
	     #:dbc-system-path
	     #:dbc-system-subdir
	     ;; :FUNCTIONS
	     #:ensure-dbc-xml-dump-dir-exists
	     #:find-dbc-system-path	     
	     ;;
           ;; dbc-xml-sql-parse.lisp
	     ;;
	     ;;
	     ;; cxml:make-source klacks:with-open-source 
	     ;; klacks:map-attributes klacks:get-attribute
	     ;; klacks:current-lname klacks:current-characters
	     ;; klacks:consume klacks:peek
	     ;; mon:string-trim-whitespace
	     #:dbc-table-field-parse 
	     ;;
	     ;; cxml::cxml-source klacks:peek klacks:map-attributes
	     #:dbc-field-attribs-parse	     
	     ;;
	     #:dbc-field-str-cons
	     #:dbc-field-cln-x
	     ;;
	     ;; mon:string-split-on-chars
	     #:dbc-split-used-fors   
	     ;;
	     ;; mon:string-split-on-chars, mon:string-trim-whitespace
	     #:dbc-split-appeared-in 
	     ;;
	     ;; mon:string-split-on-chars
	     #:dbc-split-roles
	     ;;
	     ;; mon:make-string*
	     #:dbc-format-entity-role
	     ;;
	     ;; mon:string-trim-whitespace mon:concat mon:string-split-on-chars
	     #:dbc-split-lifespan
	     ;;
	     #:dbc-split-lifespan-string-int-pairs
	     ;;
	     ;; mon:string-null-or-empty-p mon:string-split-on-chars mon:string-trim-whitespace
	     #:dbc-split-comma-field
	     #:dbc-convert-1-0-x-field
	     #:dbc-split-loc-pre
	     ;;

	     
	     ;;
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




