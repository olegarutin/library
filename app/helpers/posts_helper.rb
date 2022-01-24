module PostsHelper
  def show_login_modal?
    current_user.nil? && cookies[:page_visits].to_i > 5
  end
end
