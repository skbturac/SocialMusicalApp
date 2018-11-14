class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:show, :new]

    def index
      @posts = Post.all
    end

    def show
      @user = current_user

      @comment = @post.comments.new
    end


    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      @post.user = current_user
      if @post.save!
        flash[:notice] = "Successfully created..."
        redirect_to posts_path
      else
        flash[:danger] = "failed to add a post"
        render 'new'
      end
    end

    def edit
      #code
    end

    def update
       if @post.update
         flash[:notice] = "Successfully updated"
         redirect_to post_path
       else
         flash[:alert] = "Failed to update Post"
         redirect_to :back
       end
     end

     def destroy
       if @post.destroy
         flash[:notice] = "Successfully delete"
         redirect_to posts_path
       else
         flash[:danger] = "Wasn't able to delete Blog post."
         redirect_to :back
       end
     end

    private

    def find_post
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end
