# 4/15/2019 - Created spec - Austin Pearce

require 'rails_helper'

RSpec.describe LoginController, type: :controller do
  describe 'GET index' do
    it 'renders the login page' do
      get :index
      expect(response).to render_template('login/index')
    end

    it 'returns 200 OK' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
