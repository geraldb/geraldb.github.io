---
layout: default
title: Jekyll Notes
---


## From Markdown (.md) to Hypertext (.html)

To get your page processed by jekyll add yaml front matter. Example

    ---
    title:  My Title
    ---

And use a known file extension e.g. md or markdown for your page e.g. mypage.md or mypage.markdown 


From the docu:

Provided that the file has a YAML Front Matter section, it will be transformed by Jekyll. The same will happen for any .html, .markdown, .md, or .textile file
in your site's root directory or directories not listed above.

Q: does it work for file with just .md extension? or is a front matter required?


## Excluding Folders and Files

To exclude folders from processing. Add the folder (e.g. myfolder) to the exclude
setting in the \_config.yml configuration. Example

    exclude: ["myfolder", "README.md", "Rakefile", "geraldb.github.com.kpf"]


## Using Markdown

### Configure Markdown Engine

Using the markdown setting in \_config.yml lets you select your markdown engine. Example:

    markdown: redcarpet


## Troubleshooting Jekyll for GitHub Pages

GitHub's Pages servers currently use Jekyll 0.11.0 with Liquid 2.2.2,
and run it using this command:

    $ jekyll --pygments --no-lsi --safe

Note: The Jekyll version installed on Github, that is, 0.11.0, does NOT yet support
Redcarpet2.


### Configure Fenced Code Blocks 

How? Possible w/ 0.11.0 ???


    redcarpet:
      extensions: [fenced_code_blocks]


     markdown: redcarpet2
     redcarpet:
       extensions: ["no_intra_emphasis", "fenced_code_blocks", "autolink", "tables",     "with_toc_data"]

todo/fix

## More Docu and Examples

### Packages 

* [Jekyll Bootstrap](http://jekyllbootstrap.com) by Jade Dominguez 
* [Octopress](http://octopress.org) by Brandon Mathis

### Articles

* [Zero to Jekyll in 20 minutes](http://rubysource.com/zero-to-jekyll-in-20-minutes) by Jonathan Jackson, (Ruby Source), April 2012
* [Jekyll Introduction](http://jekyllbootstrap.com/lessons/jekyll-introduction.html) by Jade Dominguez, (Jekyll Bootstrap) Dezember 2011
 
