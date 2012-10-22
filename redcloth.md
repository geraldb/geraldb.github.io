---
title: RedCloth Cookbook - How Tos - Recipes - F.A.Qs - Using the Ruby Plain Text to Markup Gem
### tags: redcloth textile texttohtml wikimarkup gem
---

## {{page.title}}

What's Textile? What's RedCloth?
Textile is a wiki-style markup language that's easy-to-write and easy-to-read and that lets you author web pages in plain text. RedCloth is the Ruby gem that lets you use Textile in Ruby.

<!-- more -->

h3. Using RedCloth

The RedCloth class is an extension of Ruby's String class. Use it like you use a String:

{{{
>> doc = RedCloth.new "*strong words* and _emphasized words_"
=> "*strong words* and _emphasized words_" 
}}}

To generate web markup (HTML) from your RedCloth object, use the @RedCloth#to_html@ method:

{{{
>> doc.to_html
=> "<p><strong>strong words</strong> and <em>emphasized words</em></p>" 
}}}

That's it.  Now on to the RedCloth Cookbook and the How Tos and Recipes.

h3. How to use the @redcloth@ command line tool

Once you have the RedCloth gem installed you get a command line tool for free. Try:

{{{
$ redcloth -h
}}}

Printing out:

{{{
>> Usage: redcloth [options] [redcloth_formatted.txt]
>> If no file specified, STDIN will be used. If you are typing input,
>>   you can send an EOF by pressing ^D (^Z on Windows)
>>
>>   -o, --output STYLE               Output format (defaults to html)
}}}

For example to create this page use:

{{{
$ redcloth redcloth.txt > redcloth.html
}}}

h3. How to turn off/disable hard line breaks

Traditional Textile and RedCloth (starting with version 4.0 and up) convert single newlines to break tags (@<br>@) in web markup e.g.:

{{{
>> RedCloth.new( "some text\nsome more text\nand some more\n" ).to_html
}}}

Results in:

{{{
=> "<p>some text<br />\nsome more text<br />\nand some more</p>"
}}}

If you want to turn off/disable hard line breaks use:

{{{
>> doc = RedCloth.new( "some text\nsome more text\nand some more\n"  )
>> doc.hard_breaks = false
>> doc.to_html
}}}

Resulting in:

{{{
=> "<p>some text\nsome more text\nand some more</p>"
}}}

h3. How to turn off span caps

Textile wraps @<span>@ tags around capitalized words by default e.g.:

{{{
>> RedCloth.new( "some acronyms/all-cap words: HTTP, HTML, URI" ).to_html
}}}

Results in:

{{{
=> "<p>some acronyms/all-cap words: <span class=\"caps\">HTTP</span>,
<span class=\"caps\">HTML</span>, <span class=\"caps\">URI</span></p>"
}}}

If you want to turn off span caps use:

{{{
>> RedCloth.new( "some acronyms/all-cap words: HTTP, HTML, URI", [:no_span_caps] ).to_html
}}}

Resulting in:

{{{
=> "<p>some acronyms/all-cap words: HTTP, HTML, URI</p>"
}}}

h3. How to extend Textile with your own rules

See the "Smiley Extension Test Case":http://github.com/jgarber/redcloth/tree/master/test/test_extensions.rb.

h3. How to extend Textile with your own tags

See the "Figure Custom Tag Test Case":http://github.com/jgarber/redcloth/tree/master/test/test_custom_tags.rb.

h3. References

Official References:

* "RedCloth Project Site":http://redcloth.org
* "RedCloth Mailing List":http://rubyforge.org/mailman/listinfo/redcloth-upwards
* "RedCloth Code/Developer Site":http://github.com/jgarber/redcloth
* "RedCloth Code/API Docs":http://redcloth.rubyforge.org


Questions, comments, corrections, updates? Send them along to the "RedCloth mailing list":http://rubyforge.org/mailman/listinfo/redcloth-upwards
or the <%= forum %>. Thanks!
