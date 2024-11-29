# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
   before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_account_update_params, only: [:update]
  def new
    super
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = "新規登録に成功しました"
    customers_my_page_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトに成功しました"
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email])
  end
end
