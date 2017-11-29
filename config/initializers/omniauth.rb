if Rails.env.development?
 Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
    :assertion_consumer_service_url     => Rails.application.config.assertion_consumer_service_url,
    :issuer                             => Rails.application.config.issuer,
    :idp_sso_target_url                 => Rails.application.config.idp_sso_target_url,
    :idp_slo_target_url                 =>  Rails.application.config.idp_slo_target_url,
    :idp_cert                           => Rails.application.config.idp_cert,
    :certificate                        => Rails.application.config.certificate,
    :private_key                        => Rails.application.config.private_key,
    :attribute_statements               => Rails.application.config.attribute_statements,
    :uid_attribute                      => Rails.application.config.uid_attribute,
    :security                           => Rails.application.config.security
  end
end
