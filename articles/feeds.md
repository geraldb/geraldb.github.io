---
title: How to read web feeds (RSS, Atom) using the standard Ruby library
# tags: atom rss
---

##  {{page.title}}

Ruby ships with a standard library that lets you read web feeds in the "classic"
Really Simple Syndication (RSS) flavors (0.9x/1.0/2.0) and in the "modern" Atom Publishing format. Let's try it all out pulling web feeds from the Vancouver.rb site.

<!-- more -->

### Task I: Reading Really Simple Syndication (RSS) Feeds

Let's read in a "classic" web feed in the Really Simple Syndication (RSS) format pulled from the Vancouver.rb site and print out the latest headlines.

```
require 'rss'
require 'open-uri'

feed  = RSS::Parser.parse( 'http://vanrb.wordpress.com/feed' )

puts "==  #{feed.channel.title} =="

feed.items.each do |item|
  puts "- #{item.title}"
  puts "  (#{item.link})"
  puts
end
```

Prints:

```
==  Vancouver Ruby & Rails Central ==

- Vancouver.rb Q&A with Adam Palmblad on Startup TeamPages.com, Ruby on Rails, and More
  (http://vanrb.wordpress.com/2008/06/12/adampalmblad/)

- Ruby/Rails Meetup - Inside DogOnRails - A Wifidog Auth Server w/ Joe Bowser
  (http://vanrb.wordpress.com/2008/05/08/june-meetup/)

- Vancouver.rb Q&A with Brock Whitten on Rails, Getting Off Rails (Merb), PmpknPi and More
  (http://vanrb.wordpress.com/2008/03/10/brockwhitten/)

- Vancouver.rb Project Spotlight: Slide Show (S9) - A Free Web Alternative to PowerPoint and KeyNote
  (http://vanrb.wordpress.com/2008/02/29/s9/)
```

To include a post's summary use @item.description@ or to include a post's full-text use @content_encoded@. Example:

```
puts item.description
puts item.content_encoded
```

That's it. Next, let's try to read in a "modern" web feed in the Atom Publishing format pulled again from the Vancouver.rb site.

### Detour: Upgrade your standard RSS library to get Atom Publishing support

Note, that the standard RSS library supports the Atom Publishing format since version 0.1.8 (the latest version is 0.2.4). To check up what version ships with your Ruby
installation use the @RSS::VERSION@ constant. Example:

```
puts "RSS::VERSION #{RSS::VERSION}"
```

Prints:

```
RSS::VERSION 0.1.6
```

Ooops. We need to upgrade! Let's grab the latest version from the "Ruby Application Archive (RAA)":http://raa.ruby-lang.org/project/rss and try again.

```
RSS:VERSION 0.2.4
```

Ready to roll. 

### Task II: Reading Atom Publishing Feeds

Let's pull a "modern" web feed in the Atom Publishing format from the Vancouver.rb site and print out the latest headlines.

```
feed = RSS::Parser.parse( 'http://vanrb.wordpress.com/feed/atom' )

puts "== #{feed.title.content} =="

feed.items.each do |item|
  puts "- #{item.title.content}"
  puts "  (#{item.link.href})"
  puts
end
```

And use @item.content.content@ to get a post's full-text. That's it.

Note, that the standard library maps the different web feed flavors 1:1 to Ruby fields reflecting the different formats e.g. the feed title stored in @feed.channel.title@ in RSS 0.9x/2.0 becomes @feed.title.content@ in Atom 
  and the feed item's full-text stored in @feed.item.content_encoded@ in RSS 2.0 becomes @feed.item.content.content@ in Atom (Yes, it's @content.content@). Welcome to the wonderful world of web feed formats. 

### Appendix: Alternative libraries to read web feeds in Ruby

* "Simple RSS":http://simple-rss.rubyforge.org
* "FeedTools":http://sporkmonger.com/projects/feedtools
* "rFeedParser":http://rfeedparser.rubyforge.org
* "Feed Normalizer":http://feed-normalizer.rubyforge.org

Any libraries missing? <%= comments %>
