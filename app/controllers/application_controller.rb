class ApplicationController < ActionController::Base

  before_action :sitename
  require 'set'
 # protect_from_forgery with: :exception
 include RelativeAuth



  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to root_url, :notice => "Not Authorized" if current_user.nil?
  end

  def maintenance_mode
    @maintenance_mode = Admin::SiteInformation.where("name = 'maintenance_mode'").first
  end

  def sitename
    @branding = Admin::SiteInformation.where("name = 'branding'").first
  end

  def is_admin?
    redirect_to root_url, :notice => "Not authorized" if current_user.nil? or !current_user.is_admin?
  end
end
