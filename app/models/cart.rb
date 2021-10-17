class Cart < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def self.total
    total = 0
    self.carts.map do |i|
      total += i.price 
    end
    self.total = total
  end
  
end
