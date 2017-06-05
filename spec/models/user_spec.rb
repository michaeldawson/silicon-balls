require 'rails_helper'

RSpec.describe User do
  let(:user) { described_class.new(valid_attributes) }
  let(:valid_attributes) {
    {
      email: 'user@gmail.com',
      password: 'password',
    }
  }

  describe 'Validation' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it "isn't valid without an email" do
      valid_attributes[:email] = nil
      expect(user).not_to be_valid
    end

    it "isn't valid without a password" do
      valid_attributes[:password] = nil
      expect(user).not_to be_valid
    end
  end
end
