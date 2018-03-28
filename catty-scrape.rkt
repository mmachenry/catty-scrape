#lang racket

#|
Tested in Dr. Racket 6.12

Requires you to run "raco pkg install sxml" and "raco pkg install html-parsing"
after installing Racket.

Run this in Dr. Racket or with "mzscheme catty-scrape.rkt" on the command line.

webscraperhelp was helpful in figuring out what to do but not necessary for the
resulting script to run. To install it run "raco pkg install webscraperhelper"
It's documented here: https://pkgs.racket-lang.org/package/webscraperhelper 
|#

(require
  net/url
  html-parsing
  sxml/sxpath)

(define url "https://iscrapapp.com/yards/us-pennsylvania-catasauqua-catasauqua-scrap-yard-premium/pricing/")

(define my-xml
  (html->xexp
   (get-impure-port
    (string->url url))))

(define rows ((sxpath "//tr[td[contains(@class,'material-name')]]") my-xml))

(define (extract-from-row row)
  (let ([name (first ((sxpath "//td[contains(@class,'material-name')]/a/text()") row))]
        [price ((sxpath "//td[contains(@class,'material-price')]/text()") row)])
    (cons name
          (if (= (length price) 4)
              (second price)
              ""))))

(map extract-from-row rows)