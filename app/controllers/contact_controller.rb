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
    redirect_to '/about', notice: "Your message was sent. Adventure is on its way!"
  end

protected
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end