;;; These functions work as of:
;;; FILE-CREATED: <Timestamp: #{2009-09-20T19:38:07-04:00Z}#{09387} - by MON>
;;; ==============================

(defvar *mon-read-buffer* (get-buffer-create "*read-tgm*"))
;; nil)
;; (setq *mon-read-buffer* 
;;       (if (buffer-live-p (get-buffer "*read-tgm*"))
;;                      (get-buffer "*read-tgm*")
;;                      (get-buffer-create "*read-tgm*")))

(defvar *mon-read-buffer-marker* nil)
(setq *mon-read-buffer-marker* 
      (if (markerp *mon-read-buffer-marker*)
          *mon-read-buffer-marker*
        (make-marker)))
;;;(setq *mon-read-buffer-marker* nil)

(defvar *mon-read-buffer-able* nil)

(defun mon-read-buff-p ()
  (save-excursion 
    (set-buffer *mon-read-buffer*)
    (goto-char (marker-position *mon-read-buffer-marker*))
    (if (scan-sexps (point) 1)
        (setq *mon-read-buffer-able* t)
      (setq *mon-read-buffer-able* nil))))

(defun mon-read-next-buffer-sexp ()
  (let (from-read)
    (when (mon-read-buff-p)
        (setq from-read (read *mon-read-buffer*))
        (save-excursion
          (set-buffer *mon-read-buffer*)
          (set-marker *mon-read-buffer-marker* (point)))); *mon-read-buffer*))
    (cons from-read (marker-position *mon-read-buffer-marker*))))

(defun mon-read-buffer-reset-marker ()
  (set-marker *mon-read-buffer-marker* (point-min) *mon-read-buffer*))


(mon-read-next-buffer-sexp)

(car (mon-read-next-buffer-sexp))
(mon-read-buffer-reset-marker)

(read *mon-read-buffer*)
(marker-buffer *mon-read-buffer-marker*)
(marker-position *mon-read-buffer-marker*)

;;; ==============================
;;; ==============================
;;;   ;; (setq push-c (reverse push-c))
;;;   ;; (push push-c the-t))))
;;;      (prin1 the-t (current-buffer)))
;;; ==============================

;;; ==============================
;;; Working and correct as of:
;;; CREATED: <Timestamp: #{2009-09-21T18:23:42-04:00Z}#{09391} - by MON>
(defun mon-make-tgm-alisted ()
(let ((not-done t))
  (while not-done
    (let ((the-c (car (mon-read-next-buffer-sexp)))
          (comp-c '(NT BT RT USE UF))
          (pop-c)
          (push-c))
      (when  (eq (car the-c) nil)
        (setq not-done nil))
      (while the-c
        (setq pop-c (pop the-c))
        (cond ((atom pop-c)
               (setq push-c (cons pop-c push-c)))
              ((listp pop-c)
               (cond ((member (car pop-c) comp-c)
                      (if (assoc (car pop-c) push-c)
                          (push (cadr pop-c) (cadr (assoc (car pop-c) push-c)))
                        (push `(,(car pop-c) (,(cadr pop-c))) push-c)))
                     (t (push pop-c push-c))))))
      (setq push-c (reverse push-c))
      (save-excursion (newline) (newline)
                      (pprint push-c (current-buffer)))))))

;;; ==============================
;;; EOF

