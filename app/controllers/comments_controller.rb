class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comments, only: %i[edit update destroy]
  before_action :check_editable, only: %i[update edit destroy]

  def new
    @comment = @post.comments.new(parent_id: params[:comment][:parent_id])
    render 'reply.js.erb'
  end

  def create
    @comment = @post.comments.create(comment_params)
    render 'comment.js.erb'
  end

  def destroy
    @comment.destroy
    render 'comment.js.erb'
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_url(@post), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render 'edit', status: :unprocessable_entity }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comments
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :status, :post_id, :author_id, :parent_id)
  end

  def check_editable
    return if @comment.nil? || @comment.author_id == current_user.id

    flash[:notice] = 'Access denied as you are not owner of this Comment'
    redirect_to post_path(@post)
  end
end
