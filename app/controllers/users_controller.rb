class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy]


    def index
      @users = User.all
    end

    def show
    end

    def new
      @user = User.new
    end

    def create
      @user = User.create(user_params)
      if @user.save?
        flash[:success] = "YOU DID IT! WELCOME!"
        redirect_to '/'
      else
      redirect_to new_user_path
    end
    end

    def edit
      #code
    end

    def update
      if @user.update_attributes(user_params)
        # Handle a successful update.
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render 'edit'
      end
    end

    def destroy
      find_user.destroy
      flash[:success] = 'User successfully deleted!'
      redirect_to (users_path)
    end

    private

    def find_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

      # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

        # correct (logged in and has access to their shit) user
  def correct_user
   find_user
   redirect_to(root_url) unless current_user?(@user)
  end

end  # /> class
