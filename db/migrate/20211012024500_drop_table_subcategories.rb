class DropTableSubcategories < ActiveRecord::Migration[5.2]
  def change
    drop_table :subcategories
  end
end
