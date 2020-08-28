class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def contact_us
    form = ContactForm.new(contact_us_form_params)
    if form.valid?
      ContactMailer.contact_email(
        form.author_name,
        form.author_email,
        form.author_phone,
        form.message).deliver_later
      render json: { success: true }, status: :ok
    else
      render json: { errors: form.errors.to_h }, status: 422
    end
  end

  private

  def contact_us_form_params
    params.require(:contact_us_form).permit(:author_name, :author_email, :author_phone, :message)
  end

end
