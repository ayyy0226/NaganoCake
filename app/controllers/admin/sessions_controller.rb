# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
 layout 'admin'

  def new
     super
  end


  def after_sign_in_path_for(resource)
    admin_items_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
