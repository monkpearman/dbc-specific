;;; :FILE-CREATED <Timestamp: #{2011-09-26T19:45:57-04:00Z}#{11391} - by MON>
;;; :FILE dbc-specific/dbc-parse/dbc-xml-parse-sax.lisp
;;; ==============================

;; :NOTE Everything in this file works as of 2011-09-26
;; :TODO 
;;  - factor out for better symbol/variable names.
;;  - incorporate field parsing routines from:
;;    - dbc-classes/dbc-class-parse-convert.lisp
;;    - dbc-classes/dbc-class-refs-convert.lisp

(in-package #:dbc)

(defparameter *ref-current-row* '()
  "Holds an instance of class `dbc-sax-parsing-class' while parsing an XML row field.")

(defparameter *refs-output-source* 
  (merge-pathnames (make-pathname :directory `(:relative ,*xml-output-dir*)
                                  :name (concatenate 'string "sax-test-" (mon:time-string-yyyy-mm-dd))
                                  :type "lisp")
                   (system-base-path *system-path*)))

(defparameter *parsed-data-output-stream* nil
  "Output stream current while parsing the XML data of *refs-output-source*
Opend on entry to `tt--parse-xml-refs' and closed on exit.")

;; After we finish parsing an XML <row> element the FIELD-DATA slot will hold all fields parsed.
;; While parsing individual XML <field> elements we pushe them onto the slot CURRENT-ELT. 
;; When we are finished with the field we push the slot-value onto the FIELD-DATA stack.
(defclass dbc-sax-parsing-class ()
  ((field-data
    ;; :initform '() ;; 
    :initform (make-array 36 :fill-pointer 0)
    :accessor field-data)
   (current-elt 
    :initform '()
    :accessor current-elt)))


;; Stub class to specialize sax methods on. 
;; We could probably use `dbc-sax-parsing-class' just as well.
(defclass dbc-sax-handler (sax:default-handler)
  ;; ((field-and-names 
  ;;  :initform '()
  ;;  :accessor field-and-names))
  ())

(defmethod sax:start-element ((handler dbc-sax-handler)
                              uri local-name qname attributes)
  (when (string-equal local-name "row")
    (setf *ref-current-row* (make-instance 'dbc-sax-parsing-class))
    (return-from sax:start-element))
  (flet ((collect (elt attrib)
           (when (string-equal elt local-name)
             (let ((attrib
                    (find attrib attributes
                          :key #'sax:attribute-local-name
                          :test #'string-equal)))
               (if attrib 
                   (setf (current-elt *ref-current-row*) (sax:attribute-value attrib))
                   (setf (current-elt *ref-current-row*) nil))))))
    ;;       <ELT> <ATTRIB>
    ;; <a href= | img src=
    (collect  "field"   "name")))

(defmethod sax:characters  ((handler dbc-sax-handler) data)
  (when (and *ref-current-row* 
             (current-elt *ref-current-row*))
    (vector-push-extend (list (current-elt *ref-current-row*)
                              data)
                        (field-data *ref-current-row*))
    (setf (current-elt *ref-current-row*) nil)))

;; (sax:end-element HANDLER NAMESPACE-URI LOCAL-NAME QNAME)
(defmethod sax:end-element  ((handler dbc-sax-handler)
                             uri local-name qname)
  (when (and *ref-current-row* 
             (current-elt *ref-current-row*))
    (vector-push-extend (list (current-elt *ref-current-row*))
                        (field-data *ref-current-row*))
    (setf (current-elt *ref-current-row*) nil))
  (when (string-equal local-name "row")
    ;; (print (field-data *ref-current-row*))
    (write-sax-parsed-row-to-file :output-stream *parsed-data-output-stream*)
    (setf (current-elt *ref-current-row*) nil)))

(defmethod sax:end-document  ((handler dbc-sax-handler))
  (when *ref-current-row*
    (setf *ref-current-row* nil)))

;; Write a commented delimiter line to OUTPUT-STREAM. 
(defun write-sax-parsed-delimiter (&key output-stream)
  (let ((delim (make-string 68 :initial-element #\;)))
    (format output-stream "~&~%~A~%" delim)))

;; Write all rows of slot-value FIELD-DATA for current instance of class `dbc-sax-parsing-class' to OUTPUT-STREAM.
;; Current instance is held by varialbe `*ref-current-row*'.
(defun write-sax-parsed-row-to-file (&key output-stream)
  (write-sax-parsed-delimiter :output-stream output-stream)
  ;;(write-char #\( output-stream)
  ;; (loop 
  ;;    for field across (field-data *ref-current-row*)
  ;;    do  (write-sequence field output-stream))
  ;;(write-char #\( output-stream))
  (write (coerce (field-data *ref-current-row*) 'list) :stream output-stream))

;; Parse the dbc XML refs in INPUT-FILE and write thier lispy counterparts to OUTPUT-FILE.
;; For duration of body the variable `*parsed-data-output-stream*' is bound to an open output-stream.
;; INPUT-FILE defaults to `*xml-input-refs-name*'
;; OUTPUT-FILE defaults to `*refs-output-source*'
;; :EXAMPLE
;;  (write-sax-parsed-xml-refs-file)
(defun write-sax-parsed-xml-refs-file (&key (input-file *xml-input-refs-name*) (output-file *refs-output-source*))
  (unwind-protect
       (progn
         (setf *parsed-data-output-stream* (open output-file
                                                 :direction :output
                                                 :element-type 'character
                                                 :external-format :utf-8
                                                 :if-exists :supersede
                                                 :if-does-not-exist :create))
         ;;(klacks:with-open-source (refs-in input-file)
         (cxml:parse input-file (make-instance 'dbc-sax-handler))) ;)
    (close *parsed-data-output-stream*)))

;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
