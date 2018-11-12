class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
      @posts = Post.all
    end
 
    def show
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.create(post_params)
      redirect_to @post
    end

    def edit
      #code
    end

    def update
      @post.update(post_params)
      redirect_to @post
    end

    def destroy
      @post.destroy
      redirect_to posts_path
    end

    private

    def find_post
      @post = Post.find_by(id: params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :user_id, :comment_id)
    end
end
