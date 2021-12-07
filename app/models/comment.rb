class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def increment_post_coutner
    post.increment!(:comments_counter)
  end
end
