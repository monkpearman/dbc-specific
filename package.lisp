

(defpackage #:dbc (:use #:common-lisp #:unicly)
	    ;;
	    ;; (:nicknames #:dbc-sys)
	    ;;
	    ;; Import relevant stuff from :mon
	    (:import-from #:mon #:fundoc #:vardoc #:typedoc #:classdoc #:make-documented-class #:defconst*)
	    ;; 
	    (:export
	     ;;
	     ;; specials.lisp
	     ;; :VARIABLES
             #:*system-path*	     
             #:*system-notes-dir*
             #:*system-tests-dir*
             #:*system-tests-temp-dir*
             #:*parsed-ref-field-name-slot-transform* ;; dbc-class-refs-convert.lisp
	     #:*xml-output-dir* 
             #:*xml-output-refs-name*          ;; ---> OUTPUT
             #:*xml-output-refs-ext*           ;; ---> OUTPUT
             #:*xml-input-dir*                 ;; <--- INPUT
             #:*xml-input-refs-name*           ;; <--- INPUT
             #:*xml-input-refs-name-temp*      ;; <--- INPUT
             #:*xml-refs-match-list*
             #:*xml-refs-match-table*
             ;;
             #:*parsed-ref-class-name*
	     ;;
           ;; conditions.lisp
             ;;
	     #:dbc-error
	     #:system-path-error
             ;; reader system-path-error
             #:w-system-path-locus      ;; reader system-path-error
             #:w-system-object-locus    ;; reader system-path-error
             #:w-system-slot-locus      ;; reader system-path-error
	     ;;
             ;;
             ;; use UNICLY
           ;; dbc-uuid/dbc-uuid.lisp
             ;;
             ;;
	     ;; dbc-classes/dbc-class.lisp
	     ;;
             #:base-dbc                     ;; <CLASS>
             ;; 
           ;; dbc-classes/dbc-class-paths.lisp
             ;; 
             ;; :GENERIC-FUNCTIONS
	     #:system-base-path              ;; system-base-path
	     #:system-path-var-binding
	     #:system-described
             #:system-path-if
             #:system-parent-path-ensure
             ;; 
	     ;; :CLASSES
	     #:system-base
	     #:system-path
	     #:system-subdir
             ;; :ACCESSORS
             #:sub-name     ;; system-subdir
             #:sub-path     ;; system-subdir
             #:parent-path  ;; system-subdir
             ;;
	     ;; :FUNCTIONS
	     #:find-system-path
	     #:system-path-xml-dump-dir-ensure
             #:system-subdir-init-w-var  ;; :renamed :from `make-system-subdir'
             ;;
           ;; /dbc-classes/dbc-class-parse-convert.lisp
             ;;
             #:parsed-class   ;; <CLASS>
             ;;
             #:*regexp-whitespace-chars* ;; VARIABLE
             #:preprocess-whitespace
             #:preprocess-leading-trailing-dashes
             #:preprocess-underscore-to-dash
             #:preprocess-string-case
             #:make-parsed-name-preprocess
             #:preprocess-slot-transform
             #:make-parsed-class-slot-init-accessor-name
             ;;
             ;;
           ;; dbc-classes/dbc-class-edit.lisp
             ;;
              #:base-edit
             ;;
           ;; dbc-classes/dbc-class-uuid.lisp
             #:base-uuid
             ;;
           ;; dbc-classes/dbc-class-users.lisp
             ;;
             #:base-user
             ;;
             ;;
           ;; dbc-classes/dbc-class-entity.lisp
             #:base-entity
             #:base-category-entity
             #:base-theme-entity
             #:base-naf-entity
             #:base-media-entity
             ;;
           ;; dbc-classes/dbc-class-description.lisp
             ;;
             #:base-description
             ;;
           ;; dbc-classes/dbc-class-documentation.lisp
             #:base-documenation
             ;;
           ;; dbc-classes/dbc-class-regexps.lisp
             ;;
             ;;
             ;; :GENERIC-FUNCTIONS
             #:regexp-match-entity-class
             #:regexp-match-entity-db
             #:regexp-match-matcher-db
             #:regexp-match-container-type
             #:regexp-match-container-uuid
             #:regexp-matcher
             ;; :CLASSES
             #:base-regexp
             #:entity-regexp-subclass-allocation
             #:entity-regexp
             #:theme-entity-regexp
             #:category-entity-regexp
             #:naf-entity-type-regexp
             #:naf-entity-control-name-regexp
             #:naf-entity-alt-name-regexp
             #:naf-entity-artist-control-regexp
             #:naf-entity-artist-alt-regexp
             #:naf-entity-author-control-regexp
             #:naf-entity-author-alt-regexp
             #:naf-entity-person-alt-regexp
             #:naf-entity-person-control-regexp
             #:naf-entity-brand-control-regexp
             #:naf-entity-brand-alt-regexp
             #:naf-entity-publication-control-regexp
             #:naf-entity-publication-alt-regexp
             ;; #:parsed-field-name-regexp
             ;;
             ;; :VARIABLES
             #:*category-entity-regexp-db*
             #:*theme-entity-regexp-db*
             #:*parsed-field-name-regexp-db*
             #:*naf-artist-entity-regexp-db*
             #:*naf-person-entity-regexp-db*
             #:*naf-author-entity-regexp-db*
             #:*naf-brand-entity-regexp-db*
             #:*naf-publication-entity-regexp-db*
             ;;
             #:make-entity-regexp-subclass-allocation-if
             #:make-entity-regexp-subclass-allocation
             ;;
             ;;
           ;; dbc-classes/dbc-class-refs-convert.lisp
             ;;
             #:parsed-ref     ;; <CLASS>
             ;;
             #:make-ref-maker-sym-name 
             #:make-ref-maker-symbol
             #:make-ref-lookup-table
             ;;
           ;; :MODULE dbc-parse
             ;;
             ;;
           ;; dbc-parse/dbc-cln-parse.lisp
             ;;
             ;;
             #:field-name-underscore-to-dash
	     #:field-string-cons
	     #:field-cln-x
             #:field-name-convert-field-name
	     ;;
	     ;; mon:string-split-on-chars
	     #:split-used-fors   
	     ;;
	     ;; mon:string-split-on-chars, mon:string-trim-whitespace
	     #:split-appeared-in 
	     ;;
	     ;; mon:string-split-on-chars
	     #:split-roles
	     ;;
	     ;; mon:make-string*
	     #:format-entity-role
	     ;;
	     ;; mon:string-trim-whitespace, mon:concat, mon:string-split-on-chars
	     #:split-lifespan
	     ;;
	     #:split-lifespan-string-int-pairs
	     ;;
	     ;; mon:string-null-or-empty-p, mon:string-split-on-chars, mon:string-trim-whitespace
	     #:split-comma-field
	     #:split-loc-pre
             ;;

             #:split-field-on-char-if
             #:split-comma-field-if
             #:split-piped-field-if
             #:field-convert-verify-string
             #:field-convert-remove-duplicates
             #:field-convert-empty-string-nil
	     #:field-convert-1-0-x
             #:field-convert-1-0-x-empty
             #:field-convert-1-0-x-empty-known
             ;;
           ;; dbc-parse/dbc-xml-sql-parse.lisp
	     ;;
	     ;; klacks:get-attribute klacks:current-lname
	     ;; klacks:current-characters klacks:consume
	     ;; cxml:make-source klacks:with-open-source 
	     ;; klacks:map-attributes klacks:get-attribute
	     ;; klacks:current-lname klacks:current-characters
	     ;; klacks:consume klacks:peek
	     ;; mon:string-trim-whitespace
	     #:field-table-parse-out 
	     ;;
	     ;; cxml::cxml-source klacks:peek klacks:map-attributes
	     #:field-parse-attribs	     
             ;;
           ;; dbc-parse/dbc-xml-refs-parse.lisp
             ;;
             #:field-attribs-find
             #:field-attribs-consume-if
             #:field-parse-refs
             ;;
	     ;; dbc-parse/psa-parse-table.lisp
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
	     ;; #:p/sax-float-string         ;; `string-to-number'
	     ;; #:p/sax-extract-tr
             ;;
             ;;
           ;; dbc-translate/dbc-french-numbers.lisp
             ;;
             #:*number-to-french-below-20*
             #:*number-to-french-tens*
             #:*number-to-french-thousands*
             #:*number-to-french-big-prefix*
             #:*number-to-french-bof*
             #:*number-to-french-denominators*
             ;; 
             #:number-to-french
             #:number-to-french-ordinal
             #:number-to-french-ten
             #:number-to-french-hundred
             #:number-to-french-thousand
             #:number-to-french-big
             #:number-to-french-big-designation
             ;;
             ;;
           ;; dbc-translate/dbc-french-dates.lisp
              #:*french-weekday-names*
              #:*french-month-names*
              ;;
           ;; loadtime-bind.lisp
             ;;
	    ))


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: DBC
;; End:

;;; ==============================
;;; EOF			




