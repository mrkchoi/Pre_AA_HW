class UsersController < ApplicationController
  # before_action :authenticate_user

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      redirect_to bands_url
    else
      render json: @user.errors.full_messages
    end
  end

  def show
    @user = current_user
    render :show
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
  
end