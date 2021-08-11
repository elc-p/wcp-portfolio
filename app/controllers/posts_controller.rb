class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params:id)
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.tag_id = 1
    @post.save
    redirect_to 
  end
  
  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:post_image, :prefecture, :cities, :body)
  end
  
end
