class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:password_reset][:email])
    user.send_password_reset if user
    flash[:info] = "Email sent with password reset instructions"
    redirect_to root_url
  end

  def edit
  end
end
