require 'pry'

module Middleware
  class Test
    def initialize(app)
      @app = app
    end

    def call(env)
      response = @app.(env)

      binding.pry

      response
    end
  end
end

class StupidError
  def call(env)
    [404, { "content-type" => "type/html" }, ['This is definitely NOT working, becuase it doesn\'t exist']]
  end
end

class Application
  def call(env)
    [420, { "content-type" => "type/html" }, ['Hello, calm world']]
  end
end

map '/error' do
  run StupidError.new
end

# Middleware
use Middleware::Test

# App
run Application.new
