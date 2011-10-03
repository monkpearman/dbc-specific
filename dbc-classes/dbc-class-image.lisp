;;; :FILE-CREATED <Timestamp: #{2011-05-13T16:48:53-04:00Z}#{11195} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-image.lisp
;;; ==============================


;;; ==============================
;; :SOURCE #lisp slyrux regarding opticl :DATE 2011-06-22T21:00:20-04:00Z 
;; (defun make-thumbnail-image (file image &key (y 128) (x 128) (pad t)) 
;;   (write-image-file file (fit-image-into image y x :pad pad)))
;; :EXAMPLE
;; (make-thumbnail-image 
;;  "/tmp/seahorse-thumb.png"
;;  (read-jpeg-stream 
;;   (drakma:http-request "http://photos.cyrusharmon.org/img/s8/v12/p497325516-6.jpg" 
;;                        :want-stream t 
;;                        :force-binary t)))
;;; ==============================                                         

;; (defparameter dbc-image-
;;; ==============================
;;; :NOTE
;;; There should be a UUID for image-directory namespaces.
;;; Every image directory in LV-NEF-DRIVE-B should have a dedicated namespace.
;;; Every image in each of these directories should get an embedded
;;; exif/xmp/IPTC v5-UUID with the directory as its source namespace.
;;; :SEE `*uuid-namespace-control-id-image-directory*' in 
;;; :FILE dbc-specific/uuids-loadtime-bind.lisp
;;; ==============================

(in-package :dbc)
;; *package*

(defclass base-image (base-dbc)
  ()
  (:documentation #.(format nil "Base class for dbc image insances.~%")))


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
  An image file extension, i.e. a CL:PATHNAME-TYPE.
  What about svg jpeg. ppm  -- pnm pbm 
  What about pdf? 
  Note make sure that case-sensitivity never becomes and and all extensions are
  verified against a canonical lookup.
  :SEE http://www.martinreddy.net/gfx/2d/BMP.txt
  Note see dublin core format 

image-size          {:type integer :display [:MB|:KB]}

image-watermark      ;; i.e. image should/not be contextually watermarked. pdf reformatting, big nafs, etc.

image-timestamp     {:type timestamp}
                     ;; cl:file-write-date

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

;; image-rotate  ;; :SEE image-rotate.lisp in mon-systems
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
;;; :NOTE common-lisp library zpb-exif.

;;; ==============================
;;  No, don't use Cl-fuse/QueryFS, use metafs instead (its quicklisp installable and actually works!)
;;  http://wcp.sdf-eu.org/software/metafs-20110308.src.tbz
;;  :NOTE using metafs with inotify could trigger updating the medatada should it ever change on disk.
;;
;;; ==============================
;; 
;; :NOTE CL-FUSE and QueryFS might present a good bridge for implementing a filesystem indexer for sidecar metadata like .xmp and .mie
;; :SEE (URL `http://mtn-host.prjek.net/projects/cl-fuse/files/query-fs.pdf')
;; :SEE (URL `http://sourceforge.net/apps/mediawiki/fuse/index.php?title=FileSystems') 
;;
;; :NAME CL-FUSE
;; :AUTHOR Michael Raskin
;; :HOMEPAGE http://mtn-host.prjek.net/projects/cl-fuse/ 
;; :DESCRIPTION
;;
;; ,----
;; | A multi-layer bindings to FUSE for Common Lisp. At the first level, just the
;; | API is wrapped in CFFI. Next, you get a Lisp main loop (so Lisp runtime
;; | doesn't have problems with C-started threads) with more lispy interface for
;; | callbacks. Next level allows you to define layout of the FS in Lisp via
;; | usual s-expression syntax.  Thanks to Paulo Mineiro for readability and
;; | clarity of the main FUSE loop in fuseerl project.
;; `----
;;
;; :SEE (URL `http://mtn-host.prjek.net/viewmtn/cl-fuse/')
;; :SEE :DIRECTORY CL-SYSTEMS/cl-fuse
;;
;; :SEE-ALSO
;; (URL `http://www.libferris.com/')
;; (URL `http://rffr.de/nhfs')
;;; ==============================

#|

;;; ==============================
;; metdadata specifications:
;; :SEE (URL `http://www.adobe.com/devnet/xmp.html')
;; :SEE (URL `http://www.iptc.org/std/Iptc4xmpCore/1.0/specification/Iptc4xmpCore_1.0-spec-XMPSchema_8.pdf')
;; :SEE (URL `http://www.iptc.org/std/photometadata/2008/specification/IPTC-PhotoMetadata-2008_2.pdf')
;; :SEE (URL `http://www.exif.org/Exif2-2.PDF')
;; 
;; metadata namespaces:
;; :SEE (URL `http://www.digikam.org/ns/kipi/1.0/')
;; :SEE (URL `http://ns.microsoft.com/photo/1.0/')
;; :SEE (URL `http://ns.iview-multimedia.com/mediapro/1.0/')
;; :SEE (URL `http://ns.microsoft.com/expressionmedia/1.0/')
;; :SEE (URL `http://ns.useplus.org/go.ashx')
;; 
;;; (defclass dbc-image-class-metadata-corefs (base-image)
;;   ((class-object-metadata-source 
;;    :documentation "The class object with corefs. This is a class object describing a metadata scheme.")
;;    (class-slots-coref
;;    :documentation "A list of class slot identifiers which are known to have corefs in some other metadata schema.
;;                    For example, the IPTC extension schema at namespace:
;;                     http://iptc.org/std/Iptc4xmpExt/2008-02-29/ 
;;                    and the Dublin Core namespace at:
;;                     http://purl.org/dc/elements/1.1/
;;                    Share similiar fields copyright/IP Fields, e.g.IPTC "Copyright Notice" and DC "Rights"
;;                       ")
;;    
;; dbc-image-metadata-dublin-core
;; dbc-image-metadata-exif
;; dbc-image-metadata-xmp
;; 

;;; ==============================

;; Each slot is a Common-Lispified version of of exiv2's translation of Dublin Core schema.
;; The Dublin Core schema provides a set of commonly used XMP properties.
;;  Exiv2 keys are Xmp.dc.<Property>
;;  The schema namespace URI is http://purl.org/dc/elements/1.1/
;;  The preferred schema namespace prefix is dc
;;
;; :SEE (URL `http://www.exiv2.org/tags-xmp-dc.html')
;;
;; exiv2 enumerated the following table columns:
;; Property, Label, Value type,  Exiv2 type, Category, Description
;; We translated this table to CLOS slots each of which have the the following form:
;; 
;;  ( ;; Label, Value, c-type, Exiv2-type, Category,  Description
;;   <PROPERTY>   
;;   ;; :type <CL-TYPE>
;;   <DESCRIPTION> "CL-documentation")
;; In the above form 
;; - The initial commented comma separated list enumerates the original (unused)
;;   values from the exiv2 table
;; - <PROPERTY> => slot-name
;; - The commented :type form inidicates a CL type we initially expect to
;;   implement - we assume this may change as details emerge.
;; - <DESCRIPTION> => :documentation 
;;
;; (defclass dbc-image-metadata-dublin-core (base-image)
(
 ( ;; Contributor, bag ProperName, XmpBag, External
  dc-contributor
  ;; :type 'string
  :documentation 
  "A string identifying contributors to the resource (other than the authors).")

 ( ;; Coverage, Text, XmpText, External
  dc-coverage
  ;; :type 'string
  :documentation 
  "A string identifying the spatial or temporal topic of the resource, the spatial
applicability of the resource, or the jurisdiction under which the resource is
relevant.")

 ( ;; Creator, seq, ProperName, XmpSeq, External
  dc-creator
  ;; :type 'list | sequence
  :documentation 
  "A list of zero or more strings each identifying the authors of the resource
\(listed in order of precedence, if significant\).")

 ( ;; Date, seq, Date, XmpSeq, External
  dc-date
  ;; :type ??? 
  :documentation 
  "A sequence of date identifiers.
Date(s) that something interesting happened to the resource.")

 ( ;; Description, Lang Alt, LangAlt, External
  dc-description
  ;; :type 'string
  :documentation 
  "A list of zero or more strings describing the content of the resource. 
Multiple values may be present for different languages.")

 ( ;; Format, MIMEType, XmpText, Internal
  dc-format
  ;; :type pathname-type
  :documentation 
  "A CL:PATHNAME-TYPE indicating the file format used when saving the resource.
The type should correpsond to a known mime-type.
Tools and applications should set this property to the save format of the data. 
It may include appropriate qualifiers.")

 ( ;; Identifier, Text, XmpText, External
  dc-identifier
  ;; :type 'unique-universal-identifier
  :documentation 
  "Unique identifier of the resource.
Recommended best practice is to identify the resource by means of a string
conforming to a formal identification system.")

 ( ;; Language, bag Locale, XmpBag, Internal
  language
  ;; :type
  :documentation 
  "An unordered array specifying the languages used in the resource.")

 ( ;; Publisher, bag ProperName, XmpBag, External
  publisher
  ;; :type
  :documentation 
  "An entity responsible for making the resource available. 
Examples of a Publisher include: 
 - a person; 
 - an organization; 
 - a service. 
Typically, the name of a Publisher should be used to indicate the entity.")

 ( ;; Relation, bag Text, XmpBag, Internal
  dc-relation
  ;; :type
  :documentation 
  "Relationships to other documents.
Recommended best practice is to identify the related resource by means of a
string conforming to a formal identification system.")

 ( ;; Rights, Lang Alt, LangAlt, External
  ;; :type
  dc-rights
  :documentation 
  "Informal rights statement, selected by language. 
Typically, rights information includes a statement about various property rights
associated with the resource, including intellectual property rights.")

 ( ;; Source, Text, XmpText, External
  dc-source
  ;; :type
  :documentation 
  "Unique identifier of the work from which this resource was derived.")

 ( ;; Subject, bag Text, XmpBag, External
  dc-subject
  ;; :type
  :documentation 
  "An unordered set of descriptive phrases or keywords that specify the topic of the content of the resource.")

 ( ;; Title, Lang Alt, LangAlt,  External
  dc-title
  ;; :type
  :documentation 
  "The title of the document, or the name given to the resource. 
Typically, it will be a name by which the resource is formally known.")

 ( ;; Type, bag open, Choice XmpBag, External
  dc-type
  ;; :type 
  :documentation "A document type; for example, novel, poem, or working paper.")

 )

;;; ==============================
;;; Dublin Core schema from exiv2
;;; :SOURCE (URL `http://www.exiv2.org/tags-xmp-dc.html')
;;; :NOTE For better formatting descriptions section was moved out of band

 Property     |  Label    | Value type     | Exiv2 type | Category
 ------------------------------------------------------------------
 CONTRIBUTOR   Contributor  bag ProperName   XmpBag       External     
 COVERAGE      Coverage     Text             XmpText      External        
 CREATOR       Creator      seq ProperName   XmpSeq       External
 DATE          Date         seq Date         XmpSeq       External
 DESCRIPTION   Description  Lang Alt         LangAlt      External
 FORMAT        Format       MIMEType         XmpText      Internal
 IDENTIFIER    Identifier   Text             XmpText      External
 LANGUAGE      Language     bag Locale       XmpBag       Internal
 PUBLISHER     Publisher    bag ProperName   XmpBag       External
 RELATION      Relation     bag Text         XmpBag       Internal
 RIGHTS        Rights       Lang Alt         LangAlt      External
 SOURCE        Source       Text             XmpText      External
 SUBJECT       Subject      bag Text         XmpBag       External
 TITLE         Title        Lang Alt         LangAlt      External
 TYPE          Type         bag open Choice  XmpBag       External

 -----------------------------------------------------------------

 CONTRIBUTOR   
 Contributors to the resource (other than the authors). 

 COVERAGE
 The spatial or temporal topic of the resource, the spatial applicability of the
 resource, or the jurisdiction under which the resource is relevant.

 CREATOR
 The authors of the resource (listed in order of precedence, if significant).

 DATE
 Date(s) that something interesting happened to the resource.

 DESCRIPTION
 A textual description of the content of the resource. Multiple values may be
 present for different languages.

 FORMAT
 The file format used when saving the resource. Tools and applications should set
 this property to the save format of the data. It may include appropriate
 qualifiers.

 IDENTIFIER
 Unique identifier of the resource. Recommended best practice is to identify the
 resource by means of a string conforming to a formal identification system.

 LANGUAGE
 An unordered array specifying the languages used in the resource.

 PUBLISHER
 An entity responsible for making the resource available. Examples of a Publisher
 include a person, an organization, or a service. Typically, the name of a
 Publisher should be used to indicate the entity.

 RELATION
 Relationships to other documents. Recommended best practice is to identify the
 related resource by means of a string conforming to a formal identification
 system.

 RIGHTS
 Informal rights statement, selected by language. Typically, rights information
 includes a statement about various property rights associated with the resource,
 including intellectual property rights.

 SOURCE
 Unique identifier of the work from which this resource was derived.

 SUBJECT
 An unordered array of descriptive phrases or keywords that specify the topic of
 the content of the resource.

 TITLE
 The title of the document, or the name given to the resource. Typically, it will
 be a name by which the resource is formally known.

 TYPE
 A document type; for example, novel, poem, or working paper.
 
|#



;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
