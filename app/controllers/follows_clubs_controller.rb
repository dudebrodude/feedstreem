class FollowsClubsController < FollowsController
  def followable
    @followable ||= Club.find(params[:club_id])
  end
end