class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:profile]


    def index
      @users = User.all
    end

    def show
      @comments = Comment.all
    end

    def profile
      @post = Post.new
      # @comments = Comment.all
      # @user = current_user
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
        render :new
      end
    end

    def edit
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
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :song_file)
    end

end  # /> class
