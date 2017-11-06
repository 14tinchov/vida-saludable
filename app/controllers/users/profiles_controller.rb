class Users::ProfilesController < ApplicationController
  before_action :set_profile
  before_action :check_profile, only: [:show, :edit]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to users_profile_path(@profile), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def profile_params
      params.require(:profile).permit(
        :first_name,
        :last_name,
        :weight,
        :height,
        :physical_activity,
        :physical_activity_description,
        :other_diseases,
        :other_pleasures
      )
    end

    def set_profile
      @profile = current_user.profile
    end

    def check_profile
      current_user.create_profile?
    end
end
