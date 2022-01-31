class LikesController < ApplicationController
  before_action :set_like, :find_comment

  def vote
    if already_voted?
      @like.update(like_params)
    else
      @like = Like.create(like_params)
    end
    render 'like.js.erb'
  end

  private

  def like_params
    params.require(:like).permit(:author_id, :comment_id, :vote_type)
  end

  def find_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:like][:comment_id])
  end

  def set_like
    @like = Like.find_by(author_id: current_user.id, comment_id: params[:like][:comment_id])
  end

  def already_voted?
    Like.where(author_id: current_user.id, comment_id: params[:like][:comment_id]).exists?
  end
end
