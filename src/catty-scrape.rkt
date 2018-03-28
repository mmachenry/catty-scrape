#lang racket

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
