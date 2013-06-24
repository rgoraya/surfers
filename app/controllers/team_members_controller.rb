class TeamMembersController < ApplicationController

  def index
    @team_members = TeamMember.find(:all)
  end

end