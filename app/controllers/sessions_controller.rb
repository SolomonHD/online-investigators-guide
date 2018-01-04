class SessionsController < ApplicationController

  before_action :maintenance_mode
  
  def new
  end

  def create
    @user = User.find_by(net_id: params[:session][:net_id])
    if @user
      session[:user_id] = @user.id
      if @user.is_admin
        redirect_to '/admin', notice: "Logged in!"
      else
        @view = Survey.where(user_id: @user.id, is_default: true).first
        flash[:notice] = "You’re logged in"
        if @view
          redirect_to root_path(:user => @user.id, :view => @view.id)
        else
          redirect_to user_surveys_path(@user), notice: "You’re logged in"
        end
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
