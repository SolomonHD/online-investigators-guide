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
    # We've been given a response back from the IdP
    elsif params[:SAMLResponse]
      return process_logout_response
    else
      sp_logout_request
    end
  end

  private

  # Create an SP initiated SLO
  def sp_logout_request
    # LogoutRequest accepts plain browser requests w/o paramters
    logger.info "idp_slo_target_url " + Rails.application.config.idp_slo_target_url

    settings = OneLogin::RubySaml::Settings.new
    settings.idp_slo_target_url = Rails.application.config.idp_slo_target_url

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

end
