module TextHelper
  
  def more()
    # todo: do we need textile markup guards? yes - do it.
    "<!--more--><a name='more'></a>"
  end
  
  def excerpt(page)
    
    # how to set layout is nil? layout nil required/needed?
    content = render( page )
    
    
    if content =~ /<!--more-->/
      content.sub!(/<!--more-->.*/m, '')
      # strip h1/h2 headings
      content.sub!(/<h[12].*\/h[12]>/m, '' )
       
      content << "<p><a href='#{page.url}#more'>Read More &raquo;</a></p>"
    else
      puts "*** warning: no excerpt found for article '#{page.path}'"
      content = '-no excerpt found-'
    end
    
    content
  end
  
  def forum()
    %Q{"Vancouver.rb Mailing List/Forum":http://forum.vanrb.com}
  end
  
  def comments()
    %Q{Questions? Comments? Corrections? Send them along to the #{forum}. Thanks!}
  end
  
  def facebook_comments()
    %Q{Questions? Comments? Corrections? Send them along to the "Facebook for Ruby Mailing List/Forum":http://groups.google.com/group/rfacebook. Thanks!}
  end
  
  def article_meta( page )
    # todo: use codeforpeople tagz gem?

    content = "<div class='meta'>"
    content << "<span class='signature'>Last Update: #{page.mtime}</span> | "
    content << posted_in_tags( page )
    content << "</div>"
    
    content
  end
  
  def posted_in_tags( page )
    return '' unless page.tags
    
    content = "<span class='tags'>Posted in "
    page.tags.split( /[ ,]/ ).each_with_index do |tag,i|
      content << ', ' if i > 0
      content << "<a href='/tag/#{tag}.html'>#{tag}</a>"
    end
    content << "</span>"
    content
  end
  
  def tag_cloud()
    content = "<p>"
    
    tags = find_tags_with_counter
        
    tags.sort_by{ |k, v| k }.each do |tag, counter|
      content << "<a href='/tag/#{tag}.html'>#{tag}</a> "
    end
    content << "</p>"
    content
  end
  
  def textilize( content ) # without (enclosing) paragraph
    red = RedCloth.new( content, [:no_span_caps] )
    red.hard_breaks = false
    content = red.to_html
    
    if content[0..2] == "<p>" then content = content[3..-1] end
    if content[-4..-1] == "</p>" then content = content[0..-5] end
    
    content
  end
  
end # module TextHelper
 
Webby::Helpers.register(TextHelper)