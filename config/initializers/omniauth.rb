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
    :assertion_consumer_service_url     => Rails.application.config.assertion_consumer_service_url,
    :issuer                             => Rails.application.config.issuer,
    :idp_sso_target_url                 => Rails.application.config.idp_sso_target_url,
    :idp_slo_target_url                =>  Rails.application.config.idp_slo_target_url,
    :idp_cert                           => Rails.application.config.idp_cert,
     :certificate                       => Rails.application.config.certificate,
     :private_key                       => Rails.application.config.private_key,
     :attribute_statements => Rails.application.config.attribute_statements,
     :uid_attribute => Rails.application.config.uid_attribute,
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
