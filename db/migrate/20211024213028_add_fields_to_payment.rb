class AddFieldsToPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :status, :string
    add_column :payments, :total, :float
    add_column :payments, :token, :string
  end
end
