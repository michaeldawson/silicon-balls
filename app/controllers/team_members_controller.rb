class TeamMembersController < ApplicationController
  def update
    if team_member.update(team_member_params)
      flash[:notice] = 'Changes saved'
      redirect_to team_members_path
    else
      flash[:error] = "Sorry, that didn't work"
      render 'edit'
    end
  end

  private

  helper_method def team_members
    @team_members ||= TeamMember.all.reverse
  end

  helper_method def team_member
    @team_member ||= TeamMember.find(params[:id])
  end

  def team_member_params
    params.require(:team_member).permit(:name, :expertise)
  end
end
