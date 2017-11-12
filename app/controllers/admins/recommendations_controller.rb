class Admins::RecommendationsController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    recommendation = @user.recommendations.new(recommendations_params)

    respond_to do |format|
      if recommendation.save
        format.html { redirect_to admins_user_path(params[:user_id]), notice: 'Se agrego una recomendacion' }
        format.json { render json: {}, status: 200 }
      else
        format.html { render :back }
        format.json { render render json: {}, status: 500 }
      end
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
  def recommendations_params
    params.permit(:content)
  end
end
