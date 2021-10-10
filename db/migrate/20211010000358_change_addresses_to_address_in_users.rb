class ChangeaddressToAddressInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :address, :address
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
