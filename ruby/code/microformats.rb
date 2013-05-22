require 'mofo'
require 'pp'

event = hCalendar.find 'http://upcoming.yahoo.com/event/448518/'

# Print the event's one-line summary

puts event.summary

# Print the event's start date

puts event.dtstart

# Print the event's description:

puts event.description

# Pretty print the hCard microformat data for the event's location

pp event.location

# Print the event's venue name (fn stands for full name)

puts event.location.fn

# Print the event's venue locality, that is, the city, village, or hamlet

puts event.location.adr.locality

# Print the event's venue street address

puts event.location.adr.street_address

# Pretty print the complete hCalendar microformat data
 
pp event

