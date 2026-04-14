module PagesHelper
  # Retourne le contenu d'un bloc.
  # En mode admin : wrap dans un span avec data-key pour l'édition inline.
  # html: true → rendu HTML brut (pour les titres avec <br>, <em>, etc.)
  def cb(key, html: false)
    value = ContentBlock.get(key)
    if admin_logged_in?
      content_tag(:span, value.html_safe,
                  data: { key: key },
                  class: 'ec-editable')
    elsif html
      value.html_safe
    else
      value
    end
  end

  # Retourne l'URL de l'image uploadée pour une clé donnée, ou nil.
  def cb_image(key)
    ContentBlock.image_url_for(key, self)
  end
end
