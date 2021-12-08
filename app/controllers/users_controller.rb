class UsersController < ApplicationController
  def index
    @users = User.all
    @users.each do |user|
      calc_posts(user)
    end
  end

  def show
    @user = User.find(params[:id])
    @posts_by_user = calc_posts(@user)
    @three_posts = []
    @comment_count = Comment.group(:post_id).count
    @posts_by_user.each_with_index do |val, i|
      @three_posts.push(val) if i < 3
    end
  end

  # def calc_comments(user, post)
  #   @comment_list
  #   Comment.all.each do |comment|

  # comments = Comment.where("post_id = ?", val.id)
  # likes = Like.where("post_id = ?", val.id)
  # @counts.push([comments, likes])
  #   end
  # end
end
