---
title: Let's Go Camping - Getting Started w/ Ruby's Model-View-Controller (MVC) Web Microframework
# tags:  camping markaby microframework mongrel
---

## {{page.title}}

What's Camping? Camping is a microframework (in less than 4k of code) that lets you
develop a web application using the Model-View-Controller (MVC) architecture with
all your code stored in a single Ruby script in less then three minutes.

Let's go camping and create a web application (`hello.rb`) showing the current time:

<!-- more -->


``` ruby
require 'camping'

Camping.goes :Hello

module Hello::Controllers
  class Index < R '/'
    def get
      render :frontpage
    end
  end
end

module Hello::Views
  def frontpage
    h1 "Hola Mundo"
    p  "The time is: #{Time.now}"
  end
end
```


Note, you can grab the sources for this article from the [site repo](http://fixme.com).

We have created a controller with an index action mapped to the '`/`' route and a `frontpage` view template 
and that's it! We're ready for production.

Let's use the Mongrel web server to put our Camping web application online. 
Add the following startup script to `hello.rb`:


``` ruby
if __FILE__ == $0
  require 'mongrel'
  require 'mongrel/camping'

  server = Mongrel::Camping::start( "0.0.0.0", 3301, "/", Hello )
  puts "**Hello Camping is running on Mongrel at http://localhost:3301/"
  server.run.join
end
```

Start up the web application and the Mongrel web server and type on the command line:

```
$ ruby hello.rb
>> Hello Camping is running on Mongrel at http://localhost:3301/
```

Tune your browser to `http://localhost:3301` Voila!


