class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:destroy]
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
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
    post = Post.find(params[:id])
    post.destroy
    redirect_to request.referer
  end
  
  private
  
  def post_params
    params.require(:post).permit(:post_image, :prefecture, :cities, :body)
  end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
  
end
