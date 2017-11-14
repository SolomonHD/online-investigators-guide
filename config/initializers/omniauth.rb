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
     :certificate                      =>"MIIDwzCCAqugAwIBAgIJAKOI3g9tHcWXMA0GCSqGSIb3DQEBCwUAMHgxCzAJBgNV
BAYTAlVTMQswCQYDVQQIDAJHQTEQMA4GA1UEBwwHQXRsYW50YTEZMBcGA1UECgwQ
RW1vcnkgVW5pdmVyc2l0eTENMAsGA1UECwwETElUUzEgMB4GA1UEAwwXaAgIG1tD
b2lnLWRldi5lbW9yeS5lZHUwHhcNMTcxMTE0MTYwMTQ1WhcNMTcxMjE0MTYwMTQ1
WjB4MQswCQYDVQQGEwJVUzELMAkGA1UECAwCR0ExEDAOBgNVBAcMB0F0bGFudGEx
GTAXBgNVBAoMEEVtb3J5IFVuaXZlcnNpdHkxDTALBgNVBAsMBExJVFMxIDAeBgNV
BAMMF2gICBtbQ29pZy1kZXYuZW1vcnkuZWR1MIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEA1dBqFk7hDb4DDuhXcW7jgy30CLqPNAxm/DgIVCyxhzSfmzNo
r35kLaIOlhnYb67nwUg17vTounmb9uUCjAGxETTpJXI0O1CWQf+vmr/X6Shh3afW
qjx1OeE+IMWtl2+q8CPfc6YzNkjB/fyH2vT0jozawDgvi2jdjU6HJg5FTShZUTw5
UCO6J5rW9Lzxg/rRSaDqLcdp809sdcHH8lLtxqKu2gFyjsFv5267+2GUuVKHzhI4
eHzzy2wXUurg8FStWnYhHnhuiVGZ9Usw/fbUa5KIlTtdEqOFHRBee9pFjSUqFRJl
Fbq0SvjT3AUJ/DvY82YneLjbk4jiEz1usDKY6wIDAQABo1AwTjAdBgNVHQ4EFgQU
FqAgrAd7j2xGT3uqzOz3vaR8zLkwHwYDVR0jBBgwFoAUFqAgrAd7j2xGT3uqzOz3
vaR8zLkwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEA0ZgPsJgruqw/
WdyNGYPPLpeLs99FuyF0+vGkNFx4DGGDhMg1LxnpCeg2BNvwzb1B8Bm6lbDEiOPQ
fuhdZ3BVts9Op0Z5RTdWF2Vv9vHxebR+hkToDyftZlZuAc7ZvdvU7EM00QfdnTAy
fEgdi0hl69sN/WK3ZMMeEiiBcrqgdwJvZgNgLsNtCFMJLcxmFBSRS9Izfxn3w5YU
so8IgCu7px5CHCsNIs2XhsdW4fziJAcmGSXtNd7MTlruDZB+ZwXhor1PTE5+M3EQ
dpVZHUXuGp0YuNxfymgwo89GWx9qVBNDVrmLKsPok/r2nW7W3o235yTuqKaLfrZy
G2PiaQ1rRQ==",
     :private_key => "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDV0GoWTuENvgMO
6FdxbuODLfQIuo80DGb8OAhULLGHNJ+bM2ivfmQtog6WGdhvrufBSDXu9Oi6eZv2
5QKMAbERNOklcjQ7UJZB/6+av9fpKGHdp9aqPHU54T4gxa2Xb6rwI99zpjM2SMH9
/Ifa9PSOjNrAOC+LaN2NTocmDkVNKFlRPDlQI7onmtb0vPGD+tFJoOotx2nzT2x1
wcfyUu3Goq7aAXKOwW/nbrv7YZS5UofOEjh4fPPLbBdS6uDwVK1adiEeeG6JUZn1
SzD99tRrkoiVO10So4UdEF572kWNJSoVEmUVurRK+NPcBQn8O9jzZid4uNuTiOIT
PW6wMpjrAgMBAAECggEAY6jQOfOsPK6LWGB9mZa5HwTFUWg7pWP+gKNRZoKqgL3L
gxi0O9Bqu0ZlDBuh4XSh+1pAIVAwRfK2+p6F0GJdeQqzfUu9AsSuNLcLz9KJvdif
vSQlD5Y8gaz2O2pIXmSjRWlDFvGpvyysl0kkva8danBG6f+GUbGgSuQGZHuUW8CP
IyryabZUGh9GeOeMns1k0bXwgAlsFarJ1Kn4lxZ+PR1NJxNrRGeMuftz+GXLSbH+
kILNkfpMgX2rTeH5sJ7Q5RsAtI7XpVjhncOcZr89N9HxqLkqRPKpoXBI/XeepcfL
Jv6FAyXG3rWtWffl1NUejvB6Bsb3w8DDalqwbKFKuQKBgQD8IMaHmtzhqcAZranr
xVtk4D9zF42GeLwp5ZTJQfu0XACPaLhZjPIb2Y1Os3fvgjHT3WRtmovyYplT8Ezp
lSVKuyIM1PP6LO7O4yJLeceRKmvqK2NihQFHqB2THPpMBNRFAWKsoK3gCT91A+3m
SFRGFMyzS0GNcgWZmSJ0a7pxvQKBgQDZGQKkM5k+nOr79mUQO+2kYmKPrxIjg4Bm
T4v6R7nTq/0OxT7JaQjNB/Q7sc+eOvJoG+Ceouj7NarF5zP7NMxMRaylcQ1ZSCR7
/KL7kiZLvC8c1iWOrZslMcEJHtNnKceqC9Yrm8UZnCMU+ykq66+QOIWvN18ywQpG
dvQTuY5bxwKBgHiLmyAetNjX9lbQp1toosfaR7vZWPsgIqbNc5O+DoAvNL1cTjfS
obcbDuq/9+n1j6lCQs/8gkjDR5fQXpWXj5rpWeBUuMm2Tf9wrWb0tKv9Ylc1o3Dp
MrF1+Z3qzuklre/IN8tdj4R8J3DlDgt6LYDMVQqsQo1EJNVJWCXdk+jpAoGBANbl
6/hwXyxcljrNnyLfv5AuF5RVX2YqIKql6VDZOTgvknLRiyJCR4T1b6y7iWH+xb+K
gOFnL6qjaCU4hPsQO37wpUKrUuRjBkJ5RTgzZpcnc5de35SJgv7hbkzB58/ByrQn
vVwzeHquVQfKyuiCnqnrWWGlNSX/clVoIJl531I3AoGBAOSbULoG8iItVOhjEFeI
oDj1ma+pLbIckvbhrdGqBIWGHCegDeCvmylQ2inyC2q280BJu9on21k8Fxi4pbzF
Z9WDhyEe0mHyvHwjn6srpVafiZp3tfbvLfy95k10Q0DDhNY+mACGYgOFztO/FMPX
GsSYb9ipj9dmfGLTyq0xH4Lz"
end
