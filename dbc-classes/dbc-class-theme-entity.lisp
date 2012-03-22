;;; :FILE-CREATED <Timestamp: #{2011-10-11T15:53:58-04:00Z}#{11412} - by MON>
;;; :FILE dbc-specific/dbc-classes/dbc-class-theme-entity.lisp
;;; ==============================

;; *header-stream*
;; (http-request "http://id.loc.gov/vocabulary/graphicMaterials/label/Action%20%26%20adventure%20dramas")
;; curl -I http://id.loc.gov/vocabulary/graphicMaterials/label/Action%20%26%20adventure%20dramas
;; curl -i http://id.loc.gov/vocabulary/graphicMaterials/label/Action%20%26%20adventure%20dramas
;;
;; (drakma:http-request "http://id.loc.gov/vocabulary/graphicMaterials/Action%20%26%20adventure%20dramas" :user-agent :firefox )
;; If i set drakma:*header-stream* to *standard-output* the get request 
;;
;;  then just "sudo tcpdump -A -s8182 host id.loc.gov", run
;;         drakma request, then see whats wrong. Redirect tcpdump to a file, but
;;         you may have to run request several times, as tpcdump does not
;;         fflush() when writing to a file

;;  :NOTE as of 2012-03-17 the LOC now publish their datasets in SKOS/RDF/MADS forms downloadable as  N-TRIPLES, TURTLE and JSON data for TGM themes _and_ 
;;  name authority files

;; We can now retrieve known themes with the following uri:
;; http://id.loc.gov/vocabulary/graphicMaterials/label/Barnyards
;; :NOTE  urls must be properly encoded e.g.:
;; "Action & adventure dramas" as "Action%20%26%20adventure%20dramas"
;; http://id.loc.gov/vocabulary/graphicMaterials/label/Action%20%26%20adventure%20dramas
;; elisp (insert (concat "http://id.loc.gov/vocabulary/graphicMaterials/label/" (mon-encode-url "Action & adventure dramas")))
;; 
;;
;; (http-request "http://id.loc.gov/vocabulary/graphicMaterials/label/Barnyards" :method :head) 
;; (http-request "http://id.loc.gov/vocabulary/graphicMaterials/label/Action%20%26%20adventure%20dramas" :preserve-uri t)
;; (http-request "http://id.loc.gov/vocabulary/graphicMaterials/label/Action%20%26%20adventure%20dramas" :preserve-uri t)
;;
;; 





;; (%theme-url-encode "A la poupée prints")
;; curl -I http://id.loc.gov/vocabulary/graphicMaterials/label/A%20la%20poup%C3%A9e%20prints

;; (dbc-theme-request-loc-x-uri "A la poupée prints") => nil
;; (dbc-theme-request-loc-x-uri "A la poupee prints")
;; (dbc-theme-request-loc-x-uri "Action & adventure dramas")
;; (puri:merge-uris
;;  (mon::string-percent-encode "Action & adventure dramas")
;;  #u"http://id.loc.gov/vocabulary/graphicMaterials/label/")

;; (drakma:http-request #u"http://id.loc.gov/vocabulary/graphicMaterials/label/Action%20%26%20adventure%20dramas"
;;                      :preserve-uri t)

;; (puri:rend(puri:parse-uri "http://id.loc.gov/vocabulary/graphicMaterials/label/Action%20&%20adventure%20dramas")
;; => (:X-URI . "http://id.loc.gov/vocabulary/graphicMaterials/tgm000063")
;; (pathname-name "http://id.loc.gov/vocabulary/graphicMaterials/tgm000063")

;; Then assuming we get back a valid http response we can make a follow up request
;; for the theme's associated xml/rdf file:
;; http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.madsrdf.rdf
;; for discussion on using curl/wget for doing so see (URL `http://id.loc.gov/techcenter/')

;; Extracting labels from HTTP response headers

;; It is possible to determine the preferred label for a given concept or heading
;; of interest without necessarily needing to download the entire RDF
;; content. Requesting a concept URI with a HTTP HEAD method exposes a private
;; header called "X-PrefLabel", that is a URL-encoded representation of the
;; preferred label.
;;
;; For example, running cURL with the "-I" argument on the URI for "Bahia grass"
;; performs a HTTP request using the HEAD method.
;;
;;     curl -I http://id.loc.gov/authorities/sh93007391
;;
;; HTTP HEAD requests return the HTTP response only, sans the body of the RDF or
;; XHTML content. Among these headers, one would see a given header "X-PrefLabel:
;; Bahia%20grass". It is possible to use a HTTP library within the programming
;; language of your choice to access this header. URL-decoding the value of the
;; X-PrefLabel header yields the string "Bahia grass".
;;
;; Following are present in the documents <head>:
;; <title>Action &amp; adventure dramas - Authorities &amp; Vocabularies (Library of Congress)</title>
;; <link rel="alternate" type="application/rdf+xml" href="http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.rdf"/>
;; <link rel="alternate" type="text/plain" href="http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.nt"/>
;; <link rel="alternate" type="application/json" href="http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.json"/>
;;
;; :NOTE the above links will be contained of madsrdf and skos combined into one
;; file. What we really want are the madsrdf files which occur at the bottom of
;; the document here:
;;
;; <li><h3>Alternate Formats</h3><ul class="std">
;; <li><a href="http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.rdf">RDF/XML (MADS and SKOS)</a></li>
;; <li><a href="http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.nt">N-Triples (MADS and SKOS)</a></li>
;; <li><a href="http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.json">JSON (MADS/RDF and SKOS/RDF)</a></li>
;; <li><a href="http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.madsrdf.rdf">MADS - RDF/XML</a></li>
;; <li><a href="http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.madsrdf.nt">MADS - N-Triples</a></li>
;; <li><a href="http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.madsrdf.json">MADS/RDF - JSON</a></li>
;; <li><a href="http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.skos.rdf">SKOS - RDF/XML</a></li>
;; <li><a href="http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.skos.nt">SKOS - N-Triples</a></li>
;; <li><a href="http://id.loc.gov/vocabulary/graphicMaterials/tgm000063.skos.json">SKOS - JSON</a></li>
;; </ul></li>


;; (URL `http://id.loc.gov/download/')
;; (URL `http://id.loc.gov/techcenter/metadata.html')
;; (URL `http://id.loc.gov/techcenter/searching.html')
;; (URL `http://id.loc.gov/techcenter/serializations.html')

;; :SEE (URL `http://id.loc.gov/vocabulary/graphicMaterials/tgm001002.html')

;; Following downlaoded to: #P"/mnt/LV-ULAN-DRV/ULAN-notes-HG/LOC-datasets-2012-03-17/"
;; :SEE (URL `http://id.loc.gov/static/data/vocabularygraphicMaterials.nt.zip')
;; :SEE (URL `http://id.loc.gov/static/data/vocabularygraphicMaterials.rdfxml.zip')
;; :SEE (URL `http://id.loc.gov/static/data/vocabularygraphicMaterials.ttl.zip')

;; This is every LOC name authority 2.7 GB
;; 
;; (URL `http://id.loc.gov/static/data/authoritiesnames.rdfxml.madsrdf.gz')

;; (URL `http://id.loc.gov/static/data/authoritiesnames.nt.skos.gz')

;;; ==============================

;; :NOTE there is a per theme XML file from db's php parse from the old dcp here:
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/tgm.tar
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/xslt/tgm_htm_details.php
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/xslt/tgm_htm_details.xslt
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/xslt/tgm_htm_feb_06.xslt
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/xslt/tgm_htm_results.xslt
;; /mnt/LV-DBC-DRV/DBC_3-13-08-SyncToHere/derbycityprints/httpd/xmldata/xslt/tgm_htm.xslt

;;
;; Also, for a later Lisp parse see: 
;; :FILE dbc-specific/dbc-classes/dbc-tgm.lisp
;;
;; The newest TGM parse of the existing dbc related sql data is here:
;; dbc-specific/dbc-classes/dbc-class-parsed-theme-record.lisp


;; for an early attempt at a theme index 
;; :SEE dbc-specific/dbc-classes/record-type-scratch-2011-12-08.lisp

;;; ==============================
;;
;; base-theme-entity (base-entity)
;;
;; *control-id-theme-namespace*
;;
;; --- control-id-theme-entity-type              (control-id-entity-type)
;; ---- control-id-theme-entity                  (control-id-theme-entity-type)
;; ----- control-id-theme-entity-display-name    (control-id-theme-entity control-id-display-name-for-entity-type)
;; ------ control-id-display-theme               (control-id-theme-entity-display-name)
;;
;;; ==============================


(in-package #:dbc)

;; :NOTE Should we treat MT, RT, BT, NT, USE, USED-FOR as distinct instances of a theme?
;;  Also, what about translated theme display names?
;; 
(defclass theme-entity (base-theme-entity)
  ()
  )

;; :NOTE as of drakma 1.2.6 there appears to be a bug in drakma when url encoding "%20%26%20" but the following commit fixes it
;; https://github.com/edicl/drakma/commit/f6a380940b2b69a700a9c91cd79532c0d1027a8c
(defun dbc-theme-request-loc-x-uri (theme-string &key (render-uri nil))
  (declare (string theme-string)
           (boolean render-uri))
  (let* ((base-theme-url "http://id.loc.gov/vocabulary/graphicMaterials/label/")
         (encoded-theme-string (mon::string-percent-encode theme-string))
         (request-url           (concatenate 'string base-theme-url encoded-theme-string)))
    (multiple-value-bind (ignored-content response-code parameter-list p-uri f-strm)
        (drakma:http-request  request-url :preserve-uri t :method :head)
      (declare (ignore ignored-content  f-strm))
      (let ((maybe-x-uri
              (and (eql response-code 200)
                   (cdr (assoc :x-uri parameter-list)))))
        (when maybe-x-uri
          (values (file-namestring maybe-x-uri)
                  (if render-uri
                      (puri:render-uri p-uri nil)
                      p-uri)))))))


;;; ==============================


;; Local Variables:
;; indent-tabs-mode: nil
;; show-trailing-whitespace: t
;; mode: lisp-interaction
;; End:

;;; ==============================
;;; EOF
