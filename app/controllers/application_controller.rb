class ApplicationController < ActionController::Base
	 before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(user)
    root_path
  end
      protected

    def configure_permitted_parameters
      ## You can add add other custom fields that you have added to User Model in place of attr1, attr2
      devise_parameter_sanitizer.for(:sign_up) << :avatar   ## To permit parameters while User creation
      devise_parameter_sanitizer.for(:account_update) << :avatar   ## To permit parameters while User updation
    end


end




