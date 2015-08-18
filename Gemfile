source 'https://rubygems.org'

gem 'rails', '4.2.3'

# Web server Puma instead of Webrick
group :development, :production do
  gem 'puma'
end

# Development database
group :development do
  gem 'sqlite3'
end

# Postgres as the production database on Heroku
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# RSpec and Capybara as the test suite
group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'factory_girl_rails', '~> 4.0'
end

gem 'haml'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

gem 'devise'
gem 'figaro', '1.0'
