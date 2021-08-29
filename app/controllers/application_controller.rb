class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :prefecture, :cities])
  end
  
  def set_locale
    I18n.locale = locale
  end
  
  def locale
    @locale ||= params[:locale] ||= I18n.default_locale
  end
  
  def default_url_options(options = {})
    options.merge(locale: locale)
  end

end
