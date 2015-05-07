class RequestFormatter
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    request.env['HTTP_ACCEPT'] = 'application/json' unless env["REQUEST_PATH"] == "/"
    response = @app.call(env)
  end
end
