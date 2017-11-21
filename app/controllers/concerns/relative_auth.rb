module RelativeAuth
extend ActiveSupport::Concern

included do
  helper_method :auth_scheme
end 

def auth_scheme
    if Rails.env.local?
     return "auth/developer"
    else
     return "auth/saml"
    end
  end
end
