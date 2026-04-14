# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

Site vitrine pour **Eric Cuisine**, chef cuisinier freelance spécialisé en restauration collective. Le site est entièrement statique, sans build system, sans dépendances npm, sans serveur back-end.

- `index.html` — structure HTML du site
- `style.css` — tous les styles (variables CSS, composants, responsive)
- `script.js` — interactions UI uniquement

## Développement

Aucun build requis. Ouvrir via un serveur local (nécessaire pour que les fichiers CSS/JS se chargent) :

```bash
python3 -m http.server 8080
```

## Architecture

**`style.css`** — variables CSS définies dans `:root` (`--green`, `--font-heading`, `--font-body`, etc.), puis styles par section dans l'ordre du DOM.

**`index.html`** — contenu statique organisé en sections : `#profil`, `#experience`, `#disponibilites`, `#process`, `#reassurance`, `#contact`. Certains éléments utilisent des `style=` inline pour des valeurs ponctuelles (grilles, espacements locaux).

**`script.js`** — uniquement des interactions UI :
- Progress bar au scroll
- Nav qui change de style au scroll (classe `.scrolled`)
- Parallax léger sur le hero
- Compteur animé (`#counter-badge`, déclenché par IntersectionObserver, valeur dans `data-count`)
- Soumission formulaire de contact (côté client uniquement, pas d'envoi réel)
