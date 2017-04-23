require 'rails_helper'

feature 'Pitch page', js: true do
  scenario 'a user should be able to submit a pitch' do
    visit root_path
    click_link 'Tell us about your company'

    fill_in 'Company name', with: 'Company name'
    fill_in 'Problem', with: 'Problem'
    fill_in 'Target market', with: 'Target market'
    fill_in 'Current solutions', with: 'Current solutions'
    fill_in 'Solution', with: 'Solution'
    fill_in 'Channels', with: 'Channels'
    fill_in 'Revenue streams', with: 'Revenue streams'
    fill_in 'Team', with: 'Team'
    fill_in 'Competitive advantage', with: 'Competitive advantage'
    fill_in 'Traction', with: 'Traction'
    fill_in 'Obstacles', with: 'Obstacles'
    fill_in 'Funding', with: 'Funding'
    fill_in 'Other', with: 'Other'

    expect {
      click_on 'Submit'
      expect(page).to have_content("We've received your submission.")
    }.to change {
      Pitch.count
    }.by(1)

    pitch = Pitch.last

    expect(pitch.company_name).to eq('Company name')
    expect(pitch.problem).to eq('Problem')
    expect(pitch.target_market).to eq('Target market')
    expect(pitch.current_solutions).to eq('Current solutions')
    expect(pitch.solution).to eq('Solution')
    expect(pitch.channels).to eq('Channels')
    expect(pitch.revenue_streams).to eq('Revenue streams')
    expect(pitch.team).to eq('Team')
    expect(pitch.competitive_advantage).to eq('Competitive advantage')
    expect(pitch.traction).to eq('Traction')
    expect(pitch.obstacles).to eq('Obstacles')
    expect(pitch.funding).to eq('Funding')
    expect(pitch.other).to eq('Other')

    mail = ActionMailer::Base.deliveries.last
    expect(mail.to).to eq([ENV['NOTIFICATION_EMAIL']])
    expect(mail.subject).to eq('New pitch received')
  end

  scenario 'when submitting an incomplete pitch, the user should see error messages' do
    visit new_pitch_path

    fill_in 'What problem are you solving? Why is it important?', with: 'Problem'

    click_on 'Submit'
    expect(page).to have_content('You need to answer at least half of these questions.')
  end
end
