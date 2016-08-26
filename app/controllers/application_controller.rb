class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_filter :verify_authenticity_token, if: :devise_controller?

  rescue_from Exception, :with => :error
  rescue_from ActiveRecord::RecordNotFound, :with => :error   
  rescue_from ActionController::RoutingError, :with => :error
  rescue_from ActionController::ParameterMissing, with: :error
  
  def raise_not_found!
    render json: {error: "Page does not exist"}.to_json, :status => 404
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:mobile_number, :company_name, :city, :state, :street_1, :street_2, :landline_number, :first_name, :email, :last_name, :role, :image, :role_cd, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :mobile_number, :company_name, :city, :state, :street_1, :street_2, :landline_number, :first_name, :last_name])
  end

  
  def error(exception)
    @exception = exception

    render :exception
  end
end
