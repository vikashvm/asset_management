class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :set_access_control_headers
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers
 
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end
 
  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token, Content-Type'
      headers['Access-Control-Max-Age'] = '1728000'
 
      render json:  {message: 'ok'}, status: :ok
    end
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = "*"
    # headers['Access-Control-Allow-Credentials'] = "true"
    # headers['Access-Control-Request-Method'] = %w{GET POST PUT DELETE OPTIONS HEAD}.join(", ")
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*,Authorization,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
    headers['Access-Control-Max-Age'] = '86400'
  end

  # rescue_from Exception do |exception|
  #   render json: {message: exception.message, success: false}, status: :internal_server_error
  # end


end
