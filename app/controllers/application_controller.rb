class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to login_url, alert: "You need to be signed in before continuing" if current_user.nil?
  end
end
