class ApplicationController < ActionController::Base
  helper_method :current_user, :match_user_with_cat

  def login!(user)
    @current_user = user
    session[:session_token] = @current_user.session_token
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def redirect_already_signed_in_user!
    redirect_to cats_url if !current_user.nil?
  end

  def match_user_with_cat(current_user, req)
    matching_cat = current_user.cats.find_by(id: req[:cat_id])

    redirect_to cats_url if matching_cat.nil?
  end
end
