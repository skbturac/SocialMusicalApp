class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :edit, :update, :destroy]

    def index
      @comments = Comment.all
    end

    def show
    end

    def new
      @comment = Comment.new
    end

    def create
      # @comment = Comment.create(comment_params)
      # redirect_to @post
      byebug
      @post = Post.find_by(id: params[:id])
      @comment = @post.comment.create(comment_params)
      redirect_to @post
    end

    def edit
      #code
    end

    def update
      @comment.update(comment_params)
      redirect_to @comment
    end

    def destroy
      @comment.destroy
      redirect_to comments_path
    end

    private

    def find_comment
      @comment = Comment.find_by(id: params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text, :user_id, :post_id)
    end
end
