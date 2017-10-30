require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let!(:recipe_1) { create(:recipe, :with_carne_tag) }
  let!(:recipe_2) { create(:recipe, :with_verdura_tag) }

  it "GET#index should be successful" do
    get :index
    response.should be_successful
  end

  it "GET#index should return 2 recipes" do
    number_of_recipes = Recipe.all.count
    get :index
    expect(assigns(:recipes).count).to eq(number_of_recipes)
  end

  it "GET#index should return 1 recipe with a tag" do
    get :index, params: { tags: "carne"}
    expect(assigns(:recipes).count).to eq(1)
    expect(assigns(:recipes).first.name).to eq("Empanada de carne")
  end

  it "GET#index should return 0 recipe with a tag" do
    get :index, params: { tags: "not exits"}
    expect(assigns(:recipes).count).to eq(0)
  end
end
