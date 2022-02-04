class CommentStatusesController < ApplicationController
  before_action :set_comments, only: %i[update]
  before_action :set_post

  def update
    @comment.published!
    render 'comments/comment.js.erb'
  end

  def status
    @status = params[:status]
    @selected_comments = @post.comments.where(status: @status)
    render 'comments/comment.js.erb'
  end

  private

  def set_comments
    @comment = Comment.find(params[:format])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
