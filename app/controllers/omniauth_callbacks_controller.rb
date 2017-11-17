#class OmniauthCallbacksController < Devise::OmniauthCallbacksController
class OmniauthCallbacksController < ApplicationController
    def saml
      Rails.logger.debug "OmniauthCallbacksController#saml: request.env['omniauth.auth']: #{request.env['omniauth.auth']}"
      # had to create the `from_omniauth(auth_hash)` class method on our User model
      @user = User.from_omniauth(request.env["omniauth.auth"])
      # set_flash_message :notice, :success, kind: "Emory NetID"
      # sign_in_and_redirect @user
      redirect_to user_surveys_url(@user)
   end
  end
