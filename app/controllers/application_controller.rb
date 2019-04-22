class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private

  def login_required
    return if user_signed_in?
    flash[:danger] = 'Please sign in.'
    redirect_to new_user_session_path
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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
