class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :role, :email, :password, :current_password])
  end 
end
