;;; :FILE-CREATED <Timestamp: #{2011-12-16T15:27:56-05:00Z}#{11505} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-image-path-convert.lisp
;;; ==============================

;;; ==============================
;;; gathering converting old dcp image paths on a per item number in preparation
;;; for moving to a directory per item number system
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
;;; ==============================
;;  :NOTE figure out what we want to do with class `base-image' and control-ids
;;  w/r/t `*control-id-image-namespace*'
;;; ==============================


(in-package #:dbc)

;; (macroexpand-1 
;;  '(def-dbc-item-match-pathname-pattern 
;;      tt--dbc-item-match-big-path
;;      #P"/**/httpd/photos/big/*.jpg" 
;;      :default-name-suffix "-b"
;;      :default-destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/"))
(defmacro def-dbc-item-match-pathname-pattern (fun-name match-with-pattern &key (default-name-suffix nil)
                                               (default-destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/"))
  `(defun ,fun-name (target 
                     &key 
                     enumber
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



;; (%pathname-name-empty-jpeg-p #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/.jpg")
;; (null (%pathname-name-empty-jpeg-p #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/foo.jpg"))
(defun %pathname-name-empty-jpeg-p (pathname)
  (declare (mon:pathname-or-namestring pathname))
  (string= (pathname-name pathname) ".jpg"))

(defun %every-digit-char-p (string)
  (declare (string string))
  (every #'digit-char-p string))

;; (defun %every-digit-char-p (string)
;;   (declare (string string))
;;   (every #'digit-char-p string))

;; (%pathname-notany-solidus-p "a-b-c")
;; (null (%pathname-notany-solidus-p "a/b/c"))
;; (null (%pathname-notany-solidus-p #P"a/b/c"))
(defun %pathname-notany-solidus-p (pathname)
  (declare (mon:pathname-or-namestring pathname))
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
    (%every-digit-char-p (pathname-name pathname))))

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
;;    (list #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/*.jpg"
;;          #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/frame/*.jpg"
;;          #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/small/*.jpg"
;;          #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/zoom_size/*.jpg"
;;          #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/images/backgrounds/headers/*.jpg"
;;          #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/*/large/*.jpg"
;;          #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/*/tn/*.jpg")))
(defun %make-big-filtered-item-image-directory-vector (wild-pathname-list)
  (let ((big-directory-array (make-array 86919 :fill-pointer 0)))
    (flet ((pushing-filtered-directory-paths (wild-pathname)
             (declare (pathname wild-pathname))
             (%vector-push-filtered-directory-sequence
              (%filter-item-image-directory-sequence (directory wild-pathname))
              big-directory-array)))
      (map nil #'pushing-filtered-directory-paths wild-pathname-list))
    big-directory-array))

;; (defparameter *tt-item-number-string-table* (%make-item-number-string-hash-table))
(defun %make-item-number-string-hash-table (&key (max-item-number 12417))
  (declare ((unsigned-byte 29) max-item-number))
  (loop 
     with hash-table = (make-hash-table :test #'equal
                                        :size (mon:prime-or-next-greatest max-item-number))
     for num from 1 below 12417
     for numstring = (write-to-string num)
     for vec = (make-array 7 :fill-pointer 0) ; for `vector-push-extend'
     do (setf (gethash numstring hash-table) vec)
     finally (return hash-table)))

;; (%make-item-number-string-hash-table-values *tt--vector* *tt-item-number-string-table*)
(defun %make-item-number-string-hash-table-values (big-path-vector big-item-string-hash-table)
  (loop 
     for image-path across big-path-vector
     for lookup-key = (pathname-name image-path)
     for hash-val = (gethash lookup-key big-item-string-hash-table)
     do (when hash-val  
          (vector-push-extend image-path hash-val))
     finally (return big-item-string-hash-table)))

;; :NOTE functions which accept a DESTINATION-PATHNAME keyword argument should default to something sensible
;; construction of the default should be abstracted to a dedicated function -
;; ideally one specialized on a class specific to what we are
;; doing here. Below we are hardwiring pathnames is always a bad idea!

;; (defclass %
;; (%write-big-filtered-item-image-directory-vector-to-file *tt--vector*)
(defun %write-big-filtered-item-image-directory-vector-to-file (big-filtered-image-vector &key destination-pathname)
  (let ((dest (unless destination-pathname
                (merge-pathnames 
                 (make-pathname :name (concatenate 'string 
                                                   "dbc-item-image-pathnames" 
                                                   "-"
                                                   (mon:time-string-yyyy-mm-dd)))
                 #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/"))))
    (with-open-file (v  dest
                        :direction :output
                        :if-exists :supersede
                        :if-does-not-exist :create)
      (map nil #'(lambda (x) (print x v)) big-filtered-image-vector))))

;; (%write-big-item-number-image-directory-hash-to-file 
;;  *tt-item-number-string-table* 
;;  :destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/dbc-item-image-pathnames-2011-12-15")
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
;;

;; (%string-trim-maybe-prepend-enumber "3011")
;;                                     :enumber-digit-char-p t
;;                                     :enumber-prepending-e nil)
(defun %string-trim-maybe-prepend-enumber (enumber &key (enumber-digit-char-p nil) (enumber-prepending-e nil))
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
                                          (if (%every-digit-char-p trim)
                                              (if enumber-prepending-e
                                                  (concatenate 'string #(#\e) trim)
                                                  trim)
                                              (error ":FUNCTION `%string-trim-maybe-prepend-enumber'~% ~
                                                       with arg ENUMBER-DIGIT-CHAR-P non-nil arg ENUMBER did not satisfy `%every-digit-char-p'~% ~
                                                       got: ~S" enumber))
                                          trim))))
        (declare (ignore trim-pretest))
        trim-length-ensured)))

;; (%string-trim-and-prepend-name-suffix "f")
;; (%string-trim-and-prepend-name-suffix "-f")
;; (%string-trim-and-prepend-name-suffix "-fs-")
;; Following fails successfully:
;; (%string-trim-and-prepend-name-suffix "--")
(defun %string-trim-and-prepend-name-suffix (name-suffix)
  (declare ((or string null) name-suffix))
  (if (null name-suffix) 
      nil
      (let* ((trim (string-trim '(#\-) name-suffix))
             (trim-length-ensured (if (zerop (length trim))
                                      (error ":FUNCTION `%string-trim-and-prepend-name-suffix'~% ~
                                              arg NAME-SUFFIX is empty-string after cl:string-trim~% ~
                                              got: ~S" name-suffix)
                                      (concatenate 'string #(#\-) trim))))
        trim-length-ensured)))

;; :NOTE For converting pathnames CL:TRANSLATE-PATHNAME would work except we need
;; to get the pathname-name of the match e.g. "11115" up a few levels to use as
;; a directory name.
;;
;; (translate-pathname "/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/tn/11115.jpg" 
;;                     "**/gallery/*/*/*.jpg" 
;;                     "flash/tn/*.jpg")
;; => #P"/flash/tn/11115.jpg"
;;
;;
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
;; (dbc-item-match-flash-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/flash_home/gallery/books/tn/11115.jpg")
;;                            :enumber "3011"
;;                            :enumber-digit-char-p t
;;                            :enumber-prepending-e nil
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
(defun dbc-item-match-flash-path (target 
                                  &key 
                                  enumber
                                  (enumber-digit-char-p nil)
                                  (enumber-prepending-e nil)
                                  (name-suffix "-f" name-suffix-supplied-p)
                                  (name-suffix-thumb "-fs" name-suffix-thumb-supplied-p)
                                  (name-suffix-categ "-fc" name-suffix-categ-supplied-p)
                                  (destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/"))
  (declare ((or null string) enumber name-suffix name-suffix-thumb name-suffix-categ)
           (boolean enumber-digit-char-p enumber-prepending-e)
           (mon:pathname-or-namestring destination-pathname))
  (let* (;; :NOTE Order is important categ must be first!
         (match-path-categ #P"/**/httpd/flash_home/gallery/categ*/large/*.jpg") 
         (match-path-large #P"/**/httpd/flash_home/gallery/*/large/*.jpg")
         (match-path-thumb #P"/**/httpd/flash_home/gallery/*/tn/*.jpg")
         ;; :NOTE The (or ... T) stuff is to allow the name-suffix-<FOO> args to be NIL e.g.:
         ;; (funcall #'(lambda (&key (x "x" supplied-p)) (list x supplied-p) :x nil)) 
         (match-check (or (and (pathname-match-p target match-path-categ) 
                               (or (if name-suffix-categ-supplied-p
                                       (%string-trim-and-prepend-name-suffix name-suffix-categ) 
                                       name-suffix-categ)
                                   T))
                          (and (pathname-match-p target match-path-large)
                               (or (if name-suffix-supplied-p 
                                       (%string-trim-and-prepend-name-suffix name-suffix)
                                       name-suffix)
                                   T))
                          (and (pathname-match-p target match-path-thumb) 
                               (or (if name-suffix-thumb-supplied-p 
                                       (%string-trim-and-prepend-name-suffix name-suffix-thumb) 
                                       name-suffix-thumb)
                                   T))))
         (name-if (when match-check 
                    (if enumber 
                        (%string-trim-maybe-prepend-enumber enumber 
                                                            :enumber-digit-char-p enumber-digit-char-p
                                                            :enumber-prepending-e enumber-prepending-e)
                        (pathname-name target))))
         (relative-directory-if (when name-if `(:relative ,name-if)))
         (pathname-name-if  (when name-if 
                              (concatenate 'string name-if (etypecase match-check 
                                                             (string match-check) 
                                                             (boolean nil)))))
         (merge-pathnames-if (when name-if
                               (merge-pathnames 
                                (make-pathname :directory relative-directory-if 
                                               :name pathname-name-if 
                                               :type "jpg") 
                                destination-pathname))))
    (values 
     (when merge-pathnames-if merge-pathnames-if)
     target)))

;; (dbc-item-match-image-pathname-pattern 
;;  #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/73.jpg"
;;  #P"/**/photos/big/*.jpg"
;;  :enumber "e1334")
;;
;; (dbc-item-match-image-pathname-pattern 
;;  #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/73.jpg"
;;  #P"/**/photos/big/*.jpg"
;;  :enumber "e1334"
;;  :name-suffix "-b"
;;  :destination-pathname #P"/home/foo/images")
(defun dbc-item-match-image-pathname-pattern (target match-pattern 
                                              &key 
                                              enumber
                                              (enumber-digit-char-p nil)
                                              (enumber-prepending-e nil)
                                              name-suffix
                                              (destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/"))
  (declare ((or null string) enumber name-suffix)
           (mon:pathname-or-namestring match-pattern destination-pathname))
  (let* ((name-if (when (pathname-match-p target match-pattern)
                    (pathname-name target)))
        (relative-directory-if 
         (when name-if 
           (if enumber 
               `(:relative ,name-if
                           (%string-trim-maybe-prepend-enumber enumber 
                                                               :enumber-digit-char-p enumber-digit-char-p
                                                               :enumber-prepending-e enumber-prepending-e))
               `(:relative ,name-if))))
        (pathname-name-if  (when name-if
                             (if name-suffix
                                 (concatenate 'string name-if (%string-trim-and-prepend-name-suffix name-suffix))
                                 name-if)))
         (merge-pathnames-if (when name-if
                              (merge-pathnames 
                               (make-pathname :directory relative-directory-if 
                                              :name pathname-name-if 
                                              :type "jpg") 
                               destination-pathname))))
    (values 
     (when merge-pathnames-if merge-pathnames-if)
     target)))




;; (dbc-item-match-big-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/73.jpg")
;; (dbc-item-match-big-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/photos/big/73.jpg" :enumber "e3040")
;; (defun dbc-item-match-big-path (target &key enumber (name-suffix nil) (destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/"))
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
;; (defun dbc-item-match-small-path (target &key enumber (name-suffix "-s") (destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/"))
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
;; (defun dbc-item-match-zoom-path (target &key enumber (name-suffix "-z" name-suffix-supplied-p) (destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/"))
;;   (declare ((or null string) enumber name-suffix)
;;            (mon:pathname-or-namestring destination-pathname))
;;   (dbc-item-match-image-pathname-pattern 
;;    target
;;    #P"/**/httpd/photos/zoom_size/*.jpg"
;;    :enumber enumber
;;    :name-suffix name-suffix
;;    :destination-pathname destination-pathname))

 ;; (dbc-item-match-header-path #P"/mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/images/backgrounds/headers/3223.jpg" 
 ;;                             :enumber "1377" 
 ;;                             :enumber-digit-char-p t
 ;;                             :enumber-prepending-e t)

(def-dbc-item-match-pathname-pattern 
    dbc-item-match-big-path
    #P"/**/httpd/photos/big/*.jpg" 
    ;; :default-name-suffix "-b"
    :default-destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/")

(def-dbc-item-match-pathname-pattern 
    dbc-item-match-small-path
    #P"/**/httpd/photos/small/*.jpg"
    :default-name-suffix "s"
    :default-destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/")

(def-dbc-item-match-pathname-pattern
    dbc-item-match-zoom-path
    #P"/**/httpd/photos/zoom_size/*.jpg"
    :default-name-suffix "z"
    :default-destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/")

(def-dbc-item-match-pathname-pattern
    dbc-item-match-frame-path
    #P"/**/httpd/photos/frame/*.jpg"
    :default-name-suffix "m"
    :default-destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/")

(def-dbc-item-match-pathname-pattern
    dbc-item-match-header-path
    #P"/**/httpd/images/backgrounds/headers/*.jpg"
    :default-name-suffix "h"
    :default-destination-pathname #P"/mnt/NEF-DRV-A/EBAY/BIG-cropped-jpg/")



;;; ==============================
;;; EOF
