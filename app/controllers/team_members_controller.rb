class TeamMembersController < ApplicationController
  def create
    team_member.attributes = team_member_params

    if team_member.save
      flash[:notice] = 'Profile was created'
      redirect_to team_members_path
    else
      flash[:error] = "Sorry, that didn't work"
      render :new
    end
  end

  def update
    if team_member.update(team_member_params)
      flash[:notice] = 'Changes saved'
      redirect_to team_members_path
    else
      flash[:error] = "Sorry, that didn't work"
      render :edit
    end
  end

  def destroy
    team_member.destroy!
    flash[:notice] = 'Profile removed'
    redirect_to team_members_path
  end

  private

  helper_method def team_members
    @team_members ||= TeamMember.all.shuffle
  end

  helper_method def team_member
    @team_member ||= TeamMember.find(params[:id]) if params.key?(:id)
    @team_member ||= TeamMember.new
  end

  def team_member_params
    params.require(:team_member).permit(:name, :expertise, :picture)
  end
end
