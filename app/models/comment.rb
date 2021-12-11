class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :text, presence: true, length: { minimum: 3 }

  def update_post_counter
    post.increment!(:comments_counter)
  end

  private :update_post_counter
end
