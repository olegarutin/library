class AuthorsController < ApplicationController
  before_action :set_author, :check_editable, only: %i[update edit]

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      session[:author_id] = @author.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to author_path, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render 'edit', status: :unprocessable_entity }
      end
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:email, :first_name, :birthday, :gender, :last_name, :password, :password_confirmation, :profile_image)
  end

  def check_editable
    return if @author.nil? || @author.id == current_user.id

    flash[:notice] = 'Access denied because you are not the author'
    redirect_to root_path
  end
end
