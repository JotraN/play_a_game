require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @ID = Rails.application.secrets.STEAM_ID
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show", :vcr do
    it "returns http success" do
      get :show, params: { id: @ID }
      expect(response).to have_http_status(:success)
    end
    it "assigns a random game for the user" do
      get :show, params: { id: @ID }
      expect(assigns(:game)).not_to be_nil
    end
  end

  describe "GET #search" do
    it "redirects search to show" do
      get :search, params: { id: @ID }
      expect(response).to redirect_to :action => :show,
                                      :id => @ID
    end
  end
end
