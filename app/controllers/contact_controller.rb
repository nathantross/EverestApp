class ContactController < ApplicationController
  def index
    @contact = Contact.new
  end

  def new
    @user = current_user
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      render action: 'new'
    end
  end

  def contact_send
    @contact = Contact.new contact_params
    ContactUsMailer.contact_us_email(@contact).deliver
    binding.pry
    redirect_to user_path(current_user), notice: "Your message was sent. Thank you for your inquiry."
  end

protected
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end