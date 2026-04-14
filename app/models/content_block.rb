class ContentBlock < ApplicationRecord
  has_one_attached :image

  DEFAULTS = {
    # Hero
    'hero.tag'    => "Chef Cuisinier Expérimenté · 12 ans d'expérience · Disponible Dès Maintenant",
    'hero.line1'  => 'Votre partenaire culinaire',
    'hero.line2'  => 'pour la restauration',
    'hero.line3'  => '<em>collective</em> de qualité.',
    'hero.desc'   => "Chef cuisinier freelance spécialisé en restauration collective depuis 2012. Je propose mes services aux entreprises, cantines, maisons de retraite et structures de restauration en quête de prestations culinaires professionnelles, fiables et savoureuses. Tarifs compétitifs et flexibilité garantis.",
    'hero.scroll' => 'Découvrir',
    # Profil
    'profil.label'       => 'À propos de moi',
    'profil.heading'     => 'Un chef cuisinier<br />passionné et <em>fiable</em>',
    'profil.para1'       => "Depuis 2012, j'accompagne les collectivités et les entreprises de restauration dans leurs besoins culinaires les plus exigeants. Avec une solide expérience en cuisine collective, j'apporte une qualité professionnelle et une régularité que vous pouvez compter. Formation en école hôtelière, certifié HACCP, je maîtrise tous les aspects de la restauration collective moderne.",
    'profil.para2'       => "Rigoureux sur l'hygiène et les normes de sécurité alimentaire, créatif dans la conception de menus variés, et attentif aux contraintes budgétaires, je m'adapte à vos besoins spécifiques. Que vous cherchiez une solution de remplacement ponctuelle, un partenariat régulier ou une prise en charge complète de votre cuisine, j'ai les compétences et la flexibilité pour vous satisfaire.",
    'profil.cta'         => 'Demander un devis →',
    'profil.badge'       => '3800',
    'profil.badge_label' => 'Repas servis',
    # Citation
    'quote.main'   => "« Eric a transformé notre service de restauration en 6 mois. Ses menus sont diversifiés, les résidents les adorent, et ses tarifs sont imbattables. Un professionnel hyper fiable. »",
    'quote.author' => 'Directrice · Maison de Retraite Résidence Golden Age, Versailles',
    # Expérience
    'exp.label'       => 'Domaines de spécialité',
    'exp.heading'     => 'Mes compétences<br />en cuisine collective',
    'exp.cta'         => 'Discuter de votre projet →',
    'exp.card1.title' => 'Cuisine traditionnelle française',
    'exp.card1.desc'  => 'Plats authentiques et savoureux : potages, rôtis, gratins, desserts maison. Parfait pour les services classiques avec volume de 50 à 500 commensaux.',
    'exp.card2.title' => 'Régimes alimentaires spéciaux',
    'exp.card2.desc'  => 'Gestion des repas adaptés : végétariens, véganiens, sans gluten, sans lactose, allergies diverses. Traçabilité complète, documentation HACCP à jour.',
    'exp.card3.title' => 'Cuisine événementielle',
    'exp.card3.desc'  => "Brunchs d'entreprise, déjeuners d'affaires, séminaires, réceptions. Présentation soignée, service sur plateau, menu à la carte.",
    'exp.card4.title' => 'Optimisation budgétaire',
    'exp.card4.desc'  => 'Achat auprès de fournisseurs de qualité, gestion des stocks, réduction des déchets. Tarifs dégressifs selon volumes, devis transparent.',
    'exp.card5.title' => 'Hygiène &amp; Sécurité alimentaire',
    'exp.card5.desc'  => 'Respect intégral HACCP, normes ISO, traçabilité totale. Formation disponible pour vos équipes, audits internes réguliers.',
    'exp.card6.title' => 'Approche durable &amp; locale',
    'exp.card6.desc'  => 'Partenariats avec producteurs locaux, menus saisonniers, réduction des plastiques. Engagement RSE, bilan carbone minimisé.',
    # Disponibilités
    'dispo.label'      => 'Calendrier de travail',
    'dispo.heading'    => 'Mes disponibilités',
    'dispo.wd.time'    => 'À partir de 16h — Lundi à Vendredi',
    'dispo.wd.desc'    => "Prises de fonction en fin d'après-midi. Idéal pour les services dîner, goûter d'entreprise et événements en semaine. Possibilité de venir plus tôt pour la préparation.",
    'dispo.we.time'    => 'Toute la journée — Samedi, Dimanche &amp; Jours Fériés',
    'dispo.we.desc'    => 'Disponibilité complète pour les brunchs, déjeuners complets, services dîner et événements spéciaux. Fleurs à la française, menus gastronomiques.',
    'dispo.note'       => '<strong>✓ Disponibilité immédiate</strong> — Contactez-moi pour discuter de vos besoins. Tarifs adaptés selon forfait (heures, volume, complexité). Devis gratuit dans les 24h.',
    # Processus
    'process.label'       => 'Notre collaboration',
    'process.heading'     => 'Comment ça marche<br />en 4 étapes',
    'process.step1.title' => 'Contactez-moi',
    'process.step1.desc'  => "Vous m'envoyez un message avec vos besoins : date, couverts, budget, régimes spéciaux, thème.",
    'process.step2.title' => 'Devis personnalisé',
    'process.step2.desc'  => 'Je vous propose un menu adapté avec devis détaillé. Pas de surprise, tarification transparente et juste.',
    'process.step3.title' => 'Accord &amp; Préparation',
    'process.step3.desc'  => "Vous validez le devis, je vous contacte 48h avant pour les derniers détails. Préparation logistique.",
    'process.step4.title' => 'Service &amp; Paiement',
    'process.step4.desc'  => "J'exécute la prestation avec excellence. Paiement après service possible (chèque, virement, espèces).",
    # Avantages
    'adv.label'       => 'Pourquoi choisir Eric',
    'adv.heading'     => 'Les 6 avantages de<br />travailler avec moi',
    'adv.card1.title' => '✓ Qualité garantie',
    'adv.card1.desc'  => "Certifié HACCP, 12 ans d'expérience, fiches techniques, traçabilité totale, standards professionnels.",
    'adv.card2.title' => '✓ Flexibilité maximale',
    'adv.card2.desc'  => 'Disponible rapidement, horaires adaptés à votre calendrier, volume flexible, service ponctuel ou régulier.',
    'adv.card3.title' => 'Tarifs justes &amp; transparents',
    'adv.card3.desc'  => 'Pas de frais cachés, devis gratuit sous 24h, tarifs dégressifs pour volume, compétitifs.',
    'adv.card4.title' => '✓ Créativité culinaire',
    'adv.card4.desc'  => 'Menus personnalisés, saisonnalité, approche locale, partenaires producteurs, zéro plastique.',
    'adv.card5.title' => 'Sérieux &amp; Responsabilité',
    'adv.card5.desc'  => 'Assurance RC Pro, confidentiel, ponctuel, discret, suivi RGPD, avis clients authentiques.',
    'adv.card6.title' => '✓ Accompagnement complet',
    'adv.card6.desc'  => 'Réponses rapides, ajustements faciles, renouvellement simple, relation au long terme.',
    # Références
    'ref.label'        => 'Références &amp; Preuves',
    'ref.heading'      => 'Certifications &amp; Témoignages',
    'ref.item1.date'   => '2024-2025',
    'ref.item1.cat'    => 'Certification',
    'ref.item1.title'  => 'Certification HACCP &amp; Hygiène Alimentaire renouvelée — Organisme agréé DGCCRF',
    'ref.item2.date'   => '2024',
    'ref.item2.cat'    => 'Référence',
    'ref.item2.title'  => "Partenaire régulier depuis 3 ans — Siège social de Société de gestion d'actifs (2000 employés), La Défense",
    'ref.item3.date'   => '2023',
    'ref.item3.cat'    => 'Référence',
    'ref.item3.title'  => 'Services traiteur pour 18 séminaires/événements — Taux de satisfaction 99% (avis clients)',
    'ref.item4.date'   => '2023',
    'ref.item4.cat'    => 'Certification',
    'ref.item4.title'  => 'Spécialisation en gestion des allergènes &amp; intolérances — Niveau expert ANSM',
    # Contact
    'contact.label'        => 'Parlons ensemble',
    'contact.heading'      => 'Parlons de vos<br />besoins culinaires.',
    'contact.phone'        => '+33 (0)6 75 42 18 93',
    'contact.hours'        => 'Lun–Ven · 10h–20h · Réponse sous 2h',
    'contact.email'        => 'eric@eric-cuisine.fr',
    'contact.consult'      => 'Consultation gratuite',
    'contact.consult_desc' => 'Gratuit — 15 minutes — sans engagement.<br />Discutons de votre projet, vos volumes, votre budget et vos contraintes.',
    'contact.form_label'   => 'Remplissez le formulaire',
    'contact.submit'       => 'Demander un devis →',
    # Footer
    'footer.logo'      => 'Eric Cuisine',
    'footer.copyright' => '© 2024-2026 · Chef Cuisinier Freelance · SIRET 78 234 567 100 · Reg. CNIL 2024-FR-123456',
    'footer.link1'     => 'Mentions légales',
    'footer.link2'     => 'Confidentialité &amp; RGPD',
    'footer.link3'     => 'Tarifs &amp; Forfaits',
  }.freeze

  def self.get(key)
    find_by(key: key)&.value || DEFAULTS[key] || ''
  end

  def self.image_url_for(key, helper)
    block = find_by(key: key)
    return nil unless block&.image&.attached?
    helper.url_for(block.image)
  end
end
