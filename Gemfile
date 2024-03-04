source "https://rubygems.org"

ruby "3.1.1"
# Ancestry is a gem that allows rails ActiveRecord models to be organized as a tree structure (or hierarchy) https://github.com/stefankroes/ancestry
gem 'ancestry'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

gem "devise", "~> 4.9"
gem 'devise-i18n'

gem 'i18n-tasks'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3"

gem 'rails-i18n'

# Sentry captures data by using an SDK within your application’s runtime
gem "sentry-ruby"
gem "sentry-rails"

gem "simple_form"

# slim-lint is a tool to help keep your Slim files clean and readable. In addition to style and lint checks, it integrates with RuboCop to bring its powerful static analysis tools to your Slim templates
gem "slim_lint"

gem "slim-rails"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]

  # Library for generating fake data such as names, addresses, and phone numbers [https://github.com/faker-ruby/faker]
  gem "faker"

  # Linter
  gem 'rubocop-rails', require: false

  # Use sqlite3 as the database for Active Record
  gem "sqlite3", "~> 1.4"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  gem "error_highlight", ">= 0.6.0", platforms: [:ruby]
end

group :production do
  gem 'pg'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "minitest-power_assert"
  gem "selenium-webdriver"
end
