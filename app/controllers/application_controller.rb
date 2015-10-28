class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    rescue_from CanCan::AccessDenied do |exception|
    redirect_to teams_path, :alert => exception.message
  
  end
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    teams_path
  end

  def current_ability
  	@current_ability ||=Ability.new(current_user,params)
  end
end
