class ContactsController < ApplicationController
  def create
    ContactMailer.new_inquiry(contact_params).deliver_now
    render json: { ok: true }
  rescue => e
    Rails.logger.error "ContactMailer error: #{e.message}"
    render json: { ok: false }, status: 422
  end

  private

  def contact_params
    params.permit(:prenom, :nom, :email, :telephone, :structure, :message)
  end
end
