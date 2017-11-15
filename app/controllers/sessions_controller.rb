class SessionsController < ApplicationController
  def new
  end
=begin 
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
=end

class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end


end
