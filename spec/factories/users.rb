FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@siliconballs.com" }
    password 'password'
  end
end
