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
        
        visit user_session_path
        fill_in 'email', with: 'other@example.com'
        fill_in 'pwd', with: 'rous12'
        click_button 'Log in'
        click_on('Rous')
    end
    
    it 'show user name' do
        visit user_path(@first_user.id)
        expect(page).to have_content "Rous"
    end

    it 'check the user image' do
        visit user_path(@first_user.id)
        expect(page).to have_selector( 'img[alt="user_image"]' )
        
    end

    it 'display third user have 3 posts' do
       visit user_path(@first_user.id)
       expect(page).to have_content "Number of posts 4"
    end



    it 'display third user have 3 posts' do
        visit user_path(@first_user.id)
        expect(page).to have_content @post_two.text
    end

    it 'display the all posts path for first user' do
        visit user_path(@first_user.id)
        click_on("See all Posts")
        expect(page).to have_current_path("/users/#{@first_user.id}/posts")
    end

end