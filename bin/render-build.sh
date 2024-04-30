#!/usr/bin/env bash
# exit on error
set -o errexit

export PORT=10000

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails s -d -p $PORT