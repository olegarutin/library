class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= Author.find(session[:author_id]) if session[:author_id]
  end

  helper_method :current_user
end
