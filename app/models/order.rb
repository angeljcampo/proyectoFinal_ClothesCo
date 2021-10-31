class Order < ApplicationRecord
  belongs_to :user
  has_many :payments
  has_many :carts
  has_many :products, through: :carts

  
  def add_product(product_id, quantity)
    product = Product.find(product_id)
    cart = self.carts.find_by_product_id(product.id)
    if product && (product.stock > 0)
      if cart.nil?
        carts.create(product_id: product.id, quantity: quantity, price: product.price )
      else
        cart.update_attribute(:quantity, cart.quantity + 1)
      end
      total_order
    end
  end


  def total_order
    total = 0
    self.carts.map do |i|
      total += i.price * i.quantity
    end
    update_attribute(:total, total)
  end
end
