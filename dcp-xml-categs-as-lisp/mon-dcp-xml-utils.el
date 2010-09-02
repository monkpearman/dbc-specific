;; -*- mode: EMACS-LISP; -*-
;;; this is mon-dcp-xml-utils.el
;;; ================================================================
;;; DESCRIPTION:
;;; mon-dcp-xml-utils provides {description here}.
;;;
;;; FUNCTIONS:►►►
;;; `xml--depth-key', `xml--depth-level', `xml--depth-compare', `xml--depth-check', 
;;; `xml--top-node'
;;; FUNCTIONS:◄◄◄
;;;
;;; MACROS:
;;;
;;; METHODS:
;;;
;;; CLASSES:
;;;
;;; CONSTANTS:
;;;
;;; VARIABLES:
;;;`*dcp-categ-levels*' 
;;; ALIASED/ADVISED/SUBST'D:
;;;
;;; DEPRECATED:
;;;
;;; RENAMED:
;;;
;;; MOVED:
;;;
;;; TODO:
;;;
;;; NOTES:
;;;
;;; SNIPPETS:
;;;
;;; REQUIRES:
;;;
;;; THIRD-PARTY-CODE:
;;;
;;; AUTHOR: MON KEY
;;; MAINTAINER: MON KEY
;;;
;;; PUBLIC-LINK: (URL `http://www.emacswiki.org/emacs/mon-dcp-xml-utils.el')
;;; FIRST-PUBLISHED:
;;;
;;; FILE-CREATED:
;;; <Timestamp: #{2010-02-08T14:04:30-05:00Z}#{10061} - by MON>
;;; ================================================================
;;; This file is not part of GNU Emacs.
;;;
;;; This program is free software; you can redistribute it and/or
;;; modify it under the terms of the GNU General Public License as
;;; published by the Free Software Foundation; either version 3, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; see the file COPYING.  If not, write to
;;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;;; Floor, Boston, MA 02110-1301, USA.
;;; ================================================================
;;; Permission is granted to copy, distribute and/or modify this
;;; document under the terms of the GNU Free Documentation License,
;;; Version 1.3 or any later version published by the Free Software
;;; Foundation; with no Invariant Sections, no Front-Cover Texts,
;;; and no Back-Cover Texts. A copy of the license is included in
;;; the section entitled ``GNU Free Documentation License''.
;;; 
;;; A copy of the license is also available from the Free Software
;;; Foundation Web site at:
;;; (URL `http://www.gnu.org/licenses/fdl-1.3.txt').
;;; ================================================================
;;; Copyright © 2010 MON KEY 
;;; ==============================
;;; CODE:

(eval-when-compile (require 'cl))
(require 'nxml-mode)
(require 'nxml-parse)
;; (setq tt--xpf 
;;; (nxml-parse-file  "c:/home/sp/HG-Repos/derbycityprintsHG/httpd/xmldata/advert.xml"))
  
;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-08T14:22:10-05:00Z}#{10061} - by MON>
(defvar *dcp-categ-levels* 
  '((category . root) (categ . 0) 
    (c1 .  1) (c2 .  2) (c3 .  3) (c4 .  4) 
    (c5 .  5) (c6 .  6) (c7 .  7) (c8 .  8))
  "*An alist of cons cells mapping categories to their depth levels.
Use to identify node depth in current xml tree.
:CALLED-BY `xml--top-node' 
:SEE-ALSO `xml--depth-key', `xml--depth-level', `xml--depth-compare'.\n►►►")
;;
;;; :TEST-ME *dcp-categ-levels* 
;;;(progn (makunbound '*dcp-categ-levels*) (unintern '*dcp-categ-levels*))

;;; ==============================
;;; :TODO This need a var to use in the printer. 
;;; Basically an XSLT.
;; (category Root-Category)
;; (categ main-category)
;; (name category-name)
;; (Document_Number document-number)
;; (c1 category-c1)
;; (c2 category-c2)
;; (c3 category-c3)
;; (c4 category-c4)
;; (c5 category-c5)
;; (c6 category-c6)
;; (c7 category-c7)
;; (c8 category-c8))

;;; ==============================
;;; :TODO Build a reliable XML-Lisp parser with some regexps.
;;; (while (search-forward-regexp "\"[ \t\n]+\"\\|nil" nil t)
;;;  (replace-match ""))

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-08T15:40:49-05:00Z}#{10061} - by MON>
(defun xml--top-node (depth-var)
  "Return the non-integer cdr of DEPTH-VAR.
This is the top most noded in the tree.
DEPTH-VAR is a depth level mapping of tree nodes 
List elts of DETH-VAR are cons'. The car is node name.
The cdr is its node level. Unless the node level is the root it is an integer.\n
:SEE `*dcp-categ-levels*' for an example.\n
:EXAMPLE\n\(xml--top-node *dcp-categ-levels*)\n
:SEE-ALSO `xml--depth-key', `xml--depth-level', `xml--depth-compare', `xml--depth-check',
.\n►►►"
  (let ((walk-top depth-var)
        (get-top))
    (while walk-top
      (let ((chk-top (cdr (pop walk-top))))
        (when (not (integerp chk-top))
          (setq get-top chk-top)
          (setq walk-top nil))))
    get-top))
;;
;;; :TEST-ME (xml--top-node *dcp-categ-levels*)

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-08T14:04:49-05:00Z}#{10061} - by MON>
(defun xml--depth-key (depth-cons depth-var)
  "Return reverse association for keys `eq' to DEPTH-CONS in alist DEPTH-VAR.\n
DEPTH-CONS is an integor or symbol.\n
DEPTH-VAR is a depth level mapping of tree nodese e.g. `*dcp-categ-levels*'.
:EXAMPLE\n\(xml--depth-key 4 *dcp-categ-levels*\)\n
\(xml--depth-key 'root *dcp-categ-levels*\)\n
`xml--depth-level', `xml--depth-compare', `xml--depth-check', `xml--top-node',
.\n►►►"
    (car (rassq depth-cons depth-var)))
;;
;; :TEST-ME (xml--depth-key 4 *dcp-categ-levels*) ;=> c4
;; :TEST-ME (xml--depth-key nil *dcp-categ-levels*) ;=> nil

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-08T14:20:49-05:00Z}#{10061} - by MON>
(defun xml--depth-level (cons-or-depth depth-var)
  "Return associations for keys `eq' to CONS-OR-DEPTH in alist DEPTH-VAR.\n.
CONS-OR-DEPTH is either a symbol or two valued list.\n
DEPTH-VAR is a depth level mapping of tree nodese e.g. `*dcp-categ-levels*'.
:EXAMPLE\n\(xml--depth-level '\(c5 \"Vespa\"\) *dcp-categ-levels*\)\n
\(xml--depth-level 'c5 *dcp-categ-levels*\)\n
`xml--depth-key', `xml--depth-compare', `xml--depth-check', `xml--top-node',
.\n►►►"
  (if (consp cons-or-depth)
      (cdr (assq (car cons-or-depth) depth-var))
      (cdr (assq cons-or-depth depth-var))))
;;; :TEST-ME (xml--depth-level '(c5 "Vespa") *dcp-categ-levels*) ;=> 5
;;; :TEST-ME (xml--depth-level 'c5 *dcp-categ-levels*)  ;=> 5
;;; :TEST-ME (xml--depth-level nil *dcp-categ-levels*) ;=> nil

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-08T14:20:45-05:00Z}#{10061} - by MON>
(defun xml--depth-compare (stored-depth curr-depth depth-var)
  "STORED-DEPTH is the value of the stored in a depth location var.
CURR-DEPTH is the value of the depth we're looking at.
DEPTH-VAR is the variable holding the depth level alist tree, e.g. 
`*dcp-categ-levels*'.\n
Return value as the form:
\(\(stored-depth . stored-categ\) \(curr-depth . curr-categ\)\)\n
:EXAMPLE\n\(xml--depth-compare 4 '\(c5 \"Vespa\"\) *dcp-categ-levels*\)\n
 \(xml--depth-compare 5 '\(c5 \"Honda\"\) *dcp-categ-levels*\)\n
\(let \(\(chck-1 
       \(mapcar #'car \(xml--depth-compare 4 '\(c5 \"Vespa\"\) *dcp-categ-levels*\)\)\)
      \(chck-2 
       \(mapcar #'car \(xml--depth-compare 5 '\(c5 \"Vespa\"\) *dcp-categ-levels*\)\)\)\)
  \(list \(eq \(car chck-1\) \(cadr chck-1\)\) \(eq \(car chck-2\) \(cadr chck-2\)\)\)\)\n
:SEE-ALSO `xml--depth-key', `xml--depth-level', `xml--depth-check', `xml--top-node',.\n►►►"
  (let* ((xdk-s (xml--depth-key stored-depth depth-var))
         (xdl-c (xml--depth-level curr-depth depth-var))
         (xdk-> (xml--depth-key xdl-c depth-var)))
    ;;  ((stored-depth . stored-categ) (curr-depth . curr-categ))
    `((,stored-depth . ,xdk-s) (,xdl-c . ,xdk->))))
;;
;;; :TEST-ME (xml--depth-compare 5 '(c5 "Vespa") *dcp-categ-levels*)
;;; => ((5 . c5) (5 . c5))
;;; :TEST-ME (xml--depth-compare 4 '(c5 "Vespa") *dcp-categ-levels*)
;; => ((4 . c4) (5 . c5))
;;; :TEST-ME (xml--depth-compare nil nil *dcp-categ-levels*) 
;; => ((nil) (nil))
;;; :TEST-ME 
;;; (let ((chck-1 
;;;        (mapcar #'car (xml--depth-compare 4 '(c5 "Vespa") *dcp-categ-levels*)))
;;;       (chck-2 
;;;        (mapcar #'car (xml--depth-compare 5 '(c5 "Vespa") *dcp-categ-levels*))))
;;;   (list (eq (car chck-1) (cadr chck-1)) (eq (car chck-2) (cadr chck-2))))
;;; ==============================

;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-08T14:32:29-05:00Z}#{10061} - by MON>
(defun xml--depth-check (depth-parent depth-now depth-var)
  "Return a two elt list, car of list is non-nil if DEPTH-PARENT is eq DEPTH-NOW.
DEPTH-PARENT is the value of the stored in a depth location var.
DEPTH-NOW is the value of the depth we're looking at.
DEPTH-VAR is the variable holding the depth level alist tree, e.g. 
`*dcp-categ-levels*'.\n
Return value as one of the forms:
 \(nil \(<LVL> . <LVL-KEY>\)\) or \(t \(<LVL> . <LVL-KEY>\)\)\n
:EXAMPLE\n\(xml--depth-check 4 '\(c5 \"Vespa\"\) *dcp-categ-levels*\)\n
\(xml--depth-check 5 '\(c5 \"Vespa\"\) *dcp-categ-levels*\)\n
:SEE-ALSO `xml--depth-key', `xml--depth-level', `xml--depth-compare', `xml--top-node',
.\n►►►"
(let* ((depcon (xml--depth-compare depth-parent depth-now depth-var))
       (depchk (mapcar #'car depcon)))
       (if (eq (car depchk) (cadr depchk))
           `(t  ,(cadr depcon))
           `(nil ,(car depcon)))))
;;
;;; :TEST-ME (xml--depth-check 4 '(c5 "Vespa") *dcp-categ-levels*)
;;; :TEST-ME (xml--depth-check 5 '(c5 "Vespa") *dcp-categ-levels*)

;;; ==============================
(defun xml--printer ()
"print current level to buffer-or-stream."
)
;;; ==============================

(defun xml--format-constrctor
    (xml--depth-check 5 '(c5 "Vespa") *dcp-categ-levels*)
    (category Root-Category)
    (categ main-category)
    (name 
     (format "%S"
             category-name)
    (Document_Number document-number)

    (case (car level) 
     category-level-
(member lvl (

(format ""
        (memq  'c1 '(c1 c2 c3 c4 c5 c6 c7 c8))
     
;;(reverse '(Root-Category Categ c1 c2 ))
(c2 c1 Categ Root-Category)

(defvar *dcp-node-level* nil
  "Current node level we're looking at.")

;;; `xml--top-node'
;;; (xml--walker nil *dcp-categ-levels*)
;;; ==============================
;;; :CREATED <Timestamp: #{2010-02-08T15:19:11-05:00Z}#{10061} - by MON>
(defun xml--walker (walk-list depth-var)
  (let ((dcl depth-var) ;*dcp-categ-levels*) 
        (get-this-node (car walk-list)))
    (if (null *dcp-node-level*)
        (push (xml--top-node *dcp-categ-levels*)
              *dcp-node-level*))
    (
     (eq (car *dcp-node-level*)
        (xml--depth-level get-this-node depth-var))

(eq (xml--depth-level 'category dcl)

(xml--depth-level 'category 
(xml--depth-level 'category dcl)
(xml--top-node dcl)
(xml--top-node 

!!!!!!!1THE ANSWER IS MAPLIST!!!!!
maplist

;;; ==============================
(if (consp 
     
(if (>
     (xml--depth-level 'c1 *dcp-categ-levels*)

;;(xml--depth-key (xml--top-node *dcp-categ-levels*) *dcp-categ-levels*)
(eq (car *dcp-node-level*)
    (xml--depth-level 'category *dcp-categ-levels*))

(setq *dcp-node-level* nil)
;;; Extract the current head of node.
;;; If we don't have a match push the category on to depth-list
;;; If we do continue to format constructor.


;;; 
;;; (xml--depth-compare 4 '(c5 "Vespa") *dcp-categ-levels*)
;;; (xml--depth-compare 'root '(c5 "Vespa") *dcp-categ-levels*)
;;; => ((root . category) (5 . c5))
;;; (if (eq (car 

(pop 
(car
 (walker #'(lambda (l) 
             (while (consp l)
               (funcall walker l)
               (princ (car l) (current-buffer))
               (setq l (cdr l))
               (if (consp l)
                   (funcall walker l)))
             (setq l l)))))
 
(let ((bubba (copy-tree  '(c3
                           ((name . "Rail Posters"))
                           (c4 "British Railways")
                           (c4 "London Underground"))))
      (subbub)
  (lexical-let ((wlk subbub))
    #'(lambda (wlk)
        (if 

    (while bubba
      (unless (null bubba)
        (funcall walker bubba))))

c3((name . Rail Posters))(c4 British Railways)(c4 London Underground)  



;;; ==============================
(if 
 (while 
(this-tree
 (copy-tree (cdr 
  (cdr
  '(c3
    ((name . "Rail Posters"))
    (c4 "British Railways")
    (c4 "London Underground")))
;;; ==============================
(provide 'mon-dcp-xml-utils)
;;; ==============================

;;; ================================================================
;;; mon-dcp-xml-utils.el ends here
;;; EOF

;;; ==============================
(setq tt--xpf
      '(category
        (categ
         ((Document_Number . "1025")
          (name . "Advertising and Graphics"))
         (c1
          ((name . "Periodical Ads"))
          (c2
           ((Document_Number . "1026")
            (name . "Automobile"))
           (c3
            ((Document_Number . "1029")
             (name . "Auto Manufacturers"))
            (c4 "Alpha Romeo")
            (c4 "American Motors")
            (c4 "Auburn")
            (c4 "Audi")
            (c4 "Austin-Healy")
            (c4 "BMW")
            (c4 "Ballot")
            (c4 "Berliet")
            (c4 "British Motor Corp")
            (c4 "Bugatti")
            (c4 "Buick")
            (c4 "Cadillac")
            (c4 "Chenard and Walcker")
            (c4 "Chevrolet")
            (c4 "Chrysler")
            (c4 "Citroen")
            (c4 "Cole Motor Cars")
            (c4 "Cottin and Desgouttes")
            (c4 "Datsun")
            (c4 "DeDion Bouton")
            (c4 "DeSoto")
            (c4 "Delage")
            (c4 "Delahaye")
            (c4 "Delaunay Belleville")
            (c4 "Dodge Brothers")
            (c4 "Fiat")
            (c4 "Ford")
            (c4 "General Motors")
            (c4 "George Irat")
            (c4 "Graham - Paige")
            (c4 "Hillman")
            (c4 "Holden")
            (c4 "Honda")
            (c4 "Hudson")
            (c4 "Humber")
            (c4 "Hupmobile")
            (c4 "International Trucks")
            (c4 "Jaguar")
            (c4 "Jeep")
            (c4 "Jordan")
            (c4 "Lancia")
            (c4 "Lincoln")
            (c4 "MG")
            (c4 "Manessius")
            (c4 "Marmon")
            (c4 "Maxwell Motors")
            (c4 "Mercedes-Benz")
            (c4 "Mercury")
            (c4 "Milburn")
            (c4 "Million - Guiet")
            (c4 "Morris")
            (c4 "Nash")
            (c4 "Nissan")
            (c4 "Oldsmobile")
            (c4 "Opel")
            (c4 "Packard")
            (c4 "Panhard")
            (c4 "Peerless")
            (c4 "Peugeot")
            (c4 "Pierce - Arrow")
            (c4 "Plymouth")
            (c4 "Pontiac")
            (c4 "Porsche")
            (c4 "Renault")
            (c4 "Rochet Schneider")
            (c4 "Rolland Pilain")
            (c4 "Rolls Royce")
            (c4 "Rootes Group")
            (c4 "Rover")
            (c4 "Saab")
            (c4 "Salmson")
            (c4 "Saturn")
            (c4 "Senechal")
            (c4 "Simca")
            (c4 "Sizaire")
            (c4 "Standard-Triumph")
            (c4 "Studebaker")
            (c4 "Sunbeam")
            (c4 "Toyota")
            (c4 "Unic")
            (c4 "Vauxhall")
            (c4 "Voisin")
            (c4 "Volkswagen")
            (c4 "Volvo")
            (c4 "White Motor Company")
            (c4 "Willys-Overland")
            (c4 "Wuling"))
           (c3
            ((name . "Automobile Alternatives"))
            (c4
             ((name . "Moped Motorcycle and Scooter Manufacturers"))
             (c5 "Honda")
             (c5 "Vespa")
             ))
           (c3
            ((Document_Number . "1028")
             (name . "Gasoline and Oil"))
            (c4 "Antar")
            (c4 "Castrol")
            (c4 "Eco")
            (c4 "Niva")
            (c4 "Mobil")
            (c4 "Shell")
            (c4 "Texaco")
            (c4 "Veedol"))
           (c3
            ((name . "Light Equipment and Tractors"))
            (c4
             ((name . "Lawnmowers"))
             (c5 "John Deer")))
           (c3
            ((Document_Number . "1027")
             (name . "Parts and Supplys"))
            (c4 "Carborateur")
            (c4 "Headlights")
            (c4 "Tires")
            (c4 "Spark Plugs")
            (c4 "Shocks and Struts")
            ))
          (c2
           ((Document_Number . "1031")
            (name . "Airplane and Air Travel"))
           (c3 ((Document_Number . "1032")) "Airplane Parts")
           (c3 "Airplane Manufacturers")
           (c3
            ((Document_Number . "1033")
             (name . "Airlines"))
            (c4 "Air France")
            (c4 "Hispano Suiza")
            (c4 "United")))
          (c2
           ((Document_Number . "1034")
            (name . "Travel and Destination"))
           (c3
            ((name . "Rail"))
            (c4 "London Underground")
            (c4 "Santa Fe")
            (c4 "Southern Pacific"))
           (c3
            ((name . "Cruise Lines"))
            (c4 "Canadian Pacific Cruises")
            (c4 "Cunard Line")
            (c4 "French Line")

            (c4 "Italian Line")
            (c4 "Matson Line"))
           (c3
            ((Document_Number . "1035")) "Hotels and Locale"))
          (c2
           ((Document_Number . "1036")
            (name . "Liquor and Beverage"))
           (c3 "Coffee")
           (c3 "Water")
           (c3
            ((name . "Soda"))
            (c4 "Coca-Cola"))
           (c3
            ((Document_Number . "1037")
             (name . "Alcohol and Spirits"))
            (c4 "Armagnac")
            (c4 "Beer")
            (c4 "Brandy")
            (c4 "Champagne")
            (c4 "Cognac")
            (c4 "Apertifs Cordials and Liqueurs")
            (c4 "Port")
            (c4 "Rum")
            (c4 "Scotch")
            (c4 "Vermouth")
            (c4 "Whiskey")
            (c4 "Wine")))
          (c2
           ((Document_Number . "1038")
            (name . "Events Festival and Expositions"))
           (c3 "Aeronautics")
           (c3 "Automobile")
           (c3 "Industry and Commercial")
           (c3 ((Document_Title . "1039")) "Publication Announcements")
           (c3
            ((name . "Performing Arts"))
            (c4 "Ballet"))
           (c3 "Lottery")
           (c3 "Museum And Gallery Openings")
           (c3 ((name . "Record Releases"))
               (c4 "Jazz")))
          (c2
           ((Document_Number . "1040")
            (name . "Fashion and Apparel"))
           (c3
            ((Document_Number . "1041")
             (name . "Accessories"))
            (c4 "Cigarette Lighters and Cases")
            (c4 "Luggage")
            (c4 "Pens and Writing Instruments")
            (c4 "Wallets and Purses"))
           (c3 "Mens Apparel - General")
           (c3 "Womens Apparel - General")
           (c3 ((Document_Number . "1042")) "Boutiques and Shops")
           (c3 "Childrens and Juvenile")
           (c3 "Coats and Jackets")
           (c3 "Corset and Undergarments")
           (c3 "Cosmetics")
           (c3 "Gloves")
           (c3 "Hats")
           (c3 "Hosiery and Socks")
           (c3 "Jewelry")
           (c3 "Lingerie")
           (c3 "Perfume")
           (c3 "Shoes and Footwear")
           (c3 "Swimwear")
           (c3 "Watches"))
          (c2
           ((Document_Number . "1043")
            (name . "Food Related Items"))
           (c3
            ((name . "Ingredients"))
            (c4
             ((name . "Bread and Baking Ingredients"))
             (c5 "Bread"))
            (c4
             ((name . "Cereals and Grains"))
             (c5 "Breakfast Cereals")
             (c5 "Pasta"))
            (c4
             ((name . "Condiments and Flavorings"))
             (c5 "Bottled Sauces")
             )
            (c4
             ((name . "Dairy"))
             (c5 "BabyFood and Formula")
             (c5 "Cheese")
             )
            (c4 "Fruit")
            (c4 "Soups and Stock"))
           (c3
            ((name . "Dessert and Confectionery"))
            (c4 "Candy")
            (c4 "Chocolate")
            (c4 "Cookies and Digestif"))
           (c3 "Crystal")
           (c3 "Silverware")
           (c3
            ((name . "Kitchenware"))
            (c4 "Bakeware")))
          (c2
           ((Document_Number . "1044")
            (name . "Furniture and Appliance"))
           (c3
            ((name . "Furniture"))
            (c4 "Chairs")
            (c4 "Clocks")
            (c4 "Couches and Chaises")
            (c4 "Decorative Elements and Accessories")
            (c4 "Fireplace and Andirons")
            (c4 "Furniture Design and Sales")
            (c4 "Glass and Vase")
            (c4 "Lamps and Lighting")
            (c4 "Pianos")
            (c4 "Rugs and Carpets")
            (c4 "Tables"))
           (c3 "Phonograph")
           (c3 "Radio")
           (c3 "Refrigerator")
           (c3 "Sewing Machine")
           (c3 "Stoves and Ovens")
           (c3 "Vacuum")
           (c3 "Washing Machine"))
          (c2
           ((name . "Games and Toys"))
           (c3 "Rides and Interactive Toys"))
          (c2
           ((Document_Number . "1045")
            (name . "Industry"))
           (c3
            ((name . "Banking and Finance"))
            (c4
             ((name . "Travelers Checques"))
             (c5 "American Express")
             (c5 "Thomas Cook")))
           (c3 "Chemicals and Pesticides")
           (c3 "Cigarette and Tobacco")
           (c3
            ((name . "Construction and Assembly")))
           (c3
            ((name . "Education"))
            (c4 "Schools")
            (c4 "Colleges"))
           (c3
            ((name . "Medicine and Pharmaceuticals"))
            (c4 "Aspirin and Pain Relief")
            (c4 "Cough Syrup")
            (c4 "Snake Oil"))
           (c3
            ((name . "Office and Data Management"))
            (c4 "Calculator")
            (c4 "Paper and Pulp")
            (c4 "Photography and Film")
            (c4 "Printing and Reproduction")
            (c4 "Typewriter"))
           (c3
            ((name . "Safety and Security"))
            (c4 "Alarms")
            (c4 "Locks and Keys")
            (c4 "Safes"))
           (c3 "Transportation and Shipping")
           (c3
            ((name . "Materials and Consumables"))
            (c4 "Dyes Pigments Paints and Inks")
            (c4 "Wallpapers")
            (c4 "Fabrics")
            (c4 "Fine Paper and Stationery")
            (c4 "Household Supplies")
            (c4
             ((name . "Personal Hygiene"))
             (c5 "Razors")
             (c5 "Shampoo and Conditioner")
             (c5 "Toothpaste"))
            (c4
             ((name . "Soaps"))
             (c5 "Perfumed and Scented")
             (c5 "Household Soap"))))
          (c2
           ((Document_Number . "1046")
            (name . "Sports"))
           (c3 "Billiards"))
          (c2
           ((Document_Number . "1047")
            (name . "Utilites and Infrastructure"))
           (c3 "Telephone")))
         (c1
          ((name . "Posters"))
          (c2
           ((name . "Events and Festivals"))
           (c3
            ((name . "Olympics"))
            (c4
             ((name . "Summer Olympic Games"))
             (c5 "Melbourne - 1956 XVI Olympiad")
             (c5 "Rome - 1960 XVII Olympiad ")
             (c5 "Tokyo - 1964 XVIII Olympiad ")
             (c5 "Mexico - 1968 XIX Olympiad")
             (c5 "Munich - 1972 XX Olympiad")
             (c5 "Montreal - 1976 XXI Olympiad")
             (c5 "Moscow - 1980 XXII Olympiad ")
             (c5 "Los Angeles - 1984 XXIII Olympiad")
             (c5 "Seoul - 1988 XXIV Olympiad")
             (c5 "Barcelona - 1992 XXV Olympiad")
             (c5 "Atlanta - 1996 XXVI Olympiad")
             (c5 "Sydney - 2000 XXVII Olympiad")
             (c5 "Athens - 2004 XXVIII Olympiad"))
            (c4
             ((name . "Olympic Winter Games"))
             (c5 "St. Moritz - 1948 V Winter Games")
             (c5 "Lake Placid - 1980 XIII Winter Games")
             (c5 "Calgary - 1988 XV Winter Games")
             (c5 "Albertville - 1992 XVI Winter Games")
             (c5 "Lillehammer - 1994 XVII Winter Games")
             (c5 "Nagano - 1998 XVIII Winter Games")
             (c5 "Salt Lake City - 2002 XIX Winter Games"))))
          (c2
           ((name . "Travel and Destination"))
           (c3
            ((name . "Airline Posters"))
            (c4 "Air Canada")
            (c4 "Air West Airlines")
            (c4 "American Airlines")
            (c4 "America West Airlines")
            (c4 "Braniff International Airways")
            (c4 "CPAir - Canadian Pacific Airlines")
            (c4 "Delta Airlines")
            (c4 "Eastern Airlines")
            (c4 "Frontier Airlines")
            (c4 "JAL - Japan Airlines")
            (c4 "Northwest Airlines")
            (c4 "Pan Am - Pan American World Airways")
            (c4 "Panagra - Pan American-Grace Airways")
            (c4 "Singapore Airlines")
            (c4 "Southern Airways")
            (c4 "Swissair")
            (c4 "TCA - Trans-Canada Air Lines")
            (c4 "TWA - Trans World Airlines")
            (c4 "United Airlines")
            (c4 "Western Airlines"))
           (c3
            ((name . "Rail Posters"))
            (c4 "British Railways")
            (c4 "London Underground"))
           (c3
            ((name . "Cruise Lines and Ocean Liner Posters"))
            (c4 "QE2 - Queen Elizabeth 2"))
           (c3
            ((name . "Hotels and Locale Posters"))
            (c4
             ((name . "Nation and City"))
             (c5
              ((name . "France"))
              (c6 "Bourgogne")
              (c6
               ((name . "Paris"))))
             (c5
              ((name . "Italy")))
             (c5
              ((name . "Britain - United Kingdom")))
             (c5
              ((name . "Denmark"))))))))
        )
      )



;;; ==============================
;;; EOF
