class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user.update
    redirect_to user_path(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :user_image)
  end
  
end
