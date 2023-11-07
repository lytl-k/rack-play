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

class Application
  def call(env)
    [420, { "content-type" => "type/html" }, ['Hello, calm world']]
  end
end

# Middleware
use Middleware::Test

# App
run Application.new
