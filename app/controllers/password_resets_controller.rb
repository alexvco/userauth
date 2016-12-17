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
    @user = User.find_by!(password_reset_token: params[:reset])
  end

  def update
    @user = User.find_by!(password_reset_token: params[:reset])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: "Password reset has expired"
    elsif @user.update_attributes(user_params)
      redirect_to root_url, notice: "Password has been reset"
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :auth_token)
    end

end
