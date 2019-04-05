class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user
  
  def login!(user)
    session[:session_token] = user.session_token
  end

  def logout!(user)
    session[:session_token] = nil
    user.reset_session_token!
    redirect_to new_session_url
  end

  def logged_in?
    session[:session_token] ? true : false
  end

  def current_user
    if logged_in?
      User.find_by(session_token: session[:session_token])
    else
      return nil
    end
  end
end
