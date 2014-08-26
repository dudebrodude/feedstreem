class WelcomeController < ApplicationController
  def index
  	@followers = current_user.followers
  	@following = current_user.following_clubs
  end
end
