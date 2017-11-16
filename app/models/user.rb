class User < ApplicationRecord
  has_many :surveys

def self.from_omniauth(auth)
   # Rails.logger.debug "auth = #{auth.inspect}"
    # Uncomment the debugger above to capture what a shib auth object looks like for testing
    user = where(provider: auth.provider, uid: auth.info.uid).first_or_create
    # user.display_name = auth.info.display_name
    user.uid = auth.info.uid
    #user.ppid = auth.uid
    #user.email = auth.info.uid + '@emory.edu'
    user.save
    user
 end 

 def name
   first_name + " " + last_name
 end
end
