class UsersController < ApplicationController
  include SessionsHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)
    if @user.save
      sign_in @user
      redirect_to root_url, flash: {success: "Wecome #{current_user.screen_name} !"}
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:user).permit(:username, :screen_name, :password)
  end
end
