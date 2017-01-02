require "rails_helper"

RSpec.describe ContactsMailer, type: :mailer do
  describe '#new_contact_received' do
    let(:contact) { FactoryGirl.build_stubbed(:contact, message: "Hey! I'm a test message") }
    let(:contacts_mail) { ContactsMailer.new_contact_received(contact) }

    it 'sends the details associated with the contact record' do
      expect(contacts_mail.body).to include("Hey! I'm a test message")
    end
  end
end
