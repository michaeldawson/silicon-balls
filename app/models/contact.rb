class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true

  def send_email
    ContactsMailer.new_contact_received(self).deliver_now
  end
end
