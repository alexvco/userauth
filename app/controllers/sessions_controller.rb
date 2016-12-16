class SessionsController < ApplicationController
  def new
  end

  def create
   user = User.find_by(email: params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password]) #authenticate is a method that has_secure_password provides us
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in"
    else
      flash.now.alert = "Email or password is invalid"
      render 'new'
    end
  end
end
