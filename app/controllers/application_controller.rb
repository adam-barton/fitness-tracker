class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
    before_action :current_user
    before_action :redirect_if_not_logged_in
  
    def current_user
      @current_user ||= User.find_by_auth_token(session[:auth_token]) if session[:auth_token]
    end
    helper_method :current_user
        
    def logged_in?
      session[:auth_token]
    end
  
    def redirect_if_not_logged_in
      if !logged_in?
        redirect_to signin_path
      end
    end
end
