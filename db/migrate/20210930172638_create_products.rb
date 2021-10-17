class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :description
      t.integer :price
      t.integer :stock

      t.timestamps
    end
  end
end
