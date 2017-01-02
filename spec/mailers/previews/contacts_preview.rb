# Preview all emails at http://localhost:3000/rails/mailers/contacts
class ContactsPreview < ActionMailer::Preview
  def new_contact_received
    ContactsMailer.new_contact_received(FactoryGirl.create(:contact))
  end
end
