class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :set_access_control_headers

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
