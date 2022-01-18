class CommentsController < ApplicationController
  before_action :set_post!
  def create
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post!
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :status, :post_id, :author_id)
  end
end
