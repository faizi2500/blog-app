require 'rails_helper'
RSpec.feature 'User Index', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Rous', email: 'other@example.com', password: 'rous12', post_counter: 0)
    @second_user = User.create(name: 'Ali', email: 'ali@example.com', password: '123456', post_counter: 1)
    @third_user = User.create(name: 'Ahmed', email: 'ahmed@example.com', password: '1234ahmed', post_counter: 3)
    visit user_session_path
    fill_in 'email', with: 'other@example.com'
    fill_in 'pwd', with: 'rous12'
    click_button 'Log in'
  end

  it 'first user logged in' do
    visit root_path
    expect(page).to have_content 'Rous'
    expect(page).to have_content 'Ali'
    expect(page).to have_content 'Ahmed'
  end

  it 'display third user have 3 posts' do
    visit root_path
    expect(page).to have_content 'Number of posts 3'
    expect(page).to have_content 'Number of posts 0'
    expect(page).to have_content 'Number of posts 1'
  end

  it 'page has user image tag' do
    visit root_path
    expect(page).to have_selector('img[alt="user_image"]')
  end

  it 'display third user have 3 posts' do
    click_on('Rous')
    expect(page).to have_current_path(user_path(@first_user.id))
  end
end
