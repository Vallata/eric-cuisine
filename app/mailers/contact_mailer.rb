class ContactMailer < ApplicationMailer
  def new_inquiry(params)
    @params = params
    @received_at = Time.now
    @admin_email = ContentBlock.get('contact.email')
    mail(
      to:      @admin_email,
      subject: "[Eric Cuisine] Nouvelle demande de #{params[:prenom]} #{params[:nom]}"
    )
  end
end
