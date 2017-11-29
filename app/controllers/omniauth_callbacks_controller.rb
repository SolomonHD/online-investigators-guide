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

  # Trigger SP and IdP initiated Logout requests
  def single_logout
    # We've been given a response back from the IdP
    if params[:SAMLResponse]
      logger.info "********************************"
      logger.info "params[:SAMLResponse] => " + params[:SAMLResponse]
      logger.info "********************************"
      return process_logout_response
    elsif params[:slo]
      reset_session

      logger.info "********************************"
      logger.info "params[:slo] => " + params[:slo]
      logger.info "********************************"
      return sp_logout_request
    else
      reset_session
    end
  end

  # Create an SP initiated SLO
  def sp_logout_request
    logger.info "********************************"
    logger.info "INSIDE sp_logout_request"
    logger.info "********************************"

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

      relayState = url_for controller: 'omniauth_callbacks', action: 'index'
      redirect_to(logout_request.create(settings, :RelayState => relayState))
    end
  end

  # After sending an SP initiated LogoutRequest to the IdP, we need to accept
  # the LogoutResponse, verify it, then actually delete our session.
  def process_logout_response

    logger.info "********************************"
    logger.info "Handling process_logout_response"
    logger.info "********************************"


    settings = OneLogin::RubySaml::Settings.new
    settings.idp_slo_target_url = Rails.application.config.idp_slo_target_url

    request_id = session[:transaction_id]
    logout_response = OneLogin::RubySaml::Logoutresponse.new(params[:SAMLResponse], settings, :matches_request_id => request_id, :get_params => params)
    logger.info "LogoutResponse is: #{logout_response.response.to_s}"

    # Validate the SAML Logout Response
    if not logout_response.validate
      error_msg = "The SAML Logout Response is invalid.  Errors: #{logout_response.errors}"
      logger.error error_msg
      render :inline => error_msg
    else
      # Actually log out this session
      if logout_response.success?
        logger.info "Delete session for '#{session[:nameid]}'"
        reset_session
      end
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
