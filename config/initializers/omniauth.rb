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
#Add for testing new deploy
if Rails.env.local?
 Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer,
   :fields => [:first_name, :last_name],
   :uid_field => :last_name
 end
end

if Rails.env.development?
 Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
    :assertion_consumer_service_url     => "https://oig-dev.emory.edu/auth/saml/callback",
    :issuer                             => "https://oig-dev.emory.edu",
    :idp_sso_target_url                 => "https://login.emory.edu:4443/idp/profile/SAML2/Redirect/SSO",
   # :idp_sso_target_url_runtime_params => {:original_request_param => :mapped_idp_param},
    :idp_cert                           => ENV['SHIBB_4443_IDP_CERT'],
   # :idp_cert_fingerprint              => "E7:91:B2:E1:...",
   # :idp_cert_fingerprint_validator    => lambda { |fingerprint| fingerprint },
   # :name_identifier_format            => "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
     :certificate                       => ENV['OIG_DEV_SP_CERT'],
     :private_key                       => ENV['OIG_DEV_SP_KEY'],
     :fake_setting1 => true,
     :security => :fake_setting2 => true,
     #:embed_sign                       => false
     :security => {
       
       :authn_requests_signed             => true,     # Enable or not signature on AuthNRequest
       :logout_requests_signed            => true,     # Enable or not signature on Logout Request
       :logout_responses_signed           => true,     # Enable or not signature on Logout Response
       :digest_method                     => XMLSecurity::Document::SHA1,
       :signature_method                  => XMLSecurity::Document::SHA1,
       :embed_sign                        => true                # Embeded signature or HTTP GET parameter Signature
   }
 end
end
