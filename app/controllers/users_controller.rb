class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      flash[:success] = "Signup successful!"
      redirect_to root_path
    else
      flash[:danger] = "Signup failed. Please try again."
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

end