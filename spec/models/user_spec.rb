require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Faizan', bio: 'software developer', post_counter: 0, photo: 'user 1 photo')
  
  before (:each) do 
    user.save
  end
  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'name should be present therfore entry should be valid' do
    user.name = "Faizan"
    expect(user).to be_valid
  end
  
  it 'post counter should not be negative' do
    user.post_counter = -1
    expect(user).to_not be_valid
  end

  it 'positive post counter should be valid' do
    user.post_counter = 1
    expect(user).to be_valid
  end

  describe 'should test methods in post model' do
    before (:each) do
      5.times { |a| Post.create(text: "Hello#{a}", title: "title#{a}", comments_counter: 0, likes_counter: 0, user_id: user.id)}
    end
    it 'post should have five recent comments' do
      expect(user.recent_posts).to eq(Post.where('user_id = ?', user.id).order(created_at: :desc).limit(3))
    end
  end
end
