require 'rails_helper'
RSpec.feature "User Show", type: :feature do
   
    before (:each) do
        @first_user =  User.create(name: 'Rous' ,email: 'other@example.com', password: 'rous12',post_counter: 0)
        @second_user =  User.create(name: 'Ali' ,email: 'ali@example.com', password: '123456', post_counter: 1)
        @third_user =  User.create(name: 'Ahmed' ,email: 'ahmed@example.com', password: '1234ahmed', post_counter: 3)
        @post_one = Post.create(title: 'motivation', text: 'Never give up', comments_counter: 0, likes_counter: 0, user_id: @first_user.id)
        @post_two = Post.create(title: 'motivation', text: 'Second Post', comments_counter: 0, likes_counter: 0, user_id: @first_user.id)
        @post_three = Post.create(title: 'motivation', text: 'Never give up post 3', comments_counter: 0, likes_counter: 0, user_id: @first_user.id)
        @post_four = Post.create(title: 'motivation', text: 'Never give up post 4', comments_counter: 0, likes_counter: 0, user_id: @first_user.id)
        5.times { |a| Comment.create(user_id: @second_user.id, post_id: @post_one.id, text: "Hello#{a}") }
        4.times { |a| Comment.create(user_id: @third_user.id, post_id: @post_three.id, text: "Comment#{a}") }
        @comment = Comment.create(user_id: @first_user.id, post_id: @post_two.id, text: "I like it#")
        Like.create(user_id: @second_user.id, post_id: @post_three.id)
        Like.create(user_id: @second_user.id, post_id: @post_two.id)
        Like.create(user_id: @second_user.id, post_id: @post_one.id)
        visit user_session_path
        fill_in 'email', with: 'other@example.com'
        fill_in 'pwd', with: 'rous12'
        click_button 'Log in'
        click_on('Rous')
        click_on('See all Posts')
        click_on('View Post 2')
    end
    

    it 'display the all posts path for first user' do
      expect(page).to have_current_path("/users/#{@first_user.id}/posts/#{@post_two.id}")
    end
    
    it 'display forth post title' do
      expect(page).to have_content @post_two.title
    end

    it 'display name of user who posted' do
      user = User.find(@post_two.user_id)
      expect(page).to have_content user.name
    end

    it 'display comments count' do
      expect(page).to have_content("Comments:1")
    end

    it 'display likes count' do
      expect(page).to have_content("Likes: 1")
    end


    it 'display post body' do
      expect(page).to have_content @post_two.text
    end

    it 'display person name who commented' do
      expect(page).to have_content User.find(@comment.user_id).name
    end

    it 'display comment text' do
      expect(page).to have_content @comment.text
    end
end