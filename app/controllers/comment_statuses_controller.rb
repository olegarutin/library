class CommentStatusesController < ApplicationController
  before_action :set_comments, only: %i[update]

  def update
    @comment.published!
    redirect_to post_path(@post)
  end

  private

  def set_comments
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:format])
  end
end
