class RemoveQuantityFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :quantity
  end
end
