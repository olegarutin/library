class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery

  def current_user
    @current_user = Author.find(session[:author_id]) if session[:author_id]
  end

  private

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end

  helper_method :current_user
end
