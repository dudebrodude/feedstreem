class WelcomeController < ApplicationController
  def index
  	@followers = current_user.followers
  	@club = current_user.following_clubs
  end
end
