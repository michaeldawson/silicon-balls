class TeamMembersController < ApplicationController
  private

  helper_method def team_members
    @team_members ||= TeamMember.all.reverse
  end
end
