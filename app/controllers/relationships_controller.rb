class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @user = current_user
    @another_user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    # redirect_to request.referer
  end

  def destroy
    @user = current_user
    @another_user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
    # redirect_to request.referer
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
    @post = Post.new
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
    @post = Post.new
  end

end
