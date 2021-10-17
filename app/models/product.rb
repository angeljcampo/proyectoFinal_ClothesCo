class Product < ApplicationRecord
  belongs_to :category
  has_many :carts
  has_many :orders, through: :carts
  enum gender: [:hombre, :mujer, :niño]
  
  ratyrate_rateable "calidad"
end
