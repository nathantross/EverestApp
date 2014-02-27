class ContactUsMailer < ActionMailer::Base
  default to: "arweiner@alumni.stanford.edu"
  default reply_to: @contact.email

  def contact_us_email(contact)
    @contact = contact
    @url  = 'http://localhost:3000/contact'
    mail(subject: "Everest App User Query")
  end
end
