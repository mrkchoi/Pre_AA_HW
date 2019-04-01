module ApplicationHelper
  def auth_token
    "<input type=\"hidden\" name=\"authenticity_token\" value=\"#{form_authenticity_token}\">".html_safe
  end

  def patch_input
    "<input type=\"hidden\" name=\"_method\" value=\"PATCH\">".html_safe
  end

  # def logged_in?
  #   current_user && logged_in?
  # end

  # def authenticate_user
    
  # end
end
