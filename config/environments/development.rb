Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.log_level = :debug

  # OmniAuth configuration settings
  config.idp_slo_target_url = "https://login.emory.edu:4443/idp/profile/Logout"
  config.assertion_consumer_service_url = "https://oig-dev.emory.edu/auth/saml/callback"
  config.assertion_consumer_logout_service_url = "https://oig-dev.emory.edu/omniauth_callbacks/single_logout"
  config.issuer = "https://oig-dev.emory.edu"
  config.idp_sso_target_url = "https://login.emory.edu:4443/idp/profile/SAML2/Redirect/SSO"
  config.idp_cert = ENV['SHIBB_4443_IDP_CERT']
  config.certificate = ENV['OIG_DEV_SP_CERT']
  config.private_key = ENV['OIG_DEV_SP_KEY']
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
     :want_assertions_signed  => true, # goes on md SPSSODescriptor tag
     #:want_name_id               => true,
  }

end
