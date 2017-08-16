class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login_required
    return if logged_in?
    flash[:danger] = 'Please sign in.'
    redirect_to login_path
  end

  def admin_required
    return if current_user.admin?
    flash[:danger] = 'Admin permissions required.'
    redirect_back(fallback_location: root_url)
  end

  def build_qr_code_image(qr_object, size)
    qr_object.as_png(resize_gte_to: false,
                     resize_exactly_to: false,
                     fill: 'white',
                     color: 'black',
                     size: size,
                     border_modules: 4,
                     module_px_size: 6,
                     file: nil)
  end
end
