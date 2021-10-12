class RemoveTableCategorySubcategories < ActiveRecord::Migration[5.2]
  def change
    drop_table :category_subcategories
  end
end
