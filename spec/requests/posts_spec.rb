require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Cork', email: 'example@mail.com', password: 'password', post_counter: 0) }

  # let(:post) {  }

  describe 'GET /index' do
    before do
      @post = Post.create(title: 'Cork', text: 'example@mail.com', user_id: user.id, likes_counter: 0, comments_counter: 0)
      sign_in user
      get user_posts_path(user.id)
    end

    it 'check status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response).to render_template('index')
    end

    it 'renders correct template' do
      expect(response).to_not render_template('show')
    end

    it 'check for placeholder text' do
      expect(response.body).to include('Pagination')
    end
  end

  describe 'GET /index' do
    before do
      @post = Post.create(title: 'Cork', text: 'example@mail.com', user_id: user.id, likes_counter: 0, comments_counter: 0)
      sign_in user
      get user_post_path(user.id, @post.id)
    end
    it 'check status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response).to render_template('show')
    end

    it 'renders correct template' do
      expect(response).to_not render_template('index')
    end

    it 'check for placeholder text' do
      expect(response.body).to include user.name
    end
  end
end
