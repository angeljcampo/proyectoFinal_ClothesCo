class AddGenderToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :gender, :boolean
  end
end
