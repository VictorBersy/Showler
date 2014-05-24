class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_url, flash: {success: "Wecome #{current_user.screen_name} !"}
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    if signed_in?
      sign_out
      redirect_to root_url, flash: {info: "You have been logged out."}
    end
  end
end
