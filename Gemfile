source 'https://rubygems.org'
ruby '2.0.0'
#ruby-gemset=oovre

gem 'foreman'
gem 'thin'
gem 'rails', '4.1.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

gem 'sass-rails', :git => 'https://github.com/rails/sass-rails.git'
gem 'susy', '~> 2.1.2'
gem 'breakpoint', '~> 2.4.0'
gem 'font-awesome-sass'

gem 'devise'
gem 'paperclip', '~> 4.1'
gem 'aws-sdk'

gem 'capistrano', '~> 3.1.0'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1'
gem 'capistrano-rvm', github: 'capistrano/rvm'

# gem 'omniauth'
# gem 'omniauth-twitter'

group :development, :test do
  gem 'better_errors'
	gem 'rspec-rails'
	gem 'sqlite3'
  gem 'quiet_assets'
  gem 'spring'
  gem 'factory_girl_rails'
end

group :test do
  gem 'nyan-cat-formatter'
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end

group :production do
  gem 'rails_12factor'
	gem 'pg'
end

group :doc do
  gem 'sdoc', require: false
end
