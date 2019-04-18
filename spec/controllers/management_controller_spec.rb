require 'rails_helper'

RSpec.describe ManagementController, type: :controller do

  describe "GET #user_room_management" do
    it "returns http success" do
      get :user_room_management
      expect(response).to have_http_status(:success)
    end
  end

end
