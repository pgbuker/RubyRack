require_relative 'timeformat'

class App
  
  def call(env)
    [status, headers, body]
    @request = Rack::Request.new(env)
    if @request.path_info == '/time'
      formatter = TimeFormat.new(@request.params)
      if formatter.incorrect.empty?
      [200,{"Content-Type" => "text/plain"}, [Time.now.strftime(formatter.correct)]]
      else
      [400,{"Content-Type" => "text/plain"}, ["Unknown time format #{formatter.incorrect}, KNOWN PARAMS #{formatter.correct}" ]]
      end  
    else
      [404,{"Content-Type" => "text/plain"}, ["Page not found!\n"]]
    end
  end
  
end

