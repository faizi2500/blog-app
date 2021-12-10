module CommentsHelper
  def post_text(id)
    Post.find(id).text
  end
end
