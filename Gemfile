# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'

gem 'awesome_print'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'health_check'
gem 'jsonapi-serializer'
gem 'lograge'
gem 'pg'
gem 'puma'
gem 'rack-attack'
gem 'rack-cors'
gem 'rswag-api'
gem 'rswag-ui'
gem 'rubocop-performance', require: false
gem 'rubocop', require: false

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rswag-specs'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
