# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def new
    super
  end
  
  def after_sign_up_path_for(resource)
    items_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email])
  end
end
