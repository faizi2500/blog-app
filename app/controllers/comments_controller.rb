class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
  end

  def new
    @current = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.text.length > 3
      @comment.save
      flash[:message] = 'Post was successfully created.'
      redirect_to post_comments_path
    else
      flash[:error] = 'Post not created. Please try again!'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    @comment.destroy
    flash[:success] = 'Comment was deleted successfully.'
    redirect_to user_posts_path(current_user.id, params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
