## How to use Google's Translation API with Ruby - Translate 'Hello, World' into 25+ Languages with Ruby in 10 Minutes

<!-- tags:  google http json -->

Google offers a free translation service as a "classic" 
[web form](http://translate.google.com) or as a
[programmable web service](http://code.google.com/apis/ajaxlanguage/documentation/reference.html) 
that lets you translate text or web pages into more than twenty-five languages.

Let's build a Ruby wrapper using Google's Translation API and let's translate "Hello, World" into 25+ languages.

<!-- more -->

To use Google's Translation API send a plain old HTTP get request to `ajax.googleapis.com/ajax/services/language/translate`
and include 1) the language pair (the language to translate from and to two-letter-encoded and
separated by a pipe e.g. `en|de` - English to German), 2) the text and 3) the API version (that is, `1.0`) as query parameters
and Google's Translation service will send you back the JSON-encoded result.

Example Request: Translate 'Hello World' from English to German

```
http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&langpair=en|de&q=Hello+World
```

Example Response (JSON-Encoded):

``` json
{
 "responseData":  {"translatedText": "Hallo Welt"},
 "responseStatus": 200,
 "responseDetails": null
}
```

Now let's send the request with Ruby using the `net/http` standard library. Note, you can grab the sources for this article from the [Vancouver.rb repository](http://vanrb.rubyforge.org/svn/translate).

``` ruby
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
  
  ... # to be continued
end
```

And let's get the translated text from the JSON-encoded response:

``` ruby
def translate( text, to, from='en' )  # continued
  ...
 
  json = JSON.parse( response.body )
  
  if json['responseStatus'] == 200
    json['responseData']['translatedText']
  else
    raise StandardError, response['responseDetails']
  end
end
```


That's it. Now you can use the Google translation service by using the new `translate` method in Ruby.

Example 1: Translate 'Hello World' to German (`de`) from English (`en`)

``` ruby
text_de = translate( 'Hello World', 'de' )   
#=> 'Hallo Welt'
```

Example 2: Translate 'Hallo Welt' to Spanish (`es`) from German (`de`)

``` ruby
text_es = translate( 'Hallo Welt', 'es', 'de') 
#=> 'Hola Mundo'
```

If you try it on more languages:

``` ruby
languages = %W{ar bg ca cs da de el en es fr hi id it ja pt-PT sk sr sv vi zh-CN} 
 
languages.each do |lang|
  puts translate( 'Hello, World', lang  )
end
```

You will get:

مرحبا ، العالمية  
Здравей, Свят  
Hola Món  
Dobrý den, Světová  
Hej Verden  
Hallo, Welt  
Γεια σας, Παγκόσμια  
Hello, World  
Hola, Mundo  
Bonjour, monde  
हैलो, विश्व  
Halo, Dunia  
Ciao, Mondo  
こんにちは、世界  
Olá, Mundo  
Dobrý deň, Svetová  
Хелло, Уорлд  
Hej Världen  
Xin chào, thế giới  
哈罗，世界！  


References:

* [Google Translation API](http://code.google.com/apis/ajaxlanguage/documentation/reference.html) 

Alternatives in Ruby:

* [rtranslate](http://github.com/sishen/rtranslate)
* [google_translate](http://github.com/elisehuard/google_translate)
