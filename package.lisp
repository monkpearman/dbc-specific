

(defpackage #:dbc (:use #:common-lisp)
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
             #:*system-path*	     
             #:*system-notes-dir*
             #:*system-tests-dir*
             #:*system-tests-temp-dir*
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
             #:*uuid-random-state*
             #:*uuid-namespace-dns*
             #:*uuid-namespace-url* 
             #:*uuid-namespace-oid* 
             #:*uuid-namespace-x500*
	     ;;
           ;; conditions.lisp
	     #:dbc-error
	     #:system-path-error
             ;; reader system-path-error
             #:w-system-path-locus      ;; reader system-path-error
             #:w-system-object-locus    ;; reader system-path-error
             #:w-system-slot-locus      ;; reader system-path-error
	     ;;
             ;;
           ;; dbc-uuid/dbc-uuid.lisp
             ;;
             ;;
             #:unique-universal-identifier
             #:unique-universal-identifier-p
             #:uuid-copy-uuid
             #:make-null-uuid
             #:make-v3-uuid
             #:make-v4-uuid
             #:make-v5-uuid
             ;;
             #:uuid-byte-string    ; TYPE
             #:uuid-ub48           ; TYPE
             #:uuid-ub32           ; TYPE
             #:uuid-ub16           ; TYPE
             #:uuid-ub8            ; TYPE
             #:uuid-byte-array-16  ; TYPE
             #:uuid-byte-array-20  ; TYPE
             #:uuid-string-32      ; TYPE
             #:uuid-string-36      ; TYPE
             #:uuid-hex-string-32  ; TYPE
             #:uuid-hex-string-36  ; TYPE
             #:uuid-byte-array-16-p
             #:uuid-byte-array-20-p
             #:uuid-byte-string-p
             #:uuid-string-32-p
             #:uuid-string-36-p
             #:uuid-hex-string-32-p
             #:uuid-hex-string-36-p
             #:make-uuid-from-string
             #:uuid-print-bytes
             #:uuid-get-bytes
             #:uuid-get-bytes-for-integer
             #:uuid-number-to-byte-array
             ;; #:uuid-digest-uuid-string  ; INTERNAL
             ;; #:make-uuid-from-string-if ; INTERNAL
             ;; #:uuid-load-bytes          ; INTERNAL
             ;; #:format-v3or5-uuid        ; INTERNAL
             ;; #:%verify-digest-version   ; INTERNAL
             ;; #:%verify-version-3-or-5   ; INTERNAL
             ;; #:%uuid-get-bytes-if       ; INTERNAL
             ;; #:%verify-slot-boundp-and-type ; INTERNAL 
             #:uuid-to-byte-array
             #:uuid-from-byte-array
             #:uuid-princ-to-string
             #:format-uuid-as-urn
             #:make-uuid-namespace-loadtime-vars
             #:string-to-sha1-byte-array
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
             ;; :CLASSES
             #:base-regexp
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
             ;; #:parsed-field-name-regexp
             ;;
             ;; :VARIABLES
             #:*theme-entity-regexp-matcher-db*
             #:*theme-entity-regexp-entity-db*
             #:*category-entity-regexp-entity-db*
             #:*category-entity-regexp-matcher-db*
             #:*naf-artist-entity-control-regexp-matcher-db*
             #:*naf-artist-entity-regexp-entity-db*
             #:*naf-author-entity-control-regexp-matcher-db*
             #:*naf-author-entity-regexp-entity-db*
             #:*naf-person-entity-control-regexp-matcher-db*
             #:*naf-person-entity-regexp-entity-db*
             #:*naf-brand-entity-control-regexp-matcher-db*
             #:*naf-brand-entity-regexp-entity-db*
             #:*naf-publication-entity-control-regexp-matcher-db*
             ;; #:*parsed-field-name-regexp-matcher-db*
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
	     #:field-str-cons
	     #:field-cln-x
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
             #:field-convert-empty-string-nil
	     #:field-convert-1-0-x
	     #:split-loc-pre
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




