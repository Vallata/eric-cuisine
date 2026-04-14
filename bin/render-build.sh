#!/usr/bin/env bash
# exit on error
set -o errexit

# AJOUTE CETTE LIGNE : elle règle le problème de compatibilité nokogiri
gem update --system --no-document

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
