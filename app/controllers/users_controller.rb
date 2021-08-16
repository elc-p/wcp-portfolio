class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
  end
  
  def index
    @user = current_user
    @users = User.all
    @post = Post.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :user_image)
  end
  
end
