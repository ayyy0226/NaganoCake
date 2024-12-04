class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!, except: [:top]
  
  def index
    @orders = Order.all
    
end
