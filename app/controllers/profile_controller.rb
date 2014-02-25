class ProfileController < ApplicationController

before_filter :authenticate_user!

  def show
    @current_user = current_user
    respond_to do |format|
        format.html
        format.json { render json: @current_user.to_json, :status => "200" }
    end
  end
end