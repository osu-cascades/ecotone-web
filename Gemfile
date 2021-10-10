source 'https://rubygems.org'
ruby '2.6.6'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.7'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'haml', '~> 5.1.2'
gem 'pg'
gem 'puma', '~> 4.3.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 4.2.0'
gem 'coffee-rails', '~> 4.2.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.10.0'
gem 'bcrypt'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'paperclip', '~> 5.2.1'
gem 'aws-sdk', '~> 2.9.0'
gem 'rqrcode', '~> 0.10.1'
gem 'kaminari'
gem 'webpacker', '>= 2.0.0'
gem 'devise', '>= 4.7.1'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection', '~> 1.0'

group :test do
  gem 'simplecov', '~> 0.21.2', require: false
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.8.2'
  gem 'rspec-mocks', '~> 3.8.0'
  gem 'shoulda-matchers', '~> 4.0.1'
  gem 'capybara'
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'dotenv-rails'
  gem 'poltergeist'
  gem 'foreman', '~> 0.87.2'
  gem 'haml-rails', '~> 2.0.1'
end

group :development do
  gem 'web-console', '>= 3.7.0'
  gem 'listen', '~> 3.1.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
end

group :production do
  gem 'airbrake'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
