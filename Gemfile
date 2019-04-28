source 'https://rubygems.org'

gem 'rails', '~> 5.2.0'

gem 'sass-rails', '~> 5.0'
gem 'font-awesome-sass'
gem 'compass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'haml-rails'
gem 'recursive_struct'

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
  gem 'pry'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end

group :development, :production do
  gem 'unicorn'
end
