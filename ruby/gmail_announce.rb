require 'action_mailer'
require 'smtp_tls'

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

puts AnnounceMailer.create_hack_night_message( 'vanrb@googlegroups.com' )

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain,
  :user_name => 'gerald@vanbeta.com',
  :password => 'secret'
} 

AnnounceMailer.deliver_hack_night_message( 'vanrb@googlegroups.com' )

 
 
