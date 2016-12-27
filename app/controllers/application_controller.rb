class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  include Pundit
  include UsersHelper
  include AttractionsHelper
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def logged_in_user
    unless is_logged_in?
      flash[:alert] = "Please sign in first."
      redirect_to root_path
    end
  end

  def is_logged_in?
    !!current_user
  end

  def current_user?(user)
    current_user == user
  end

  def current_user
    @current_user ||= User.find_by(id:session[:user_id]) if session.include?(:user_id)
  end

  def home_page_if_logged_in
    if is_logged_in?
      redirect_to user_path(current_user)
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  helper_method :current_user, :is_logged_in?, :home_page_if_logged_in, :log_in, :log_out

  private
  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end


end
