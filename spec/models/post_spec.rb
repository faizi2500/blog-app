require 'rails_helper'
# rubocop: disable Layout/LineLength
RSpec.describe Post, type: :model do
  user = User.create(name: 'Faizan', bio: 'software developer', post_counter: 0, photo: 'user 1 photo')
  post = Post.new(title: 'motivation', text: 'Never give up', comments_counter: 0, likes_counter: 0, user_id: user.id)

  before(:each) do
    post.save
  end

  it 'post title should be valid' do
    post.title = 'motivation'
    expect(post).to be_valid
  end

  it 'nil title should be invalid' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'title with length less than 250 should be valid' do
    post.title = 'motivation'
    expect(post).to be_valid
  end

  it 'likes counter should not be negative' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end

  it 'comments counter should not be negative' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'likes counter should be positive' do
    post.likes_counter = 1
    post.comments_counter = 1
    expect(post).to be_valid
  end

  it 'positive comments counter should be valid' do
    post.comments_counter = 1
    post.likes_counter = 1
    expect(post).to be_valid
  end

  it 'title with length more than 250 should be invalid' do
    post.title = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eget tortor venenatis, pretium risus quis, congue justo. Pellentesque id accumsan sem. Mauris id mollis ante. Integer dapibus mi viverra vehicula vulputate. Nulla rhoncus dui sed orci tincidunt, et interdum magna dictum. Phasellus ut dui at eros imperdiet hendrerit tempor quis mi. Donec ac aliquam sem, non malesuada urna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas quis suscipit turpis. Fusce ultrices massa felis, vel porta ex fermentum id. Nam interdum nibh sit amet lectus mattis auctor.

    Mauris ac molestie dui. Nunc laoreet lacus in ultricies varius. Curabitur id massa dapibus tellus interdum lacinia nec eu odio. Maecenas gravida velit et tincidunt sollicitudin. Aliquam sit amet erat non ligula pellentesque sagittis. Mauris semper venenatis enim. Nulla at ipsum est. Aliquam ut mollis odio.

    Vivamus at porta elit, at posuere erat. Pellentesque non ipsum vitae mauris fermentum lacinia. In hac habitasse platea dictumst. Nullam dictum pulvinar molestie. Sed non ullamcorper neque. Fusce interdum luctus nulla, tempus viverra urna tincidunt posuere. Curabitur placerat ligula quam, eget luctus tellus gravida eu. Mauris vehicula non tellus sit amet congue. Cras molestie a enim ut lacinia. Phasellus ac arcu sit amet tellus aliquet convallis.

    Donec a sollicitudin velit. Mauris imperdiet feugiat erat. Sed vulputate feugiat neque vitae mollis. Integer tincidunt posuere elit non imperdiet. Nam imperdiet dolor tellus, a bibendum sem molestie fringilla. In hac habitasse platea dictumst. Vestibulum maximus volutpat purus, et tristique quam porttitor a. Aliquam faucibus semper.dfdf"
    expect(post).to_not be_valid
  end

  describe 'should test methods in post model' do
    before(:each) do
      10.times { |a| Comment.create(user_id: user.id, post_id: post.id, text: "Hello#{a}") }
    end
    it 'post should have five recent comments' do
      expect(post.recent_comments).to eq(Comment.where('post_id = ?', post.id).order(created_at: :desc).limit(5))
    end
  end
end
# rubocop: enable Layout/LineLength
