class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.string :quantity

      t.timestamps
    end
  end
end
