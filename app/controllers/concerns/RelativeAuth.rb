module RelativeAuth 
  def auth_scheme
    if Rails.env.local?
     return "auth/developer"
    else
     return "auth/saml"
    end
  end
end
