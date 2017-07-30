require 'rails_helper'

feature 'Admin team members' do
  let(:admin) { FactoryGirl.create(:user) }

  scenario 'I can add a new team member' do
    visit team_members_path(as: admin)
    expect(page).to have_content('You are logged in as an admin.')
  end

  context 'with a team member' do
    let!(:team_member) { FactoryGirl.create(:team_member, name: 'Mister Test') }

    scenario 'I can edit their profile' do
      visit team_members_path(as: admin)

      click_on 'Mister Test'
      expect(page).to have_content('Editing as admin')
      fill_in 'Name', with: 'Mister updated'
      fill_in 'Expertise', with: 'Handstands'

      click_on 'Save'
      expect(page).to have_content('Changes saved')

      team_member.reload
      expect(team_member.name).to eq('Mister updated')
      expect(team_member.expertise).to eq('Handstands')
    end
  end
end
