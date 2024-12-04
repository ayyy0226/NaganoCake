class CartItem < ApplicationRecord
  
  has_many :customers, dependent: :destroy
  has_many :items, dependent: :destroy
end
