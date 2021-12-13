module UsersHelper
  def all_likes(id)
    Like.where('post_id = ?', id).count
  end

  def all_comments(id)
    Comment.where('post_id = ?', id).count
  end

  def list_comments(id)
    @comments = Comment.all.where(post_id: id).order('created_at DESC')
  end

  def active_user
      current_user
  end
end
