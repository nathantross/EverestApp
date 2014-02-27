class ContactUsMailer < ActionMailer::Base
  default from: "http://localhost:3000/contact"
  default to: "arweiner@alumni.stanford.edu"
  reply_to: "nathantross@gmail.com"
    
  def contact_us_email(contact)
    @contact = contact
    @url  = 'http://localhost:3000/contact'
    mail(subject: "Everest App User Query")
  end
end
