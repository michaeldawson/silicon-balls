class ContactsController < ApplicationController
  def new
    redirect_to root_path
  end

  def create
    if contact.save && contact.send_email
      render 'success'
    else
      render 'failure'
    end
  end

  private

  helper_method def contact
    @contact ||= Contact.new(contact_params)
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message) if params.key?(:contact)
  end
end
