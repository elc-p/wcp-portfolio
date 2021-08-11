class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
  end
  
  def index
    @users = User.all
  end
  
end
