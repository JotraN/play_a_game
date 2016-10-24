require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show", :vcr do
    it "assigns a random game for the user" do
      get :show, params: {id: Rails.application.secrets.STEAM_ID}
      expect(assigns(:game)).not_to be_nil
    end
  end
  
end
