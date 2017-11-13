class Admins::PremiumUsersController < Admins::BaseController
  before_action :set_user, only: [:update]

  def update
    respond_to do |format|
      if @user.update_premium
        format.html { redirect_to admins_user_path(@user), notice: 'Se actualizo el usuario' }
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
end
