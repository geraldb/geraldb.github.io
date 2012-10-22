---
title: How to use Google's SMTP server and Gmail to send emails with Ruby
## tags:  google actionmailer gmail smtp_tls
---

## {{page.title}}

Let's send an email using Google's Gmail server in three easy steps (works for Google Apps for your Domain hosted accounts too!).

* Step 1: Create a @Mailer@ class
* Step 2: Setup the Google (Gmail) SMTP server for @ActionMailer@
* Step 3: Deliver the email message

<!-- more -->

The @ActionMailer@ gem shipping with Ruby on Rails (but also working as a free-standing library without Rails as used in this how-to) lets you send emails using Simple Mail Transfer Protocol (SMTP) servers.  Google's SMTP servers require Transport Layer Security (TLS) that thanks to Anatol Pomozov's little @smtp_tls@ hack gets monkey patched into the underlying @Net::SMTP@ library.

Let's get started and let's create a Ruby script named @announce.rb@ and include the 
required libraries/scripts:

{{{
require 'action_mailer'
require 'smtp_tls'
}}}

Note, you can grab the sources for this how-to from the "Vancouver.rb repository":http://vanrb.rubyforge.org/svn/gmail.

h3. Step 1:  Create a @Mailer@ class

Next, let's create an @ActionMailer@ subclass for our announcement email. We will create a reminder message for
 the weekly Vancouver.rb Hack Night every Monday.

{{{
class AnnounceMailer < ActionMailer::Base

  def hack_night_message(recipient)
    from 'gerald@vanbeta.com'
    recipients recipient
    subject 'Reminder: Open Ruby Hack Night #6 - Monday 7pm - Whenever (9ish) @ Waves Coffee'
    body <<EOS
Hello,

  Just a reminder that you're invited to drop by for the weekly
Vancouver Open Ruby Hack Night at Waves Coffee (offering free wireless)
in downtown Vancouver at the Hastings and Richards corner one block
from the Harbour Centre.

  If you plan to drop by and you're new I invite you to send a posting
to this list so it's easier to connect at Waves Coffee.

  More info @ http://vanrb.com   Cheers.
EOS
  end
end
}}}

That's it. Let's test the email message by printing it to our screen first:

{{{
puts AnnounceMailer.create_hack_night_message( 'vanrb@googlegroups.com' )
}}}

Will print:

{{{
From: gerald@vanbeta.com
To: vanrb@googlegroups.com
Subject: Reminder: Open Ruby Hack Night #6 - Monday 7pm - Whenever (9ish) @ Waves Coffee
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8

Hello,

  Just a reminder that you're invited to drop by for the weekly
Vancouver Open Ruby Hack Night at Waves Coffee (offering free wireless)
in downtown Vancouver at the Hastings and Richards corner one block
from the Harbour Centre.

  If you plan to drop by and you're new I invite you to send a posting
to this list so it's easier to connect at Waves Coffee.

  More info @ http://vanrb.com   Cheers.
}}}

h3. Step 2: Setup the Google (Gmail) SMTP server for @ActionMailer@

Next, lets set the Google SMTP server settings for @ActionMailer@. All you need is your email address and your password.  Replace the @user_name@ and @password@ settings with your own.

{{{
ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain,
  :user_name => 'gerald@vanbeta.com',
  :password => 'secret'
} 
}}}

That's all there is to the setup.  

h3. Step 3: Deliver the email message

Now let's send out the email with a one liner:

{{{
AnnounceMailer.deliver_hack_night_message( 'vanrb@googlegroups.com' )
}}}

That's it. Run the script to try it yourself (using your own message and email settings):

{{{
$ ruby announce.rb
}}}

<!-- comments -->