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

    it 'is valid with valid URLs for social attributes' do
      valid_attributes[:facebook] = 'http://facebook.com/foobar'
      valid_attributes[:twitter] = 'http://twitter.com/foobar'
      valid_attributes[:linkedin] = 'http://linkedin.com/foobar'

      expect(subject).to be_valid
    end

    context 'with invalid URLs for social attributes' do
      invalid_urls = ['potato', 'http://facebookcom']
      invalid_urls.each do |invalid_url|
        it "isn't valid" do
          valid_attributes[:facebook] = invalid_url
          expect(subject).not_to be_valid
        end
      end
    end
  end

  describe '#social_attributes' do
    context 'with some social attributes set, and others not' do
      let(:social_attributes) {
        {
          facebook: 'facebook.com/foobar',
          twitter: 'twitter.com/wizzfizz',
        }
      }

      before { valid_attributes.merge!(social_attributes) }

      it 'returns only provided social attributes' do
        expect(subject.social_attributes).to eq(social_attributes)
      end
    end
  end
end
