class CommentsController < ApplicationController
  # before_action :set_comment, only: %i[destroy]
 
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  # def destroy
  #   @comment.destroy

  #   respond_to do |format|
  #     format.html { redirect_to @post, notice: 'Post was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :status, :post_id, :author_id)
  end
end
