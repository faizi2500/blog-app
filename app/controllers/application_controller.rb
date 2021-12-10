class ApplicationController < ActionController::Base
  add_flash_types :error, :success
  def current_user
    User.last
  end

  def calc_posts(user)
    @posts_by_user = []
    Post.all.order('created_at DESC').each do |post|
      @posts_by_user.push(post) if post.user_id == user.id
    end
    user.post_counter = @posts_by_user.length
    user.save
    @posts_by_user
  end
end
