class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, alert: 'User not found.'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Redirect to a login page or somewhere else upon successful registration
      redirect_to login_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
