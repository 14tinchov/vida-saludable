class Admins::UsersController < Admins::BaseController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
