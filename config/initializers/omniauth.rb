if Rails.env.local?
 Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer,
   :fields => [:first_name, :last_name, :uid],
   :uid_field => :uid
 end
end

if Rails.env.development?
 Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
    :assertion_consumer_service_url     => "https://oig-dev.emory.edu/auth/saml/callback",
    :issuer                             => "https://oig-dev.emory.edu",
    :idp_sso_target_url                 => "https://login.emory.edu:4443/idp/profile/SAML2/Redirect/SSO",
    :idp_slo_target_url                =>  Rails.application.config.idp_slo_target_url,
    :idp_cert                           => ENV['SHIBB_4443_IDP_CERT'],
     :certificate                       => ENV['OIG_DEV_SP_CERT'],
     :private_key                       => ENV['OIG_DEV_SP_KEY'],
     :attribute_statements => {:last_name => ['urn:oid:2.5.4.4'], :first_name => ['urn:oid:2.5.4.42']},
     :uid_attribute => 'urn:oid:0.9.2342.19200300.100.1.1',
     :security => {
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
end
