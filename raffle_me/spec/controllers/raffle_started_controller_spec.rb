require 'rails_helper'

RSpec.describe RaffleStartedController, type: :controller do

  describe "GET #raffle_started" do
    it "returns http success" do
      get :raffle_started
      expect(response).to have_http_status(:success)
    end
  end

end
