require 'rails_helper'

RSpec.describe Contact do
  let(:contact) { described_class.new(valid_attributes) }
  let(:valid_attributes) {
    {
      name: 'Michael',
      email: 'michael@michael.com',
      message: 'Hey! I just met you.'
    }
  }

  describe 'Validation' do
    it 'should be valid with valid attributes' do
      expect(contact).to be_valid
    end

    it 'should not be valid without a name' do
      valid_attributes[:name] = nil
      expect(contact).not_to be_valid
    end

    it 'should not be valid without an email' do
      valid_attributes[:email] = nil
      expect(contact).not_to be_valid
    end

    it 'should not be valid without a message' do
      valid_attributes[:message] = nil
      expect(contact).not_to be_valid
    end
  end
end
