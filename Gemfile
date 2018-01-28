source 'https://rubygems.org'
ruby '2.4.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'bootstrap-sass'
gem 'haml'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'paperclip', '~> 5.2.1'
gem 'aws-sdk', '~> 2.9.0'
gem 'rqrcode', '~> 0.10.1'
gem 'kaminari'
gem 'webpacker', '>= 2.0.0'

group :test do
  gem 'simplecov', require: false
  gem 'codeclimate-test-reporter', '~> 1.0.8'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'rspec-mocks'
  gem 'shoulda-matchers', '~> 3.1.1'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
  gem 'poltergeist'
  gem 'foreman', '~> 0.84.0'
  gem 'haml-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
end

group :production do
  gem 'airbrake'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
