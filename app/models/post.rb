class Post < ApplicationRecord
  has_many :comments
  has_many :likes

  belongs_to :user

  def increase_counter
    user.increment!(:post_counter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
