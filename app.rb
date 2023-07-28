class App
  def call(env)
    [status, headers, body]
  end

  private

  def status
    300
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    ["We need a time!\n"]
  end
end
