class AccountActivationsController < ApplicationController

  def edit
    @user = User.find_by(email: params[:email])
    if @user && !@user.is_activated? && params[:activation_token] == @user.activation_token
      @user.is_activated = true
      @user.activated_at = Time.now
      @user.save
      cookies[:auth_token] = @user.auth_token
      flash[:success] = "Account Activated"
      redirect_to @user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
