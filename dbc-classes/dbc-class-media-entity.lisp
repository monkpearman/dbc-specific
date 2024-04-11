;;; :FILE-CREATED <Timestamp: #{2011-10-04T14:37:50-04:00Z}#{11402} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-media-entity.lisp
;;; ==============================
;;
;; base-entity               (base-dbc)
;; - base-media-entity       (base-entity)
;; -- media-entity-technique (base-media-entity)
;; -- media-entity-material  (base-media-entity)
;; --- media-entity-paper    (media-entity-material)
;; -- media-entity-mount     (base-media-entity)
;; -- media-entity-color     (base-media-entity)

;; --- control-id-media-entity-type              (control-id-entity-type)
;; ---- control-id-media-entity                  (control-id-media-entity-type) 
;; ----- control-id-media-entity-display-name    (control-id-media-entity control-id-display-name-for-entity-type)
;; ------ control-id-display-technique           (control-id-media-entity-display-name)
;; ------ control-id-display-mount               (control-id-media-entity-display-name)
;; ------ control-id-display-material            (control-id-media-entity-display-name)
;; ------- control-id-display-paper              (control-id-media-material)
;; ****** control-id-display-color               (control-id-media-entity-display-name) ;; inactive

;; *control-id-display-technique-namespace*
;; *control-id-display-material-namespace*
;; *control-id-display-paper-namespace*
;; *control-id-display-mount-namespace*
;; *control-id-display-color-namespace*
;;
;;; ==============================


(in-package #:dbc)

(defclass media-entity-technique (base-media-entity)
  ()
  (:documentation
   #.(format nil
             "Instances of this class used to describe techniques used in the production of a
particular type of media.~%~@
Possible (generalized) examples of a technique include:~% ~
 engraving, lithograph, photography, offset, etc.~%~@
:SEE-ALSO `description-media-entity-technique-note', `base-media-entity',~%~
`media-entity-technique', `media-entity-material', `media-entity-mount',~%~
`media-entity-color'.~%▶▶▶")))

(defclass media-entity-material (base-media-entity)
  ()
  (:documentation
   #.(format nil
"Instances of this class used to describe materials used in the production of a particular type of media.~%~@
Slot values might be used to indicate the type of material \(i.e. paper, fabric,
plastic, etc.\) as well as various aspects of its composition, e.g. whether it
is glazed, cold-rolled, 10mil, etc.~%~@
:SEE-ALSO `description-media-entity-material-note', `base-media-entity',~%~
`media-entity-technique', `media-entity-paper', `media-entity-mount',~%~
`media-entity-color'.~%▶▶▶")))

(defclass media-entity-paper (media-entity-material)
  ()
  (:documentation
   #.(format nil
             "Instances of this class used to describe materials generally construed as being of the type \"paper\".
:SEE-ALSO `description-media-entity-material-note', `base-media-entity',~%~
`media-entity-technique', `media-entity-material', `media-entity-mount',~%~
`media-entity-color'.~%▶▶▶")))

;; ("paper"             . media-entity-paper) ; media-entity-material

(defclass media-entity-mount (base-media-entity)
  ()
  (:documentation
   #.(format nil
             "Instances of this class used to describe the mounting used in with a particular type of media.~%~@
              Slot values might be used to indicate the type of mount and its state,~%~
              i.e. whether the media is linen backed, dry mounted, framed, etc.~%~
              :SEE-ALSO `description-media-entity-mount-note' `base-media-entity',~%~
              `media-entity-technique', `media-entity-material', `media-entity-mount',~%~
              `media-entity-color'.~%▶▶▶")))

(defclass media-entity-color (base-media-entity)
  ()
  (:documentation
   #.(format nil
             "Instances of this class used to describe aspects of the color of a particular type of media.~%~@
              Example uses include:~%~% ~
              - slots indicating whether a color is represented by an HSV, RGB, or CMYK value;~% ~
              - slot indicating a cannonical or standardized display name of a particular color value;~% ~
              - slot indicating corefs to a cannonical or standardized display name of a particular color value;~% ~
              - slot indicating whether color has a generalized parent category, e.g. ruby-red is subsumed by red;~%~
             :SEE-ALSO `description-media-entity-color-note', `base-media-entity',~%~
             `media-entity-technique', `media-entity-material', `media-entity-mount',~%~
             `media-entity-color'.~%▶▶▶")))



;;; ==============================

;; (while (search-forward-regexp "^\\([[:blank:]]+<c[0-5]\\)" nil t)
;;   (replace-match "\n\\&" ))


#|
:NOTE following from dbc-specific/notes-versioned/dbc-xml-categs-as-lisp/xml-files/doc.xml

relief
- woodblock
- wood-engraving
- linocut
- mezzotint
intaglio
- line-engraving-metal
-- copper-engvaving
-- steel-engraving
- etching
-- etching-mechanical
--- dry-point
--- stipple-crayon manner
-- etching-chemical
--- aquatint
--- hard-ground-etching
--- soft-ground-etching
- photo-mechanical
-- halftone-gravure
-- halftone-photo-relief
-- line-block
-- chromotypograph
- planographic-and-process
-- lithography
--- offset
--- zincograph
--- stone lithograph
--- collotype
-- silkscreen-serigraph
-- pochoir


  <c1 name="Printing Techniques">
    <c2 name="Glossary of Printing and Printmaking Terminology"/>
    <c2 name="Relief Techniques">
      <c3>Woodblock</c3>
      <c3>Wood Engraving</c3>
      <c3>Linocut</c3>
      <c3>Mezzotint</c3>
    </c2>

    <c2 name="Intaglio Techniques">
      <c3 name="Line Engraving - Metal">
        <c4>Copper Engraving</c4>
        <c4>Steel Engraving</c4></c3>
      <c3 name="Etching">
        <c4 name="Etching - Mechanical">
          <c5>Dry Point</c5>
          <c5>Stipple - Crayon Manner</c5>
        </c4>
        <c4 name="Etching - Chemical">
          <c5>Aquatint</c5>
          <c5>Etching - Hard Ground</c5>
          <c5>Etching - Soft Ground</c5>
        </c4>
      </c3>
    </c2>

    <c2 name="Photomechanical Techniques">
      <c3>Halftone gravure</c3>
      <c3>Relief Halftone</c3>
      <c3>Line Block</c3>
      <c3>Chromotypograph</c3>
    </c2>

    <c2 name ="Planographic and Process Techniques">

      <c3 name="Lithography">
        <c4>Offset</c4>
        <c4>Zincograph</c4>
        <c4>Stone Lithograph</c4>
        <c4>Collotype</c4>
      </c3>

      <c3 name="Silkscreen - Serigraph"></c3>
      <c3 name="Pochoir"></c3>
    </c2>
  </c1>


antique-handmade
- antique-laid
- antique-wove

machine-made
- machine-made-laid
- machine-made-wove
- magazine-slick-offset-cartridge
- magazine-coverstock-glazed
-- machine-age-wood-pulp
--- machine-age-wood-pulp-plate-pressed
--- machine-age-wood-pulp-newsprint-ground-wood
--- machine-age-wood-pulp-board-cardstock

contemporary-handmade
- handmade-laid
- handmade-wove

branded-and-fine-art
- arches
- crane-and-co
- fabriano
- fox-river-rising
- gmund
- hahnemuhle
- j-b-green
- johannot
- lana
- magnani
- mohawk
- rives
- ruscombe-mill
- st-cuthberts-mill-somerset ;; :NOTE realistiaclly Somerset is a subclass of St. Cuthberts Mill
- strathmore
- tassotti
- van-gelder
- weston
- whatman
- zanders
- zerkall

specialty
- blotter
- india-paper ;; (Onion Skin)
- parchment-paper
- japanese-paper
-- Mulberry
-- Kozo
-- Gampi
-- Mitsumata
- tracing-paper
- marbled-paper
- vellum
- parchment

  <c1 name="Paper Types and Terminology">
    <c2>Glossary of Paper and Papermaking Terminology</c2>

    <c2 name="Antique Paper - Handmade">
      <c3>Antique Laid Paper</c3>
      <c3>Antique Wove Paper</c3>
    </c2>

  <c2 name="Machine Made Paper">
      <c3>Laid Paper - Machine Made</c3>
      <c3>Wove Paper - Machine Made</c3>
      <c3>Magazine Slick - Offset Cartridge</c3>
      <c3>Magazine Coverstock - Glazed</c3>
      <c3 name="Machine Age - Wood Pulp">
      <c4>Machine Age - Plate Pressed - wood pulp</c4></c3>
      <c3>Newsprint - ground wood pulp</c3>
      <c3>Board - Cardstock</c3>
    </c2>


  <c2 name="Contemporary Handmade Papers">
      <c3>Handmade Wove Paper</c3>
      <c3>Handmade Laid Paper</c3>
    </c2>
    <c2 name="Branded and Fine Art Papers">
      <c3>Arches</c3>
      <c3>Crane and Co.</c3>
      <c3>Fabriano</c3>
      <c3>Fox River - Rising</c3>
      <c3>Gmund</c3>
      <c3>Hahnemuhle</c3>
      <c3>J. B. Green</c3>
      <c3>Johannot</c3>
      <c3>Lana</c3>
      <c3>Magnani</c3>
      <c3>Mohawk</c3>
      <c3>Rives</c3>
      <c3>Ruscombe Mill</c3>
      <c3>St. Cuthberts Mill - Somerset</c3>
      <c3>Strathmore</c3>
      <c3>Tassotti</c3>
      <c3>Van Gelder</c3>
      <c3>Weston</c3>
      <c3>Whatman</c3>
      <c3>Zanders</c3>
      <c3>Zerkall</c3>
    </c2>
    <c2 name="Specialty Papers">
      <c3>Blotter</c3>
      <c3>India Paper - Onion Skin</c3>
      <c3>Parchment Paper</c3>
      <c3>Japanese Paper - Mulberry Kozo Gampi Mitsumata</c3>
      <c3>Vellum</c3>
      <c3>Tracing Paper</c3>
      <c3>Parchment</c3>
    </c2>
  </c1>

|#




;;; ==============================

;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
