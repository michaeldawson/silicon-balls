class ContactsMailer < ApplicationMailer
  default to: ENV['NOTIFICATION_EMAIL']

  def new_contact_received(contact)
    @contact = contact
    mail(subject: 'New contact received')
  end
end
