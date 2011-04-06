

(defpackage #:dbc (:use #:common-lisp)
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
             ;;
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
             ;; #:uuid-digest-uuid-string              ; INTERNAL DEPRECATED
             ;; #:uuid-print-bytes                     ; INTERNAL DEPRECATED
             ;; #:uuid-get-bytes                       ; INTERNAL DEPRECATED
             ;; #:uuid-load-bytes                      ; INTERNAL DEPRECATED
             ;; #:%uuid-get-bytes-if                   ; INTERNAL DEPRECATED
             ;; #:format-v3or5-uuid                    ; INTERNAL
             ;;
             ;; #:format-v3-uuid                       ; INTERNAL
             ;; #:format-v5-uuid                       ; INTERNAL
             ;; #:make-uuid-from-string-if             ; INTERNAL
             ;; #:%verify-digest-version               ; INTERNAL
             ;; #:%verify-version-3-or-5               ; INTERNAL
             ;; #:%verify-slot-boundp-and-type         ; INTERNAL
             ;; #:%uuid_time-mid-request               ; INTERNAL
             ;; #:%uuid_time-low-request               ; INTERNAL
             ;; #:%uuid_time-high-and-version-request  ; INTERNAL
             ;; #:%uuid_clock-seq-and-reserved-request ; INTERNAL
             ;; #:%uuid_clock-seq-low-request          ; INTERNAL
             ;; #:%uuid_node-request                   ; INTERNAL
             ;; #:uuid-request-integer                 ; INTERNAL
             ;; 
             ;; #:make-uuid-namespace-loadtime-vars    ; borken?
             ;;
             #:serialize-uuid
             #:uuid-eql
             #:uuid-digest-uuid-instance
             #:uuid-get-bytes-for-integer
             #:uuid-number-to-byte-array
             #:uuid-get-namespace-bytes
             #:uuid-to-byte-array
             #:uuid-from-byte-array
             #:uuid-princ-to-string
             #:make-uuid-from-string             
             #:format-uuid-as-urn
             #:uuid-string-to-sha1-byte-array
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




