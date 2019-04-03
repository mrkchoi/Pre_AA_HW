class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :authenticate_user

  def login!(user)
    # create a new session w/ the users session_token
    @current_user = user
    session[:session_token] = @current_user.session_token

    # set current user
  end

  def logged_in?
    @current_user && session[:session_token]
  end

  def logout!(user)
    @current_user = user
    session[:session_token] = nil
    @current_user.reset_session_token!
    @current_user = nil
  end


  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def authenticate_user
    if !current_user || !logged_in?
      redirect_to new_session_url
    end
  end

end


