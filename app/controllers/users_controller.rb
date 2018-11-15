class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:profile]


    def index
      @users = User.all
    end

    def show

    end

    def profile
      @post = Post.new
    end

    def new
      @user = User.new

    end

    def create
      @user = User.new(user_params)

      @user.email.downcase!

      if @user.save
        flash[:success] = "YOU DID IT! WELCOME!"
        redirect_to '/'
      else
        flash.now.alert = "Uh Oh! We couldn't create your account :( Please make sure you're entering a valid email and password before trying again!"
        render :new
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
      redirect_to '/'
    end

    private

    def find_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end



end  # /> class
