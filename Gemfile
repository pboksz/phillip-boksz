ruby '2.2.0'
source 'https://rubygems.org'

gem 'rails', '4.2.0'

gem 'sass-rails', '~> 4.0.3'
gem 'font-awesome-sass'
gem 'compass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'haml-rails'
gem 'recursive_struct'

group :test do
  gem 'codeclimate-test-reporter', require: nil
end

group :development do
  gem 'spring'
  gem 'travis'
end

group :production do
  gem 'heroku-deflater'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'quiet_assets'
  gem 'pry'
  gem 'rspec-rails'
end

group :development, :production do
  gem 'unicorn'
end
