class ApplicationController < ActionController::Base
#  protect_from_forgery with: :exception
helper_method  :auth_scheme

  def auth_scheme
    if Rails.env.local?
     return "auth/developer"
    else 
     return "auth/saml"
    end 
  end 


  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to root_url, :notice => "Not Authorized" if current_user.nil?
  end

  def is_admin?
    redirect_to root_url, :notice => "Not authorized" if current_user.nil? or !current_user.is_admin?
  end
end
