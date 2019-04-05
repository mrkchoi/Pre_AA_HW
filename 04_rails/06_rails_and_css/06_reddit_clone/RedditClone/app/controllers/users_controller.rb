class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end