class FollowsUsersController < FollowsController
  def followable
    @followable ||= User.find(params[:user_id])
  end
end