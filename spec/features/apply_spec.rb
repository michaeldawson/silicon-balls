require 'rails_helper'

feature 'Apply page', js: true do
  scenario 'a user should be able to submit an application' do
    visit root_path
    click_link 'Apply'

    fill_in 'What problem are you solving? Why is it important?', with: 'Problem'
    fill_in 'What is your solution to this problem? Have you tested it with customers?', with: 'Solution'
    fill_in 'When you try to build a product for everyone, you end up creating a product for no-one. What are the customer segments that you serve?', with: 'Target market'
    fill_in 'How will you make money? Who will pay, how much will they pay, and why will they pay?', with: 'Revenue streams'
    fill_in 'What channels will you use? How will you reach your customer segments?', with: 'Channels'
    fill_in 'What traction do you have so far? What does success look like? What would deem your product a success 2 years from now?', with: 'Traction'
    fill_in 'What funding are you seeking? What do you need it for?', with: 'Funding'
    fill_in 'Introduce your team. What are the roles of each member? What experience does each member provide?', with: 'Team'
    fill_in 'Anything else to share?', with: 'Other info'

    expect {
      click_on 'Send'
      expect(page).to have_content("Thanks. We've received your submission.")
    }.to change {
      Application.count
    }.by(1)

    application = Application.last
    expect(application.problem).to eq('Problem')
    expect(application.solution).to eq('Solution')
    expect(application.target_market).to eq('Target market')
    expect(application.revenue_streams).to eq('Revenue streams')
    expect(application.channels).to eq('Channels')
    expect(application.traction).to eq('Traction')
    expect(application.funding).to eq('Funding')
    expect(application.team).to eq('Team')
    expect(application.other).to eq('Other info')
  end
end
