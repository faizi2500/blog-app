class LikesController < ApplicationController
  def new
    @current = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new
  end

  def create 
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    @allLikes = Like.all 
    @status = true
    @allLikes.each do |each|
      if @like.user_id == each.user_id && @like.post_id == each.post_id
        @status = false
      end
    end
    if @status
      @like.save
      redirect_to posts_path
      flash[:message] = 'Post was successfully created.'
    else
      redirect_to posts_path
    end
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
