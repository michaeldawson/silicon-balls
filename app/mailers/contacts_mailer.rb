class ContactsMailer < ApplicationMailer
  def new_contact_received(contact)
    @contact = contact
    mail(subject: 'New contact received')
  end
end
