class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top], unless: :admin_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトに成功しました"
    root_path
  end
  
  private
  
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_out, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :address, :postal_code, :telephone_number])
  end
end
