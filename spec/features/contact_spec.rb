require 'rails_helper'

feature 'Contact form', js: true do
  scenario 'submissions made via the form save a contact record' do
    visit contact_path
    fill_in 'Name', with: 'My name'
    fill_in 'Email', with: 'my@email.com'
    fill_in 'Message', with: 'This is my message.'

    expect {
      click_on 'Send'
      expect(page).to have_content("Thanks - we've received your message.")
    }.to change {
      Contact.count
    }.by(1)
  end

  scenario 'submissions without enough info show an error message' do
    visit contact_path
    fill_in 'Name', with: 'My name'
    fill_in 'Message', with: 'This is my message.'

    expect {
      click_on 'Send'
      expect(page).to have_content("Computer says no.")
    }.not_to change {
      Contact.count
    }
  end
end
