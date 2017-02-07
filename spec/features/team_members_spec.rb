require 'rails_helper'

feature 'Team page', js: true do
  context 'with team members' do
    before do
      FactoryGirl.create(:team_member, name: 'Michael Dawson')
    end

    scenario 'visiting the team page shows team member details' do
      visit team_members_path
      expect(page).to have_content('Michael Dawson')
    end
  end
end
