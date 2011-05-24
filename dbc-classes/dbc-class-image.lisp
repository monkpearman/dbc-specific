;;; :FILE-CREATED <Timestamp: #{2011-05-13T16:48:53-04:00Z}#{11195} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-image.lisp
;;; ==============================


(in-package :dbc)
;; *package*

(defclass base-image (base-dbc)
  ()
  (:documentation #.(format nil "Base class for dbc image insances.~%~@")))

#|
;;; ==============================
;;; Following are notes moved in from dbc-classes-notes-*.lisp
;;; ==============================
;;

Following outline is an attempt at categorizing the distinctions which must
be considered w/r/t dbc images and their initial characteristics:

 - Images that already exist
  -- with known properties
  -- with unknown properties
     --- dbc images getting incorporated into the system
     --- images related to an object in the dbc system but not in the system
     ---- images residion on a path in the local file system, e.g. naf images
     ---- images online, e.g. an ebay item 

 - Those that don't exist yet but which soon will and have known properties.
    This will most often happen whenever a new item or entity is created.

 - Those that don't exist yet but which soon will and have some unknown properties.
   - Copying an image
   - repurposing an image to a new format

 ==============================

dbc-image (base-image)

:DBC-IMAGE-SLOTS
image-path-for-instance-type    
  i.e. a relative pathname for an images type: 
   A naf-entity might go in /some/path/naf/<some-naf-instance>/some.jpg
   A category enity might go in /some/path/categs/categ-N/<some-categ-instance>/some-categ.gif

image-path-for-type 
  i.e. <IMAGE-TYPE-PATH>/<SOME-INSTANCE>/ 
  It isn't clear how/whether image-type-path and image-dir relate.

image-type {jpg | png | gif | tiff | bmp | nef } 
  an image file extension. 
  What about svg jpeg. ppm  -- pnm pbm 
  What about pdf? 
  Note make sure that case-sensitivity never becomes and and all extensions are
  verified against a canonical lookup.
  :SEE http://www.martinreddy.net/gfx/2d/BMP.txt

image-size          {:type integer :display [:MB|:KB]}

image-watermark      ;; i.e. image should/not be contextually watermarked. pdf reformatting, big nafs, etc.

image-timestamp     {:type timestamp}

image-uuid          (:type UUID)


;;; ---------------
image-orientation       ;; Base image orientation. 
                        ;; { BOOLEAN [ :horizontal | :vertical ] }
                        ;; IMAGE-ORIENTATION-WHOLE and IMAGE-ORIENTATION-DEPICTED should inherit from this.
                        ;; IMAGE-DIMENSION-X & IMAGE-DIMENSION-Y should be corroborated/inferred/asserted on IMAGE-ORIENTATION, e.g. if orientation is :HORIZONTAL then the value of IMAGE-DIMENSION-X should be >= greater-or-=

image-orientation-whole
;; This is the orientation of the imaged thing as a whole, e.g. as represented
;; in its entirety and is distinct from IMAGE-ORIENTATION-DEPICTED b/c many
;; items will contain both horizontally and vertically oriented "sub-images",
;; for example maps and atlases often have detailed blow-ups in an alternative
;; orientation or may present multiple geographic regions on a single leaf. When
;; these images are presented/displayed it is important to be able to
;; distinguish whether the orientation of the image is distinct from the
;; orientation of the surrounding context.

image-orientation-depicted
                     ;; { BOOLEAN [ :horizontal | :vertical ] } 

image-dimension-x   {:type postive-integer}
                   ;; The images x axis 

image-dimension-y   {:type postive-integer}
                   ;; The images y axis 

:NOTE following are mixins:
     image-thumb  (dbc-image)
     image-big    (dbc-image)
     image-header (dbc-image)
     image-flash  (dbc-image)
     image-zoom   (dbc-image)
     image-frame  (dbc-image)
     image-gif    (dbc-image)
     image-ico    (dbc-image)
     image-exif   (dbc-image) 
        :NOTE Can inherit or used this to deterime slot values above. 
        :NOTE Also, that exif date/time stamps are mutable whereas a image-timestamp isn't
     image-xmp   (dbc-image)
       Like image-exif -- Adobe's "Extensible Metadata Platform"


image-xref (dbc-image)
 image-xrefs      ;; Table of instances/uuids which image might xref to.  :NOTE the semantics of xrefing are still not clear
                  ;; :SEE The  "print_default_pic" :TRANSFORM "image-default-xref" in dbc-class-artist-convert.lisp
 image-xrefed-by  ;; Table of instances/uuids which xref image.
 

image-site (dbc-image)
 gif-site   (image-gif)
 ico-site   (image-ico)
 thumb-site (image-thumb)

image-item  (dbc-image)
           thumb-item  (image-thumb)
           big-item    (image-big)
           zoom-item   (image-zoom)
           header-item (image-header)
           flash-item  (image-flash)
           frame-item  (image-frame)
           xref-item   (image-xref)

image-naf-entity  (dbc-image)
       thumb-naf  (image-thumb) 
       big-naf    (image-big)
       header-naf (image-header) ;; :NOTE This is new.

image-doc (dbc-image)
           thumb-doc  (image-thumb)     ;; Documentation entities can have their own images.
           big-doc    (image-big)       ;; Documentation entities can have their own images.
           header-doc (image-header)    ;; lookup xrefing around image-xref table
           flash-doc  (image-flash)     ;; lookup xrefing around image-xref table

image-category-entity
            thumb-category (image-thumb)   ;; lookup xrefing around an image-xref table
            header-category (image-header) ;; lookup xrefing around an image-xref table
            flash-category (image-flash)   ;; lookup xrefing around an image-xref table

image-theme-entity
           thumb-theme  (image-thumb)  ;; lookup xrefing around an image-xref table
           header-theme (image-header) ;; lookup xrefing around an image-xref table
           flash-theme  (image-flash)  ;; lookup xrefing around an image-xref table


;;; ==============================
;;; :METHODS-TO-IMPLEMENT

;; :IMAGES

;; path related stuff will likely pivot on both the value of image-type image-type-path
;; image-path 
;; (setf image-path)
;; image-verify-path 

;; image-resize {image-thumb image-big image-header image-flash image-zoom image-frame}
;;  `-> image-grow
;;  `-> image-shrink

;; image-rotate
;; image-verify-rotation

;; image-watermark
;; 

;; image-metadata ;; exif metadata getter
;; (setf image-metadata) ;; exif metadata setter
;;  `-> image-metadata-remove ;; exif metadata removal

;; image-convert (from-type to-type)
;; image-verify-convert ;; is image of type FROM-TYPE and can be converted to TO-TYPE

;; (pathname-type "name.jpg")
;; (pathname-type "name.jpg")
;; (pathname-name "name.jpg")
;; (pathname-directory "name.jpg")
;; (pathnamep (namestring #P"name.jpg")

|#

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
