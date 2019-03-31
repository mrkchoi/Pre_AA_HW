class UsersController < ApplicationController
  before_action :redirect_already_signed_in_user!

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      msg = Usermailer.welcome_email(@user)
      msg.deliver_now
      
      login!(@user)
      redirect_to cats_url
    else
      render json: 'New user account information invalid!'
    end
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end