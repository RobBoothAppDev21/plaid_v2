# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb
gem "cssbundling-rails" # Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "chartkick"
gem "devise"
gem 'money-rails', '~> 1.12'
gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jsbundling-rails" # Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "pg", "~> 1.1" # Use postgresql as the database for Active Record
gem "plaid"
gem "puma", "~> 5.0" # Use the Puma web server [https://github.com/puma/puma]
gem "rails", "~> 7.0.8" # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "redis", "~> 4.0" # Use Redis adapter to run Action Cable in production
gem "sprockets-rails" # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "stimulus-rails" # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "tailwindcss-rails", "~> 2.0"
gem "turbo-rails" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

# gem "bcrypt", "~> 3.1.7" # Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "image_processing", "~> 1.2" # Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "kredis" # Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "sassc-rails" # Use Sass to process CSS

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails"
  gem "simplecov"
end

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "bullet"
  gem "rubocop", require: false
  gem "rubocop-performance"                   # Performance Monitoring
  gem "rubocop-rails"                         # Rails Style Monitoring
  gem "rubocop-rspec"                         # Rspec Style Monitoring
  gem "web-console" # Use console on exceptions pages [https://github.com/rails/web-console]

  # gem "rack-mini-profiler" # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "spring" # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "webmock"
end
