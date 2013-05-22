$KCODE='utf'

require 'pp'
require 'net/http'
require 'uri'
require 'json'
require 'cgi'


def translate( text, to, from='en' )

  base = 'http://ajax.googleapis.com/ajax/services/language/translate' 

  # assemble query params
  params = {
    :langpair => "#{from}|#{to}", 
    :q => text,
    :v => 1.0  
  }

  query = params.map{ |k,v| "#{k}=#{CGI.escape(v.to_s)}" }.join('&')

  # send get request
  response = Net::HTTP.get_response( URI.parse( "#{base}?#{query}" ) )
  
  json = JSON.parse( response.body )
    
  if json['responseStatus'] == 200
    json['responseData']['translatedText']
  else
    raise StandardError, response['responseDetails']
  end
end


def hello_world
  languages = %W{ar bg ca cs da de el en es fr hi id it ja pt-PT sk sr sv vi zh-CN} 
 
  languages.each do |lang|
    puts translate( 'Hello, World', lang  )
 end
end

if __FILE__ == $0

  text = ARGV[0] || 'Hello World'
  lang = ARGV[1] || 'de'
  
  # puts translate( 'Hello World', 'de' )
  # puts translate( 'Hallo Welt', 'es', 'de' )
  
  puts translate( text, lang  )

  # hello_world() 
end