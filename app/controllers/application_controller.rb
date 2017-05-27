class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!, except: [:index, :show]

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :avatar, :note_id, :profile])
  end
end
