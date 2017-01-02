require 'rails_helper'

RSpec.describe Pitch, type: :model do
  let(:pitch) { described_class.new(valid_attributes) }
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
      expect(pitch).to be_valid
    end

    it "isn't valid with a really long field" do
      valid_attributes[:other] = "word " * 101
      expect(pitch).not_to be_valid
    end

    it "isn't valid if less than half of the fields are filled in" do
      valid_attributes[:problem] = nil
      valid_attributes[:solution] = nil
      valid_attributes[:target_market] = nil
      valid_attributes[:revenue_streams] = nil
      valid_attributes[:channels] = nil
      expect(pitch).not_to be_valid
    end

    it "is valid if at least half of the fields are filled in" do
      valid_attributes[:problem] = nil
      valid_attributes[:solution] = nil
      valid_attributes[:target_market] = nil
      valid_attributes[:revenue_streams] = nil
      expect(pitch).to be_valid
    end
  end

  describe '#send_email' do
    let(:mail) { double }

    it 'sends an email' do
      expect(PitchesMailer).to receive(:new_pitch_received).with(pitch).and_return(mail)
      expect(mail).to receive(:deliver_now)
      pitch.send_email
    end
  end
end
