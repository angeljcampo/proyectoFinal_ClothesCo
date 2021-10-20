class Order < ApplicationRecord
  belongs_to :user
  has_many :payments
  has_many :carts
  has_many :products, through: :carts

  enum status: [:creado, :cancelado, :pagado, :completado]

  def add_product(product_id, quantity)
    product = Product.find(product_id)
    if product && (product.stock > 0)
      carts.create(product_id: product.id, quantity: quantity,
      price: product.price )
    end
  end

  def paid_order?
    status == 2
  end

  def total_order
    total = 0
    self.carts.map do |i|
      total += i.price 
    end
    total
  end


end
