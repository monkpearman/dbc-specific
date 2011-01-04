r;;; :FILE-CREATED <Timestamp: #{2010-10-21T16:42:00-04:00Z}#{10424} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-MON-CODE/mon-systems/notes/more-xml-html-examples.lisp
;;; ==============================

;; :SEE (URL `http://groups.google.com/group/comp.lang.lisp/browse_frm/thread/e49187bf4f6a8514/77bdd009d329353d?lnk=gst&q=metaclass+%2B+multiple#77bdd009d329353d')
;;
;; Drew Crampsie

;; I used the most portable GUI i know, HTML. I have never build a gui
;; application in Lisp, but I can't imagine it being any more difficult
;; than UCW. Web stuff is generally more verbose.

;; The code is about 200 lines. it could probably be made shorter with a
;; few creative macros, but i'm done with it for now :). Most of the code
;; is HTML components, because i built the interface from scratch.

;; It took me about 3 hours to write. The initial quick hack version took
;; only about an hour and was about 120 lines, but it was not as nice as
;; this one :).

;; Big wins for lisp :

;; do-bloglines-request is quite lispy. I wanted to show some lisp
;; functionality right off the bat, so we've got code as data and apply in
;; this one.

;; XMLS: There was never any need to convert the XML to an 'object'. XMLS
;; just passes you a list that represents the XML. Working with XML like
;; this is very cool.

;; UCW (components/continuations): Webapps are a pain in the ass. UCW makes
;;   it painless. If render-on generated McClim code (or whatever) instead
;; of HTML, you could have a desktop application sharing most of the same
;; code with the UCW version.

;; I suspect a bored lisper with GUI chops could take what i've done here
;; and turn out a GUI desktop application in 45 minutes. Could be shorter
;; as well, which probably matters to your friend the lispnot.

;; Screenshots at http://merlin.tech.coop/~drewc/bloglines.jpg

;; Demo app at: http://merlin.tech.coop:8080/bl/index.ucw

;; Pretty source at http://paste.lisp.org/display/5833

;; *warning* My ISP has been up and down all day, so those links may not
;; work. keep trying.

;; Here is the source code . Tested only in SBCL with an older version of
;; UCW. Enjoy :)

;; Drew Crampsie

;;; ==============================

(defpackage :cl-bloglines
   (:use :cl :it.bese.ucw :it.bese.ucw-user))

(in-package :cl-bloglines)

(require 'xmls)
(require 'aserve)

(setf ucw::*debug-on-error* t)

(defparameter *rpc-url* "http://rpc.bloglines.com/")

(defun do-bloglines-request (username password &key (feed nil) (update 0))
   "Does a listsubs, or a getitems if FEED is non-nil.
    Set UPDATE to 1 to mark a feed read"
   (let ((args `(:basic-authorization ,(cons username password)))
        (url (concatenate 'string *rpc-url* (if feed "getitems"       "listsubs"))))
     (when feed (setf args (append `(:query (("s" . ,feed) ("n" .
,update))) args)))
     (apply #'net.aserve.client:do-http-request
           url args)))

;;;some xmls utilities functions
(defun assoc-value (key alist)
   (cadr (assoc key alist :test #'equalp)))

(defun get-by-name (name node)
   (let ((n (find-if #'(lambda (x) (equalp (car x) name))
                    (xmls:node-children node))))
     (if (atom (third n))
        (values (third n) (second n))
        n)))

(defun get-all-by-name (name node)
   (remove nil (mapcar #'(lambda (x)
                          (when (equalp (car x) name) x))
                      (xmls:node-children node))))

(defapplication cl-bloglines
   (:url-prefix "/bl/"))

;;;; define the window component

(defclass bl-window (simple-window-component)
   ((body :initarg :body
          :accessor body
          :component bl-login))
   (:default-initargs
       :title "CL-Bloglines"
     :stylesheet "stylesheet.css")
   (:metaclass standard-component-class))

(defentry-point "index.ucw" (:application cl-bloglines) ()
   (call 'bl-window))

(defmethod render-on ((res response) (win bl-window))
   (<:h1 (<:as-html "CL-Bloglines RSS Reader"))
   (render-on res (body win)))

;;; a base class for all UI objects.
(defclass bl-class ()
   ((feeds :accessor feeds
          :initarg :feeds :initform "")
    (items :accessor items
          :initarg :items :initform nil)
    (current-feed :accessor current-feed
                 :initarg :current-feed :initform nil)
    (current-item :accessor current-item
                 :initarg :current-item :initform nil)
    (auth :accessor auth :initarg :auth :initform nil))
   (:metaclass standard-component-class))

(defmethod get-feeds ((bl bl-class))
   "Returns the XML text in outline format and sets (feeds self). nil on
errors"
   (multiple-value-bind (feeds result)
       (do-bloglines-request (car (auth bl)) (cdr (auth bl)))
     (when (equal 200 result) (setf (feeds bl) feeds))))

(defmethod get-items ((bl bl-class))
   "Returns the RSS XML for the current feed"
   (multiple-value-bind (items result)
        (do-bloglines-request (car (auth bl)) (cdr (auth bl))
                              :feed (current-feed bl))
   (if (equal 200 result)
       (setf (items bl) items)
       (setf (items bl) nil))))

(defmethod extract-feeds ((bl bl-class))
   "Extracts the feed outine from the xml. returns an xmls node"
   (cddr (third (fourth (xmls:parse (feeds bl))))))

(defmethod extract-items ((bl bl-class))
   "extracts the rss items from the XML. Returns an xmls node"
   (caddr (xmls:parse (items bl))))

(defaction select-item ((bl bl-class) item)
   "Makes item the current item"
   (setf (current-item bl) item))

(defaction select-feed ((bl bl-class) feed)
   "Makes feed the current feed"
   (setf (current-feed bl) feed))

(defclass bl-login (login bl-class)
   ()
   (:metaclass standard-component-class)
    (:documentation "Gets the username and password and retrieves the
feed"))

(defmethod check-credentials ((login bl-login))
   (setf (auth login)
        (cons (login.username login)
              (login.password login)))
   (get-feeds login))

;;;this has to be ini the ucw package. possibly a bug in ucw.
(defaction it.bese.ucw::login-successful ((login bl-login))
   (call 'rss-reader
        :feeds (feeds login)
        :auth (auth login)))

(defclass feeds-pane (widget-component bl-class)
   ((feeds-outline :accessor feeds-outline))
   (:metaclass standard-component-class)
   (:documentation "a UI class to hold the list of feeds"))

(defmethod render-on ((res response) (f feeds-pane))
   (<:h3 (<:as-html "Subscriptions"))
   (dolist (x (feeds-outline f))
     (let ((id (assoc-value "BloglinesSubId" (second x)))
          (title (assoc-value "title" (second x)))
          (unread (assoc-value "BloglinesUnread" (second x))))
       (<:div (<ucw:a :action (select-feed f id)
                     (if (equalp "0" unread)
                         (<:as-html title)
                         (<:as-html
                          (format nil "~A (~A)" title unread))))))))

(defclass items-pane (widget-component bl-class)
   ()
   (:metaclass standard-component-class)
   (:documentation "A UI pane to hold the Titles of the RSS feed"))

(defmethod render-on ((res response) (ip items-pane))
   (<:h3 (<:a :href (get-by-name "link" (items ip))
             (<:as-html (get-by-name "title" (items ip)))))
   (dolist (item (get-all-by-name "item" (items ip)))
     (<:div :class "item" (<ucw:a :action (select-item ip item)
            (<:as-html (get-by-name "title" item))))))

(defclass body-pane (widget-component bl-class)
   ()
   (:metaclass standard-component-class)
   (:documentation "a UI pane to hold the bdy of the blog post"))

(defmethod render-on ((res response) (b body-pane))
   (<:h3 (<:as-html (get-by-name "title" (current-item b))))
   (<:a :href (get-by-name "link" (current-item b))
        (<:as-html "(link)"))
   (<:div :class "content"
         (<:as-is (get-by-name "description" (current-item b)))))

(defclass rss-reader (widget-component bl-class)
   ((feeds-pane :accessor feeds-pane :component feeds-pane)
    (items-pane :accessor items-pane :component items-pane)
    (body-pane :accessor body-pane :component body-pane))
   (:metaclass standard-component-class)
   (:documentation "the RSS reader application itself"))

(defmethod render-on :before ((res response) (rss rss-reader))
   "Propogates the state of the current-feed/item throughout the application
Also gets the current RSS Feed if needed"
   (with-slots (current-feed current-item feeds-pane
                            items-pane body-pane) rss
                                        ;set the current-feed/item
     (setf current-feed (current-feed feeds-pane)
          current-item (current-item items-pane))
     (setf  (current-item body-pane) current-item)
                                        ;update if current-feed has changed.
     (when (not (equal current-feed (current-feed items-pane)))
       (get-items rss)
       (setf (current-feed items-pane) current-feed
            (items items-pane) (extract-items rss)))))

(defmethod shared-initialize :after ((rss rss-reader) foo &rest bar)
   "Sets up the initial feed pane"
   (declare (ignore foo bar))
   (setf (feeds-outline (feeds-pane rss))
        (extract-feeds rss)))

(defmethod render-on ((res response) (rss rss-reader))
   (<:table :width "100%" :style "{border:1px solid black}"
    (<:tr (<:td :rowspan 2 :valign "top" :width "20%" :style
"{border-right : 1px solid black}"
               (render-on res (feeds-pane rss)))
         (<:td (render-on res (items-pane rss))))
    (<:tr (<:td (<:hr)(render-on res (body-pane rss))))))




;;; ==============================
;;; EOF
