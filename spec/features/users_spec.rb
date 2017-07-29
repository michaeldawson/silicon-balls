require 'rails_helper'

feature 'Signing in' do
  context 'with a user account' do
    let!(:user) { FactoryGirl.create(:user, email: 'hi@siliconballs.com', password: 'password') }

    scenario 'I can sign in' do
      visit sign_in_path
      fill_in 'Email', with: 'hi@siliconballs.com'
      fill_in 'Password', with: 'password'
      click_on 'Sign in'

      expect(page).to have_content('You are logged in as an admin')
    end
  end
end
