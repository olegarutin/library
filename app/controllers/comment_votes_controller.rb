class CommentVotesController < ApplicationController
  def create
    @vote = CommentVote.new(vote_params)

    if @post.save
      respond_to do |format|
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
        format.js { render :show, status: :created, location: @post }
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:author_id, :comment_id, :vote_type)
  end
end
