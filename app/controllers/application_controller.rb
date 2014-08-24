class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    helper_method :follow_club

    def follow_club
    current_user.follow(@club)
        end
            helper_method :follow_event

    def follow_event
    current_user.follow(@event)
        end

end
