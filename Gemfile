# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov'
end

gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.3.1'
gem 'bootstrap5-kaminari-views', '~> 0.0.1'
gem 'devise'
gem 'devise-i18n'
gem 'enum_help'
gem 'image_processing'
gem 'importmap-rails'
gem 'jbuilder'
gem 'kaminari'
gem 'mysql2', '~> 0.5'
gem 'pry-rails'
gem 'puma', '~> 6.3'
gem 'rails', '~> 7.0.4'
gem 'rails-i18n'
gem 'sassc-rails'
gem 'seed-fu'
gem 'slack-ruby-client'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
