Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Attempt to read encrypted secrets from `config/secrets.yml.enc`.
  # Requires an encryption key in `ENV["RAILS_MASTER_KEY"]` or
  # `config/secrets.yml.key`.
  config.read_encrypted_secrets = false

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Mount Action Cable outside main process or domain
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment)
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "ecotone-web_#{Rails.env}"
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  host = 'osu-ecotone.herokuapp.com'
  config.action_mailer.default_url_options = { host: host }
  ActionMailer::Base.smtp_settings = {
    address:              'smtp.sendgrid.net',
    port:                 '587',
    authentication:       :plain,
    user_name:            ENV['SENDGRID_USERNAME'],
    password:             ENV['SENDGRID_PASSWORD'],
    domain:               'heroku.com',
    enable_starttls_auto: true
  }

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = [I18n.default_locale]

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  config.paperclip_defaults = {
    storage: :s3,
    s3_region: ENV.fetch('AWS_REGION'),
    url: ":s3_domain_url",
    path: "/#{Rails.application.class.parent_name.downcase}/#{ENV.fetch('AWS_S3_ENV')}/:class/:attachment/:id/:style/:basename.:extension",
    s3_credentials: {
      bucket: ENV.fetch('AWS_S3_BUCKET'),
      access_key_id: ENV.fetch('AWS_S3_KEY'),
      secret_access_key: ENV.fetch('AWS_S3_SECRET'),
    }
  }
end

# https://github.com/airbrake/airbrake-ruby#configuration
Airbrake.configure do |c|
  # https://github.com/airbrake/airbrake-ruby#project_id--project_key
  c.project_id = ENV['AIRBRAKE_PROJECT_ID']
  c.project_key = ENV['AIRBRAKE_API_KEY']
  # https://github.com/airbrake/airbrake-ruby#root_directory
  c.root_directory = Rails.root
  # https://github.com/airbrake/airbrake-ruby#logger
  c.logger = Rails.logger
  # https://github.com/airbrake/airbrake-ruby#environment
  c.environment = ENV['AIRBRAKE_ENV']
  # NOTE: This option *does not* work if you don't set the 'environment' option.
  # https://github.com/airbrake/airbrake-ruby#ignore_environments
  c.ignore_environments = %w(development test)
  # https://github.com/airbrake/airbrake-ruby#blacklist_keys
  c.blocklist_keys = [/password/i, /authorization/i]
end
# A filter that collects request body information. Enable it if you are sure you
# don't send sensitive information to Airbrake in your body (such as passwords).
# https://github.com/airbrake/airbrake#requestbodyfilter
# Airbrake.add_filter(Airbrake::Rack::RequestBodyFilter.new)

# If you want to convert your log messages to Airbrake errors, we offer an
# integration with the Logger class from stdlib.
# https://github.com/airbrake/airbrake#logger
# Rails.logger = Airbrake::AirbrakeLogger.new(Rails.logger)
