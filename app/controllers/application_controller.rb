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

  def member_required
    if current_user.blank?
      respond_to do |format|
        format.html {
          redirect_to root_path, notice: 'unauthorized user'
        }
        format.json {
        }
        format.all {
          head(:unauthorized)
        }
      end
    end
  end

  def admin_required
    if current_user.blank? || current_user.role < 100
      respond_to do |format|
        format.html {
          #authenticate_user!
          redirect_to root_path, notice: 'unauthorized admin'
        }
        format.json {
        }
        format.all {
          head(:unauthorized)
        }
      end
    end
  end

end
