class ApplicationController < ActionController::Base
  protect_from_forgery with: :reset_session, :except => [:sign_in, :sign_up, :account_update]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :first_name, :last_name, :bio, :email, :password, :password_confirmation, :current_password, :avatar, :cover_image)
    end
  end

end