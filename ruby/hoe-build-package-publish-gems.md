---
title: How to build, package and publish gems with Hoe Rake tasks
## tags:  ruby gem hoe rake rdoc rubygems
---

# {{ page.title }}

What's Hoe? [Hoe](https://github.com/seattlerb/hoe) is a gem that bundles ready-to-use Rake tasks
to help you build, package and publish your own gems.

Let's create a bare bones gem (`hellohoe`) and publish it on RubyGems.

## Setting up Hoe by adding build script, readme, change log and manifest

To use Hoe together with your own code use the following structure.

You can grab all files from this article from the [`hellohoe` GitHub repository](https://github.com/geraldb/hellohoe).

~~~
/hellohoe
  + README.txt        - Description in plain text 
  + History.txt       - Version change log in plain text
  + Manifest.txt      - List of all files to include in plain text
  + Rakefile          - Build script (requires your name and email)  
  + /lib
     + hellohoe.rb    - Ruby code to bundle up into gem here
~~~

Let's look at `hellohoe.rb`:

~~~
class HelloHoe
  VERSION = '0.1'
   
  # your code here
end
~~~

Hoe requires a `VERSION` string/constant in your Ruby code that you can reference in your build script.
Let's look at the build script (`Rakefile`) next:

~~~
require 'hoe'
require './lib/hellohoe.rb'

Hoe.spec 'hellohoe' do
  self.version = HelloHoe::VERSION

  self.author  = '[Your Name Here]'
  self.email   = '[Your Email Here]'
  
  # or use shortcut
  # self.developer( '[Your Name Here]', '[Your Email Here]' )
end
~~~

As a minimum Hoe requires you to set the author and email fields in the gem spec.
As a shortcut you can use the `developer` method to set it all at once. 

Next Hoe requires a readme in plain text stored in `README.txt`:

~~~
= hellohoe

* https://github.com/geraldb/hellohoe

== DESCRIPTION:

Sample on how to use Hoe Rake tasks to build, package and publish gems.

== LICENSE:

The hellohoe sources are dedicated to the public domain. 
~~~

Hoe will use the link from the first section, that is, `github.com/geraldb/hellohoe`
to auto-fill the homepage field in the gem spec and will use the description to
auto-fill the summary field and the description in the gem spec.

Next Hoe requires a version change log in plain text stored in `History.txt`:

~~~
=== 0.1 / 2013-11-19

* Everything is new. First release.
~~~

Hoe will you use the change log to auto-fill the changes field in the gem spec
and use the change log for emails and announcements.

Finally, Hoe requires a manifest - a list of all files to include in plain text stored in `Manifest.txt`:

~~~
History.txt
Manifest.txt
README.txt
Rakefile
lib/hellohoe.rb
~~~

Now you're all set to use Hoe's Rake tasks to build, package and publish gems and more.
You can list all tasks issuing `rake -T`. Resulting in:

~~~
rake announce              # publish   # Announce your release.
rake audit                 # test      # Run ZenTest against the package.
rake check_extra_deps      # deps      # Install missing dependencies.
rake check_manifest        # debug     # Verify the manifest.
rake clean                 # clean     # Clean up all the extras.
rake clobber_docs          # publish   # Remove RDoc files
rake clobber_package       # package   # Remove package products
rake config_hoe            # debug     # Create a fresh ~/.hoerc file.
rake dcov                  # publish   # Generate rdoc coverage report
rake debug_email           # publish   # Generate email announcement file.
rake debug_gem             # debug     # Show information about the gem.
rake default               # test      # Run the default task(s).
rake deps:email            # deps      # Print a contact list for gems dependent on this gem
rake deps:fetch            # deps      # Fetch all the dependent gems of this gem into tarballs
rake deps:list             # deps      # List all the dependent gems of this gem
rake docs                  # publish   # Generate rdoc
rake gem                   # package   # Build the gem file hellohoe-0.1.gem
rake generate_key          # signing   # Generate a key for signing your gems.
rake install_gem           # package   # Install the package as a gem.
rake install_plugins       # deps      # Install missing plugins.
rake newb                  # newb      # Install deps, generate docs, run tests/specs.
rake package               # package   # Build all the packages
rake post_blog             # publish   # Post announcement to blog.
rake publish_docs          # publish   # Publish RDoc to wherever you want.
rake release               # package   # Package and upload; Requires VERSION=x.y.z (optional PRE=a.1)
rake release_sanity        # package   # Sanity checks for release
rake release_to_gemcutter  # gemcutter # Push gem to gemcutter.
rake repackage             # package   # Force a rebuild of the package files
rake ridocs                # publish   # Generate ri locally for testing.
~~~

## Using `debug_gem`, `gem`, `package`, `install_gem` tasks

Let's try some Hoe tasks. Issue `rake debug_gem` to show the gem spec Hoe generates
from your build script settings, readme, change log and manifest.
Next, let's build the gem. Issue `rake gem`. Resulting in:

~~~
mkdir -p pkg
  Successfully built RubyGem
  Name: hellohoe
  Version: 0.1
  File: hellohoe-0.1.gem
mv hellohoe-0.1.gem pkg/hellohoe-0.1.gem
~~~

Hoe will place your gem in the `pkg` folder. If you issue `rake package` Hoe
will bundle up all your sources in a tar'ed and gzipped package
(e.g. `pkg/hellohoe-0.1.tgz`).

Next, let's test drive the gem. Issue `rake install_gem` to install
the gem and try it in the Ruby console:

~~~
$ irb
>> require 'hellohoe'
=> true
>> HelloHoe::VERSION
=> "0.1"
~~~

## Checking and updating your manifest with `check_manifest`

Hoe includes a task (`check_manifest`)
that lets you check the manifest against your files and see
if any files are missing or need to get added.

If you issue the task the first time you need to create a `~/.hoerc` setting file
first that includes a regex (regular expression) pattern that excludes files
from the manifest check. To create a new `~/.hoerc` file issue `rake config_hoe`.
Resulting in a file such as:

~~~
---
exclude: !ruby/regexp /tmp$|CVS|TAGS|\.(svn|git|DS_Store)/
signing_key_file: ~/.gem/gem-private_key.pem
signing_cert_file: ~/.gem/gem-public_cert.pem
publish_on_announce: true
blogs:
- user: user
  password: password
  url: url
  blog_id: blog_id
  extra_headers:
    mt_convert_breaks: markdown
~~~

Now let's try `rake check_manifest`. If everything is in order (no files missing or waiting to get added).
You will see:

~~~
rm -r doc
rm -r pkg
rm Manifest.tmp
~~~


%%% todo: add windows tip / configure with git end of line for manifest.txt
%%  unix LF only  - windows will use LF and CR.


Let's create a new `Todo.txt` file and let's retry `rake check_manifest`.
Now you will see a diff:

~~~
@@ -2,4 +2,5 @@
 Manifest.txt
 README.txt
 Rakefile
+Todo.txt
 lib/hellohoe.rb
~~~

In the future if you don't want to add new files by hand to your manifest you can pipe
the diff to update your manifest using `rake check_manifest | patch`.

## Using the `release` task to upload (push) your gem To RubyGems.org

Next, let's upload (push) the gem to RubyGems.org using the `release` task.

Before you can upload to RubyGems.org you will need to setup an account and save your RubyGems.org API
key on your computer.
Issue the command to store your RubyGems.org API key on your computer (only needed the first time):

~~~
$ curl -u carlos https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials
Enter host password for user 'carlos':
~~~

%%% fix: add explanation on how to do it "manually" without curl (get API from site etc.)
%%  check if there's any docu online
%%
%%
%% To find your API key, click on your username when logged in to RubyGems.org
%% and then click on ‘Edit Profile’.

Now you're ready to use `hoe` to upload (push) your gem to RubyGems.org
without requiring to enter a user and password.
Issue the command `rake release` and pass along the required release version. Example:

~~~
$ rake release VERSION=0.1
~~~

Check your RubyGems.org project site if it all worked.
Note, that it will take a minute or more untilyour uploaded gem gets added to the public RubyGems index.
You can check if your gem is available using the `list` command with the `-r` (remote) switch.
Example:

~~~
$ gem list hellohoe -r

*** REMOTE GEMS ***

hellohoe (0.0.1)
~~~

That's it.


%% fix: add/fix generate rdoc and upload?

## Appendix: Bonus - Using multiple packages for one RubyForge project a la Seattle.rb, NYC.rb
or CodeForPeople


Lastly, lets create the auto-generated documention using RDoc and
upload the online documention to your RubyForge site.
To generate documention use the @docs@ task. Issue the command @rake docs@
and open up the file @doc/index.html@ in your browser to check the results.
If you want to upload the generated documentation web pages plus support files
use the @publish_docs@ task.


%%%%%%%
%%
%% fixes/todos:
%%
%%  -use separate version.rb file (best practice)
%%  -use README.md and History.md  in Markdown format instead of RDOC with .txt extension



## Links

### Hoe References

* [Hoe Project Site and Documentation](https://github.com/seattlerb/hoe)
* [Tutorial: Publishing RubyGems with Hoe](http://nubyonrails.com/articles/tutorial-publishing-rubygems-with-hoe) by Geoffrey Grosenbach 

### Gems References

* [RubyGems Guide - Make Your Own Gem](http://guides.rubygems.org/make-your-own-gem)
* [RubyGems API Docu](http://guides.rubygems.org/rubygems-org-api)

### Alternatives

* [NewGem](http://newgem.rubyforge.org)
* [Echoe](http://blog.evanweaver.com/files/doc/fauna/echoe/files/README.html)
* [Mr. Bones](http://codeforpeople.rubyforge.org/bones)
* [Jeweler](http://github.com/technicalpickles/jeweler)
