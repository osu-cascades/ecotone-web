class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper

  def login_required
    redirect_to root_path unless logged_in?
  end

end
