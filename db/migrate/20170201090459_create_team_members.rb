class CreateTeamMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :expertise
      t.string :facebook
      t.string :twitter
      t.string :linkedin

      t.timestamps
    end
  end
end
