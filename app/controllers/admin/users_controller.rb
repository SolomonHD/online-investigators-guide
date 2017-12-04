class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def toggle_admin
    @adminCount = User.where(is_admin: true).count
    @user = User.find(params[:user_id])
    if @adminCount == 1 && @user.is_admin
      flash[:notice] = "Site must have at least one admin."
    elsif @user.is_admin
      flash[:notice] = @user.first_name + " " + @user.last_name + " is no longer an admin."
      @user.is_admin = 0
    else
      flash[:notice] = @user.first_name + " " + @user.last_name + " now has administrative priveleges."
      @user.is_admin = 1
    end
      @user.save
    redirect_to admin_users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:is_admin)
    end

end
