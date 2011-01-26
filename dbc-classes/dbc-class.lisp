;;-*- Mode: LISP; Syntax: COMMON-LISP; Encoding: utf-8; Base: 10 -*-
;;; :FILE-CREATED <Timestamp: #{2011-01-01T14:10:05-05:00Z}#{11526} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/dbc-class.lisp
;;; ==============================


(in-package #:dbc)
;; *package*

(defclass dbc-xml->clos-dump ()
  (())
  (:documentation "Base class for DBC to XML dump files directories.
Subclasses inherit their base pathname from this guy.
:SEE-ALSO `dbc:*dbc-xml-dump-dir*', `*dbc-xml-dump-dir-name*'
`dbc:ensure-dbc-xml-dump-dir-exists'.►►►"))


;;; ==============================
;;; EOF
