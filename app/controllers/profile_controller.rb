class ProfileController < ApplicationController

before_filter :authenticate_user!

  def new
    @current_user = current_user
    @current_user.profile.new()
  end

  def create
    @current_user = current_user
    profile = @current_user.profile.build(profile_params)
    if profile.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def show
    @current_user = current_user
    @profile = current_user.profile
    respond_to do |format|
        format.html
        format.json { render json: @profile.to_json, :status => "200" }
    end
  end

  def profile_params
    params.require(:profile).permit(:tagline, :profile_photo)
  end
end