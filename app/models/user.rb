class User < ApplicationRecord

  after_create :set_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end

  private 

  def set_roles
    self.update(role: 'user')
  end
end
