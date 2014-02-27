class ContactUsMailer < ActionMailer::Base
  
  default from: "http://salty-brook-3000.herokuapp.com/contact"
  default to: "Ryabrandt@gmail.com, eganae@gmail.com, nathantross@gmail.com, arweiner@alumni.stanford.edu"

  def contact_us_email(contact)
    @contact = contact
    mail(subject: "Everest App User Query", reply_to: @contact.email)
  end
end
