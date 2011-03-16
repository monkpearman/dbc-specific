;;; :FILE-CREATED <Timestamp: #{2011-03-16T14:42:38-04:00Z}#{11113} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/dbc-tests/tests.lisp
;;; ==============================

;; :NOTE The dbc package defines the parameters `dbc:*system-tests-dir*' and
;; `dbc:*system-tests-temp-dir*' in dbc-specific/specials.lisp
;; And sets their values at loadtime in :FILE dbc-specific/loadtime-bind.lisp
;; Initially these are set to the strings "dbc-tests" and "tests" respectively.
;; Once loadtime-bind.lisp is loaded they are set to instances of
;; `dbc:system-subdir' with a dbc-system relative path.
;;  The `cl:pathname-directory' of each is accessible with:
;;   (dbc:sub-path dbc::*system-tests-dir*)
;;   (dbc:sub-path dbc::*system-tests-temp-dir*)


(in-package #:dbc-tests)

;; *package*

(defun system-test-temp-dir-exists-p ()
  (declare (special 'dbc::*system-tests-temp-dir*))
  (and (typep dbc::*system-tests-temp-dir* 'dbc:system-subdir)
       (fad:directory-exists-p (dbc:sub-path dbc::*system-tests-temp-dir*))))


;;; ==============================
;;; EOF
