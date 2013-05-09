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

if __FILE__ == $0
  require 'mongrel'
  require 'mongrel/camping'

  server = Mongrel::Camping::start( "0.0.0.0", 3301, "/", Hello )
  puts "**Hello Camping is running on Mongrel at http://localhost:3301/"
  server.run.join
end

