

(defpackage #:dbc

            (:use #:common-lisp #:unicly)

	    ;; (:nicknames #:dbc-sys)

	    ;; Import relevant stuff from :mon
	    (:import-from #:mon
                          #:method-doc
                          #:generic-doc
                          #:fundoc
                          #:vardoc
                          #:typedoc
                          #:classdoc
                          #:make-documented-class
                          #:defconst*)

            (:import-from :dbc-build-system
                          #:*dbc-build-system-reloading-system*
                          #:*author-maintainer-contact*)

	    (:export

           ;; ==============================
             ;; specials.lisp
	     ;; :VARIABLE
             #:*system-path*
             #:*system-notes-dir*
             #:*system-tests-dir*
             #:*system-tests-temp-dir*
             ;;
             #:*xml-output-dir*
             #:*xml-output-refs-name*          ;; ---> OUTPUT
             #:*xml-output-refs-ext*           ;; ---> OUTPUT
             #:*xml-input-dir*                 ;; <--- INPUT
             ;;
             #:*parsed-class-table-csv-output-dir*
             #:*parsed-class-table-output-dir*
             #:*parsed-class-table-output-pathname-type*
             ;;
             #:*dbc-base-httpd-synced-item-number-image-pathname*
             #:*dbc-wild-httpd-synced-item-number-image-pathname-list*
             ;;
             #:*dbc-item-number-string-mapping-old-image-path-table*
             #:*dbc-item-number-path-source-destination-vector*
             #:*dbc-base-item-number-image-pathname*
             ;;
             #:*parsed-class-parse-table*
             #:*parsed-class-field-slot-accessor-mapping-table*
             #:*parsed-inventory-record-image-pathname-regex*

             ;; #:*parsed-inventory-record-class-name*
             ;; We no longer define `*parsed-inventory-record-class-name*'
             ;; it is now defined in
             ;; :FILE dbc-specific/dbc-classes/dbc-class-symbol-construct-deprecated.lisp

           ;; ==============================
             ;; conditions.lisp
	     #:dbc-error
	     #:system-path-error
             ;; reader system-path-error
             #:w-system-path-locus      ;; reader system-path-error
             #:w-system-object-locus    ;; reader system-path-error
             #:w-system-slot-locus      ;; reader system-path-error

           ;; ==============================
             ;; dbc-utils.lisp
             #:every-digit-char-p
             #:notevery-digit-char-p
             #:make-hash-table-sync
             #:with-locked-hash-table

           ;; ==============================
             ;; dbc-uuid/dbc-uuid.lisp 
             ;; :NOTE using UNICLYi instead kept here for posterity
             
           ;; ==============================
             ;; dbc-time/date-localtime-utils.lisp
             #:invalid-timestamp-component     ;; <CONDITION>
             #:invalid-timestamp-component-day ;; <CONDITION>
             #:nanosecond-range                ;; <TYPE>
             #:second-minute-range             ;; <TYPE>
             #:hour-range                      ;; <TYPE>
             #:month-range                     ;; <TYPE>
             #:year-range                      ;; <TYPE>
             #:year-range-non-zero-unsigned    ;; <TYPE>
             #:valid-nanosecond-date-p
             #:valid-nanosecond-date-or-error
             #:valid-second-date-p
             #:valid-second-date-or-error
             #:valid-minute-date-p
             #:valid-minute-date-or-error
             #:valid-hour-date-p
             #:valid-hour-date-or-error
             #:valid-day-date-p
             #:valid-day-date-or-error
             #:valid-month-date-p
             #:valid-month-date-or-error
             #:valid-year-date-p
             #:valid-year-date-or-error
             #:valid-year-date-non-zero-unsigned-p
             #:valid-year-date-non-zero-unsigned-or-error
             #:valid-timestamp-or-error
             #:timestamp-year-only-p
             #:timestamp-year-month-only-p
             #:timestamp-year-month-day-p
             #:make-timestamp-year-only
             #:make-timestamp-year-month-only
             #:make-timestamp-year-month-day
             #:def-century-timestamp           ;; <MACRO>

           ;; ==============================
	     ;; dbc-classes/dbc-class.lisp
             #:base-dbc                        ;; <CLASS>

           ;; ==============================
             ;; dbc-classes/dbc-class-paths.lisp
             ;;
             ;; :GENERIC-FUNCTION
	     #:system-base-path                ;; system-base-path
	     #:system-path-var-binding
	     #:system-described
             #:system-path-if
             #:system-parent-path-ensure
	     ;; :CLASS
	     #:system-base
	     #:system-path
	     #:system-subdir
             ;; :ACCESSOR
             #:sub-name                        ;; system-subdir
             #:sub-path                        ;; system-subdir
             #:parent-path                     ;; system-subdir
             ;;
	     ;; :FUNCTION
	     #:find-system-path
	     #:system-path-xml-dump-dir-ensure
             #:system-subdir-init-w-var        ;; :renamed :from `make-system-subdir'

           ;; ==============================
             ;; dbc-classes/dbc-class-uuid.lisp
             #:base-uuid

           ;; ==============================
             ;; dbc-classes/dbc-class-system-object-uuid.lisp
             #:system-object-uuid              ;; <CLASS>
             #:system-identity
             #:system-identity-parent-uuid
             #:system-identity-uuid
             #:system-identity-uuid-byte-array
             #:system-identity-uuid-bit-vector
             #:system-identity-uuid-integer
             #:system-identity-uuid-string-36
             #:system-identity-uuid-version
             #:make-system-object-uuid
             #:system-object-uuid-description

           ;; ==============================
             ;; dbc-classes/dbc-class-uuid-vars.lisp
             ;; :NOTE `*system-object-uuid-base-namespace*' is base namespace object for
             ;; instantiation of the *conctrol-id-<FOO>-namespace*'s below
             ;;
             ;; :NOTE `*control-id-namespace-table*' is the interface for
             ;; dereferencing the *conctrol-id-<FOO>-namespace*'s enumerated below:
             #:*control-id-namespace-table*
             #:*system-object-uuid-base-namespace*
             #:*control-id-inventory-namespace*
             #:*control-id-inventory-publication-namespace*
             #:*control-id-inventory-sales-order-namespace*
             #:*control-id-inventory-sales-sold-namespace*
             #:*control-id-inventory-sales-sold-in-store-namespace*
             #:*control-id-documentation-namespace*
             #:*control-id-authority-namespace*
             #:*control-id-category-namespace*
             #:*control-id-theme-namespace*
             #:*control-id-location-namespace*
             #:*control-id-taxon-namespace*
             #:*control-id-technique-namespace*
             #:*control-id-mount-namespace*
             #:*control-id-material-namespace*
             #:*control-id-paper-namespace*
             #:*control-id-artist-namespace*
             #:*control-id-brand-namespace*
             #:*control-id-author-namespace*
             #:*control-id-person-namespace*
             #:*control-id-publication-namespace*
             #:*control-id-image-namespace*
             
           ;; ==============================
             ;; /dbc-classes/dbc-class-parse-record.lisp
             #:base-record                        ;; <CLASS>

           ;; ==============================
             ;; /dbc-classes/dbc-class-inventory-record.lisp
             ;;             /dbc-class-inventory-publication-record.lisp
             ;;             /dbc-class-inventory-sales-record.lisp
             ;;             /dbc-class-authority-record.lisp
             #:base-inventory-record
             #:base-inventory-publication-record
             #:base-inventory-sales-record
             #:base-inventory-sales-order-record
             #:base-inventory-sales-sold-record
             #:base-inventory-sales-sold-in-store-record

           ;; ==============================
             ;; dbc-classes/dbc-class-entity.lisp
             #:base-entity
             #:base-category-entity
             #:base-theme-entity
             #:base-naf-entity
             #:base-media-entity
             #:base-location-entity
             #:base-taxon-entity
             
           ;; ==============================             
             ;; dbc-specific/dbc-classes/dbc-class-control-id.lisp
             #:control-id-slot-missing-error           ;; <GENERIC-FUNCTION>
             #:control-id-slot-unbound-error           ;; <GENERIC-FUNCTION>
             #:control-id-slot-value-null-error        ;; <GENERIC-FUNCTION>
             #:control-id-of-class-type-null-error     ;; <GENERIC-FUNCTION>
             #:control-id-of-class-type                ;; <GENERIC-FUNCTION>
             #:control-id-namespace-null-error         ;; <GENERIC-FUNCTION>
             #:control-id-namespace                    ;; <GENERIC-FUNCTION>
             #:control-id-identifies-null-error        ;; <GENERIC-FUNCTION>
             #:control-id-identifies                   ;; <GENERIC-FUNCTION>
             #:control-id-uuid-null-error              ;; <GENERIC-FUNCTION>
             #:control-id-uuid                         ;; <GENERIC-FUNCTION>
             #:dbc-class-with-slot-unbound-error       ;; <GENERIC-FUNCTION>
             #:dbc-class-with-slot-value-null-error    ;; <GENERIC-FUNCTION>
             #:dbc-class-with-slot-missing-error       ;; <GENERIC-FUNCTION>
             #:control-id-indexed-number
             #:control-id-record-indexed-number
             #:control-id-display-name
             #:control-id-display-name-for-entity-type
             #:base-control-id
             #:control-id-type
             ;;
             #:control-id-record-type
             #:control-id-inventory-record-type
             #:control-id-documentation-record-type
             #:control-id-authority-record-type
             #:control-id-inventory-publication-record-type
             #:control-id-entity-type
             #:control-id-naf-entity-type
             #:control-id-theme-entity-type
             #:control-id-media-entity-type
             #:control-id-location-entity-type
             #:control-id-category-entity-type
             #:control-id-taxon-entity-type
             ;; Inventory Record
             #:control-id-inventory-record
             #:control-id-indexed-inventory-record
             ;; Publication
             #:control-id-inventory-publication-record
             #:control-id-indexed-inventory-publication-record
             ;; Documentation Record
             #:control-id-documentation-record
             #:control-id-indexed-documentation-record
             ;; Authority Record
             #:control-id-authority-record
             #:control-id-indexed-authority-record
             ;; Media Entity
             #:control-id-media-entity
             #:control-id-media-entity-display-name
             #:control-id-media-entity-indexed-number
             ;; Technique
             #:control-id-technique
             #:control-id-display-technique
             #:control-id-indexed-technique
             ;; Material
             #:control-id-material
             #:control-id-display-material
             #:control-id-indexed-material
             ;; Mount Entity
             #:control-id-mount
             #:control-id-display-mount
             #:control-id-indexed-mount
             ;; Paper Entity
             #:control-id-paper
             #:control-id-display-paper
             #:control-id-indexed-paper
             ;; Category Entity
             #:control-id-display-category             ;; <GENERIC-FUNCTION>
             #:control-id-category-entity
             #:control-id-category-entity-display-name
             #:control-id-category-entity-indexed-number
             #:control-id-display-category
             #:control-id-indexed-category
             ;; Top Level Category Entities
             #:category-id-display-advertising-and-graphics
             #:category-id-display-architecture-and-design
             #:category-id-display-books-and-publications
             #:category-id-display-geography
             #:category-id-display-historical-life-and-scenes
             #:category-id-display-natural-history
             ;; Theme Entity Display Names
             #:control-id-theme-entity
             #:control-id-theme-entity-display-name
             #:control-id-theme-entity-indexed-number
             #:control-id-theme
             #:control-id-display-theme
             #:control-id-indexed-theme
             ;; Taxon Entity
             #:control-id-taxon
             #:control-id-taxon-entity
             #:control-id-taxon-entity-display-name
             #:control-id-taxon-entity-indexed-number
             #:control-id-display-taxon
             #:control-id-indexed-taxon
             ;; Location Entity
             #:control-id-location-entity
             #:control-id-location-entity-display-name
             #:control-id-location-entity-indexed-number
             #:control-id-display-location
             ;; Naf-Entity Display Names
             #:control-id-naf-entity
             #:control-id-naf-entity-display-name
             #:control-id-naf-entity-indexed-number
             ;; Aritst
             #:control-id-naf-entity-artist
             #:control-id-display-artist
             #:control-id-indexed-artist
             ;; Author
             #:control-id-naf-entity-author
             #:control-id-display-author
             #:control-id-indexed-author
             ;; Person
             #:control-id-naf-entity-person
             #:control-id-display-person
             #:control-id-indexed-person
             ;; Brand
             #:control-id-naf-entity-brand
             #:control-id-display-brand
             #:control-id-indexed-brand
             ;; Publication
             #:control-id-naf-entity-publication
             #:control-id-display-publication
             #:control-id-indexed-publication

           ;; ==============================
             ;; /dbc-classes/dbc-class-dbc-class-naf-entity.lisp
             #:naf-entity-artist
             #:naf-entity-author
             #:naf-entity-person
             #:naf-entity-brand
             #:naf-entity-publication
             
           ;; ==============================
             ;; dbc-classes/dbc-class-edit.lisp
              #:base-edit             

           ;; ==============================
             ;; /dbc-classes/dbc-class-theme-entity
              #:theme-entity
              #:dbc-theme-request-loc-x-uri

           ;; ==============================
              ;; dbc-classes/dbc-class-media-entity.lisp
              #:media-entity-technique
              #:media-entity-technique
              #:media-entity-material
              #:media-entity-paper
              #:media-entity-mount
              #:media-entity-color
              
           ;; ==============================
              ;; /dbc-classes/dbc-class-location-entity.lisp
              #:location-entity
              #:location-entity-verified
              #:location-entity-imagined
              #:location-entity-unverified
              
           ;; ==============================
              ;; /dbc-classes/dbc-class-taxon-entity.lisp
              #:taxon-entity
              
           ;; ==============================
              ;; /dbc-classes/dbc-class-regexps.lisp
           ;; ==============================
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
             #:parsed-field-name-regexp  ;; don't need this one anymore.
             #:theme-entity-regexp
             #:category-entity-regexp
             #:media-entity-regexp
             #:location-entity-regexp
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
             ;; :VARIABLE
             #:*category-entity-regexp-db*
             #:*theme-entity-regexp-db*
             #:*media-entity-regexp-db*
             #:*location-entity-regexp-db*
             #:*parsed-field-name-regexp-db*
             #:*naf-entity-artist-regexp-db*
             #:*naf-entity-person-regexp-db*
             #:*naf-entity-author-regexp-db*
             #:*naf-entity-brand-regexp-db*
             #:*naf-entity-publication-regexp-db*
             ;;
             #:make-entity-regexp-subclass-allocation-if
             #:make-entity-regexp-subclass-allocation

           ;; ==============================
             ;; dbc-classes/dbc-class-users.lisp
             #:base-user

           ;; ==============================
             ;; dbc-classes/dbc-class-description.lisp
             #:base-description             

           ;; ==============================
              ;; dbc-classes/dbc-class-documentation-record.lisp
             #:base-documentation-record
             #:documentation-record-sitedoc

           ;; ==============================
             ;; dbc-classes/ dbc-class-parsed-documentation-record.lisp
             #:parsed-documentation-record

             ;; but actually defined in loaadtime-bind.lisp
             #:set-parsed-documentation-record-slot-value
             #:parsed-documentation-record-xml-dump-file-and-hash
             #:write-parsed-documentation-record-parse-table-to-file
             #:load-parsed-documentation-record-default-file-to-parse-table
             #:write-parsed-doc-record-parse-table-to-csv-file

           ;; ==============================
             ;; dbc-classes/dbc-class-parsed.lisp
             ;; :GENERIC-FUNCTION
             #:initargs-of-parsed-class
             #:parsed-class-slot-dispatch-function
             #:parsed-class-parse-table
             #:field-to-accessor-table
             #:accessor-to-field-table
             #:parsed-class-mapped
             #:accessor-to-field-mapping
             #:field-to-accessor-mapping
             #:fields-of-parsed-class
             #:accessors-of-parsed-class
             #:parsed-class-parse-table-lookup
             #:parsed-class-parse-table-lookup-slot-value
             #:%parsed-class-subtype-check
             #:%parsed-class-slot-exists-for-parsed-class-check
             ;; :ACCESSOR for subclasses of `parsed-class'
             #:naf-entity-author-coref
             #:naf-entity-person-coref
             #:naf-entity-publication-coref
             #:naf-entity-brand-coref
             #:image-default-id
             #:edit-by
             #:edit-by-creator
             #:edit-timestamp-origin
             #:edit-timestamp
             #:naf-entity-gender-type
             #:lifespan-date
             #:birth-date
             #:death-date
             #:location-birth
             #:location-death
             #:location-nationality
             #:control-id-authority-0
             #:control-id-authority-1
             #:image-default-xref
             #:record-status-active
             ;; :FUNCTION
             ;; #:%parsed-class-parse-table-make-table
             ;; :CLASS
             #:parsed-class
             #:parsed-naf-entity

           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-slot-value-equal.lisp
             #:parsed-class-slot-value-equal
             
           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-field-slot-mapping
             #:parsed-class-field-slot-accessor-mapping
             #:%parsed-class-mapped-with-known-key-helper
             #:make-parsed-class-field-slot-accessor-mapping
             #:%parsed-class-record-setf-slot-value-forms
             
           ;; ==============================
             ;; /dbc-classes/dbc-class-parse-convert.lisp
             #:control-id-indexed-number-for-zero-padded-string-integer-range
             #:control-id-indexed-number-for-zero-padded-string-integer-string-length
             #:control-id-indexed-number-for-zero-padded-string-integer-range-validate
             #:control-id-indexed-number-for-zero-padded-string-integer-string-length-validate
             #:control-id-indexed-number-zero-padded-string
             #:load-sax-parsed-xml-file-to-parsed-class-hash
             #:print-sax-parsed-slots-padding-format-control
             #:print-sax-parsed-slots
             #:write-sax-parsed-slots-to-file
             #:write-parsed-class-parse-table-to-file
             #:load-parsed-class-default-file-to-hash-table
             #:write-sax-parsed-class-hash-to-files
             #:write-parsed-inventory-record-parse-table-to-files
             #:write-sax-parsed-inventory-record-hash-to-zero-padded-directory
             #:def-parsed-class-write-parse-table-to-file
             #:def-parsed-class-load-default-parsed-file-to-hash
             #:def-parsed-class-record-xml-dump-file-and-hash             
             
           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-slot-value-format.lisp
             #:parsed-class-slot-value-format-string-list
             #:parsed-class-slot-value-format-image-pathnames
             #:parsed-class-slot-value-format-delimited-string-list
             #:parsed-class-slot-value-format-price
             #:parsed-class-slot-value-format-unit-dimension
             #:parsed-class-slot-value-format-date-plist
             
           ;; ==============================
             ;; dbc-classes/dbc-class-image.lisp
             #:base-image
             
           ;; ==============================
             ;; dbc-classes/dbc-class-uuid-namespace-for-control-id.lisp
             ;;
             ;; #:uuid-namespace-control-id                       ;; <CLASS>
             ;; #:uuid-namespace-for-control-id-class             ;; <GENERIC/SLOT>
             ;; #:uuid-namespace-byte-array-for-control-id-class  ;; <GENERIC/SLOT>
             ;; #:uuid-namespace-bit-vector-for-control-id-class  ;; <GENERIC/SLOT>
             ;; #:uuid-namespace-version-for-control-id-class     ;; <GENERIC/SLOT>
             ;; #:uuid-namespace-for-control-id-class-description
             ;; #:make-uuid-namespace-control-id


           ;; ==============================
             ;; dbc-classes/dbc-specific/dbc-class-techniques-convert.lisp
             #:media-technique-entity

           ;; ==============================
             ;; dbc-classes/dbc-class-entity-location.lisp
             ;; #:location-entity              ;; :SLOTS appellations-modern appellations-historic
             ;; #:location-entity-verified
             ;; #:location-entity-imagined
             ;; #:location-entity-unverified


           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-inventory-record.lisp
             ;;
             ;; :NOTE exporting parsed-inventory-record is not a good idea
             ;; because we use the class-name of subclasses of parsed-class as
             ;; keys in various hash-tables and exporting the symbol makes the
             ;; interface different for other parsed-<foo>-record classes
             ;; #:parsed-inventory-record          ;; <CLASS>

             #:parsed-inventory-record-parse-table-lookup-slot-value
             #:parsed-inventory-record-parse-table-lookup
             #:def-parsed-inventory-record-parse-table-lookup-slot-value
             #:%parsed-inventory-record-parse-table-lookup-slot-value-maybe-remove
             #:parsed-inventory-record-image-file-pathnames-update
             #:inventory-record-image-jpg-probe-all-updating-hash-value
             #:%parsed-inventory-record-image-file-pathname-valid-p-or-error
             #:%parsed-inventory-record-image-file-pathname-match
             #:parsed-inventory-record-image-file-pathname-get
             #:parsed-inventory-record-null-prototype
             #:parsed-inventory-record-null-prototype-to-file
             #:parsed-inventory-record-publication-date-lookup-get-year
             #:parsed-inventory-record-publication-date-lookup-get-month
             #:parsed-inventory-record-publication-date-lookup-get-day
             #:parsed-inventory-record-description-inventory-condition-lookup-get-rating
             #:parsed-inventory-record-description-inventory-condition-lookup-get-description
             
           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-artist-record.lisp
             ;; #:parsed-artist-record
             #:parsed-artist-record-collect-control-id-display
             
           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-author-record.lisp
             ;; #:parsed-author-record
             #:parsed-author-record-collect-control-id-display

           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-person-record.lisp
             ;; #:parsed-person-record
             #:parsed-person-record-collect-control-id-display
             
           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-brand-record.lisp
             ;; #:parsed-brand-record
             #:parsed-brand-record-collect-control-id-display
             
           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-technique-record.lisp
             ;; #:parsed-technique-record
             
           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-publication-record.lisp
             ;; #:parsed-publication-record
             #:parsed-publication-record-collect-control-id-display
             
           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-theme-record.lisp
             ;; #:parsed-theme-record
             ;; #:%parsed-theme-record-find-display-theme
             ;; #:%parsed-theme-record-find-duplicate-control-id-display-theme
             
           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-documentation-record.lisp
             ;; #:parsed-documentation-record

           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-trasnlation-for-inventory-record.lisp
             ;; #:parsed-translation-for-inventory-record
             ;; #:parsed-inventory-sales-order-record
             
           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-inventory-sales-order-record.lisp
             ;; #:parsed-inventory-sales-order-record

           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-inventory-sales-sold-record.lisp
             
           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-nventory-sales-sold-in-store-record.lisp
             ;; #:parsed-inventory-sales-sold-in-store-record
             
           ;; ==============================
             ;; dbc-classes/dbc-class-image-path-convert.lisp
             #:def-dbc-item-match-pathname-pattern
             #:%ensure-dbc-base-http-synced-item-number-image-pathname-exists
             #:%make-httpd-synced-item-number-image-wild-pathname-list
             #:dbc-item-number-path-lookup-table-populate
             #:map-item-image-source-destination-paths
             #:dbc-item-match-image-pathname-pattern
             #:dbc-item-match-big-path
             #:dbc-item-match-small-path
             #:dbc-item-match-zoom-path
             #:dbc-item-match-frame-path
             #:dbc-item-match-header-path
             #:dbc-item-match-flash-path-categ
             #:dbc-item-match-flash-path-large
             #:dbc-item-match-flash-path-thumb
             #:dbc-item-match-flash-path
             #:dcp-item-image-copy-byte-stream
             #:dcp-item-image-copy-byte-file
             
           ;; ==============================
             ;; dbc-classes/dbc-class-image-path-inventory-record.lisp
             #:inventory-record-image-directory-probe
             #:inventory-record-image-jpg-probe
             #:inventory-record-image-jpg-probe-all
             
           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-csv-writer.lisp
             #:parsed-class-csv-clean-prefix-for-file-name
             #:write-parsed-class-parse-table-to-csv-file
             #:def-parsed-class-write-csv-file

           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-slot-value-cleaning.lisp
             #:parsed-class-slot-value-sort-unique-numeric-string-sequence
             #:parsed-class-slot-value-compare-count
             #:parsed-class-slot-value-count-null
             #:parsed-class-slot-value-count-non-null
             #:parsed-class-slot-value-count-string=
             #:parsed-class-slot-value-count-eql
             #:parsed-class-slot-value-count-equal
             #:parsed-class-slot-value-count-equalp
             #:parsed-class-slot-value-count-string/=
             #:parsed-class-slot-value-count-not-eql
             #:parsed-class-slot-value-count-not-equal
             #:parsed-class-slot-value-count-not-equalp
             #:parsed-class-slot-value-always-string=
             #:parsed-class-slot-value-always-null
             #:parsed-class-slot-value-always-eql
             #:parsed-class-slot-value-always-equal
             #:parsed-class-slot-value-always-equalp
             #:parsed-class-slot-value-never-null
             #:parsed-class-slot-value-never-string=
             #:parsed-class-slot-value-never-eql
             #:parsed-class-slot-value-never-equal
             #:parsed-class-slot-value-never-equalp
             #:parsed-class-slot-value-thereis-null
             #:parsed-class-slot-value-thereis-string=
             #:parsed-class-slot-value-thereis-eql
             #:parsed-class-slot-value-thereis-equal
             #:parsed-class-slot-value-thereis-equalp
             #:parsed-class-slot-value-collect-all
             #:parsed-class-slot-value-collect-string=
             #:parsed-class-slot-value-collect-null
             #:parsed-class-slot-value-collect-non-null
             #:parsed-class-slot-value-collect-eql
             #:parsed-class-slot-value-collect-equal
             #:parsed-class-slot-value-collect-equalp
             #:parsed-class-slot-value-collect-not-eql
             #:parsed-class-slot-value-collect-not-equal
             #:parsed-class-slot-value-collect-not-equalp
             #:parsed-class-slot-value-collect-slot-values-using-slot-list
             #:parsed-class-slot-value-set-when-null
             #:parsed-class-slot-value-set-when-string=
             #:parsed-class-slot-value-set-when-eql
             #:parsed-class-slot-value-set-when-equal
             #:parsed-class-slot-value-set-when-equalp
             #:parsed-class-slot-value-set-when-string/=
             #:parsed-class-set-slot-value-from-proper-list
             #:parsed-class-slot-value-collect-split-bag

           ;; ==============================
             ;; dbc-classes/dbc-class-parsed-tgm-theme-record.lisp
             #:*parsed-tgm-theme-output-dir*
             #:*parsed-tgm-theme-input-dir*
             #:*parsed-tgm-theme-xml-source-pathname*
             #:*parsed-tgm-theme-xml-source*
             #:*parsed-tgm-theme-record-hash-table*
             #:*parsed-tgm-theme-field-to-accessor-table*
             #:parsed-tgm-theme-record                        ;; <CLASS>
             #:%print-parsed-tgm-theme-record-helper
             #:tgm-parse-concepts-set-source-xml-file
             #:tgm-parse-concepts-make-source
             #:tgm-assoc-elt
             #:tgm-peeking
             #:tgm-peeking-get-val
             #:tgm-consume
             #:tgm-characters-every-whitespace-p
             #:tgm-start-element-consume
             #:%tgm-sec-helper
             #:tgm-peek-start-element-and-maybe-add-to-slot
             #:tgm-parse-concept
             #:tgm-parse-concepts-update-unbound-slots
             #:tgm-parse-concepts-in-stream
             #:write-parsed-tgm-theme-record-parse-table-to-file
             #:load-parsed-tgm-theme-record-parse-file-to-hash-table
             #:tgm-parse-concept-count-slot-value-list-length
             #:tgm-parse-concept-count-slot-value-null
             #:tgm-parse-concept-count-parsed-theme-record-diff

           ;; ==============================
             ;; :MODULE dbc-parse
           ;; ==============================
             ;; dbc-parse/dbc-cln-parse.lisp
             #:field-name-underscore-to-dash
	     #:field-string-cons
	     #:field-cln-x
             #:field-name-convert-field-name
	     ;; mon:string-split-on-chars
	     #:split-used-fors
              #:split-bag
	     ;;
	     ;; mon:string-split-on-chars, mon:string-trim-whitespace
	     #:split-appeared-in
	     ;; mon:string-split-on-chars
	     #:split-roles
	     ;; mon:make-string*
	     #:format-entity-role
	     ;; mon:string-trim-whitespace, mon:concat, mon:string-split-on-chars
	     #:split-date-range
	     #:split-date-range-string-int-pairs
	     ;; mon:string-null-or-empty-p, mon:string-split-on-chars, mon:string-trim-whitespace
	     #:split-comma-field
	     #:split-loc-pre
             #:split-field-on-char-if
             #:split-comma-field-if
             #:split-piped-field-if
             #:field-convert-verify-string
             #:field-convert-remove-duplicates
             #:field-convert-empty-string-nil
	     #:field-convert-1-0-x
             #:field-convert-1-0-x-empty
             #:field-convert-1-0-x-empty-known

           ;; ==============================
             ;; dbc-parse/dbc-xml-sql-parse.lisp
	     ;;
	     ;; klacks:get-attribute klacks:current-lname
	     ;; klacks:current-characters klacks:consume
	     ;; cxml:make-source klacks:with-open-source
	     ;; klacks:map-attributes klacks:get-attribute
	     ;; klacks:current-lname klacks:current-characters
	     ;; klacks:consume klacks:peek
	     ;; mon:string-trim-whitespace
             ;;
             #:with-namespaces                  ;; <MACRO>
             ;; #:with-soap-envelope            ;; <MACRO>
             ;;
             #:peek-skipping-comments
             #:xml-whitespace-p
             #:consume-whitespace
             #:start-element-p
             #:end-element-p
             #:end-element-and-local-present-p
             #:start-element-and-attribute-present-p
             #:end-document-find-and-close
             ;;
	     #:field-table-parse-out
	     ;;
	     ;; cxml::cxml-source klacks:peek klacks:map-attributes
	     #:field-parse-attribs
             #:field-attribs-consume-if
             #:field-attribs-find
             #:field-attribs-find-normalize-names

           ;; ==============================
             ;; dbc-parse/dbc-xml-refs-parse.lisp
             #:field-parse-refs

           ;; ==============================
	     ;; dbc-parse/psa-parse-table.lisp
	     ;; #:*psa-fl*
	     ;; #:*tr-gthr*
	     ;; #:*curr-src*
	     ;; #:html2xhtml
	     ;; #:psa-handler
	     ;; #:filter-tr
	     ;; #:p/totals-strip-commas
	     ;; ;;#:p/totals-strip-whitespace
	     ;; #:p/sax-integer-string            ;; `string-to-number'
	     ;; #:p/sax-float-string              ;; `string-to-number'
	     ;; #:p/sax-extract-tr

           ;; ==============================
             ;; dbc-translate/dbc-french-numbers.lisp
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

           ;; ==============================
             ;; dbc-translate/dbc-french-dates.lisp
              #:*french-weekday-names*
              #:*french-month-names*
              
           ;; ==============================
             ;; loadtime-bind.lisp

              ;;
              ;; :DEPRECATED
              ;; #:*parsed-inventory-record-field-name-slot-transform* ;; dbc-class-refs-convert.lisp
              ;; #:*xml-input-refs-name*       ;; <--- INPUT
              ;; #:*xml-input-refs-name-temp*  ;; <--- INPUT
              ;; #:*regexp-whitespace-chars* ;; VARIABLE
              ;; #:preprocess-whitespace
              ;; #:preprocess-leading-trailing-dashes
              ;; #:preprocess-underscore-to-dash
              ;; #:preprocess-string-case
              ;; #:make-parsed-name-preprocess
              ;; #:preprocess-slot-transform
              ;; #:make-parsed-class-slot-init-accessor-name
              ;; #:make-ref-maker-sym-name
              ;; #:make-ref-maker-symbol
              ;; #:make-ref-lookup-table
              ;;
	    ))


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: nil
;; mode: lisp-interaction
;; package: DBC
;; End:

;;; ==============================
;;; EOF
