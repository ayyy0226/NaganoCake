class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end
