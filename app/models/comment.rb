class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_post_coutner
    post.increment!(:comments_counter)
  end

  private :update_post_counter
end
