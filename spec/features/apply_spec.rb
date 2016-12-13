require 'rails_helper'

feature 'Apply page', js: true do
  scenario 'I can apply as an investor through our contact page' do
    visit root_path

    find('.menu-toggle').click

    within '#menu' do
      click_on 'Apply'
    end

    find('.blog-item', text: 'Investors').click

    expect(page).to have_content('Apply for membership')

    click_on 'Contact Us'
    expect(page).to have_content('Drop us a line')
  end
end
