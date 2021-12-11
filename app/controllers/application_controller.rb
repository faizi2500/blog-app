class ApplicationController < ActionController::Base
  add_flash_types :error, :success
  def current_user
    User.last
  end

  def calc_posts(user)
    @posts_by_user = Post.includes(:user).where('user_id = ?', user.id).references(:user)
    user.post_counter = @posts_by_user.length
    user.save
    @posts_by_user
  end
end
