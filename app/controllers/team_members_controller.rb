class TeamMembersController < ApplicationController

  def index
    @page_title = "Team Members"
    @team_members = TeamMember.find(:all)
  end

end