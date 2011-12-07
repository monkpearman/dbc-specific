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
 :hash-table *tt--parse-artist-table*
 :key-accessor #'control-id-entity-num-artist
 :slot-dispatch-function #'set-parsed-artist-record-slot-value)

;; (make-default-sax-parsed-xml-output-pathname :pathname-name (make-default-sax-parsed-xml-output-pathname :pathname-name
;; #P"/home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/xml-class-dump-dir/sax-artist-test-2011-11-29.lisp"

(write-sax-parsed-class-hash-to-files 
 *tt--parse-artist-table*
 :parsed-class 'parsed-artist-record
 :slot-for-file-name 'control-id-entity-num-artist
 :prefix-for-file-name "artist-id-number"
 :output-directory (%ensure-dated-parsed-directory :directory-prefix "individual-parse-artists"))

;;; ==============================
;;; EOF
