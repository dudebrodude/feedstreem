class HomeController < ApplicationController
	def index
		@club = current_user.following_clubs

   		end
   	end
