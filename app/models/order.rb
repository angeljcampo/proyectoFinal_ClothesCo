class Order < ApplicationRecord
  belongs_to :user
  has_many :payments
  has_many :carts
  has_many :products, through: :carts

  enum status: [:creado, :cancelado, :pagado, :completado]
end
