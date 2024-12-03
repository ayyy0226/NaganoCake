class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトに成功しました"
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :address, :postal_code, :telephone_number])
  end
end
