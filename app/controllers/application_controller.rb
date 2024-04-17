class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?

  private

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Returns true if the user is logged in, false otherwise.
  def user_signed_in?
    !!current_user
  end

  def authenticate_user!
    redirect_to login_path unless user_signed_in?
  end
end
