#class OmniauthCallbacksController < Devise::OmniauthCallbacksController
class OmniauthCallbacksController < ApplicationController
  def saml
    Rails.logger.debug "OmniauthCallbacksController#saml: request.env['omniauth.auth']: #{request.env['omniauth.auth']}"
    @user = get_user(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    if @user.is_admin
      redirect_to '/admin', notice: "Logged in!"
    else
      redirect_to user_surveys_path(@user), notice: "Logged in!"
    end
  end

  private

  def get_user(auth)
     Rails.logger.debug "auth = #{auth.inspect}"
     user = User.where(provider: auth.provider, net_id: auth.uid, first_name: auth.info.first_name, last_name: auth.info.last_name).first_or_create
     user.save
     user
  end
end
