class Admin::BaseController < ActionController::Base
  protect_from_forgery :except => [:saml], with: :exception
  include RelativeAuth
  layout 'admin'
  before_action :is_admin?
  before_action :maintenance_mode
  before_action :sitename

  def index
  end

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
