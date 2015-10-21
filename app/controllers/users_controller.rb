class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit, :update]
  before_action :set_default, only: [:show, :edit, :update]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Signup successful! You are now logged in."
      redirect_to root_path
    else
      flash[:danger] = "Signup failed. Please try again."
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile change saved"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Something went wrong"
      redirect_to :back
    end
  end

private

  def set_default
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :avatar)
  end

end
