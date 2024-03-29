## Mofo - Getting Started w/ Microformats using Ruby - Web 3.0 In Action

<!--
tags: microformats giantglobalgraph hcalendar hcard mofo semanticweb web30
-->

What are Microformats? Microformats let you turn your web page into a web service
using nothing more than simple coding conventions and patterns that work in today's browsers.
If you markup events, people, reviews, locations and more in your web page
using Microformats you contribute to the next version of the web - known as the Semantic Web, Web 3.0 or the Giant Global Graph (GGG).

Let's skip the theory and dive into code and tap into the Giant Global Graph.

Let's load up the event listing web page for the "Microformats - Adding Semantics to Your Web Site"
VanDev meetup on the Yahoo! Upcoming service using [mofo - a microformat parser in Ruby](http://mofo.rubyforge.org).

<!-- more -->

``` ruby
require 'mofo'
require 'pp'

event = hCalendar.find 'http://upcoming.yahoo.com/event/448518/'
```

Using `hCalendar.find` we tell the mofo microformat parser to look for all events marked up in the web page using the `hCalendar` microformat standard.

That's all. Now we're ready to play with the event data:

``` ruby
puts event.summary
```

Prints the events one-line summary:

=> VanDev: Microformats - Adding Semantics to Your Web Site - Web 3.0 in Action

``` ruby
puts event.dtstart
```

Prints the event start date:

=> Wed Apr 16 19:00:00 -0700 2008

``` ruby
puts event.description
```

Prints the event description:

=> In April we have a presentation by Gerald Bauer on Microformats, a web markup practice that enables better automated processing of existing data by attaching semantics. Join us as Gerald shows us what Microformats are and what's being done with them.

Using the pretty printer (`pp`) module we can print the `hCard` microformat inside the `hCalendar` microformat used to markup the event's venue name and address:

``` ruby
pp event.location
```

Pretty prints the `hCard` microformat data:

```
#<HCard:0x6804750
 @adr=
  #<Adr:0x681779c
   @locality="Vancouver",
   @postal_code="",
   @properties=["street_address", "region", "postal_code", "locality"],
   @region="British Columbia",
   @street_address="800 Robson St.">,
 @fn="UBC Robson Square",
 @org="UBC Robson Square",
 @properties=["fn", "adr", "org"]>
```

We can, of course, print the items one at a time:

``` ruby
puts event.location.fn
```

Prints the event's venue name and fn stands for full name:

=> UBC Robson Square

``` ruby
puts event.location.adr.locality
```

Prints the event's venue locality, that is, the city, village, or hamlet:

=> Vancouver

``` ruby
puts event.location.adr.street_address
```

Prints the event's venue street address:


=> 800 Robson St.

And so on and so forth. To see the fully monty pretty print the `hCalendar` microformat and stand back 1000 meters:

```
pp event
```

That's all to get started using Microformats in Ruby thanks to the mofo parser library. Note, you can grab the source for this article from the [Vancouver.rb repository](http://vanrb.rubyforge.org/svn/microformats).



