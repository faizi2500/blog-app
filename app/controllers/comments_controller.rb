class CommentsController < ApplicationController
  def index
    @urlarray = request.path.split('/')
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

  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
