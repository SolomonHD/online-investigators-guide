class User < ApplicationRecord
  has_many :surveys

def self.from_omniauth(auth)
    Rails.logger.debug "auth = #{auth.inspect}"
    # Uncomment the debugger above to capture what a shib auth object looks like for testing
    user = where(provider: auth.provider, net_id: auth.uid, first_name: auth.first_name, last_name:auth.last_name).first_or_create
   # user.last_name = auth.last_name
   # user.first_name = auth.first_name
   # user.net_id = auth.uid
    user.save
    user
 end

 def name
   first_name + " " + last_name
 end
end
