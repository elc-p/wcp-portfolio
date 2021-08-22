class AreasController < ApplicationController
  
  def index
  end
  
  def show
    prefecture = Prefecture.find(params[:id])
    @cities = prefecture.cities
  end
  
  def search
    city = City.find(params[:id])
    @posts = Post.where(cities: city.name)
  end
  
end
