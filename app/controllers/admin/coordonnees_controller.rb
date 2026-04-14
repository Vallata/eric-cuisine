class Admin::CoordonneesController < Admin::BaseController
  KEYS = %w[
    contact.email contact.phone contact.hours
    footer.copyright footer.link1 footer.link2 footer.link3
  ].freeze

  def show
    @values = KEYS.index_with { |k| ContentBlock.get(k) }
  end

  def update
    coordonnees = params[:coordonnees]&.permit(*KEYS) || {}
    coordonnees.each do |key, value|
      next unless KEYS.include?(key)
      block = ContentBlock.find_or_initialize_by(key: key)
      block.value = value
      block.save!
    end
    redirect_to admin_coordonnees_path, notice: 'Coordonnées mises à jour.'
  end
end
