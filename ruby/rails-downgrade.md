## Rails Tip of the Day - Use Magic Version Tag to "Downgrade" Rails to Older Version When Generating New Project

<!-- tags:  rails rubygems -->


Let's say you try to follow a tutorial or book written for an older version of Rails - lets say Rails 2.0.2 or even Rails 1.2.6. With the "magic" version tag you can "downgrade" Rails to an older version when generating your new project.  

<!-- more -->


### Step 1: Check the Rails version installed

Issue the command:

```
$ gem list rails
```

to check what Rails version you have installed resulting in:

```
*** LOCAL GEMS ***

rails (2.1.0, 2.0.2)
```

If the older Rails version you want to use is not yet installed on your box you can install it using the @gem@ command with the @--version/-v@ switch. Example:

```
$ gem install rails -v 1.2.6
```


### Step 2: Generate new Rails project with magic version tag to "downgrade" to older version

Let's generate a new Rails project requesting version 2.0.2 using the magic version tag:

```
rails _2.0.2_ hola
```

And if you want to include a command line switch to use a different database - lets say MySQL - use:

```
rails _2.0.2_ -d mysql hola
```

That's all there is to it. Note, that the "magic" version tag goes first and requires leading and trailing underscores (_).



### Step 3: Check your version

To wrap up you can check that everything is working and setup using the older version by changing to your app folder and running the about script:

```
$ cd hola
$ ruby script/about
```

Resulting in:

```
About your application's environment
Ruby version              1.8.6 (i386-mswin32)
RubyGems version          1.2.0
Rails version             2.0.2
Active Record version     2.0.2
Action Pack version       2.0.2
Active Resource version   2.0.2
Action Mailer version     2.0.2
Active Support version    2.0.2
Application root          c:/src/test/hola
Environment               development
Database adapter          mysql
Database schema version   1
```




