---
layout: default
title: How to build, package and publish gems with Hoe Rake tasks - From zero to RubyForge in 10 minutes
tags:  gem hoe rake rdoc rubyforge rubygems
---

## {{page.title}}

What's Hoe? [Hoe](http://seattlerb.rubyforge.org/hoe) is a gem that bundles ready-to-use Rake tasks
to help you build, package and publish your own gems.

Let's create a bare bones gem (`hellohoe`) and publish it on RubyForge.

<!-- more -->

### Setting up Hoe by adding build script, readme, change log and manifest

To use Hoe together with your own code use the following structure.
You can grab all files from this article from the [GitHub repository](https://github.com/geraldb/sandbox/tree/master/hellohoe).

```
/hellohoe
  + README.txt        - Description in plain text 
  + History.txt       - Version change log in plain text
  + Manifest.txt      - List of all files to include in plain text
  + Rakefile          - Build script (requires your name and email)  
  + /lib
     + hellohoe.rb    - Ruby code to bundle up into gem here
```

Let's look at `hellohoe.rb`:

```
class HelloHoe
  VERSION = '0.1'
   
  # your code here
end
```

Hoe requires a `VERSION` string/constant in your Ruby code that you can reference in your build script.
Let's look at the build script (`Rakefile`) next:

```
require 'hoe'
require './lib/hellohoe.rb'

Hoe.new('hellohoe', HelloHoe::VERSION) do |p|
  
  p.author = '[Your Name Here]'
  p.email  = '[Your Email Here]'
  
  # or use shortcut
  # p.developer( '[Your Name Here]', '[Your Email Here]' )
  
end
```

As a minimum Hoe requires you to set the author and email fields in the gem spec.
As a shortcut you can use the `developer` method to set it all at once.

Next Hoe requires a readme in plain text stored in `README.txt`:

```
= hellohoe

* http://vanrb.rubyforge.org/hellohoe

== DESCRIPTION:

Sample on how to use Hoe Rake tasks to build, package and publish gems.

== LICENSE:

The hellohoe sources are dedicated to the public domain. 
```

Hoe will use the link from the first section, that is, `vanrb.rubyforge.org/hellohoe`
to auto-fill the homepage field in the gem spec and will use the description to
auto-fill the summary field and the description in the gem spec.

Next Hoe requires a version change log in plain text stored in `History.txt`:

```
=== 0.1 / 2009-03-06

* Everything is new. First release.
```

Hoe will you use the change log to auto-fill the changes field in the gem spec
and use the change log for emails and announcements.

Finally, Hoe requires a manifest - a list of all files to include in plain text stored in `Manifest.txt`:

```
History.txt
Manifest.txt
README.txt
Rakefile
lib/hellohoe.rb
```

Now you're all set to use Hoe's Rake tasks to build, package and publish gems and more.
You can list all tasks issuing `rake -T`. Resulting in:

```
rake announce          # Create news email file and post to rubyforge.
rake audit             # Run ZenTest against the package.
rake check_extra_deps  # Install missing dependencies.
rake check_manifest    # Verify the manifest.
rake clean             # Clean up all the extras.
rake clobber_docs      # Remove rdoc products
rake clobber_package   # Remove package products
rake config_hoe        # Create a fresh ~/.hoerc file.
rake debug_gem         # Show information about the gem.
rake default           # Run the default task(s).
rake deps:email        # Print a contact list for gems dependent on this gem
rake deps:fetch        # Fetch all the dependent gems of this gem into tarballs
rake deps:list         # List all the dependent gems of this gem
rake docs              # Build the RDOC HTML Files
rake email             # Generate email announcement file.
rake flay              # Analyze for code duplication.
rake flog              # Analyze code complexity.
rake gem               # Build the gem file testhoe-0.1.gem
rake generate_key      # Generate a key for signing your gems.
rake install_gem       # Install the package as a gem.
rake package           # Build all the packages
rake post_blog         # Post announcement to blog.
rake post_news         # Post announcement to rubyforge.
rake publish_docs      # Publish RDoc to RubyForge.
rake redocs            # Force a rebuild of the RDOC files
rake release           # Package and upload the release to rubyforge.
rake repackage         # Force a rebuild of the package files
rake ridocs            # Generate ri locally for testing.
```

### Using `debug_gem`, `gem`, `package`, `install_gem` tasks

Let's try some Hoe tasks. Issue `rake debug_gem` to show the gem spec Hoe generates
from your build script settings, readme, change log and manifest.
Next, let's build the gem. Issue `rake gem`. Resulting in:

```
mkdir -p pkg
  Successfully built RubyGem
  Name: hellohoe
  Version: 0.1
  File: hellohoe-0.1.gem
mv hellohoe-0.1.gem pkg/hellohoe-0.1.gem
```

Hoe will place your gem in the `pkg` folder. If you issue `rake package` Hoe
will bundle up all your sources in a tar'ed and gzipped package
(e.g. `pkg/hellohoe-0.1.tgz`).

Next, let's test drive the gem. Issue `rake install_gem` to install the gem
(enter the sudo password if required) and try it in the Ruby console:

```
$ irb
>> require 'rubygems'
=> true
>> require 'hellohoe'
=> true
>> HelloHoe::VERSION
=> "0.1"
```

### Checking and updating your manifest with `check_manifest`

Hoe includes a task (`check_manifest`)
that lets you check the manifest against your files and see
if any files are missing or need to get added.

If you issue the task the first time you need to create a `~/.hoerc` setting file
first that includes a regex (regular expression) pattern that excludes files
from the manifest check. To create a new `~/.hoerc` file issue `rake config_hoe`. Resulting in a file such as:

```
--&#045; 
publish_on_announce: false
exclude: !ruby/regexp /tmp$|CVS|\.svn/
signing_key_file: ~/.gem/gem-private_key.pem
signing_cert_file: ~/.gem/gem-public_cert.pem
blogs: 
- extra_headers: 
    mt_convert_breaks: markdown
  blog_id: blog_id
  url: url
  password: password
  user: user
```

Now let's try `rake check_manifest`. If everything is in order (no files missing or waiting to get added).
You will see:

```
rm -r doc
rm -r pkg
rm Manifest.tmp
```

Let's create a new `Todo.txt` file and let's retry `rake check_manifest`.
Now you will see a diff:

```
@@ -2,4 +2,5 @@
 Manifest.txt
 README.txt
 Rakefile
+Todo.txt
 lib/testhoe.rb
```

In the future if you don't want to add new files by hand to your manifest you can pipe
the diff to update your manifest using `rake check_manifest | patch`.

### Using `rubyforge` gem and `release` and `publish_docs` task

Next, let's upload the gem to RubyForge using the `release` task.
Before you can upload to RubyForge you will need to setup the `rubyforge` gem
that `hoe` includes and depends on to automate its RubyForge operation.

Issue the command `rubyforge` in the shell to see a list of supported scripted operations
and detailed description of the `rubyforge` gem.

To setup the `rubyforge` gem issue the commmand `rubyforge setup` (only needed the first time).
`rubyforge` will open up the file `~/.rubyforge/user-config.yml` in your configured editor. Example:

```
--&#045; 
uri: http://rubyforge.org
cookie_jar: /home/your_login/.rubyforge/cookie.dat
is_private: false
username: your_rubyforge_login_here
password: your_password_here
```

Change the username and password to use your RubyForge site credentials.
Next, issue the command `rubyforge login` followed by `rubyforge config`.
`rubyforge config` will scrap the RubyForge site and find all your registered projects
and packages and more and store the information in the file `~/.rubyforge/autoconfig.yml`.

If you register new projects reissue the `rubyforge config` command to update your cache.

Now you're ready to use `hoe` to upload your gem to RubyForge.
Issue the command `rake release` and pass along the required RubyForge release version. Example:

```
$ rake release VERSION=0.1
```

Check your RubyForge project site if it all worked. Note, that it will take five or more minutes until
your uploaded gem gets added to the public RubyForge gem index.
You can check if your gem is available using the `list` command with the `-r` (remote) switch.
Example:

```
$ gem list hellohoe -r
```

Lastly, lets create the auto-generated documention using RDoc and
upload the online documention to your RubyForge site.
To generate documention use the `docs` task. Issue the command `rake docs`
and open up the file `doc/index.html` in your browser to check the results.
If you want to upload the generated documentation web pages plus support files
use the `publish_docs` task.

That's it.

<!-- comments -->

### Appendix: Bonus - Using multiple packages for one RubyForge project a la Seattle.rb, NYC.rb or CodeForPeople

If you use multiple packages per RubyForge project
include the name of the RubyForge project in your build script. Example:

```
Hoe.new('hellohoe', HelloHoe::VERSION) do |p|  
  p.rubyforge_name = '[Your RubyForge Top Project Here]'

  p.author = '[Your Name Here]'
  p.email  = '[Your Email Here]' 
end
```

If you want to create new (sub)package for a project you can use `rubyforge create_package <new_package> <project>`.
Example:

```
$ rubyforge create_package hellohoe vanrb
```

As an alternative you can add new packages to your project on the RubyForge site by hand.
If you add packages by hand, update your RubyForge cache issuing `rubyforge config` before
continuing on with any Hoe Rake tasks.


References:

* [Hoe Project Site and Documentation](http://seattlerb.rubyforge.org/hoe)
* [Tutorial: Publishing RubyGems with Hoe](http://nubyonrails.com/articles/tutorial-publishing-rubygems-with-hoe) by Geoffrey Grosenbach 
* [rubyforge Project Site](http://codeforpeople.rubyforge.org/rubyforge)
* [Using `rubyforge` Guide](http://newgem.rubyforge.org/rubyforge.html) by Nic Williams  

Alternatives:

* [NewGem](http://newgem.rubyforge.org)
* [Echoe](http://blog.evanweaver.com/files/doc/fauna/echoe/files/README.html)
* [Mr. Bones](http://codeforpeople.rubyforge.org/bones)
* [Jeweler](http://github.com/technicalpickles/jeweler)
