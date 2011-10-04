;;; :FILE-CREATED <Timestamp: #{2011-10-02T20:19:21-04:00Z}#{11397} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/dbc-classes/dbc-class-parse-EXAMPLE.lisp
;;; ==============================

(in-package #:dbc)
;; *package*
(defparameter *tt--parse-table* (make-hash-table :test 'equal))

(let ((parsed-sax-file (merge-pathnames 
                        (make-pathname :directory `(:relative ,(sub-name *xml-output-dir*))
                                       :name (concatenate 'string "sax-refs-test-" (mon:time-string-yyyy-mm-dd))
                                       :type "lisp")
                        (system-path *system-path*))))
  (write-sax-parsed-xml-to-file
   :input-file  (merge-pathnames (make-pathname :name "dump-refs-DUMPING")
                                 (sub-path *xml-input-dir*))
   :output-file parsed-sax-file)
  (load-sax-parsed-xml-file-to-parsed-class-hash :parsed-class 'parsed-ref  
                                                 :input-file parsed-sax-file
                                                 :hash-table  *tt--parse-table*
                                                 :key-accessor  #'item-number
                                                 :slot-dispatch-function #'set-parse-ref-slot-value))


;; This will write all 8979 hash-table values to an individual file.
(write-sax-parsed-class-hash-to-files
 *tt--parse-table*
 :parsed-class 'parsed-ref
 :slot-for-file-name 'item-number
 :prefix-for-file-name "item-number"
 :output-directory (ensure-directories-exist
                    (merge-pathnames 
                     (make-pathname :directory `(:relative ,(sub-name *xml-output-dir*) 
                                                           ,(concatenate 'string 
                                                                         "individual-parse-refs-"
                                                                         (mon:time-string-yyyy-mm-dd))))
                     (system-path *system-path*))))
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

(write-sax-parsed-xml-to-file
 :input-file  (merge-pathnames (make-pathname :name "dump-artist-infos-xml")
                               (sub-path *xml-input-dir*))
 :output-file (merge-pathnames 
               (make-pathname :directory `(:relative ,(sub-name *xml-output-dir*))
                              :name (concatenate 'string "sax-artist-test-" (mon:time-string-yyyy-mm-dd))
                              :type "lisp")
               (system-path *system-path*)))

(load-sax-parsed-xml-file-to-parsed-class-hash :parsed-class 'parsed-artist
                                               :input-file (merge-pathnames 
                                                            (make-pathname :directory `(:relative ,(sub-name *xml-output-dir*))
                                                                           :name (concatenate 'string "sax-artist-test-" (mon:time-string-yyyy-mm-dd))
                                                                           :type "lisp")
                                                            (system-path *system-path*))
                                               :hash-table *tt--parse-artist-table*
                                               :key-accessor #'control-id-entity-num-artist
                                               :slot-dispatch-function #'set-parsed-artist-slot-value)

(write-sax-parsed-class-hash-to-files 
 *tt--parse-artist-table*
 :parsed-class 'parsed-artist
 :slot-for-file-name 'control-id-entity-num-artist
 :prefix-for-file-name "artist-id-number"
 :output-directory (ensure-directories-exist
                    (merge-pathnames 
                     (make-pathname :directory `(:relative ,(sub-name *xml-output-dir*) 
                                                           ,(concatenate 'string 
                                                                         "individual-parse-artists-"
                                                                         (mon:time-string-yyyy-mm-dd))))
                     (system-path *system-path*))))



;;; ==============================
;;; EOF
