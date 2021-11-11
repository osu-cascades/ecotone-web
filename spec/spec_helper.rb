require 'active_storage_validations/matchers'
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|

#Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

  config.include ActiveStorageValidations::Matchers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  # config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 1

  config.order = :random
  Kernel.srand config.seed

  RSpec::Matchers.define :have_attached_file do |name|
    match do |record|
      file = record.send(name)
      file.respond_to?(:variant) && file.respond_to?(:attach)
    end
  end
  

end
