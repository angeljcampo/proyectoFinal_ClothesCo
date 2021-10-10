class Product < ApplicationRecord
  belongs_to :subcategory
  has_many :carts
  has_many :orders, through: :carts

  
end
