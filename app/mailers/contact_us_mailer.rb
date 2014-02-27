class ContactUsMailer < ActionMailer::Base
  default from: "http://localhost:3000/contact"
  default to: "Ryabrandt@gmail.com, eganae@gmail.com, nathantross@gmail.com, arweiner@alumni.stanford.edu"
  default reply_to: "test@example.com"
    
  def contact_us_email(contact)
    @contact = contact
    @url  = 'http://localhost:3000/contact'
    mail(subject: "Everest App User Query")
  end
end
