;;; :FILE-CREATED <Timestamp: #{2011-09-27T11:25:10-04:00Z}#{11392} - by MON>
;;; :FILE dbc-classes/dbc-class-themes-convert.lisp
;;; ==============================

;; :SEE (URL https://id.loc.gov/vocabulary/graphicMaterials.html)
;; 
;;
;; Theme "9457" "Goldenrod" occurs twice - once officially and a second time internally as "13763" use "9457"
;;
;; Items using "seals" theme 12070 should use "Coats of arms" instead.
;;  ("10324" "9972" "10056" "10324")
;;
;; Themes with names comprised of three character words these are certainly unsafe:
;; ("Air") ("Art") ("Elk") ("War") ("Fur")("Hay") ("Ice") ("Men") ("Mud") ("Sex")("Sun") ("Tea")
;;
;; following is a list of currently active themes which coref a the string identity of another theme
;; these are not safe even when matching against themes as " <THEME> "
;; 
;; ("People" "Bathing" "Advertising" "Aircraft" "Ballet" "Automobile equipment & supplies" "Automobile racing"
;;  "Beauty" "Beer" "Birds" "Carnival" "Children" "Cleaning" "Coats" "Construction" "Dance" "Design" "Dirt"
;;  "Drawing" "Employment" "Fire" "Fish" "Fishing" "Food" "Football" "Gardening" "Graphic design"
;;  "Hair" "Honor" "Hunting" "Ice skating" "Light" "Love" "Marching" "Marriage" "Meat" "Morning"
;;  "Music" "Peace" "Police" "Pottery" "Printing" "Racing" "Sailing" "Sand" "Sculpture" "Sewing"
;;  "Shaving" "Smoking" "Spinning" "Sports" "Steam" "Supernatural" "Tennis" "Visiting" "Water" 
;;  "Wine" "Winter" "Women" "Writing")


;; :NOTE there is a per them XML file from db's php parse from the old dcp here:
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/tgm.tar
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/xslt/tgm_htm_details.php
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/xslt/tgm_htm_details.xslt
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/xslt/tgm_htm_feb_06.xslt
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/xslt/tgm_htm_results.xslt
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/xslt/tgm_htm.xslt
;;
;; Also, for a later Lisp parse see: 
;; :FILE dbc-specific/dbc-classes/dbc-tgm.lisp
;;
;; The current TGM entity schema is here:
;; :FILE dbc-specific/dbc-classes/dbc-class-theme-entity.lisp

;; (merge-pathname
;;  (make-pathname :directory `(:relative ,*xml-output-dir*)
;;                 :name "sax-themes-test"
;;                 :type "lisp")
;;  (system-path *system-path*))
;;
;;
;; :TODO What about the stuff in the XML files dump-themes_fr-xml and dump-themes_active-xml ???
;;  
;; for an early attempt at a theme index 
;; :SEE dbc-specific/dbc-classes/record-type-scratch-2011-12-08.lisp

;;
;; base-theme-entity (base-entity)

;; most recent parsed theme-records are located here:
;; /dbc-specific/xml-class-dump-dir/parsed-xml-records/parsed-xml-theme-records/theme-records-2012-03-20T202042.lisp


;;; ==============================
;;; <Timestamp: #{2024-05-01T16:39:09-04:00Z}#{24183} - by MON KEY>
;;; :NOTE following rename pairs used to update the slot names for in this file
;;; and in the .pctd file in directory:
;;; /dbc-specific/xml-class-dump-dir/parsed-class-table-dumps/parsed-theme-record/*.pctd
;;; to allow updating the class in lieu of our recent TGM xml parsing code.
;;;
;;; :RENAME-PAIRS
;;; control-id-theme-entity-num control-id-theme-entity-dbc-num
;;; ignorable-bt broader-theme
;;; ignorable-rt related-theme
;;; ignorable-nt narrower-theme
;;; ignorable-us use-theme
;;; ignorable-uf used-for

;;; ==============================


(in-package #:dbc)

(defclass parsed-theme-record (parsed-class)
  (;; control-id-entity-num primary-key
   ;; control-id-theme-entity-dbc-num
   (control-id-theme-entity-dbc-num
    :initarg :control-id-theme-entity-dbc-num
    :accessor control-id-theme-entity-dbc-num
    :documentation ":ORIGINAL-FIELD \"id\"")
   ;; congruent with slot in class `parsed-tgm-theme-record'
   (control-id-display-theme
    :initarg :control-id-display-theme
    :accessor control-id-display-theme
    :documentation ":ORIGINAL-FIELD \"theme\"")

   ;; shares-generic
   (record-status-active
    :initarg :record-status-active
    :accessor record-status-active
    :documentation ":ORIGINAL-FIELD \"active\"")

   ;; shares-generic
   (image-default-xref
    :initarg :image-default-xref
    :accessor image-default-xref
    :documentation ":ORIGINAL-FIELD \"display_pic\"")

   ;; (image-coref  (parsed-class-parse-table-lookup 'parsed-theme-record "6963"))
   (image-coref
    :initarg :image-coref
    :accessor image-coref
    :documentation ":ORIGINAL-FIELD \"related_pic_num\"")

   ;; shares-generic
   (edit-timestamp
    :initarg :edit-timestamp
    :accessor edit-timestamp
    :documentation ":ORIGINAL-FIELD \"date_edit\"")

   ;; what did this do?
   (ignorable-subdivision-number
    :initarg :ignorable-subdivision-number
    :accessor ignorable-subdivision-number
    :documentation ":ORIGINAL-FIELD \"subdivision_number\"")

   ;; has the form: "Age-Alg", 
   (ignorable-range  
    :initarg :ignorable-range
    :accessor ignorable-range
    :documentation ":ORIGINAL-FIELD \"range\"")

   ;; :NOTE the rt, bt, nt, us, uf are potential a type of `entity-display-name-coref'
   
   ;; use-theme
   (use-theme ;; theme-entity-us-coref
    :initarg :use-theme
    :accessor use-theme
    :documentation ":ORIGINAL-FIELD \"US\"")

   ;; used-for
   (used-for ;; theme-entity-uf-coref
    :initarg :used-for
    :accessor used-for
    :documentation ":ORIGINAL-FIELD \"UF\"")

   ;; broader-theme
   (broader-theme ;; theme-entity-bt-coref
    :initarg :broader-theme
    :accessor broader-theme
    :documentation ":ORIGINAL-FIELD \"BT\"")

   ;; narrower-theme
   (narrower-theme ;; theme-entity-nt-coref
    :initarg :narrower-theme
    :accessor narrower-theme
    :documentation ":ORIGINAL-FIELD \"NT\"")

   (related-theme ;; theme-entity-rt-coref
    :initarg :related-theme
    :accessor related-theme
    :documentation ":ORIGINAL-FIELD \"RT\"")

   (control-id-theme-entity-loc-num
    :initarg :control-id-theme-entity-loc-num
    :accessor control-id-theme-entity-loc-num
    :documentation "This does not occur in our original table.
An LOC id is a string of the form: 
 \"tgmNNNNNN\"
These correlate our theme-ids with the LOC's cannonical ids.")

   ;; 
   (control-id-theme-entity-loc-uri
    :initarg :control-id-theme-entity-loc-uri
    :accessor control-id-theme-entity-loc-uri
    :documentation "This does not occur in our original table.
A URI of the form:

  <RESOURCE-PATH>/<CONTROL-ID-THEME-ENTITY-LOC-NUM>
 
 <RESOURCE-PATH> -> \"http://id.loc.gov/vocabulary/graphicMaterials/\";
 
  <CONTROL-ID-THEME-ENTITY-LOC-NUM> -> \"tgmNNNNNN\"

 http://id.loc.gov/vocabulary/graphicMaterials/tgm000173.html

Use it to grab LOC skos/rdf-xml data.")
   )
  (:documentation
    #.(format nil
              "Class for parsed dbc XML `themes` table.~%~@
:SEE-ALSO `dbc-theme-request-loc-x-uri', `parsed-inventory-record',
`parsed-artist-record', `parsed-author-record', `parsed-person-record',
`parsed-brand-record', `parsed-publication-record'.~%▶▶▶")))

;; :NOTE everything above 13484 was added after the fact and isn't a TGM term.
(make-parsed-class-field-slot-accessor-mapping 
 'parsed-theme-record
 '(("id"                 . control-id-theme-entity-dbc-num)
   ("theme"              . control-id-display-theme)
   ("active"             . record-status-active)
   ("display_pic"        . image-default-xref)
   ("related_pic_num"    . image-coref)
   ("date_edit"          . edit-timestamp)
   ("subdivision_number" . ignorable-subdivision-number)
   ("range"              . ignorable-range)
   ("RT"                 . related-theme) ;; theme-entity-rt-coref
   ("BT"                 . broader-theme) ;; theme-entity-bt-coref
   ("US"                 . use-theme) ;; theme-entity-use-coref
   ("UF"                 . used-for) ;; theme-entity-uf-coref
   ("NT"                 . narrower-theme) ;; theme-entity-nt-coref
   ("__IGNORED-1"        . control-id-theme-entity-loc-num)
   ("__IGNORED-2"        . control-id-theme-entity-loc-uri))
 )

(defun %print-parsed-theme-record-helper (object stream)
  (let ((disp (and (slot-boundp object 'control-id-display-theme)
                   (slot-value  object 'control-id-display-theme))))
    (if disp
        (format stream ":CONTROL-ID-DISPLAY-THEME ~S" disp)
        ;; Shouldn't ever actually happen... 
        (format stream ":CONTROL-ID-DISPLAY-THEME NUL/UNBOUND"))))

(defmethod print-object ((object parsed-theme-record) stream)
  (print-unreadable-object (object stream :type t)
    (%print-parsed-theme-record-helper object stream)))


;; :TODO following updates the `parsed-theme-record' to match the slots of enable this once we've converted the existing parse file over to the new slot-names:
;; :SEE :FILE #P..."/dbc-specific/xml-class-dump-dir/parsed-class-table-dumps/parsed-theme-record/parsed-theme-record-2012-03-21T000437.pctd"

;; (make-parsed-class-field-slot-accessor-mapping 
;;  'parsed-theme-record
;;  '(("id"                 . control-id-theme-entity-dbc-num)
;;    ("theme"              . control-id-display-theme)
;;    ("active"             . record-status-active)
;;    ("display_pic"        . image-default-xref)
;;    ("related_pic_num"    . image-coref)
;;    ("date_edit"          . edit-timestamp)
;;    ("subdivision_number" . ignorable-subdivision-number)
;;    ("range"              . ignorable-range)
;;    ("RT"                 . related-theme)
;;    ("BT"                 . broader-theme) 
;;    ("US"                 . use-theme) 
;;    ("UF"                 . used-for) 
;;    ("NT"                 . narrower-theme)
;;    ("__IGNORED-1"        . control-id-theme-entity-loc-num)
;;    ("__IGNORED-2"        . control-id-theme-entity-loc-uri))
;;  )





;; (dbc-theme-request-loc-x-uri "Marble")
;; (dbc-theme-request-loc-x-uri "Cartouches (Architecture)")

;; (parsed-class-parse-table 'parsed-theme-record)
;; (control-id-display-theme (parsed-class-parse-table-lookup 'parsed-theme-record "13862"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "6823"))
;; (control-id-theme-entity-loc-num (parsed-class-parse-table-lookup 'parsed-theme-record "7000"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "7000"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "7276"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "7365"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "7557"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "7701"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "7858"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "7954"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8067"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8086"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8105"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8150"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8151"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8152"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8174"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8177"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8200"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8249"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8250"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8275"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8300"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "8400"))
;; (control-id-theme-entity-loc-uri (parsed-class-parse-table-lookup 'parsed-theme-record "13474"))

;; (image-coref (parsed-class-parse-table-lookup 'parsed-theme-record "8300"))

;; (write-parsed-theme-record-parse-table-to-file)

;; (cl-ppcre:split #\| "9190|9186|510|")

;; "Charcoal"
;; "7992"  -> "tgm001892"
;; "13728" -> "tgm001892"
;; (%parsed-theme-record-find-display-theme "Charcoal")
(defun %parsed-theme-record-find-display-theme (control-id-display-theme)
  "~%:EXAMPLE (%parsed-theme-record-find-display-theme \"Charcoal\"\)~%"
  (loop 
    with ht = (parsed-class-parse-table 'parsed-theme-record)
    for hk being the hash-keys of ht
    for hv being the hash-values of ht           
    for cidt = (control-id-display-theme hv)
    when (string= (control-id-display-theme hv) control-id-display-theme)
    collect (list :control-id-theme-entity-dbc-num hk :control-id-display-theme cidt :object hv) into gthr
    finally (return gthr)))

;; (length (%parsed-theme-record-find-duplicate-control-id-display-theme)) => 16
;; this returns the inverse duplicates 
(defun %parsed-theme-record-find-duplicate-control-id-display-theme  ()
  (loop with ht = (parsed-class-parse-table 'parsed-theme-record)
        with gthr = ()
        for hk being the hash-keys of ht
        for hv being the hash-values of ht
        for cidt = (control-id-display-theme hv)
        for maybe =  (loop 
                       for inner-hk being the hash-keys of ht
                       for inner-hv being the hash-values of ht
                       for inner-cidt = (control-id-display-theme inner-hv)
                       when (and (not (eql inner-hv hv))
                                 (string= inner-cidt cidt))
                       collect (list :control-id-theme-entity-dbc-num inner-hk 
                                     :control-id-display-theme  inner-cidt
                                     :object inner-hv)
                       into inner-gather
                       end
                       finally (return inner-gather))
        when maybe 
        collect (list :outer-key hk :outer-object hv maybe)))

#|

(equal 
(length 
(mapcar 'cdr (parsed-class-slot-value-collect-all 'parsed-theme-record 'control-id-display-theme)))
(hash-table-count (parsed-class-parse-table 'parsed-theme-record)))

 (loop 
   for obj being the hash-values of (parsed-class-parse-table 'parsed-theme-record)
   for stat = (record-status-active obj)
   when (null stat)
   collect (control-id-display-theme obj))

 (loop 
   for obj being the hash-values of (parsed-class-parse-table 'parsed-theme-record)
   for stat = (record-status-active obj)
  ;; always (or (string= "1" stat) (string= "0" stat)))
  ;;
  ;; do (if (string= stat "1")
  ;;         (setf (record-status-active obj) t)
  ;;         (setf (record-status-active obj) nil)))
   when stat count it)
  always (typep stat 'boolean))

(loop 
  for obj being the hash-values of (parsed-class-parse-table 'parsed-theme-record)
  ;; always (stringp (image-default-xref obj)))
  for idx = (image-default-xref obj)
  when (not (stringp idx)) 
  collect idx)


;; populate the loc xrefs -- will take a long time!
 (loop 
   for obj being the hash-values of (parsed-class-parse-table 'parsed-theme-record)
   do (multiple-value-bind (termid uri) (dbc-theme-request-loc-x-uri (control-id-display-theme obj) :render-uri t)
        (when termid
          (setf (control-id-theme-entity-loc-num obj) termid
                (control-id-theme-entity-loc-uri obj) uri))))

;; return the number of 'parsed-theme-record instances that are currently active in the dbc system:
(loop 
  for obj-id being the hash-keys of (parsed-class-parse-table 'parsed-theme-record) using (hash-value obj)
  for theme = (control-id-display-theme obj)
  for active = (record-status-active obj)
  when active
  collect theme) 
;; => 2041 of 6897

;; (+ 4861 2041)

;; inactive themes => 4861
(loop 
  for obj being the hash-values of (parsed-class-parse-table 'parsed-theme-record)
  for stat = (record-status-active obj)
  when (null stat)
  collect (control-id-display-theme obj))

;; inactive themes with an loc number 4435
(loop 
  with innactive-loc-themes-count = 0
  for obj being the hash-values of (parsed-class-parse-table 'parsed-theme-record)
  do (with-slots (record-status-active
                  control-id-theme-entity-loc-num
                  );control-id-display-theme)
         obj
       (when (and (null record-status-active)
                  control-id-theme-entity-loc-num)
         (incf  innactive-loc-themes-count)))
  finally (return  innactive-loc-themes-count))

;; active themes without an loc number 69
(loop 
  with active-no-loc-themes-count = 0
  with active-no-loc-themes = '()
  for obj being the hash-values of (parsed-class-parse-table 'parsed-theme-record)
  do (with-slots (record-status-active
                  control-id-theme-entity-loc-num
                  control-id-display-theme
                  control-id-theme-entity-dbc-num
                  image-coref)
         obj
       (when (and record-status-active
                  (null control-id-theme-entity-loc-num))
         (incf  active-no-loc-themes-count)
         (push (list control-id-theme-entity-dbc-num control-id-display-theme image-coref) active-no-loc-themes)))
  finally (return (values active-no-loc-themes active-no-loc-themes-count )))

(write-parsed-theme-record-parse-table-to-file :hash-table (parsed-class-parse-table 'parsed-theme-record))

(load-parsed-theme-record-default-file-to-parse-table)

;; convert image-corefs to list
(loop 
  for obj being the hash-values of (parsed-class-parse-table 'parsed-theme-record)
  for default-xref = (image-default-xref obj)
  for coref = (image-coref obj)
  for converting-coref = (if (string= coref "0")
                             nil
                             (remove-if #'mon:string-null-empty-or-all-whitespace-p (cl-ppcre:split #\| (image-coref obj))))
  do (setf (image-coref obj) converting-coref))

;; (write-parsed-theme-record-parse-table-to-file)
;; remove "0" for image-default-xref
(loop 
  for obj being the hash-values of (parsed-class-parse-table 'parsed-theme-record)
  for default-xref = (image-default-xref obj)
  when (string= default-xref "0")
     do (setf (image-default-xref obj) nil))

  ;; for img = (image-coref obj)
  do (with-slots (;; record-status-active
                  ;; control-id-theme-entity-loc-num
                  ;; control-id-display-theme
                  ;; control-id-theme-entity-dbc-num
                  (ic image-coref)
                  (idx image-default-xref)
                  )
         obj
       (when (and ic
                  (stringp ic)
                  (string= ic "0")
                  (setf ic nil)))
       ;; (remove-if #'mon:string-null-empty-or-all-whitespace-p (cl-ppcre:split #\| image-coref)))
       (setf ic nil)
       (when (and idx
                  (stringp idx)
                  (string= idx "0"))
         (setf idx nil))))
       
         (incf with-image-corefs)))
  finally (return with-image-corefs))
=> 6893

;; (remove-if #'mon:string-null-empty-or-all-whitespace-p (cl-ppcre:split #\| nil))

;; (write-parsed-theme-record-parse-table-to-file)
;; (load-parsed-theme-record-default-file-to-parse-table)

|#

;;; ==============================
;; "id"                 :TRANSFORM "control-id-entity-num-theme"
;; "theme"              :TRANSFORM "control-id-display-theme"
;; "active"             :TRANSFORM "record-status-active"
;; "display_pic"        :TRANSFORM "image-default-xref"
;; "related_pic_num"    :TRANSFORM "image-coref"
;; "date_edit"          :TRANSFORM "edit-timestamp"
;; "subdivision_number" :TRANSFORM ignorable-subdivision-number
;; "range"              :TRANSFORM ignorable-range
;; "RT"                 :TRANSFORM related-theme  ;; theme-entity-rt-coref
;; "BT"                 :TRANSFORM broader-theme  ;; theme-entity-bt-coref
;; "US"                 :TRANSFORM use-theme  ;; theme-entity-use-coref
;; "UF"                 :TRANSFORM used-for  ;; theme-entity-uf-coref
;; "NT"                 :TRANSFORM narrower-theme  ;; theme-entity-nt-coref

;;; ==============================
;; :FIELD "id" :TRANSFORM control-id-entity-num-theme
;;
;;         :TYPE "smallint(5) unsigned"
;;         :NULL-P "NO"
;;         :KEY "PRI"
;;         :EXTRA "auto_increment"
;;
;; :EXAMPLE-VALUES 
;;   "13504"
;;
;; - An unique integer identifying a theme.
;;   We may need to retain the existing value because it appears in the db.
;;   But, we also need to generate a more robust UUID for these as well
;;   Also, it is likely that most of these values should be corroborated with
;;   their LOC control-numbers.
;;
;;  :NOTE This integer shares a coreference with values from the `thems_fr` table!

;;; ==============================
;; :FIELD "theme" :TRANSFORM  "control-id-display-theme"
;;
;;         :TYPE "varchar(255)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Marble quarrying"
;;  "Marines (Military personnel)"
;;  "Mechanics (Persons)"
;;  "Antennas (Electronics)"
;;  "Merchants' exchanges"
;;  "Public affairs radio programs"
;;
;; "Cosmetics "
;; "Clothing "
;;
;; - First character of first word capitalized.
;;   First character of first word in parenthetical qualifer capitalized.
;;   If additional words are present is it always the case that they are not capitalized?
;;
;; - AFAICT these were only the "main theme" we never were able to create a
;;   graphs for MT,BT,RT,NT,UF,USE relations.
;;
;; :NOTE There may be a value in `translation` field of table `themes_fr` which
;;      corresponds with this, and we need to identify _how_ we want to handle
;;      display in multiple languages.
;;
;; :NOTE There are themes appearing in both the `refs` and `themes` tables with
;; character entity references as "&amp;". Likely these will need to be replaced
;; with "&" because they cause our SAX parser to not catch anything after
;; "&amp;" so for example:
;;   "Cosmetics &amp; soap" becomes "Cosmetics "
;;   "Clothing &amp; dress" becomes "Clothing " 
;; 
;; `themes` <field name="theme">Cosmetics &amp; soap</field>
;; `refs`   <field name="theme2">Cosmetics &amp; soap</field>
;;
;; `themes` <field name="theme">Clothing &amp; dress</field>
;; `refs`   <field name="theme2">Clothing &amp; dress</field>


;;; ==============================
;; :FIELD "active" :TRANSFORM record-status-active
;;
;;         :TYPE "tinyint(3) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "0" | "1" 
;; 
;; - "0" indicates inactive 
;;   "1" indicates active
;;    When "0" value of `related_pic_num` and `display_pic` will also be "0" and  value of `date_edit` will be "0000-00-00 00:00:00"
;;    When "1" value of `related_pic_num` and `display_pic` should contain item references.
;;


;;; ==============================
;; :FIELD "related_pic_num" :TRANSFORM image-coref
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;; "0"             ; 0 without any trailing #\|
;; "1747|1877|"    ; 
;; "10249|"
;;
;; -
;;  When not "0" has the format:
;;  "<ITEM-REF>|"* 
;;  Where the last char should always be #\|
;;  When not "0" value of field `display_pic` should be present as a member and `active` should "1".
;;  When "0" value of `display_pic` and `active` should also be "0" and value of `date_edit` will be "0000-00-00 00:00:00"
;;
;; (image-coref  (parsed-class-parse-table-lookup 'parsed-theme-record "6963"))

;;; ==============================
;; :FIELD "display_pic" :TRANSFORM image-default-xref
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "0"
;;  "10249"
;;
;; - "0" if unassigned, else corresponds with an item-number
;;    When "0" value of `active` and `display_pic` will also be "0" value of `date_edit` will be "0000-00-00 00:00:00"
;;    When not "0" value is also present in `related_pic_num`


;;; ==============================
;; :FIELD "date_edit" :TRANSFORM "edit-timestamp"
;;
;;         :TYPE "timestamp"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "CURRENT_TIMESTAMP"
;;         :EXTRA "on update CURRENT_TIMESTAMP"
;;
;; :EXAMPLE-VALUES 
;;  "2008-09-20 22:33:51"
;;  "0000-00-00 00:00:00"
;;  "2008-09-20 22:30:25" ; 7156
;;
;; - When present this value indicates the last time the db was updated with relation data.
;;   When value is "0000-00-00 00:00:00" the `active`, `display_pic`, `related_pic_num` should be "0"
;; 
;; - (search-forward-regexp "date_edit\">[^<0].*<" nil t)

;;; ==============================
;; :FIELD "subdivision_number" :TRANSFORM
;;
;;         :TYPE "int(10) unsigned"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT "0"
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "166"
;;  "826"
;; - Used as a numeric index for the subdivisions of all themes in conjunction with the "range" field.
;;  can effectively be ignored.

;;; ==============================
;; :FIELD "range" :TRANSFORM
;;
;;         :TYPE "varchar(45)"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :DEFAULT ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;  "Age-Alg"
;;  "Bra-Bug"
;;   null
;;
;; - Used to indicate the beginning theme for a particluar alphabetic range.
;;   Mostly useless to us now - can be ignored



;;; ==============================
;; :FIELD "RT" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - Never used.
;;   This is the "related-theme" slot
;;

;;; ==============================
;; :FIELD "BT" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - Never used.
;;   This is the "broader-theme" slot.
;;

;;; ==============================
;; :FIELD "US" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - Never used.
;;   This is the "USE" slot.
;;

;;; ==============================
;; :FIELD "UF" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - Never used.
;;   This is the "USED-FOR" slot.
;;

;;; ==============================
;; :FIELD "NT" :TRANSFORM
;;
;;         :TYPE "text"
;;         :NULL-P "NO"
;;         :KEY ""
;;         :EXTRA ""
;;
;; :EXAMPLE-VALUES 
;;
;;
;; - Never Used.
;;   This is the "narrower-theme" slot.



;;; ==============================
;; :FILE notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01/dump-themes-xml
;;
;; <database name="derbycityprints"> 
;; <table_structure name="themes"> 
;; <field Field="id" Type="smallint(5) unsigned" Null="NO" Key="PRI" Extra="auto_increment" /> 
;; <field Field="theme" Type="varchar(255)" Null="NO" Key="" Default="" Extra="" /> 
;; <field Field="active" Type="tinyint(3) unsigned" Null="NO" Key="" Default="0" Extra="" /> 
;; <field Field="RT" Type="text" Null="NO" Key="" Extra="" /> 
;; <field Field="BT" Type="text" Null="NO" Key="" Extra="" /> 
;; <field Field="US" Type="text" Null="NO" Key="" Extra="" /> 
;; <field Field="UF" Type="text" Null="NO" Key="" Extra="" /> 
;; <field Field="NT" Type="text" Null="NO" Key="" Extra="" /> 
;; <field Field="related_pic_num" Type="text" Null="NO" Key="" Extra="" /> 
;; <field Field="display_pic" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" /> 
;; <field Field="subdivision_number" Type="int(10) unsigned" Null="NO" Key="" Default="0" Extra="" /> 
;; <field Field="range" Type="varchar(45)" Null="NO" Key="" Default="" Extra="" /> 
;; <field Field="date_edit" Type="timestamp" Null="NO" Key="" Default="CURRENT_TIMESTAMP" Extra="on update CURRENT_TIMESTAMP" /> 
;; <key Table="themes" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="id" Collation="A" Cardinality="6907" Null="" Index_type="BTREE" Comment="" /> 
;; <options Name="themes" Engine="MyISAM" Version="10" Row_format="Dynamic" Rows="6907" Avg_row_length="54" Data_length="375340" Max_data_length="281474976710655" Index_length="68608" Data_free="0" Auto_increment="13863" Create_time="2009-12-08 00:23:37" Update_time="2009-12-08 00:23:37" Collation="latin1_swedish_ci" Create_options="" Comment="" /> 
;; </table_structure> 
;; <table_data name="themes"> 
;;
;;; ==============================
;; <field name="id">6921</field>
;; <field name="theme">4-H clubs</field>
;; <field name="active">0</field>
;; <field name="RT"></field>
;; <field name="BT"></field>
;; <field name="US"></field>
;; <field name="UF"></field>
;; <field name="NT"></field>
;; <field name="related_pic_num">0</field>
;; <field name="display_pic">0</field>
;; <field name="subdivision_number">2</field>
;; <field name="range"></field>
;; <field name="date_edit">0000-00-00 00:00:00</field>

;;; ==============================
;;; EOF
