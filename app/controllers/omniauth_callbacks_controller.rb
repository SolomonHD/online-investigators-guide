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

  def logout
    if params[:SAMLResponse]
      return process_logout_response
    else
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
