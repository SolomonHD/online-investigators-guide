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
  config.read_encrypted_secrets = true

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
  # config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment)
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "online_investigators_guide_#{Rails.env}"
  config.action_mailer.perform_caching = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

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
 # OmniAuth configuration settings
  config.idp_slo_target_url = "https://login.emory.edu:443/idp/profile/Logout"
  config.assertion_consumer_service_url = "https://oig-qa.emory.edu/auth/saml/callback"
  config.assertion_consumer_logout_service_url = "https://oig-qa.emory.edu/auth/saml/callback"
  config.issuer = "https://oig-qa.emory.edu"
  config.idp_sso_target_url = "https://login.emory.edu:443/idp/profile/SAML2/Redirect/SSO"
  config.idp_cert = ENV['SHIBB_443_IDP_CERT']
  config.certificate = ENV['OIG_QA_SP_CERT']
  config.private_key = ENV['OIG_QA_SP_KEY']
  config.attribute_statements = {:last_name => ['urn:oid:2.5.4.4'], :first_name => ['urn:oid:2.5.4.42']}
  config.uid_attribute = "urn:oid:0.9.2342.19200300.100.1.1"
  config.security = {
     #:authn_requests_signed             => true, # goes on md SPSSODescriptor tag
     #:logout_requests_signed            => true, # Enable or not signature on Logout Request
     #:logout_responses_signed           => true, # Enable or not signature on Logout Response
     #:digest_method                     => XMLSecurity::Document::SHA1,
     #:signature_method                  => XMLSecurity::Document::RSA_SHA1,
     #:embed_sign                        => true, # Embeded signature or HTTP GET parameter Signature
     #:metadata_signed                   => true, #Adds  Signature/SignedInfo/CanonicaliationMethod/SignatureMethod/ReferenceURI/Transforms/DigestMethod/DigestValue/SignedInfo/SignatureValue
     :want_assertions_encrypted  => true, #makes a 2nd KeyDescriptor, this one says use="encryption"
     #:want_assertions_signed  => true, # goes on md SPSSODescriptor tag
     #:want_name_id               => true,
  }
end