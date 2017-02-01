FactoryGirl.define do
  factory :team_member do
    sequence(:name) { |n| "Team member #{n}" }
    expertise 'Procrastinating'
  end
end
