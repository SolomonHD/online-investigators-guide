class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(net_id: params[:session][:net_id])
    if user
      session[:user_id] = user.id
      redirect_to user_surveys_path(user), notice: "Logged in!"
    else
      # TODO : Add user to table, since they have already been authenticated via Shibboleth
      flash.now.notice = "Net ID is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end