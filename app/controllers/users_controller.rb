class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)

    if @user.save
      redirect_to root_url, flash: {success: "#{@user.screen_name} has been created!"}
    else
      render :action => "new"
    end
  end

  private

  def secure_params
    params.require(:user).permit(:username, :screen_name, :password)
  end
end
