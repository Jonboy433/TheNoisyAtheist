class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    #Redirect back to the page they were on prior to login
    request.referrer
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_id, :email, :password, :password_confirmation, :remember_me)}
  	devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :email, :password, :remember_me) }
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:user_id, :email, :password, :password_confirmation, :current_password)}
  end
end
