class SessionsController < ApplicationController
  def new
    # Simply displays the login form
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page
      session[:user_id] = user.id
      redirect_to user_path(user), notice: 'Logged in successfully'
    else
      # Create an error message
      flash.now[:alert] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    # Redirect to root or wherever you wish
    redirect_to root_url, notice: 'Logged out successfully'
  end
end
