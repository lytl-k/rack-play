class Application
  def call(env)
    [420, { "content-type" => "type/html" }, ['Hello, calm world']]
  end
end

run Application.new
