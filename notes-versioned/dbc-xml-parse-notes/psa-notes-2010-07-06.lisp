;;-*- Mode: LISP; Syntax: COMMON-LISP; Package: MON-SYS; Encoding: utf-8; Base: 10 -*-
;;;; psa-notes-2010-07-06.lisp

(in-package #:mon-sys)

;;; ==============================
;; (setf *psa-fl*  #P"/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/quick.xml")

;; (sax-extract-tr *psa-fl*)

(defparameter *sax-snk* nil)
(setq *sax-snk* (cxml:make-string-sink)) 
(close-xstream *sax-snk*)

(close-ystream *sax-snk*)(sink-ystream *sax-snk*))

(defparameter *kl-src* nil)
(setq *kl-src* (cxml:make-source *psa-fl*))

;; (cxml:parse *sax-snk* (make-instance 'psa-handler))

(get-output-stream-string *sax-snk*)

(klacks:peek *kl-src*)

;;(klacks:serialize-event <SOURCE> <HANDLER>

(unintern '*sax-snk*)

(klacks:close-source *sax-snk*)

(klacks:serialize-event *kl-src* *sax-snk*)
(klacks:serialize-event *kl-src* *sax-snk*)
(klacks:serialize-element *kl-src* *sax-snk*)
(cxml:make-broadcast-handler

(cxml:make-octet-stream-sink out)

klacks:current-lname
(klacks:find-event *kl-src* :end-document)

cxml:make-octet-stream-sink 

;;(when (string-equal "th" local-name)



(cxml:make-source *psa-fl**)
(input &key validate dtd root entity-resolver disallow-external-subset pathname)


(cxml:parse *curr-src* (make-instance 'psa-handler))



(klacks:make-tapping-source

(sax:characters *sink*  

(defparameter *my-tst* nil)
(setq *my-tst* (cxml:parse *psa-fl* (stp:make-builder)))


;;-*- Mode: LISP; Syntax: COMMON-LISP; Package: MY-PARSE-HTML; Encoding: utf-8; Base: 10 -*-
;;; ======================================================
;;; 
;;; :FILE-CREATED <Timestamp: #{2010-06-20T12:57:39-04:00Z}#{10247} - by MON>
;;; :FILE /home/sp/HG-Repos/CL-repo-HG/CL-NOTES/parsing-html-notes-2010-06-20
;;; :SOURCE (URL `http://groups.google.com/group/comp.lang.lisp/browse_frm/thread/40cd6d3ed01f3f80/50ddf7aec9763a2b?lnk=gst&q=html+parse#50ddf7aec9763a2b')
;;; ==============================
;;; CODE:

;;;; parsing-html-notes-2010-06-20

(in-package :cl-user)

(asdf:oos 'asdf:load-op :cxml)

(defpackage #:my-parse-html
  (:use #:common-lisp 
	#:cxml
	;; #:xuriella
	;; #:closure-html
	;; #:drakma
	))

(in-package #:my-parse-html)


;;; (dribble "/home/sp/stan-workspace/HG-Repos/CL-repo-HG/CL-MON-CODE/drakma-tests/mon-drakma-dribble")
;;; (asdf:oos 'asdf:load-op :drakma)
;;; (asdf:oos 'asdf:load-op :cxml)
;;; (asdf:oos 'asdf:load-op :closure-html)
;;; (asdf:oos 'asdf:load-op :cxml-stp)
;;; (defpackage :mon-parse-html (:use :cl :drakma :cxml))
;;; (in-package :mon-parse-html)
;;; *package*
;;; 
;;; (asdf:operate 'asdf:load-op :xuriella)

the two apis:
:STP-BASED
cxml-stp:make-builder
drakma:http-request
stp:element
stp:do-recursively
stp:local-name
chtml:parse
sax:default-handler

;; SAX-BASED - (streaming api for XML)
;; sax:attribute-local-name 
;; sax:attribute-value
;; sax:default-handler
;; sax:end-document
;; sax:start-element


;;; ==============================

(defclass links-and-images-handler (sax:default-handler)
  ((links-and-images :accessor links-and-images
                     :initform nil)))

(defmethod sax:end-document ((handler links-and-images-handler))
           (links-and-images handler))

(defmethod sax:start-element ((handler links-and-images-handler)
                                uri local-name qname attributes)
  (flet ((collect (element attribute)
           (when (string-equal element local-name)
             (let ((attribute
		       (find attribute attributes
                          :key #'sax:attribute-local-name
                          :test #'string-equal)))
               (when attribute
                 (push (sax:attribute-value attribute)
                       (links-and-images handler)))))))
    (collect "a" "href")
    (collect "img" "src")))

(defun sax-links-and-images (url)
  (chtml:parse (drakma:http-request url :want-stream t) ;; <- INPUT
               (make-instance 'links-and-images-handler) ;; <- HANDLER
	       ))

;; Here's the above code modified to accomodate situations where the class comes
;; after the href?

(defun http-links-with-class (url &aux links-and-images)  
  (flet ((collect (e class name attribute)    
           (when (equal (stp:local-name e) name)
             (when (equal (stp:attribute-value e "class") class)
               (let ((value (stp:attribute-value e attribute)))
                 (when (string-equal  "http://"
                                      (subseq value 0 7))
                   (push value links-and-images)))))))
    (stp:do-recursively (e (chtml:parse (drakma:http-request url)
                                        (cxml-stp:make-builder))
                           links-and-images)
      (when (typep e 'stp:element)
        (collect e "title" "a" "href")))))

;;; A SAX based version might look like this :
(defclass links-handler (sax:default-handler)
  ((links :accessor links
          :initform nil)))

(defmethod sax:end-document ((handler links-handler))
  (nreverse (links handler)))

(defmethod sax:start-element ((handler links-handler)
                               uri local-name qname attributes)
  (when (string-equal "a" local-name)
    (let ((attribute
           (find "href" attributes
                 :key #'sax:attribute-local-name
                 :test #'string-equal)))
      (when attribute
          (push (sax:attribute-value attribute)
                (links handler))))))

(defun sax-match-html-a-href (string)
  (chtml:parse string                           ;; <- INPUT
	       (make-instance 'links-handler))) ;; <- HANDLER

(defvar *page* (drakma:http-request "http://common-lisp.net"))  ;; page

(with-input-from-string (page *page*)
  (match-html-a page))

;;; ==============================
#|
:NOTE Following presents the code above in context:

Drew Crampsie
:NEWSGROUPS			comp.lang.lisp
:FROM:                      Drew Crampsie <dr...@tech.coop>
:DATE:                      Tue, 18 May 2010 15:29:28 -0700
:SUBJECT:                   Re: HTML Library

"Captain Obvious" <udode...@users.sourceforge.net> writes: 
> ??>> Have I mentioned parser?

> DC> No, but the OP did :

> DC> "Is there a library available to parse HTML ? I need to extract certain
> DC> tags like links and images from the body."

> I thought he might not know that you don't need to fully parse HTML to
> extract links and images from the body.

Let's say that was true, and that the OP was quite naive and had never
used regular expressions to extract data from text, or never thought to
apply regular expressions to this particular problem.

If that were the case, i think it would also be likely that the OP was
not all that familiar with regular expressions to begin with. I'm of the
opinion that this is unlikely, and the OP had already rejected regular
expressions as the wrong solution.

In the former case, learning regular expressions in order to extract
links and images from HTML is not something i would recommend.

> And I think I was pretty clear about that it is a half-assed
> solution. That's just an option.

It's a terrible solution, and i can't see why you're still defending
it.

> DC> My point is that, when someone asks for a parser, telling them that can
> DC> make a crappy half-assed one via regexps is a terrible bit of advice.

> I wrote that you can do this in "crappy half-assed way" without a
> parser at all. That it is a different thing.

> I used thing like that few times, it took me maybe 5 minutes to get it
> working and it was working 100% well (for a certain site).
> So what's wrong with it?

It took me a lot less to get mine working, and it works for more than
one site. If the site changes, mine will still extract the images and
links, yours will not. Also, mine was a complete and working piece of
code.

> DC> Or it might not... hiring cheap labour to do it by hand might work too
> DC> and will likely be the most robust of all... but the OP asked for a
> DC> parser.

> Well... Do you know that 95% of posts here on comp.lang.lisp which
> start with "Help me to fix this macro..." are not about macros but
> about a person not understanding something?

What you don't seem to understand is that regular expressions, for
extracting things from HTML, are almost always the wrong
solution. Similar to using a macro when a function is what is called
for, or using EVAL when a macro would do.

> It just might be that person looking for a parser can do thing he
> wants without a parser.

Since the OP is not around to comment on what their exact needs were, we
have to assume that, having long since chosen closure-html as the thing
that will do the thing he wants, the OP was in fact looking to do the
kind of things a parser does.

> If he really needs a parser, he can just ignore my comment and listen
> to people who have provided links to various parsers.

As they did.

> So what's wrong with it, really?

What worries me is not so much that the OP might have taken your advice,
but rather that you thought it was good advice to give. My contrary
demonstrations are as much for your benefit as for those who may still
be following this thread.

> ??>>>> It usually works very well when you need to scrap a certain site,
> ??>>>> not "sites in general".

> DC> So, if you'd like your code to work more than once, avoid regexps?
> DC>  I can agree with you there.

> Well, I don't know what he is doing.

Seemed to me like he was trying to extract links and images and the like
from html.

> Sometimes people need to scrap a
> certain site or few of them.

'scrape', scrap is what i'd do to your code if you tried to get it past
review.

> Regexes are fine for that.

If you want to write brittle code that is prone to breakage and only
works on one site as long as that site stays relatively static, rather
than fairly solid code that works on a majority of sites that are
allowed to change significantly, and you don't know anything about how
to use HTML parsers and the surrounding toolsets, i'd still recommend
you learn to use the right tools for the job.

> They might get broken if they change layout
> on the site.

Indeed they might.

> But parser-based solution might get broken too (that is, way you need
> to traverse DOM changes).

This is nonsense. For extracting links and images (that is, a and img
tags, and their attributes, in a useful data structure), a parser based
solution will track html changes significantly better than a regular
expression based solution.

For any scraping task where the specifics of the document structure are
involved, either solution is going to have problems.. so what are you
trying to say? That changes in input structure may break code that depends on
it? Hardly an argument for regexps.

> ??>> Therefore, it is complex and is probably more error prone. Also,
> ??>> slower.

> DC> Non sequitur ... and absolute bollocks.

> Of course it might be the other way around, but, generally, more
> complex things are more prone to errors.

CXML and companion libraries are excellent code that is well tested, and
the problem they solve (xml parsing, manipulation, and unparsing) is not
that difficult.

The closer-html library is able to understand more HTML, and allow the
user to do more with the data with less code, than the solutions you've
presented.

> And also when you extract more information and do it in more complex
> way that takes more time.

  You have not shown that it takes significantly more time or is any
  more complex for a task of reasonable size.

  For any less complex tasks, regular expressions themselves are too
  complex and take too much time. Read on and i will be happy to show
  this.

> E.g. if it is DOM-based parser, I'm pretty sure that full DOM of a
> page takes more memory than a bunch of links.

If you knew anything about the topic at hand, you'd know that there are
many many solutions for XML that do not involve a 'full DOM'. SAX, for
example... the 'Streaming API for XML'.

Here is a modification of my previous code (which was not DOM based, so
enough about DOM) to use the SAX interface and not create a data
structure that represents the entire document :
|#

(defclass links-and-images-handler (sax:default-handler)
  ((links-and-images :accessor links-and-images
                     :initform nil)))

(defmethod sax:end-document ((handler links-and-images-handler))
           (links-and-images handler))

(defmethod sax:start-element ((handler links-and-images-handler)
                                uri local-name qname attributes)
  (flet ((collect (element attribute)
           (when (string-equal element local-name)
             (let ((attribute
                    (find attribute attributes
                          :key #'sax:attribute-local-name
                          :test #'string-equal)))
               (when attribute
                 (push (sax:attribute-value attribute)
                       (links-and-images handler)))))))
    (collect "a" "href")
    (collect "img" "src")))

(defun sax-links-and-images (url)
  (chtml:parse (drakma:http-request url :want-stream t)
               (make-instance 'links-and-images-handler)))

#|
Also notice that it doesn't even make a string out of the webpage
itself, but rather reads from the stream and parses it
incrementally. I'm sure that having to read the entire file into
memory in order run a regular expression over it is going to take more
memory than, well, not doing that.

> DC> I applaud your use of the sexp syntax for regexps, but, this
> DC> following code actually fetches any given webpage from the
> DC> internet and collects images and links, something similar to what
> DC> the OP may have wanted.

> DC> (defun links-and-images (url &aux links-and-images)
> DC>   (flet ((collect (e name attribute)
> DC>     (when (equal (stp:local-name e) name)
> DC>       (push (stp:attribute-value e attribute)
> DC>      links-and-images))))
> DC>     (stp:do-recursively (e (chtml:parse (drakma:http-request url)
> DC>      (cxml-stp:make-builder)))
> DC>       (when (typep e 'stp:element)
> DC>  (collect e "a" "href")
> DC>  (collect e "img" "src")))
> DC>     links-and-images))

> DC> Does more, actually readable and works for a significantly larger
> DC> portion of the interwebs.

> Well, you see, I was not interested in all links on that page, I was
> interested only on those with class "title" and are http:// links.
> So regex says exactly that.

Does it now? What if the class comes after the href?

Ok, here's that code modified to your new spec:
|#

(defun http-links-with-class (url &aux links-and-images)  
  (flet ((collect (e class name attribute)    
           (when (equal (stp:local-name e) name)
             (when (equal (stp:attribute-value e "class") class)
               (let ((value (stp:attribute-value e attribute)))
                 (when (string-equal  "http://"
                                      (subseq value 0 7))
                   (push value links-and-images)))))))
    (stp:do-recursively (e (chtml:parse (drakma:http-request url)
                                        (cxml-stp:make-builder))
                           links-and-images)
      (when (typep e 'stp:element)
        (collect e "title" "a" "href")))))
#|
Please note that it actually works for a greater percentage of pages,
including those where the class attribute is not directly before the
href attribute.

[snip]

> If you use regex like this to get a tags: <a\s[^>]+> -- I honestly
> don't see a lot of ways how it can get broken.
> In fact, I don't see any.

If that's all you want to achieve, why bother with regular
expression at all?

It's complex, and more error prone, and therefore slower, than a
hand-rolled function :
|#

(defvar *page* (drakma:http-request "http://common-lisp.net"))
 
(defun match-html-a (stream)
  (declare (optimize (speed 3) (space 3)))
  (loop
     :for char := (read-char stream nil)
     :while char
     :when (and (eql char #\<)
                (member (peek-char nil stream) '(#\a #\A)))
     :collect (loop
                 :for char := (read-char stream nil)
                 :while char :collect char into stack
                 :until (eql char #\>)
                 :finally (return (coerce (cons #\< stack) 'string)))))

(locally (declare (optimize (speed 3) (space 3)))
  (let ((scanner (cl-ppcre:create-scanner
                  "<a\\s[^>]*>"
                  :case-insensitive-mode t
                  :multi-line-mode t)))    
    (defun ppcre-match-html-a (string)
      (nreverse
       (let (links)
         (cl-ppcre:do-matches-as-strings
             (string scanner string links)
           (push string links)))))))

#|
CL-USER> (equalp (ppcre-match-html-a *page*)
                 (with-input-from-string (s *page*)
                   (match-html-a s)))
=> T

CL-USER> (time (dotimes (n 1024)
                 (with-input-from-string (page *page*)
                   (match-html-a page))))

Evaluation took:
  0.778 seconds of real time
  0.776049 seconds of total run time (0.776049 user, 0.000000 system)
  [ Run times consist of 0.044 seconds GC time,
    and 0.733 seconds non-GC time. ]
  99.74% CPU
  1,553,424,264 processor cycles
  63,615,928 bytes consed

NIL
CL-USER> (time (dotimes (n 1024)
                 (ppcre-match-html-a *page*)))

Evaluation took:
  1.612 seconds of real time
  1.612101 seconds of total run time (1.608101 user, 0.004000 system)
  [ Run times consist of 0.024 seconds GC time,
    and 1.589 seconds non-GC time. ]
  100.00% CPU
  3,214,872,948 processor cycles
  47,587,008 bytes consed

NIL
CL-USER> (time (dotimes (n 1024)
                 (with-input-from-string (page *page*)
                   ;level the playing field
                   (ppcre-match-html-a *page*))))

Evaluation took:
  1.942 seconds of real time
  1.948122 seconds of total run time (1.948122 user, 0.000000 system)
  [ Run times consist of 0.044 seconds GC time,
    and 1.905 seconds non-GC time. ]
  100.31% CPU
  3,874,149,564 processor cycles
  85,368,544 bytes consed

NIL
CL-USER>

> Well, I wrote this in 5 seconds, if I'd
> think on it for a hour or so I think I'll have absolutely bulletproof
> link-extracting regex.

MATCH-HTML-A took a little longer than 5 seconds, but not much, and i
didn't have to use regular expressions, which in this case add
complexity.

> Good thing about it is that it absolutely does not care about
> context. It might be also a bad thing, depending on what's you doing.
> So I don't agree on "smaller portion." Fixing HTML is general is
> harder than fixing for a specific task.

The thing is, we want context at some point. All we have now is a list
of string that look like "<a ... >". If we want to extract the actual
href, we have to work a little bit harder :
|#

 ;; CL-USER> (with-input-from-string (page *page*)
;;            (match-html-a page))
;; ("<a href=\"http://www.lisp.org/\">"
;;  "<a href=\"http://www.cliki.net/\">"
;;  "<a href=\"http://planet.lisp.org/\">" ...)

(let ((scanner (cl-ppcre:create-scanner "\\s+" :multi-line-mode t)))
  (defun match-a-href-value (string)
    (dolist (attribute (cl-ppcre:split scanner  string))
      (when (and (> (length attribute) 5)
                 (string-equal
                  (subseq attribute 0 4) "href"))
        (return-from match-a-href-value
          (second (split-sequence:split-sequence
                   #\" attribute )))))))

(defun linear-match-a-href (string)
  (mapcar #'match-a-href-value  
          (ppcre-match-html-a string)))
#|
CL-USER> (linear-match-a-href *page*)
("http://www.lisp.org/"
 "http://www.cliki.net/"
 "http://planet.lisp.org/" ...)

CL-USER> (time (dotimes (n 1024)
                 (linear-match-a-href *page*)))

Evaluation took:
  2.529 seconds of real time
  2.528158 seconds of total run time (2.528158 user, 0.000000 system)
  [ Run times consist of 0.032 seconds GC time,
    and 2.497 seconds non-GC time. ]
  99.96% CPU
  5,043,773,340 processor cycles
  77,095,968 bytes consed

Maybe that's not the best way to do that, but that's the naive
ad-hoc implementation i came up with of the top of my head.

A SAX based version might look like this :
|#

(defclass links-handler (sax:default-handler)
  ((links :accessor links
          :initform nil)))

(defmethod sax:end-document ((handler links-handler))
  (nreverse (links handler)))

(defmethod sax:start-element ((handler links-handler)
                               uri local-name qname attributes)
  (when (string-equal "a" local-name)
    (let ((attribute
           (find "href" attributes
                 :key #'sax:attribute-local-name
                 :test #'string-equal)))
      (when attribute
          (push (sax:attribute-value attribute)
                (links handler))))))

(defun sax-match-html-a-href (string)
  (chtml:parse string (make-instance 'links-handler)))

#|
CL-USER> (time (dotimes (n 1024)
                 (sax-match-html-a-href *page*)))

Evaluation took:
  2.959 seconds of real time
  2.952185 seconds of total run time (2.904182 user, 0.048003 system)
  [ Run times consist of 0.160 seconds GC time,
    and 2.793 seconds non-GC time. ]
  99.76% CPU
  5,903,549,172 processor cycles
  282,859,128 bytes consed

Those run times are comparable, and if we're not storing the web pages
in memory, the differences will be lost in the i/o latency. At this
point, the regexp based solution starts to take on the characteristics
of a parser, and also becomes more prone to error as it requires new
untested code.

So what is the advantage of the half assed regular expression based
solution?

It's not code size, nor run time, nor ease of use. Only for a very
simple task like this one is the amount of effort anywhere near
comparable.

> DC> As i previously stated, i think that's horrible advice.

> Ok, ok, I get it. But it is just your opinion :)

One that i can back up with experience, and actual code. If you'd ever
had to work with some other coder's regexp-based pseudo-parser, or even
your own if you've made that mistake (as i have), you'd recognize it is
as a good opinion.

[snipped more DOM-related nonsense]

> DC> “Whenever faced with a problem, some people say `Lets use AWK.'
> DC>   Now, they have two problems.” -- D. Tilbrook

> Overly simplistic regexes are inferior to formal parsers, but HTML as
> people use it is not formally defined, so it is inapplicable here.

This is fallacious as well. The HTML that CLOSURE-HTML is designed to
parse is the HTML as people use it. Just as an ad-hoc regular expression
will attempt to extract meaning from improperly structured HTML, so does
the parser behind CHTML:PARSE.

It is possible to construct input that chtml rejects but an ad-hoc
regexp based solution might accept, just as i can easily construct a
string that the regular expression will reject but a hand-rolled
solution will accept. This proves nothing, unless you can make an
argument that the hand-rolled solution is in fact a better solution than
CLOSURE-HTML. That i'd be willing to listen to.

Obviously, the solution that works is better than the one that
doesn't. In the case where two tools are arguably equally good (the very
simple case we presented above), using the one that is designed for the
job is most likely, in all cases, going to be the right idea.

If you'll indulge me one more cliché

"It is tempting, if the only tool you have is a hammer, to treat
everything as if it were a nail."
 -- Abraham Maslow, 1966

Cheers,
drewc 
|#
;; :SEE (URL `http://weitz.de/drakma/')
;; :SEE (URL `http://www.cliki.net/closure-html')
;; :SEE (URL `http://common-lisp.net/project/closure/closure-html/examples.html')
;; :SEE (URL `http://www.cliki.net/cxml')
;; :SEE (URL `http://www.lichteblau.com/cxml-stp/')
;; :SEE (URL `http://www.cliki.net/CL-HTML-Parse')
;; :SEE (URL `http://common-lisp.net/project/xmls/xmls-1.3.tar.gz')
;; :SEE (URL `http://groups.google.no/group/comp.lang.lisp/msg/cda1a24ac3b50a43')
;; :SEE (URL `http://www.codinghorror.com/blog/2009/11/parsing-html-the-cthulhu-way.html')
;; :SEE (URL `http://deepaksurti.com/lisp/drakma.html')

;;; ==============================
;;; :DOCUMENTATION
;;; /home/sp/HG-Repos/CL-repo-HG/CL-SYSTEMS/clbuild/source/closure-html/doc/index.html
;;; /home/sp/HG-Repos/CL-repo-HG/CL-SYSTEMS/clbuild/source/cxml-stp/tutorial/index.html
;;; /home/sp/HG-Repos/CL-repo-HG/CL-SYSTEMS/clbuild/source/cxml/doc/index.html
;;; /home/sp/HG-Repos/CL-repo-HG/CL-SYSTEMS/clbuild/source/cxml-rng/index.html
;;; /home/sp/HG-Repos/CL-repo-HG/CL-SYSTEMS/clbuild/source/drakma/doc/index.html
;;; /home/sp/HG-Repos/CL-repo-HG/CL-SYSTEMS/clbuild/source/plexippus-xpath/doc/index.html
;;; /home/sp/HG-Repos/CL-repo-HG/CL-SYSTEMS/clbuild/source/xuriella/doc/index.html
;;; ==============================

:SEe (URL `http://groups.google.com/group/comp.lang.lisp/browse_frm/thread/ae64a435c3f4d37f/0dfdbaea2806cc81?lnk=gst&q=SAX#0dfdbaea2806cc81')
	
10.  David Lichteblau   	
Newsgroups: comp.lang.lisp
From: David Lichteblau <usenet-2...@lichteblau.com>
Date: 16 Apr 2008 11:42:58 GMT
Local: Wed, Apr 16 2008 7:42 am
Subject: Re: XML generator
On 2008-04-16, Jeff Shrager <JShra...@gmail.com> wrote:

> You'd think that this would be an obviously solved problem, and that
> someone would have actually DOCUMENTED it.. but apparently not. Anyone
> care to give a brief explanation with working examples of how to
> actually do lisp-based XML generation. I'm sure it's done a thousand
> times a day, but I can't seem to make it work.

Let me give you the answer for XML serialization using Closure XML.

As for documentation, some of this is explained well in cxml's
documentation (I hope), but perhaps the layering isn't documented as
well as it should be.

(Scroll down to "Serializing Lisp lists" for the answer to your original
question.)

Lowest level: Serialization using SAX
-------------------------------------

At the lowest level, serialization is the inverse of parsing.

Instead of having the parser generate SAX events to a DOM builder while
parsing the document, here user code generates SAX events, sends them to
a `serialization sink', which writes XML for each event that it receives.

An XML document needs to contain a root element, so the minimal sequence
of events for a complete XML document is START-DOCUMENT, START-ELEMENT,
END-ELEMENT, END-DOCUMENT.

Example:

CL-USER> (let ((sink (cxml:make-string-sink)))
           (sax:start-document sink)                                            
           (sax:start-element sink "" "test" "test" nil)                        
           (sax:characters sink " abc ")                                        
           (sax:end-element sink "" "test" "test")                              
           (sax:end-document sink))

"<?xml version=\"1.0\" encoding=\"UTF-8\"?>                                    
<test> abc </test>"                                                            

By convention, END-DOCUMENT is the function that retries the "result" of
a SAX handler.  In this case, the string sink returns the accumulated
document as a string.

Obviously, SAX-based serialization is not something you would do
manually.  Instead, it serves as a building block for higher-level APIs.

Higher Level: Convenience functions and macros
----------------------------------------------

One higher-level API making use of the SAX layer is the WITH-ELEMENT set
of convenience macros and functions.

Example:

CL-USER> (cxml:with-xml-output (cxml:make-string-sink)                          
           (cxml:with-element "test"                                            
             (cxml:text " abc ")))

"<?xml version=\"1.0\" encoding=\"UTF-8\"?>                                    
<test> abc </test>"                                                            

Here, WITH-XML-OUTPUT calls START-DOCUMENT and END-DOCUMENT for you, and
WITH-ELEMENT calls START-ELEMENT and END-ELEMENT.

(Actually, the implementation is slightly more clever than that: The
START-ELEMENT event is delayed until the first child is seen, so that
we know that all calls to CXML:ATTRIBUTE have been seen.)

I've called this API the "convenience layer" because it's more
convenient than manual SAX calls.  But admittedly it is still more
verbose than some other macros for XML-syntax-in-Lisp stuff.

(Personally I actually use WITH-ELEMENT at lot though.  I like it,
because it integrates into normal Lisp code a little better than, say,
net.html.generator, and has somewhat more obvious semantics.)

Side note: Parse HTML to a sink directly
----------------------------------------

Here's some silly toy code, just to illustrate the possibilities:

Since the parser sends SAX events, and a sink serializes SAX events, we
can connect parser and serialization sink directly, without building an
intermediate representation.

Example:

CL-USER> (cxml:parse "<test> abc&#10;def </test>"
                     (cxml:make-string-sink))

"<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<test> abc
def </test>"

(I've included a character reference for newline there just to
illustrate that the parser actually did something here.  But except for
character and entity references, which will have been resolved, this
example doesn't actually do anything interesting, of course.)

Okay, so now you're wondering what the example is about then.
There's actually a cute use case for this:

If you're parsing with Closure HTML (rather than Closure XML), and send
events to an XML sink, you've got an HTML cleanup program that converts
broken HTML into well-formed XHTML.

And it's a one-liner!  Here it is:
  (chtml:parse #p"test.html" (cxml:make-string-sink))

Or in the opposite direction: Work with XML/XHTML internally, then as
the very last step before sending it to the browser, send events to an
HTML sink (e.g., chtml:make-string-sink), which writes HTML rather than
XML.  Same API, different output format.

Serializing in-memory-representations
-------------------------------------

It should be obvious now how DOM is serialized: There's a function mapping
the DOM structure, sending SAX events for the nodes it sees.

(Let me give you the example using STP instead of DOM, because it like
it better.)

CL-USER> (stp:serialize (stp:make-document (stp:make-element "test"))
                        (cxml:make-string-sink))

"<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<test/>"

Serializing Lisp lists
----------------------

And here is the example you've been waiting for: Serializing a lisp list
structure.

Technically, this is just another example for the serialization of
in-memory representations: But this time we're using cxml's
compatibility package for XMLS.

An XMLS list looks like this:
  ("name" (...attributes...) ...children...)

CL-USER> (defparameter *example*
           `("test" () " abc "))
*EXAMPLE*

So let's serialize that:

CL-USER> (cxml-xmls:map-node (cxml:make-string-sink)
                             *example*
                             :include-namespace-uri nil)
"<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<test> abc </test>"

(What's the include-namespace-uri business for?  The xmls compatibility
is beginning to diverge from xmls here, since xmls has only rather, uh,
`incomplete' support for namespace.  By default, we expect conses of
name and namespace URI rather than strings in the CAR position of the
element.  Some of this code is a bit in a state of flux.  If you've got
trouble with xmls compatibility currently, please report it, so that we
can fix those issues.)

More about sinks
----------------

What kind of sinks are there?

We've already mentioned the difference between HTML syntax sinks and XML
syntax sinks, i.e.  cxml:make-string-sink vs chtml:make-string-sink.

But there are also different sink classes in both packages:

  make-string-sink            Creates a vector of (character)        
  make-character-stream-sink  Writes to a stream/file
  make-octet-vector-sink      Creates a vector of (unsigned-byte 8)
  make-octet-stream-sink      Writes to a stream/file

(plus some weirder classes with support for Lisps without Unicode.)

Note: the latter two streams handle encoding to UTF-8 for you (and in
the upcoming cxml release encoding to any user-specified encoding
supported by Babel.)

The former two streams don't encode anything, so you get unicode Lisp
characters.

Conclusion
----------

I hope this article clears up the layering of serialization features in
cxml.

It is easy to write your own higher-level code based on sinks.  If the
existing WITH-ELEMENT isn't your favourite API, make your own!  The
sinks solve all the hard problems, and you get to define the API you
like in few more lines on top of that.

Similarly, if the existing xmls-compat list structures aren't what you
want, just copy&paste the code to creates your own version of that.
(Edi Weitz did just that for cl-webdav!)

So, perhaps someone would like to write a cl-quasiquote backend for cxml
sinks?

d.

PS Personally I am a big fan of XSLT though.  So I'd never use
WITH-ELEMENT to generate all of my HTML.  I just generate small XML
snippets containing the data, then send that through XSLT stylesheets to
turn it into formatted XML or HTML.  Nothing beats XML documents for XML
generation.

;;; ==============================
;; Closure HTML

;;     * Installing Closure HTML
;;           o Download
;;           o Installation
;;     * Examples
       
;;     * API documentation

;; Closure HTML Examples

;; Simple examples using Closure HTML.

;;     * Parsing a string
;;     * Parsing a file
;;     * Cleaning up broken HTML
;;     * Translating an HTML file to XHTML
;;     * Translating an XHTML file to HTML
;;     * Fetching and parsing Google search results

;; Note on non-Unicode Lisps: The examples on this page were written for Lisps with
;; Unicode support. When using Closure HTML on Lisps without Unicode characters,
;; some changes need to be made. For example, make-string-sink is not available
;; without Unicode support, but make-string-sink/utf8 can be substituted in some of
;; the examples.

;; Parsing a string
 
;; In this example
;; chtml:parse
;; chtml:make-lhtml-builder
;; chtml:serialize-lhtml
;; chtml:make-string-sink

;; Parse into LHTML:

(chtml:parse "<p>nada</p>" (chtml:make-lhtml-builder))

;; => (:HTML NIL (:HEAD NIL) (:BODY NIL (:P NIL "nada")))

;; Serialize LHTML back into a string:

(chtml:serialize-lhtml * (chtml:make-string-sink))

;; => "<HTML><HEAD></HEAD><BODY><P>nada</P></BODY></HTML>"

;; Parsing a file
 
;; In this example
;; chtml:parse
;; chtml:make-lhtml-builder

;; Note that the filename must be passed as a pathname (written using #p), not just
;; a string, because a string would be interpreted as a literal HTML document as in
;; the first example above.

(chtml:parse #p"example.html" (chtml:make-lhtml-builder))

;; => (:HTML NIL (:HEAD NIL) (:BODY NIL (:P NIL "nada")))

;; Cleaning up broken HTML
 
;; In this example
;; chtml:parse
;; chtml:make-string-sink

;; Many HTML syntax errors are corrected by Closure HTML automatically. In this
;; example, we parse from a string and serialize it back immediately.

(defun clean-html (string)
  (chtml:parse string (chtml:make-string-sink)))

;; => CLEAN-HTML

;; Note the differences between input and output in the following document:

;;     * <title> is moved into <head>.
;;     * The bogus attribute is removed.
;;     * <br is corrected to <br> and </oops> to </p>.

* (clean-html "<title>cleanup example</title>
<p bogus>
<br
</oops>")

;; => "<HTML><HEAD><TITLE>cleanup example</TITLE></HEAD><BODY><P>
;; <BR></P></BODY></HTML>"

;; Translating an HTML file to XHTML
 
;; In this example
;; chtml:parse
;; cxml:make-octet-stream-sink

;; In this example, we parse an HTML file and serialize it into XHTML.

;; This example uses Closure XML.

(defun html2xhtml (file &key (if-exists :error))
  (with-open-file (out (make-pathname :type "xml" :defaults file)
                     :element-type '(unsigned-byte 8)
                     :if-exists if-exists
                     :direction :output)
     (chtml:parse (pathname file)
               (cxml:make-octet-stream-sink out))))

;; => HTML2XHTML

;; Use like this:

;; * (html2xhtml "/home/david/test.html" :if-exists :supersede)

;; The following input file and its XHTML version illustrate some of the
;; differences between the two syntaxes.

;; test.html:

;; <p>foo</p>
;; <br>
;; <br>
;; <br>
;; <select>
;; <option selected>123
;; <option>456
;; </select>

;; test.xml:

;; <?xml version="1.0" encoding="UTF-8"?>
;; <html xmlns="http://www.w3.org/1999/xhtml"><head/><body><p>foo</p>
;; <br/>
;; <br/>
;; <br/>
;; <select><option selected="selected">123
;; </option><option>456
;; </option></select>
;; </body></html>

;; Translating an XHTML file to HTML
 
;; In this example
;; chtml:make-octet-stream-sink
;; cxml:parse

;; This is a continuation of the opposite example above. In that example, we
;; converted an HTML file to HTML. Going back to HTML is just as easy:


(defun xhtml2html (file &key (if-exists :error))
  (with-open-file (out (make-pathname :type "html" :defaults file)
                       :element-type '(unsigned-byte 8)
                       :if-exists if-exists
                       :direction :output)
    (cxml:parse (pathname file)
                (chtml:make-octet-stream-sink out))))


;; => XHTML2HTML

;; Running this function on the example above results in a clean-up version of the
;; original document:

;; test.html:

;; <html><head></head><body><p>foo</p>
;; <br>
;; <br>
;; <br>
;; <select><option selected>123
;; </option><option>456
;; </option></select>
;; </body></html>

;; Fetching and parsing Google search results
 
;; In this example
;; chtml:parse
;; drakma:http-request
;; cxml-stp:make-builder
;; cxml-stp:do-recursively
;; cxml-stp:element
;; cxml-stp:local-name
;; cxml-stp:attribute-value


;; In this example, we perform a google search and print the first ten results by
;; looking for all links of the form <a class="l">.

;; This example uses Drakma to perform the HTTP request, and the DOM alternative
;; cxml-stp.


(defun show-google-hits (term)
    (let* ((query (list (cons "q" term)))
	   (str (drakma:http-request "http://www.google.com/search"
				     :parameters query))
	   (document (chtml:parse str (cxml-stp:make-builder))))
      (stp:do-recursively (a document)
	(when (and (typep a 'stp:element)
		   (equal (stp:local-name a) "a")
		   (equal (stp:attribute-value a "class") "l"))
	  (format t "~A:~%  ~A~%~%"
		  (stp:string-value a)
		  (stp:attribute-value a "href"))))))

;; => SHOW-GOOGLE-HITS

;; Searching for "lisp" we get these results:

(show-google-hits "lisp")

;; => Lisp (programming language) - Wikipedia, the free encyclopedia:
;;   http://en.wikipedia.org/wiki/Lisp_programming_language

;; Lisp - Wikipedia, the free encyclopedia:
;;   http://en.wikipedia.org/wiki/Lisp

;; Association of Lisp Users:
;;   http://www.lisp.org/

;; An Introduction and Tutorial for Common Lisp:
;;   http://www.apl.jhu.edu/~hall/lisp.html

;; Lisp:
;;   http://www.paulgraham.com/lisp.html

;; The Roots of Lisp:
;;   http://www.paulgraham.com/rootsoflisp.html

;; Planet Lisp:
;;   http://planet.lisp.org/

;; Practical Common Lisp:
;;   http://www.gigamonkeys.com/book/

;; CLISP - an ANSI Common Lisp Implementation:
;;   http://clisp.cons.org/

;; Lisp FAQ:
;;   http://www.cs.cmu.edu/Groups/AI/html/faqs/lang/lisp/top.html

;;; ==============================

Note that the filename must be passed as a pathname (written using #p), not
just a string, because a string would be interpreted as a literal HTML document
as in the first example above.

(chtml:parse #p"example.html" (chtml:make-lhtml-builder))

(chtml:parse 
 ;; #P"/home/sp/HG-Repos/sportscards-HG/1961-psa-pop-scrapes/1961-print-detail-TD2.html
 #P "/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/1961-print-detail.html"
 (chtml:make-lhtml-builder))


(setq *example* 
      (cxml:make-source  
       ;;#p"/home/sp/HG-Repos/sportscards-HG/1961-psa-pop-scrapes/1961-print-detail-TD2.html") )
       #P"/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/1961-print-detail.xml"))

;; (setf cxml:*catalog* (cxml:make-catalog))
;; ("/etc/xml/catalog" "/usr/local/share/xml/catalog.ports") 

;; (setf cxml:*catalog* (cxml:make-catalog))
;; (cxml:parse-file "test.xhtml" (cxml-dom:make-dom-builder))

;;; ==============================
(defun html2xhtml (file &key (if-exists :error))
  (with-open-file (out (make-pathname :type "xml" :defaults file)
		       :element-type '(unsigned-byte 8)
		       :if-exists if-exists
		       :direction :output)
    (chtml:parse (pathname file)
		 (cxml:make-octet-stream-sink out))))

(html2xhtml 
 "/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/1961-print-detail.html" 
 :if-exists :supersede)

;;; ==============================
;; parse the file xml fil to an xml structur and write it to disk.
(setq *eg-fl* ;;*example*
      ;;#p"/home/sp/HG-Repos/sportscards-HG/1961-psa-pop-scrapes/1961-print-detail-TD2.html") )
      ;; (cxml:make-source 
      #P"/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/1961-print-detail.xml")

(defparameter *example*
  (cxml:parse *eg-fl* (cxml:make-source-xmls:make-xmls-builder :include-namespace-uri nil)))


(defparameter *example* 
  (cxml:parse *eg-fl* 
(open-stream-p *example*)

(defparameter *example*
  (cxml:make-source *eg-fl* :root "table") )
		  

(klacks:close-source *example* )

;; This will round trip it back to html:
(cxml-xmls:map-node (cxml:make-string-sink)
                             *example*
                             :include-namespace-uri nil)

(with-open-file (s (make-pathname 
		    :name "dump-1961"
		    :type "lisp"
		    :directory (pathname-directory *eg-fl*))
		   :direction :output
		   :if-exists :supersede)
  (prin1 *example* s))


;;; ==============================
(defun write-xml (stream node &key indent)
  (let ((sink (cxml:make-character-stream-sink
               stream :canonical nil :indentation indent)))
    (cxml-xmls:map-node sink node)))

(with-open-file (s (make-pathname 
		    :name "dump-1961"
		    :type "lisp"
		    :directory (pathname-directory *eg-fl*))
		   :direction :output
		   :if-exists :supersede)
  (prin1 *example* s))

;;; ==============================
(let ((sink (cxml:make-character-stream-sink *standard-output*)))
  (sax:start-document sink)
  )

(cxml-xmls:map-node  (cxml:make-string-sink)
		     *example*
		    :include-namespace-uri nil)

(klacks:serialize-element *source* (cxml-xmls:make-xmls-builder))

(klacks:find-element )




(defparameter *example*
  (cxml:parse *eg-fl* (cxml-xmls:make-xmls-builder :include-namespace-uri nil)))
(klacks:get-attribute *example* "table")





;;(cxml:with-output-sink  

;;; ==============================
;; input  <--- source
;; output ---> sink
;; element => <tag> 
;; event   => attribute

(defparameter *eg-fl*
  ;; #P"/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/1961-print-detail.xml")
  #P"/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/quick.xml")
    
(defparameter *example* (cxml:make-source *eg-fl* :validate nil )); :root)) 

(cxml::source-stream-name *example*)

(cxml::source-stream-name *example*)
;=> [main document :MAIN file://+/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/1961-print-detail.xml]

(klacks:current-system-id *example*)
#<PURI:URI file://+/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/quick.xml>

(klacks:close-source *example*)

(when (klacks:find-element *example* "caption")
  (klacks:current-characters *example*))

(klacks:find-event *example* "scope")

(klacks:peek *example*)  

(klacks:peek-next *example*)

(klacks:current-uri *example*)
(klacks:current-qname *example*)
(klacks:current-lname *example*)
(klacks:current-line-number *example*)
klacks:
(klacks:LIST-ATTRIBUTES )

(klacks:GET-ATTRIBUTE "class" *example*)

(find
(klacks:map-attributes #'
sax:characters
;;; ==============================
;;; using DOM:
(with-open-file (s "example.xml" :direction :output)
    (write-string "<test a='b'><child/></test>" s))

(defparameter *example* (cxml:parse-file "example.xml" (cxml-dom:make-dom-builder)))

(dom:document-element *example*)
;;=> #<RUNE-DOM::ELEMENT test {AD1AD99}>

;; (dom:tag-name (dom:document-element *example*))
;; => test

(dom:child-nodes (dom:document-element *example*))
; => #(#<RUNE-DOM::ELEMENT child {AD1BBA1}>)

(dom:get-attribute (dom:document-element *example*) "a")
;=> b

;;; Serialize the DOM document back into a file

(with-open-file (out "example.out" :direction :output :element-type '(unsigned-byte 8))
  (dom:map-document (cxml:make-octet-stream-sink out) *example*))

;; => #<SB-SYS:FD-STREAM for "file /home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/example.out" {BDA3001}>

cxml-xmls:map-node

(cxml:parse-file "example.xml" (cxml-dom:make-dom-builder ))

;; cxml-stp is class based.
 
(cxml:parse #p"quick.xml" (stp:make-builder))

;; (setq slime-use-autodoc-mode nil)

;;; ==============================
(defparameter *eg-fl*
  ;; #P"/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/1961-print-detail.xml")
  #P"/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/quick.xml")

(defparameter *example* nil)

;; TD
(defclass psa-handler (sax:default-handler)
  ((td :accessor td 
       :initform nil)
   (tr :accessor tr 
       :initform nil)
   (chars :accessor chars
  	  :initform nil)
   (gthr :accessor gthr
	 :initform nil)
   ))

(defmethod sax:end-document ((handler psa-handler))
  (nreverse (gthr handler)))

(defmethod sax:start-element ((handler psa-handler)
                                uri local-name qname attributes)
  (flet ((collect (element attribute)
	   ;; (element attribute frmtr) ;; "~
           (when (string-equal element local-name)
             (let ((attribute
                    (find attribute attributes
                          :key #'sax:attribute-local-name
                          :test #'string-equal)))
               (when attribute
                 (push `(,(format nil ":~A" (string-upcase local-name))
			  ,(format nil ":~A" (string-upcase (sax:attribute-local-name attribute)))
			  ,(sax:attribute-value attribute))
		       (gthr handler)))))))
    (collect "td" "class")
    (collect "td" "align")
    (collect "tr" "valign")
    (collect "tr" "class")))

(defmethod sax:characters   ((handler psa-handler) schars)
  (let ((cln-chars schars))
    (if (string-equal cln-chars #\NO-BREAK_SPACE)
	(progn (setf cln-chars nil)
	       (push cln-chars (gthr handler)))
	(progn 
	  (setf cln-chars (string-left-trim '(#\Space) cln-chars))
	  (push (format nil "~a" cln-chars)
		(gthr handler))))))

(sax-match-td *eg-fl*)

;;; ==============================
;;; alternative gathered into per tr lists
(defparameter *eg-fl*
  ;; #P"/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/1961-print-detail.xml")
  #P"/home/sp/HG-Repos/sportscards-HG/sportscards-PSA-related-2010-04-09/quick.xml")

(defparameter *tr-gthr* nil)

(defclass psa-handler (sax:default-handler)
  ((td :accessor td 
       :initform nil)
   (tr :accessor tr 
       :initform nil)
   (chars :accessor chars
  	  :initform nil)
   (gthr :accessor gthr
	 :initform nil)
   ))

;;(defparameter *bug-eg-class* (make-instance 'psa-handler)

(defmethod sax:start-element ((handler psa-handler)
			      uri local-name qname attributes)
  (when (string-equal "tr" local-name)
    (setf *tr-gthr* nil)))

(defmethod sax:end-element  ((handler psa-handler) 
			     uri local-name qname)
  (when (string-equal "tr" local-name)
    (setf *tr-gthr* (nreverse *tr-gthr*))
    (push *tr-gthr* (gthr handler))))

(defmethod sax:characters   ((handler psa-handler) schars)
  (let ((cln-chars schars))
    (if (string-equal cln-chars #\NO-BREAK_SPACE)
	(progn 
	  (setf cln-chars nil)
	  (push cln-chars *tr-gthr*));; (gthr handler)))
	(progn 
	  (setf cln-chars (string-left-trim '(#\Space) cln-chars))
	  (push (format nil "~a" cln-chars) *tr-gthr*)))))

(defmethod sax:end-document ((handler psa-handler))
  (setf *tr-gthr* nil)
  (nreverse (gthr handler)))

(sax-match-td *eg-fl*)

;;; ==============================


;;; ==============================
(defclass links-handler (sax:default-handler)
  ((links :accessor links
          :initform nil)))

(defmethod sax:end-document ((handler links-handler))
  (nreverse (links handler)))

(defmethod sax:start-element ((handler links-handler)
                               uri local-name qname attributes)
  (when (string-equal "a" local-name)
    (let ((attribute
           (find "href" attributes
                 :key #'sax:attribute-local-name
                 :test #'string-equal)))
      (when attribute
          (push (sax:attribute-value attribute)
                (links handler))))))

(defun sax-match-html-a-href (string)
  (chtml:parse string (make-instance 'links-handler)))

chtml:
;;; ==============================
;;; EOF

(defclass links-handler (sax:default-handler)
  ((links :accessor links
          :initform nil)))

(defmethod sax:end-document ((handler links-handler))
  (nreverse (links handler)))

(defmethod sax:start-element ((handler links-handler)
                               uri local-name qname attributes)
  (when (string-equal "a" local-name)
    (let ((attribute
           (find "href" attributes
                 :key #'sax:attribute-local-name
                 :test #'string-equal)))
      (when attribute
          (push (sax:attribute-value attribute)
                (links handler))))))

(defun sax-match-td (parse-src)
  (cxml:parse parse-src (make-instance 'links-handler))) 



;;; ==============================
(defclass links-and-images-handler (sax:default-handler)
  ((links-and-images :accessor links-and-images
                     :initform nil)))

(defmethod sax:end-document ((handler links-and-images-handler))
           (links-and-images handler))

(defmethod sax:start-element ((handler links-and-images-handler)
                                uri local-name qname attributes)
  (flet ((collect (element attribute)
           (when (string-equal element local-name)
             (let ((attribute
                    (find attribute attributes
                          :key #'sax:attribute-local-name
                          :test #'string-equal)))
               (when attribute
                 (push (sax:attribute-value attribute)
                       (links-and-images handler)))))))
    (collect "a" "href")
    (collect "img" "src")))

(defun sax-links-and-images (url)
  (chtml:parse (drakma:http-request url :want-stream t) ;; 
               (make-instance 'links-and-images-handler)))

;;; ==============================

(klacks:close-source *example*)

klacks:
klacks:peek-value
klacks:SERIALIZE-EVENT
;;; ==============================
(cxml:make-source
 (klacks:with-open-source
    (s (cxml:make-source *eg-fl*))
  (loop
      for key = (klacks:peek s)
      while key
      do
	(case key
	  (:start-element
	   (format t "~A {" (klacks:current-qname s)))
	  (:end-element
	    (format t "}")))
       (klacks:consume s)))


klacks:expect

(klacks:current-characters *example*)
(klacks:find-event *example* :characters)
(klacks:peek *example*)
(klacks:peek-next *example*)
(klacks:consume *example*)

*example*
(setq *example* (cxml:make-source *eg-fl*))
(klacks:close-source *eg-fl*)

(let ((this-event (klacks:peek *example*))
      (case this-event
	(:start-element
	 (unless (klacks:current-qname *example*)
	   (sax:attribute-value 

;;; ==============================
;;; EOF
