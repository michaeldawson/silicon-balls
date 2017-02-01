require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  subject { TeamMember.new(valid_attributes) }
  let(:valid_attributes) {
    {
      name: 'Mister Burns',
      expertise: 'Environmental desecration'
    }
  }

  describe 'Validation' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it "isn't valid without a name" do
      valid_attributes[:name] = nil
      expect(subject).not_to be_valid
    end

    it "isn't valid without an area of expertise" do
      valid_attributes[:expertise] = nil
      expect(subject).not_to be_valid
    end
  end
end
