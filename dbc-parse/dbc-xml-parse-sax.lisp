;;; :FILE-CREATED <Timestamp: #{2011-09-26T19:45:57-04:00Z}#{11391} - by MON>
;;; :FILE dbc-specific/dbc-parse/dbc-xml-parse-sax.lisp
;;; ==============================

;;; ==============================
;; :NOTE Everything in this file works as of 2011-09-26
;; :TODO
;;   - See comments for `sax:start-element' method specialized on the class `dbc-sax-handler'.
;;; ==============================

;; (elt (cons 'a 'b) 0)


(in-package #:dbc)


;; :NOTE The following parameters`*parsed-data-current-row*',
;; `*parsed-data-output-path*', `*parsed-data-output-stream*' were reduced to a
;; single symbol `*parsed-data-state*' when we abstracted to class
;; `%parsed-data-state' and provided appropriate accessors...
;;
(defparameter *parsed-data-current-state* nil)

(defgeneric %parsed-data-current-parent (object)
  (:documentation "The current row being parsed."))
(defgeneric (setf %parsed-data-current-parent) (row object)
  (:documentation "Set the current row being parsed."))

(defgeneric %parsed-data-output-path (object)
  (:documentation "The current path to write parsed data values to."))
(defgeneric (setf %parsed-data-output-path) (path object)
  (:documentation "Set the current path to write parsed data values to."))

(defgeneric %parsed-data-input-path (object)
  (:documentation "The current path being parsed."))
(defgeneric (setf %parsed-data-input-path) (path object)
  (:documentation "Set the current path being parsed."))

(defgeneric %parsed-data-output-stream (object)
  (:documentation "The current stream to write parsed data values to."))
(defgeneric (setf %parsed-data-output-stream) (stream object)
  (:documentation "Set the current stream to write parsed data values to."))

(defgeneric %parsed-data-match-parent-element (object)
  (:documentation 
   #.(format nil "Return current XML parent element we are trying to match.~%~@
Its children will contain attribute/value pairs which correspond to the slot-name/slot-values we want to parse.")))
(defgeneric (setf %parsed-data-match-parent-element) (parent-element-name object))

(defgeneric %parsed-data-match-attribute-pair (object))
(defgeneric (setf %parsed-data-match-attribute-pair) (match-attribute-pair object))

(defgeneric %parsed-data-parent-element-count (object))
(defgeneric (setf %parsed-data-parent-element-count) (newcount object))

(defclass %parsed-data-state ()
  ;; :NOTE We used to explicitly provide a string the parent XML element we were matching, e.g. "row".
  ;; :matching-start-element-parent "row"
  ;; :collect-element-and-attribute-pair ("field" . "name"))
  ((%parsed-data-match-parent-element
     ;; :%parsed-data-match-parent-element
     :initarg :%parsed-data-match-parent-element ;; e.g. "row"
     :accessor %parsed-data-match-parent-element)
   (%parsed-data-parent-element-count
    :initform 0
    :accessor %parsed-data-parent-element-count)
    (%parsed-data-match-attribute-pair
     ;; :initarg :%parsed-data-match-attribute-pair ;; e.g. ("field" . "name")
     :accessor :%parsed-data-match-attribute-pair)
    (%parsed-data-current-parent
    :initform '()
    :accessor %parsed-data-current-parent
    :documentation "Holds an instance of class `dbc-sax-parsing-class' while parsing an XML row field.")
    (%parsed-data-input-path
    :initform '()
    :accessor %parsed-data-input-path
    :documentation "The path to current file being parsed.")
    (%parsed-data-output-path
    :initform '()
    :accessor %parsed-data-output-path
    :documentation #.(format nil "Output path to use while parsing the XML data of pathname designated by slot %parsed-data-input-path.~@
                                  A stream to this file is opened on entry to `write-sax-parsed-xml-to-file' and closed on exit."))
   (%parsed-data-output-stream 
    :initform '()    
    :accessor %parsed-data-output-stream
    :documentation #.(format nil "Output stream current while parsing the XML data of pathname designated by slot %parsed-data-input-path.~@
                                  Opened on entry to `write-sax-parsed-xml-to-file' and closed on exit."))))

(defmethod %parsed-data-match-parent-element ((object %parsed-data-state))
  (slot-value object '%parsed-data-match-parent-element))
;;
(defmethod (setf %parsed-data-match-parent-element) (parent-element-name (object %parsed-data-state))
  (declare (string parent-element-name))
  (setf (slot-value object '%parsed-data-match-parent-element) parent-element-name))

(defmethod %parsed-data-parent-element-count ((object %parsed-data-state))
  (slot-value object '%parsed-data-parent-element-count))

(defmethod (setf %parsed-data-parent-element-count) (newcount (object %parsed-data-state))
  (setf (slot-value object '%parsed-data-parent-element-count) newcount))

(defmethod %parsed-data-match-attribute-pair ((object %parsed-data-state))
  (slot-value object '%parsed-data-match-attribute-pair))
;;
(defmethod (setf %parsed-data-match-attribute-pair) (match-attribute-pair (object %parsed-data-state))
  (declare (cons match-attribute-pair))
  (assert (and (stringp (car match-attribute-pair))
               (stringp (cdr match-attribute-pair))))
  (setf (slot-value object '%parsed-data-match-attribute-pair) match-attribute-pair))

(defmethod %parsed-data-current-parent ((object %parsed-data-state))
  (slot-value object '%parsed-data-current-parent))
;;
(defmethod (setf %parsed-data-current-parent) (row (object %parsed-data-state))
  (setf (slot-value object '%parsed-data-current-parent) row))

(defmethod %parsed-data-input-path ((object %parsed-data-state))
  (slot-value  object '%parsed-data-input-path))
;;
(defmethod (setf %parsed-data-input-path) (path (object %parsed-data-state))
  (setf (slot-value object '%parsed-data-input-path) path))

(defmethod %parsed-data-output-path ((object %parsed-data-state))
  (slot-value  object '%parsed-data-output-path))
;;
(defmethod (setf %parsed-data-output-path) (path (object %parsed-data-state))
  (setf (slot-value object '%parsed-data-output-path) path))

(defmethod %parsed-data-output-stream ((object %parsed-data-state))
  (slot-value object '%parsed-data-output-stream))
;;
(defmethod (setf %parsed-data-output-stream) (stream (object %parsed-data-state))
  (setf (slot-value object '%parsed-data-output-stream) stream))

;; :TESTING
;; (assert (typep (setf *parsed-data-current-state* 88)
;;                (%make-parsed-data-current-state)
;;                '%parsed-data-state))
;;
;; (assert (typep (progn (setf *parsed-data-current-state* 88)
;;                       (%make-parsed-data-current-state))
;;                '%parsed-data-state))
(defun %ensure-parsed-data-current-state-boundp ()
  (if (boundp (quote *parsed-data-current-state*))
      (if (typep *parsed-data-current-state* '%parsed-data-state)
          *parsed-data-current-state*
        (setq *parsed-data-current-state* '()))
      (set (quote *parsed-data-current-state*) '())))

(defun %make-parsed-data-current-state ()
  (%ensure-parsed-data-current-state-boundp)
  (set (quote *parsed-data-current-state*)
       (make-instance '%parsed-data-state)
       ))

(defun %parsed-state-current-row-check-type ()
  (and (typep *parsed-data-current-state* '%parsed-data-state)
       (typep (%parsed-data-current-parent *parsed-data-current-state*) 
              'dbc-sax-parsing-class)))

;;; ==============================
;;; :NOTE we can't easily combine classes `dbc-sax-parsing-class' and  sax:start-element
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
   )
  (:documentation
   #.(format nil
             "A class for use with class `dbc-sax-handler' when parsing XML files using CXML's SAX interface.~%~@
After we finish parsing an XML <row> element the FIELD-DATA slot will hold all fields parsed.~%~@
While parsing individual XML <field> elements we push them onto the slot CURRENT-ELT.~%~@
When we are finished with the field we push the slot-value onto the FIELD-DATA stack.~%~@
:SEE-ALSO `dbc-sax-current-chars-clear', `dbc-sax-current-chars-reset',
`dbc-sax-current-chars', `dbc-sax-handler', `write-sax-parsed-delimiter',
`write-sax-parsed-xml-row-to-file', `load-sax-parsed-xml-file-to-parsed-class-hash',
`*parsed-data-current-state*', `*xml-input-dir*', `*xml-output-dir*'.~%▶▶▶")))

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

(defun make-dbc-sax-handler ()
  (%make-parsed-data-current-state)
  (make-instance 'dbc-sax-handler))

(defmethod sax:start-document  ((handler dbc-sax-handler))
  (when (%parsed-data-current-parent  *parsed-data-current-state*)
    (when (%parsed-state-current-row-check-type)
      (dbc-sax-current-chars-clear (%parsed-data-current-parent *parsed-data-current-state*)))
    (setf (%parsed-data-current-parent  *parsed-data-current-state*) nil)))

(defmethod sax:start-element ((handler dbc-sax-handler)
                              uri local-name qname attributes)
  ;; :TODO we _really_ need to be checking against a list of known field-names instead of against "row"
  (when (string-equal local-name "row")
    (setf (%parsed-data-current-parent *parsed-data-current-state*) (make-instance 'dbc-sax-parsing-class))
    (setf (%parsed-data-parent-element-count *parsed-data-current-state*) 
          (1+ (%parsed-data-parent-element-count *parsed-data-current-state*)))
    (return-from sax:start-element))
  ;; (unless (typep *parsed-data-current-row* 'dbc-sax-parsing-class)
  ;;   (setf *parsed-data-current-row* (make-instance 'dbc-sax-parsing-class)))
  (flet ((collect (elt attrib)
           (when (string-equal elt local-name)
             (let ((attrib (find attrib attributes :key #'sax:attribute-local-name :test #'string-equal)))
               (if attrib 
                   (setf (current-elt (%parsed-data-current-parent *parsed-data-current-state*))
                         (sax:attribute-value attrib))
                   (progn
                     (dbc-sax-current-chars-reset (%parsed-data-current-parent *parsed-data-current-state*))
                     (setf (current-elt (%parsed-data-current-parent *parsed-data-current-state*)) nil)))))))
                     
    ;;       <ELT> <ATTRIB>
    ;; <a href= | img src=
    (collect  "field"   "name")))

(defmethod sax:characters  ((handler dbc-sax-handler) data)
  (when (%parsed-state-current-row-check-type)
    (let ((current-parent-element (%parsed-data-current-parent *parsed-data-current-state*)))
    (if (current-elt current-parent-element)
        (setf (dbc-sax-current-chars current-parent-element) data)
        (progn
          (dbc-sax-current-chars-reset current-parent-element)
          (setf (current-elt current-parent-element) nil))))))

(defmethod sax:end-element  ((handler dbc-sax-handler)
                             uri local-name qname)
  (when (and (%parsed-state-current-row-check-type)
             (current-elt (%parsed-data-current-parent *parsed-data-current-state*)))
    (let* ((current-parent-element (%parsed-data-current-parent *parsed-data-current-state*))
           (chk-chars (dbc-sax-current-chars current-parent-element)))
      (if (mon:string-null-empty-or-all-whitespace-p chk-chars)
          (vector-push-extend (list (current-elt current-parent-element))
                              (field-data current-parent-element))
          (vector-push-extend (cons (current-elt current-parent-element) chk-chars)
                              (field-data current-parent-element)))
      (setf (current-elt current-parent-element) nil)
      (dbc-sax-current-chars-reset current-parent-element)))
  (when (string-equal local-name "row")
    ;; (print (field-data (%parsed-data-current-parent *parsed-data-current-state*)))
    (write-sax-parsed-xml-row-to-file :output-stream (%parsed-data-output-stream *parsed-data-current-state*))
    (when (current-elt (%parsed-data-current-parent *parsed-data-current-state*))
      (let ((current-parent-element (%parsed-data-current-parent *parsed-data-current-state*)))
        (dbc-sax-current-chars-clear current-parent-element)
        (setf (current-elt current-parent-element) nil)))))

(defmethod sax:end-document  ((handler dbc-sax-handler))
  (when (%parsed-data-current-parent *parsed-data-current-state*)
    (setf (%parsed-data-current-parent *parsed-data-current-state*) nil))
  (values t
          (list
           :input-file  (%parsed-data-input-path *parsed-data-current-state*)
           :output-file (%parsed-data-output-path *parsed-data-current-state*)
           ;; :NOTE This may potentially leave a reference to an otherwise dead fd-stream...
           ;; :output-stream (%parsed-data-output-stream *parsed-data-current-state*)
           )
          ;; (%parsed-data-parent-element-count *parsed-data-current-state*)
          ))

(defun write-sax-parsed-delimiter (&key output-stream)
  ;; :NOTE consider using `cl:write-line' instead.
  (let ((delim (make-string 68 :initial-element #\;)))
    (format output-stream "~&~%~A~%" delim)))

(defun write-sax-parsed-xml-row-to-file (&key output-stream)
  (write-sax-parsed-delimiter :output-stream output-stream)
  (write (coerce (field-data (%parsed-data-current-parent *parsed-data-current-state*)) 'list)
       :stream output-stream))

;; (%make-parsed-output-trimmed-pathname " _-bubba _-") => "bubba"
;; (%make-parsed-output-trimmed-pathname " _-bubba _-" :w-delim t) => "bubba-"
(defun %make-parsed-output-trimmed-pathname (trimming-pathname &key (w-delim nil))
  (declare (string trimming-pathname)
           (boolean w-delim))
  (let* ((strip-chars (list #\space  #\_ #\-)) ; #\- must be last elt of list!
         (trimmed  (string-right-trim strip-chars (string-left-trim strip-chars trimming-pathname))))
    (if w-delim
        (concatenate 'string trimmed (last strip-chars))
        trimmed)))


;; (mon:timestamp-for-file-with  :prefix " _-bubba _-" :universal-time nil)
;; (%make-dated-parse-output-prefix-for-pathname " _-bubba _-") => "bubba-2011-11-29"
(defun %make-dated-parse-output-prefix-for-pathname (prefix)
  (declare (string prefix))
  ;; :WAS
  ;; (concatenate 'string (%make-parsed-output-trimmed-pathname prefix :w-delim t)
  ;;              (mon:time-string-yyyy-mm-dd))
  (mon:timestamp-for-file-with :prefix prefix :universal-time nil))


;; 
;; 
;; (make-parsed-class-output-directory-pathname :pathname-sub-directory '("bubba" "more")
;;                                                        :pathname-base-directory (sub-path *xml-output-dir*)
;;                                                        :pathname-dated-p t)
;; (make-parsed-class-output-directory-pathname :pathname-sub-directory '("bubba" "more")
;;                                                        :pathname-base-directory (sub-path *xml-output-dir*))
(defun make-parsed-class-output-directory-pathname (&key (pathname-sub-directory  (sub-name *xml-output-dir*) sub-supplied-p)
                                                                   (pathname-dated-p nil)
                                                                   (pathname-base-directory (system-base-path *system-path*) base-supplied-p)
                                                                   ;(ensure-directories-exist t)
                                                                   )
  (declare ((or string list) pathname-sub-directory)
           (mon:pathname-or-namestring pathname-base-directory))
  (when (and pathname-dated-p (or (null sub-supplied-p) (null base-supplied-p)))
    (error ":FUNCTION `make-parsed-class-output-directory-pathname'~% ~
             when arg PATHNAME-DATED-P is non-nil both PATHNAME-SUB-DIRECTORY and PATHNAME-BASE-DIRECTORY must be supplied."))
  (let* ((base-dir-if
           (or (osicat:directory-exists-p pathname-base-directory)
               (error "Arg PATHNAME-BASE-DIRECTORY does not name an existing directory.~% got: ~A"
                      pathname-base-directory)))
         (ensure-subname-maybe-dated 
           (etypecase pathname-sub-directory
             (null 
              (if pathname-dated-p 
                  (list (mon:time-string-yyyy-mm-dd))
                  ;; (%make-dated-parse-output-prefix-for-pathname ""))
                  '()))
             (string 
              (if pathname-dated-p
                  (list (if (mon:string-empty-p pathname-sub-directory)
                            (mon:time-string-yyyy-mm-dd)
                            (%make-dated-parse-output-prefix-for-pathname pathname-sub-directory)))
                  (if (mon:string-empty-p pathname-sub-directory)
                      '()
                      (list pathname-sub-directory))))
             (list
              (unless (every #'mon:string-not-null-empty-or-all-whitespace-p pathname-sub-directory)
                (error "Arg PATHNAME-SUB-DIRECTORY cannot be a list containing an empty string~% ~% got: ~S~%" pathname-sub-directory))
              (let ((list-copy (copy-list pathname-sub-directory)))
                (when pathname-dated-p 
                  (setf (car (last list-copy)) (%make-dated-parse-output-prefix-for-pathname (car (last list-copy)))))
                list-copy))))
         (ensured '()))
    (setf ensure-subname-maybe-dated (nconc (list :relative) ensure-subname-maybe-dated))
    (ensure-directories-exist (merge-pathnames 
                               (make-pathname :directory ensure-subname-maybe-dated)
                               base-dir-if))))

;; make-default-parsed-class-xml-output-pathname
(defun make-default-sax-parsed-xml-output-pathname (&key (pathname-name "parsed-xml")
                                                         (pathname-name-dated-p t)
                                                         (pathname-type "lisp")
                                                         (pathname-sub-directory  (sub-name *xml-output-dir*))
                                                         (pathname-base-directory (system-base-path *system-path*)))
  (declare ((or string list) pathname-sub-directory)
           (string pathname-name)
           (mon:pathname-or-namestring pathname-base-directory))
  (let ((sub-dir-ensured (make-parsed-class-output-directory-pathname :pathname-sub-directory pathname-sub-directory
                                                                                :pathname-base-directory pathname-base-directory)))
    (merge-pathnames (make-pathname :name (if pathname-name-dated-p 
                                              (%make-dated-parse-output-prefix-for-pathname pathname-name)
                                              (%make-parsed-output-trimmed-pathname pathname-name))
                                    :type pathname-type)
                     sub-dir-ensured)))
;; 
;; write-parsed-class-sax-parsed-xml-to-file
(defun write-sax-parsed-xml-to-file (&key input-file output-file)
  (declare (mon:pathname-or-namestring input-file)
           ((or mon:pathname-or-namestring list) output-file))
  (unless (probe-file input-file)
    (error "Arg INPUT-FILE does not exist.~% got: ~A" input-file))
  (let ((dump-file
          (if (mon:pathname-or-namestring-p output-file)
              (if (mon:pathname-or-namestring-not-empty-dotted-or-wild-p output-file)
                  output-file
                  (error "Arg OUTPUT-FILE did not satisfy `mon:pathname-or-namestring-not-empty-dotted-or-wild-p'"))
              (apply #'make-default-sax-parsed-xml-output-pathname output-file)))
        (current-handler-instance (make-dbc-sax-handler))
        (current-handler-stream '()))
    (setf 
     (%parsed-data-input-path *parsed-data-current-state*) input-file
     (%parsed-data-output-path *parsed-data-current-state*) dump-file
     current-handler-stream (open (%parsed-data-output-path *parsed-data-current-state*)
                                  :direction :output
                                  :element-type 'character
                                  :external-format :utf-8
                                  :if-exists :supersede
                                  :if-does-not-exist :create)
     (%parsed-data-output-stream *parsed-data-current-state*) current-handler-stream)
    (unwind-protect
         (values 
          (cxml:parse input-file current-handler-instance) 
          dump-file
          (%parsed-data-parent-element-count *parsed-data-current-state*)
          )
      (progn
        (when (and (streamp current-handler-stream)
                   (open-stream-p current-handler-stream))
          (close current-handler-stream))
        (if (typep *parsed-data-current-state* '%parsed-data-state)
            (setf (%parsed-data-output-stream *parsed-data-current-state*) nil
                  (%parsed-data-output-path *parsed-data-current-state*) nil
                  (%parsed-data-current-parent *parsed-data-current-state*) nil
                  (%parsed-data-parent-element-count *parsed-data-current-state*) nil
                  *parsed-data-current-state* nil))))))


#|

;;; ==============================
(if (mon:pathname-or-namestring-p output-file)
    (if (mon:pathname-or-namestring-not-empty-dotted-or-wild-p output-file)
        output-file
        (error "Arg OUTPUT-FILE did not satisfy `mon:pathname-or-namestring-not-empty-dotted-or-wild-p'"))
    (apply #'make-default-sax-parsed-xml-output-pathname output-file))

(apply #'make-default-sax-parsed-xml-output-pathname output-file)

(:pathname-name <NAME>
 :pathname-name-dated-p <BOOLEAN>
 :pathname-type <TYPE>
 :pathname-sub-directory [<STRING> | <LIST OF STRINGS>]
 :pathname-base-directory [<PATHNAME> | <NAMESTRING>])

(append 
 `(:pathname-name "name"
   :pathname-name-dated-p t
   :pathname-type "csv"
   :pathname-sub-directory '("more" "foo" "bar")
   :pathname-base-directory ,(sub-path *xml-output-dir*)) 
 (list :ensure-directories-exist t)
 )

 (make-pathname :directory (pathname-directory (sub-path *xml-input-dir*)) :name "dump-artist-infos-xml")
 => #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/notes-versioned/sql-file-per-table-2010-08-25/from-DBC-ARCH-2010-09-01/dump-artist-infos-xml"

 (write-sax-parsed-xml-to-file
  :input-file (make-pathname :directory (pathname-directory (sub-path *xml-input-dir*)) :name "dump-artist-infos-xml")
  :output-file (list :pathname-name "artist-dump-test" :pathname-sub-directory (list (sub-name *xml-output-dir*) "new-sax-parser" )))

 (write-sax-parsed-xml-to-file 
  :input-file (make-pathname :directory (pathname-directory (sub-path *xml-input-dir*)) :name "dump-refs-DUMPING") 
  :output-file (list :pathname-name "inventory-dump-test" :pathname-sub-directory (list (sub-name *xml-output-dir*) "new-sax-parser" )))

(make-parsed-class-output-directory-pathname :pathname-sub-directory "new-sax-parser" 
                                                       :pathname-base-directory (sub-path *xml-output-dir*))

#P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/xml-class-dump-dir/new-sax-parser/"

(make-parsed-class-output-directory-pathname :pathname-name "artist-dump-test" :pathname-sub-directory (list (sub-name *xml-output-dir*) "new-sax-parser"))

(make-parsed-class-output-directory-pathname  :pathname-sub-directory (list (sub-name *xml-output-dir*) "new-sax-parser" ))
(make-parsed-class-output-directory-pathname :pathname-sub-directory nil)

|#



;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
