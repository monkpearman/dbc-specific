;;; :FILE-CREATED <Timestamp: #{2011-12-16T15:27:56-05:00Z}#{11505} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-image-path-convert.lisp
;;; ==============================

;;; ==============================
;; gathering converting old dcp image paths on a per item number, prepares a
;; directory per item/image number file-system and populates it with the images
;; from the old site pathnames.
;;
;; Our largest item-ref from the xml/sql parse is 12416 our largest picture in httpd/photos/big is 12415
;; Approximate number of image we might have: (* 7 12417) => 86919
;;
;; Approximate number of images we actually have according to `%make-big-filtered-item-image-directory-vector' => 39326
;;
;;; ==============================
;;
;; Following directories are current through March 2009. 
;; We may want to xref these with anything that may have been recovered.
;; 
;; :ITEM-IMAGES
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/
;; ./big
;; ./ebay
;; ./frame
;; ./nafs
;; ./small
;; ./zoom_size
;;
;; :ITEM-HEADER-IMAGES
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/images/backgrounds/headers
;;
;; :ITEM-FLASH-IMAGES
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery
;;
;; Each category based subdir of ./gallery contains the following two subdirs:
;; ./large and ./tn e.g. ./advert/large/ and ./advert/tn
;; 450 x ???
;; #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/"
;;
;; 350 x ???
;; #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/frame/"
;;
;; 100 x 100
;; #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/small/"
;;
;; 1000 x ???
;; #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/zoom_size/"
;; 1024 x 120
;; #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/images/backgrounds/headers/"
;; 446x450
;;
;; #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/*/large/"
;; 100 x 100
;; #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/*/tn/"
;; 
;; ./advert
;; ./archi
;; ./books
;; ./categ4
;; ./geo
;; ./historical
;; ./natural
;;  nothing below these is dated after 2006 and likely these dirs aren't useful:
;; ./categ1 ; 
;; ./categ2
;; ./categ3
;; ./categ4
;; 
;; :NAF-ENTITY-IMAGES
;;
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/nafs/
;; ./artist
;; ./author
;; ./book
;; ./brand
;; ./people
;; ./technique
;;
;;
;; #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/nafs/"

;;; ==============================
;; :TODO 
;; The contents of the readme below which indicates that the
;; files contained therein are to be considered canonical!
;;  #P"/mnt/NEF-DRV-A/Periodicals-Headers-Flash-Zoom/README-2011-08-29"
;;
;; So, figure out if anything needs to be done with the images beneath:
;; #P"/mnt/NEF-DRV-A/Periodicals-Headers-Flash-Zoom/Flash/"
;; #P"/mnt/NEF-DRV-A/Periodicals-Headers-Flash-Zoom/Header/"
;; #P"/mnt/NEF-DRV-A/Periodicals-Headers-Flash-Zoom/Zooms/"
;; #P"/mnt/NEF-DRV-A/Periodicals-Headers-Flash-Zoom/Not-Online/"
;;; ==============================
;;  :TODO figure out what we want to do with class `base-image' and control-ids
;;  w/r/t `*control-id-image-namespace*'
;;
;;; ==============================
;; :NOTE we've aliased mv -> mv --no-clobber
;; shell> xargs -0 --arg-file="/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/dbc-item-image-directory-xargs-2011-12-18" \
;;        -I {} mv -f -b --suffix="-BAK" {} /mnt/NEF-DRV-A/DBC-ITEM-IMAGES/
;;
;; (with-open-file (f (merge-pathnames 
;;                     (make-pathname :name (concatenate 'string "dbc-item-image-directory-xargs-" (mon:time-string-yyyy-mm-dd)))
;;                     #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/")
;;                    :direction :output
;;                    :if-exists :supersede
;;                    :if-does-not-exist :create)
;;   (loop 
;;      for dir in (directory #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/0*/")
;;        ;; not mv is picky about traling slashes in source dir
;;      do (format f "~A~C" (namestring dir) #\NUL)))
;;     
;;; ==============================
;;
;; :NOTE some of the functionality here may be duplicated by stuff under 
;; CL-MON-CODE/image-ops/*
;; CL-MON-CODE/imaging/*
;; CL-MON-CODE/clime/*
;;
;;; ==============================

;; :NOTE Our maing functions are `dbc-item-number-path-lookup-table-populate'
;; and `map-item-image-source-destination-paths'
;;
;; The following variables are defined in dbc-specific/specials.lisp 
;; `*dbc-base-item-number-image-pathname*',
;; `*dbc-item-number-string-mapping-old-image-path-table*',
;; `*dbc-item-number-path-source-destination-vector*'


(in-package #:dbc)

;; (macroexpand-1 
;;  '(def-dbc-item-match-pathname-pattern 
;;      tt--dbc-item-match-big-path
;;      #P"/**/httpd/photos/big/*.jpg" 
;;      :default-name-suffix "-b"
;;      :default-destination-pathname #P"/mnt/NEF-DRV-A/DBC-ITEM-IMAGES/"))
(defmacro def-dbc-item-match-pathname-pattern (fun-name match-with-pattern &key (default-name-suffix nil)
                                                                                (default-destination-pathname *dbc-base-item-number-image-pathname*))
  `(defun ,fun-name (target &key enumber
                                 (enumber-digit-char-p nil)
                                 (enumber-prepending-e nil)
                                 (name-suffix ,default-name-suffix)
                                 (destination-pathname ,default-destination-pathname))
     (declare ((or null string) enumber name-suffix)
              (boolean enumber-prepending-e enumber-digit-char-p)
              (mon:pathname-or-namestring target destination-pathname))
     (dbc-item-match-image-pathname-pattern 
      target
      ,match-with-pattern ;;#P"/**/httpd/photos/big/*.jpg"
      :enumber enumber
      :enumber-digit-char-p enumber-digit-char-p
      :enumber-prepending-e enumber-prepending-e
      :name-suffix name-suffix
      :destination-pathname destination-pathname)))

(defun %ensure-dbc-base-http-synced-item-number-image-pathname-exists (&optional (base-httpd-synced-directory
                                                                                  *dbc-base-httpd-synced-item-number-image-pathname*))
  (declare (mon:pathname-or-namestring base-httpd-synced-directory))
  (unless ;; (osicat:directory-exists-p chk-path)
      (probe-file base-httpd-synced-directory)
    (error ":FUNCTION `ensure-dbc-base-http-synced-item-number-image-pathname-exists'~% ~
              cl:probe-file did not find pathname:~% ~S~% Verify that the path is mounted!!!"
           base-httpd-synced-directory)))

(defun %make-httpd-synced-item-number-image-wild-pathname-list (&optional 
                                                                (base-httpd-synced-directory *dbc-base-httpd-synced-item-number-image-pathname*)
                                                                (subdirs-for-wild-pathname   *dbc-wild-httpd-synced-item-number-image-pathname-list*))
  
  (declare (mon:pathname-or-namestring base-httpd-synced-directory)
           (type (and list (not null)) subdirs-for-wild-pathname))
  (%ensure-dbc-base-http-synced-item-number-image-pathname-exists base-httpd-synced-directory)
  (map 'list #'(lambda (subdir-or-subdir-list)
                 (merge-pathnames 
                  (make-pathname :directory `(:relative ,@(alexandria::ensure-list subdir-or-subdir-list))
                                 :name :wild
                                 :type "jpg")
                  base-httpd-synced-directory))
       subdirs-for-wild-pathname))


;; (%pathname-name-empty-jpeg-p #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/.jpg")
;; (null (%pathname-name-empty-jpeg-p #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/foo.jpg"))
(defun %pathname-name-empty-jpeg-p (pathname)
  (declare (mon:pathname-or-namestring pathname))
  (string= (pathname-name pathname) ".jpg"))

;; (%pathname-notany-solidus-p "a-b-c")
;; (null (%pathname-notany-solidus-p "a/b/c"))
;; (null (%pathname-notany-solidus-p #P"a/b/c"))
(defun %pathname-notany-solidus-p (pathname)
  (declare ((or mon:pathname-or-namestring string) pathname))
  (flet ((solidus-p (char)
           (declare (character char))
           (char= char #\/)))
    (notany #'solidus-p (namestring pathname))))

;; (%pathname-name-all-digit-char-p #P"/frame/9999.jpg")
;; (%pathname-name-all-digit-char-p "/frame/9999.jpg")
;; (null (%pathname-name-all-digit-char-p #P"/frame/9999-x.jpg"))
(defun %pathname-name-all-digit-char-p (pathname)
  (declare (mon:pathname-or-namestring pathname))
  (unless (%pathname-name-empty-jpeg-p pathname)
    (every-digit-char-p (pathname-name pathname))))

;; (%filter-item-image-directory-sequence
;;  #(#P"/httpd/flash_home/gallery/advert/large/10065m.jpg"
;;    #P"/httpd/flash_home/gallery/advert/large/.jpg"
;;    #P"/httpd/flash_home/gallery/advert/large/10065.jpg"
;;    #P"/httpd/flash_home/gallery/advert/large/10556.jpg"))
(defun %filter-item-image-directory-sequence (directory-sequence)
  (declare (sequence directory-sequence))
  (when (zerop (length directory-sequence))
    (return-from %filter-item-image-directory-sequence directory-sequence))
  (delete-if-not #'%pathname-name-all-digit-char-p 
                 (remove-if #'%pathname-name-empty-jpeg-p directory-sequence)))

;; (defparameter *tt--vector* (make-array 18 :fill-pointer 0))
;; (%vector-push-filtered-directory-sequence
;;  #(#P"/httpd/flash_home/gallery/advert/large/10065m.jpg"
;;    #P"/httpd/flash_home/gallery/advert/large/.jpg"
;;    #P"/httpd/flash_home/gallery/advert/large/10065.jpg"
;;    #P"/httpd/flash_home/gallery/advert/large/10556.jpg")
;;  *tt--vector*)
(defun %vector-push-filtered-directory-sequence (filtered-sequence destination-vector)
  (flet ((pusher (path)
           (declare (pathname path))
           (vector-push-extend path destination-vector)))
    (map nil #'pusher filtered-sequence)))

;; (defparameter *tt--vector* 
;;   (%make-big-filtered-item-image-directory-vector 
;;    (%make-httpd-synced-item-number-image-wild-pathname-list)))
(defun %make-big-filtered-item-image-directory-vector (wild-pathname-list)
  (let ((big-directory-array (make-array 86919 :fill-pointer 0)))
    (flet ((pushing-filtered-directory-paths (wild-pathname)
             (declare (pathname wild-pathname))
             (%vector-push-filtered-directory-sequence
              (%filter-item-image-directory-sequence (directory wild-pathname))
              big-directory-array)))
      (map nil #'pushing-filtered-directory-paths wild-pathname-list))
    big-directory-array))

;; (defparameter *dbc-item-number-string-mapping-old-image-path-table* (%make-item-number-string-hash-table))
(defun %make-item-number-string-hash-table (&key (max-item-number 12417))
  (declare ((unsigned-byte 29) max-item-number))
  (loop 
    with item-max-prime = (mon:prime-or-next-greatest max-item-number)
    with hash-table = (make-hash-table :test #'equal
                                       ;; :size (mon:prime-or-next-greatest max-item-number))
                                       :size item-max-prime)
    for num from 1 below max-item-number
    ;; :WAS for numstring = (write-to-string num) ;;
    for numstring = (format nil "~V,'0d" 6 num)
    for vec = (make-array 7 :fill-pointer 0) ; for `vector-push-extend'
    do (setf (gethash numstring hash-table) vec)
    finally (return hash-table)))

;; (%ensure-directory-item-number-exists *dbc-item-number-string-mapping-old-image-path-table*)
;; Ensure each item-key of BIG-ITEM-STRING-HASH-TABLE is a subdirectory of
;; DESTINATION-PATHNAME return list of any pathnames created.
(defun %ensure-directory-item-number-exists (big-item-string-hash-table 
                                             &key (destination-pathname *dbc-base-item-number-image-pathname*))
  (declare (mon:pathname-or-namestring destination-pathname)
           (hash-table big-item-string-hash-table))
  (loop 
    for item-key string being the hash-keys of big-item-string-hash-table
    for log-created =  (multiple-value-bind (path created)
                           (ensure-directories-exist 
                            (merge-pathnames (make-pathname :directory `(:relative ,item-key))
                                             destination-pathname))
                         (when created created))
    ;; for log-created = (probe-file 
    ;; (merge-pathnames (make-pathname :directory `(:relative ,item-key))
    ;;                  destination-pathname))
    ;; unless log-created collect item-key))
    when log-created collect it))

;; (format nil "~V,'0d" 6 num)

;; (%make-item-number-string-hash-table-values *dbc-item-number-path-source-destination-vector* *dbc-item-number-string-mapping-old-image-path-table*)
(defun %make-item-number-string-hash-table-values (big-path-vector big-item-string-hash-table)
  (loop 
    for image-path across big-path-vector
    ;; WAS for lookup-key = (pathname-name image-path) ;; 
    for lookup-key = (format nil "~V,,,'0@A" 6 (pathname-name image-path))
    for hash-val = (gethash lookup-key big-item-string-hash-table)
    do (when hash-val  
         (vector-push-extend image-path hash-val))
    finally (return big-item-string-hash-table)))

;;; ==============================
;; :NOTE Our main functions:
;; `dbc-item-number-path-lookup-table-populate' and `map-item-image-source-destination-paths', `dbc-image-conversion-doing-item-conversions'
;;; ==============================

;; (dbc-item-number-path-lookup-table-populate)
(defun dbc-item-number-path-lookup-table-populate (&optional
                                                   (base-httpd-synced-directory *dbc-base-httpd-synced-item-number-image-pathname*)
                                                   (subdirs-for-wild-pathname   *dbc-wild-httpd-synced-item-number-image-pathname-list*))
  (let ((wild-paths (%make-httpd-synced-item-number-image-wild-pathname-list base-httpd-synced-directory 
                                                                             subdirs-for-wild-pathname))) 
    (setf *dbc-item-number-string-mapping-old-image-path-table* nil)
    (setf *dbc-item-number-string-mapping-old-image-path-table*  
          (%make-item-number-string-hash-table-values
           (%make-big-filtered-item-image-directory-vector wild-paths)
           (%make-item-number-string-hash-table)))))

;; (length (setf *dbc-item-number-path-source-destination-vector*
;;               (map-item-image-source-destination-paths *dbc-item-number-string-mapping-old-image-path-table*)))
;;
;; (aref *dbc-item-number-path-source-destination-vector* 12395)
;;
;; (length (setf *dbc-item-number-path-source-destination-vector*
;;               (map-item-image-source-destination-paths *dbc-item-number-string-mapping-old-image-path-table* 
;;                                                        :zero-padded-item-number t)))
;;
;; (aref *dbc-item-number-path-source-destination-vector* 12395)
;;
;; (length (setf *dbc-item-number-path-source-destination-vector*
;;               (map-item-image-source-destination-paths *dbc-item-number-string-mapping-old-image-path-table* 
;;                                                        :zero-padded-enumber t)))
;;
;; (aref *dbc-item-number-path-source-destination-vector* 12395)
(defun map-item-image-source-destination-paths (big-item-string-hash-table &key zero-padded-enumber 
                                                                                zero-padded-item-number)
  (loop
    with big-vec = (make-array (hash-table-count big-item-string-hash-table))
    with fun-list = '(dbc-item-match-big-path dbc-item-match-small-path dbc-item-match-zoom-path
                      dbc-item-match-flash-path dbc-item-match-header-path dbc-item-match-frame-path)  
    ;; from 1 b/c we want the item-number aren't 0 indexed
    for big-vec-ref from 1 below (hash-table-count big-item-string-hash-table)
    for item-key string being the hash-keys of big-item-string-hash-table using (hash-value vec)
    for item-string = (if (or zero-padded-enumber zero-padded-item-number)
                          item-key
                          (write-to-string (parse-integer item-key)))
    ;; for enumber-string = (concatenate 'string #(#\e) item-key)
    for gathered-transforms = (list item-string
                                    (loop
                                      for fun in fun-list
                                      nconcing (loop 
                                                 for path across vec 
                                                 for maybe-transform = (multiple-value-bind (dest src)
                                                                           (cond (zero-padded-enumber
                                                                                  (apply fun path (list :enumber item-key
                                                                                                        :enumber-digit-char-p t
                                                                                                        :enumber-prepending-e t)))
                                                                                 (zero-padded-item-number
                                                                                  (apply fun path (list :enumber item-key)))
                                                                                 (t (funcall fun path)))
                                                                         (when dest (cons  src dest)))
                                                 when maybe-transform collect it)))
    do (setf (aref big-vec big-vec-ref) gathered-transforms)
    finally (return big-vec)))

;; Destructively set each elt of BIG-SOURCE-DESTINATION-PATH-VECTOR which doesn't map source/dest paths to NIL.
;; Return list of the elts filtered.
(defun %filter-item-number-image-source-destination-vector (big-source-destination-path-vector)
  (declare (array big-source-destination-path-vector))
  (loop
    for num from 0 below (length big-source-destination-path-vector)
    for item = (aref big-source-destination-path-vector num )
    for paths = (etypecase item 
                  (unsigned-byte nil)
                  (t (cadr item)))
    when (null paths) 
      do (setf (aref big-source-destination-path-vector num) nil) 
      and collect num))

;; :NOTE functions which accept a DESTINATION-PATHNAME keyword argument should default to something sensible
;; construction of the default should be abstracted to a dedicated function -
;; ideally one specialized on a class specific to what we are
;; doing here. Below we are hardwiring pathnames is always a bad idea!
;;
;; (%write-big-item-number-image-directory-hash-to-file  
;;  *dbc-item-number-string-mapping-old-image-path-table*
;;  :destination-pathname (merge-pathnames 
;;                         (make-pathname :name (concatenate 'string 
;;                                                           "dbc-item-image-pathnames" 
;;                                                           "-"
;;                                                           (mon:time-string-yyyy-mm-dd)))
;;                         *dbc-base-item-number-image-pathname*)) 
(defun %write-big-item-number-image-directory-hash-to-file (big-item-string-hash-table &key destination-pathname)
  (declare (mon:pathname-or-namestring destination-pathname)
           (hash-table big-item-string-hash-table))
  (with-open-file (tr destination-pathname
                      :direction :output
                      :if-exists :supersede
                      :if-does-not-exist :create)
    (loop 
      for item-key string being the hash-keys of big-item-string-hash-table using (hash-value vec)
      do (pprint (list item-key vec) tr)
      finally (return destination-pathname))))

;; (%write-big-item-number-image-source-destination-vector-to-file 
;;  *dbc-item-number-path-source-destination-vector*
;;  :destination-pathname (merge-pathnames 
;;                         (make-pathname :name (concatenate 'string 
;;                                                           "dbc-item-image-src-dest-pathnames" 
;;                                                           ;; "dbc-item-image-src-dest-pathnames-zero-padded" 
;;                                                           "-"
;;                                                           (mon:time-string-yyyy-mm-dd)))
;;                         *dbc-base-item-number-image-pathname*))
(defun %write-big-item-number-image-source-destination-vector-to-file (item-number-path-source-destination-vector &key destination-pathname)
  (declare (mon:pathname-or-namestring destination-pathname)
           (vector item-number-path-source-destination-vector))
  (with-open-file (tr destination-pathname
                      :direction :output
                      :if-exists :supersede
                      :if-does-not-exist :create)
    (loop 
      for item-key across item-number-path-source-destination-vector
      if (listp item-key)  
        do (pprint item-key tr)
      finally (return destination-pathname))))

;; (%string-trim-maybe-prepend-enumber nil)
;; (%string-trim-maybe-prepend-enumber "q-1334-")
;; (%string-trim-maybe-prepend-enumber "-q-1334-")
;; (%string-trim-maybe-prepend-enumber "-q-1334-" :enumber-prepending-e t)
;; (%string-trim-maybe-prepend-enumber "e-1334" :enumber-digit-char-p t :enumber-prepending-e t)
;; (%string-trim-maybe-prepend-enumber "e1334")
;; (%string-trim-maybe-prepend-enumber "e1334" :enumber-digit-char-p t :enumber-prepending-e t)
;; (%string-trim-maybe-prepend-enumber "-1334" :enumber-digit-char-p t)
;; (%string-trim-maybe-prepend-enumber "-1334-" :enumber-digit-char-p t)
;; (%string-trim-maybe-prepend-enumber "1334-")
;; Following fails successfully:
;; (%string-trim-maybe-prepend-enumber "-")
;; (%string-trim-maybe-prepend-enumber "e1334" :enumber-digit-char-p t)
;; (%string-trim-maybe-prepend-enumber "q-1334" :enumber-digit-char-p t)
;; (%string-trim-maybe-prepend-enumber "e-1334" :enumber-digit-char-p t)
(defun %string-trim-maybe-prepend-enumber (enumber &key (enumber-digit-char-p nil)
                                                        (enumber-prepending-e nil))
  (declare ((or string null) enumber))
  (if (null enumber) 
      nil
      (let* ((trim-pretest
               (when (zerop
                      (length
                       (if (%pathname-notany-solidus-p enumber)
                           enumber
                           (error ":FUNCTION `%string-trim-maybe-prepend-enumber'~% ~
                          arg ENUMBER did not satisfy `%pathname-notany-solidus-p'~% ~
                          got: ~S" enumber))))
                 (error ":FUNCTION `%string-trim-maybe-prepend-enumber'~% ~
                          arg ENUMBER is the empty-string~% ~
                          got: ~S" enumber)))
             (trim (string-right-trim '(#\-) 
                                      (if enumber-digit-char-p 
                                          (if enumber-prepending-e
                                              (string-left-trim '(#\e #\-) enumber)
                                              (string-left-trim '(#\-) enumber))
                                          (string-left-trim '(#\-) enumber))))
             (trim-length-ensured (if (zerop (length trim))
                                      (error ":FUNCTION `%string-trim-maybe-prepend-enumber'~% ~
                                              arg ENUMBER is empty-string after cl:string-left-trim~% ~
                                              got: ~S" enumber)
                                      (if enumber-digit-char-p 
                                          (if (every-digit-char-p trim)
                                              (if enumber-prepending-e
                                                  (concatenate 'string #(#\e) trim)
                                                  trim)
                                              (error ":FUNCTION `%string-trim-maybe-prepend-enumber'~% ~
                                                       with arg ENUMBER-DIGIT-CHAR-P non-nil arg ENUMBER did not satisfy `every-digit-char-p'~% ~
                                                       got: ~S" enumber))
                                          trim))))
        (declare (ignore trim-pretest))
        trim-length-ensured)))

;; (%string-trim-maybe-prepend-with-name-suffix "f")
;; (%string-trim-maybe-prepend-with-name-suffix "-f")
;; (%string-trim-maybe-prepend-with-name-suffix "-fs-")
;; Following fails successfully:
;; (%string-trim-maybe-prepend-with-name-suffix "--")
(defun %string-trim-maybe-prepend-with-name-suffix (name-suffix)
  (declare ((or string null) name-suffix))
  (if (null name-suffix) 
      nil
      (let* ((trim (string-trim '(#\-) name-suffix))
             (trim-length-ensured (if (zerop (length trim))
                                      (error ":FUNCTION `%string-trim-maybe-prepend-with-name-suffix'~% ~
                                              arg NAME-SUFFIX is empty-string after cl:string-trim~% ~
                                              got: ~S" name-suffix)
                                      (concatenate 'string #(#\-) trim))))
        trim-length-ensured)))

;; (dbc-item-match-image-pathname-pattern 
;;  #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/73.jpg"
;;  #P"/**/photos/big/*.jpg"
;;  :enumber "e1334")
;;
;; (dbc-item-match-image-pathname-pattern 
;;   #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/73.jpg"
;;  ;; #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photosm/big/73.jpg" ; non-matching fails
;;  ;; #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/natural/tn/5606.jpg" ; non-matching fails
;;  #P"/**/photos/big/*.jpg"
;;  :enumber "bubba"
;;  ;; :enumber "1334"
;;  ;; :enumber-digit-char-p t
;;  ;; :enumber-prepending-e t
;;  :name-suffix "-b"
;;  ;; :name-suffix nil
;;  :destination-pathname #P"/home/foo/images")
(defun dbc-item-match-image-pathname-pattern (target match-pattern 
                                              &key enumber
                                                   (enumber-digit-char-p nil)
                                                   (enumber-prepending-e nil)
                                                   (name-suffix nil name-suffix-supplied-p)
                                                   (destination-pathname *dbc-base-item-number-image-pathname*))
  (declare ((or null string) enumber name-suffix)
           (mon:pathname-or-namestring match-pattern destination-pathname))
  (let* ((match-check 
           (if (pathname-match-p target match-pattern) 
               (or (if name-suffix-supplied-p
                       (%string-trim-maybe-prepend-with-name-suffix name-suffix)
                       name-suffix)
                   T)
               (return-from dbc-item-match-image-pathname-pattern (values nil target))))
         (name-if 
           (if enumber 
               (%string-trim-maybe-prepend-enumber enumber  
                                                   :enumber-digit-char-p enumber-digit-char-p
                                                   :enumber-prepending-e enumber-prepending-e)
               (pathname-name target)))
         (relative-directory-if 
           (list :relative name-if))
         (pathname-name-if
           (concatenate 'string name-if (etypecase match-check 
                                          (string match-check) 
                                          (boolean nil))))
         (merge-pathnames-if 
           (merge-pathnames 
            (make-pathname :directory relative-directory-if 
                           :name pathname-name-if 
                           :type "jpg") 
            destination-pathname)))
    (values 
     (when merge-pathnames-if merge-pathnames-if)
     target)))

;; (dbc-item-match-big-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/73.jpg")
;; (dbc-item-match-big-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/73.jpg" :enumber "e3040")
;; (defun dbc-item-match-big-path (target &key enumber (name-suffix nil) (destination-pathname #P"/mnt/NEF-DRV-A/DBC-ITEM-IMAGES/"))
;;   (declare ((or null string) enumber name-suffix)
;;            (mon:pathname-or-namestring destination-pathname))
;;   (dbc-item-match-image-pathname-pattern 
;;    target
;;    #P"/**/httpd/photos/big/*.jpg"
;;    :enumber enumber
;;    :name-suffix name-suffix
;;    :destination-pathname destination-pathname))
;;
;; (dbc-item-match-small-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/small/1239.jpg")
;; (defun dbc-item-match-small-path (target &key enumber (name-suffix "-s") (destination-pathname #P"/mnt/NEF-DRV-A/DBC-ITEM-IMAGES/"))
;;   (declare ((or null string) enumber name-suffix)
;;            (mon:pathname-or-namestring destination-pathname))
;;   (dbc-item-match-image-pathname-pattern 
;;    target
;;    #P"/**/httpd/photos/small/*.jpg"
;;    :enumber enumber
;;    :name-suffix name-suffix
;;    :destination-pathname destination-pathname))
;;
;; (dbc-item-match-zoom-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/zoom_size/1238.jpg" :enumber "7777")
;; (defun dbc-item-match-zoom-path (target &key enumber (name-suffix "-z" name-suffix-supplied-p) (destination-pathname #P"/mnt/NEF-DRV-A/DBC-ITEM-IMAGES/"))
;;   (declare ((or null string) enumber name-suffix)
;;            (mon:pathname-or-namestring destination-pathname))
;;   (dbc-item-match-image-pathname-pattern 
;;    target
;;    #P"/**/httpd/photos/zoom_size/*.jpg"
;;    :enumber enumber
;;    :name-suffix name-suffix
;;    :destination-pathname destination-pathname))
;;
;; (dbc-item-match-header-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/images/backgrounds/headers/3223.jpg" 
;;                             :enumber "1377" 
;;                             :enumber-digit-char-p t
;;                             :enumber-prepending-e t)

(def-dbc-item-match-pathname-pattern 
    dbc-item-match-big-path
    #P"/**/httpd/photos/big/*.jpg" 
    ;; :default-name-suffix "-b"
    :default-destination-pathname *dbc-base-item-number-image-pathname*)

(def-dbc-item-match-pathname-pattern 
    dbc-item-match-small-path
    #P"/**/httpd/photos/small/*.jpg"
    :default-name-suffix "s"
    :default-destination-pathname *dbc-base-item-number-image-pathname*)

(def-dbc-item-match-pathname-pattern
    dbc-item-match-zoom-path
    #P"/**/httpd/photos/zoom_size/*.jpg"
    :default-name-suffix "z"
    :default-destination-pathname *dbc-base-item-number-image-pathname*)

(def-dbc-item-match-pathname-pattern
    dbc-item-match-frame-path
    #P"/**/httpd/photos/frame/*.jpg"
    :default-name-suffix "m"
    :default-destination-pathname *dbc-base-item-number-image-pathname*)

(def-dbc-item-match-pathname-pattern
    dbc-item-match-header-path
    #P"/**/httpd/images/backgrounds/headers/*.jpg"
    :default-name-suffix "h"
    :default-destination-pathname *dbc-base-item-number-image-pathname*)

(def-dbc-item-match-pathname-pattern
    dbc-item-match-flash-path-categ
    #P"/**/httpd/flash_home/gallery/categ*/large/*.jpg"
    :default-name-suffix "fc" 
    :default-destination-pathname *dbc-base-item-number-image-pathname*)

(def-dbc-item-match-pathname-pattern
    dbc-item-match-flash-path-large
    #P"/**/httpd/flash_home/gallery/*/large/*.jpg"
    :default-name-suffix  "f"
    :default-destination-pathname *dbc-base-item-number-image-pathname*)

(def-dbc-item-match-pathname-pattern
    dbc-item-match-flash-path-thumb
    #P"/**/httpd/flash_home/gallery/*/tn/*.jpg"
    :default-name-suffix "fs"
    :default-destination-pathname *dbc-base-item-number-image-pathname*)

(defun dbc-item-match-flash-path (target &key enumber
                                              (enumber-digit-char-p nil)
                                              (enumber-prepending-e nil)
                                              (name-suffix "f")
                                              (name-suffix-thumb "fs")
                                              (name-suffix-categ "fc")
                                              (destination-pathname *dbc-base-item-number-image-pathname*)
                                              (base-httpd-syned-directory *dbc-base-httpd-synced-item-number-image-pathname*))
  ;;(unless (pathname-match-p target #P"/**/httpd/flash_home/gallery/*/*/*.jpg")
  ;; (return-from dbc-item-match-flash-path (values nil target)))
  (unless (pathname-match-p target 
                            (make-pathname :directory `(:relative "" :wild-inferiors
                                                                  ,@(last (pathname-directory base-httpd-syned-directory))
                                                                  "flash_home" "gallery" :wild :wild)
                                           :name :wild
                                           :type "jpg"))
    (return-from dbc-item-match-flash-path (values nil target)))
  (let* ((funs-and-suffixe
           ;; :NOTE Order is important categ must be first b/c large matches categ paths as well!
           (list (list 'dbc-item-match-flash-path-categ name-suffix-categ)
                 (list 'dbc-item-match-flash-path-large name-suffix)
                 (list 'dbc-item-match-flash-path-thumb name-suffix-thumb)))
         (common-args 
           (list target
                 :enumber enumber
                 :enumber-digit-char-p enumber-digit-char-p
                 :enumber-prepending-e enumber-prepending-e
                 :destination-pathname destination-pathname))
         (fun-and-args
           (loop 
             for (f s) in funs-and-suffixe
             collecting `(,f ,@common-args :name-suffix ,s))))
    (flet ((mapping-multiples (eval-form)
             (multiple-value-bind (matched path) (apply (car eval-form) (cdr eval-form))
               (when matched 
                 (return-from dbc-item-match-flash-path (values matched path))))))
      (mapc #'mapping-multiples fun-and-args))))

;; adapted from `copy-byte-stream' in clime/copy-bytes.lisp
(defun dcp-item-image-copy-byte-stream (from-byte-stream to-byte-stream &key (element-type 'unsigned-byte))
  (let ((byte-stream-bfr (make-array 4096 :element-type element-type)))
    (do ((byte-stream-pos (read-sequence byte-stream-bfr from-byte-stream) 
                          (read-sequence byte-stream-bfr from-byte-stream)))
        ((zerop byte-stream-pos) nil)
      (write-sequence byte-stream-bfr to-byte-stream :end byte-stream-pos))))

;; adapted from `copy-byte-file' in clime/copy-bytes.lisp
(defun dcp-item-image-copy-byte-file (source-byte-file dest-byte-file 
                                      &key (if-exists :supersede) ;; :error 
                                           (element-type    'unsigned-byte)
                                           (set-dest-byte-file-write-date nil))
  ;; (external-format :default)
  ;; (report-stream   *standard-output*))
  ;; (verify-element-type-for-copy-byte element-type :stream report-stream)
  (with-open-file (byte-input source-byte-file
                              :direction         :input
                              :if-does-not-exist :error
                              ;; :external-format   external-format ; Is this ever applicable?
                              :element-type      element-type)
    (with-open-file (byte-output dest-byte-file
                                 :direction         :output
                                 :if-does-not-exist :create
                                 :if-exists         if-exists
                                 ;; :external-format   external-format ; Is this ever applicable?
                                 :element-type      element-type)
      (dcp-item-image-copy-byte-stream byte-input
                                       byte-output 
                                       :element-type element-type)))
  ;; (probe-file dest-byte-file)
  (and
   (probe-file dest-byte-file)
   (and set-dest-byte-file-write-date
        (or (mon::set-file-write-date-using-file (namestring source-byte-file) (namestring dest-byte-file)) 
            t))
   dest-byte-file))


(defclass dbc-item-image-conversion-state ()
  ((image-number
    :initarg :image-number
    :reader image-number)
   (image-source-dest-pairs
    :initarg :image-source-dest-pairs
    :accessor image-source-dest-pairs)
   (image-current-pair
    :initform '()
    :accessor image-current-pair)
   ;; (image-dest-base-pathname
   ;;  :initarg :image-source-dest-pairs
   ;;  :accessor image-source-dest-pairs)
   ))

(defun make-dbc-item-image-conversion-state (conversion-spec &key stream)
  (let ((img-num (or (car conversion-spec)
                     (progn
                       (dbc-image-conversion-report-empty-spec :stream stream)
                       (return-from make-dbc-item-image-conversion-state))))
        (img-pairs (or (cadr conversion-spec)
                       (progn
                         (dbc-image-conversion-report-empty-pairs (car conversion-spec) :stream stream)
                         (return-from make-dbc-item-image-conversion-state)))))
    (make-instance 'dbc-item-image-conversion-state
                   :image-number img-num
                   :image-source-dest-pairs img-pairs)))

(defun dbc-image-conversion-current-pair-source (object)
  (car (image-current-pair object)))

(defun dbc-image-conversion-current-pair-dest (object)
  (cdr (image-current-pair object)))

(defun dbc-image-conversion-report-empty-spec (&key stream)
  (format stream "~%Got empty conversion-spec !!!~%"))

(defun dbc-image-conversion-report-empty-pairs (item-num &key stream)
  (format stream "~%:ITEM ~A -- with empty paths !!!~%" item-num))

(defun dbc-image-conversion-report-next-pair (object &key stream)
  (format stream "~%:ITEM ~A -- converting next src/dest pair~% source: ~S~%   dest: ~S~%"
          (image-number object)
          (dbc-image-conversion-current-pair-source object)
          (dbc-image-conversion-current-pair-dest object)))

(defun dbc-image-conversion-report-next-item (object &key stream)
  (format stream "~%:ITEM ~A -- begin converting paths~%" (image-number object)))

(defun dbc-image-conversion-report-finished-pairs (object &key stream)
  (format stream "~%:ITEM ~A -- finished converting paths~%" (image-number object)))

(defun dbc-image-conversion-report-existing-dest (object &key stream)
  (format stream "~%:ITEM ~A -- found duplicate destination pathname:~%~T~S~%" 
          (image-number object)
          (dbc-image-conversion-current-pair-dest object)))

(defun dbc-image-conversion-report-new-dest (object &key stream)
  (format stream " -- using new destination pathname:~% ~S~%" 
          (dbc-image-conversion-current-pair-dest object)))
  
(defun dbc-image-conversion-next-pair (object &key stream)
  (when (null (image-source-dest-pairs object))
    (dbc-image-conversion-report-finished-pairs object :stream stream)
    (return-from dbc-image-conversion-next-pair 
      (setf (image-current-pair object) nil)))
  (let* ((pop-pair  (pop (image-source-dest-pairs object)))
         (next-pair (setf (image-current-pair object) pop-pair)))
    ;;(declare (ignore next-pair))
    (dbc-image-conversion-report-next-pair object :stream stream)
    next-pair))

(defun dbc-image-conversion-probe-dest (object &key stream)
  (let ((dest (dbc-image-conversion-current-pair-dest object)))
    (when (probe-file dest)
      (dbc-image-conversion-report-existing-dest object :stream stream)
      (let ((new-dest-name (make-pathname :directory (pathname-directory dest)
                                          :name (concatenate 'string (pathname-name dest) (list #\B))
                                          :type (pathname-type dest))))
        (setf (cdr (image-current-pair object)) new-dest-name)
        (dbc-image-conversion-report-new-dest object :stream stream)))))

(defun dbc-image-conversion-copy-src-dest (object &key stream)
  (if (dbc-image-conversion-next-pair object :stream stream)
      (prog2
          (dbc-image-conversion-probe-dest object :stream stream)
          ;; 
          ;; Following won't work b/c we are moving across file-system boundaries:
          ;;
          ;; (sb-unix:unix-rename (namestring (dbc-image-conversion-current-pair-source object))
          ;;                      (namestring (dbc-image-conversion-current-pair-dest object)))
          ;; e.g.
          ;; (sb-unix:unix-rename "/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/QE2-poster-BAK.jpg"
          ;;                      "/mnt/NEF-DRV-A/tt-blobs/QE2-poster-BAK.jpg")
          ;;
          (dcp-item-image-copy-byte-file (dbc-image-conversion-current-pair-source object)
                                         (dbc-image-conversion-current-pair-dest object)
                                         :set-dest-byte-file-write-date t)
        (setf (image-current-pair object) nil))
      nil))

(defun dbc-image-conversion-ensure-destination-directory (object)
  (ensure-directories-exist 
   (merge-pathnames (make-pathname :directory `(:relative ,(image-number object)))
                    *dbc-base-item-number-image-pathname*)))

(defun dbc-image-conversion-doing-pairs (spec &key stream)
  (let ((obj (or (make-dbc-item-image-conversion-state spec :stream stream)
                 (return-from dbc-image-conversion-doing-pairs))))
    
    (loop 
       initially (dbc-image-conversion-ensure-destination-directory obj)
                 (dbc-image-conversion-report-next-item obj :stream stream)
       while (dbc-image-conversion-copy-src-dest obj :stream stream))))


;; This was used to form to perform the actual conversion
;;
;; (sb-thread:make-thread #'(lambda ()
;;                            (dbc-image-conversion-doing-item-conversions
;;                             *dbc-item-number-path-source-destination-vector*
;;                             :stream *standard-output*)
;;                            (finish-output))
;;                        :name (format nil "dbc-image-conversion-perform-~D" (random most-positive-fixnum)))
;;
(defun dbc-image-conversion-doing-item-conversions (spec-vec 
                                                    &key stream 
                                                         (log-file (merge-pathnames
                                                                    (make-pathname 
                                                                     :name (mon:timestamp-for-file-with :prefix "dbc-item-image-conversion-log"))
                                                                    *dbc-base-item-number-image-pathname*)))
  (with-open-file (lf log-file
                      :direction :output
                      :if-exists :supersede
                      :if-does-not-exist :create)
    (with-open-stream (bs (make-broadcast-stream stream lf))
      (etypecase spec-vec
        (list 
         (loop 
           for item-spec in spec-vec
           do (dbc-image-conversion-doing-pairs item-spec :stream bs)))
        (array
         (loop 
           for item-spec across spec-vec
           when (listp item-spec)
             do (dbc-image-conversion-doing-pairs item-spec :stream bs)))))))


;; Following used to fix borken copied files which didn't get their modtime attributes updated!
(defun %dbc-item-image-update-modtimes ()
  (let ((src-dest-vec *dbc-item-number-path-source-destination-vector*))
    (loop
      for num from 0 below (length src-dest-vec)
      for item = (aref  src-dest-vec num)
      for paths = (etypecase item 
                    (unsigned-byte nil)
                    (t (cadr item)))
      unless (null paths) 
        do (loop 
             for (src . dest) in paths
             if (and (or (probe-file src)
                         (format T "~%found non-existent source pathname:~% ~S~%" src))
                     (or (probe-file dest)
                         (format T "~%found non-existent destination pathname:~% ~S~%" dest)))
               do (mon::set-file-write-date-using-file dest src) 
               and do (format T "~%set modtimes for pathname: ~A~%" dest)))))


;;; :NOTE OLD definition of `dbc-item-match-flash-path'
;; (dbc-item-match-flash-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/large/11115.jpg")
;; | => #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/11115/11115-f.jpg",
;; |    #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/large/11115.jpg"
;;  
;; (dbc-item-match-flash-path 
;;   #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/tn/11115.jpg" 
;;   :enumber "1134" 
;;   :enumber-digit-char-p t)
;;
;; (dbc-item-match-flash-path 
;;  #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/tn/11115.jpg" 
;;  :enumber "1134" 
;;  :enumber-digit-char-p t 
;;  :enumber-prepending-e t)
;;
;; (dbc-item-match-flash-path 
;;  #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/tn/11115.jpg" 
;;  :enumber "bubba" )
;;
;; | => #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/11115/11115-fs.jpg", 
;; |    #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/tn/11115.jpg"
;;
;; (dbc-item-match-flash-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/large/11115.jpg"
;;                            :enumber "e3011")
;; | => #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/e3011/e3011-f.jpg",
;; |    #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/large/11115.jpg"
;;           
;; (dbc-item-match-flash-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/categ1/large/5606.jpg")
;; (dbc-item-match-flash-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/tn/11115.jpg"
;;                            ;:enumber "3011"
;;                            :enumber-digit-char-p t
;;                            :enumber-prepending-e t
;;                            :destination-pathname #P"/bubba/")
;; | => #P"/bubba/e3011/e3011-fs.jpg"
;; |    #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/tn/11115.jpg"
;;
;; (null (dbc-item-match-flash-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/categ4/large/Flash Home/1205.jpg" ))
;; => T
;;  
;; (dbc-item-match-flash-path
;;  ;; #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/large/11115.jpg"
;;  #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/categ1/large/5606.jpg"
;;  :name-suffix-categ "cat")


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
