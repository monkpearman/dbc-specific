;;; :FILE-CREATED <Timestamp: #{2011-01-04T16:36:51-05:00Z}#{11012} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parsed-artist-record-record.lisp
;;; ==============================

;; Following defined in loadtime-bind.lisp
;; `set-parsed-artist-record-slot-value'
;; `parsed-artist-record-xml-dump-file-and-hash'
;; `write-parsed-artist-record-parse-table-to-file'
;; `load-parsed-artist-record-default-file-to-parse-table'
;; `write-parsed-artist-record-parse-table-to-csv-file'

;;; ==============================
;;; Clean these up first with emacs regexp: 
;;;  (while (search-forward-regexp " xsi:nil=\"true\" />" nil t) (replace-match "></field>"))
;;;
;;; ==============================


(in-package #:dbc)

;; (length (mon:class-slot-list 'parsed-artist-record))

;; To get at just the string of the original field:
;; (while (search-forward-regexp ":ORIGINAL-FIELD \\(\\\\\"\\)\\(.*\\)\\(\\\\\"\\)")
;;   (replace-match "\\2"))
;;
(defclass parsed-artist-record (parsed-naf-entity)

  (
   ;; control-id-indexed-artist
   (control-id-entity-num-artist
    :initarg :control-id-entity-num-artist
    :accessor control-id-entity-num-artist
    :documentation ":ORIGINAL-FIELD \"id\"")

   ;; control-id-indexed-documentation-record
   (control-id-doc-num-artist
    :initarg :control-id-doc-num-artist
    :accessor control-id-doc-num-artist
    :documentation ":ORIGINAL-FIELD \"bio\"")

   ;; control-id-naf-entity-display-name
   (control-id-display-artist
    :initarg :control-id-display-artist
    :accessor control-id-display-artist
    :documentation ":ORIGINAL-FIELD \"display\"")

   (naf-entity-artist-display-name-coref
    :initarg :naf-entity-artist-display-name-coref
    :accessor naf-entity-artist-display-name-coref
    :documentation ":ORIGINAL-FIELD \"used_for\"")

   (naf-entity-role-appearance-coref
    :initarg :naf-entity-role-appearance-coref
    :accessor naf-entity-role-appearance-coref
    :documentation ":ORIGINAL-FIELD \"role\"")

   ;; shares-generic
   (naf-entity-gender-type
    :initarg :naf-entity-gender-type
    :accessor naf-entity-gender-type
    :documentation ":ORIGINAL-FIELD \"gender\"")

   ;; shares-generic
   (lifespan-date
    :initarg :lifespan-date
    :accessor lifespan-date
    :documentation ":ORIGINAL-FIELD \"lifespan\"")

   ;; shares-generic
   (birth-date
    :initarg :birth-date
    :accessor birth-date
    :documentation ":ORIGINAL-FIELD \"date_born\"")

   ;; shares-generic
   (death-date
    :initarg :death-date
    :accessor death-date
    :documentation ":ORIGINAL-FIELD \"date_died\"")

   ;; shares-generic
   (location-birth
    :initarg :location-birth
    :accessor location-birth
    :documentation ":ORIGINAL-FIELD \"birth_location\"")

   ;; shares-generic
   (location-death
    :initarg :location-death
    :accessor location-death
    :documentation ":ORIGINAL-FIELD \"death_location\"")

   ;; shares-generic
   (location-nationality
    :initarg :location-nationality
    :accessor location-nationality
    :documentation ":ORIGINAL-FIELD \"nationality\"")

   ;; shares-generic
   (control-id-authority-0 ;; LOC 
    :initarg :control-id-authority-0
    :accessor control-id-authority-0
    :documentation ":ORIGINAL-FIELD \"LOC_control\"")

   ;; shares-generic
   (control-id-authority-1 ;; ULAN
    :initarg :control-id-authority-1
    :accessor control-id-authority-1
    :documentation ":ORIGINAL-FIELD \"ULAN_control\"")

   ;; shares-generic
   (naf-entity-author-coref
    :initarg :naf-entity-author-coref
    :accessor naf-entity-author-coref
    :documentation ":ORIGINAL-FIELD \"also_author\"")

   ;; shares-generic
   (naf-entity-person-coref
    :initarg :naf-entity-person-coref
    :accessor naf-entity-person-coref
    :documentation ":ORIGINAL-FIELD \"also_people\"")

   ;; shares-generic
   (naf-entity-publication-coref
    :initarg :naf-entity-publication-coref
    :accessor naf-entity-publication-coref
    :documentation ":ORIGINAL-FIELD \"appeared_in\"")

   ;; shares-generic
   (naf-entity-brand-coref
    :initarg :naf-entity-brand-coref
    :accessor naf-entity-brand-coref
    :documentation ":ORIGINAL-FIELD \"ads_for\"")

   (description-artist-note-general
    :initarg :description-artist-note-general
    :accessor description-artist-note-general
    :documentation ":ORIGINAL-FIELD \"found_in\"")

   (description-artist-note-sale-appearance
    :initarg :description-artist-note-sale-appearance
    :accessor description-artist-note-sale-appearance
    :documentation ":ORIGINAL-FIELD \"auction_records\"")

   ;; shares-generic
   (image-default-id
    :initarg :image-default-id
    :accessor image-default-id
    :documentation ":ORIGINAL-FIELD \"default_pic\"")

   ;; shares-generic
   (image-default-xref
    :initarg :image-default-xref
    :accessor image-default-xref
    :documentation ":ORIGINAL-FIELD \"print_default_pic\"")
   
   ;; shares-generic
   (record-status-active
    :initarg :record-status-active
    :accessor record-status-active
    :documentation ":ORIGINAL-FIELD \"online\"")

   ;; shares-generic
   (edit-by
    :initarg :edit-by
    :accessor edit-by
    :documentation ":ORIGINAL-FIELD \"user_name\"")

   ;; shares-generic
   (edit-by-creator
    :initarg :edit-by-creator
    :accessor edit-by-creator
    :documentation ":ORIGINAL-FIELD \"naf_creator\"")

   ;; shares-generic
   (edit-timestamp-origin ;; date_edt is the good one IGNORABLE assuming date_edit is present and corresponds.
    :initarg :edit-timestamp-origin
    :accessor edit-timestamp-origin
    :documentation ":ORIGINAL-FIELD \"date_edit\"")

   ;; shares-generic
   (edit-timestamp
    :initarg :edit-timestamp
    :accessor edit-timestamp
    :documentation ":ORIGINAL-FIELD \"date_edt\"")

   (ignorable-cancel-num
    :initarg :ignorable-cancel-num
    :accessor ignorable-cancel-num
    :documentation ":ORIGINAL-FIELD \"cancel_num\"")

   (ignorable-special-note
    :initarg :ignorable-special-note
    :accessor ignorable-special-note
    :documentation ":ORIGINAL-FIELD \"special_note\""))
  (:documentation
   #.(format nil
             "Class for parsed dbc XML `artist_infos` table.~%~@
:EXAMPLE~%
 \(mon:class-slot-list  'parsed-inventory-record\)~%~@
:NOTE the accessor `control-id-entity-num-artist' should be used as value for the
KEY-ACCESSOR keyword of `load-sax-parsed-xml-file-to-parsed-class-hash'.~%
:SEE-ALSO `load-sax-parsed-xml-file-to-parsed-class-hash',
`write-sax-parsed-xml-refs-file', `set-parse-ref-slot-value', `parsed-inventory-record'.~%▶▶▶")))

(make-parsed-class-field-slot-accessor-mapping 
 'parsed-artist-record
 '(("id"                . control-id-entity-num-artist)
   ("bio"               . control-id-doc-num-artist)
   ("display"           . control-id-display-artist)
   ("used_for"          . naf-entity-artist-display-name-coref)
   ("role"              . naf-entity-role-appearance-coref)
   ("gender"            . naf-entity-gender-type)
   ("lifespan"          . lifespan-date)
   ("date_born"         . birth-date)
   ("date_died"         . death-date)
   ("birth_location"    . location-birth)
   ("death_location"    . location-death)
   ("nationality"       . location-nationality)
   ("LOC_control"       . control-id-authority-0)
   ("ULAN_control"      . control-id-authority-1)
   ("also_author"       . naf-entity-author-coref) ;*
   ("also_people"       . naf-entity-person-coref) ;*
   ("appeared_in"       . naf-entity-publication-coref) ;*
   ("ads_for"           . naf-entity-brand-coref) ;*
   ("found_in"          . description-artist-note-general)
   ("auction_records"   . description-artist-note-sale-appearance)
   ("default_pic"       . image-default-id)
   ("print_default_pic" . image-default-xref)
   ("online"            . record-status-active)
   ("user_name"         . edit-by)
   ("naf_creator"       . edit-by-creator)
   ("date_edit"         . edit-timestamp-origin)
   ("date_edt"          . edit-timestamp)
   ("cancel_num"        . ignorable-cancel-num)
   ("special_note"      . ignorable-special-note)))

(defun parsed-artist-record-collect-control-id-display ()
  (sort
   (map 'list #'cdr 
        (parsed-class-slot-value-collect-non-null 'parsed-artist-record 'control-id-display-artist))
   #'string<))

(defmethod print-object ((object parsed-artist-record) stream)
  (let* ((control-num (and (slot-boundp object 'control-id-entity-num-artist)
                           (slot-value object  'control-id-entity-num-artist)))
         (control-id-display (and (slot-boundp object 'control-id-display-artist)
                                  (slot-value object  'control-id-display-artist)))
         ;; (control-num-if (and (stringp control-num)
         ;;                  (control-id-indexed-number-zero-padded-string control-num)))
         )
    ;; (declare (mon:string-or-null control-num-if))
    ;; (print-unreadable-object (object stream :type t :identity (not control-num-if))
    ;;   (format stream "~S" control-num-if))))
    (declare (mon:string-or-null control-num control-id-display))
    (print-unreadable-object (object stream :type t :identity (not control-num))
      (format stream ":CONTROL-ID-ENTITY-NUM ~S :CONTROL-ID-DISPLAY-NAME ~S" control-num control-id-display))))

;; :NOTE `set-parsed-inventory-record-slot-value' is defined in loadtime-bind.lisp
;; (def-set-parsed-class-record-slot-value 
;;      set-parsed-artist-record-slot-value
;;      parsed-artist-record)
;;
;;; *parsed-class-field-slot-accessor-mapping-table*

;; :NOTE Depreated use the macro'd version generated with `def-set-parsed-class-record-slot-value' instead. 
;; (defun set-parsed-artist-record-slot-value (field-string field-value object)
;;   (values 
;;    (string-case:string-case (field-string)
;;      ("id" (setf (control-id-entity-num-artist object) field-value))
;;      ("bio" (setf (control-id-doc-num-artist object) field-value))
;;      ("display" (setf (control-id-display-artist object) field-value))
;;      ("used_for" (setf (naf-entity-artist-display-name-coref object) field-value))
;;      ("role" (setf (naf-entity-role-appearance-coref object) field-value))
;;      ("gender" (setf (naf-entity-gender-type object) field-value))
;;      ("lifespan" (setf (lifespan-date object) field-value))
;;      ("date_born" (setf (birth-date object) field-value))
;;      ("date_died" (setf (death-date object) field-value))
;;      ("birth_location" (setf (location-birth object) field-value))
;;      ("death_location" (setf (location-death object) field-value))
;;      ("nationality" (setf (location-nationality object) field-value))
;;      ("LOC_control" (setf (control-id-authority-0 object) field-value))
;;      ("ULAN_control" (setf (control-id-authority-1 object) field-value))
;;      ("also_author" (setf (naf-entity-author-coref object) field-value))
;;      ("also_people" (setf (naf-entity-person-coref object) field-value))
;;      ("appeared_in" (setf (naf-entity-publication-coref object) field-value))
;;      ("ads_for" (setf (naf-entity-brand-coref object) field-value))
;;      ("found_in" (setf (description-artist-note-general object) field-value))
;;      ("auction_records" (setf (description-artist-note-sale-appearance object) field-value))
;;      ("default_pic" (setf (image-default-id object) field-value))
;;      ("print_default_pic" (setf (image-default-xref object) field-value))
;;      ("online" (setf (record-status-active object) field-value))
;;      ("user_name" (setf (edit-by object) field-value))
;;      ("naf_creator" (setf (edit-by-creator object) field-value))
;;      ("date_edit" (setf (edit-timestamp-origin object) field-value))
;;      ("date_edt" (setf (edit-timestamp object) field-value))
;;      ("cancel_num" (setf (ignorable-cancel-num object) field-value))
;;      ("special_note" (setf (ignorable-special-note object) field-value)))
;;    object))


;;; ==============================
;;; :TODO methods  

;;; ==============================
;; + Fields that need 0/1 to be converted to t/nil:
;;    name="online"
;;    name="also_author"
;;    name="also_people"

;;; ==============================
;; + Fields which need 0 ignored:
;;    name="ULAN_control"
;;    name="death_location"
;;    name="bio"
;;    name="cancel_num"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'

;;; ==============================

;; #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01/dump-artist-infos-xml"

;; (defparameter *tt--parse-artist-table* (make-hash-table :test 'equal))

;; (write-sax-parsed-xml-to-file
;;  :input-file  #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01/dump-artist-infos-xml"
;;  ;; (merge-pathnames (make-pathname :name "dump-refs-DUMPING")
;;  ;;                  (sub-path *xml-input-dir*))
;;  :output-file 
;;  (merge-pathnames 
;;   (make-pathname :directory `(:relative ,(sub-name *xml-output-dir*))
;;                  :name (concatenate 'string "sax-artist-test-" (mon:time-string-yyyy-mm-dd))
;;                  :type "lisp")
;;   (system-path *system-path*)))

;; (length '("bio" "id" "display" "used_for" "role" "gender" "lifespan" "date_born"
;;           "date_died" "birth_location" "death_location" "nationality" "LOC_control"
;;           "ULAN_control" "also_author" "also_people" "appeared_in" "ads_for" "found_in"
;;           "auction_records" "default_pic" "print_default_pic" "online" "user_name"
;;           "naf_creator" "date_edit" "date_edt" "cancel_num" "special_note"))



;; (<SLOT>
;;  :initarg :<INITARG>
;;  :accessor <ACCESSOR>
;;  :documentation ":ORIGINAL-FIELD \"<FIELD>\"")

;; (mon-insert-parsed-defclass-slots
;;  '((control-id-entity-num-artist                 . "id")
;;    (control-id-display-artist                    . "display")
;;    (naf-entity-artist-display-name-coref                . "used_for")
;;    (naf-entity-role-appearance-coref                   . "role")
;;    (naf-entity-gender-type                       . "gender")
;;    (lifespan-date                                . "lifespan")
;;    (birth-date                                   . "date_born")
;;    (death-date                                   . "date_died")
;;    (location-birth                               . "birth_location")
;;    (location-death                               . "death_location")
;;    (location-nationality                         . "nationality")
;;    (control-id-authority-0                              . "LOC_control") ;; LOC
;;    (control-id-authority-1                              . "ULAN_control") ;; ULAN
;;    (naf-entity-author-coref                      . "also_author")
;;    (naf-entity-person-coref                      . "also_people")
;;    (naf-entity-publication-coref                . "appeared_in")
;;    (naf-entity-brand-coref                      . "ads_for")
;;    (description-artist-note-general              . "found_in")
;;    (description-artist-note-sale-appearance      . "auction_records")
;;    (image-default-id                             . "default_pic")
;;    (image-default-xref                           . "print_default_pic")
;;    (record-status-active                                   . "online")
;;    (edit-by                                      . "user_name")
;;    (edit-by-creator                              . "naf_creator")
;;    (edit-timestamp-origin                             . "date_edit") ;; date_edt is the good one
;;    (edit-timestamp                                    . "date_edt")    
;;    (ignorable-cancel-num                         . "cancel_num")
;;    (ignorable-special-note                       . "special_note")))


;;; ==============================
;; :NOTE All of these initial entity specific slot namespaces should be
;; transformed to their superclass slot equivalent once parsing is finished. 
;; e.g. "control-id-doc-num-artist"    -> "control-id-doc-uuid"
;; e.g. "control-id-entity-num-artist" -> "control-id-entity-uuid"
;;
;;
;; <FIELD>           <TRANSFORM>
;;
;; "bio"               ;; "control-id-doc-num-artist"
;; "id"                ;; "control-id-entity-num-artist"
;; "display"           ;; "control-id-display-artist"
;;
;; "used_for"          ;; "naf-entity-artist-display-name-coref"
;; "role"              ;; "naf-entity-role-appearance-coref"
;;
;; "gender"            ;; "naf-entity-gender-type"
;; "lifespan"          ;; "lifespan-date"
;; "date_born"         ;; "birth-date"
;; "date_died"         ;; "death-date"
;; "birth_location"    ;; "location-birth"
;; "death_location"    ;; "location-death"
;; "nationality"       ;; "location-nationality"
;;
;; "LOC_control"       ;; "control-id-authority-0" ;; LOC
;; "ULAN_control"      ;; "control-id-authority-1" ;; ULAN
;;
;; "also_author"       ;; "naf-entity-author-coref"
;; "also_people"       ;; "naf-entity-person-coref"
;;
;;
;; "appeared_in"       ;; "naf-entity-publication-coref"
;; "ads_for"           ;; "naf-entity-brand-coref"
;;
;; "found_in"          ;; "description-artist-note-general"
;; "auction_records"   ;; "description-artist-note-sale-appearance"
;;
;; "default_pic"       ;; "image-default-id"
;; "print_default_pic" ;; "image-default-xref"
;;
;; "online"            ;; "record-status-active"
;; "user_name"         ;; "edit-by"
;; "naf_creator"       ;; "edit-by-creator"
;;
;; "date_edit"         ;; "edit-timestamp-origin" ;; date_edt is the good one
;; "date_edt"          ;; "edit-timestamp"
;;
;; "cancel_num"        ;; "ignorable-cancel-num"
;; "special_note"      ;; "ignorable-special-note"

;;; ==============================

;;; ==============================
;;  :FIELD "bio" :TRANSFORM "control-id-doc-num-artist"
;;  :TYPE "int(10) unsigned"
;;
;; :EXAMPLE-VALUES 
;;  213
;;  0
;;
;; - May appear as `0' 
;; - xrefs to documentation
;; - ignore `0' values

;;; ==============================
;;  :FIELD "id" :TRANSFORM  "control-id-entity-num-artist"
;;  :TYPE "int(4) unsigned"
;;  :KEY "PRI" 
;;  :EXTRA "auto_increment"
;;
;; :EXAMPLE-VALUES 
;;  10
;;  1458
;;
;;   - UUID integer. We need to retain the existing value because it appears in
;;    .naf files and potentially in the db as well, But, we also need to
;;    generate a more robust UUID for these as well


;;; ==============================
;;  :FIELD "name" :TRANSFORM "control-id-display-artist"
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;  "Benito (Eduardo Garcia)"
;;  "No Signature (Photographer:Poster:)"
;;
;; - This is the artists display name. There is tension here because it is
;;   occasionally desirable that this name be allowed to change and/or merge
;;   with some other entity. We need to figure out how we intend to handle class
;;   instance names relative to this field and whether/how it is used in
;;   conjunction with its UUID. 
;;   One possibility is to `sxhash' it. sxhash is guaranteed to be persistent
;;   across sessions for a given implementation.
;;   If so do we include the parens and hash the entire string e.g.:
;;
;;    (sxhash "Benito (Eduardo Garcia)") => 242373724
;;    
;;   Or, instead hash each of the names, e.g.:
;;
;;    (loop 
;;       :for nm in (delete-if #'mon::string-empty-p (mon::string-split-on-chars "Benito (Eduardo Garcia)" " ()"))
;;       :collecting (cons nm (sxhash nm)) into nm-pairs
;;       :finally (return (nreverse nm-pairs)))
;;      
;;      => (("Garcia" . 125539870) ("Eduardo" . 378089051) ("Benito" . 90343236))
;;
;; However, the problem here is that `sxhash' will return the same value will
;; not return from a 32bit (sxhash "string") differ from a 64bit (sxhash
;; "string") where each is built from identical sources...
;;
;; - Should get extracted, rotated, etc.?  
;; 
     

;;; ==============================
;;  :FIELD "used_for" :TRANSFORM "naf-entity-artist-display-name-coref"
;;  :TYPE "text"
;;
;; :EXAMPLE-VALUES 
;;  "Louis Chalon | Chalon, Louis"
;;
;;   - May appear with " | " at end of string.
;;
;;   - Split on " | " then `string-trim-whitespace'd per split.
;;     Use `split-used-fors' to do this, the function is written.
;;
;;   - Should identify these as well:
;;     -- (pseudonym)
;;     -- (Pseudonym)
;;     -- (Psedonym of) ??
;;     This requires first identifying which is the normalized form of the above
;;     strings and normalizing to them.
;;
;;   - Maybe autogenerate variant forms with permutation function.
;;   - Maybe apply an additional transformation where we split each element into a list of the form:
;;     (("Louis Chalon" ("Louis" "Chalon"))
;;      ("Chalon, "Louis" ("Chalon" "Louis"))
;;      ("Apsuedo Name (pseudonym)" ("Apsuedo" "Name" "(pseudonym)")))

;;; ==============================
;; :FIELD "role" :TRANSFORM
;; :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;         "Painter, Illustrator."
;;
;;   - Split on commas.  Be careful about trailing period `.' 
;;     Use `split-roles' function is written.
;;     :SEE-ALSO `split-comma-field'
;;
;;  - Normalize known roles.
;;
;;  - Ideally we would transform as:
;;   <field name="role">Designer, Caricaturist, illustrator.</field>
;;  :ROLE ("Designer" "Caricaturist" "Illustrator")

;;; ==============================
;;  :FIELD "gender" :TRANSFORM naf-entity-gender-type
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;  "Male" | "Female" | ?
;;
;; - 

;;; ==============================
;;  :FIELD "lifespan" :TRANSFORM "lifespan-date"
;;  :TYPE "varchar(100)"
;;
;; :EXAMPLE-VALUES 
;;
;;         "1866-?"
;;         "1889-[?]"
;;         "1864-[19??]"
;;         "1848-1934"
;;         "-1866"
;;         "1866-"
;;         "Active 1940s-60s"
;;
;;   - Check for and normalize values of type:
;;      NNNN-NNNN 
;;      NNNN-?
;;      ?-NNNN
;;      -NNNN
;;      NNNN-
;; 
;;     -  Call a follow up function when both car/cdr of
;;       `split-date-range' are each "NNNN" and normalize these to integer
;;       values. This will allow numeric lifespan range functions, e.g. 
;;        (- <DEATH> <BIRTH>) 
;;       Or, queries of type: "Find all artists born between 1850 and 1900"
;;       The latter is important for any indexing scheme using btrees (i.e. Rucksack)
;;     - Use `split-date-range'/`split-date-range-string-int-pairs' functions are written. 
;;       :Note does not check replace for `#\[' `#\]' for frob strings of type "[?+]".

;; (split-date-range "1864-[19??]")
;; (split-date-range "1866-?")
;; (split-date-range "1866-??")
;; (split-date-range "1866")
;; (split-date-range "1866-")
;; (split-date-range "1866--")
;; (split-date-range "1866-?-")
;; (split-date-range "1866--?")
;; (split-date-range "-1866")
;; (split-date-range "1866-185?")
;; (split-date-range "1866-185?-")
;; (split-date-range "1889-[?]")
;; (split-date-range "Active 1940s-60s")
;; (split-date-range-string-int-pairs (split-date-range "1866-187?"))
;; (split-date-range-string-int-pairs (split-date-range "1866-1872"))
;; (split-date-range-string-int-pairs (split-date-range "1866-1865"))
;; (split-date-range-string-int-pairs (split-date-range "1866-??"))
;; (split-date-range-string-int-pairs (split-date-range "1843-00"))
;; (split-date-range-string-int-pairs (split-date-range "1866--"))
;; (split-date-range-string-int-pairs (split-date-range "1866-1866"))
;; (split-date-range-string-int-pairs (split-date-range "00"))

;;; ==============================
;;  :FIELD "date_born" :TRANSFORM "birth-date"
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;
;;   - Can appear w/ null value
;;
;;   - Try to parse out "<MONTH> <DAY>, <YEAR>"?
;;

;;; ==============================
;;  :FIELD "date_died" :TRANSFORM "death-date"
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;
;;   - Can appear w/ null value
;;
;;   - Try to parse out "<MONTH> <DAY>, <YEAR>"?

;;; ==============================
;;  :FIELD "birth_location" :TRANSFORM "location-birth"
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;   "Prestinone, Val Vigezz - Italy"
;;   "Reims, France"
;;
;;  - May be empty
;;
;; - Try to parse out "<CITY> <STATE> <COUNTRY>"?
;;
;; - Co-refs with `dbc:naf-entity-location'

;;; ==============================
;;  :FIELD "death_location" :TRANSFORM "location-death"
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;
;; - When this is `0' ignore it.
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Co-refs with `dbc:naf-entity-location'

;;; ==============================
;;  :FIELD "nationality" :TRANSFORM "location-nationality"
;;  :TYPE "varchar(255)"
;;
;; :EXAMPLE-VALUES 
;;         "French"
;;
;;   - Artists Nationality
;;
;;   - This should get normalized to an ISO? 
;;     If so, what to do about case like "Argentinian"?
;;
;;  - co-refs `dbc:naf-entity-location'

;;; ==============================
;;  :FIELD "LOC_control" :TRANSFORM "control-id-authority-0"
;; :TYPE "varchar(15)"
;;
;; :EXAMPLE-VALUES 
;;  "83227261"
;;  "2001022515"
;;  "nb2007017414"
;;  "n 83043434"
;;
;;  - May appear as `n 83043434`, `nb2007017414`
;;
;;  - Maybe use `split-loc-pre'? 
;;    It isn't clear if this is desirable b/c "n 83043434" may actually be the
;;    canonical control number...
;; 

;;; ==============================
;; :FIELD "ULAN_control" :TRANSFORM "control-id-authority-1"
;; :TYPE "varchar(15)"
;;
;; :EXAMPLE-VALUES 
;;  500007646
;;  0
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Should we try to verify the "type" of control number. YES! 2011-05-05
;;   If so, this requires identifying a ULAN type control versus some other type
;;   of value which may include OCLC, BNF, etc.

;;; ==============================
;;  :FIELD "also_author"  :TRANSFORM "naf-entity-author-coref"
;; :TYPE "tinyint(3) unsigned"
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;
;; - This is currently either 1/0 these should be converted to t/nil
;;   Replace the 0 default with T/NIL Use `field-convert-1-0-x'
;;   
;; - (search-forward-regexp "also_author">1)


;;; ==============================
;;  :FIELD "also_people"  :TRANSFORM "naf-entity-person-coref"
;; :TYPE "tinyint(3) unsigned"
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;;
;; - Co-refs with `dbc:naf-entity-person'

;;; ==============================
;; :FIELD "appeared_in" :TRANSFORM "naf-entity-publication-coref"
;; :TYPE "text"
;;
;; :EXAMPLE-VALUES 
;;
;; "Le Rire | Le Sourire | Femina | La Rampe | Printed Salesmanship |
;;  L'Illustration | Assiette au Beurre | La Baionnette | Cri de Paris |
;;  Fantasio | Comoedia Illustre"
;;
;;  - May appear empty as "appeared_in"><"
;; 
;;  - (search-forward-regexp "name=\"appeared_in\">[^<]")
;;
;;  - (search-forward-regexp "name=\"appeared_in\"><") 
;;
;;  - Use `split-appeared-in' or adapted variant.
;;   (split-appeared-in (format nil "Le Rire | Le Sourire |~% Femina | La Rampe "))
;;
;; - Co-refs with `dbc:naf-entity-publication'

;;; ==============================
;; :FIELD "ads_for"  :TRANSFORM "naf-entity-brand-coref"
;; :TYPE "text"
;;
;; :EXAMPLE-VALUES 
;;  "Panagra, early 1960's"
;; 
;; - elts will likely co-ref with `dbc:naf-entity-brand'
;;
;; - Likely xrefs with a subclass of `dbc:base-category-entity'

;;; ==============================
;; :FIELD "found_in"  :TRANSFORM ;; "description-artist-note-general"
;; :TYPE "text"
;;
;; :EXAMPLE-VALUES 
;;
;;     "Boccaccio, G. The Decameron of Giovanni Boccaccio, 1923?"
;;
;;   - Split into separate records on "\n---\n" "\n----\n"
;;   -- URLS splitter: (URL `<....>')
;;                      @http://catalogue.bnf.fr/ark:/12148/cb12201408w/PUBLIC
;;
;;   -- Timestamp splitter:  #{2009-09-17T11:52:42-04:00Z}#{09384}
;;
;; 

;;; ==============================
;; :FIELD "auction_records" :TRANSFORM "description-artist-note-sale-appearance"
;;
;; :EXAMPLE-VALUES 
;;
;; - Some of these (e.g. Benezit refs) will contain xrefs to a subclass of
;;   `dbc:base-location-entity'
;;


;;; ==============================
;;  :FIELD "online"  :TRANSFORM "record-status-active"
;;  :TYPE "tinyint(3) unsigned"
;;
;; :EXAMPLE-VALUES 
;;  1 | 0
;;
;; - Replace the 0 default with T/NIL
;;   Use `field-convert-1-0-x'
;; 

;;; ==============================
;;  :FIELD "default_pic" :TRANSFORM "image-default-id"
;; 
;; :EXAMPLE-VALUES 
;;         1.jpg
;;   <field name="default_pic">1.jpg</field>
;; - May appear as empty field
;; - :SEE the image-xref class slots:
;;    image-path-for-instance-type,  image-path-for-type, image-type
;;   :FILE dbc-classes/dbc-class-image.lisp
;;
;; - Also, appears in techniques_infos table
;;
;; (pathname-type "name.jpg")
;; (pathname-type "name.jpg")
;; (pathname-name "name.jpg")
;; (pathname-directory "name.jpg")
;; (pathnamep (namestring #P"name.jpg")

;;; ==============================
;;  :FIELD "print_default_pic" :TRANSFORM "image-default-xref"
;;
;; :EXAMPLE-VALUES 
;;  2033
;;  4064
;;
;;   - Should this be normalized to an integer as well?
;;     It would certainly make the storage cost lower, but it might also prevent
;;     hinder indexed queries by item-ref/image objects identity.
;;
;;   - This should eventually get xref'd with a grapher (i.e. epigraph)
;;     according to UUID relations
;;
;;   - :SEE the image-xref class notes in :FILE dbc-classes/dbc-class-image.lisp

;;; ==============================
;;  :FIELD date_edt & name=date_edit 
;;
;; :FIELD "date_edit"  :TRANSFORM edit-timestamp-origin
;; :TYPE "varchar(255)" 
;;
;; :EXAMPLE-VALUES 
;;  "2008-08-3"
;;
;; :FIELD "date_edt"  :TRANSFORM edit-timestamp
;; :TYPE "timestamp"
;;
;; :EXAMPLE-VALUES 
;;  "2008-08-03 04:00:00"
;;  "0000-00-00 00:00:00"
;;
;;   - Replace these: "0000-00-00 00:00:00" with nil
;;
;;   - Should be normalized where name=date_edt is the canonical form.
;;
;;   - Should be frobbed for further parsing with features of `local-time'?
;;     If so, use a generalized timestamp splitter which also recognizes
;;     #{2009-09-17T11:52:42-04:00Z}#{09384}

;;; ==============================
;;  :FIELD "user_name" :TRANSFORM "edit-by"
;;  :TYPE "varchar(32)"
;;
;; :EXAMPLE-VALUES
;;  xsi:nil="true"
;;
;; -

;;; ==============================
;;  :FIELD "naf_creator" :TRANSFORM "edit-by-creator"
;;  :TYPE "varchar(32)"
;;
;; :EXAMPLE-VALUES
;;  "constance" | "stan"
;;  xsi:nil="true"
;;
;;   - Are these the only possible valuse? 
;;     What to do with them?


;;; ==============================
;; :FIELD "cancel_num" :TRANSFORM "ignorable-cancel-num"
;; :TYPE "int(10) unsigned"
;;
;; :EXAMPLE-VALUES
;;  0
;; 92117000
;;
;; (search-forward-regexp "cancel_num\">[^<0x].*<" nil t)
;; (let ((cnt 0)) (while (search-forward-regexp "cancel_num\">[^<0x].*<" nil t) (incf cnt)) cnt) => 3
;;
;; - It isn't clear if this was ever used.
;; - IGNORABLE

;;; ==============================
;;  :FIELD "special_note" :TRANSFORM "ignorable-special-note"
;;  :TYPE "text"
;;
;; :EXAMPLE-VALUES
;;
;; (let ((cnt 0)) (while (search-forward-regexp "name=\"special_note\">[^<]" nil t) (incf cnt)) cnt) => 6
;;
;; - It isn't clear if this was ever used.
;; - IGNORABLE


;;; ==============================
;; :ARTIST-INFOS
;; <table_structure name="artist_infos">
;; <field Field="bio" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="id" Type="int(4) unsigned" Null="NO" Key="PRI" Extra="auto_increment" />
;; <field Field="display" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="nationality" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="role" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="lifespan" Type="varchar(100)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="date_born" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="date_died" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="birth_location" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="death_location" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="LOC_control" Type="varchar(15)" Null="YES" Key="" Default="0" Extra="" />
;; <field Field="used_for" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="found_in" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="appeared_in" Type="text" Null="NO" Key="MUL" Extra="" />
;; <field Field="ads_for" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="auction_records" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="cancel_num" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="special_note" Type="text" Null="NO" Key="" Extra="" />
;; <field Field="gender" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="date_edit" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="ULAN_control" Type="varchar(15)" Null="YES" Key="" Extra="" />
;; <field Field="default_pic" Type="varchar(10)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="print_default_pic" Type="varchar(10)" Null="NO" Key="" Default="" Extra="" />
;; <field Field="also_author" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="also_people" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="user_name" Type="varchar(32)" Null="YES" Key="" Extra="" />
;; <field Field="naf_creator" Type="varchar(32)" Null="YES" Key="" Extra="" />
;; <field Field="online" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" />
;; <field Field="date_edt" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" />
;;
;;; ==============================


;;; ==============================
;;; EOF
