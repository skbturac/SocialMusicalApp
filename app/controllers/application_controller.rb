class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :authorized

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end



    # redirects user to login page if not logged in
  def authorized
    redirect_to login_path, alert: 'Sorry- you need to be logged in to access this page.' if current_user.nil?
  end


end
