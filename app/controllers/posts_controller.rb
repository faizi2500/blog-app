class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    calc_posts(@user)
  end

  def show
    @urlarray = request.path.split('/')
    @user = User.find(@urlarray[2])
    @post = Post.find(params[:id])
  end
end
