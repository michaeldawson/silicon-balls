require 'rails_helper'

feature 'Pitch page', js: true do
  scenario 'a user should be able to submit a pitch' do
    visit root_path
    click_link 'Pitch to us'

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
      expect(page).to have_content("We've received your submission.")
    }.to change {
      Pitch.count
    }.by(1)

    pitch = Pitch.last
    expect(pitch.problem).to eq('Problem')
    expect(pitch.solution).to eq('Solution')
    expect(pitch.target_market).to eq('Target market')
    expect(pitch.revenue_streams).to eq('Revenue streams')
    expect(pitch.channels).to eq('Channels')
    expect(pitch.traction).to eq('Traction')
    expect(pitch.funding).to eq('Funding')
    expect(pitch.team).to eq('Team')
    expect(pitch.other).to eq('Other info')

    mail = ActionMailer::Base.deliveries.last
    expect(mail.to).to eq([ENV['NOTIFICATION_EMAIL']])
    expect(mail.subject).to eq('New pitch received')
  end

  scenario 'when submitting an incomplete pitch, the user should see error messages' do
    visit root_path
    click_link 'Pitch to us'

    fill_in 'What problem are you solving? Why is it important?', with: 'Problem'
    fill_in 'What is your solution to this problem? Have you tested it with customers?', with: 'Solution'
    fill_in 'When you try to build a product for everyone, you end up creating a product for no-one. What are the customer segments that you serve?', with: 'Target market'
    fill_in 'How will you make money? Who will pay, how much will they pay, and why will they pay?', with: 'Revenue streams'

    click_on 'Send'
    expect(page).to have_content('You need to answer at least half of these questions.')
  end
end
