#Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :shibboleth, {
#    :shib_session_id_field     => "Shib-Session-ID",
#    :shib_application_id_field => "Shib-Application-ID",
#    :debug                     => false,
#    :extra_fields => [
#      :"unscoped-affiliation",
#      :entitlement
#    ]
#  }
#end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
   # :assertion_consumer_service_url     => "consumer_service_url",
    :issuer                             => "http://oig-dev.emory.edu",
    :idp_sso_target_url                 => "https://login.emory.edu/idp/profile/SAML2/Redirect/SSO",
   # :idp_sso_target_url_runtime_params  => {:original_request_param => :mapped_idp_param},
    :idp_cert                           => ENV['SHIBB_IDP_CERT'],
   # :idp_cert_fingerprint               => "E7:91:B2:E1:...",
   # :idp_cert_fingerprint_validator     => lambda { |fingerprint| fingerprint },
   # :name_identifier_format             => "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
     :certificate                      =>"SFDSFDFSF23423432SFSDFSDF"
end
