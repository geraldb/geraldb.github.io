
def is_article?( page )
  # only postings in top-level (exclude index, tags and feed page) are articles
  page.dir.empty? && page.ext == 'txt' && !(['index', 'tags', 'feed'].include? page.name)
end

def find_articles( opts = {} )  
  articles = Webby::Resources.pages.find(:all, opts) do |page|
    
    # puts "page.path: #{page.path}"
    # puts "page.name: #{page.name}"
    # puts "page.dir: #{page.dir}"
    # puts "page.ext: #{page.ext}"
    
    include = is_article?( page )

    puts "including #{page.path}" if include

    include
  end
  articles
end

def find_tags # with pages/article [array]
  articles = find_articles
  tags = Hash.new {|h, k| h[k] = Array.new} 
  articles.each do |page|
    next unless page.tags
    page.tags.split( /[ ,]/ ).each do |tag|
      tags[tag] << page
    end
  end
  tags
end

def find_tags_with_counter
  articles = find_articles
  tags = Hash.new{|h, k| h[k] = 0} 
 
  articles.each do |page|
    next unless page.tags
    page.tags.split( /[ ,]/ ).each do |tag|
      tags[tag] += 1
    end
  end
  tags
end
