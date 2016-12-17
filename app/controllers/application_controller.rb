class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  def authenticate_user!
    redirect_to login_url, alert: "You need to be signed in before continuing" if current_user.nil?
  end
end
