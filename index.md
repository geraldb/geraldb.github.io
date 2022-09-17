


## Upcoming (In-Person Live) Talks - Join Us

Wed., September 21st, 2022 - (FREE) Live Meetup 20 min. Talk  - [**Inside Punkbase - SQLite (SQL.js) In Action @ Stahlstadt.js (Linz, Austria) »**](https://old.reddit.com/r/DIYPunkArt/comments/x9z3tg/upcoming_free_live_meetup_20_mintalk_wed/)

Wed., October 5th, 2022  -  (FREE) Live Meetup 30 min.Talk - [**Inside the Billion Dollar $$$ (Crypto) Punk Pixel Heads @ Technologieplauscherl LXXVII (Linz, Austria) »**](https://old.reddit.com/r/DIYPunkArt/comments/xce70l/upcoming_free_live_meetup_30_mintalk_wed_october/)



##  Week 37 - Monday, September 12th to Sunday, September 18th, 2022

**moonbirds**

About a month ago I reported the breaking news story [**Proof's Moonbirds Token Images Officialy Declared Public Domain (No Rights Reserved) under Creative Commons Zero (CC0) Dedication by Kevin Rose (Chief of Proof) - Thank You!**](https://old.reddit.com/r/DIYPunkArt/comments/who4wm/breaking_news_proofs_moonbirds_token_images/) and
this Monday the Proof Collective published all official 42x42px attributes for the moonbirds 
(incl. all legendaries) on github.  To celebrate  I added a copy of the official 200+ attributes in the new /moonbirds-official directory
in the [**moonbirds.sandbox**](https://github.com/pixelartexchange/moonbirds.sandbox).
As a bonus I added a new [**generate_legendary script**](https://github.com/pixelartexchange/moonbirds.sandbox/blob/master/moonbirds-official/generate_legendary.rb) to generate a first small sample batch of  legendary moonbirds (e.g. 
no. 6949 ![](https://github.com/pixelartexchange/moonbirds.sandbox/raw/master/moonbirds-official/i/moonbird6949.png), 
no. 7473 ![](https://github.com/pixelartexchange/moonbirds.sandbox/raw/master/moonbirds-official/i/moonbird7473.png), 
no. 2941 ![](https://github.com/pixelartexchange/moonbirds.sandbox/raw/master/moonbirds-official/i/moonbird2941.png)) from scratch (using the official attributes)  plus I added a new [**generate_10000 script**](https://github.com/pixelartexchange/moonbirds.sandbox/blob/master/moonbirds-official/generate_10000.rb) to (re)generate all 10 000 moonbirds from scratch (using the official attributes and official "unofficial" metadata records that incl. beak color, eyes color, and more NOT present in the official "on-blockchain" token metadata via the official moonbird HTTP API). 


**artbase**

I added a new build command to the artbase comand-line tool / library
that lets you build all-in-one single-file SQLite databases (e.g. artbase.db). Example:

```
$ artbase pudgies build          # or
$ artbase unemployable build   
$ artbase goblintown build
$ artbase moonbirds build
# ...
```

Note: For now the build command REQUIRES a build.rb configuration script that defines the (metadata) columns / schema.
See the build.rb scripts in the [**artbase.sandbox**](https://github.com/pixelartexchange/artbase.sandbox)
or [**moonbirds.sandbox**](https://github.com/pixelartexchange/moonbirds.sandbox) for real-world examples incl. pudgies, unemployable, goblintown, etc.


**artbase.js**

New artbase.js samples include:

[**Moonbirdbase**](https://pixelartexchange.github.io/artbase.js/moonbirdbase/) (10000 max.)  - query moonbird (pixel owl) metadata & images (42×42px) via sql & more - download  all-in-one single-file sqlite database (~9MB)

[**Pudgybase**](https://pixelartexchange.github.io/artbase.js/pudgybase/) (5000 max.) - query pudgy (penguin) metadata & images (28×28px) via sql & more - download all-in-one single-file sqlite database (~5MB)

[**Unemployablebase**](https://pixelartexchange.github.io/artbase.js/unemployablebase/) (5000 max.) - query unemployable metadata & images (24×24px) via sql & more - download all-in-one single-file sqlite database (~2MB)

and more

Note: Yes, the readymade artbase.db for easy download samples are built with the new artbase build machinery (see above). 


**Questions? Comments?**

Post them on the [D.I.Y. Punk (Pixel) Art reddit](https://old.reddit.com/r/DIYPunkArt). Thanks.

