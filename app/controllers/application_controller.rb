class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    rescue_from CanCan::AccessDenied do |exception|
    redirect_to teams_path, :alert => exception.message
  
  end
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
     root_path 
  end

  def current_ability
  	@current_ability ||=Ability.new(current_user,params)
  end
  protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:avatar,:email, :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:avatar,:email, :password, :password_confirmation) }  
 end
end

