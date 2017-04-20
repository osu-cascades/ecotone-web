class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def login_required
    unless logged_in?
      flash[:danger] = "Please sign in."
      redirect_to login_path
    end
  end

  def admin_required
    unless current_user.admin?
      flash[:danger] = "Admin permissions required."
      redirect_back(fallback_location: root_url)
    end
  end

end 
