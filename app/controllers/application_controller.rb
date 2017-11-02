class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :save_referer
  before_action :current_cart

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password] )
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password] )
  end

  def current_cart
    @cart ||= Cart.from_hash(session[:cart])
  end

  def save_referer
    session[:return_to] ||= request.referer
  end
end
