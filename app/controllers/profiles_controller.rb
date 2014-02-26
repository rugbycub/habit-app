class ProfilesController < ApplicationController

before_action :authenticate_user!

  def new
    @user = current_user
    @profile = @user.build_profile
  end

  def create
    @user = current_user
    profile = @user.build_profile(profile_params)
    if profile.save
      redirect_to profile_path
    else
      redirect_to add_profile_path
    end
  end

  def show
    @user = current_user
    if @user.profile
      @profile = @user.profile
      respond_to do |format|
          format.html
          format.json { render json: @profile.to_json, :status => "200" }
      end
    else
      redirect_to add_profile_path
    end
  end

  def profile_params
    params.require(:profile).permit(:tagline, :profile_pic)
  end
end