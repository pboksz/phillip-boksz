ruby '2.2.0'
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'font-awesome-sass'
gem 'compass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use haml for views
gem 'haml-rails'
# Gem for recursive structs
gem 'recursive_struct'

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :development do
  gem 'spring'
  gem 'travis'
end

group :production do
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'quiet_assets'
  gem 'pry'
  gem 'rspec-rails'
end

group :development, :production do
  gem 'unicorn'
end
