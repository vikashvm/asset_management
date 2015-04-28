class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = "*"
    #headers['Access-Control-Allow-Credentials'] = "true"
    headers['Access-Control-Request-Method'] = %w{GET POST PUT DELETE OPTIONS}.join(",")
    headers['Access-Control-Allow-Headers']= "Authorization"
  end

  # rescue_from Exception do |exception|
  #   render json: {message: exception.message, success: false}, status: :internal_server_error
  # end


end
