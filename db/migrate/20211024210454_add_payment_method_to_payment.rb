class AddPaymentMethodToPayment < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :method
    add_reference :payments, :payment_method, foreign_key: true
  end
end
