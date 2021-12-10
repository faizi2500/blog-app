class PostsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      calc_posts(@user)
    else
      @posts_by_user = Post.all
      render 'allposts'
    end
  end

  def show
    @urlarray = request.path.split('/')
    @user = User.find(@urlarray[2])
    @post = Post.find(params[:id])
  end

  def new
    @current = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_posts_path(@post.user_id)
      flash[:message] = 'Post was successfully created.'
    else
      render :new
      flash[:message] = 'Post not created. Please try again!'
    end
  end

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end
