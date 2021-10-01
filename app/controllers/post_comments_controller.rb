class PostCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    post_comment = PostComment.new(comment_params)
    post_comment.post_id = @post.id
    post_comment.user_id = current_user.id
    post_comment.save
    @post_comment = PostComment.new
    # redirect_to request.referer
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    post_comment = @post.post_comments.find(params[:id])
    post_comment.destroy
    # redirect_to request.referer
  end
  
  
  private
  
  def comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
