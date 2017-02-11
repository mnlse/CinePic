class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_display_name

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_display_name
    @user = current_user
    if @user.first_name? && @user.last_name?
      @name = @user.first_name + " " + @user.last_name
    elsif @user.username?
      @name = @user.username
    else
      @name = @user.email
    end
  end

  def configure_permitted_parameters
    update_attrs = [:bio, :email, :avatar, :first_name, :last_name, :username]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end
