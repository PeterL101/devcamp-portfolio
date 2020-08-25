class ContactMailer < ActionMailer::Base
  default to: "peter@stonetex.ie"

  def contact_email (name,email,phone,message)
    @name = name
    @email = email
    @phone = phone
    @message = message


    mail(from: email, subject: "StoneTex Ltd contact form message")
  end
end

