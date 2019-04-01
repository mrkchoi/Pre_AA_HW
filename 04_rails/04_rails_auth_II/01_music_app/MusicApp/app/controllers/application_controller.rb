class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def log_in_user!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    session[:session_token].nil? ? false : true
  end

  def current_user
    return nil if self.session[:session_token].nil?
    @current_user ||= User.find_by(session_token: self.session[:session_token])
  end

  def log_out_user!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

end
