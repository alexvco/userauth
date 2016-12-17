class SessionsController < ApplicationController
  def new
  end

  # In the past what we did was store the user.id in the session but the problem is that this is temporary 
  # and we want something more permanent (remember me). So we will use a permanent cookie. 
  # Another problem is we have user.id that we are storing in there and we don’t want 
  # to store that in there because thats easily guessable and changeable by the user. 
  # Instead what we want is a unique token which is unguessable that we can store in a cookie.
  def create
   user = User.find_by(email: params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password]) #authenticate is a method that has_secure_password provides us
      if params[:session][:remember_me]
        cookies.permanent[:auth_token] = user.auth_token 
      else
        cookies[:auth_token] = user.auth_token 
      end
      redirect_to root_url, notice: "Logged in"
    else
      flash.now.alert = "Email or password is invalid"
      render 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, notice: "Logged out"
  end
end
