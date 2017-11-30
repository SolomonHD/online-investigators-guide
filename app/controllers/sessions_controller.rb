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
        redirect_to user_surveys_path(@user), notice: "Logged in!"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
