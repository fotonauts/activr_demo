class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # cf. https://github.com/plataformatec/devise#strong-parameters
  before_filter :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    url_for(current_user)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
  end
end
