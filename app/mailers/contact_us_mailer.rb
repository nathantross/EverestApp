class ContactUsMailer < ActionMailer::Base
  default from: "" #get user email

  def contact_us_email
    mail(to: "arweiner@alumni.stanford.edu", subject: "Everest App User Query")
  end
end
