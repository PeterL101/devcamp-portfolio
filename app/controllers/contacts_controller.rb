class ContactsController < ApplicationController

  before_action :contact_params, only: [:create]

  def contact
  end

  def new
    @contact = ContactMailer.new
  end

  def create
    @contact = ContactMailer.new(params[:contact_form])
    @contact.request = request
    if @contact.save
      redirect_to root_path
      name = param[:contact][:name]
      email = param[:contact][:email]
      phone = param[:contact][:phone]
      message = param[:contact][:message]
      ContactMailer.contact_email(name, email, phone, message)
      flash.now[:notice] = 'Thank you for your message! Someone will get back to A.S.A.P'
      render :index
    else
      flash.now[:error] = 'Cannot send message.'
      render :index
    end
  end

  private
  def contact_params
    params.require(:contact_form).permit(:name, :email, :phone, :message, :nickname, :captcha)
  end
end
