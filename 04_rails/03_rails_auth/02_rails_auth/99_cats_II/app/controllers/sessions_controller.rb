class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

    if @user.nil?
      render json: 'Invalid credentials. Try again!'
    else
      login!(@user)
      redirect_to cats_url
    end
  end

  def destroy
    if !current_user.nil?
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to cats_url
    end
  end
end