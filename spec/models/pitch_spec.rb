require 'rails_helper'

RSpec.describe Pitch, type: :model do
  let(:pitch) { described_class.new(valid_attributes) }
  let(:valid_attributes) {
    {
      company_name: 'Company name',
      problem: 'Problem',
      target_market: 'Target market',
      current_solutions: 'Current solutions',
      solution: 'Solution',
      channels: 'Channels',
      revenue_streams: 'Revenue streams',
      team: 'Team',
      competitive_advantage: 'Competitive advantage',
      traction: 'Traction',
      obstacles: 'Obstacles',
      funding: 'Funding',
      other: 'Other',
      contact_details: 'Call me maybe',
    }
  }

  describe 'Validation' do
    it 'should be valid with valid attributes' do
      expect(pitch).to be_valid
    end

    it "isn't valid with a really long field" do
      valid_attributes[:other] = "word " * 101
      expect(pitch).not_to be_valid
    end

    it "isn't valid if less than half of the fields are filled in" do
      valid_attributes[:problem] = nil
      valid_attributes[:target_market] = nil
      valid_attributes[:current_solutions] = nil
      valid_attributes[:solution] = nil
      valid_attributes[:channels] = nil
      valid_attributes[:revenue_streams] = nil
      valid_attributes[:team] = nil

      expect(pitch).not_to be_valid
    end

    it "is valid if at least half of the fields are filled in" do
      valid_attributes[:competitive_advantage] = nil
      valid_attributes[:traction] = nil
      valid_attributes[:obstacles] = nil
      valid_attributes[:funding] = nil

      expect(pitch).to be_valid
    end

    it "isn't valid without contact details" do
      valid_attributes[:contact_details] = nil

      expect(pitch).not_to be_valid
    end
  end
end
