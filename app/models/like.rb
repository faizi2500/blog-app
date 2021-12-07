class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_coutner
    post.increment!(:likes_counter)
  end

  private :update_likes_counter
end
