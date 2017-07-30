class AddPictureToTeamMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :team_members, :picture, :string
  end
end
