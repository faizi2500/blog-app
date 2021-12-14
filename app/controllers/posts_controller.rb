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
    if @urlarray[1] == 'users'
      @user = User.find(@urlarray[2])
      @post = Post.find(params[:id])
    else
      @post = Post.find(params[:id])
      @user = User.find(@post.user_id)
    end
  end

  def new
    @current = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.valid?
      @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to user_posts_path(@post.user_id)
    else
      flash[:error] = 'Post not created. Please try again!'
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy
    flash[:success] = 'Post was successfully created.'
    redirect_to user_posts_path(current_user.id)
  end
end
