class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login!(@user)
      redirect_to users_url
    else
      flash.now[:errors] = ['Incorrect username and/or password']
      render :new
    end
  end

  def destroy
    user = User.find_by(id: current_user.id)
    logout!(user)
  end
end