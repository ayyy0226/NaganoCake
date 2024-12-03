# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :customer_state, only: [:create]

  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "新規登録に成功しました"
    customer_path(current_customer.id)
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトに成功しました"
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :address, :postal_code, :telephone_number])
  end

  private

  def customer_state
    customer = Customer.find_by(email: params[:customer][:email])
    return if customer.nil?
    return if user.valid_password?(params[:customer][:password]) && customer.active_for_authentication?
    flash[:alert] = "退会済みです。再度ご登録をしてご利用ください。"
    redirect_to new_customer_registration_path
  end
end
