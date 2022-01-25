class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize, except: %i[show index]
  before_action :check_editable, only: %i[update edit destroy]
  before_action :set_page_visits, only: %i[show index]

  def index
    @posts = Post.all
  end

  def show
    @comment = @post.comments.build
    @post.increment!(:count_views)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @posts = Post.where('title LIKE ?', "%#{params[:q]}%")
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image, :author_id)
  end

  def check_editable
    return if @post.nil? || @post.author_id == current_user.id

    flash[:notice] = 'Access denied as you are not owner of this Post'
    redirect_to root_path
  end

  def set_page_visits
    cookies[:page_visits] = cookies[:page_visits].present? ? cookies[:page_visits].to_i + 1 : 1
  end
end
