require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Cork', email: 'example@mail.com', password: 'password', post_counter: 0) }

  describe 'GET /index' do
    before do
      # @user = User.create(name: 'Cork', email: 'example@mail.com', password: 'password', post_counter: 0)
      sign_in user
      get root_path
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
      expect(response.body).to include('All Users')
    end

    it 'check for placeholder text' do
      expect(response.body).to include('Cork')
    end
  end

  describe 'GET /show' do
    # before(:example) { get('/users/745') }
    before do
      # @user = User.create(name: 'Cork', email: 'example@mail.com', password: 'password', post_counter: 0)
      sign_in user
      get user_path(user.id)
    end
    it 'check status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response.body).to render_template('show')
    end

    it 'renders correct template' do
      expect(response).to_not render_template('index')
    end

    it 'check for placeholder text' do
      expect(response.body).to include user.name
    end

    it 'check for placeholder text' do
      expect(response.body).to include('Bio')
    end
  end
end
