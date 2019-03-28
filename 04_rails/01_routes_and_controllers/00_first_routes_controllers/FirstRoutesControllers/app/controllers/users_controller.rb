require 'byebug'

class UsersController < ApplicationController
  def index
    users = User.all
    
    if params[:user] && params[:user][:username]
      username = params[:user][:username]
      query = "%#{username}%"
      
      users = users.where('users.username LIKE ?', query)
    end

    render json: users
  end

  def create # => POST 
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end

    
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    users = User.all
    user = users.update(params[:id], user_params)
    if user
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
    
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end