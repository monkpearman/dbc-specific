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

(defparameter *refs-output-source* nil)

;; *xml-input-refs-name*

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
    :accessor current-elt)
   (current-chars
    :initform (make-string-output-stream))
   ))

(defgeneric dbc-sax-current-chars-clear (object)
  ;; (find-method #'dbc-sax-current-chars-clear nil '(dbc-sax-parsing-class))
  (:method ((self dbc-sax-parsing-class))
    (setf (slot-value self 'current-chars) nil)))

(defgeneric dbc-sax-current-chars-reset (object)
  ;; (find-method #'dbc-sax-current-chars-reset nil '(dbc-sax-parsing-class))
  (:method ((self dbc-sax-parsing-class))
    (dbc-sax-current-chars-clear self)
    (setf (slot-value self 'current-chars)
          (make-string-output-stream))))

(defgeneric dbc-sax-current-chars (object)
  ;; (find-method #'dbc-sax-current-chars nil '(dbc-sax-parsing-class))
  ;; (find-method #'dbc-sax-current-chars '(:after) '(dbc-sax-parsing-class))
  (:method ((self dbc-sax-parsing-class))
    (get-output-stream-string (slot-value self 'current-chars)))
  (:method :after ((self dbc-sax-parsing-class))
           (dbc-sax-current-chars-clear self)))

(defgeneric (setf dbc-sax-current-chars) (data object)
  ;; (find-method #'(setf dbc-sax-current-chars) '(:before) '(t dbc-sax-parsing-class))
  ;; (find-method #'(setf dbc-sax-current-chars) nil '(t dbc-sax-parsing-class))
  (:method :before (data (self dbc-sax-parsing-class))
           (let ((cc (slot-value self 'current-chars)))
             (unless (and (streamp cc)
                          (output-stream-p cc))
               (dbc-sax-current-chars-reset self))))
  (:method (data (self dbc-sax-parsing-class))
    (write-string data (slot-value self 'current-chars))
    data))




;; Stub class to specialize sax methods on. 
;; We could probably use `dbc-sax-parsing-class' just as well.
(defclass dbc-sax-handler (sax:default-handler)
  ;; ((field-and-names 
  ;;  :initform '()
  ;;  :accessor field-and-names))
  ())

;; (defmethod sax:start-document  ((handler dbc-sax-handler))
;;   (when *ref-current-row*
;;     (setf *ref-current-row* nil)))
;;
;; (defmethod sax:start-element ((handler dbc-sax-handler)
;;                               uri local-name qname attributes)
;;   (when (string-equal local-name "row")
;;     (setf *ref-current-row* (make-instance 'dbc-sax-parsing-class))
;;     (return-from sax:start-element))
;;   (flet ((collect (elt attrib)
;;            (when (string-equal elt local-name)
;;              (let ((attrib
;;                     (find attrib attributes
;;                           :key #'sax:attribute-local-name
;;                           :test #'string-equal)))
;;                (if attrib 
;;                    (setf (current-elt *ref-current-row*) (sax:attribute-value attrib))
;;                    (setf (current-elt *ref-current-row*) nil))))))
;;     ;;       <ELT> <ATTRIB>
;;     ;; <a href= | img src=
;;     (collect  "field"   "name")))
;;
;; (defmethod sax:characters  ((handler dbc-sax-handler) data)
;;   (when (and *ref-current-row* 
;;              (current-elt *ref-current-row*))
;;     (vector-push-extend (list (current-elt *ref-current-row*)
;;                               data)
;;                         (field-data *ref-current-row*))
;;     (setf (current-elt *ref-current-row*) nil)))
;;
;; (defmethod sax:end-element  ((handler dbc-sax-handler)
;;                              uri local-name qname)
;;   (when (and *ref-current-row* 
;;              (current-elt *ref-current-row*))
;;     (vector-push-extend (list (current-elt *ref-current-row*))
;;                         (field-data *ref-current-row*))
;;     (setf (current-elt *ref-current-row*) nil))
;;   (when (string-equal local-name "row")
;;     ;; (print (field-data *ref-current-row*))
;;     (write-sax-parsed-row-to-file :output-stream *parsed-data-output-stream*)
;;     (and (current-elt *ref-current-row*)
;;          (setf (current-elt *ref-current-row*) nil))))
;;
;; (defmethod sax:end-document  ((handler dbc-sax-handler))
;;   (when *ref-current-row*
;;     (setf *ref-current-row* nil)))

(defmethod sax:start-document  ((handler dbc-sax-handler))
  (when *ref-current-row*
    (when (typep *ref-current-row* 'dbc-sax-parsing-class)
      (dbc-sax-current-chars-clear *ref-current-row*))
    (setf *ref-current-row* nil)
    ;; (setf *ref-current-row* (make-instance 'dbc-sax-parsing-class))
    ))

(defmethod sax:start-element ((handler dbc-sax-handler)
                              uri local-name qname attributes)
  ;; :TODO we _really_ need to be checking against a list of known field-names instead of against "row"
  (when (string-equal local-name "row")
    (setf *ref-current-row* (make-instance 'dbc-sax-parsing-class))
    (return-from sax:start-element))
  ;; (unless (typep *ref-current-row* 'dbc-sax-parsing-class)
  ;;   (setf *ref-current-row* (make-instance 'dbc-sax-parsing-class)))
  (flet ((collect (elt attrib)
           (when (string-equal elt local-name)
             (let ((attrib
                    (find attrib attributes
                          :key #'sax:attribute-local-name
                          :test #'string-equal)))
               (if attrib 
                   (setf (current-elt *ref-current-row*) (sax:attribute-value attrib))
                   (progn
                     (dbc-sax-current-chars-reset *ref-current-row*)
                     (setf (current-elt *ref-current-row*) nil)
                       ))))))
    ;;       <ELT> <ATTRIB>
    ;; <a href= | img src=
    (collect  "field"   "name")))

(defmethod sax:characters  ((handler dbc-sax-handler) data)
  (when (typep *ref-current-row* 'dbc-sax-parsing-class)
    (if (current-elt *ref-current-row*)
        (setf (dbc-sax-current-chars *ref-current-row*) data)
        (progn
          (dbc-sax-current-chars-reset *ref-current-row*)
          (setf (current-elt *ref-current-row*) nil)))))

(defmethod sax:end-element  ((handler dbc-sax-handler)
                             uri local-name qname)
  (when (and (typep *ref-current-row* 'dbc-sax-parsing-class)
             (current-elt *ref-current-row*))
    (let ((chk-chars (dbc-sax-current-chars *ref-current-row*)))
      (if (mon:string-null-empty-or-all-whitespace-p chk-chars)
          (vector-push-extend (list (current-elt *ref-current-row*))
                              (field-data *ref-current-row*))
          (vector-push-extend (cons (current-elt *ref-current-row*)
                                    chk-chars)
                              (field-data *ref-current-row*))))
    (setf (current-elt *ref-current-row*) nil)
    (dbc-sax-current-chars-reset *ref-current-row*))
  (when (string-equal local-name "row")
    ;; (print (field-data *ref-current-row*))
    (write-sax-parsed-row-to-file :output-stream *parsed-data-output-stream*)
    (when (current-elt *ref-current-row*)
      (dbc-sax-current-chars-clear *ref-current-row*)
      (setf (current-elt *ref-current-row*) nil))))

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
  (write (coerce (field-data *ref-current-row*) 'list) :stream output-stream))

;; Parse the dbc XML refs in INPUT-FILE and write thier lispy counterparts to OUTPUT-FILE.
;; For duration of body the variable `*parsed-data-output-stream*' is bound to an open output-stream.
;; INPUT-FILE defaults to `*xml-input-refs-name*'
;; OUTPUT-FILE defaults to `*refs-output-source*'
;; :EXAMPLE
;; (write-sax-parsed-xml-refs-file)
;; (write-sax-parsed-xml-refs-file
;;   :input-file  (merge-pathnames (make-pathname :name "dump-themes-DUMPING")
;;                                 (sub-path *xml-input-dir*))
;;   :output-file (merge-pathnames 
;;                 (make-pathname :directory `(:relative ,*xml-output-dir*)
;;                                :name (concatenate 'string "sax-themes-test-" (mon:time-string-yyyy-mm-dd))
;;                                :type "lisp")
;;                 (system-path *system-path*)))
(defun write-sax-parsed-xml-refs-file (&key input-file  output-file)
  (unless input-file 
    (setf input-file *xml-input-refs-name*))
  (unless output-file
    (setf output-file *refs-output-source*))
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
