Catty Scrape
---

A web scrapper for the prices of metal at the Catty Scrap scrap yard in Catasauqua, PA 

Installation
---

Install Racket by following the instruction on [](https://racket-lang.org/) or
using your Linux distro's package manager.

Install additional required packages for this script:

    raco pkg install html-parsing
    raco pkg install sxml

Run
---
Open src/catty-scrape.rkt Dr. Racket run it as a script on the command line as follows.

    mzscheme src/catty-scrape.rkt

Further notes
---
Most recently tested on Racket 6.12.

webscraperhelp was helpful in figuring out what to do but not necessary for the resulting script to run. To install it run this:

    raco pkg install webscraperhelper

It's documented here [](https://pkgs.racket-lang.org/package/webscraperhelper)
