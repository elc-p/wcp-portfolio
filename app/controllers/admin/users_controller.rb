class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(admin_user_params)
    redirect_to admin_users_path
  end
  
  private
  
  def admin_user_params
    params.require(:user).permit(:status)
  end

end
