FactoryGirl.define do
  factory(:contact) do
    name 'Mister Test'
    sequence(:email) { |n| "test_#{n}@testmail.com" }
    message "Hey! I'm a message"
  end
end
