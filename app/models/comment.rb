class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_post_counter
    post.increment!(:comments_counter)
  end

  private :update_post_counter
end
