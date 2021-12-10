class UsersController < ApplicationController
  def index
    @users = User.all
    @users.each do |user|
      calc_posts(user)
    end
  end

  def show
    @user = User.find(params[:id])
    @three_posts = @user.recent_posts
  end
end
