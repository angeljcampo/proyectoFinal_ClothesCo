class Product < ApplicationRecord
  belongs_to :category
  has_many :carts
  has_many :orders, through: :carts
  has_many_attached :images
  validates :name, :price, :stock, :description, :gender, presence: true

  enum gender: [:hombre, :mujer, :niño]
  
  ratyrate_rateable "calidad"
end
