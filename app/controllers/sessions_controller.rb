class SessionsController < ApplicationController

  skip_before_filter :require_login, only: [:index, :create]
  def index
    current_user=get_current_user
    if current_user != nil
      redirect_to root_path
    end
  end

def create
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id #if user is authenticated set session id to user id
    redirect_to root_path, :notice => "Logged in!" #redirect to main user page with notice of successful login
  else
    flash[:error] = "Invalid email or password" #if auth. fails, vaguely specify that they failed the login
    redirect_to sessions_path
  end
end

  def destroy
    session[:user_id] = nil #nullify currently set session ID
    redirect_to users_path, :notice => "Logged out!" #redirect with notice
  end
end
