class ApplicationController < ActionController::Base
  add_flash_types :error, :success

  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :post_counter) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :post_counter)
    end
  end

  def calc_posts(user)
    @posts_by_user = Post.includes(:user).where('user_id = ?', user.id).references(:user)
    user.post_counter = @posts_by_user.length
    user.save
    @posts_by_user
  end
end
