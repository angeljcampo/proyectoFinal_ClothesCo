class Cart < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def update_order
    self.order.update_attribute(:total, self.order.total - self.price) 
  end
  
  
end
