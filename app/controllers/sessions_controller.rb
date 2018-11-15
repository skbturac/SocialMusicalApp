class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      # ensure user is activated before they can log in
      session[:user_id] = user.id.to_s
      redirect_to profile_path, notice: "Gr8 JoB you're logged in!"
    else
      flash.now.alert = 'Invalid email/password combination, try again'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "GOOD BYE"
  end

end
