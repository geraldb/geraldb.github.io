


## Upcoming (In-Person Live) Talks - Join Us

Wed., September 21st, 2022 - (FREE) Live Meetup 20 min. Talk  - [**Inside Punkbase - SQLite (SQL.js) In Action @ Stahlstadt.js (Linz, Austria) »**](https://old.reddit.com/r/DIYPunkArt/comments/x9z3tg/upcoming_free_live_meetup_20_mintalk_wed/)

Wed., October 5th, 2022  -  (FREE) Live Meetup 30 min.Talk - [**Inside the Billion Dollar $$$ (Crypto) Punk Pixel Heads @ Technologieplauscherl LXXVII (Linz, Austria) »**](https://old.reddit.com/r/DIYPunkArt/comments/xce70l/upcoming_free_live_meetup_30_mintalk_wed_october/)


##  Week 38 - Monday, September 19th to Sunday, September 25th, 2022

**blockchain research / corruption**

Austria has an "official" Austrian Blockchain Center for Research and according to the website
the researchers (or is it fraudsters?)  are always looking for "Blockchain Researcher (junior or senior)"
and even posting:

> If you haven't found the right job offer here,
> but you are convinced that your skills are a perfect match for ABC Research, 
> then you are welcome to apply for a job at ABC.

Believe it or not - I applied already twice - the first time back in May I got back a (standard) response
that sorry we plan to fill the open position with a women.   Now this crypto winter (or is it this summer?)
I checked back and saw all this new or (fake?) open blockchain positions and applied again and
after no response all August I got an invitation in September for an in-person interview from 9:30 to 11:00h.

While the two all-female secretaries were friendly and welcoming
the interview with the two all-male "researchers" - Klaus Pirklbauer, the blockchain fraudster-in-chief,
and  - Stefan Craß, the no-code blockchain researcher - 
soon went downhill  - I guess talking about open data & open finance and how open source is all about working together (and, yes, researching for the public good) and such didn't really connect and I got practically thrown out after about half an hour (the official time slot was an hour and half)
and two weeks later the email confirmed that we don't want to ever see you again!

For the record - here's my little public blockchain research corner online - [**Blockchain! Blockchain! Blockchain!**](https://github.com/openblockchains) - among many others - 
and here's the million dollar research center - [**Austrian Blockchain Center (ABC)**](https://www.abc-research.at) - with no public code or anything - the best to find is some public discussion / debate 
panel recordings. No warning that blockchain is (mostly) a narrative to scam and fill your own pocket or anything.
Guess what - the Austrian blockchain researcher are top quality (scammers) - and, yes, they pocket the "research" money from the state and
from private companies. Bingo!

Note:  For fairness (I am always happy to be proven wrong) I sent an email to  Klaus Pirklbauer, the blockchain fraudster-in-chief,
and  - Stefan Craß, the no-code blockchain researcher - and the ABC office asking "Where's the (Blockchain) Code?" and to help
with setting the record straight.  Response?  I keep you posted - stay tuned. (Update: Tue Sept/20th) The official response and confirmation is in  and - surprise, surprise - there's no public (blockchain) code online anywhere at best only top-secret private (in-house) code 
and no reasearch on public blockchains only on private permissioned "blockchchains" with proof-of-authority better known as "old-school" databases requiring login credentials for updates.   A simulacrum selling itself as Austria's one-stop top state-of-the-art blockchain research center that is in reality without any expertise on public blockchains whatsoever or any public warnings on the ongoing  private permissioned proof-of-authority blockchain scams (still working in 2022!). You have been warned.     



**moonbirds**

To wrap-up work on the newly published all official 42x42px attributes for the moonbirds by Proof Collective (on github)
I put together an all-in-one spritesheet, that is, spritesheet_v1-42x42.png:

![](https://github.com/pixelartexchange/moonbirds.sandbox/raw/master/moonbirds-official/i/spritesheet_v1-42x42.png)

See the spritesheet in action! I added a new Moonbird V1 image generator to the 
[**moonbirds (image generator) library / gem**](https://github.com/pixelartexchange/pixelart/tree/master/moonbirds).

Moonbirds V1 Trivia (Did You Know?) Aside -  Easter eggs - The official
attributes include about a dozen super-rare never-before-seen (& used)
legendary attributes (eyes, eyewear, headwear) for cosmic, enlightened, & jade moonbirds (incl. a unicorn horn!). 




**Questions? Comments?**

Post them on the [D.I.Y. Punk (Pixel) Art reddit](https://old.reddit.com/r/DIYPunkArt). Thanks.


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


