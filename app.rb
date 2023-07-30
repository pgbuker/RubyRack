require_relative 'timeformat'

class App
  def call(env)
    @request = Rack::Request.new(env)
    response
    [status, headers, body]
  end
end

private

def response
  if @request.path_info == '/time'
    @formatter = TimeFormat.new(@request.params)
    if @formatter.incorrect.empty?
      formatted_time
    else
      unknown_format
    end
  else
    wrong_path
  end
end

def status
  @status_code
end

def headers
  { 'Content-Type' => 'text/plain' }
end

def body
  ["#{@message}\n"]
end

def formatted_time
  @status_code = 200
  @message = Time.now.strftime(@formatter.correct)
end

def unknown_format
  @status_code = 400
  @message = "Unknown time format #{@formatter.incorrect}"
end

def wrong_path
  @status_code = 404
  @message = 'Page not found'
end
