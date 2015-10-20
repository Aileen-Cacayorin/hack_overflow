class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'You are now logged in'
      redirect_to "/"
    else
      flash[:danger] = "Login unsucessful"
      redirect_to "/"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've been logged out successfully."
    redirect_to "/"
  end

end
