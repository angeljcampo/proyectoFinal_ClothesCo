class Order < ApplicationRecord
  belongs_to :user
  has_many :payments
  has_many :carts
  has_many :products, through: :carts

  
  def add_product(product_id, quantity)
    product = Product.find(product_id)
    if product && (product.stock > 0)
      carts.create(product_id: product.id, quantity: quantity, price: product.price )
      total_order
    end
  end


  def total_order
    total = 0
    self.carts.map do |i|
      total += i.price 
    end
    update_attribute(:total => total)
  end
end
