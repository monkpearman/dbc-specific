;;; :FILE-CREATED <Timestamp: #{2011-01-28T01:32:53-05:00Z}#{11045} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/dbc-specific/dbc-uuid.lisp
;;; ==============================

(defparameter *tt-uuid* (make-hash-table))
(setf *tt-uuid* (make-hash-table))

uuid:+namespace-dns+
;=> 6BA7B810-9DAD-11D1-80B4-00C04FD430C8
uuid:+namespace-url+
;=> 6BA7B811-9DAD-11D1-80B4-00C04FD430C8
uuid:+namespace-oid+
;=> 6BA7B812-9DAD-11D1-80B4-00C04FD430C8

uuid:+namespace-x500+
;=> 6BA7B814-9DAD-11D1-80B4-00C04FD430C8
(uuid:make-v1-uuid)

(make-v5-uuid +namespace-dns+ "www.widgets.com")

;; MD5
(make-v3-uuid namespace name)

;; time based:
;; (make-v1-uuid)
;=> D79FC180-ED1C-11DB-90E2-345C6EAC45A5

;;; once you have a sufficien UUID for namespace it will generate the same uuid
;;; each time called.
(defparameter *random-uuid-namespace* (uuid:make-v4-uuid))

(uuid:make-v5-uuid *random-uuid-namespace* "www.bubba.com")
; 1 ;=> BD1A2B17-4085-5084-813B-3C1EDE8498FE
; 2 ;=> BD1A2B17-4085-5084-813B-3C1EDE8498FE
; 3 ;=> BD1A2B17-4085-5084-813B-3C1EDE8498FE

;; random
;; (uuid:make-v4-uuid)
;=> EADF6826-9568-4016-8BA5-5707C3ED1BD0
;=> 30C0DB39-0303-4D11-B37F-4994A14ADD92


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
