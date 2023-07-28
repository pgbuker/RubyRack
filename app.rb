require_relative 'timeformat'

require_relative 'timeformat'

class App
  
  def call(env)
    request = Rack::Request.new(env)
    if request.path_info == '/time'
      formatter = TimeFormat.new(request.params)
      formatter.check_time_response
      if formatter.incorrect.empty?
        send_response(Time.now.strftime(formatter.correct), 200)
      else
        send_response("Unknown time format #{formatter.incorrect}\n", 400)
      end
    else
      send_response("Page not found\n", 404)
    end
  end
end

private

def send_response(body, status)
  Rack::Response.new(body, status, headers).to_a
end

def headers
  { 'Content-Type' => 'text/plain' }
end
