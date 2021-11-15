class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    include ApplicationHelper


    protected
    
    def configure_permitted_parameters
      added_attrs = [:email, :name, :password, :avatar, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :password, :password_confirmation, :remember_me])
      devise_parameter_sanitizer.permit :sign_in, keys: [:email, :password]
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
