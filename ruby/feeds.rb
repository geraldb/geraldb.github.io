require 'rss'
require 'open-uri'

puts "RSS::VERSION #{RSS::VERSION}"
 

feed  = RSS::Parser.parse( 'http://vanrb.wordpress.com/feed' )

puts "==  #{feed.channel.title} =="

feed.items.each do |item|
  puts "- #{item.title}"
  puts "  (#{item.link})"
  puts
  # puts item.description
  # puts item.content_encoded
end

feed = RSS::Parser.parse( 'http://vanrb.wordpress.com/feed/atom' )

puts "== #{feed.title.content} ==" 

feed.items.each do |item|
  puts "- #{item.title.content}" 
  puts "  (#{item.link.href})" 
  puts
  # puts item.content.content 
end
