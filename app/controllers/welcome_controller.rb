class WelcomeController < ApplicationController
  def index
    @recipes = if params[:tags]
      Recipe.search_by_multiple_tags(params[:tags])
    else
      Recipe.all
    end
  end
end
