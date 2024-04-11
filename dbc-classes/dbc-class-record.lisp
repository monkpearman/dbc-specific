;;; :FILE-CREATED <Timestamp: #{2011-10-12T18:37:26-04:00Z}#{11413} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-record.lisp
;;; ==============================

;; The inverse corollary to Clarke's Third Law:
;; "Any technology distinguishable from magic is insufficiently advanced."
;;
;;
;; base-record (base-dbc)
;; base-inventory-record        (base-record)
;; base-authority-record        (base-record)
;; base-documentation-record    (base-record)
;; documentation-record-sitedoc (base-documentation-record)
;;
;;; ==============================


(in-package #:dbc)

(defclass base-record (base-dbc)
  ()
  (:documentation
   #.(format nil "Base class for referencing DBC system records.~%~@
A \"record\" is an abstract object represented within the context of DBC system.~%~@
An object is abstract if the thing it identifies does not have an identity
commonly recognized outside the context of that identification.
I.e we define the class `base-inventory-record'. Its instances encapsulate
aspects of an inventory item. It is unlikely that outside the context of the DBC
system the thing identified by an instance of `base-inventory-record' has a
commonly recognized identity.~%~@
The inverse corollary to the class `base-record' is the class `base-entity'.~%~@
:EXAMPLE~%~% ~
 \(mon:class-subclasses \(find-class 'base-entity\)\)~%~@
:SEE-ALSO `<XREF>'.~%▶▶▶")))


;;; ==============================

;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; package: dbc
;; End:

;;; ==============================
;;; EOF
