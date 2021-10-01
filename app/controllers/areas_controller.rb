class AreasController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  
  def show
    prefecture = Prefecture.find(params[:id])
    @cities = prefecture.cities
  end
  
  def search
    city = City.find(params[:id])
    @posts = Post.where(cities: city.name)
    @user = current_user
    @post = Post.new
  end
  
end
