class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(net_id: params[:session][:net_id])
    if @user
      session[:user_id] = @user.id
      if @user.is_admin
        redirect_to '/admin', notice: "Logged in!"
      else
        redirect_to user_surveys_path(user), notice: "Logged in!"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    if Rails.env.local?
      redirect_to root_url, notice: "Logged out!"
    else
      sp_logout_request
    end
  end

  private

  # Create an SP initiated SLO
  def sp_logout_request
    # LogoutRequest accepts plain browser requests w/o paramters
    settings = OneLogin::RubySaml::Settings.new
    settings.assertion_consumer_service_url         = Rails.application.config.assertion_consumer_service_url
    settings.assertion_consumer_logout_service_url  = Rails.application.config.assertion_consumer_logout_service_url
    settings.issuer                                 = Rails.application.config.issuer
    settings.idp_sso_target_url                     = Rails.application.config.idp_sso_target_url
    settings.idp_slo_target_url                     = Rails.application.config.idp_slo_target_url
    settings.idp_cert                               = Rails.application.config.idp_cert
    settings.certificate                            = Rails.application.config.certificate
    settings.private_key                            = Rails.application.config.private_key

    if settings.idp_slo_target_url.nil?
      logger.info "SLO IdP Endpoint not found in settings, executing then a normal logout'"
      reset_session
    else
      # Since we created a new SAML request, save the transaction_id
      # to compare it with the response we get back
      logout_request = OneLogin::RubySaml::Logoutrequest.new()
      session[:transaction_id] = logout_request.uuid
      logger.info "New SP SLO for User ID: '#{session[:nameid]}', Transaction ID: '#{session[:transaction_id]}'"

      if settings.name_identifier_value.nil?
        settings.name_identifier_value = session[:nameid]
        settings.sessionindex = session[:session_index]
      end

      relayState = url_for controller: 'pages', action: 'index'
      redirect_to(logout_request.create(settings, :RelayState => relayState))
    end
  end
end
