class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_filter :verify_authenticity_token, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:mobile_number, :company_name, :city, :state, :street_1, :street_2, :landline_number, :first_name, :email, :last_name, :role, :image, :role_cd, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :mobile_number, :company_name, :city, :state, :street_1, :street_2, :landline_number, :first_name, :last_name])
  end
end
