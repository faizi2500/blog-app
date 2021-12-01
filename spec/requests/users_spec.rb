require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    # pending "add some examples (or delete) #{__FILE__}"
    before(:example) {get(users_path)}
    it 'check status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response).to render_template('index')
    end

    it 'renders correct heading' do
      expect(response.body).to include 'All Users'
    end

    it 'renders correct heading' do
      expect(response.body).to include 'Here is a list of all users'
    end
    
  end
end
