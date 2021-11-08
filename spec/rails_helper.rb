require 'simplecov'
require 'paperclip/matchers'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'capybara/poltergeist' # Add additional requires below this line.
require 'devise'

Capybara.javascript_driver = :poltergeist

# Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::ControllerHelpers, type: :helper
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Paperclip::Shoulda::Matchers
  # # https://github.com/rails/webpacker/issues/59
  # config.before :suite do
  #   `bin/webpack`
  #   Timeout.timeout(300) do
  #     loop until Webpacker.config.public_manifest_path.exist?
  #   end
  # end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
