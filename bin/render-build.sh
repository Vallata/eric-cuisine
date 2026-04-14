#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
# Si tu n'as pas encore de base de données configurée,
# tu peux commenter la ligne suivante avec un #,
# mais normalement elle est nécessaire :
bundle exec rails db:migrate
