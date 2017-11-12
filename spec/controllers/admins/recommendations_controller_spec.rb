require 'rails_helper'

RSpec.describe Admins::RecommendationsController, type: :controller do
  let(:user)   { create(:user) }

  describe "GET #create" do
    it "returns http success" do

      params = {
        user_id: user.id,
        content: "example"
      }

      expect(user.recommendations.count).to eq(0)
      post :create, params: params

      expect(response).to have_http_status(:success)
      expect(user.recommendations.count).to eq(1)
      expect(user.recommendations.last.content).to eq("example")
    end

    it "returns http error" do
      params = {
        user_id: user.id,
      }
      expect(user.recommendations.count).to eq(0)
      post :create, params: params

      expect(response).to have_http_status(:error)
      expect(user.recommendations.count).to eq(0)
    end
  end

end
