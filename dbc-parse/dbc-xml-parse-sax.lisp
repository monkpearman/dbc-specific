;;; :FILE-CREATED <Timestamp: #{2011-09-26T19:45:57-04:00Z}#{11391} - by MON>
;;; :FILE dbc-specific/dbc-parse/dbc-xml-parse-sax.lisp
;;; ==============================

;; :NOTE Everything in this file works as of 2011-09-26

(in-package #:dbc)

(defparameter *parsed-data-current-row* '()
  "Holds an instance of class `dbc-sax-parsing-class' while parsing an XML row field.")

(defparameter *parsed-data-output-path* nil)

;; *xml-input-refs-name*

(defparameter *parsed-data-output-stream* nil
  "Output stream current while parsing the XML data of *parsed-data-output-path*
Opend on entry to `write-sax-parsed-xml-to-file' and closed on exit.")

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
;;   (when *parsed-data-current-row*
;;     (setf *parsed-data-current-row* nil)))
;;
;; (defmethod sax:start-element ((handler dbc-sax-handler)
;;                               uri local-name qname attributes)
;;   (when (string-equal local-name "row")
;;     (setf *parsed-data-current-row* (make-instance 'dbc-sax-parsing-class))
;;     (return-from sax:start-element))
;;   (flet ((collect (elt attrib)
;;            (when (string-equal elt local-name)
;;              (let ((attrib
;;                     (find attrib attributes
;;                           :key #'sax:attribute-local-name
;;                           :test #'string-equal)))
;;                (if attrib 
;;                    (setf (current-elt *parsed-data-current-row*) (sax:attribute-value attrib))
;;                    (setf (current-elt *parsed-data-current-row*) nil))))))
;;     ;;       <ELT> <ATTRIB>
;;     ;; <a href= | img src=
;;     (collect  "field"   "name")))
;;
;; (defmethod sax:characters  ((handler dbc-sax-handler) data)
;;   (when (and *parsed-data-current-row* 
;;              (current-elt *parsed-data-current-row*))
;;     (vector-push-extend (list (current-elt *parsed-data-current-row*)
;;                               data)
;;                         (field-data *parsed-data-current-row*))
;;     (setf (current-elt *parsed-data-current-row*) nil)))
;;
;; (defmethod sax:end-element  ((handler dbc-sax-handler)
;;                              uri local-name qname)
;;   (when (and *parsed-data-current-row* 
;;              (current-elt *parsed-data-current-row*))
;;     (vector-push-extend (list (current-elt *parsed-data-current-row*))
;;                         (field-data *parsed-data-current-row*))
;;     (setf (current-elt *parsed-data-current-row*) nil))
;;   (when (string-equal local-name "row")
;;     ;; (print (field-data *parsed-data-current-row*))
;;     (write-sax-parsed-xml-row-to-file :output-stream *parsed-data-output-stream*)
;;     (and (current-elt *parsed-data-current-row*)
;;          (setf (current-elt *parsed-data-current-row*) nil))))
;;
;; (defmethod sax:end-document  ((handler dbc-sax-handler))
;;   (when *parsed-data-current-row*
;;     (setf *parsed-data-current-row* nil)))

(defmethod sax:start-document  ((handler dbc-sax-handler))
  (when *parsed-data-current-row*
    (when (typep *parsed-data-current-row* 'dbc-sax-parsing-class)
      (dbc-sax-current-chars-clear *parsed-data-current-row*))
    (setf *parsed-data-current-row* nil)
    ;; (setf *parsed-data-current-row* (make-instance 'dbc-sax-parsing-class))
    ))

(defmethod sax:start-element ((handler dbc-sax-handler)
                              uri local-name qname attributes)
  ;; :TODO we _really_ need to be checking against a list of known field-names instead of against "row"
  (when (string-equal local-name "row")
    (setf *parsed-data-current-row* (make-instance 'dbc-sax-parsing-class))
    (return-from sax:start-element))
  ;; (unless (typep *parsed-data-current-row* 'dbc-sax-parsing-class)
  ;;   (setf *parsed-data-current-row* (make-instance 'dbc-sax-parsing-class)))
  (flet ((collect (elt attrib)
           (when (string-equal elt local-name)
             (let ((attrib
                    (find attrib attributes
                          :key #'sax:attribute-local-name
                          :test #'string-equal)))
               (if attrib 
                   (setf (current-elt *parsed-data-current-row*) (sax:attribute-value attrib))
                   (progn
                     (dbc-sax-current-chars-reset *parsed-data-current-row*)
                     (setf (current-elt *parsed-data-current-row*) nil)
                       ))))))
    ;;       <ELT> <ATTRIB>
    ;; <a href= | img src=
    (collect  "field"   "name")))

(defmethod sax:characters  ((handler dbc-sax-handler) data)
  (when (typep *parsed-data-current-row* 'dbc-sax-parsing-class)
    (if (current-elt *parsed-data-current-row*)
        (setf (dbc-sax-current-chars *parsed-data-current-row*) data)
        (progn
          (dbc-sax-current-chars-reset *parsed-data-current-row*)
          (setf (current-elt *parsed-data-current-row*) nil)))))

(defmethod sax:end-element  ((handler dbc-sax-handler)
                             uri local-name qname)
  (when (and (typep *parsed-data-current-row* 'dbc-sax-parsing-class)
             (current-elt *parsed-data-current-row*))
    (let ((chk-chars (dbc-sax-current-chars *parsed-data-current-row*)))
      (if (mon:string-null-empty-or-all-whitespace-p chk-chars)
          (vector-push-extend (list (current-elt *parsed-data-current-row*))
                              (field-data *parsed-data-current-row*))
          (vector-push-extend (cons (current-elt *parsed-data-current-row*)
                                    chk-chars)
                              (field-data *parsed-data-current-row*))))
    (setf (current-elt *parsed-data-current-row*) nil)
    (dbc-sax-current-chars-reset *parsed-data-current-row*))
  (when (string-equal local-name "row")
    ;; (print (field-data *parsed-data-current-row*))
    (write-sax-parsed-xml-row-to-file :output-stream *parsed-data-output-stream*)
    (when (current-elt *parsed-data-current-row*)
      (dbc-sax-current-chars-clear *parsed-data-current-row*)
      (setf (current-elt *parsed-data-current-row*) nil))))

(defmethod sax:end-document  ((handler dbc-sax-handler))
  (when *parsed-data-current-row*
    (setf *parsed-data-current-row* nil)))

;; Write a commented delimiter line to OUTPUT-STREAM. 
(defun write-sax-parsed-delimiter (&key output-stream)
  (let ((delim (make-string 68 :initial-element #\;)))
    (format output-stream "~&~%~A~%" delim)))

;; Write all rows of slot-value FIELD-DATA for current instance of class `dbc-sax-parsing-class' to OUTPUT-STREAM.
;; Current instance is held by varialbe `*parsed-data-current-row*'.
(defun write-sax-parsed-xml-row-to-file (&key output-stream)
  (write-sax-parsed-delimiter :output-stream output-stream)
  (write (coerce (field-data *parsed-data-current-row*) 'list) :stream output-stream))

;; write-sax-parsed-xml-table-to-file -> write-sax-parsed-xml-to-file

;; Parse the dbc XML refs in INPUT-FILE and write thier lispy counterparts to OUTPUT-FILE.
;; For duration of body the variable `*parsed-data-output-stream*' is bound to an open output-stream.
;; INPUT-FILE defaults to `*xml-input-refs-name*'.~%~@
;; OUTPUT-FILE defaults to `*parsed-data-output-path*'.~%~@
;; :EXAMPLE
;; (write-sax-parsed-xml-to-file)
;; (write-sax-parsed-xml-to-file
;;   :input-file  (merge-pathnames (make-pathname :name "dump-themes-DUMPING")
;;                                 (sub-path *xml-input-dir*))
;;   :output-file (merge-pathnames 
;;                 (make-pathname :directory `(:relative ,*xml-output-dir*)
;;                                :name (concatenate 'string "sax-themes-test-" (mon:time-string-yyyy-mm-dd))
;;                                :type "lisp")
;;                 (system-path *system-path*)))
;; The parsed file can be loaded into a hash-table with 
;; `load-sax-parsed-xml-file-to-parsed-class-hash'
(defun write-sax-parsed-xml-to-file (&key input-file  output-file)
  (unless input-file 
    (setf input-file *xml-input-refs-name*))
  (unless output-file
    (setf output-file *parsed-data-output-path*))
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
    (progn
      (close *parsed-data-output-stream*)
      (setf *parsed-data-output-stream* nil))))


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
