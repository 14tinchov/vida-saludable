class Users::RecommendationsController < Users::BaseController
  def index
    @recommendations = current_user.recommendations
  end
end
