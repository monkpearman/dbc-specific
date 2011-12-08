;;; :FILE-CREATED <Timestamp: #{2011-10-02T20:19:21-04:00Z}#{11397} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-parse-EXAMPLE.lisp
;;; ==============================

(in-package #:dbc)
;; *package*
(defparameter *tt--parse-table* (make-hash-table :test 'equal))

;; :NOTE :FUNCTION `%ensure-dated-parsed-directory' defined in

(let ((parsed-sax-file (make-default-sax-parsed-xml-output-pathname :pathname-name "sax-refs-test")))
  (write-sax-parsed-xml-to-file 
   :input-file  (merge-pathnames (make-pathname :name "dump-refs-DUMPING")
                                 (sub-path *xml-input-dir*))
   :output-file parsed-sax-file)
  (load-sax-parsed-xml-file-to-parsed-class-hash
   :parsed-class 'parsed-inventory-record  
   :input-file parsed-sax-file
   :hash-table  *tt--parse-table*
   ;; :key-accessor  #'item-number
   :key-accessor  #'inventory-number
   :slot-dispatch-function #'set-parsed-inventory-record-slot-value))

;; This will write all 8979 hash-table values to an individual file.
(write-sax-parsed-class-hash-to-files 
 *tt--parse-table*
 :parsed-class 'parsed-inventory-record
 :slot-for-file-name 'inventory-number
 :prefix-for-file-name "inventory-number"
 :output-directory (%ensure-dated-parsed-directory :directory-prefix "individual-parse-refs"))


;; (sub-path *xml-input-dir*)


;; :slot-dispatch-function #'set-parsed-artist-record-slot-value
 
;;
;; On SLAPPY writing the 8979 files took 8.601 seconds which is ~1000 files per second:
;;
;; => Evaluation took:
;;   8.601 seconds of real time
;;   6.712979 seconds of total run time (6.026084 user, 0.686895 system)
;;   [ Run times consist of 0.461 seconds GC time, and 6.252 seconds non-GC time. ]
;;   78.05% CPU
;;   14,298,721,940 processor cycles
;;   428,620,536 bytes consed


(clrhash *tt--parse-table*)

(write-sax-parsed-xml-to-file 
  :input-file (make-pathname :directory (pathname-directory (sub-path *xml-input-dir*))
                             :name "dump-artist-infos-xml")
  :output-file (list :pathname-name "artist-dump-test" 
                     :pathname-sub-directory (list (sub-name *xml-output-dir*) "new-sax-parser" )))

(write-sax-parsed-xml-to-file
:input-file  (merge-pathnames (make-pathname :name "dump-artist-infos-xml")
                               (sub-path *xml-input-dir*))
 :output-file (make-default-sax-parsed-xml-output-pathname :pathname-name "sax-artist-test"))

(load-sax-parsed-xml-file-to-parsed-class-hash
 :parsed-class 'parsed-artist-record
 :input-file (make-default-sax-parsed-xml-output-pathname :parse-file-prefix "sax-artist-test")
 :hash-table *tt--parse-table*
 :key-accessor #'control-id-entity-num-artist
 :slot-dispatch-function #'set-parsed-artist-record-slot-value)

(load-sax-parsed-xml-file-to-parsed-class-hash
 :parsed-class 'parsed-artist-record
 :input-file (make-default-sax-parsed-xml-output-pathname :pathname-name "artist-dump-test" :pathname-sub-directory (list (sub-name *xml-output-dir*) "new-sax-parser"))
 :hash-table *tt--parse-table*
 :key-accessor #'control-id-entity-num-artist
 :slot-dispatch-function #'set-parsed-artist-record-slot-value)

*tt--parse-table*


(write-sax-parsed-class-hash-to-files 
 *tt--parse-table*
 :parsed-class 'parsed-artist-record
 :slot-for-file-name 'control-id-entity-num-artist
 :prefix-for-file-name "artist-id-number"
 :output-directory (make-default-sax-parsed-xml-output-pathname-directory 
                    :pathname-sub-directory (list (sub-name *xml-output-dir*) "individual-parse-artists" )
                    :pathname-base-directory (system-base-path *xml-output-dir*)
                    :pathname-dated-p t))

(write-sax-parsed-slots-to-file *tt--read* 
;; :parsed-class 'parsed-artist-record
 :slot-for-file-name 'control-id-entity-num-artist
 :prefix-for-file-name "artist-id-number-FOO"
 :output-directory (make-default-sax-parsed-xml-output-pathname-directory 
                    :pathname-sub-directory (list (sub-name *xml-output-dir*) "individual-parse-artists" )
                    :pathname-base-directory (system-base-path *xml-output-dir*)
                    :pathname-dated-p t))






(write-sax-parsed-slots-to-file *tt--read*
:output-directory #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/xml-class-dump-dir/individual-parse-artists-2011-12-07/"
:slot-for-file-name 'control-id-entity-num-artist
:prefix-for-file-name "artist-id-number-FOO"
:directory-exists-check nil
;; :pre-padded-format-control "~&(make-instance 'parsed-artist-record~%~&~{~{:~43:A~S~}~^~%~})")
)


;;; ==============================
(defparameter *tt--read* nil)

 
(control-id-entity-num-artist *tt--read*)
(let ((read-forms '()))
  (with-open-file (f #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/xml-class-dump-dir/individual-parse-artists-2011-12-07/artist-id-number-1471"
                   :direction :input)
  (setf read-forms (read f)))
  (setf *tt--read*
        (apply #'make-instance 'parsed-artist-record read-forms)))

(let ((read-forms '()))
  (with-open-file (f #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/xml-class-dump-dir/individual-parse-artists-2011-12-07/artist-id-number-1471-b"
                   :direction :input)
    (setf read-forms (read f))))
  (setf *tt--read*
        (apply #'make-instance 'parsed-artist-record read-forms)))

;; (make-default-sax-parsed-xml-output-pathname :pathname-name (make-default-sax-parsed-xml-output-pathname :pathname-name
;; #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/xml-class-dump-dir/sax-artist-test-2011-11-29.lisp"

;; (cl-ppcre:regex-replace-all
(directory #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/xml-class-dump-dir/individual-parse-artists-2011-12-07/artist-id-number-*.lisp")

(print-sax-parsed-slots-padding-format-control *tt--read*)

;;; ==============================
;; trying to understand cl:make-load-form/cl:make-load-form-saving-slots
(make-load-form *tt--read*)

(multiple-value-bind (instance load-form)
    (make-load-form-saving-slots *tt--read*)

(make-load-form *tt--read*)
(ALLOCATE-INSTANCE (FIND-CLASS 'PARSED-ARTIST-RECORD))
(with-open-file (f #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/xml-class-dump-dir/individual-parse-artists-2011-12-07/artist-id-number-1471-load-form"
                   :direction :output
                   :if-exists :supersede
                   :if-does-not-exist :create))

;; (fdefinition (SGML::COMMENT-TOKEN)
;; (defmethod make-load-form ((object parsed-artist-record) &optional environment)
;;   (make-load-form-saving-slots object :environment environment))


;;; ==============================
;;; EOF
