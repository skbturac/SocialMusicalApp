class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :update, :destroy]

    def index
      @comments = Comment.all
    end

    def show

    end

    def new
      # @comment = Comment.new
      # @post = Post.find_by(id: params[:id])
      # @comment = Comment.new(id: params[:id])
      @comment = Comment.new(post_id: params[:post_id])
    end

    def create

      @post = Post.find_by(id: params[:post_id])

      @comment = @post.comments.build(comment_params)

      @comment.user = current_user
      if @comment.save
        flash[:notice] = "Successfully created..."
       redirect_to user_path(current_user)
      else
       flash[:alert] = "failed"
       redirect_to root_path
      end
    end

    def edit
      @post = Post.find_by(id: params[:post_id])
      @comment = @post.comments.find(id: params[:id])
    end

    def update
      if @comment.update
       flash[:notice] = "You updated your comment"
      else
       flash[:alert] = "Failed to update"
     end
    end

     def destroy
      @comment.destroy
      redirect_to '/'
     end

    private

    def find_comment
      @comment = Comment.find_by(id: params[:id])
    end

    def comment_params
      params.require(:comment).permit(:comment, :text, :user_id, :post_id)
    end
end
