class Users::RecipeUsersController < ApplicationController
  def create
    @favourite_recipe = current_user.recipe_users.new(recipes_users_params)
    if @favourite_recipe.save
      render json: {}, status: 200
    else
      render json: {}, status: 400
    end
  end

  def destroy
    @favourite_recipe = current_user.recipe_users.where(recipe_id: recipes_users_params[:recipe_id]).first
    @favourite_recipe.destroy
    render json: {}, status: 200
  end

  private 

  def recipes_users_params
    params.permit(:recipe_id)
  end
end
