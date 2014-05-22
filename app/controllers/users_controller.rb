class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)
    p @user.save

    if @user.save
      flash[:username] = "#{@user.username} has been created!"
      redirect_to root_url
    else
      render :action => "new"
    end
  end

  private

  def secure_params
    params.require(:user).permit(:username, :password)
  end
end
