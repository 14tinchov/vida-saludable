require 'rails_helper'

RSpec.describe Users::RecipeUsersController, type: :controller do
  let(:user)   { create(:user) }
  let(:recipe) { create(:recipe, :with_carne_tag) }

  before :each do
    sign_in user
  end

  describe "GET #create" do
    it "returns http success" do
      post :create, params: { recipe_id: recipe.id}
      expect(response).to have_http_status(:success)
      expect(user.recipes.count).to eq(1)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      user.recipes << recipe
      expect(user.recipes.count).to eq(1)

      delete :destroy, params: { recipe_id: recipe.id}
      expect(response).to have_http_status(:success)
      expect(user.reload.recipes.count).to eq(0)
    end
  end
end
