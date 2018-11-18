class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
    # redirects user to login page if not logged in
  def authorize
    redirect_to login_path, alert: 'Sorry- you need to be logged in to access this page.' if current_user.nil?
  end


def authenticate_user
  if session[:user_id]
     # set current user object to @current_user object variable
    @current_user = User.find session[:user_id] 
    return true	
  else
    redirect_to login_path
    return false
  end
end
def save_login_state
  if session[:user_id]
    redirect_to profile_path
    return false
  else
    return true
  end
end
  

end
