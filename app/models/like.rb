class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def increment_post_coutner
    post.increment!(:likes_counter)
  end
end
