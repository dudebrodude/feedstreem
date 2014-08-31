class ApplicationController < ActionController::Base
  include BootstrapFlashHelper
   before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    def after_sign_in_path_for(users)
        home_index_path
    end
    def create
  @user = User.create( user_params )
end

      protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    end
def user_params
  params.require(:user).permit(:avatar)
end
end 