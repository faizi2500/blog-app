class Api::PostsController < ApplicationController
  
  def index
    @post = Post.where(user_id: current_user.id)
    if @post.length > 0
      render :json => @post, status:200
    else
      render json: { error: 'Unable to find any posts for the user' }, status:400
    end
  end

end