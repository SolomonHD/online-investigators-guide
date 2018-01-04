class Admin::BaseController < ActionController::Base
  include RelativeAuth
  layout 'admin'
  before_action :is_admin?

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

  def is_admin?
    redirect_to root_url, :notice => "Not authorized" if current_user.nil? or !current_user.is_admin?
  end
end
