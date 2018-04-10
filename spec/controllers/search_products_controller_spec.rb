require 'rails_helper'

RSpec.describe SearchProductsController, type: :controller do
  describe "GET #index" do
    it "responds with a 200" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #category_lookup" do
    it "responds with a 200" do
      post :category_lookup
      expect(response).to have_http_status(:ok)
    end

    it "responds with a json" do
    	post :category_lookup
    	parse_json = JSON(response.body)
    	hash_body = nil
    	expect ActiveSupport::JSON.decode(response.body) != nil
    end	
  end

end
