class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  
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

  def withdrawal
    user = User.find(params[:user_id])
    unless user.email == "guest@example.com"
      user.update(status: true)
      reset_session
    end

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :user_image)
  end
  
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
