require 'rails_helper'

RSpec.describe Application, type: :model do
  let(:application) { Application.new(valid_attributes) }
  let(:valid_attributes) {
    {
      problem: 'Some text',
      solution: 'Some text',
      target_market: 'Some text',
      revenue_streams: 'Some text',
      channels: 'Some text',
      traction: 'Some text',
      funding: 'Some text',
      team: 'Some text',
      other: 'Some text',
    }
  }

  describe 'Validation' do
    it 'should be valid with valid attributes' do
      expect(application).to be_valid
    end

    it "isn't valid with a really long field" do
      valid_attributes[:other] = "word " * 101
      expect(application).not_to be_valid
    end
  end
end
