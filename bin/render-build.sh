#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install

# On utilise 'bundle exec rails' pour être sûr de l'environnement
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Si tu as une base de données sur Render, garde cette ligne.
# Si tu n'as pas encore créé de base Postgres sur Render, commente-la avec un #
bundle exec rails db:migrate
