class SessionsController < ApplicationController

  before_action :authenticate_user, :only => [:home, :profile]
before_action :save_login_state, :only => [:login, :login_attempt]

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      # ensure user is activated before they can log in
      session[:user_id] = user.id.to_s
      redirect_to profile_path, success: "Gr8 JoB you're logged in!"
    else
      flash.now.alert = 'Invalid email/password combination, try again'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "GOOD BYE"
  end

  def login_attempt
    authorized_user = User.authenticate(params[:email], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Welcome back!"
      redirect_to profile_path
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end	
  end

  def save_login_state
    if session[:user_id]
      redirect_to 'homes#index'
      return false
    else
      return true
    end
  end


end
