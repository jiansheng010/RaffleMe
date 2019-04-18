require 'rails_helper'

RSpec.describe FaqController, type: :controller do

  describe "GET #faq" do
    it "returns http success" do
      get :faq
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #gnu" do
    it "returns http success" do
      get :gnu
      expect(response).to have_http_status(:success)
    end
  end

end
