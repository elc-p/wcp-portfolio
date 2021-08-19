class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:destroy]
  
  def index
    @posts = Post.all
    @post = Post.new
    @user = current_user
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:category].split(nil)
    if @post.save
      @post.save_tag(@post, tag_list)
      # tag_list.each do |tag_name|
      #   tag = Tag.find_by(category: tag_name)
      #   Tagging.create(post_id: @post.id, tag_id: tag.id)
      # end
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to request.referer
  end
  
  def search
    @user = current_user
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts
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
