class ApplicationController < ActionController::Base
  #[NIKKI] used null_session since we may want to just have an API avail.
  protect_from_forgery with: :null_session

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :phone_number]
  end

end
